unit uFecCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, RpCon, RpConDS, RpDefine, RpRave;

type
  TfrmFecCaixa = class(TForm)
    Label1: TLabel;
    dbeDin: TDBEdit;
    bitOK: TBitBtn;
    bitCancelar: TBitBtn;
    Label6: TLabel;
    dbeCheque: TDBEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    pnNum: TPanel;
    pnValDin: TPanel;
    pnValChe: TPanel;
    pnValTotal: TPanel;
    pnValCart: TPanel;
    Label8: TLabel;
    dbeCartao: TDBEdit;
    Label9: TLabel;
    pnValIni: TPanel;
    bitVisualizar: TBitBtn;
    qryFecCaixa: TIBQuery;
    rvpFecCaixa: TRvProject;
    rvdscFecCaixa: TRvDataSetConnection;
    qryFecCaixaCAI_NUM: TIntegerField;
    qryFecCaixaCAI_DATAABT: TDateField;
    qryFecCaixaCAI_HORAABT: TTimeField;
    qryFecCaixaCAI_VALINI: TFloatField;
    qryFecCaixaCAI_DATAFCH: TDateField;
    qryFecCaixaCAI_HORAFCH: TTimeField;
    qryFecCaixaCAI_VALDIN: TFloatField;
    qryFecCaixaCAI_VALCHE: TFloatField;
    qryFecCaixaCAI_VALCART: TFloatField;
    qryFecCaixaCAI_VALFECDIN: TFloatField;
    qryFecCaixaCAI_VALFECCHE: TFloatField;
    qryFecCaixaCAI_VALFECCART: TFloatField;
    procedure Caixa_Fechamento();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bitOKClick(Sender: TObject);
    procedure bitVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFecCaixa: TfrmFecCaixa;

implementation

uses udmSYS;

{$R *.dfm}

procedure TfrmFecCaixa.Caixa_Fechamento();
var ValIni, ValDin, ValChe, ValCart : Real;
begin
 dmSYS.ibtCaixa.Last;
 if not(dmSYS.ibtCaixa.FieldByName('Cai_Num').IsNull) then
  begin
   pnNum.Caption := dmSYS.ibtCaixa.FieldByName('Cai_Num').AsString;

   ValIni := dmSYS.ibtCaixa.FieldByName('CAI_VALINI').AsFloat;
   if not(ValIni = Null) then
    pnValIni.Caption := FormatFloat(',0.00',ValIni);
                         //FloatToStr(ValIni); 

   ValDin := dmSYS.ibtCaixa.FieldByName('CAI_VALDIN').AsFloat;
   if not(ValDin = Null) then
    pnValDin.Caption := FormatFloat(',0.00',ValDin);
                        //FloatToStr(ValDin);

   ValChe := dmSYS.ibtCaixa.FieldByName('CAI_VALCHE').AsFloat;
   if not(ValChe = Null) then
    pnValChe.Caption := FormatFloat(',0.00',ValChe);
                        //FloatToStr(ValChe);

   ValCart := dmSYS.ibtCaixa.FieldByName('CAI_VALCART').AsFloat;
   if not(ValCart = Null) then
    pnValCart.Caption := FormatFloat(',0.00',ValCart);
                          //FloatToStr(ValCart);

   pnValTotal.Caption := FormatFloat(',0.00',ValIni + ValDin + ValChe + ValCart);
                                //FloatToStr(ValIni + ValDin + ValChe + ValCart);
  end
 else
  begin
   pnNum.Caption:='';
   pnValDin.Caption := '';
   pnValChe.Caption := '';
   pnValTotal.Caption := '';
  end;
end;

procedure TfrmFecCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dmSYS.ibtCaixa.Cancel;
 dmSYS.ibtCaixa.Close;
 Action := caFree;
end;

procedure TfrmFecCaixa.bitCancelarClick(Sender: TObject);
begin
 dmSYS.ibtCaixa.Cancel;
 close;
end;

procedure TfrmFecCaixa.FormCreate(Sender: TObject);
begin
 Height := 215;
 Width := 315;
 dmSYS.ibtCaixa.Open;
 Caixa_Fechamento;
 dmSYS.ibtCaixa.Edit;
end;

procedure TfrmFecCaixa.bitOKClick(Sender: TObject);
begin
 if MessageDlg('Confirma o Fechamento do Caixa Atual',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
   qryFecCaixa.Close;
   qryFecCaixa.Open;
   dmSYS.ibtCaixa.FieldByName('CAI_DATAFCH').Value := Date;
   dmSYS.ibtCaixa.FieldByName('CAI_HORAFCH').Value := Time;
   dmSYS.ibtCaixa.Post;
   dmSYS.ibtSYS_DATABASE.CommitRetaining;
   rvpFecCaixa.Execute;
   MessageDlg('Operação Realizada Com Sucesso!',mtInformation,[mbOK],0);
   close;
  end;
end;

procedure TfrmFecCaixa.bitVisualizarClick(Sender: TObject);
begin
 qryFecCaixa.Close;
 qryFecCaixa.Open;
 rvpFecCaixa.Execute;
end;

end.
