unit uRelCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, RpRave, RpDefine, RpCon, RpConDS,
  DB, IBCustomDataSet, IBQuery;

type
  TfrmRelCompras = class(TForm)
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
    ibqRelCompras: TIBQuery;
    rvdsRelCompras: TRvDataSetConnection;
    rvpRelCompras: TRvProject;
    procedure bitSairClick(Sender: TObject);
    procedure bitOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCompras: TfrmRelCompras;

implementation

uses udmSYS;

{$R *.dfm}

procedure TfrmRelCompras.bitSairClick(Sender: TObject);
begin
close;
end;

procedure TfrmRelCompras.bitOKClick(Sender: TObject);
begin
  if dtpInicial.Date > dtpFinal.Date then
  begin
   ShowMessage('Período Invalido');
   exit;
  end;
 if edtForInicial.Text > edtForFinal.Text then
  begin
   ShowMessage('Fornecedor Inicial deve ser menor que Final');
   exit;
  end;


  ibqRelCompras.Close;
  ibqRelCompras.SQL.Clear;
  ibqRelCompras.SQL.Add('select compras.*, fornecedor.for_nom_fant from compras, fornecedor ' +
    'where compras.for_cod = fornecedor.for_cod and compras.COM_DATENT between :dt_inicial and :dt_final ');
  ibqRelCompras.ParamByName('dt_inicial').AsString:= FormatDateTime('dd/mm/yyyy', dtpInicial.DateTime);
  ibqRelCompras.ParamByName('dt_final').AsString:= FormatDateTime('dd/mm/yyyy', dtpFinal.DateTime);

  if (edtForInicial.Text <> '') and (edtForFinal.Text <> '') then
  begin
    ibqRelCompras.SQL.Add(' and compras.for_cod between :codigo_inicial ' +
                      ' and :codigo_final ');
    ibqRelCompras.ParamByName('codigo_inicial').AsInteger:= StrToInt(edtForInicial.Text);
    ibqRelCompras.ParamByName('codigo_final').AsInteger:= StrToInt(edtForFinal.Text);
  end;

  ibqRelCompras.Open;

  rvpRelCompras.Execute;
end;

end.
