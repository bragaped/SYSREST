unit uRelContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, RpCon, RpConDS, RpDefine, RpRave,
  DB, IBCustomDataSet, IBQuery;

type
  TfrmRelContasPagar = class(TForm)
    GroupBox1: TGroupBox;
    rdbAberto: TRadioButton;
    rdbPago: TRadioButton;
    rdbGeral: TRadioButton;
    Label5: TLabel;
    dtpInicial: TDateTimePicker;
    Label1: TLabel;
    dtpFinal: TDateTimePicker;
    bitSair: TBitBtn;
    bitOK: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    edtForInicial: TEdit;
    edtForFinal: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    ibqRelContas: TIBQuery;
    rvpRelContas: TRvProject;
    rvdsRelContas: TRvDataSetConnection;
    procedure bitSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelContasPagar: TfrmRelContasPagar;

implementation

uses udmSYS;

{$R *.dfm}

procedure TfrmRelContasPagar.bitSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmRelContasPagar.bitOKClick(Sender: TObject);
begin
  ibqRelContas.Close;
  ibqRelContas.SQL.Clear;
  ibqRelContas.SQL.Add('select contas_pagar.*, fornecedor.for_nom_fant from contas_pagar, fornecedor ' +
    'where contas_pagar.for_cod = fornecedor.for_cod and contas_pagar.CONT_DATVENC between :dt_inicial and :dt_final ');
  ibqRelContas.ParamByName('dt_inicial').AsString:= FormatDateTime('dd/mm/yyyy', dtpInicial.DateTime);
  ibqRelContas.ParamByName('dt_final').AsString:= FormatDateTime('dd/mm/yyyy', dtpFinal.DateTime);

  if (edtForInicial.Text <> '') and (edtForFinal.Text <> '') then
  begin
    ibqRelContas.SQL.Add(' and contas_pagar.for_cod between :codigo_inicial ' +
                      ' and :codigo_final ');
    ibqRelContas.ParamByName('codigo_inicial').AsInteger:= StrToInt(edtForInicial.Text);
    ibqRelContas.ParamByName('codigo_final').AsInteger:= StrToInt(edtForFinal.Text);
  end;

  if not rdbGeral.Checked then
  begin
    if rdbAberto.Checked then
      ibqRelContas.SQL.Add(' and (contas_pagar.CONT_VALPAGO is null or contas_pagar.CONT_VALPAGO = 0) ')
    else if rdbPago.Checked then
      ibqRelContas.SQL.Add(' and (contas_pagar.CONT_VALPAGO is not null or contas_pagar.CONT_VALPAGO > 0) ');
  end;

  ibqRelContas.Open;

  rvpRelContas.Execute;
end;

end.
