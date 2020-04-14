unit uRelFor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpConDS, RpDefine, RpRave, DB, DBTables, IBCustomDataSet,
  IBQuery, StdCtrls, Buttons;

type
  TfrmRelFor = class(TForm)
    rvpFor: TRvProject;
    rvdsFornecedor: TRvDataSetConnection;
    ibqRelFor: TIBQuery;
    bitOK: TBitBtn;
    bitSair: TBitBtn;
    GroupBox1: TGroupBox;
    rdbCodigo: TRadioButton;
    rdbNome: TRadioButton;
    edtForneInicial: TEdit;
    edtForneFinal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitOKClick(Sender: TObject);
    procedure bitSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFor: TfrmRelFor;

implementation

uses udmSYS, uAbtCaixa;

{$R *.dfm}

procedure TfrmRelFor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmRelFor.bitOKClick(Sender: TObject);
var
  OrderBy: string;
begin
  ibqRelFor.Close;
  ibqRelFor.SQL.Clear;
  ibqRelFor.SQL.Add('select fornecedor.*, cidade.cid_nom from fornecedor, cidade ' +
    'where cidade.cid_cod = fornecedor.cid_cod ');

  if (edtForneInicial.Text <> '') and (edtForneFinal.Text <> '') then
  begin
    ibqRelFor.SQL.Add(' and fornecedor.for_cod between :codigo_inicial ' +
                      ' and :codigo_final ');
    ibqRelFor.ParamByName('codigo_inicial').AsInteger:= StrToInt(edtForneInicial.Text);
    ibqRelFor.ParamByName('codigo_final').AsInteger:= StrToInt(edtForneFinal.Text);
  end;

   if rdbCodigo.Checked then
     OrderBy:= 'order by fornecedor.for_cod'
   else if rdbNome.Checked then
     OrderBy:= 'order by fornecedor.for_nom_fant';

  ibqRelFor.SQL.Add(OrderBy);
  ibqRelFor.Open;

  rvpFor.Execute;
end;

procedure TfrmRelFor.bitSairClick(Sender: TObject);
begin
  Close;
end;

end.
