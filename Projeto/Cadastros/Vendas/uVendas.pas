unit uVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, ToolWin, Mask, DB, IBCustomDataSet, IBTable;

type
  TfrmVendas = class(TfrmPadraoCadastro)
    GroupBox3: TGroupBox;
    Label6: TLabel;
    dbeCodCli: TDBEdit;
    pnNomFor: TPanel;
    bitConsFor: TBitBtn;
    pgcNF: TPageControl;
    tbsItens: TTabSheet;
    SpeedButton1: TSpeedButton;
    dbgItens: TDBGrid;
    tbsCheque: TTabSheet;
    SpeedButton2: TSpeedButton;
    dbgContPagar: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbeCodFun: TDBEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    IBTable1: TIBTable;
    IBTable1VEN_COD: TIntegerField;
    IBTable1MESA_COD: TIntegerField;
    IBTable1CAI_NUM: TIntegerField;
    IBTable1FUN_COD: TIntegerField;
    IBTable1CLI_COD: TIntegerField;
    IBTable1NRO_DOC: TIntegerField;
    IBTable1VEN_DAT: TDateField;
    IBTable1VEN_VALTOTAL: TFloatField;
    IBTable1VEN_FRMPAG: TIntegerField;
    IBTable1VEN_SIT: TIBStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DateTimePicker1: TDateTimePicker;
    procedure bitSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

uses udmSYS;

{$R *.dfm}

procedure TfrmVendas.bitSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
