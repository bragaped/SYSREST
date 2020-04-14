SET TERM !!;
/*********************************** EXCEPTION *************************************/
CREATE EXCEPTION PRODUTO_N_CADASTRADO 'Produto não Cadastrado.'
CREATE EXCEPTION PRODUTO_JA_CADASTRADO 'Produto já Cadastrado.'
CREATE EXCEPTION MOVIMENTACAO_CAIXA 'VALOR INSUFICIENTE.'
CREATE EXCEPTION PEDIDO_MESA 'Mesa já POSSUI Pedido ABERTO.'
!!


/*************************************  COMPRA *************************************/
/*************** DELETE ***************/
CREATE TRIGGER T_DEL_PRODUTO FOR PRODUTO
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
 delete from composicao
   where
    composicao.pro_cod = OLD.pro_cod;
END
!!

/*************************************  COMPRA *************************************/

/*************** INDEX ***************/
/*  create index COMPRAS
 on CONTAS_PAGAR (CONT_PARC,FOR_COD,CONT_NRODOC) */

/*************** UPDATE ***************/
CREATE TRIGGER T_UPDATE_COMPRAS FOR COMPRAS
ACTIVE AFTER UPDATE POSITION 0
AS
declare variable prod int;
declare variable qtda float;
declare variable tipo_ant char(01);
declare variable tipo_novo char(01);
begin
  if (new.fisc_cod <> old.fisc_cod) then
  begin
     select codigo_fiscal.fisc_tipo from codigo_fiscal
        where codigo_fiscal.fisc_cod = old.fisc_cod
        into :tipo_ant;
     select codigo_fiscal.fisc_tipo from codigo_fiscal
        where codigo_fiscal.fisc_cod = new.fisc_cod
        into :tipo_novo;
     for select item_compra.pro_cod, item_compra.itcom_qtd from item_compra
            where item_compra.com_nrodoc = new.com_nrodoc
            and item_compra.for_cod = new.for_cod
            into :prod, :qtda
            do begin
                 if (:tipo_ant = 'E') then
                    update produto set produto.pro_qtd = produto.pro_qtd - :qtda
                       where :prod = produto.pro_cod;
              /*   if (:tipo_ant = 'S') then
                    update produto set produto.pro_qtd = produto.pro_qtd + :qtda
                       where :prod = produto.pro_cod; */
                 if (:tipo_novo = 'E') then
                    update produto set produto.pro_qtd = produto.pro_qtd + :qtda
                       where :prod = produto.pro_cod;
              /*   if (:tipo_novo = 'S') then
                    update produto set produto.pro_qtd = produto.pro_qtd - :qtda
                       where :prod = produto.pro_cod ;  */
            end
  end
end
!!

/*************** DELETE ***************/
CREATE TRIGGER T_DEL_COMPRAS FOR COMPRAS
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
    delete from Item_Compra
      where
        Item_Compra.Com_NroDoc = OLD.Com_NroDoc and
        Item_Compra.For_Cod = OLD.For_Cod;
   delete from contas_pagar
      where
       contas_pagar.cont_nrodoc = old.com_nrodoc and
       contas_pagar.for_cod = old.for_cod;
END
!!

/*************************************  ITEM_COMPRA *************************************/

/*************** INDEX ***************/
/*  drop index XPKITEM_COMPRA

  create unique index XPKITEM_COMPRA
  on ITEM_COMPRA (PRO_COD,FOR_COD,COM_NRODOC) */

/*************** INCLUSAO ***************/
create TRIGGER T_INCLUSAO_ITEM_COMPRA FOR ITEM_COMPRA
ACTIVE BEFORE INSERT POSITION 0
AS
declare variable CodFisc char;
begin
 select codigo_fiscal.fisc_tipo from codigo_fiscal, compras
  where (compras.com_nrodoc     = new.com_nrodoc
  and   compras.for_cod        = new.for_cod)
  and   codigo_fiscal.fisc_cod = compras.fisc_cod
  into CodFisc;
 if (CodFisc = 'E') then
    begin
      update produto set produto.pro_qtd = produto.pro_qtd + new.itcom_qtd
        where produto.pro_cod = new.pro_cod;
    end
