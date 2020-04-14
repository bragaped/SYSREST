unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TfrmSobre = class(TForm)
    lbNomeSis: TLabel;
    lbVersao: TLabel;
    lbDensevolvimento: TLabel;
    lbNomDens: TLabel;
    imLogoSis: TImage;
    cpu: TLabel;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

const
ID_BIT = 0000;
type
TVendor = array [0..11] of char;

//funções em Assembler compatível com o Delphi
function GetCPUVendor : TVendor; assembler; register;
asm
PUSH EBX
PUSH EDI
MOV EDI,EAX
MOV EAX,0
DW $A20F
MOV EAX,EBX
XCHG EBX,ECX {salva resultado ECX}
MOV ECX,4
@1:
STOSB
SHR EAX,8
LOOP @1
MOV EAX,EDX
MOV ECX,4
@2:
STOSB
SHR EAX,8
LOOP @2
MOV EAX,EBX
MOV ECX,4
@3:
STOSB
SHR EAX,8
LOOP @3
POP EDI {Restaura registradores}
POP EBX
end;

procedure TfrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
var  S : TVendor;
begin
 S := GetCPUVendor;
 cpu.Caption := S;
end;

end.
