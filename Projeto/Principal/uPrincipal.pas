unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, jpeg, ExtCtrls,
  XPStyleActnCtrls, ActnList, ActnMan, StdCtrls, Buttons, CustomizeDlg, DB,
  IBCustomDataSet, IBTable, IBQuery, DBCtrls, DBTables, Grids,
  DBGrids;

type
  TPrincipal = class(TForm)
    menuPrincipal: TMainMenu;
    A1: TMenuItem;
    Cliente1: TMenuItem;
    Fornecedor1: TMenuItem;
    N1: TMenuItem;
    Funcionario1: TMenuItem;
    Movimento1: TMenuItem;
    Configurao1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Sair2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Usuario1: TMenuItem;
    brAcessoRapido: TToolBar;
    btCliente: TToolButton;
    Botoes: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Sobre: TMenuItem;
    StatusBar: TStatusBar;
    Timer: TTimer;
    imgPrincipal: TImage;
    Relatorio1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Produto1: TMenuItem;
    Produto2: TMenuItem;
    Grupo1: TMenuItem;
    Mesa1: TMenuItem;
    Mesa2: TMenuItem;
    Setor1: TMenuItem;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    CdigoFiscal1: TMenuItem;
    Vendas1: TMenuItem;
    Compra1: TMenuItem;
    Caixa1: TMenuItem;
    Abertura1: TMenuItem;
    Fechamento1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Contas1: TMenuItem;
    Cheque1: TMenuItem;
    APagar1: TMenuItem;
    Clientes1: TMenuItem;
    EntradaSangria1: TMenuItem;
    Pedido1: TMenuItem;
    Fornecedor2: TMenuItem;
    Funcionario2: TMenuItem;
    Compra2: TMenuItem;
    Produto3: TMenuItem;
    Comisso1: TMenuItem;
    Pedido2: TMenuItem;
    Cheque2: TMenuItem;
    ContasPagar1: TMenuItem;
    function  Ativacao(Nome: String): Boolean;
    procedure Sair1Click(Sender: TObject);
    procedure ClienteClick(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure Funcionario1Click(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure Setor1Click(Sender: TObject);
    procedure Mesa2Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure CdigoFiscal1Click(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
    procedure Abertura1Click(Sender: TObject);
    procedure Fechamento1Click(Sender: TObject);
    procedure Cheque1Click(Sender: TObject);
    procedure APagar1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure EntradaSangria1Click(Sender: TObject);
    procedure Fornecedor2Click(Sender: TObject);
    procedure Produto4Click(Sender: TObject);
    procedure Cheque2Click(Sender: TObject);
    procedure Funcionario2Click(Sender: TObject);
    procedure ContasPagar1Click(Sender: TObject);
    procedure Compra2Click(Sender: TObject);
    procedure Comisso1Click(Sender: TObject);
    procedure Pedido2Click(Sender: TObject);
    procedure Produto3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses BDASYS, uSobre, uCliente, uFornecedor, uCidade, uLogin, uVariavel,
  uUsuario, uFuncionario, uGrupo_Produto, uSetor, uMesa, uProduto, uCompra,
  uCod_Fiscal, uAbtCaixa, uCheque, uContas_Pagar, udmSYS, uFecCaixa,
  uVendas, uRelCli, uMovCaixa, ugridPedido, uRelCheque,
  uRelFor, uRelPro, uRelComissao, uRelCompras, uRelContas, uRelPed,
  uINI, upadraocad, uTrocaMesa, uRelFunc;

{$R *.dfm}

function TPrincipal.Ativacao(Nome: String): Boolean;
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

procedure TPrincipal.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TPrincipal.TimerTimer(Sender: TObject);  //Componente para Barra de Estatus...
begin
  if GetKeyState(VK_NUMLOCK) = 1 then
    StatusBar.Panels[0].Text := 'Num lock: ON'
  else
    StatusBar.Panels[0].Text := 'Num lock: OFF';
  if GetKeyState(VK_CAPITAL) = 1 then
    StatusBar.Panels[1].Text := 'Caps lock: ON'
  else
    StatusBar.Panels[1].Text := 'Caps lock: OFF';   
  StatusBar.Panels[2].Text := TimeToStr(Time);
  StatusBar.Panels[3].Text := DateToStr(Date);
end;

procedure TPrincipal.ClienteClick(Sender: TObject);
begin
 if not Ativacao('FRMCLIENTE') then
  begin
   Application.CreateForm(TfrmCliente,frmCliente);
  end;
end;

procedure TPrincipal.SobreClick(Sender: TObject);
begin
  if not Ativacao('FRMSOBRE') then
  begin
   Application.CreateForm(TfrmSobre,frmSobre);
  end;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
 TimerTimer(Self);
end;

procedure TPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  TimerTimer(Self);
end;

procedure TPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TimerTimer(Self);
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
  frmLogin.ShowModal;
  uVariavel.chamada := '0';
  StatusBar.Panels[4].Text := 'Usuario: '+uVariavel.User;
  StatusBar.Panels[5].Text := Principal.Text;
  StatusBar.Panels[3].Text := DateToStr(Date);
end;

procedure TPrincipal.Fornecedor1Click(Sender: TObject);
begin
  if not Ativacao('FRMFORNECEDOR') then
  begin
   Application.CreateForm(TfrmFornecedor,frmFornecedor);
  end;
end;

procedure TPrincipal.Usuario1Click(Sender: TObject);
begin
  if not Ativacao('FRMUSUARIO') then
  begin
   Application.CreateForm(TfrmUsuario, frmUsuario);
  end;
end;

procedure TPrincipal.Funcionario1Click(Sender: TObject);
begin
  if not Ativacao('FRMFUNCIONARIO') then
  begin
   Application.CreateForm(TfrmFuncionario,frmFuncionario);
  end;
end;

procedure TPrincipal.Grupo1Click(Sender: TObject);
begin
  if not Ativacao('FRMGRUPO_PRODUTO') then
  begin
   Application.CreateForm(TfrmGrupo_Produto,frmGrupo_Produto);
  end;
end;

procedure TPrincipal.Setor1Click(Sender: TObject);
begin
  if not Ativacao('FRMSETOR') then
  begin
   Application.CreateForm(TfrmSetor,frmSetor);
  end;
end;

procedure TPrincipal.Mesa2Click(Sender: TObject);
begin
 if not Ativacao('FRMMESA') then
  begin
   Application.CreateForm(TfrmMesa,frmMesa);
  end;
end;

procedure TPrincipal.Produto2Click(Sender: TObject);
begin
  if not Ativacao('FRMPRODUTO') then
  begin
   Application.CreateForm(TfrmProduto,frmProduto);
  end;
end;

procedure TPrincipal.CdigoFiscal1Click(Sender: TObject);
begin
  if not Ativacao('FRMCOD_FISCAL') then
  begin
   Application.CreateForm(TfrmCod_Fiscal,frmCod_Fiscal);
  end;
end;

procedure TPrincipal.Compra1Click(Sender: TObject);
begin
  if not Ativacao('FRMCOMPRA') then
  begin
   Application.CreateForm(TfrmCompra,frmCompra);
  end;
end;

procedure TPrincipal.Abertura1Click(Sender: TObject);
begin
 dmSYS.ibtCaixa.Open;
 dmSYS.ibtCaixa.Last;
 if not(dmSYS.ibtCaixa.FieldByName('CAI_DATAFCH').IsNull) or
       (dmSYS.ibtCaixa.FieldByName('CAI_NUM').IsNull) then
  begin
   if not Ativacao('FRMABTCAIXA') then
    begin
     Application.CreateForm(TfrmAbtCaixa,frmAbtCaixa);
    end;
  end
 else
  begin
   MessageDlg('Caixa Aberto'+#13+'O Caixa Atual Devera ser Fechado para abrir um Novo', mtInformation, [mbOK],0);
   dmSYS.ibtCaixa.Close;
   Exit;
  end;
end;

procedure TPrincipal.Fechamento1Click(Sender: TObject);
begin
 dmSYS.ibtCaixa.Open;
 dmSYS.ibtCaixa.Last;
 if (dmSYS.ibtCaixa.FieldByName('CAI_DATAFCH').IsNull) and
    not(dmSYS.ibtCaixa.FieldByName('CAI_NUM').IsNull) then
  begin
   if not Ativacao('FRMFECCAIXA') then
    begin
     Application.CreateForm(TfrmFecCaixa,frmFecCaixa);
    end;
  end
 else
  begin
   MessageDlg('Não Existe Caixa a ser Fechado', mtInformation, [mbOK],0);
   dmSYS.ibtCaixa.Close;
   Exit;
  end;
end;

procedure TPrincipal.EntradaSangria1Click(Sender: TObject);
begin
 dmSYS.ibtCaixa.Open;
 dmSYS.ibtCaixa.Last;
 if (dmSYS.ibtCaixa.FieldByName('CAI_DATAFCH').IsNull) and
    not(dmSYS.ibtCaixa.FieldByName('CAI_NUM').IsNull) then
  begin
   if not Ativacao('FRMMOV_CAIXA') then
    begin
     Application.CreateForm(TfrmMov_Caixa,frmMov_Caixa);
    end;
  end
 else
  begin
   MessageDlg('Não Existe Caixa Aberto'+#13+'Para Fazer Movimenação Abra um Caixa', mtInformation, [mbOK],0);
   dmSYS.ibtCaixa.Close;
   Exit;
  end;
end;

procedure TPrincipal.Cheque1Click(Sender: TObject);
begin
  if not Ativacao('FRMCHEQUE') then
   begin
    Application.CreateForm(TfrmCheque,frmCheque);
   end;
end;

procedure TPrincipal.APagar1Click(Sender: TObject);
begin
 if not Ativacao('FRMCONTAS_PAGAR') then
  begin
   Application.CreateForm(TfrmContas_Pagar,frmContas_Pagar);
  end;
end;

procedure TPrincipal.Vendas1Click(Sender: TObject);
begin
 dmSYS.ibtCaixa.Open;
 dmSYS.ibtCaixa.Last;
 if (dmSYS.ibtCaixa.FieldByName('CAI_DATAFCH').IsNull) then
  begin
   if not Ativacao('FRMGRIDPEDIDO') then
    begin
     Application.CreateForm(TfrmGridPedido,frmGridPedido);
    end;
  end
 else
  begin
   MessageDlg(#13+'Não Existe Caixa Aberto'+#13'Para Fazer Movimenação Abra um Caixa', mtInformation, [mbOK],0);
   dmSYS.ibtCaixa.Close;
   Exit;
  end;
end;

procedure TPrincipal.Clientes1Click(Sender: TObject);
begin
 if not Ativacao('FRMRELCLI') then
  begin
   Application.CreateForm(TfrmRelCli,frmRelCli);
  end;
end;

procedure TPrincipal.Fornecedor2Click(Sender: TObject);
begin
 if not Ativacao('FRMRELFOR') then 
  begin
   Application.CreateForm(TfrmRelFor,frmRelFor);
  end;
end;

procedure TPrincipal.Produto4Click(Sender: TObject);
begin
 if not Ativacao('FRMRELPRO') then
  begin
   Application.CreateForm(TfrmRelPro,frmRelPro);
  end;
end;

procedure TPrincipal.Cheque2Click(Sender: TObject);
begin
 if not Ativacao('FRMRELCHEQUE') then
  begin
   Application.CreateForm(TfrmRelCheque,frmRelCheque);
  end;
end;

procedure TPrincipal.Funcionario2Click(Sender: TObject);
begin
 if not Ativacao('FRMRELFUNC') then
  begin
   Application.CreateForm(TfrmRelFunc,frmRelFunc);
  end;
end;

procedure TPrincipal.ContasPagar1Click(Sender: TObject);
begin
 if not Ativacao('FRMRELCONTASPAGAR') then
  begin
   Application.CreateForm(TfrmRelContasPagar,frmRelContasPagar);
  end;
end;

procedure TPrincipal.Compra2Click(Sender: TObject);
begin
 if not Ativacao('FRMRELCOMPRAS') then
  begin
   Application.CreateForm(TfrmRelCompras,frmRelCompras);
  end;
end;

procedure TPrincipal.Comisso1Click(Sender: TObject);
begin
 if not Ativacao('FRMRELCOMISSAO') then
  begin
   Application.CreateForm(TfrmRelComissao,frmRelComissao);
  end;
end;

procedure TPrincipal.Pedido2Click(Sender: TObject);
begin
 if not Ativacao('FRMRELPEDIDO') then
  begin
   Application.CreateForm(TfrmRelPedido,frmRelPedido);
  end;
end;

procedure TPrincipal.Produto3Click(Sender: TObject);
begin
 if not Ativacao('FRMRELPPRO') then
  begin
   Application.CreateForm(TfrmRelPro,frmRelPro);
  end;
end;

end.
