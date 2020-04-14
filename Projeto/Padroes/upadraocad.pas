unit upadraocad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Buttons, DB, IBCustomDataSet,
  IBTable, Mask, ComCtrls, ToolWin, Grids, DBGrids;

type
  TfrmPadraoCadastro = class(TForm)
    ToolBar1: TToolBar;
    dbnNavegacao: TDBNavigator;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    bitok: TBitBtn;
    bitIncluir: TBitBtn;
    bitCancelar: TBitBtn;
    bitAlterar: TBitBtn;
    pgcPadraoCad: TPageControl;
    tbsCadastro: TTabSheet;
    bitExcluir: TBitBtn;
    bitSair: TBitBtn;
    tbsConsulta: TTabSheet;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    dbgCons: TDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Botoes(bt: Char);
    function  Ativacao(Nome: String): Boolean;
    function CNPJ(Num: String): Boolean;
    function CPF(Num: String): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadraoCadastro: TfrmPadraoCadastro;

implementation

uses BDASYS, StrUtils;

{$R *.dfm}

procedure TfrmPadraoCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Begin
      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    End;
  if Key = #27 then
    Perform(WM_NEXTDLGCTL, 1, 0);
end;

procedure TfrmPadraoCadastro.Botoes(bt: Char); //Habilitar e Desabilitar os Botões da Janela
 procedure alteravalor( bo,bi,be,ba,bc,bn : boolean) ;
  begin
   bitok.Enabled := bo;
   bitIncluir.Enabled := bi;
   bitExcluir.Enabled := be;
   bitAlterar.Enabled := ba;
   bitCancelar.Enabled := bc;
   dbnNavegacao.Enabled := bn;
  end ;
Begin
  case bt of
   'O':Begin  //Parametros no clicle dos Botões (OK, Cancelar, Excluir e inicialização do Form)
        alteraValor(false,true,true,true,false,true) ;
       end;
   'I':Begin //Parametros no clicle dos Botões (Incluir, Alterar)
        alteraValor(true,false,false,false,true,false);
       end;
  end;
end;

function TfrmPadraoCadastro.Ativacao(Nome: String): Boolean;
var
 cont: integer;
 auxForm : TForm ;
begin
 Ativacao := false ;
 for cont := 0 to MDIChildCount - 1  do
  begin
   auxform :=  MDIChildren[cont] ;
   if AnsiUpperCase(auxForm.name) = Nome then
    begin
     auxform.Show ;
     Ativacao := true ;
     break ;
    end ;
  end;
end;

function TfrmPadraoCadastro.CPF(Num: String): Boolean;  //Validação CPF
var
  Temp: Integer;
  Numero: String;
  n: array [1..9] of Integer;
  d: array [1..2] of Integer;
begin
  Numero:='';
  for Temp:=1 to 14 do if Num[Temp] in ['0'..'9'] then Numero:=Numero+Num[Temp];
  if Length(Numero) = 11 then
   Begin
    for Temp:=1 to 9 do n[Temp]:=StrToInt(Numero[Temp]);
    d[1]:=n[9]*2+n[8]*3+n[7]*4+n[6]*5+n[5]*6+n[4]*7+n[3]*8+n[2]*9+n[1]*10;
    d[1]:=11-(d[1] mod 11);
    if d[1]>=10 then d[1]:=0;
    d[2]:=d[1]*2+n[9]*3+n[8]*4+n[7]*5+n[6]*6+n[5]*7+n[4]*8+n[3]*9+n[2]*10+n[1]*11;
    d[2]:=11-(d[2] mod 11);
    if d[2]>=10 then d[2]:=0;
    if IntToStr(d[1])+IntToStr(d[2])=Numero[10]+Numero[11] then CPF:=True else CPF:=False;
   end
  else
   if Numero = '' then
    begin
     CPF:=True;
     exit;
    end
   else
    CPF:=False;
  case AnsiIndexStr(Numero,['00000000000','11111111111','22222222222','33333333333','44444444444',
                              '55555555555','66666666666','77777777777','88888888888','99999999999']) of
          0..9:   CPF:=False;
  end;
end;

function TfrmPadraoCadastro.CNPJ(Num: String): Boolean;     //Validação CNPJ
var
  Temp: Integer;
  Numero: String;
  n: array [1..12] of Integer;
  d: array [1..2] of Integer;
begin
  Numero:='';
  for Temp:=1 to 18 do if Num[Temp] in ['0'..'9'] then Numero:=Numero+Num[Temp];
  if Length(Numero) = 14 then
   Begin
    for Temp:=1 to 12 do n[Temp]:=StrToInt(Numero[Temp]);
    d[1]:=n[12]*2+n[11]*3+n[10]*4+n[9]*5+n[8]*6+n[7]*7+n[6]*8+n[5]*9+n[4]*2+n[3]*3+n[2]*4+n[1]*5;
    d[1]:=11-(d[1] mod 11);
    if d[1]>=10 then d[1]:=0;
    d[2]:=d[1]*2+n[12]*3+n[11]*4+n[10]*5+n[9]*6+n[8]*7+n[7]*8+n[6]*9+n[5]*2+n[4]*3+n[3]*4+n[2]*5+n[1]*6;
    d[2]:=11-(d[2] mod 11);
    if d[2]>=10 then d[2]:=0;
    if IntToStr(d[1])+IntToStr(d[2])=Numero[13]+Numero[14] then CNPJ:=True else CNPJ:=False;
   end
  else
   if Numero = '' then
    begin
     CNPJ:=True;
     exit;
    end
   else
    CNPJ:=False;
  case AnsiIndexStr(Numero,['00000000000000','11111111111111','22222222222222','33333333333333','44444444444444',
                           '55555555555555','66666666666666','77777777777777','88888888888888','99999999999999']) of
        0..9:   CNPJ:=False;
  end;
end;

end.

