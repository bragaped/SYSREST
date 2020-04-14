unit uRelComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, IBCustomDataSet, IBQuery,
  RpRave, RpDefine, RpCon, RpConDS;

type
  TfrmRelComissao = class(TForm)
    bitOK: TBitBtn;
    bitSair: TBitBtn;
    Label1: TLabel;
    edtCodFunc: TEdit;
    BitBtn2: TBitBtn;
    Label20: TLabel;
    dtpDtaInicial: TDateTimePicker;
    Label2: TLabel;
    dtpDtaFinal: TDateTimePicker;
    rvdsRelComissao: TRvDataSetConnection;
    rvpRelComissao: TRvProject;
    ibqRelComissao: TIBQuery;
    procedure bitOKClick(Sender: TObject);
    procedure bitSairClick(Sender: TObject);
    procedure edtCodFuncExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelComissao: TfrmRelComissao;

implementation

uses udmSYS;

{$R *.dfm}

procedure TfrmRelComissao.bitOKClick(Sender: TObject);
begin
 if dtpDtaInicial.Date > dtpDtaFinal.Date then
  begin
   ShowMessage('Período Invalido');
   exit;
  end;

  ibqRelComissao.Close;
  ibqRelComissao.SQL.Clear;
  ibqRelComissao.SQL.Add('select f.FUN_COD, f.FUN_NOM, p.PED_COD, p.PED_VALTOTAL, ' +
    'p.PED_DAT, (p.PED_VALTOTAL * f.COMISSAO / 100) as TOTAL_COMISSAO from PEDIDO p ' +
    'left join FUNCIONARIO f on (f.FUN_COD = p.FUN_COD) where p.FUN_COD = :codigo_func ' +
    'and p.PED_DAT between :data_inicial and :data_final');
  ibqRelComissao.ParamByName('codigo_func').AsInteger:= StrToInt(edtCodFunc.Text);
  ibqRelComissao.ParamByName('data_inicial').AsString:= FormatDateTime('dd/mm/yyyy', dtpDtaInicial.DateTime);;
  ibqRelComissao.ParamByName('data_final').AsString:= FormatDateTime('dd/mm/yyyy', dtpDtaFinal.DateTime);;

  ibqRelComissao.Open;

  rvpRelComissao.Execute;
end;

procedure TfrmRelComissao.bitSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelComissao.edtCodFuncExit(Sender: TObject);
begin
 if edtCodFunc.Text <> '' then
  begin
   ibqRelComissao.Close;
   ibqRelComissao.SQL.Clear;
   ibqRelComissao.SQL.Add('select fun_cod from funcionario where fun_cod = :cod');
   ibqRelComissao.ParamByName('cod').Value := edtCodFunc.Text;
   ibqRelComissao.Open;
   if ibqRelComissao.RecordCount = 0 then
    begin
     ShowMessage('Funcionario não cadastrado!');
     edtCodFunc.Clear;
     edtCodFunc.SetFocus;
    end;
  end;
end;

end.
