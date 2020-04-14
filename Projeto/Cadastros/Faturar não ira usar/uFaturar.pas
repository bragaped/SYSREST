unit uFaturar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmFaturar = class(TForm)
    Label1: TLabel;
    ListBox2: TListBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    edtDinheiro: TEdit;
    Label3: TLabel;
    edtCheque: TLabel;
    Edit1: TEdit;
    bitFarurar: TBitBtn;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFaturar: TfrmFaturar;

implementation

{$R *.dfm}

end.
