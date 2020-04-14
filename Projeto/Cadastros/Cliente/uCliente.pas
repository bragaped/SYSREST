unit uCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, DB, IBCustomDataSet, IBTable, StdCtrls, DBCtrls,
  ExtCtrls, Mask, Buttons, ComCtrls, ToolWin, Grids, DBGrids, IBQuery;

type
  TfrmCliente = class(TfrmPadraoCadastro)
    Label1: TLabel;
    lbNome: TLabel;
    lbCPFCNPJ: TLabel;
    lbRGIE: TLabel;
    lbsex: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label13: TLabel;
    dbeCod: TDBEdit;
    bitConsCli: TBitBtn;
    dbeNom: TDBEdit;
    rgTipo: TDBRadioGroup;
    dbecpfcnpj: TDBEdit;
    dbergie: TDBEdit;
    dbeSex: TDBEdit;
    dbeEnd: TDBEdit;
    dbeComp: TDBEdit;
    dbeBai: TDBEdit;
    dbeCEP: TDBEdit;
    dbeEmail: TDBEdit;
    dbeTel: TDBEdit;
    dbmObs: TDBMemo;
    grbCidade: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbeCodCid: TDBEdit;
    bitConsCid: TBitBtn;
    edtBusc: TEdit;
    Label16: TLabel;
    cbFiltro: TComboBox;
    Label17: TLabel;
    dbcbSit: TDBCheckBox;
    ibqCliente: TIBQuery;
    dsConsulta: TDataSource;
    mkeBusc: TMaskEdit;
    bitConsOK: TBitBtn;
    pnNomCid: TPanel;
    pnSigEst: TPanel;
    procedure Situacao();
    procedure Tipo();
    procedure Alter(Sit: Char);
    procedure LocCid(Cod: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure edtBuscChange(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitSairClick(Sender: TObject);
    procedure bitConsCliClick(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure dbeCodCidChange(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure bitConsCidClick(Sender: TObject);
    procedure dbecpfcnpjExit(Sender: TObject);
    procedure bitConsOKClick(Sender: TObject);
    procedure dbnNavegacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

uses BDASYS, udmSYS, StrUtils, uVariavel, uCidade, uCheque;

{$R *.dfm}

procedure TfrmCliente.Situacao();   //Verificação se o Cliente está ATIVO ou INATIVO
Begin
  with dmSYS do
    Begin
      if (ibtCliente.FieldByName('Cli_Sit').AsString ='I') then
        dbcbSit.Checked := True
      else
        if (ibtCliente.FieldByName('Cli_Sit').AsString = 'A') then
          dbcbSit.Checked := False;
    end;
end;

procedure TfrmCliente.Tipo;    //Verificação se o Cliente é Pessoa FISICA ou JURIDICA
 procedure alteravalor(CPFCNPJ,RGIE,CAMPO,MASK: String; TF:Boolean) ;
  begin
   with dmSYS do
    begin
     lbCPFCNPJ.Caption := CPFCNPJ;
     lbRGIE.Caption := RGIE;
     if ibtCliente.State in [dsInsert, dsEdit] then
      ibtCliente.FieldByName(CAMPO).Clear;
     ibtCliente.FieldByName(CAMPO).EditMask := MASK;
     dbeSex.Visible := TF;
     lbsex.Visible := TF;
    end;
  end;
begin
  Begin
   if rgTipo.ItemIndex = 0 then
    Begin
     alteravalor('CPF','RG','CLI_CPFCNPJ','999.999.999-99;1; ',True);
    End
   else
    if rgTipo.ItemIndex = 1 then
     begin
      alteravalor('CNPJ','IE','CLI_CPFCNPJ','99.999.999/9999-99;1; ',False);
     end;
  end;
end;

procedure TfrmCliente.Alter(sit: Char);   //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
 procedure AlteraValor(v1:Boolean);
  begin
   dbeNom.ReadOnly := v1;
   dbecpfcnpj.ReadOnly := v1;
   dbergie.ReadOnly := v1;
   dbeSex.ReadOnly := v1;
   dbeEnd.ReadOnly := v1;
   dbeComp.ReadOnly := v1;
   dbeBai.ReadOnly := v1;
   dbeCEP.ReadOnly := v1;
   dbeEmail.ReadOnly := v1;
   dbeTel.ReadOnly := v1;
   dbeCodCid.ReadOnly := v1;
   dbmObs.ReadOnly := v1;
   rgTipo.ReadOnly := v1;
   dbcbSit.ReadOnly := v1;
  end;
begin
  case sit of
   'I':Begin  //Permição de Altração negada
        alteravalor(True);
        Botoes('O'); //chamada da Ativação dos Botões
       end;
   'A':Begin  //Permição de Altração Autorizada
        alteravalor(False);
        Botoes('I'); //chamada da Ativação dos Botões
       end;
  end;
if (dbeCodCid.Text <> '') then
  LocCid(StrToInt(dbeCodCid.Text));
end;

procedure TfrmCliente.LocCid(Cod: Integer);
Begin
 with dmSYS do              //localização da cidade atravez da digitação do codigo
  Begin
    ibtCidade.Open;
    ibtCidade.Locate('Cid_Cod',Cod,[loCaseInsensitive]);
    if (ibtCidade.FieldByName('CID_COD').AsInteger = Cod) then
      Begin
        pnNomCid.Caption := ibtCidade.FieldByName('CID_NOM').AsString;
        pnSigEst.Caption := ibtCidade.FieldByName('EST_SIG').AsString;
      end
    else
      Begin
        MessageDlg('Cidade não Cadastrada', mtInformation, [mbOK],0);
        dbeCodCid.SetFocus;
        pnNomCid.Caption := '';
        pnSigEst.Caption := '';
      end;
  end;
end;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);  //Saida do Formulario
begin
  inherited;
  with dmSYS do
    Begin
      ibtCliente.Close;
      ibtCidade.Close;
      dsCliente.AutoEdit := False;
      dsCidade.AutoEdit := False;
      Action := caFree;
    end;
end;

procedure TfrmCliente.FormCreate(Sender: TObject);  //Criação do Formulario
begin
  inherited;
  with dmSYS do
    Begin
      ibtCliente.Open;
      ibtCidade.Open;
      dsCliente.AutoEdit := True;
      dsCidade.AutoEdit := True;
      Tipo; //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
      Situacao;   //Chamada da procedure para alterar Box de Situação
      Alter('I');  //Chamada da alterção dos DBEdits
      pgcPadraoCad.TabIndex := 0;
      cbFiltro.ItemIndex := -1;
      bitConsCli.Enabled := True;
      bitConsCid.Enabled := False;
    end;
end;

procedure TfrmCliente.rgTipoClick(Sender: TObject);  //click do Radio Grup verificação do Tipo de Cliente
begin
  inherited;
  with dmSYS do
   Begin
    if ibtCliente.State in [dsInsert, dsEdit] then
     begin
      ibtCliente.FieldByName('Cli_TIP').AsInteger := rgTipo.ItemIndex;
      Tipo;  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
     end;
   end;
end;

procedure TfrmCliente.bitIncluirClick(Sender: TObject); //Botão Incluir
var
  cont: integer;
begin
  inherited;
  with dmSYS do
   Begin
    if (ibqCliente.Active = True) then
     ibqCliente.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtCliente.Last;                                        //Linha 1
    cont:=1;                                                //Linha 2
    cont:=cont+ibtCliente.FieldByName('Cli_Cod').AsInteger; //Linha 3
    ibtCliente.Append;                          //Referece a inserção do codigo automatico na hora da inclusão Linhas 1,2,3
    Alter('A');    //Chamada da alterção dos DBEdits
    rgTipo.ItemIndex := 0;
    ibtCliente.FieldByName('Cli_Cod').AsInteger := cont;  //Atribuindo o codigo ao campo referente as Linas 1,2,3
    dbeNom.SetFocus;
    ibtCidade.Close;
    dbcbSit.Checked := False;
    pnNomCid.Caption := '';
    pnSigEst.Caption := '';
    bitConsCli.Enabled := False;
    bitConsCid.Enabled := True;
   end;
end;

procedure TfrmCliente.bitokClick(Sender: TObject);  //Botão OK
begin
  inherited;
  with dmSYS do
   Begin
    if ibtCliente.FieldByName('CID_COD').IsNull then
     begin
      Botoes('I');
      MessageDlg('Cidade em branco!', mtInformation, [mbOk], 0);
      dbeCodCid.SetFocus;
      Exit;
     end;                     //Validação de Codigo  da Cidade e Nome caso estejão em branco
    if ibtCliente.FieldByName('CLI_NOM').IsNull then
     begin
      Botoes('I');
      MessageDlg('Nome em branco!', mtInformation, [mbOk], 0);
      dbeNom.SetFocus;
      Exit;
     end;
    if (dbcbSit.Checked = True) then
     ibtCliente.FieldByName('CLI_SIT').AsString := 'I'
    else
      if (dbcbSit.Checked = False) then
        ibtCliente.FieldByName('CLI_SIT').AsString := 'A';
    ibtCliente.Post;
    bitConsCli.Enabled := True;
    bitConsCid.Enabled := False;
    Alter('I');   //Chamada da alterção dos DBEdits
    Situacao();   //Chamada da procedure para alterar Box de Situação
   end;
  dmSYS.ibtSYS_DATABASE.CommitRetaining;
end;

procedure TfrmCliente.bitAlterarClick(Sender: TObject);  //Botão Alterar
begin
  inherited;
  if  pgcPadraoCad.TabIndex = 1 then
   Begin
    dmSYS.ibtCliente.Locate('CLI_COD',ibqCliente.FieldByName('Codigo').Value,[loCaseInsensitive]);
    ibqCliente.Close;
    pgcPadraoCad.TabIndex := 0;
    Tipo();  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
    Situacao(); //Chamada da procedure para alterar Box de Situação
   end;
  Alter('A');  //Chamada da alterção dos DBEdits
  dmSYS.ibtCliente.Edit;
  bitConsCli.Enabled := False;
  bitConsCid.Enabled := True;
end;

procedure TfrmCliente.edtBuscChange(Sender: TObject); //Busca atravez dos filtros do cbFiltro
Var AuxFone: String;
begin
   inherited;
   if (edtBusc.Text <> '') or (mkeBusc.Text <>'') then
    begin
      with dmSYS.ibtCliente do
      	begin
          ibqCliente.Close;
          ibqCliente.SQL.Clear;
          case cbFiltro.ItemIndex of
            -1:Begin
                ibqCliente.SQL.Add('Select CLI_COD as Codigo, CLI_NOM as Nome,');
                ibqCliente.SQL.Add('CLI_TEL as Telefone, CLI_END as Endereco ');
                ibqCliente.SQL.Add('From Cliente ORDER BY CLI_COD');
               end;
            0:Begin
                ibqCliente.SQL.Add('Select CLI_NOM as Nome, CLI_TEL as Telefone, CLI_END as Endereco,');
                ibqCliente.SQL.Add('CLI_COD as Codigo From Cliente Where Cli_Nom');
                ibqCliente.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
              End;
            1:Begin
               if (Length(Trim(mkeBusc.Text)) = 9) then
                begin
                 AuxFone := Copy(mkeBusc.Text,0,8);
                 AuxFone := Trim(AuxFone);
                end
               else
                AuxFone := Trim(mkeBusc.Text);
               ibqCliente.SQL.Add('Select CLI_TEL as Telefone, CLI_NOM as Nome, CLI_END as Endereco,');
               ibqCliente.SQL.Add('CLI_COD as Codigo From Cliente Where CLI_TEL');
               ibqCliente.SQL.Add('Like'+#39+Trim(AuxFone)+'%'+#39);
              End;
            2:Begin
               ibqCliente.SQL.Add('Select CLI_END as Endereco, CLI_NOM as Nome, CLI_TEL as Telefone,');
               ibqCliente.SQL.Add('CLI_COD as Codigo From Cliente Where CLI_END');
               ibqCliente.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
              End;
            3:Begin
               ibqCliente.SQL.Add('Select CLI_COD as Codigo, CLI_NOM as Nome, CLI_TEL as Telefone,');
               ibqCliente.SQL.Add('CLI_END as Endereco From Cliente Where CLI_COD');
               ibqCliente.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
              End;
	        end;
        ibqCliente.Open;
      	end;
    end
end;

procedure TfrmCliente.bitExcluirClick(Sender: TObject); //Botão Excluir
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtCliente.Locate('CLI_COD',ibqCliente.FieldByName('Codigo').Value,[loCaseInsensitive]);
       end;
      if (ibtCliente.FieldByName('CLI_COD').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
        Exit;
       end
      else
       begin
        ibtCliente.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          ibqCliente.Close;
          ibqCliente.Open;
         end;
       end;
     end;
   end;
  Tipo();  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
  Situacao(); //Chamada da procedure para alterar Box de Situação
  Alter('I'); //Chamada da alterção dos DBEdits
end;

procedure TfrmCliente.bitCancelarClick(Sender: TObject); //Botão Cancelar
begin
  inherited;
  dmSYS.ibtCliente.Cancel;
  Tipo();  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
  Situacao();  //Chamada da procedure para alterar Box de Situação
  Alter('I');  //Chamada da alterção dos DBEdits
  bitConsCli.Enabled := True;
  bitConsCid.Enabled := False;
end;

procedure TfrmCliente.bitSairClick(Sender: TObject);  //Botão Sair
begin
  inherited;
  with dmSYS do
   Begin
    if ibtCliente.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        ibtCliente.Cancel;
        Close;
       end;
     end
    else
     Close;
   end;
end;

procedure TfrmCliente.bitConsCliClick(Sender: TObject);  //ir para aba Consulta
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmCliente.tbsCadastroShow(Sender: TObject); //verificação pois estava trazendo siuação errada
var cod:Integer;
begin
  inherited;
  cod:=0;
  if (dbnNavegacao.Enabled = False) then
   dbnNavegacao.Enabled := True;
  if (ibqCliente.Active = True) then
   begin
    if not(ibqCliente.FieldByName('Codigo').IsNull) then
      cod := ibqCliente.FieldByName('Codigo').Value;
    if ( cod <> 0) then
     Begin
      ibqCliente.Close;
      dmSYS.ibtCliente.Locate('CLI_COD',cod,[loCaseInsensitive]);
      Tipo();  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
      Situacao(); //Chamada da procedure para alterar Box de Situação
      Alter('I'); //Chamada da alterção dos DBEdits
     end;
   end;
  if (ibqCliente.Active = True) then
    ibqCliente.Close;
end;

procedure TfrmCliente.tbsConsultaShow(Sender: TObject); //Ativação da Aba Consulta
begin
  inherited;
  with dmSYS do
   Begin
    Alter('I');
    dbnNavegacao.Enabled := False;
    cbFiltroChange(tbsConsulta);
    edtBuscChange(tbsConsulta);
    ibqCliente.Open;
   end;
end;

procedure TfrmCliente.dbeCodCidChange(Sender: TObject);
begin
  inherited;
  if dbeCodCid.Text <> '' then
   begin
    LocCid(StrToInt(dbeCodCid.Text));
    if (uVariavel.chamada = 'C') then
     begin
      dmSYS.ibtCliente.FieldByName('CID_COD').AsInteger := StrToInt(dbeCodCid.Text);
     end;
   end
  else
    Begin
      pnNomCid.Caption := '';
      pnSigEst.Caption := '';
    end
end;

procedure TfrmCliente.cbFiltroChange(Sender: TObject);
begin
  inherited;
  if cbFiltro.ItemIndex = 1 then
    Begin
      mkeBusc.Enabled := True;
      mkeBusc.Visible := True;
      mkeBusc.SetFocus;
      edtBusc.Enabled := False;
      edtBusc.Visible := False;
      edtBuscChange(cbFiltro);
    end                               //Alteração para utilização de mascara para telefone
  else
    Begin
      mkeBusc.Enabled := False;
      mkeBusc.Visible := False;
      edtBusc.Enabled := True;
      edtBusc.Visible := True;
      edtBusc.SetFocus;
    end;
end;

procedure TfrmCliente.bitConsCidClick(Sender: TObject); //Chamada da tela de consulta de Cidade
begin
  inherited;
  if (dbeCodCid.ReadOnly = False) then
   begin
    uVariavel.chamada:= '1';
    Application.CreateForm(TfrmCidade,frmCidade);
    frmCidade.Show;
    frmCidade.pgcPadraoCad.TabIndex := 1;
    frmCidade.edtBusc.SetFocus;
   end;
end;

procedure TfrmCliente.dbecpfcnpjExit(Sender: TObject);
begin
  inherited;
  if rgTipo.ItemIndex = 0 then
   begin
    if dbecpfcnpj.Text <> '' then
     if (CPF(dbecpfcnpj.Text) = False) then
      Begin
        MessageDlg('CPF Invalido', mtInformation, [mbOK],0);
        dbecpfcnpj.SetFocus;
        Exit;
      end;
   end;
  if rgTipo.ItemIndex = 1 then
   if  dbecpfcnpj.Text <> '' then
    if (CNPJ(dbecpfcnpj.Text) = False) then
      Begin
        MessageDlg('CNPJ Invalido', mtInformation, [mbOK],0);
        dbecpfcnpj.SetFocus;
        Exit;
      end;
end;

procedure TfrmCliente.bitConsOKClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (uVariavel.chamada <> '0') then
     begin
      ibtCliente.Locate('CLI_COD',ibqCliente.FieldByName('Codigo').Value,[loCaseInsensitive]);
      case uVariavel.chamada of
       '1':Begin
            uVariavel.chamada := 'C';
            frmCheque.dbeCodCli.Text := ibtCliente.FieldByName('CLI_COD').Value;
            uVariavel.chamada := '0';
            Close;
           End;
       '2':Begin
            uVariavel.chamada := '0';
            Close;
           End;
       '3':Begin
            uVariavel.chamada := '0';
            Close;
           End;
      end;
     end;
   end;
end;

procedure TfrmCliente.dbnNavegacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  Tipo();  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
  Situacao(); //Chamada da procedure para alterar Box de Situação
  Alter('I'); //Chamada da alterção dos DBEdits
end;

procedure TfrmCliente.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   begin
    if ibtCliente.State in [dsInsert, dsEdit] then
     if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      begin
       AllowChange := True;
       ibtCliente.Cancel;
       Alter('I');
       pgcPadraoCad.TabIndex := 1;
       ibqCliente.Open;    //Ativar a Query para trazer todos os registros
      end
     else
      begin
       AllowChange := False;
       if (ibqCliente.Active = True) then
        ibqCliente.Close;  //Desativar a Query
       Alter('A');
       pgcPadraoCad.TabIndex := 0;
      end;
   end;
end;

End.


