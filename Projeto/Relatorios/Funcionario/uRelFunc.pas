unit uRelFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpConDS, RpDefine, RpRave, DB, IBCustomDataSet, IBQuery,
  StdCtrls, Buttons;

type
  TfrmRelFunc = class(TForm)
    ibqRelFunc: TIBQuery;
    rvpFunc: TRvProject;
    rvdsFuncionario: TRvDataSetConnection;
    bitSair: TBitBtn;
    bitOK: TBitBtn;
    GroupBox1: TGroupBox;
    rdbCodigo: TRadioButton;
    rdbNome: TRadioButton;
    edtFuncInicial: TEdit;
    edtFuncFinal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure bitSairClick(Sender: TObject);
    procedure bitOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtFuncInicialChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFunc: TfrmRelFunc;

implementation

uses udmSYS;

{$R *.dfm}

procedure TfrmRelFunc.bitOKClick(Sender: TObject);
var
  OrderBy: String;
begin
  ibqRelFunc.Close;
  ibqRelFunc.SQL.Clear;
  ibqRelFunc.SQL.Add('select funcionario.*, cidade.cid_nom from funcionario, cidade ' +
    'where cidade.cid_cod = funcionario.fun_cod ');

  if (edtFuncInicial.Text <> '') and (edtFuncFinal.Text <> '') then
  begin
    ibqRelFunc.SQL.Add(' and funcionario.fun_cod between :codigo_inicial ' +
                      ' and :codigo_final ');
    ibqRelFunc.ParamByName('codigo_inicial').AsInteger:= StrToInt(edtFuncInicial.Text);
    ibqRelFunc.ParamByName('codigo_final').AsInteger:= StrToInt(edtFuncFinal.Text);
  end;

   if rdbCodigo.Checked then
     OrderBy:= 'order by funcionario.fun_cod'
   else if rdbNome.Checked then
     OrderBy:= 'order by funcionario.fun_nom';

  ibqRelFunc.SQL.Add(OrderBy);
  ibqRelFunc.Open;

  rvpFunc.Execute;
end;

procedure TfrmRelFunc.bitSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRelFunc.edtFuncInicialChange(Sender: TObject);
begin
 if edtFuncInicial.Text <> '' then
  begin
   ibqRelFunc.Close;
   ibqRelFunc.SQL.Clear;
   ibqRelFunc.SQL.Add('select fun_cod from funcionario where fun_cod = :cod');
   ibqRelFunc.ParamByName('cod').Value := edtFuncInicial.Text;
   ibqRelFunc.Open;
   if ibqRelFunc.RecordCount = 0 then
    begin
     ShowMessage('Funcionario não cadastrado!');
     edtFuncInicial.Clear;
     edtFuncInicial.SetFocus;
    end;
  end;
end;

end.