end
!!

ALTER TRIGGER TI_ITEM_COMPRA
ACTIVE AFTER INSERT POSITION 0
AS
  /* INSERT trigger on Item_Compra */
DECLARE VARIABLE numrows INTEGER;
BEGIN
    /* Produto R/14 Item_Compra ON CHILD INSERT RESTRICT */
    select count(*)
      from Produto
      where
        /* %JoinFKPK(NEW,Produto,' = ',' and') */
        NEW.Pro_Cod = Produto.Pro_Cod into numrows;
    IF (
      /* %NotnullFK(NEW,' is not null and') */
      
      numrows = 0
    ) THEN
    BEGIN
      EXCEPTION produto_n_cadastrado;
    END

    /* Compras R/13 Item_Compra ON CHILD INSERT RESTRICT */
    select count(*)
      from Compras
      where
        /* %JoinFKPK(NEW,Compras,' = ',' and') */
        NEW.Com_NroDoc = Compras.Com_NroDoc and
        NEW.For_Cod = Compras.For_Cod into numrows;
    IF (
      /* %NotnullFK(NEW,' is not null and') */
      
      numrows = 0
    ) THEN
    BEGIN
      EXCEPTION produto_ja_cadastrado;
    END


END
!!

/*************** UPDATE ***************/
CREATE TRIGGER T_UPDATE_ITEM_COMPRA FOR ITEM_COMPRA
ACTIVE BEFORE UPDATE POSITION 0
AS
declare variable CodFisc char;
begin
 select codigo_fiscal.fisc_tipo from codigo_fiscal, compras
  where (compras.com_nrodoc     = new.com_nrodoc
  and   compras.for_cod        = new.for_cod)
  and   codigo_fiscal.fisc_cod = compras.fisc_cod
  into CodFisc;
 if (old.pro_cod = new.pro_cod) then
    if (CodFisc = 'E') then
       IF (new.itcom_qtd <> old.itcom_qtd)then
         begin
           update produto set produto.pro_qtd = produto.pro_qtd - old.itcom_qtd + new.itcom_qtd
              where produto.pro_cod = new.pro_cod;
         end
 else
    if (CodFisc = 'E') then
       begin
         update produto set produto.pro_qtd = produto.pro_qtd - old.itcom_qtd
           where produto.pro_cod = old.pro_cod;
         update produto set produto.pro_qtd = produto.pro_qtd + new.itcom_qtd
           where produto.pro_cod = new.pro_cod;
       end
end
!!

ALTER TRIGGER TU_ITEM_COMPRA
ACTIVE AFTER UPDATE POSITION 0
AS
  /* UPDATE trigger on Item_Compra */
DECLARE VARIABLE numrows INTEGER;
BEGIN
  /* Produto R/14 Item_Compra ON CHILD UPDATE RESTRICT */
  select count(*)
    from Produto
    where
      /* %JoinFKPK(NEW,Produto,' = ',' and') */
      NEW.Pro_Cod = Produto.Pro_Cod into numrows;
  IF (
    /* %NotnullFK(NEW,' is not null and') */
    
    numrows = 0
  ) THEN
  BEGIN
    EXCEPTION PRODUTO_N_CADASTRADO;
  END

  /* Compras R/13 Item_Compra ON CHILD UPDATE RESTRICT */
  select count(*)
    from Compras
    where
      /* %JoinFKPK(NEW,Compras,' = ',' and') */
      NEW.Com_NroDoc = Compras.Com_NroDoc and
      NEW.For_Cod = Compras.For_Cod into numrows;
  IF (
    /* %NotnullFK(NEW,' is not null and') */
    
    numrows = 0
  ) THEN
  BEGIN
    EXCEPTION PRODUTO_JA_CADASTRADO;
  END


END
!!

