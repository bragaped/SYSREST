unit uCod_Fiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls,
  ExtCtrls, Buttons, ToolWin, DB, IBCustomDataSet, IBQuery, IBUpdateSQL;

type
  TfrmCod_Fiscal = class(TfrmPadraoCadastro)
    dbeCodigo: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbeCodContabil: TDBEdit;
    dbeCFOP1: TDBEdit;
    dbeCFOP3: TDBEdit;
    dbeCFOP2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbeNatOper: TDBEdit;
    dbeDesc: TDBMemo;
    Label5: TLabel;
    dbcbTipoIPI: TDBComboBox;
    dbcbTipo: TDBComboBox;
    dbcbTipoICM: TDBComboBox;
    cbGera: TDBCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ibqCodFiscal: TIBQuery;
    dsConsulta: TDataSource;
    ibqCodFiscalFISC_COD: TIntegerField;
    ibqCodFiscalFISC_CODCONTABIL: TIntegerField;
    ibqCodFiscalCFOP1: TIntegerField;
    ibqCodFiscalCFOP2: TIntegerField;
    ibqCodFiscalCFOP3: TIntegerField;
    ibqCodFiscalFISC_TIPO: TIBStringField;
    bitConsCodFisc: TBitBtn;
    procedure Alter(Sit: Char);
    procedure Tipo();
    procedure TipoIPI();
    procedure TipoICM();
    procedure Gera();
    procedure bitSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeCFOP1Exit(Sender: TObject);
    procedure dbeNatOperExit(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure dbnNavegacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure tbsConsultaShow(Sender: TObject);
    procedure bitConsCodFiscClick(Sender: TObject);
    procedure dbgConsClick(Sender: TObject);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCod_Fiscal: TfrmCod_Fiscal;

implementation

uses uCompra, udmSYS, uPrincipal, uVariavel;

{$R *.dfm}


procedure TfrmCod_Fiscal.Alter(sit: Char);   //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
 procedure alteraValor(TF,FT:Boolean);
  begin
   dbeCodContabil.ReadOnly := TF;
   dbeCFOP1.ReadOnly := TF;
   dbeCFOP2.ReadOnly := TF;
   dbeCFOP3.ReadOnly := TF;
   dbeNatOper.ReadOnly := TF;
   dbeDesc.ReadOnly := TF;
   dbcbTipo.Enabled := FT;
   dbcbTipoIPI.Enabled := FT;
   dbcbTipoICM.Enabled := FT;
   cbGera.ReadOnly := TF;
  end;
begin
  case sit of
   'I':Begin  //Permição de Altração negada
        alteraValor(True,False);
        Botoes('O'); //chamada da Ativação dos Botões
       end;
   'A':Begin  //Permição de Altração Autorizada
        alteraValor(False,True);
        Botoes('I'); //chamada da Ativação dos Botões
       end;
  end;
end;

procedure TfrmCod_Fiscal.Tipo();
Begin
 with dmSYS.ibtCod_Fiscal do           //Seleção do tipo da Operação
  Begin
   dbcbTipo.ItemIndex := -1;
   if (FieldByName('FISC_TIPO').AsString = 'E') then
    dbcbTipo.ItemIndex := 0
   else
    if (FieldByName('FISC_TIPO').AsString = 'S') then
     dbcbTipo.ItemIndex := 1
    else
     if (FieldByName('FISC_TIPO').AsString = 'N') then
      dbcbTipo.ItemIndex := 2;
  end;
end;

procedure TfrmCod_Fiscal.TipoIPI();
Begin
 with dmSYS.ibtCod_Fiscal do           //Seleção do tipo de IPI
  Begin
   dbcbTipoIPI.ItemIndex := -1;
   if (FieldByName('FISC_TIPOIPI').AsString = 'I') then
    dbcbTipoIPI.ItemIndex := 0
   else
    if (FieldByName('FISC_TIPOIPI').AsString = 'T') then
     dbcbTipoIPI.ItemIndex := 1
    else
     if (FieldByName('FISC_TIPOIPI').AsString = 'O') then
      dbcbTipoIPI.ItemIndex := 2;
  end;
end;

procedure TfrmCod_Fiscal.TipoICM();
Begin
 with dmSYS.ibtCod_Fiscal do           //Seleção do tipo de ICM
  Begin
   dbcbTipoICM.ItemIndex := -1;
   if (FieldByName('FISC_TIPOICM').AsString = 'I') then
    dbcbTipoICM.ItemIndex := 0
   else
    if (FieldByName('FISC_TIPOICM').AsString = 'T') then
     dbcbTipoICM.ItemIndex := 1
    else
     if (FieldByName('FISC_TIPOICM').AsString = 'O') then
      dbcbTipoICM.ItemIndex := 2;
  end;
end;

procedure TfrmCod_Fiscal.Gera();   //Verificação se Gera Contas
Begin
  with dmSYS do
    Begin
      if (ibtProduto.FieldByName('Pro_Sit').AsString ='S') then
        cbGera.Checked := True
      else
        if (ibtProduto.FieldByName('Pro_Sit').AsString = 'N') then
          cbGera.Checked := False;
    end;
end;

procedure TfrmCod_Fiscal.bitSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCod_Fiscal.FormCreate(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    ibtCod_Fiscal.Open;
    dsCod_Fiscal.AutoEdit := True;
    Alter('I');  //Chamada da alterção dos DBEdits
    pgcPadraoCad.TabIndex := 0;
   end;
  Tipo();      //Seleção do tipo de Operação
  TipoICM();   //Seleção do tipo de ICM
  TipoIPI();   //Seleção do tipo de IPI
  Gera();      //Seleção Gera Contas
end;

procedure TfrmCod_Fiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with dmSYS do
   begin
    ibtCod_Fiscal.Close;
    dsCod_Fiscal.AutoEdit := False;
    Action := caFree;
   end;
end;

procedure TfrmCod_Fiscal.dbeCFOP1Exit(Sender: TObject);
begin
  inherited;
  if (dbeCFOP1.Text = '0') then
   begin
    dbeCFOP1.SetFocus;
    Exit;
   end;
end;

procedure TfrmCod_Fiscal.dbeNatOperExit(Sender: TObject);
begin
  inherited;
  if (dbeNatOper.Text = '') then
   begin
    dbeNatOper.SetFocus;
    Exit;
   end;
end;

procedure TfrmCod_Fiscal.bitCancelarClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    ibtCod_Fiscal.Cancel;
    Alter('I');  //Chamada da alterção dos DBEdits
    Tipo();      //Seleção do tipo da Operação
    TipoICM();   //Seleção do tipo de ICM
    TipoIPI();   //Seleção do tipo de IPI
    Gera();      //Seleção Gera Contas
    bitConsCodFisc.Enabled := True;
   end;
end;

procedure TfrmCod_Fiscal.bitExcluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtCod_Fiscal.Locate('FISC_COD',ibqCodFiscal.FieldByName('Código').Value,[loCaseInsensitive]);
       end;
      if (ibtCod_Fiscal.FieldByName('FISC_COD').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
        Exit;
       end
      else
       begin
        ibtCod_Fiscal.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          ibqCodFiscal.Close;
          ibqCodFiscal.Open;
         end;
       end;
     end;
   end;
  Alter('I');  //Chamada da alterção dos DBEdits
  Tipo();      //Seleção do tipo de Operação
  TipoICM();   //Seleção do tipo de ICM
  TipoIPI();   //Seleção do tipo de IPI
  Gera();      //Seleção Gera Contas
end;

procedure TfrmCod_Fiscal.bitAlterarClick(Sender: TObject);
begin
  inherited;
  if  pgcPadraoCad.TabIndex = 1 then
   Begin
    dmSYS.ibtCod_Fiscal.Locate('FISC_COD',ibqCodFiscal.FieldByName('FISC_COD').Value,[loCaseInsensitive]);
    ibqCodFiscal.Close;
    pgcPadraoCad.TabIndex := 0;
   end;
  Alter('A');  //Chamada da alterção dos DBEdits
  dmSYS.ibtCod_Fiscal.Edit;
  Tipo();      //Seleção do tipo de Operação
  TipoICM();   //Seleção do tipo de ICM
  TipoIPI();   //Seleção do tipo de IPI
  Gera();      //Seleção Gera Contas
  dbeCodContabil.SetFocus;
  bitConsCodFisc.Enabled := False;
end;

procedure TfrmCod_Fiscal.bitIncluirClick(Sender: TObject);
var cont: Integer;
begin
  inherited;
  with dmSYS do
   Begin
    if (ibqCodFiscal.Active = True) then
     ibqCodFiscal.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtCod_Fiscal.Last;                                        //Linha 1
    cont:=1;                                                //Linha 2
    cont:=cont+ibtCod_Fiscal.FieldByName('FISC_COD').AsInteger; //Linha 3
    ibtCod_Fiscal.Append;                          //Referece a inserção do codigo automatico na hora da inclusão Linhas 1,2,3
    Alter('A');    //Chamada da alterção dos DBEdits
    ibtCod_Fiscal.FieldByName('FISC_COD').AsInteger := cont;  //Atribuindo o codigo ao campo referente as Linas 1,2,3
    dbeCodContabil.SetFocus;
    cbGera.Checked := True;
    dbcbTipo.ItemIndex := 2;
    dbcbTipoIPI.ItemIndex := -1;
    dbcbTipoICM.ItemIndex := -1;
    bitConsCodFisc.Enabled := False;
   end;
end;

procedure TfrmCod_Fiscal.bitokClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (dbeNatOper.Text = '') then
     begin
      MessageDlg('Natureza da Operação em Branco', mtWarning, [mbOK],0);
      dbeNatOper.SetFocus;
      exit;
     end;
    if (dbeCFOP1.Text = '') then
     begin
      MessageDlg('CFOP em Branco', mtWarning, [mbOK],0);
      dbeCFOP1.SetFocus;
      exit;
     end;
    if (dbcbTipo.ItemIndex = -1) then
     begin
      dbcbTipo.ItemIndex := 2;
     end;
    case (dbcbTipo.ItemIndex) of
     0:ibtCod_Fiscal.FieldByName('FISC_TIPO').AsString := 'E';
     1:ibtCod_Fiscal.FieldByName('FISC_TIPO').AsString := 'S';
     2:ibtCod_Fiscal.FieldByName('FISC_TIPO').AsString := 'N';
    end;
    case (dbcbTipoIPI.ItemIndex) of
     0:ibtCod_Fiscal.FieldByName('FISC_TIPOIPI').AsString := 'I';
     1:ibtCod_Fiscal.FieldByName('FISC_TIPOIPI').AsString := 'T';
     2:ibtCod_Fiscal.FieldByName('FISC_TIPOIPI').AsString := 'O';
    end;
    case (dbcbTipoIPI.ItemIndex) of
     0:ibtCod_Fiscal.FieldByName('FISC_TIPOICM').AsString := 'I';
     1:ibtCod_Fiscal.FieldByName('FISC_TIPOICM').AsString := 'T';
     2:ibtCod_Fiscal.FieldByName('FISC_TIPOICM').AsString := 'O';
    end;
    ibtCod_Fiscal.Post;
    Alter('I');   //Chamada da alterção dos DBEdits
   end;
  dmSYS.ibtSYS_DATABASE.CommitRetaining;
  Tipo();      //Seleção do tipo de Operação
  TipoICM();   //Seleção do tipo de ICM
  TipoIPI();   //Seleção do tipo de IPI
  Gera();      //Seleção Gera Contas
  bitConsCodFisc.Enabled := True;
end;

procedure TfrmCod_Fiscal.dbnNavegacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  Tipo();      //Seleção do tipo de Operação
  TipoICM();   //Seleção do tipo de ICM
  TipoIPI();   //Seleção do tipo de IPI
  Gera();      //Seleção Gera Contas
end;

procedure TfrmCod_Fiscal.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  ibqCodFiscal.Open;
end;

procedure TfrmCod_Fiscal.bitConsCodFiscClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmCod_Fiscal.dbgConsClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (uVariavel.chamada <> '0') then
     begin
      ibtCod_Fiscal.Locate('FISC_COD',ibqCodFiscal.FieldByName('FISC_COD').Value,[loCaseInsensitive]);
      case uVariavel.chamada of
       '1':Begin
            if (ibtCod_Fiscal.FieldByName('FISC_TIPO').AsString = 'E') then
             begin
              uVariavel.chamada := 'C';
              frmCompra.dbeCod_Fisc.Text := ibtCod_Fiscal.FieldByName('FISC_COD').Value;
              uVariavel.chamada := '0';
              Close;
             end
            else
             begin
              MessageDlg('Código Fiscal Invalido'+#13+#13+'SELECIONE UM DO TIPO ENTRADA', mtWarning,[mbOK],0);
              dbgCons.SetFocus;
             end;
           End;
      end;
     end;
   end;
end;

procedure TfrmCod_Fiscal.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   begin
    if ibtCod_Fiscal.State in [dsInsert, dsEdit] then
     if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      begin
       AllowChange := True;
       ibtCod_Fiscal.Cancel;
       Alter('I');
       pgcPadraoCad.TabIndex := 1;
       ibqCodFiscal.Open;    //Ativar a Query para trazer todos os registros
      end
     else
      begin
       AllowChange := False;
       if (ibqCodFiscal.Active = True) then
        ibqCodFiscal.Close;  //Desativar a Query
       Alter('A');
       pgcPadraoCad.TabIndex := 0;
      end;
   end;
end;

end.
