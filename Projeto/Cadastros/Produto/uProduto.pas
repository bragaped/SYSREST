unit uProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, DB, IBCustomDataSet, IBTable, StdCtrls, DBCtrls,
  ExtCtrls, Mask, Grids, DBGrids, ComCtrls, Buttons, ToolWin, IBQuery;

type
  TfrmProduto = class(TfrmPadraoCadastro)
    lbCodigo: TLabel;
    dbeCod: TDBEdit;
    bitConsPro: TBitBtn;
    lbNome: TLabel;
    dbeNom: TDBEdit;
    grbGrupo: TGroupBox;
    lbGropCod: TLabel;
    lbNom: TLabel;
    dbeCodGrup: TDBEdit;
    bitConsGrup: TBitBtn;
    lbPreco: TLabel;
    dbePreco: TDBEdit;
    lbTipo: TLabel;
    lbUnidade: TLabel;
    lbQtdeEst: TLabel;
    dbcbTipo: TDBComboBox;
    grbItemComposicao: TGroupBox;
    dbgItemComp: TDBGrid;
    ibqProduto: TIBQuery;
    dsConsulta: TDataSource;
    edtBusc: TEdit;
    Label16: TLabel;
    cbFiltro: TComboBox;
    bitConsOK: TBitBtn;
    dbeEstMin: TDBEdit;
    lbEstMin: TLabel;
    cbFiltroTipo: TComboBox;
    dbcbSit: TDBCheckBox;
    Label17: TLabel;
    dbcbUnidade: TDBComboBox;
    dbePro_ICM: TDBEdit;
    lbICM: TLabel;
    sbExcluirItem: TSpeedButton;
    lbtip: TLabel;
    Label1: TLabel;
    dbcbCodTribut: TDBComboBox;
    pnQtde: TPanel;
    pnNomGrup: TPanel;
    Label2: TLabel;
    procedure Botoes(bt: Char);
    procedure Alter(Sit: Char);
    procedure SalvarProduto();
    procedure LocGrup(Cod: Integer);
    procedure Tipo();
    procedure Unidade();
    procedure CodTribut();
    procedure Situacao();
    procedure Carregaestoque();
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitSairClick(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitConsProClick(Sender: TObject);
    procedure bitConsGrupClick(Sender: TObject);
    procedure dbeCodGrupChange(Sender: TObject);
    procedure dbcbTipoChange(Sender: TObject);
    procedure dbcbUnidadeChange(Sender: TObject);
    procedure dbnNavegacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure dbePro_ICMExit(Sender: TObject);
    procedure dbeNomExit(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure cbFiltroTipoChange(Sender: TObject);
    procedure edtBuscChange(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure sbExcluirItemClick(Sender: TObject);
    procedure dbgConsDblClick(Sender: TObject);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure grbItemComposicaoEnter(Sender: TObject);
    procedure grbItemComposicaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

uses udmSYS, uGrupo_Produto, uPrincipal, uVariavel, Math, uCompra,
  ugridPedido;

{$R *.dfm}

procedure TfrmProduto.Alter(sit: Char);   //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
begin
  case sit of
   'I':Begin  //Permição de Altração negada
         dbeNom.ReadOnly := True;
         dbeCodGrup.ReadOnly := True;
         dbePreco.ReadOnly := True;
         dbeEstMin.ReadOnly := True;
         dbePro_ICM.ReadOnly := True;
         dbcbTipo.Enabled := False;
         dbcbCodTribut.Enabled := False;
         dbcbUnidade.Enabled := False;
         dbcbSit.ReadOnly := True;
         Botoes('O'); //chamada da Ativação dos Botões
       end;
   'A':Begin  //Permição de Altração Autorizada
         dbeNom.ReadOnly := False;
         dbeCodGrup.ReadOnly := False;
         dbePreco.ReadOnly := False;
         dbeEstMin.ReadOnly := False;
         dbePro_ICM.ReadOnly := False;
         dbcbTipo.Enabled := True;
         dbcbCodTribut.Enabled := True;
         dbcbUnidade.Enabled := True;
         dbcbSit.ReadOnly := False;
         Botoes('I'); //chamada da Ativação dos Botões
         if dbcbTipo.ItemIndex = 1 then
          Begin
           dbcbTipo.Enabled := False;
          end;
       end;
  end;
if (dbeCodGrup.Text <> '') then
  LocGrup(StrToInt(dbeCodGrup.Text));
end;

procedure TfrmProduto.Botoes(bt: Char); //Habilitar e Desabilitar os Botões da Janela
Begin
  case bt of
    'O':Begin  //Parametros no clicle dos Botões (OK, Cancelar, Excluir e inicialização do Form)
          bitConsPro.Enabled := True;
          bitConsGrup.Enabled := False;
          bitok.Enabled := False;
          bitIncluir.Enabled := True;
          bitExcluir.Enabled := True;
          bitAlterar.Enabled := True;
          bitCancelar.Enabled := False;
          dbnNavegacao.Enabled := True;
        end;
    'I':Begin //Parametros no clicle dos Botões (Incluir, Alterar)
          bitConsPro.Enabled := False;
          bitConsGrup.Enabled := True;
          bitok.Enabled := True;
          bitIncluir.Enabled := False;
          bitExcluir.Enabled := False;
          bitAlterar.Enabled := False;
          bitCancelar.Enabled := True;
          dbnNavegacao.Enabled := False;
        end;
  end;
end;

procedure TfrmProduto.SalvarProduto();
begin
 if dmSYS.ibtProduto.FieldByName('GRU_COD').IsNull then
  begin
   Botoes('I');
   MessageDlg('Grupo em branco!', mtInformation, [mbOk], 0);
   dbeCodGrup.SetFocus;
   Exit;
  end;
 if dmSYS.ibtProduto.FieldByName('Pro_NOM').IsNull then
  begin
   Botoes('I');
   MessageDlg('Nome em branco!', mtInformation, [mbOk], 0);
   dbeNom.SetFocus;
   Exit;
  end;
 if dmSYS.ibtProduto.FieldByName('PRO_PRE').IsNull then
  begin
   Botoes('I');
   MessageDlg('Preço em branco!', mtInformation, [mbOk], 0);
   dbePreco.SetFocus;
   Exit;
  end;
 if dmSYS.ibtProduto.FieldByName('Pro_TIP').IsNull then
  begin
   Botoes('I');
   MessageDlg('Tipo em branco!', mtInformation, [mbOk], 0);
   dbcbTipo.SetFocus;
   Exit;
  end;
 case (dbcbTipo.ItemIndex) of
  0:dmSYS.ibtProduto.FieldByName('PRO_TIP').AsString := 'S';
  1:dmSYS.ibtProduto.FieldByName('PRO_TIP').AsString := 'C';
  2:dmSYS.ibtProduto.FieldByName('PRO_TIP').AsString := 'M';
 end;
 case (dbcbUnidade.ItemIndex) of
  0:dmSYS.ibtProduto.FieldByName('PRO_UNI').AsString := 'UN';
  1:dmSYS.ibtProduto.FieldByName('PRO_UNI').AsString := 'LT';
  2:dmSYS.ibtProduto.FieldByName('PRO_UNI').AsString := 'KG';
 end;
 case (dbcbCodTribut.ItemIndex) of
  0:dmSYS.ibtProduto.FieldByName('PRO_CODTRIBUT').AsString := 'I';
  1:dmSYS.ibtProduto.FieldByName('PRO_CODTRIBUT').AsString := 'S';
  2:dmSYS.ibtProduto.FieldByName('PRO_CODTRIBUT').AsString := 'T';
  3:dmSYS.ibtProduto.FieldByName('PRO_CODTRIBUT').AsString := 'N';
 end;
 if (dbcbSit.Checked = True) then
  dmSYS.ibtProduto.FieldByName('Pro_Sit').AsString := 'I'
 else
  if (dbcbSit.Checked = False) then
   dmSYS.ibtProduto.FieldByName('Pro_Sit').AsString := 'A';
 if (dmSYS.ibtProduto.State in [dsInsert]) then
  dmSYS.ibtProduto.FieldByName('PRO_QTD').AsFloat := 0.0;
  dmSYS.ibtProduto.Post;
 if uVariavel.insertProduto = 1 then
  dmSYS.ibtProduto.Edit;
 Unidade();   ///Seleção da Unidade do produto
 Tipo();      //Seleção do tipo de produto
 Situacao();   //Verificação se o Produto está ATIVO ou INATIVO
 CodTribut(); //Seleção do Codigo Tributario do Produto
 dbcbTipoChange(bitAlterar);
end;

procedure TfrmProduto.LocGrup(Cod: Integer);
Begin
 with dmSYS do              //localização da cidade atravez da digitação do codigo
  Begin
    ibtGrupPro.Open;
    ibtGrupPro.Locate('Gru_Cod',Cod,[loCaseInsensitive]);
    if (ibtGrupPro.FieldByName('Gru_Cod').AsInteger = Cod) then
      Begin
        pnNomGrup.Caption := ibtGrupPro.FieldByName('GRU_NOM').AsString;
      end
    else
      Begin
        MessageDlg('Grupo não Cadastrada', mtInformation, [mbOK],0);
        dbeCodGrup.SetFocus;
        pnNomGrup.Caption := '';
      end;
  end;
end;

procedure TfrmProduto.Tipo();
Begin
 with dmSYS.ibtProduto do           //Seleção do tipo de produto
  Begin
   dbcbTipo.ItemIndex := -1;
   if (FieldByName('PRO_TIP').AsString = 'S') then begin
     dbcbTipo.ItemIndex := 0;
     dmSYS.ibtProd_Comp.Close;
    end
   else
    if (FieldByName('PRO_TIP').AsString = 'C') then begin
      dmSYS.ibtProd_Comp.Open;
      dmSYS.dsProd_Comp.AutoEdit := True;
      dbcbTipo.ItemIndex := 1;
     end
    else
     if (FieldByName('PRO_TIP').AsString = 'M') then begin
       dbcbTipo.ItemIndex := 2;
       dmSYS.ibtProd_Comp.Close;
      end;
  end;
end;

procedure TfrmProduto.Unidade();
Begin
 with dmSYS.ibtProduto do           //Seleção da Unidade do produto
  Begin
   dbcbUnidade.ItemIndex := -1;
   if (FieldByName('PRO_UNI').AsString = 'UN') then
    dbcbUnidade.ItemIndex := 0
   else
    if (FieldByName('PRO_UNI').AsString = 'LT') then
     dbcbUnidade.ItemIndex := 1
    else
     if (FieldByName('PRO_UNI').AsString = 'KG') then
      dbcbUnidade.ItemIndex := 2;
  end;
end;

procedure TfrmProduto.CodTribut();
Begin
 with dmSYS.ibtProduto do           //Seleção da Codigo Tributario do Produto
  Begin
   dbcbCodTribut.ItemIndex := -1;
   if (FieldByName('PRO_CODTRIBUT').AsString = 'I') then
    dbcbCodTribut.ItemIndex := 0
   else
    if (FieldByName('PRO_CODTRIBUT').AsString = 'S') then
     dbcbCodTribut.ItemIndex := 1
    else
     if (FieldByName('PRO_CODTRIBUT').AsString = 'T') then
      dbcbCodTribut.ItemIndex := 2
     else
      if (FieldByName('PRO_CODTRIBUT').AsString = 'N') then
      dbcbCodTribut.ItemIndex := 3;
  end;
end;

procedure TfrmProduto.Situacao();   //Verificação se o Produto está ATIVO ou INATIVO
Begin
  with dmSYS do
    Begin
      if (ibtProduto.FieldByName('Pro_Sit').AsString = 'I') then
        dbcbSit.Checked := True
      else
        if (ibtProduto.FieldByName('Pro_Sit').AsString = 'A') then
          dbcbSit.Checked := False;
    end;
end;

procedure TfrmProduto.Carregaestoque();  //Formatação da quantidade em estoque
begin
 with dmSYS.ibtProduto do
  begin
   pnQtde.Caption := '';
   if (FieldByName('PRO_TIP').AsString <> 'C') then
    if (FieldByName('PRO_UNI').AsString = 'UN') then
     begin
      if not(dmSYS.ibtProduto.FieldByName('PRO_QTD').IsNull) then begin
        pnQtde.Caption := formatfloat('###0', FieldByName('PRO_QTD').Value);
        exit;
       end
      else
       pnQtde.Caption := '0.000';
      Exit;
     end
    else
     begin
      if not(dmSYS.ibtProduto.FieldByName('PRO_QTD').IsNull) then
       pnQtde.Caption := formatfloat('#,##0.000', FieldByName('PRO_QTD').Value)
      else
       pnQtde.Caption := '0.000';
      exit;
     end;
  end;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  inherited;
  with dmSYS do
    Begin
      ibtProduto.Open;
      ibtGrupPro.Open;
      dsProduto.AutoEdit := True;
      dsGrupPro.AutoEdit := True;
      dbcbTipoChange(ibtProduto);
      Alter('I');  //Chamada da alterção dos DBEdits
      Unidade();   ///Seleção da Unidade do produto
      Tipo();      //Seleção do tipo de produto
      Situacao();  //Verificação se o Produto está ATIVO ou INATIVO
      CodTribut(); //Seleção do Codigo Tributario do Produto
      Carregaestoque;  //Formatação da quantidade em estoque
      pgcPadraoCad.TabIndex := 0;
      cbFiltro.ItemIndex := -1;
    end;
end;

procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dmSYS do
    Begin
      ibtProduto.Close;
      ibtGrupPro.Close;
      ibtProd_Comp.Close;
      dsProduto.AutoEdit := False;
      dsGrupPro.AutoEdit := False;
      dsProd_Comp.AutoEdit := False;
      Action := caFree;
    end;
end;

procedure TfrmProduto.bitIncluirClick(Sender: TObject);
var
  cont: integer;
begin
  inherited;
  with dmSYS do
   Begin
    if (ibqProduto.Active = True) then
     ibqProduto.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtProduto.Last;                                        //Linha 1
    cont:=1;                                                //Linha 2
    cont:=cont+ibtProduto.FieldByName('Pro_Cod').AsInteger; //Linha 3
    ibtProduto.Append;         //Referece a inserção do codigo automatico na hora da inclusão Linhas 1,2,3
    Alter('A');    //Chamada da alterção dos DBEdits
    ibtProduto.FieldByName('PRO_Cod').AsInteger := cont;  //Atribuindo o codigo ao campo referente as Linas 1,2,3
    dbeNom.SetFocus;
    ibtGrupPro.Close;
    dbcbSit.Checked := False;
    pnNomGrup.Caption := '';
    dbcbTipo.ItemIndex := -1;
    dbcbUnidade.ItemIndex := -1;
    dbcbCodTribut.ItemIndex := -1;
    uVariavel.insertProduto := 1;
    pnQtde.Caption := '';
    ibtProd_Comp.Open;
    dbcbTipoChange(bitIncluir);
    lbQtdeEst.Visible := False;
    pnQtde.Visible := False;
   end;
end;

procedure TfrmProduto.bitokClick(Sender: TObject);
begin
 uVariavel.insertProduto := 0;
 SalvarProduto();
 if (dmSYS.ibtProduto.FieldByName('PRO_TIP').AsString = 'C') and
    (dmSYS.ibtProd_Comp.State in [dsEdit, dsInsert]) then
  Begin
   dmSYS.ibtProd_Comp.Post;
  end;
 Alter('I');   //Chamada da alterção dos DBEdits
 dmSYS.ibtSYS_DATABASE.CommitRetaining;
 Unidade();   ///Seleção da Unidade do produto
 Tipo();      //Seleção do tipo de produto
 Situacao();   //Verificação se o Produto está ATIVO ou INATIVO
 CodTribut(); //Seleção do Codigo Tributario do Produto
 Carregaestoque; //Formatação da quantidade em estoque
 dbcbTipoChange(dbnNavegacao);
end;

procedure TfrmProduto.bitAlterarClick(Sender: TObject);
begin
  inherited;
  if  pgcPadraoCad.TabIndex = 1 then
   Begin
    dmSYS.ibtProduto.Locate('PRO_COD',ibqProduto.FieldByName('Codigo').Value,[loCaseInsensitive]);
    ibqProduto.Close;
    pgcPadraoCad.TabIndex := 0;
    Carregaestoque; //Formatação da quantidade em estoque
   end;
  Alter('A');  //Chamada da alterção dos DBEdits
  dmSYS.ibtProduto.Edit;
  Unidade();   ///Seleção da Unidade do produto
  Tipo();      //Seleção do tipo de produto
  Situacao();   //Verificação se o Produto está ATIVO ou INATIVO
  CodTribut(); //Seleção do Codigo Tributario do Produto
  dbcbTipoChange(bitAlterar);
  dbeNom.SetFocus;
end;

procedure TfrmProduto.bitCancelarClick(Sender: TObject);
begin
 if uVariavel.insertProduto = 1 then
  Begin
   uVariavel.insertProduto := 0;
   dmSYS.ibtProduto.Delete;
  end
 else
  begin
   if dmSYS.ibtProduto.FieldByName('PRO_TIP').AsString = 'C' then
    Begin
     dmSYS.ibtProd_Comp.Cancel;
    end;
   dmSYS.ibtProduto.Cancel;
  end;
 Alter('I');  //Chamada da alterção dos DBEdits
 Unidade();   ///Seleção da Unidade do produto
 Tipo();      //Seleção do tipo de produto
 Situacao();   //Verificação se o Produto está ATIVO ou INATIVO
 CodTribut(); //Seleção do Codigo Tributario do Produto
 Carregaestoque; //Formatação da quantidade em estoque
 dbcbTipoChange(bitCancelar);
end;

procedure TfrmProduto.bitSairClick(Sender: TObject);
begin
 if dmSYS.ibtProduto.State in [dsInsert, dsEdit] then
  begin
   if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
     if uVariavel.insertProduto = 1 then
       Begin
        uVariavel.insertProduto := 0;
        dmSYS.ibtProduto.Delete;
        Close;
       end
     else
      begin
       dmSYS.ibtProduto.Cancel;
       if (dbcbTipo.ItemIndex = 0) then
         dmSYS.ibtProd_Comp.Cancel;
       Close;
      end;
    end;
  end
 else
  Close;
  uVariavel.insertProduto := 0;
end;

procedure TfrmProduto.bitExcluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtProduto.Locate('PRO_COD',ibqProduto.FieldByName('Codigo').Value,[loCaseInsensitive]);
       end;
      if (ibtProduto.FieldByName('PRO_COD').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
        Exit;
       end
      else
       begin
        ibtProduto.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          ibqProduto.Close;
          ibqProduto.Open;
         end;
       end;
     end;
   end;
  Alter('I'); //Chamada da alterção dos DBEdits
  Unidade();   ///Seleção da Unidade do produto
  Tipo();      //Seleção do tipo de produto
  Situacao();   //Verificação se o Produto está ATIVO ou INATIVO
  CodTribut(); //Seleção do Codigo Tributario do Produto
  Carregaestoque;  //Formatação da quantidade em estoque
  dbcbTipoChange(bitExcluir);
end;

procedure TfrmProduto.bitConsProClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmProduto.bitConsGrupClick(Sender: TObject);
begin
  inherited;
  if (dbeCodGrup.ReadOnly = False) then
   begin
    uVariavel.chamada:= '1';
    Application.CreateForm(TfrmGrupo_Produto,frmGrupo_Produto);
    frmGrupo_Produto.Show;
    frmGrupo_Produto.pgcPadraoCad.TabIndex := 1;
    exit;
   end;
end;

procedure TfrmProduto.dbeCodGrupChange(Sender: TObject);
begin
 if (dmSYS.ibtProduto.State in [dsInsert, dsEdit]) then
  begin
    if dbeCodGrup.Text <> '' then
     begin
      LocGrup(StrToInt(dbeCodGrup.Text));
      if (uVariavel.chamada = 'C') then
       begin
        dmSYS.ibtProduto.FieldByName('GRU_COD').AsInteger := StrToInt(dbeCodGrup.Text);
       end;
     end
    else
      Begin
        pnNomGrup.Caption := '';
      end;
  end;
end;

procedure TfrmProduto.dbcbTipoChange(Sender: TObject);
begin
  inherited;
  Unidade();   ///Seleção da Unidade do produto
  if (dbcbTipo.ItemIndex = 1) then
   begin
    dbeEstMin.Visible := False;
    lbEstMin.Visible := False;
    lbQtdeEst.Visible := False;
    pnQtde.Visible := False;
    dbcbUnidade.ItemIndex := 0;
    dbcbUnidade.ReadOnly := True;
    dbcbUnidade.Enabled := False;
    //dmSYS.ibtProd_Comp.Open;
    If (dmSYS.ibtProduto.State in [dsInsert, dsEdit]) and (dbcbTipo.ItemIndex = 1) Then
     begin
      grbItemComposicao.Enabled := True;
      sbExcluirItem.Enabled := True;
     end
    else
     begin
      grbItemComposicao.Enabled := False;
      sbExcluirItem.Enabled := False;
     end;
    {if (frmProduto.ClientHeight<410) then
     begin
      frmProduto.Top := frmProduto.Top - 80;
      frmProduto.ClientHeight := 410;
     end;
    DBGrid1.Height := 295; }
    exit;
   end
  else
   begin
    dbeEstMin.Visible := True;
    lbEstMin.Visible := True;
    if not(dmSYS.ibtProduto.State in [dsInsert]) then
     begin
      lbQtdeEst.Visible := True;
      pnQtde.Visible := True;
     end;
    if (dmSYS.ibtProduto.State in [dsInsert, dsEdit]) then
     begin
      dbcbUnidade.ReadOnly := False;
      dbcbUnidade.Enabled := True;
     end;
    //dmSYS.ibtProd_Comp.Close;
    grbItemComposicao.Enabled := False;
    {if (frmProduto.ClientHeight>=410) then
     begin
      frmProduto.Top := frmProduto.Top + 80;
      frmProduto.ClientHeight := 250;
     end;
    DBGrid1.Height := 135; }
    exit;
   end;
end;

procedure TfrmProduto.dbcbUnidadeChange(Sender: TObject);
begin
  inherited;
  Tipo();      //Seleção do tipo de produto
  exit;
end;

procedure TfrmProduto.dbnNavegacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  Alter('I'); //Chamada da alterção dos DBEdits
  Unidade();   ///Seleção da Unidade do produto
  Tipo();      //Seleção do tipo de produto
  Situacao();   //Verificação se o Produto está ATIVO ou INATIVO
  CodTribut(); //Seleção do Codigo Tributario do Produto
  Carregaestoque;  //Formatação da quantidade em estoque
  dbcbTipoChange(dbnNavegacao);
  exit;
end;

procedure TfrmProduto.dbePro_ICMExit(Sender: TObject);
begin
  inherited;
  if (dmSYS.ibtProduto.State in [dsInsert, dsEdit]) then
   if (dbePro_ICM.Text = '0') or (dbePro_ICM.Text = '') then
    begin
     dbePro_ICM.SetFocus;
    end;
end;

procedure TfrmProduto.dbeNomExit(Sender: TObject);
begin
  inherited;
  if (dbeNom.Text = '') then
   dbeNom.SetFocus;
end;

procedure TfrmProduto.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (dbnNavegacao.Enabled = True) then
     dbnNavegacao.Enabled := False;
    if ibtProduto.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
       Begin
        ibtProduto.Cancel;
        Alter('I');
        pgcPadraoCad.TabIndex := 1;
        ibqProduto.Open;    //Ativar a Query para trazer todos os registros
       end
      else
       Begin
        if (ibqProduto.Active = True) then
          ibqProduto.Close;  //Desativar a Query
        Alter('A');
        pgcPadraoCad.TabIndex := 0;
       end;
     end
    else
     Begin
      //cbFiltroChange(tbsConsulta);
      //cbFiltro1Change(tbsConsulta);
      Alter('I');
      ibqProduto.Open;
     end;
   end;
  if (cbFiltro.ItemIndex = -1) then
   begin
    cbFiltroTipo.Enabled := False;
    cbFiltroTipo.Visible := False;
    edtBusc.Enabled := False;
    edtBusc.Visible := False;
    lbtip.Visible := False;
   end;
end;

procedure TfrmProduto.cbFiltroChange(Sender: TObject);
begin
  inherited;
  case (cbFiltro.ItemIndex) of
   0:begin                                   //Alteração do tipo de busca
      cbFiltroTipo.Enabled := False;
      cbFiltroTipo.Visible := False;
      edtBusc.Width := 300;
      edtBusc.Enabled := True;
      edtBusc.Visible := True;
      lbtip.Visible := True;
      lbtip.Caption := 'Nome:';
     end;
   1:begin
      cbFiltroTipo.Enabled := True;
      cbFiltroTipo.Visible := True;
      edtBusc.Enabled := False;
      edtBusc.Visible := False;
      lbtip.Visible := True;
      lbtip.Caption := 'Tipo:';
     end;
   2:begin
      cbFiltroTipo.Enabled := False;
      cbFiltroTipo.Visible := False;
      edtBusc.Width := 145;
      edtBusc.Enabled := True;
      edtBusc.Visible := True;
      lbtip.Visible := True;
      lbtip.Caption := 'Codigo:';
     end;
  end;
end;

procedure TfrmProduto.cbFiltroTipoChange(Sender: TObject);
var tip: char;
begin
  inherited;
  if (cbFiltro.ItemIndex = 1) then
   begin
    ibqProduto.Close;
    ibqProduto.SQL.Clear;
    ibqProduto.SQL.Add('select PRO_NOM as Nome, PRO_COD as Codigo,');
    ibqProduto.SQL.Add('PRO_PRE as Preco, PRO_TIP as Tipo, PRO_SIT as Situacao');
    ibqProduto.SQL.Add('from PRODUTO Where PRO_TIP = :nTip ORDER BY PRO_NOM');
    case (cbFiltroTipo.ItemIndex) of
     0:begin
        tip:='S';      //Tipo Simples
        ibqProduto.Prepare;
        ibqProduto.ParamByName('nTip').AsString := tip;
        ibqProduto.Open;
       end;
     1:begin
        tip:='C';      //Tipo Composto
        ibqProduto.Prepare;
        ibqProduto.ParamByName('nTip').AsString := tip;
        ibqProduto.Open;
       end;
     2:begin
        tip:='M';      //Tipo Materia Prima
        ibqProduto.Prepare;
        ibqProduto.ParamByName('nTip').AsString := tip;
        ibqProduto.Open;
       end;
    end;
   end;
end;

procedure TfrmProduto.edtBuscChange(Sender: TObject);
begin
  inherited;
  if (edtBusc.Text <> '') then
   case (cbFiltro.ItemIndex) of
   0:begin
      ibqProduto.Close;
      ibqProduto.SQL.Clear;
      ibqProduto.SQL.Add('select PRO_NOM as Nome, PRO_COD as Codigo,');
      ibqProduto.SQL.Add('PRO_PRE as Preco, PRO_TIP as Tipo, PRO_SIT as Situacao');
      ibqProduto.SQL.Add('from PRODUTO Where PRO_NOM');
      ibqProduto.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
      ibqProduto.Open;
     end;
   2:begin
      ibqProduto.Close;
      ibqProduto.SQL.Clear;
      ibqProduto.SQL.Add('select PRO_COD as Codigo, PRO_NOM as Nome,');
      ibqProduto.SQL.Add('PRO_PRE as Preco, PRO_TIP as Tipo, PRO_SIT as Situacao');
      ibqProduto.SQL.Add('from PRODUTO Where PRO_COD');
      ibqProduto.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
      ibqProduto.Open;
     end;
   end
  else
   begin
    ibqProduto.Close;
    ibqProduto.SQL.Clear;
    ibqProduto.SQL.Add('select PRO_NOM as Nome, PRO_COD as Codigo, PRO_PRE as Preco,');
    ibqProduto.SQL.Add(' PRO_TIP as Tipo, PRO_SIT as Situacao from PRODUTO ORDER BY PRO_NOM');
    ibqProduto.Open;
   end;
end;

procedure TfrmProduto.tbsCadastroShow(Sender: TObject);
var cod:Integer;
begin
  inherited;
  cod:=0;
  if (dbnNavegacao.Enabled = False) then
   dbnNavegacao.Enabled := True;
  if (ibqProduto.Active = True) then
   begin
    if not(ibqProduto.FieldByName('Codigo').IsNull) then
      cod := ibqProduto.FieldByName('Codigo').Value;
    if ( cod <> 0) then
     Begin
      ibqProduto.Close;
      dmSYS.ibtProduto.Locate('PRO_COD',cod,[loCaseInsensitive]);
      Alter('I'); //Chamada da alterção dos DBEdits
      Unidade();   ///Seleção da Unidade do produto
      Tipo();      //Seleção do tipo de produto
      Situacao();   //Verificação se o Produto está ATIVO ou INATIVO
      CodTribut(); //Seleção do Codigo Tributario do Produto
      Carregaestoque;  //Formatação da quantidade em estoque
      dbcbTipoChange(dbnNavegacao);
      exit;
     end;
   end;
  if (ibqProduto.Active = True) then
    ibqProduto.Close;
end;

procedure TfrmProduto.sbExcluirItemClick(Sender: TObject);
begin
 if not(dmSYS.ibtProd_Comp.FieldByName('COMP_PRO_COD').IsNull) then
  dmSYS.ibtProd_Comp.Delete;
end;

procedure TfrmProduto.dbgConsDblClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (uVariavel.chamada <> '0') then
     begin
      ibtProduto.Locate('PRO_COD',ibqProduto.FieldByName('Codigo').Value,[loCaseInsensitive]);
      case uVariavel.chamada of

        //Atribuir valor a Janela de Compras
       '1':Begin
            if not(ibtProduto.FieldByName('PRO_TIP').Value = 'C') then
             begin
              if not(ibtItens_Compra.State in [dsInsert, dsEdit]) then
               begin
                ibtItens_Compra.Edit;
               end;
              uVariavel.chamada:= 'C';
              frmCompra.dbgItens.Fields[0].AsInteger :=
                                     ibtProduto.FieldByName('PRO_COD').Value;
              uVariavel.chamada := '0';
              Close;
             end
            else
             begin
              MessageDlg(#13+'Produto Invalido',mtWarning,[mbOK],0);
              dbgCons.SetFocus;
             end;
           end;

        //Atribuir Valor a Tela de Pedido
       '2':Begin
            if not(ibtProduto.FieldByName('PRO_TIP').Value = 'M') then
             begin
              uVariavel.chamada:= 'C';
              if not(dmSYS.ibtItem_Pedido.State in [dsInsert, dsEdit]) then
                dmSYS.ibtItem_Pedido.Edit;
              frmGridPedido.dbgItensPedido.Fields[0].AsInteger :=
                                   ibtProduto.FieldByName('PRO_COD').Value;
              uVariavel.chamada := '0';
              Close;
             end
            else
             begin
              MessageDlg(#13+'Produto Invalido',mtWarning,[mbOK],0);
              dbgCons.SetFocus;
             end; 
           end;

     end;
   end;
 end;
end;

procedure TfrmProduto.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   begin
    if ibtProduto.State in [dsInsert, dsEdit] then
     if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      begin
       AllowChange := True;
       uVariavel.insertProduto := 0;
       ibtProduto.Cancel;
       Alter('I');
       pgcPadraoCad.TabIndex := 1;
       ibqProduto.Open;    //Ativar a Query para trazer todos os registros
      end
     else
      begin
       AllowChange := False;
       if (ibqProduto.Active = True) then
        ibqProduto.Close;  //Desativar a Query
       Alter('A');
       pgcPadraoCad.TabIndex := 0;
      end;
   end;
end;

procedure TfrmProduto.grbItemComposicaoEnter(Sender: TObject);
begin
  inherited;
  SalvarProduto();
  KeyPreview := False;
end;

procedure TfrmProduto.grbItemComposicaoExit(Sender: TObject);
begin
  inherited;
  KeyPreview := True;
end;

end.