/*************** EXCLUSAO Trigger ***************/
DROP TRIGGER TD_COMPRAS;
!!

/*************** EXCLUSAO ***************/
CREATE TRIGGER T_EXCLUSAO_ITEM_COMPRA for item_compra
active before delete position 0
AS
declare variable CodFisc char;
begin
 select codigo_fiscal.fisc_tipo from codigo_fiscal, compras
  where (compras.com_nrodoc     = old.com_nrodoc
  and   compras.for_cod        = old.for_cod)
  and   codigo_fiscal.fisc_cod = compras.fisc_cod
  into CodFisc;
  if (CodFisc = 'E') then
     begin
       update produto set produto.pro_qtd = produto.pro_qtd - old.itcom_qtd
          where produto.pro_cod = old.pro_cod;
     end
end
!!

/*************************************  CAIXA *************************************/
CREATE GENERATOR GEN_AUTO_INC_CAIXA;
!!
SET GENERATOR GEN_AUTO_INC_CAIXA TO 0;
!!
/*************** INCLUSAO ***************/
CREATE TRIGGER T_CAIXA_NUM_AUTO FOR CAIXA
ACTIVE AFTER INSERT POSITION 0
AS
Begin
  IF (new.cai_num is null) THEN
    new.cai_num = gen_id(gen_auto_inc_caixa,1);
  update caixa set caixa.cai_valdin = 0
   where caixa.cai_num = new.cai_num;
  update caixa set caixa.cai_valche = 0
   where caixa.cai_num = new.cai_num;
  update caixa set caixa.cai_valcart = 0
     where caixa.cai_num = new.cai_num;
  update caixa set caixa.cai_valfecdin = 0
     where caixa.cai_num = new.cai_num;
  update caixa set caixa.cai_valfecche = 0
     where caixa.cai_num = new.cai_num;
  update caixa set caixa.cai_valfeccart = 0
     where caixa.cai_num = new.cai_num;
end
!!

/*************************************  CAIXA *************************************/
CREATE GENERATOR GEN_AUTO_INC_MOVCAIXA
!!
SET GENERATOR GGEN_AUTO_INC_MOVCAIXA TO 0;
!!
/*************** INCLUSAO ***************/
CREATE TRIGGER T_MOVIMENTACAO_CAIXA_COD_AUTO FOR MOVIMENTACAO_CAIXA
ACTIVE BEFORE INSERT POSITION 0
AS
declare variable Num Integer;
declare variable Dim float;
declare variable Che float;
declare variable Car float;
begin
 if (new.mov_cod is null) then
    new.mov_cod = gen_id(gen_auto_inc_movcaixa,1);
 select caixa.cai_num, caixa.cai_valdin, caixa.cai_valche, caixa.cai_valcart
    from caixa where caixa.cai_datafch is null
 into Num,Dim,Che,Car;
 if (Num <> 0) then
  new.cai_num = Num;

 /* "E" quando for ENTRADA */
 if (new.mov_tip = 'E') then
  begin
   /* "DIN" quando for DINHEIRO*/
   if (new.mov_tip_val = 'DIN') then
    update caixa set caixa.cai_valdin = caixa.cai_valdin + new.mov_val
           where caixa.cai_num = new.cai_num;
   /* "CHE" quando for CHEQUE*/
   if (new.mov_tip_val = 'CHE') then
    update caixa set caixa.cai_valche = caixa.cai_valche + new.mov_val
           where caixa.cai_num = new.cai_num;
   /* "CAR" quando for CARTAO*/
   if (new.mov_tip_val = 'CAR') then
    update caixa set caixa.cai_valcart = caixa.cai_valcart + new.mov_val
           where caixa.cai_num = new.cai_num;
  end

 else
  begin
    /* "S" quando for SAIDA*/
    if (new.mov_tip = 'S') then
     begin
      /* "DIN" quando for DINHEIRO */
      if (new.mov_tip_val = 'DIN') then
       if (new.mov_val <= Dim) then
        begin
         update caixa set caixa.cai_valdin = caixa.cai_valdin - new.mov_val
                where caixa.cai_num = new.cai_num;
        end
       else
        begin
         exception movimentacao_caixa;
        end
      /* "CHE" quando for CHEQUE */
      if (new.mov_tip_val = 'CHE') then
       if (new.mov_val <= Che) then
        begin
         update caixa set caixa.cai_valche = caixa.cai_valche - new.mov_val
                where caixa.cai_num = new.cai_num;
        end
       else
        begin
         exception movimentacao_caixa;
        end
      /* "CAR" quando for CARTAO */
      if (new.mov_tip_val = 'CAR') then
       if (new.mov_val <= Car) then
        begin
         update caixa set caixa.cai_valcart = caixa.cai_valcart - new.mov_val;
        end
       else
        begin
         exception movimentacao_caixa;
        end
     end
    else
      begin
        /* "T" quando for TROCO*/
        if (new.mov_tip = 'T') then
         begin
           /* "DIN" quando for DINHEIRO */
           if (new.mov_tip_val = 'DIN') then
            if (new.mov_val <= Dim) then
             begin
               update caixa set caixa.cai_valdin = caixa.cai_valdin - new.mov_val
                      where caixa.cai_num = new.cai_num;
              end
             else
              begin
               exception movimentacao_caixa;
              end
         end
      end
  end
