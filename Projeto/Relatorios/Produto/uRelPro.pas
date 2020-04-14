unit uRelPro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpDefine, RpCon, RpConDS, DB, IBCustomDataSet, IBQuery, RpRave,
  StdCtrls, Buttons;

type
  TfrmRelPro = class(TForm)
    ibqRelPro: TIBQuery;
    rvdsProduto: TRvDataSetConnection;
    rvpProduto: TRvProject;
    bitSair: TBitBtn;
    bitOK: TBitBtn;
    GroupBox1: TGroupBox;
    rdbCodigo: TRadioButton;
    rdbNome: TRadioButton;
    edtProInicial: TEdit;
    edtProFinal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    rdbSimples: TRadioButton;
    rdbComposto: TRadioButton;
    rdbMateriaPrima: TRadioButton;
    rdbGeral: TRadioButton;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    edtGruInicial: TEdit;
    edtGruFinal: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitSairClick(Sender: TObject);
    procedure bitOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPro: TfrmRelPro;

implementation

uses udmSYS, uAbtCaixa, uCidade;

{$R *.dfm}

procedure TfrmRelPro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRelPro.bitSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmRelPro.bitOKClick(Sender: TObject);
var
  OrderBy: String;
begin
  ibqRelPro.Close;
  ibqRelPro.SQL.Clear;
  ibqRelPro.SQL.Add('select produto.*, grupo.gru_nom from produto, grupo ' +
    'where grupo.gru_cod = produto.pro_cod ');

  if (edtProInicial.Text <> '') and (edtProFinal.Text <> '') then
  begin
    ibqRelPro.SQL.Add(' and produto.pro_cod between :codigo_inicial ' +
                      ' and :codigo_final ');
    ibqRelPro.ParamByName('codigo_inicial').AsInteger:= StrToInt(edtProInicial.Text);
    ibqRelPro.ParamByName('codigo_final').AsInteger:= StrToInt(edtProFinal.Text);
  end;

  if (edtGruInicial.Text <> '') and (edtGruFinal.Text <> '') then
  begin
    ibqRelPro.SQL.Add(' and produto.gru_cod between :gru_codigo_inicial ' +
                      ' and :gru_codigo_final ');
    ibqRelPro.ParamByName('gru_codigo_inicial').AsInteger:= StrToInt(edtGruInicial.Text);
    ibqRelPro.ParamByName('gru_codigo_final').AsInteger:= StrToInt(edtGruFinal.Text);
  end;

  if not rdbGeral.Checked then
  begin
    if rdbSimples.Checked then
      ibqRelPro.SQL.Add(' and produto.pro_tip = ' + QuotedStr('S'))
    else if rdbMateriaPrima.Checked then
      ibqRelPro.SQL.Add(' and produto.pro_tip = ' + QuotedStr('M'))
    else if rdbComposto.Checked then
      ibqRelPro.SQL.Add(' and produto.pro_tip = ' + QuotedStr('C'));
  end;

  if rdbCodigo.Checked then
    OrderBy:= ' order by produto.pro_cod'
  else if rdbNome.Checked then
    OrderBy:= ' order by produto.pro_nom';

  ibqRelPro.SQL.Add(OrderBy);
  ibqRelPro.Open;

  rvpProduto.Execute;
end;

end.
