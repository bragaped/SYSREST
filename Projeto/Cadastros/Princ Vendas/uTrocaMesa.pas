unit uTrocaMesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Buttons;

type
  TfrmTrocaMesa = class(TForm)
    Label1: TLabel;
    cbMesas: TComboBox;
    Label2: TLabel;
    pnMesaAtual: TPanel;
    bitOK: TBitBtn;
    bitCancelar: TBitBtn;
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrocaMesa: TfrmTrocaMesa;

implementation

uses udmSYS, DB, ugridPedido;

{$R *.dfm}

procedure TfrmTrocaMesa.bitCancelarClick(Sender: TObject);
begin
 close;
end;

procedure TfrmTrocaMesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmTrocaMesa.bitOKClick(Sender: TObject);
var mesa : String;
begin
 mesa := cbMesas.Text;
 if Length(mesa) = 7 then
  mesa := mesa[7]
 else
  if Length(mesa) = 8 then
   mesa := mesa[7]+mesa[8];

 if MessageDlg('Confirma a Troca da Mesa: '+dmSYS.ibtPedido.FieldByName('MESA_COD').AsString
             +' para Mesa: '+mesa, mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
   dmSYS.ibtPedido.Edit;
   dmSYS.ibtPedido.FieldByName('PED_COD').AsInteger;
   dmSYS.ibtPedido.FieldByName('MESA_COD').AsInteger := StrToInt(mesa);
   dmSYS.ibtPedido.Post;
   dmSYS.ibtSYS_DATABASE.CommitRetaining;
   ShowMessage('Operação Concluida com Sucesso!!!');
   frmGridPedido.cdsMesas.Locate('codigo',StrToInt(mesa),[loCaseInsensitive]);
   Close;

  end
 else
  begin
   ShowMessage('Operação Cancelada!!!');
  end;
end;

procedure TfrmTrocaMesa.FormCreate(Sender: TObject);
begin
 pnMesaAtual.Caption := 'MESA - '+dmSYS.ibtPedido.FieldByName('MESA_COD').AsString;
end;

end.