end
!!

/********************************** DEP_CHEQUE ************************************/
CREATE GENERATOR GEN_AUTO_INC_DEP_CHE;
!!
SET GENERATOR GEN_AUTO_INC_DEP_CHE TO 1;
!!
CREATE TRIGGER T_DEP_CHEQUE_NUM_AUTO FOR DEP_CHEQUE
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  IF (new.dep_num IS NULL) THEN
    new.dep_num = GEN_ID(GEN_AUTO_INC_DEP_CHE,1);
end
!!

/********************************** CHEQUE ************************************/

DROP TRIGGER TD_CHEQUE
!!

CREATE TRIGGER T_DEL_CHEQUE FOR CHEQUE
ACTIVE BEFORE DELETE POSITION 0
AS
  /* DELETE trigger on Cheque */
BEGIN
    delete from Dep_Cheque
      where
        Dep_Cheque.Che_Agen = OLD.Che_Agen and
        Dep_Cheque.Cli_Cod = OLD.Cli_Cod and
        Dep_Cheque.Che_Banco = OLD.Che_Banco and
        Dep_Cheque.Che_Num = OLD.Che_Num and
        Dep_Cheque.Che_Conta = OLD.Che_Conta;
END
!!

/********************************** INSERT ************************************/

ALTER TRIGGER TI_CHEQUE
ACTIVE AFTER INSERT POSITION 0
AS
  /* INSERT trigger on Cheque */
DECLARE VARIABLE numrows INTEGER;
BEGIN
    select count(*)
      from Cliente
      where
        /* %JoinFKPK(NEW,Cliente,' = ',' and') */
        NEW.Cli_Cod = Cliente.Cli_Cod into numrows;
    IF (
      /* %NotnullFK(NEW,' is not null and') */
      
      numrows = 0
    ) THEN
    BEGIN
      EXCEPTION ERWIN_CHILD_INSERT_RESTRICT;
    END
END
!!

/********************************** UPDATE ************************************/
ALTER TRIGGER TU_CHEQUE
ACTIVE AFTER UPDATE POSITION 0
AS
  /* UPDATE trigger on Cheque */
