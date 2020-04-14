unit uRelCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, RpDefine, RpCon, RpConDS, RpRave,
  StdCtrls, Buttons, ComCtrls;

type
  TfrmRelCheque = class(TForm)
    rvdsCheque: TRvDataSetConnection;
    ibqRelCheque: TIBQuery;
    rvpCheque: TRvProject;
    dtpParaDepositoIni: TDateTimePicker;
    Label6: TLabel;
    dtpEntInicial: TDateTimePicker;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtCliInicial: TEdit;
    edtCliFinal: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    dtpParaDepositoFin: TDateTimePicker;
    Label3: TLabel;
    dtpEntFinal: TDateTimePicker;
    Label4: TLabel;
    bitOK: TBitBtn;
    bitSair: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitSairClick(Sender: TObject);
    procedure bitOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCheque: TfrmRelCheque;

implementation

uses udmSYS;

{$R *.dfm}

procedure TfrmRelCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRelCheque.bitSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmRelCheque.bitOKClick(Sender: TObject);
begin
 if dtpParaDepositoIni.Date > dtpParaDepositoFin.Date then
  begin
   ShowMessage('Período de Depósito Invalida');
   exit;
  end;
 if dtpEntInicial.Date > dtpEntFinal.Date then
  begin
   ShowMessage('Período de Entrada Invalida');
   Exit;
  end;
 if edtCliInicial.Text > edtCliFinal.Text then
  begin
   ShowMessage('Cliente Inicial deve ser menor que Final');
   exit;
  end;
  //chamada do relatorio
  begin
   ibqRelCheque.Close;
   ibqRelCheque.SQL.Clear;
   ibqRelCheque.SQL.Add('select cheque.*, cliente.cli_nom from cheque, cliente ' +
     'where cliente.cli_cod = cheque.cli_cod and cheque.CHE_DATPDEP between ' +
     ':dep_inicial and :dep_final ' +
     'and cheque.CHE_DATENT between :ent_inicial and :ent_final ');
   ibqRelCheque.ParamByName('dep_inicial').AsString:= FormatDateTime('dd/mm/yyyy', dtpParaDepositoIni.DateTime);
   ibqRelCheque.ParamByName('dep_final').AsString:= FormatDateTime('dd/mm/yyyy', dtpParaDepositoFin.DateTime);

   ibqRelCheque.ParamByName('ent_inicial').AsString:= FormatDateTime('dd/mm/yyyy', dtpEntInicial.DateTime);
   ibqRelCheque.ParamByName('ent_final').AsString:= FormatDateTime('dd/mm/yyyy', dtpEntFinal.DateTime);

   if (edtCliInicial.Text <> '') and (edtCliFinal.Text <> '') then
   begin
     ibqRelCheque.SQL.Add(' and cheque.cli_cod between :codigo_inicial ' +
                       ' and :codigo_final ');
     ibqRelCheque.ParamByName('codigo_inicial').AsInteger:= StrToInt(edtCliInicial.Text);
     ibqRelCheque.ParamByName('codigo_final').AsInteger:= StrToInt(edtCliFinal.Text);
   end;

   ibqRelCheque.Open;

   rvpCheque.Execute;
  end;
end;

end.
