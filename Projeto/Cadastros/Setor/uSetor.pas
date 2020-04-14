unit uSetor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, ToolWin, DB, Mask, IBCustomDataSet, IBTable, IBQuery;

type
  TfrmSetor = class(TfrmPadraoCadastro)
    lbCod: TLabel;
    dbeCod: TDBEdit;
    lbNome: TLabel;
    dbeNome: TDBEdit;
    lbDesc: TLabel;
    dbeDesc: TDBEdit;
    bitConsSetor: TBitBtn;
    ibqSetor: TIBQuery;
    dsConsulta: TDataSource;
    ibqSetorSET_COD: TIntegerField;
    ibqSetorSET_DESC: TIBStringField;
    ibqSetorSET_NOM: TIBStringField;
    procedure Alter(sit: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bitConsSetorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitSairClick(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetor: TfrmSetor;

implementation

uses udmSYS, uVariavel, uMesa;

{$R *.dfm}

procedure TfrmSetor.Alter(sit: Char);   //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
 procedure alteravalor(TF:Boolean);
  begin
   dbeNome.ReadOnly := TF;
   dbeDesc.ReadOnly := TF;
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
end;

procedure TfrmSetor.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (uVariavel.chamada <> '0') then
     begin
      ibtSetor.Locate('SET_COD',ibqSetor.FieldByName('SET_COD').Value,[loCaseInsensitive]);
      uVariavel.chamada := 'C';
      frmMesa.dbeCodSet.Text := ibtSetor.FieldByName('SET_COD').Value;
      uVariavel.chamada := '0';
      Close;
     end;
   end;
end;

procedure TfrmSetor.bitConsSetorClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmSetor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dmSYS do
    Begin
      ibtSetor.Close;
      dsSetor.AutoEdit := False;
      Action := caFree;
    end;
end;

procedure TfrmSetor.FormCreate(Sender: TObject);
begin
  inherited;
  with dmSYS do
    Begin
      ibtSetor.Open;
      dsSetor.AutoEdit := True;
      Alter('I');  //Chamada da alterção dos DBEdits
      pgcPadraoCad.TabIndex := 0;
    end;
end;

procedure TfrmSetor.bitIncluirClick(Sender: TObject);
var
  cont: integer;
begin
  inherited;
  with dmSYS do
   Begin
    if (ibqSetor.Active = True) then
     ibqSetor.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtSetor.Last;                                        //Linha 1
    cont:=1;                                              //Linha 2
    cont:=cont+ibtSetor.FieldByName('SET_COD').AsInteger; //Linha 3
    ibtSetor.Append;                          //Referece a inserção do codigo automatico na hora da inclusão Linhas 1,2,3
    Alter('A');    //Chamada da alterção dos DBEdits
    ibtSetor.FieldByName('SET_COD').AsInteger := cont;  //Atribuindo o codigo ao campo referente as Linas 1,2,3
    dbeNome.SetFocus;
    bitConsSetor.Enabled := False;
   end;
end;

procedure TfrmSetor.bitokClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtSetor.FieldByName('SET_NOM').IsNull then
     begin
      Botoes('I');
      MessageDlg('Nome em branco!', mtInformation, [mbOk], 0);
      dbeNome.SetFocus;
      Exit;
     end;                     //Validação de Nome caso esteja em branco
    ibtSetor.Post;
    Alter('I');   //Chamada da alterção dos DBEdits
    bitConsSetor.Enabled := True;
   end;
  dmSYS.ibtSYS_DATABASE.CommitRetaining;
end;

procedure TfrmSetor.bitAlterarClick(Sender: TObject);
begin
  inherited;
  if  pgcPadraoCad.TabIndex = 1 then
   Begin
    dmSYS.ibtSetor.Locate('SET_COD',ibqSetor.FieldByName('SET_COD').Value,[loCaseInsensitive]);
    ibqSetor.Close;
    pgcPadraoCad.TabIndex := 0;
   end;
  Alter('A');  //Chamada da alterção dos DBEdits
  bitConsSetor.Enabled := False;
  dmSYS.ibtSetor.Edit;
end;

procedure TfrmSetor.bitExcluirClick(Sender: TObject);
begin
  inherited;
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtSetor.Locate('SET_COD',ibqSetor.FieldByName('SET_COD').Value,[loCaseInsensitive]);
       end;
      if (ibtSetor.FieldByName('SET_COD').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
        Exit;
       end
      else
       begin
        ibtSetor.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          ibqSetor.Close;
          ibqSetor.Open;
         end;
       end;
     end;
   end;
  Alter('I'); //Chamada da alterção dos DBEdits
end;

procedure TfrmSetor.bitCancelarClick(Sender: TObject);
begin
  inherited;
  dmSYS.ibtSetor.Cancel;
  Alter('I'); //Chamada da alterção dos DBEdits
  bitConsSetor.Enabled := True;
end;

procedure TfrmSetor.bitSairClick(Sender: TObject);
begin
  inherited;
    with dmSYS do
   Begin
    if ibtSetor.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        ibtSetor.Cancel;
        Close;
       end;
     end
    else
     Close;
   end;
end;

procedure TfrmSetor.tbsCadastroShow(Sender: TObject);
var cod:Integer;
begin
  inherited;
  cod:=0;
  if (dbnNavegacao.Enabled = False) then
   dbnNavegacao.Enabled := True;
  if (ibqSetor.Active = True) then
   begin
    if not(ibqSetor.FieldByName('SET_COD').IsNull) then
      cod := ibqSetor.FieldByName('SET_COD').Value;
    if ( cod <> 0) then
     Begin
      ibqSetor.Close;
      dmSYS.ibtSetor.Locate('SET_COD',cod,[loCaseInsensitive]);
      Alter('I'); //Chamada da alterção dos DBEdits
     end;
   end;
  if (ibqSetor.Active = True) then
    ibqSetor.Close;
end;

procedure TfrmSetor.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  dbnNavegacao.Enabled := False;
  Alter('I');
  ibqSetor.Open;
end;

procedure TfrmSetor.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtSetor.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
       Begin
        AllowChange := True;
        ibtSetor.Cancel;
        Alter('I');
        pgcPadraoCad.TabIndex := 1;
        ibqSetor.Open;    //Ativar a Query para trazer todos os registros
       end
      else
       Begin
        AllowChange := False;
        if (ibqSetor.Active = True) then
          ibqSetor.Close;  //Desativar a Query
        Alter('A');
        pgcPadraoCad.TabIndex := 0;
       end;
     end;
   end;  
end;

end.