DECLARE VARIABLE numrows INTEGER;
BEGIN
  /* Cheque R/2 Dep_Cheque ON PARENT UPDATE RESTRICT */
  IF
    /* %JoinPKPK(OLD,NEW,' <> ',' or ') */
    (OLD.Che_Agen <> NEW.Che_Agen or 
     OLD.Cli_Cod <> NEW.Cli_Cod or 
     OLD.Che_Banco <> NEW.Che_Banco or 
     OLD.Che_Num <> NEW.Che_Num or 
     OLD.Che_Conta <> NEW.Che_Conta) THEN
  BEGIN
    select count(*)
      from Dep_Cheque
      where
        /*  %JoinFKPK(Dep_Cheque,OLD,' = ',' and') */
        Dep_Cheque.Che_Agen = OLD.Che_Agen and
        Dep_Cheque.Cli_Cod = OLD.Cli_Cod and
        Dep_Cheque.Che_Banco = OLD.Che_Banco and
        Dep_Cheque.Che_Num = OLD.Che_Num and
        Dep_Cheque.Che_Conta = OLD.Che_Conta into numrows;
    IF (numrows > 0) THEN
    BEGIN
      EXCEPTION ERWIN_PARENT_UPDATE_RESTRICT;
    END
  END

  /* Cliente R/1 Cheque ON CHILD UPDATE RESTRICT */
  select count(*)
    from Cliente
    where
      /* %JoinFKPK(NEW,Cliente,' = ',' and') */
      NEW.Cli_Cod = Cliente.Cli_Cod into numrows;
  IF (
    /* %NotnullFK(NEW,' is not null and') */
    
    numrows = 0
  ) THEN
  BEGIN
    EXCEPTION ERWIN_CHILD_UPDATE_RESTRICT;
  END


  /* ERwin Builtin Mon Sep 17 21:08:04 2007 */
END
!!

/******************************* JUNTA_MESA *********************************/
/********************************** INSERT ************************************/
ALTER TRIGGER TI_JUNTA_MESA
ACTIVE AFTER INSERT POSITION 0
AS
  /* INSERT trigger on Junta_Mesa */
DECLARE VARIABLE numrows INTEGER;
BEGIN
    /* Mesa R/1 Junta_Mesa ON CHILD INSERT RESTRICT */
    select count(*)
      from Mesa
      where
        /* %JoinFKPK(NEW,Mesa,' = ',' and') */
        NEW.Mesa_Cod = Mesa.Mesa_Cod into numrows;
    IF (
      /* %NotnullFK(NEW,' is not null and') */
      
      numrows = 0
    ) THEN
    BEGIN
      EXCEPTION ERWIN_CHILD_INSERT_RESTRICT;
    END

 begin
  update mesa set mesa.mesa_sit = 'O'
   where mesa.mesa_cod = new.mesa_fil;
 end
END
!!
/********************************** DELETE ************************************/
CREATE TRIGGER T_EXCLUSAO_JUNTA_MESA FOR JUNTA_MESA
ACTIVE BEFORE DELETE POSITION 0
AS
begin
 update mesa set mesa.mesa_sit = 'D'
  where mesa.mesa_cod = old.mesa_fil;
end
!!

/********************************** Pedido ************************************/
CREATE GENERATOR GEN_PEDIDO;
!!
SET GENERATOR GEN_PEDIDO TO 0;
!!

CREATE TRIGGER T_PEDIDO_AUTO FOR PEDIDO
ACTIVE BEFORE INSERT POSITION 0
AS
declare variable numcaixa integer;
begin
  --Adicionar o Nº do Pedido
  IF (new.ped_cod IS NULL) THEN
    new.ped_cod = GEN_ID(gen_pedido,1);

  --Selecionar o Caixa
  select caixa.cai_num
    from caixa
   where caixa.cai_datafch is null
    into :numcaixa;
  if (:numcaixa > 0) then
   begin
    new.cai_num = :numcaixa;
   end

  --Zerar valores do pedido
  new.ped_valtotal = 0;
  new.pgt_din = 0;
  new.pgt_cart = 0;
  new.pgt_che = 0;

  --Situação
  new.ped_sit = 'A';

end
!!

