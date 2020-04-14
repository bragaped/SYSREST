unit BDASYS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, IBDatabase, IBCustomDataSet, IBTable, StdCtrls;

type
  TdtmBDASYS = class(TForm)
    grbConeccao: TGroupBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmBDASYS: TdtmBDASYS;

implementation

{$R *.dfm}

end.
