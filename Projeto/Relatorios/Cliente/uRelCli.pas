unit uRelCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, RpCon, RpConDS, RpDefine, RpRave,
  StdCtrls, Buttons;

type
  TfrmRelCli = class(TForm)
    rvpCli: TRvProject;
    rvdsCliente: TRvDataSetConnection;
    ibqRelCli: TIBQuery;
    bitOK: TBitBtn;
    bitSair: TBitBtn;
    GroupBox1: TGroupBox;
    rdbCodigo: TRadioButton;
    rdbNome: TRadioButton;
    edtCliInicial: TEdit;
    edtCliFinal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure bitOKClick(Sender: TObject);
    procedure bitSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCli: TfrmRelCli;

implementation

uses udmSYS, uPrincipal, ugridPedido;

{$R *.dfm}

procedure TfrmRelCli.bitOKClick(Sender: TObject);
var
  OrderBy: String;
begin
 if edtCliInicial.Text > edtCliFinal.Text then
  begin
   ShowMessage('Cliente Inicial deve ser menor que Final');
   exit;
  end;
  
  ibqRelCli.Close;
  ibqRelCli.SQL.Clear;
  ibqRelCli.SQL.Add('select cliente.*, cidade.cid_nom from cliente, cidade ' +
    'where cidade.cid_cod = cliente.cid_cod ');

  if (edtCliInicial.Text <> '') and (edtCliFinal.Text <> '') then
  begin
    ibqRelCli.SQL.Add(' and cliente.CLI_COD between :codigo_inicial ' +
                      ' and :codigo_final ');
    ibqRelCli.ParamByName('codigo_inicial').AsInteger:= StrToInt(edtCliInicial.Text);
    ibqRelCli.ParamByName('codigo_final').AsInteger:= StrToInt(edtCliFinal.Text);                      
  end;

   if rdbCodigo.Checked then
     OrderBy:= 'order by cliente.cli_cod'
   else if rdbNome.Checked then
     OrderBy:= 'order by cliente.cli_nom';

  ibqRelCli.SQL.Add(OrderBy);
  ibqRelCli.Open;

  rvpCli.Execute;
end;

procedure TfrmRelCli.bitSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRelCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

end.