/********************************** UPDATE ************************************/
CREATE TRIGGER TU_PEDIDO FOR PEDIDO
ACTIVE AFTER UPDATE POSITION 0
AS
DECLARE VARIABLE numrows INTEGER;
DECLARE VARIABLE codmesa INTEGER;
BEGIN
  /* Pedido R/4 Cheque ON PARENT UPDATE RESTRICT */
  IF
    /* %JoinPKPK(OLD,NEW,' <> ',' or ') */
    (OLD.Ped_Cod <> NEW.Ped_Cod) THEN
  BEGIN
    select count(*)
      from Cheque
      where
        /*  %JoinFKPK(Cheque,OLD,' = ',' and') */
        Cheque.Ped_Cod = OLD.Ped_Cod into numrows;
    IF (numrows > 0) THEN
    BEGIN
      EXCEPTION ERWIN_PARENT_UPDATE_RESTRICT;
    END
  END

  /* Pedido R/3 Item_Pedido ON PARENT UPDATE RESTRICT */
  IF
    /* %JoinPKPK(OLD,NEW,' <> ',' or ') */
    (OLD.Ped_Cod <> NEW.Ped_Cod) THEN
  BEGIN
    select count(*)
      from Item_Pedido
      where
        /*  %JoinFKPK(Item_Pedido,OLD,' = ',' and') */
        Item_Pedido.Ped_Cod = OLD.Ped_Cod into numrows;
    IF (numrows > 0) THEN
    BEGIN
      EXCEPTION ERWIN_PARENT_UPDATE_RESTRICT;
    END
  END

  /* Mesa R/23 Pedido ON CHILD UPDATE RESTRICT */
  select count(*)
    from Mesa
    where
      /* %JoinFKPK(NEW,Mesa,' = ',' and') */
      NEW.Mesa_Cod = Mesa.Mesa_Cod into numrows;
  IF (
    /* %NotnullFK(NEW,' is not null and') */
    
    numrows = 0
  ) THEN
  BEGIN
    EXCEPTION ERWIN_CHILD_UPDATE_RESTRICT;
  END

  /* Caixa R/20 Pedido ON CHILD UPDATE RESTRICT */
  select count(*)
    from Caixa
    where
      /* %JoinFKPK(NEW,Caixa,' = ',' and') */
      NEW.Cai_Num = Caixa.Cai_Num into numrows;
  IF (
    /* %NotnullFK(NEW,' is not null and') */
    
    numrows = 0
  ) THEN
  BEGIN
    EXCEPTION ERWIN_CHILD_UPDATE_RESTRICT;
  END

  /* Funcionario R/5 Pedido ON CHILD UPDATE RESTRICT */
  select count(*)
    from Funcionario
    where
      /* %JoinFKPK(NEW,Funcionario,' = ',' and') */
      NEW.Fun_Cod = Funcionario.Fun_Cod into numrows;
  IF (
    /* %NotnullFK(NEW,' is not null and') */
    
    numrows = 0
  ) THEN
  BEGIN
    EXCEPTION ERWIN_CHILD_UPDATE_RESTRICT;
  END

 if (new.mesa_cod <> old.mesa_cod) then
  begin
   update mesa set mesa.mesa_sit = 'D'
      where mesa.mesa_cod = old.mesa_cod;
   update mesa set mesa.mesa_sit = 'A'
      where mesa.mesa_cod = new.mesa_cod;
   --Atualizar as mesas agrupadas
   for select junta_mesa.mesa_fil
        from junta_mesa
        where junta_mesa.mesa_cod = old.mesa_cod
        into :codmesa
   do
    begin
     update junta_mesa set junta_mesa.mesa_cod = new.mesa_cod
      where junta_mesa.mesa_cod = old.mesa_cod;
    end
    --fim
  end
END
!!

/********************************** Item Pedido ************************************/
CREATE TRIGGER T_ITEM_PEDIDO FOR ITEM_PEDIDO
ACTIVE BEFORE UPDATE POSITION 0
AS
declare variable valoritem double precision;
begin
 --Atualizar Valor do Item
 select produto.pro_pre
  from produto
   where produto.pro_cod = new.pro_cod into :valoritem;
 new.itped_val = (new.itped_qtdtotal * :valoritem);
end
!!

