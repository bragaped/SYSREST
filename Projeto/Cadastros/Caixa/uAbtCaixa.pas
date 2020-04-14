unit uAbtCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmAbtCaixa = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    pnNum: TPanel;
    pnValDin: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    pnValChe: TPanel;
    Label5: TLabel;
    bitOK: TBitBtn;
    bitCancelar: TBitBtn;
    pnValTotal: TPanel;
    dbeValINI: TDBEdit;
    Label6: TLabel;
    pnValCart: TPanel;
    procedure Caixa_Anteriro();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bitOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbtCaixa: TfrmAbtCaixa;

implementation

uses udmSYS;

{$R *.dfm}

procedure TfrmAbtCaixa.Caixa_Anteriro();
var ValDin, ValChe, ValCart : Real;
begin
 dmSYS.ibtCaixa.Last;
 if not(dmSYS.ibtCaixa.FieldByName('Cai_Num').IsNull) then
  begin
      pnNum.Caption := dmSYS.ibtCaixa.FieldByName('Cai_Num').AsString;

   ValDin := dmSYS.ibtCaixa.FieldByName('CAI_VALFECDIN').AsFloat;
   if not(ValDin = Null) then
    pnValDin.Caption := FormatFloat(',0.00',ValDin);
                        //FloatToStr(ValDin);

   ValChe := dmSYS.ibtCaixa.FieldByName('CAI_VALFECCHE').AsFloat;
   if not(ValChe = Null) then
    pnValChe.Caption := FormatFloat(',0.00',ValChe);
                        //FloatToStr(ValChe);

   ValCart := dmSYS.ibtCaixa.FieldByName('CAI_VALFECCART').AsFloat;
   if not(ValCart = Null) then
    pnValCart.Caption :=  FormatFloat(',0.00',ValCart);
                          //FloatToStr(ValCart);

   pnValTotal.Caption := FormatFloat(',0.00',ValDin + ValChe + ValCart);
                         // FloatToStr(ValDin + ValChe + ValCart);
  end
 else
  begin
   pnNum.Caption:='';
   pnValDin.Caption := '';
   pnValChe.Caption := '';
   pnValTotal.Caption := '';
  end;
end;

procedure TfrmAbtCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmSYS.ibtCaixa.Cancel;
  dmSYS.ibtCaixa.Close;
  Action := caFree;
end;

procedure TfrmAbtCaixa.bitCancelarClick(Sender: TObject);
begin
  dmSYS.ibtCaixa.Cancel;
  close;
end;

procedure TfrmAbtCaixa.FormCreate(Sender: TObject);
begin
 frmAbtCaixa.Height := 250;
 frmAbtCaixa.Width := 215;
 dmSYS.ibtCaixa.Open;
 Caixa_Anteriro;
 dmSYS.ibtCaixa.Append;
end;

procedure TfrmAbtCaixa.bitOKClick(Sender: TObject);
var ValIni : Real;
begin
 if not(dmSYS.ibtCaixa.FieldByName('CAI_VALINI').IsNull) then
  ValIni := dmSYS.ibtCaixa.FieldByName('CAI_VALINI').AsFloat
 else
  ValIni := 0.00; 
 If (dmSYS.ibtCaixa.State in [dsInsert]) Then Begin
  if MessageDlg('Confirma a Abertura do Caixa'+#13+'Valor Inicial R$ '+FormatFloat(',0.00',ValIni),
                mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
    dmSYS.ibtCaixa.Post;
    dmSYS.ibtSYS_DATABASE.CommitRetaining;
    MessageDlg('Operação Realizada Com Sucesso!',mtInformation,[mbOK],0);
    close;
   end;
 end;
end;

end.
