unit uCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, ToolWin, DB, IBCustomDataSet, IBTable, Mask, IBQuery;

type
  TfrmCheque = class(TfrmPadraoCadastro)
    Label1: TLabel;
    dbeAgencia: TDBEdit;
    Label2: TLabel;
    dbeBanco: TDBEdit;
    Label3: TLabel;
    dbeNunCheque: TDBEdit;
    Label4: TLabel;
    dbeValor: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    dbeNVenda: TDBEdit;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    dbeCodCli: TDBEdit;
    Label11: TLabel;
    pnNomCli: TPanel;
    bitConsCli: TBitBtn;
    dbcbTipo: TDBComboBox;
    Label12: TLabel;
    dbeConta: TDBEdit;
    dbmObs: TDBMemo;
    Label13: TLabel;
    dtpEmissao: TDateTimePicker;
    dtpEntrada: TDateTimePicker;
    dtpParaDeposito: TDateTimePicker;
    GroupBox2: TGroupBox;
    dbgSitCheque: TDBGrid;
    qryCheque: TIBQuery;
    dsConsulta: TDataSource;
    bitConsCheque: TBitBtn;
    cbFiltro: TComboBox;
    dbeEmitente: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    edtBusc: TEdit;
    lbNome: TLabel;
    lbdateIni: TLabel;
    lbDateFim: TLabel;
    dtpIni: TDateTimePicker;
    dtpFim: TDateTimePicker;
    edtConta: TEdit;
    lbConta: TLabel;
    sbExcluir: TSpeedButton;
    bitokdtp: TBitBtn;
    procedure Alter(sit: Char);
    procedure LocCli(Cod: Integer);
    procedure LocCheque();
    procedure CarregaDatas();
    procedure CarregaTipo();
    procedure SQL();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitSairClick(Sender: TObject);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitIncluirClick(Sender: TObject);
    procedure dbeNunChequeEnter(Sender: TObject);
    procedure dbeCodCliChange(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitConsCliClick(Sender: TObject);
    procedure bitConsChequeClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure dbnNavegacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure dbgSitChequeEnter(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure GroupBox2Enter(Sender: TObject);
    procedure GroupBox2Exit(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure edtBuscChange(Sender: TObject);
    procedure bitokdtpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheque: TfrmCheque;

implementation

uses udmSYS, uCliente, uAbtCaixa, uVariavel, uCompra;

{$R *.dfm}

procedure TfrmCheque.Alter(sit: Char);   //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
 procedure AlteraValor(FT,edit, TF :Boolean);
  begin
   dbeCodCli.ReadOnly := edit;
   dbeNVenda.ReadOnly := TF;
   dbcbTipo.Enabled := FT;
   dbeBanco.ReadOnly := edit;
   dbeAgencia.ReadOnly := edit;
   dbeConta.ReadOnly := edit;
   dbeNunCheque.ReadOnly := edit;
   dbeValor.ReadOnly := TF;
   dbeEmitente.ReadOnly := TF;
   dbmObs.ReadOnly := TF;
   dtpEmissao.Enabled := FT;
   dtpEntrada.Enabled := FT;
   dtpParaDeposito.Enabled := FT;
   bitConsCli.Enabled := FT;
   bitConsCheque.Enabled := TF;
   sbExcluir.Enabled := FT;
   dbgSitCheque.ReadOnly := TF;
  end;
begin
  case sit of
   'I':Begin  //Permição de Altração negada
        AlteraValor(False, True, True);
        Botoes('O'); //chamada da Ativação dos Botões
       end;
   'A':Begin  //Permição de Altração Autorizada
        AlteraValor(True, False, False);
        Botoes('I'); //chamada da Ativação dos Botões
       end;
   'C':Begin  //Permição de Altração Autorizada Com Restrições
        AlteraValor(True, True, False);
        Botoes('I'); //chamada da Ativação dos Botões
       end;
  end;
if (dbeCodCli.Text <> '') then
  LocCli(StrToInt(dbeCodCli.Text));
end;

procedure TfrmCheque.LocCli(Cod: Integer);
begin
 with dmSYS do              //localização da cidade atravez da digitação do codigo
  Begin
    ibtCliente.Open;
    ibtCliente.Locate('CLI_COD',Cod,[loCaseInsensitive]);
    if (ibtCliente.FieldByName('CLI_COD').AsInteger = Cod) then
      Begin
        pnNomCli.Caption := ibtCliente.FieldByName('CLI_NOM').AsString;
      end
    else
      Begin
        MessageDlg('Cliente não Cadastrada', mtInformation, [mbOK],0);
        dbeCodCli.SetFocus;
        pnNomCli.Caption := '';
      end;
  end;
end;

procedure TfrmCheque.LocCheque();
begin
 if  pgcPadraoCad.TabIndex = 1 then
  Begin
   dmSYS.ibtCheque.Locate('cli_cod;che_banco;che_agen;che_conta;che_num',
       VarArrayOf([qryCheque.FieldByName('Codigo').Value,
       qryCheque.FieldByName('Banco').Value,
       qryCheque.FieldByName('Agencia').Value,
       qryCheque.FieldByName('Conta').Value,
       qryCheque.FieldByName('Numero_Cheque').Value]),[loCaseInsensitive]);
    CarregaDatas; //Carrega as Datas
    CarregaTipo; //Carrega os Tipos de Cheque
    pgcPadraoCad.TabIndex := 0;
  end;
end;

procedure TfrmCheque.CarregaTipo(); //Carrega os Tipos de Cheque
begin
 if dmSYS.ibtCheque.FieldByName('CHE_TIP').AsString = 'V' then
  begin
   dbcbTipo.ItemIndex := -1;
   dbcbTipo.ItemIndex := 0;
  end
 else
  if dmSYS.ibtCheque.FieldByName('CHE_TIP').AsString = 'P' then
   begin
    dbcbTipo.ItemIndex := -1;
    dbcbTipo.ItemIndex := 1;
   end;
end;

procedure TfrmCheque.CarregaDatas(); //Carrega as Datas
begin
 if (dmsys.ibtcheque.FieldByName('CHE_DATENT').AsDateTime <> 0) then
  dtpEntrada.Date := dmsys.ibtcheque.FieldByName('CHE_DATENT').AsDateTime;
 if (dmsys.ibtcheque.FieldByName('CHE_DTAEMI').AsDateTime <> 0) then
  dtpEmissao.Date := dmsys.ibtcheque.FieldByName('CHE_DTAEMI').AsDateTime;
 if (dmsys.ibtcheque.FieldByName('CHE_DATPDEP').AsDateTime <> 0) then
  dtpParaDeposito.Date := dmsys.ibtcheque.FieldByName('CHE_DATPDEP').AsDateTime;
end;

procedure TfrmCheque.SQL();
begin
 with qryCheque do
  begin
   if (edtBusc.Text <> '') or (edtConta.Text <> '') or
     ((DateToStr(dtpIni.DateTime) <> '') and (DateToStr(dtpFim.DateTime) <> '')) then
    begin
     Close;
     SQL.Clear;
     case cbFiltro.ItemIndex of
      -1:Begin
          SQL.Add('select Cliente.cli_cod as Codigo, Cliente.cli_nom as Cliente, cheque.che_nom_emit as Emitente,');
          SQL.Add('cheque.che_dtaemi as Data_Emissao, cheque.che_datent as Data_Entrada,');
          SQL.Add('cheque.che_datpdep as Data_Para_Deposito, cheque.che_banco as Banco,');
          SQL.Add('cheque.che_agen as Agencia,  cheque.che_conta as Conta,');
          SQL.Add('cheque.che_num as Numero_Cheque, cheque.che_valor as Valor,');
          SQL.Add('cheque.ped_cod as Pedido from Cliente, cheque');
          SQL.Add('where Cheque.cli_cod=cliente.cli_cod order by Cliente.cli_nom');
         end;
      0:Begin
         SQL.Add('select Cliente.cli_cod as Codigo, Cliente.cli_nom as Cliente, cheque.che_nom_emit as Emitente,');
         SQL.Add('cheque.che_dtaemi as Data_Emissao, cheque.che_datent as Data_Entrada,');
         SQL.Add('cheque.che_datpdep as Data_Para_Deposito, cheque.che_banco as Banco,');
         SQL.Add('cheque.che_agen as Agencia,  cheque.che_conta as Conta,');
         SQL.Add('cheque.che_num as Numero_Cheque, cheque.che_valor as Valor,');
         SQL.Add('cheque.ped_cod as Pedido from Cliente, cheque');
         SQL.Add('where Cheque.cli_cod=cliente.cli_cod and');
         SQL.Add('cliente.cli_nom like'+#39+Trim(edtBusc.Text)+'%'+#39'order by Cliente.cli_nom');
        end;
      1:Begin
         SQL.Add('select cheque.che_nom_emit as Emitente, Cliente.cli_cod as Codigo, Cliente.cli_nom as Cliente,');
         SQL.Add('cheque.che_dtaemi as Data_Emissao, cheque.che_datent as Data_Entrada,');
         SQL.Add('cheque.che_datpdep as Data_Para_Deposito, cheque.che_banco as Banco,');
         SQL.Add('cheque.che_agen as Agencia,  cheque.che_conta as Conta,');
         SQL.Add('cheque.che_num as Numero_Cheque, cheque.che_valor as Valor,');
         SQL.Add('cheque.ped_cod as Pedido from Cliente, cheque');
         SQL.Add('where Cheque.cli_cod=cliente.cli_cod and');
         SQL.Add('cheque.che_nom_emit like'+#39+Trim(edtBusc.Text)+'%'+#39' order by cheque.che_nom_emit');
        end;
      2:Begin
         SQL.Add('select cheque.che_dtaemi as Data_Emissao, Cliente.cli_cod as Codigo, Cliente.cli_nom as Cliente,');
         SQL.Add('cheque.che_nom_emit as Emitente, cheque.che_datent as Data_Entrada,');
         SQL.Add('cheque.che_datpdep as Data_Para_Deposito, cheque.che_banco as Banco,');
         SQL.Add('cheque.che_agen as Agencia,  cheque.che_conta as Conta,');
         SQL.Add('cheque.che_num as Numero_Cheque, cheque.che_valor as Valor,');
         SQL.Add('cheque.ped_cod as Pedido from Cliente, cheque');
         SQL.Add('where Cheque.cli_cod=cliente.cli_cod and');
         SQL.Add('cheque.che_dtaemi Between :nDataIni and :nDataFim order by cheque.che_dtaemi');
         Prepare;
         ParamByName('nDataIni').AsDateTime := dtpIni.DateTime;
         ParamByName('nDataFim').AsDateTime := dtpFim.DateTime;
        end;
      3:Begin
         SQL.Add('select cheque.che_datent as Data_Entrada, Cliente.cli_cod as Codigo, Cliente.cli_nom as Cliente,');
         SQL.Add('cheque.che_nom_emit as Emitente, cheque.che_dtaemi as Data_Emissao,');
         SQL.Add('cheque.che_datpdep as Data_Para_Deposito, cheque.che_banco as Banco,');
         SQL.Add('cheque.che_agen as Agencia,  cheque.che_conta as Conta,');
         SQL.Add('cheque.che_num as Numero_Cheque, cheque.che_valor as Valor,');
         SQL.Add('cheque.ped_cod as Pedido from Cliente, cheque');
         SQL.Add('where Cheque.cli_cod=cliente.cli_cod and');
         SQL.Add('cheque.che_datent Between :nDataIni and :nDataFim order by cheque.che_datent');
         Prepare;
         ParamByName('nDataIni').AsDateTime := dtpIni.DateTime;
         ParamByName('nDataFim').AsDateTime := dtpFim.DateTime;
        end;
      4:Begin
         SQL.Add('select cheque.che_datpdep as Data_Para_Deposito, Cliente.cli_cod as Codigo, Cliente.cli_nom as Cliente,');
         SQL.Add('cheque.che_nom_emit as Emitente, cheque.che_dtaemi as Data_Emissao,');
         SQL.Add('cheque.che_datent as Data_Entrada, cheque.che_banco as Banco,');
         SQL.Add('cheque.che_agen as Agencia,  cheque.che_conta as Conta,');
         SQL.Add('cheque.che_num as Numero_Cheque, cheque.che_valor as Valor,');
         SQL.Add('cheque.ped_cod as Pedido from Cliente, cheque');
         SQL.Add('where Cheque.cli_cod=cliente.cli_cod and');
         SQL.Add('cheque.che_datpdep Between :nDataIni and :nDataFim order by cheque.che_datpdep');
         Prepare;
         ParamByName('nDataIni').AsDateTime := dtpIni.DateTime;
         ParamByName('nDataFim').AsDateTime := dtpFim.DateTime;
        end;
      5:Begin
         SQL.Add('select cheque.che_conta as Conta, Cliente.cli_cod as Codigo, Cliente.cli_nom as Cliente,');
         SQL.Add('cheque.che_nom_emit as Emitente, cheque.che_dtaemi as Data_Emissao,');
         SQL.Add('cheque.che_datent as Data_Entrada, cheque.che_datpdep as Data_Para_Deposito,');
         SQL.Add('cheque.che_banco as Banco, cheque.che_agen as Agencia,');
         SQL.Add('cheque.che_num as Numero_Cheque, cheque.che_valor as Valor,');
         SQL.Add('cheque.ped_cod as Pedido from Cliente, cheque');
         SQL.Add('where Cheque.cli_cod=cliente.cli_cod and');
         SQL.Add('cheque.che_conta like'+#39+Trim(edtConta.Text)+'%'+#39' order by cheque.che_conta');
        end;
     end;
    end;
  end;
end;

procedure TfrmCheque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dmSYS do
   begin
    dsCheque.AutoEdit := False;
    ibtCheque.Close;
   end;
  qryCheque.Close; 
  Action := caFree;
end;

procedure TfrmCheque.bitSairClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtCheque.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        ibtCheque.Cancel;
        Close;
       end;
     end
    else
      Close;
   end;
end;

procedure TfrmCheque.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   begin
    if ibtCheque.State in [dsInsert, dsEdit] then
     if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      begin
       AllowChange := True;
       ibtCheque.Cancel;
       Alter('I');
       pgcPadraoCad.TabIndex := 1;
       qryCheque.Open;    //Ativar a Query para trazer todos os registros
      end
     else
      begin
       AllowChange := False;
       if (qryCheque.Active = True) then
        qryCheque.Close;  //Desativar a Query
       Alter('A');
       pgcPadraoCad.TabIndex := 0;
      end;
     if (qryCheque.Active = True) then
      if pgcPadraoCad.TabIndex = 1 then
       LocCheque;
   end;
end;

procedure TfrmCheque.FormCreate(Sender: TObject);
begin
  inherited;
  with dmSYS do
   begin
    ibtCheque.Open;
    dsCheque.AutoEdit := True;
    ibtDep_Cheque.Open;
    dsDep_Cheque.AutoEdit := True;
    Alter('I');
    CarregaDatas(); //Carrega as Datas
    CarregaTipo(); //Carrega os Tipos de Cheque
    pgcPadraoCad.TabIndex := 0;
   end;
end;

procedure TfrmCheque.bitExcluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      LocCheque;
      if (ibtCheque.FieldByName('CHE_NUM').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
        Exit;
       end
      else
       begin
        ibtCheque.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          qryCheque.Close;
          qryCheque.Open;
         end;
       end;
     end;
   end;
  Alter('I'); //Chamada da alterção dos DBEdits
  CarregaDatas;   //Carrega as datas
  CarregaTipo;  //Carrega os Tipos de Cheque
end;

procedure TfrmCheque.bitIncluirClick(Sender: TObject);
begin
  inherited;
   with dmSYS do
   Begin
    uVariavel.insertCheque :=2;//Atribuição para poder identiciar qual procedimento foi chamado
    if (qryCheque.Active = True) then
     qryCheque.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtCheque.Append;
    Alter('A');    //Chamada da alterção dos DBEdits
    dbeCodCli.SetFocus;
    pnNomCli.Caption := '';
    dbcbTipo.ItemIndex := -1;
    dbcbTipo.ItemIndex := 0;
    dtpEmissao.DateTime := Date;
    dtpEntrada.DateTime := Date;
    dtpParaDeposito.DateTime := Date;
   end;
end;

procedure TfrmCheque.dbeNunChequeEnter(Sender: TObject);
begin
  inherited;
  if dbeCodCli.Text = '' then  begin
    dbeCodCli.SetFocus;
    ShowMessage('Cliente Invalido');
   end
  else
   begin
    if dbeBanco.Text = '' then begin
      dbeBanco.SetFocus;
      ShowMessage('Banco Invalido');
     end
    else
     begin
      if dbeAgencia.Text = '' then begin
        dbeAgencia.SetFocus;
        ShowMessage('Agencia Invalida');
       end
      else
       if dbeConta.Text = '' then begin
         dbeConta.SetFocus;
         ShowMessage('Conta Invalida');
        end;
     end;
   end;
end;

procedure TfrmCheque.dbeCodCliChange(Sender: TObject);
begin
  inherited;
  if dbeCodCli.Text <> '' then
   begin
    LocCli(StrToInt(dbeCodCli.Text));
    if (uVariavel.chamada = 'C') then
     begin
      dmSYS.ibtCheque.FieldByName('CLI_COD').AsInteger := StrToInt(dbeCodCli.Text);
     end;
   end
  else
    Begin
      pnNomCli.Caption := '';
    end;
end;

procedure TfrmCheque.bitCancelarClick(Sender: TObject);
begin
  inherited;
   with dmSYS do
   Begin
    if MessageDlg('Deseja Cancelar a Operação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      IF (uVariavel.insertCheque = 2) then
       begin
        ibtDep_Cheque.Cancel;
        ibtCheque.Delete;
       end
      else
       begin
        if (ibtDep_Cheque.State in [dsEdit]) then
         ibtDep_Cheque.CancelUpdates
        else
         ibtDep_Cheque.Cancel;
        ibtCheque.Cancel;
       end;
      Alter('I');  //Chamada da alterção dos DBEdits
      CarregaDatas;   //Carrega as datas
      CarregaTipo;    //Carrega os Tipos de Cheque
     end;
   end;
end;

procedure TfrmCheque.bitAlterarClick(Sender: TObject);
begin
  inherited;
  uVariavel.insertCheque := 1; //Atribuição para poder identiciar qual procedimento foi chamado
  LocCheque;
  Alter('C');  //Chamada da alterção dos DBEdits
  dmSYS.ibtCheque.Edit;
  bitConsCli.Enabled := False;
  bitConsCheque.Enabled := False;
  dbeValor.SetFocus;
  CarregaDatas; //Carrega as Datas
  CarregaTipo; //Carrega os Tipos de Cheque
end;

procedure TfrmCheque.bitConsCliClick(Sender: TObject);
begin
  inherited;
  if (dbeCodCli.ReadOnly = False) then
   begin
    uVariavel.chamada:= '1';
    Application.CreateForm(TfrmCliente,frmCliente);
    frmCliente.Show;
    frmCliente.pgcPadraoCad.TabIndex := 1;
    exit;
   end;
end;

procedure TfrmCheque.bitConsChequeClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmCheque.bitokClick(Sender: TObject);
begin
 inherited;
 with dmSYS do
  begin
   if (dbeCodCli.Text = '') then
    begin
     MessageDlg('Código Cliente em Branco',mtWarning,[mbOK],0);
     dbeCodCli.SetFocus;
     exit;
    end;
   if (dbeBanco.Text = '') then
    begin
     MessageDlg('Banco em Branco',mtWarning,[mbOK],0);
     dbeBanco.SetFocus;
     exit;
    end;
   if (dbeAgencia.Text = '') then
    begin
     MessageDlg('Agencia em Branco',mtWarning,[mbOK],0);
     dbeAgencia.SetFocus;
     exit;
    end;
   if (dbeConta.Text = '') then
    begin
     MessageDlg('Conta em Branco',mtWarning,[mbOK],0);
     dbeConta.SetFocus;
     exit;
    end;
   if (dbeNunCheque.Text = '') then
    begin
     MessageDlg('Numero do Cheque em Branco',mtWarning,[mbOK],0);
     dbeNunCheque.SetFocus;
     exit;
    end;
  if (dbeValor.Text = '') then
    begin
     MessageDlg('Valor em Branco',mtWarning,[mbOK],0);
     dbeValor.SetFocus;
     exit;
    end;
  if (dbcbTipo.ItemIndex = -1) then
    begin
     MessageDlg('Tipo em Branco',mtWarning,[mbOK],0);
     dbcbTipo.SetFocus;
     dbcbTipo.ItemIndex := 0;
     exit;
    end;

   if (ibtCheque.State in [dsInsert, dsEdit]) then
    begin
     ibtCheque.FieldByName('CHE_DATENT').AsDateTime := dtpEntrada.Date;
     ibtCheque.FieldByName('CHE_DTAEMI').AsDateTime := dtpEmissao.Date;
     ibtCheque.FieldByName('CHE_DATPDEP').AsDateTime := dtpParaDeposito.Date;

     if dbcbTipo.ItemIndex = 0 then
      dmSYS.ibtCheque.FieldByName('CHE_TIP').AsString := 'V'
     else
      if dbcbTipo.ItemIndex = 1 then
       dmSYS.ibtCheque.FieldByName('CHE_TIP').AsString := 'P';

     ibtCheque.Post;
     if (ibtDep_Cheque.State in [dsEdit, dsInsert]) then
      ibtDep_Cheque.Post;
     if not(uVariavel.insertCheque = 0) then
      begin
       Alter('I');
       uVariavel.insertCheque := 0;
      end;
     ibtSYS_DATABASE.CommitRetaining;
    end;

  end;
 CarregaDatas; //Carrega as Datas
 CarregaTipo; //Carrega os Tipos de Cheque
end;

procedure TfrmCheque.dbnNavegacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  CarregaDatas; //Carrega as Datas
  CarregaTipo; //Carrega os Tipos de Cheque
end;

procedure TfrmCheque.dbgSitChequeEnter(Sender: TObject);
begin
  inherited;
  if (dmSYS.ibtCheque.State in [dsInsert]) and (dbeCodCli.Text <> '') and
     (dbeBanco.Text <> '') and (dbeAgencia.Text <> '') and (dbeConta.Text <> '') and
     (dbeNunCheque.Text <> '') then
   if (uVariavel.insertCheque = 2) then
    begin
     dmSYS.ibtCheque.Post;
     dmSYS.ibtSYS_DATABASE.CommitRetaining;
     dmSYS.ibtCheque.Edit;
     dmSYS.ibtDep_Cheque.Open;
    end;
end;

procedure TfrmCheque.cbFiltroChange(Sender: TObject);
procedure Consulta(CliEmi,dta, Conta : Boolean);
  begin
   lbdateIni.Visible := dta;
   lbDateFim.Visible := dta;
   dtpIni.Visible := dta;
   dtpFim.Visible := dta;
   bitokdtp.Visible := dta;
   lbNome.Visible := CliEmi;
   edtBusc.Visible := CliEmi;
   lbConta.Visible := Conta;
   edtConta.Visible := Conta;
  end;
begin
  inherited;
  dtpIni.DateTime := Date;
  dtpFim.DateTime := Date;
  if (cbFiltro.ItemIndex = -1) then
   begin
    Consulta(False,False,False);
    exit;
   end;
  if (cbFiltro.ItemIndex = 0) or (cbFiltro.ItemIndex = 1) then
   begin
    Consulta(True,False,False);
    edtBusc.SetFocus;
    exit;
   end
  else
   begin
    if (cbFiltro.ItemIndex = 2) or (cbFiltro.ItemIndex = 3) or
       (cbFiltro.ItemIndex = 4) then
     begin
      Consulta(False,True,False);
      dtpIni.SetFocus;
      exit;
     end
    else
     if (cbFiltro.ItemIndex = 5) then
      begin
       Consulta(False,False,True);
       edtConta.SetFocus;
       exit;
      end;
  end;
end;

procedure TfrmCheque.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  qryCheque.Open;
end;

procedure TfrmCheque.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  if (dbnNavegacao.Enabled = False) then
   dbnNavegacao.Enabled := True;
end;

procedure TfrmCheque.GroupBox2Enter(Sender: TObject);
begin
  inherited;
  frmCheque.KeyPreview := False;
end;

procedure TfrmCheque.GroupBox2Exit(Sender: TObject);
begin
  inherited;
  frmCheque.KeyPreview := True;
end;

procedure TfrmCheque.sbExcluirClick(Sender: TObject);
begin
 if not(dmSYS.ibtDep_Cheque.FieldByName('DEP_NUM').IsNull) then
  dmSYS.ibtDep_Cheque.Delete;
end;

procedure TfrmCheque.edtBuscChange(Sender: TObject);
begin
 SQL();
end;

procedure TfrmCheque.bitokdtpClick(Sender: TObject);
begin
 if dtpIni.Date > dtpFim.Date then
  ShowMessage('Período Invalida')
 else
  SQL();
end;

end.