ALTER TRIGGER TU_ITEM_PEDIDO
ACTIVE AFTER UPDATE POSITION 0
AS
DECLARE VARIABLE numrows INTEGER;
BEGIN
  /* Pedido R/3 Item_Pedido ON CHILD UPDATE RESTRICT */
  select count(*)
    from Pedido
    where
      /* %JoinFKPK(NEW,Pedido,' = ',' and') */
      NEW.Ped_Cod = Pedido.Ped_Cod into numrows;
  IF (
    /* %NotnullFK(NEW,' is not null and') */
    
    numrows = 0
  ) THEN
  BEGIN
    EXCEPTION ERWIN_CHILD_UPDATE_RESTRICT;
  END

  /* Produto R/16 Item_Pedido ON CHILD UPDATE RESTRICT */
  select count(*)
    from Produto
    where
      /* %JoinFKPK(NEW,Produto,' = ',' and') */
      NEW.Pro_Cod = Produto.Pro_Cod into numrows;
  IF (
    /* %NotnullFK(NEW,' is not null and') */
    
    numrows = 0
  ) THEN
  BEGIN
    EXCEPTION ERWIN_CHILD_UPDATE_RESTRICT;
  END

END
!!

ALTER TRIGGER TI_ITEM_PEDIDO
ACTIVE AFTER INSERT POSITION 0
AS
DECLARE VARIABLE numrows INTEGER;
BEGIN

    /* Pedido R/3 Item_Pedido ON CHILD INSERT RESTRICT */
    select count(*)
      from Pedido
      where
        /* %JoinFKPK(NEW,Pedido,' = ',' and') */
        NEW.Ped_Cod = Pedido.Ped_Cod into numrows;
    IF (
      /* %NotnullFK(NEW,' is not null and') */
      
      numrows = 0
    ) THEN
    BEGIN
      EXCEPTION ERWIN_CHILD_INSERT_RESTRICT;
    END

    /* Produto R/16 Item_Pedido ON CHILD INSERT RESTRICT */
    select count(*)
      from Produto
      where
        /* %JoinFKPK(NEW,Produto,' = ',' and') */
        NEW.Pro_Cod = Produto.Pro_Cod into numrows;
    IF (
      /* %NotnullFK(NEW,' is not null and') */
      
      numrows = 0
    ) THEN
    BEGIN
      EXCEPTION ERWIN_CHILD_INSERT_RESTRICT;
    END

  if (new.itped_qtdtotal is null) then
   update item_pedido set item_pedido.itped_qtdtotal = 0
     where item_pedido.ped_cod = new.ped_cod and item_pedido.pro_cod = new.pro_cod;
  if (new.itped_qtd is null) then
   update item_pedido set item_pedido.itped_qtd = 0
     where item_pedido.ped_cod = new.ped_cod and item_pedido.pro_cod = new.pro_cod;
  if (new.itped_val is null) then
   update item_pedido set item_pedido.itped_val = 0
    where item_pedido.ped_cod = new.ped_cod and item_pedido.pro_cod = new.pro_cod;
END
!!

/********************************** PROCEDURE ************************************/
CREATE PROCEDURE FATURAR (
    PEDCOD INTEGER,
    USECOD INTEGER,
    TROCO DOUBLE PRECISION)
