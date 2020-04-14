unit uUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ComCtrls, ExtCtrls, DBCtrls, StdCtrls, Buttons, ToolWin, IBTable, Mask;

type
  TfrmUsuario = class(TfrmPadraoCadastro)
    ibqUsuario: TIBQuery;
    dsConsulta: TDataSource;
    Label1: TLabel;
    dbeNome: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    bitConsUser: TBitBtn;
    Label5: TLabel;
    edtConfSenha: TEdit;
    edtSenha: TEdit;
    Label4: TLabel;
    dbeCod: TDBEdit;
    dbeDesc: TDBMemo;
    ibqUsuarioUSE_COD: TIntegerField;
    ibqUsuarioNOME: TIBStringField;
    ibqUsuarioUSE_DESC: TBlobField;
    function Criptografia(mStr, mChave: string): string;
    procedure Alter(sit: Char);
    procedure bitConsUserClick(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure bitSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure dbnNavegacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure bitExcluirClick(Sender: TObject);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure ibqUsuarioUSE_DESCGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

uses udmSYS;


{$R *.dfm}

function TfrmUsuario.Criptografia(mStr, mChave: string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
  Result := mStr;
  TamanhoString := Length(mStr);
  TamanhoChave := Length(mChave);   //A função Criptografia pode ser usada para criptografar a senha acesso ao sistema.
  for i := 1 to TamanhoString do    //Ela é usada nos dois sentidos, para criptografar e descriptografar,
  begin                             //desde que seja usada a mesma chave nas duas operações. "mStr" é a String que vai ser
  pos := (i mod TamanhoChave);      //criptografada e "mChave" é a String que sera usada como base para fazer a criptografia.
  if pos = 0 then
  pos := TamanhoChave;
  posLetra := ord(Result[i]) xor ord(mChave[pos]);
  if posLetra = 0 then
  posLetra := ord(Result[i]);
  Result[i] := chr(posLetra);
  end;
end;


procedure TfrmUsuario.Alter(sit: Char);  //Alterar Sistuação dos DBEdits para poder Alterar para (Sim ou Não)
 procedure alteravalor(TF: Boolean);
  begin
    dbeNome.ReadOnly := TF;
    dbeDesc.ReadOnly := TF;
    edtsenha.ReadOnly := TF;
    edtConfSenha.ReadOnly := TF;
  end;
begin
  if (sit = 'I') then
    Begin
     alteravalor(True);
     Botoes('O');
    end;
  if (sit = 'A') then
    Begin
     alteravalor(False);
     Botoes('I');
    end;
end;

procedure TfrmUsuario.bitConsUserClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmUsuario.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  dbnNavegacao.Enabled := False;
  Alter('I');
  ibqUsuario.Open;
end;

procedure TfrmUsuario.bitSairClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtUsuario.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        ibtUsuario.Cancel;
        Close;
       end;
      end
     else
      Close;
    end;
end;

procedure TfrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dmSYS do
    Begin
      ibtUsuario.Close;
      dsUsuario.AutoEdit := False;
    end;
  Action := caFree;
end;

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  with dmSYS do
    Begin
      ibtUsuario.Open;
      Alter('I');  //Chamada da alterção dos DBEdits
      dsUsuario.AutoEdit := True;
      pgcPadraoCad.TabIndex := 0;
      edtSenha.Text := Criptografia(ibtUsuario.FieldByName('SENHA').AsString,dbeNome.Text);
      edtConfSenha.Text := edtSenha.Text;
    end;
end;

procedure TfrmUsuario.bitCancelarClick(Sender: TObject);
begin
  inherited;
  dmSYS.ibtUsuario.Cancel;
  Alter('I'); //Chamada da alterção dos DBEdits
  bitConsUser.Enabled := True;
end;

procedure TfrmUsuario.bitAlterarClick(Sender: TObject);
begin
  inherited;
  if  pgcPadraoCad.TabIndex = 1 then
    Begin
      dmSYS.ibtUsuario.Locate('NOME',ibqUsuario.FieldByName('NOME').Value,[loCaseInsensitive]);
      ibqUsuario.Close;
      pgcPadraoCad.TabIndex := 0;
    end;
  Alter('A'); //Chamada da alterção dos DBEdits
  bitConsUser.Enabled := False;
  dmSYS.ibtUsuario.Edit;
end;

procedure TfrmUsuario.bitIncluirClick(Sender: TObject);
var cont:Integer;
begin
  inherited;
  with dmSYS do
   Begin
    ibqUsuario.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtUsuario.Last;                                          // Linha 1
    cont:=1;                                                   // Linha 2
    cont:=cont+ibtUsuario.FieldByName('USE_COD').AsInteger;   // Linha 3
    ibtUsuario.Append;                      //Referece a inserção do codigo automatico na hora da inclusão Linhas 1,2,3
    Alter('A');    //Chamada da alterção dos DBEdits
    ibtUsuario.FieldByName('USE_COD').AsInteger := cont; //Atribuindo o codigo ao campo referente as Linas 1,2,3
    edtSenha.Clear;
    edtConfSenha.Clear;
    dbeNome.SetFocus;
    bitConsUser.Enabled := False;
   end;
end;

procedure TfrmUsuario.bitokClick(Sender: TObject);
var SenhaCrip:String;
begin
  inherited;
  with dmSYS do
   Begin
    if (dbeNome.Text = '') then    //Validação do Nome
     begin
      Botoes('I');
      MessageDlg('Nome em Branco',mtInformation, [mbOK], 0);
      dbeNome.SetFocus;
      Exit;
     end
    else
     begin
      if (edtSenha.Text = '') then
        begin
         Botoes('I');
         MessageDlg('Senha em Branco', mtInformation, [mbOK],0);
         edtSenha.SetFocus;
         Exit;
        end
       else
        if (edtSenha.Text <> edtConfSenha.Text) then
         begin
          Botoes('I');
          MessageDlg('Senha não Confere', mtInformation, [mbOK],0);
          edtSenha.SetFocus;
          Exit;
         end
      else
       begin
        SenhaCrip := Criptografia(edtSenha.Text,dbeNome.Text);
        ibtUsuario.FieldByName('SENHA').AsString := SenhaCrip;
        ibtUsuario.Post;
        Alter('I');  //Chamada da alterção dos DBEdits
        bitConsUser.Enabled := True;
       end;
      end;
   end;
  dmSYS.ibtSYS_DATABASE.CommitRetaining;
end;

procedure TfrmUsuario.edtSenhaExit(Sender: TObject);
begin
  inherited;
  if (edtSenha.Text = dbeNome.Text) then
    Begin
     MessageDlg('Senha deve ser diferente ao "Nome"', mtInformation, [mbOK],0);
     edtSenha.Clear;
     edtSenha.SetFocus;
    end;
end;

procedure TfrmUsuario.tbsCadastroShow(Sender: TObject);
var cod:String;
begin
  inherited;
  cod:='';
  if (dbnNavegacao.Enabled = False) then
   dbnNavegacao.Enabled := True;
  if (ibqUsuario.Active = True) then
   begin
    if not(ibqUsuario.FieldByName('Nome').IsNull) then
     cod := ibqUsuario.FieldByName('Nome').Value;
    if (cod <> '') then
     Begin
      ibqUsuario.Close;
      dmSYS.ibtUsuario.Locate('',cod,[loCaseInsensitive]);
     end;
   end;
  if (ibqUsuario.Active = True) then
    ibqUsuario.Close;
  edtSenha.Text := Criptografia(dmSYS.ibtUsuario.FieldByName('SENHA').AsString,dbeNome.Text);
  edtConfSenha.Text := edtSenha.Text;
end;

procedure TfrmUsuario.dbnNavegacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  edtSenha.Text := Criptografia(dmSYS.ibtUsuario.FieldByName('SENHA').AsString,dbeNome.Text);
  edtConfSenha.Text := edtSenha.Text;
end;

procedure TfrmUsuario.bitExcluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtUsuario.Locate('USE_COD',ibqUsuario.FieldByName('USE_COD').Value,[loCaseInsensitive]);
       end;
      if (ibtUsuario.FieldByName('USE_COD').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
        Exit;
       end
      else
       begin
        ibtUsuario.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          ibqUsuario.Close;
          ibqUsuario.Open;
         end;
       end;
     end;
   end;
  Alter('I');  //Chamada da alterção dos DBEdits
  if (pgcPadraoCad.TabIndex = 0) then
   begin
    tbsCadastroShow(bitExcluir);
   end;
end;

procedure TfrmUsuario.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtUsuario.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
       Begin
        AllowChange := True;
        ibtUsuario.Cancel;
        Alter('I');
        pgcPadraoCad.TabIndex := 1;
        ibqUsuario.Open;    //Ativar a Query para trazer todos os registros
       end
      else
       Begin
        AllowChange := False;
        if (ibqUsuario.Active = True) then
          ibqUsuario.Close;  //Desativar a Query
        Alter('A');
        pgcPadraoCad.TabIndex := 0;
       end;
     end;
   end;
end;

procedure TfrmUsuario.ibqUsuarioUSE_DESCGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  Text := Sender.AsString;
end;

end.
