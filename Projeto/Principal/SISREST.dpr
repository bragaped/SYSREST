program SISREST;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {Principal},
  udmSYS in 'udmSYS.pas' {dmSYS: TDataModule},
  uSobre in '..\Help_Sobre\uSobre.pas' {frmSobre},
  upadraocad in '..\Padroes\upadraocad.pas' {frmPadraoCadastro},
  uCidade in '..\Cadastros\Cidade\uCidade.pas' {frmCidade},
  uCliente in '..\Cadastros\Cliente\uCliente.pas' {frmCliente},
  uFornecedor in '..\Cadastros\Fornecedor\uFornecedor.pas' {frmFornecedor},
  uVariavel in '..\Unit\uVariavel.pas',
  uLogin in 'uLogin.pas' {frmLogin},
  uUsuario in '..\Cadastros\Usuario\uUsuario.pas' {frmUsuario},
  uFuncionario in '..\Cadastros\Funcionario\uFuncionario.pas' {frmFuncionario},
  uGrupo_Produto in '..\Cadastros\Grupo_Produto\uGrupo_Produto.pas' {frmGrupo_Produto},
  uProduto in '..\Cadastros\Produto\uProduto.pas' {frmProduto},
  uSetor in '..\Cadastros\Setor\uSetor.pas' {frmSetor},
  uMesa in '..\Cadastros\Mesa\uMesa.pas' {frmMesa},
  uCompra in '..\Cadastros\Compras\uCompra.pas' {frmCompra},
  uCod_Fiscal in '..\Cadastros\Cod_Fiscal\uCod_Fiscal.pas' {frmCod_Fiscal},
  uContas_Pagar in '..\Cadastros\Contas_Pagar\uContas_Pagar.pas' {frmContas_Pagar},
  uCheque in '..\Cadastros\Cheque\uCheque.pas' {frmCheque},
  uVendas in '..\Cadastros\Vendas\uVendas.pas' {frmVendas},
  uAbtCaixa in '..\Cadastros\Caixa\uAbtCaixa.pas' {frmAbtCaixa},
  uFecCaixa in '..\Cadastros\Caixa\uFecCaixa.pas' {frmFecCaixa},
  uRelCli in '..\Relatorios\Cliente\uRelCli.pas' {frmRelCli},
  SysUtils,
  uINI in 'uINI.pas' {frmINI},
  uMovCaixa in '..\Cadastros\Caixa\uMovCaixa.pas' {frmMov_Caixa},
  ugridPedido in '..\Cadastros\Princ Vendas\ugridPedido.pas' {frmGridPedido},
  uRelCheque in '..\Relatorios\Cheque\uRelCheque.pas' {frmRelCheque},
  uRelFor in '..\Relatorios\Fornecedor\uRelFor.pas' {frmRelFor},
  uRelPro in '..\Relatorios\Produto\uRelPro.pas' {frmRelPro},
  uTrocaMesa in '..\Cadastros\Princ Vendas\uTrocaMesa.pas' {frmTrocaMesa},
  uRelComissao in '..\Relatorios\Comissão\uRelComissao.pas' {frmRelComissao},
  uRelCompras in '..\Relatorios\Compras\uRelCompras.pas' {frmRelCompras},
  uRelPed in '..\Relatorios\Pedido\uRelPed.pas' {frmRelPedido},
  uRelFunc in '..\Relatorios\Funcionario\uRelFunc.pas' {frmRelFunc},
  uRelContas in '..\Relatorios\Contas_Pagar\uRelContas.pas' {frmRelContasPagar};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SISREST - AUTOMAÇÃO DE RESTAURANTE';
  Application.CreateForm(TdmSYS, dmSYS);
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TfrmINI, frmINI);
  Application.CreateForm(TfrmLogin, frmLogin);
  frmINI.Show;
  frmINI.Refresh;
  Sleep(1000);
  frmINI.Release;
  frmINI := nil;
  Application.Run;
end.