AS
DECLARE VARIABLE CODPED INTEGER;
DECLARE VARIABLE PROCOD INTEGER;
DECLARE VARIABLE QTDEITEM FLOAT;
DECLARE VARIABLE PROCODCOMP INTEGER;
DECLARE VARIABLE QTDEITEMCOMP FLOAT;
DECLARE VARIABLE NUMCAIXA INTEGER;
DECLARE VARIABLE ATUCAIXA INTEGER;
DECLARE VARIABLE CODMESA INTEGER;
DECLARE VARIABLE VALDIN FLOAT;
DECLARE VARIABLE VALCHE FLOAT;
DECLARE VARIABLE VALCART FLOAT;
DECLARE VARIABLE OBS VARCHAR(20);
begin

 begin
  --Selecionar os itens do pedido
  for select item_pedido.Ped_Cod, item_pedido.pro_cod, item_pedido.itped_qtdtotal
        from item_pedido
       where item_pedido.ped_cod = :pedcod
        into :codped, :procod, :qtdeitem
  do
   begin
   --atualizar estoque qundo produto for diferente de composto
    update produto set produto.pro_qtd = (produto.pro_qtd - :qtdeitem)
      where produto.pro_cod = :procod and produto.pro_tip <> 'C';

   --atualizar estoque quando produto for composto
    begin
      for select composicao.comp_pro_cod, composicao.comp_qtd
        from composicao
       where composicao.pro_cod = :procod
         into :procodcomp, :qtdeitemcomp
      do
       update produto set produto.pro_qtd =
                          (produto.pro_qtd - (:qtdeitemcomp * :qtdeitem))
         where produto.pro_cod = :procodcomp;

    end
   end
 end

 begin
 --Atualizar Valores em Caixa com os valores do pedido
  select pedido.pgt_din, pedido.pgt_che, pedido.pgt_cart, pedido.cai_num, pedido.mesa_cod
    from pedido
   where pedido.ped_cod = :pedcod
    into :valdin, :valche, :valcart, :numcaixa, :codmesa;

  update pedido set pedido.ped_valtotal = ((:valdin + :valche + :valcart) - :troco)
     where pedido.ped_cod = :pedcod;

  --Verificação do caixa
   select caixa.cai_num
    from caixa
     where caixa.cai_datafch is null
    into :atucaixa;
   if (atucaixa <> numcaixa) then
    begin
     numcaixa = :atucaixa;
    end

 --inserir valores no caixa
  if (:valdin > 0) then
   begin
    OBS = 'PEDIDO: '||:pedcod;
    insert into movimentacao_caixa(CAI_NUM, USE_COD, MOV_TIP, MOV_TIP_VAL, MOV_VAL, MOV_MOT)
                           values(:numcaixa, :usecod,'E','DIN',:valdin,:OBS);
   end

   if (:valche > 0) then
   begin
    OBS = 'PEDIDO: '||:pedcod;
    insert into movimentacao_caixa(CAI_NUM, USE_COD, MOV_TIP, MOV_TIP_VAL, MOV_VAL, MOV_MOT)
                           values(:numcaixa, :usecod,'E','CHE',:valche,:OBS);
   end

  if (:valcart > 0) then
   begin
    OBS = 'PEDIDO: '||:pedcod;
    insert into movimentacao_caixa(CAI_NUM, USE_COD, MOV_TIP, MOV_TIP_VAL, MOV_VAL, MOV_MOT)
                           values(:numcaixa, :usecod,'E','CAR',:valcart,:OBS);
   end

  if (:troco > 0) then
   begin
    OBS = 'TROCO PEDIDO: '||:pedcod;
    insert into movimentacao_caixa(CAI_NUM, USE_COD, MOV_TIP, MOV_TIP_VAL, MOV_VAL, MOV_MOT)
                           values(:numcaixa, :usecod,'T','DIN',:troco,:OBS);
   end

 end

 --MARCAR PEDIDO COMO FATURADO
 begin
  update pedido set pedido.ped_sit = 'F'
   where pedido.ped_cod = :codped and pedido.ped_sit = 'A';
 end

 --LIBERAR MESAS DO PEDIDO
 begin
  /*--Selecionar as Mesas Agrupadas
  for select junta_mesa.mesa_fil
        from junta_mesa
       where junta_mesa.mesa_cod = :codmesa
        into :codjuntamesa
  do
   begin
   --atualizar mesas Agrupadas Mesas Filho
    update mesa set mesa.mesa_sit = 'D'
      where mesa.mesa_cod = :codjuntamesa;
   end */
  delete from junta_mesa where junta_mesa.mesa_cod = :codmesa;
  --mesa Pai
  update mesa set mesa.mesa_sit = 'D'
      where mesa.mesa_cod = :codmesa;
 end
END
!!