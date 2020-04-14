unit uRelPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, RpRave, RpDefine, RpCon, RpConDS,
  DB, IBCustomDataSet, IBQuery;

type
  TfrmRelPedido = class(TForm)
    Label20: TLabel;
    dtpDtaInicial: TDateTimePicker;
    Label1: TLabel;
    dtpDtaFinal: TDateTimePicker;
    bitSair: TBitBtn;
    bitOK: TBitBtn;
    ibqRelPed: TIBQuery;
    rvdsPedido: TRvDataSetConnection;
    rvpRelPed: TRvProject;
    procedure bitOKClick(Sender: TObject);
    procedure bitSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPedido: TfrmRelPedido;

implementation

uses udmSYS;

{$R *.dfm}

procedure TfrmRelPedido.bitOKClick(Sender: TObject);
begin
  ibqRelPed.Close;
  ibqRelPed.ParamByName('data_inicial').AsString:= FormatDateTime('dd/mm/yyyy', dtpDtaInicial.DateTime);
  ibqRelPed.ParamByName('data_final').AsString:= FormatDateTime('dd/mm/yyyy', dtpDtaFinal.DateTime);
  ibqRelPed.Open;

  rvpRelPed.Execute;
end;

procedure TfrmRelPedido.bitSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

end.
