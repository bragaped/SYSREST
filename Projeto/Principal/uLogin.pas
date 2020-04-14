unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, DBCtrls, Mask,
  IniFiles;

type
  TfrmLogin = class(TForm)
    ibqUsuario: TIBQuery;
    dsConsulta: TDataSource;
    BitOK: TBitBtn;
    bitCancelar: TBitBtn;
    lbUsuario: TLabel;
    lbSenha: TLabel;
    edtUser: TEdit;
    edtSenha: TEdit;
    procedure BitOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses udmSYS, uPrincipal, uCidade, uCliente, uFornecedor, uVariavel,
  uUsuario;

{$R *.dfm}

procedure TfrmLogin.BitOKClick(Sender: TObject);
var qryLogin :TIBQuery;
begin
 with dmSYS do
  Begin
   if (edtUser.Text <> '') then
    Begin
     qryLogin := TIBQuery.Create(Self);
     qryLogin.Database := ibdSYS_DATABASE;
     qryLogin.Close;
     qryLogin.SQL.Add('select NOME, SENHA, USE_COD from USUARIO');
     qryLogin.SQL.Add('where NOME = :Usuario');
     qryLogin.Prepare;
     qryLogin.ParamByName('Usuario').AsString := edtUser.Text;
     qryLogin.Open;
     if qryLogin.IsEmpty then
      Begin
        MessageDlg('Usuario Invalido!',mtWarning,[mbOK],0);
        edtUser.SetFocus;
      end
     else
      begin
        if not (qryLogin.FieldByName('SENHA').AsString =
                frmUsuario.Criptografia(edtSenha.Text, edtUser.Text)) then
          begin
            MessageDlg('Senha Invalida!',mtWarning,[mbOK],0);
            edtSenha.SetFocus;
          end
        else
          Begin
            frmLogin.Release;
            uVariavel.User:= edtUser.Text;
            uVariavel.codUser := qryLogin.FieldByName('USE_COD').AsInteger;
            Principal.Show;
            Close;
          end;
      end;
    end
   else
    begin
     MessageDlg('Usuario Invalido!',mtWarning,[mbOK],0);
     edtUser.SetFocus;
    end;
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLogin.bitCancelarClick(Sender: TObject);
begin
  Close;
  Application.Terminate;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Begin
      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    End;
  if Key = #27 then
    Perform(WM_NEXTDLGCTL, 1, 0);
  if Key = #17 then
   begin
    Abort;
    Key := #0;
   end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var  config: TIniFile;
     Result: String;
begin
 with dmSYS do
  Begin
    ibtSYS_DATABASE.Active := False;
    ibdSYS_DATABASE.Close;
    config := TIniFile.Create(ExtractFilePath(Application.ExeName)+'CONFIG.INI');
    Result := config.ReadString('ALIAS','DataBase','');
    ibdSYS_DATABASE.DatabaseName := Result;
    config.Free;
    if (ibdSYS_DATABASE.DatabaseName = '') then
      Begin
        MessageDlg('Banco de Dados Não Encontrado, O Sistema Será Finalizado!',mtError,[mbOK],0);
        frmLogin.Close;
        frmLogin.Free;
      end
      else
       Begin
        ibdSYS_DATABASE.Open;
        ibtSYS_DATABASE.Active := True;
        ibtUsuario.Open;
       end;
  end;
end;

procedure TfrmLogin.FormDeactivate(Sender: TObject);
begin
 frmLogin.FreeOnRelease;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

end.
