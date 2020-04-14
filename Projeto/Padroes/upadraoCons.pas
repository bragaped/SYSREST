unit upadraoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TfrmConsPadrao = class(TForm)
    lbBusc: TLabel;
    cbFiltro: TComboBox;
    edtBusc: TEdit;
    dbgrid: TDBGrid;
    bitOK: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPadrao: TfrmConsPadrao;

implementation

{$R *.dfm}

procedure TfrmConsPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Begin
      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    End;
  if Key = #27 then
    Perform(WM_NEXTDLGCTL, 1, 0);
end;

end.
