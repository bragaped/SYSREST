unit udmSYS;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBTable,Messages,
  Dialogs, Menus, IBQuery, Grids, DBGrids, IBStoredProc;

type
  TdmSYS = class(TDataModule)
    ibdSYS_DATABASE: TIBDatabase;
    ibtSYS_DATABASE: TIBTransaction;
    ibtCliente: TIBTable;
    ibtCidade: TIBTable;
    ibtFornecedor: TIBTable;
    ibtFuncionario: TIBTable;
    dsCliente: TDataSource;
    dsCidade: TDataSource;
    dsFuncionario: TDataSource;
    dsFornecedor: TDataSource;
    ibtClienteCLI_COD: TIntegerField;
    ibtClienteCID_COD: TIntegerField;
    ibtClienteCLI_NOM: TIBStringField;
    ibtClienteCLI_CPFCNPJ: TIBStringField;
    ibtClienteCLI_RGIE: TIBStringField;
    ibtClienteCLI_TEL: TIBStringField;
    ibtClienteCLI_SIT: TIBStringField;
    ibtClienteCLI_END: TIBStringField;
    ibtClienteCLI_TIP: TIntegerField;
    ibtClienteCLI_SEX: TIBStringField;
    ibtClienteCLI_BAI: TIBStringField;
    ibtClienteCLI_EMAIL: TIBStringField;
    ibtClienteCLI_COM: TIBStringField;
    ibtCidadeCID_COD: TIntegerField;
    ibtCidadeCID_NOM: TIBStringField;
    ibtCidadeEST_SIG: TIBStringField;
    ibtFornecedorFOR_COD: TIntegerField;
    ibtFornecedorCID_COD: TIntegerField;
    ibtFornecedorFOR_TEL: TIBStringField;
    ibtFornecedorFOR_END: TIBStringField;
    ibtFornecedorFOR_BAI: TIBStringField;
    ibtFornecedorFOR_EMAIL: TIBStringField;
    ibtFornecedorFOR_CNPJCPF: TIBStringField;
    ibtFornecedorFOR_IERG: TIBStringField;
    ibtFornecedorFOR_TIP: TIntegerField;
    ibtFornecedorFOR_SIT: TIBStringField;
    ibtFornecedorFOR_NOM_FANT: TIBStringField;
    ibtClienteCLI_CEP: TIBStringField;
    ibtFornecedorFAR_RAZ_SOC: TIBStringField;
    ibtFornecedorFOR_CEP: TIBStringField;
    ibtFuncionarioFUN_COD: TIntegerField;
    ibtFuncionarioCID_COD: TIntegerField;
    ibtFuncionarioFUN_NOM: TIBStringField;
    ibtFuncionarioFUN_TEL: TIBStringField;
    ibtFuncionarioFUN_CPF: TIBStringField;
    ibtFuncionarioFUN_RG: TIBStringField;
    ibtFuncionarioFUN_SIT: TIBStringField;
    ibtFuncionarioFUN_DTAADM: TDateField;
    ibtFuncionarioFUN_END: TIBStringField;
    ibtFuncionarioFUN_BAI: TIBStringField;
    ibtFuncionarioFUN_CEP: TIBStringField;
    ibtFuncionarioFUN_EMAIL: TIBStringField;
    ibtUsuario: TIBTable;
    dsUsuario: TDataSource;
    ibtFuncionarioFUN_FUNC: TIBStringField;
    ibtFuncionarioFUN_SEX: TIBStringField;
    ibtGrupPro: TIBTable;
    dsGrupPro: TDataSource;
    ibtGrupProGRU_COD: TIntegerField;
    ibtGrupProGRU_NOM: TIBStringField;
    ibtProduto: TIBTable;
    ibtProd_Comp: TIBTable;
    dsProduto: TDataSource;
    dsProd_Comp: TDataSource;
    ibtSetor: TIBTable;
    ibtMesa: TIBTable;
    ibtJunta_Mesa: TIBTable;
    ibtSetorSET_COD: TIntegerField;
    ibtSetorSET_NOM: TIBStringField;
    ibtSetorSET_DESC: TIBStringField;
    dsSetor: TDataSource;
    dsJunta_Mesa: TDataSource;
    dsMesa: TDataSource;
    ibtFuncionarioFUN_COM: TIBStringField;
    ibtProd_CompCOMP_PRO_COD: TIntegerField;
    ibtProd_CompPRO_COD: TIntegerField;
    ibtProd_CompCOMP_QTD: TFloatField;
    ibtMesaMESA_COD: TIntegerField;
    ibtMesaSET_COD: TIntegerField;
    ibtMesaMESA_LUG: TIntegerField;
    ibtMesaMESA_SIT: TIBStringField;
    ibtJunta_MesaMESA_COD: TIntegerField;
    ibtJunta_MesaMESA_FIL: TIntegerField;
    ibtProdutoPRO_COD: TIntegerField;
    ibtProdutoGRU_COD: TIntegerField;
    ibtProdutoPRO_NOM: TIBStringField;
    ibtProdutoPRO_PRE: TFloatField;
    ibtProdutoPRO_TIP: TIBStringField;
    ibtProdutoPRO_UNI: TIBStringField;
    ibtProdutoPRO_ESTMIN: TFloatField;
    ibtProdutoPRO_SIT: TIBStringField;
    ibtProdutoPRO_ICM: TIntegerField;
    ibtCompra: TIBTable;
    ibtItens_Compra: TIBTable;
    ibtItens_CompraCOM_NRODOC: TIntegerField;
    ibtItens_CompraFOR_COD: TIntegerField;
    ibtItens_CompraPRO_COD: TIntegerField;
    ibtItens_CompraITCOM_QTD: TFloatField;
    ibtItens_CompraITCOM_VAL: TFloatField;
    ibtContas_Pagar: TIBTable;
    dsContas_Pagar: TDataSource;
    dsItens_Compra: TDataSource;
    ibtCod_Fiscal: TIBTable;
    ibtCompraCOM_NRODOC: TIntegerField;
    ibtCompraFOR_COD: TIntegerField;
    ibtCompraCOM_DATENT: TDateField;
    ibtCompraCOM_DATEMI: TDateField;
    ibtCompraCOM_VALNOT: TFloatField;
    ibtCompraCOM_PERDEC: TFloatField;
    ibtCompraCOM_VALFRETE: TFloatField;
    ibtCompraFISC_COD: TIntegerField;
    dsCod_Fiscal: TDataSource;
    ibtCheque: TIBTable;
    ibtCaixa: TIBTable;
    ibtMov_Caixa: TIBTable;
    ibtPedido: TIBTable;
    ibtItem_Pedido: TIBTable;
    dsCaixa: TDataSource;
    dsMov_Caixa: TDataSource;
    dsPedido: TDataSource;
    dsItem_Pedido: TDataSource;
    dsCheque: TDataSource;
    ibtCod_FiscalFISC_COD: TIntegerField;
    ibtCod_FiscalCFOP1: TIntegerField;
    ibtCod_FiscalCFOP2: TIntegerField;
    ibtCod_FiscalCFOP3: TIntegerField;
    ibtCod_FiscalFISC_NATOPR: TIBStringField;
    ibtCod_FiscalFISC_TIPO: TIBStringField;
    ibtCod_FiscalFISC_CODCONTABIL: TIntegerField;
    ibtCod_FiscalFISC_GRCONT: TIBStringField;
    ibtCod_FiscalFISC_TIPOICM: TIBStringField;
    ibtCod_FiscalFISC_TIPOIPI: TIBStringField;
    ibtLookProduto: TIBTable;
    dsLookProduto: TDataSource;
    ibtProd_CompNomeComp: TStringField;
    ibtItens_CompraNomeProduto: TStringField;
    ibtUsuarioUSE_COD: TIntegerField;
    ibtUsuarioNOME: TIBStringField;
    ibtUsuarioSENHA: TIBStringField;
    ibtClienteCLI_OBS: TBlobField;
    ibtFornecedorFOR_OBS: TBlobField;
    ibtCod_FiscalFISC_DESC: TBlobField;
    ibtCompraCOM_OBS: TBlobField;
    ibtFuncionarioFUN_OBS: TBlobField;
    ibtItens_CompraITCOM_PERDESC: TFloatField;
    ibtCompraCOM_ICM: TFloatField;
    ibtCompraCOM_IPI: TFloatField;
    ibtProdutoPRO_QTD: TFloatField;
    ibtProdutoPRO_CODTRIBUT: TIBStringField;
    ibtItens_CompraValTotal: TFloatField;
    ibtContas_PagarCONT_VALPAGAR: TFloatField;
    ibtContas_PagarCONT_DATVENC: TDateField;
    ibtContas_PagarCONT_VALPAGO: TFloatField;
    ibtContas_PagarCONT_DATPAG: TDateField;
    ibtContas_PagarCONT_OBS: TBlobField;
    ibtContas_PagarCONT_PARC: TIntegerField;
    ibtContas_PagarFOR_COD: TIntegerField;
    ibtContas_PagarCONT_NRODOC: TIntegerField;
    qryValidacao: TIBQuery;
    ibtItens_CompraITCOM_ICM: TIntegerField;
    ibtDep_Cheque: TIBTable;
    dsDep_Cheque: TDataSource;
    ibtUsuarioUSE_DESC: TBlobField;
    ibtChequeCHE_AGEN: TIntegerField;
    ibtChequeCHE_BANCO: TIntegerField;
    ibtChequeCHE_NUM: TIntegerField;
    ibtChequeCHE_CONTA: TIntegerField;
    ibtChequePED_COD: TIntegerField;
    ibtChequeCHE_VALOR: TFloatField;
    ibtChequeCHE_DATENT: TDateField;
    ibtChequeCHE_DTAEMI: TDateField;
    ibtChequeCHE_TIP: TIBStringField;
    ibtChequeCHE_OBS: TBlobField;
    ibtChequeCLI_COD: TIntegerField;
    ibtChequeCHE_DATPDEP: TDateField;
    ibtDep_ChequeCHE_AGEN: TIntegerField;
    ibtDep_ChequeCLI_COD: TIntegerField;
    ibtDep_ChequeCHE_BANCO: TIntegerField;
    ibtDep_ChequeCHE_NUM: TIntegerField;
    ibtDep_ChequeCHE_CONTA: TIntegerField;
    ibtDep_ChequeDEP_NUM: TIntegerField;
    ibtDep_ChequeDEP_LANC: TDateField;
    ibtDep_ChequeDEP_DEP: TDateField;
    ibtDep_ChequeDEP_OBS: TIBStringField;
    ibtDep_ChequeDEP_SIT: TIBStringField;
    ibtChequeCHE_NOME: TIBStringField;
    ibtCaixaCAI_NUM: TIntegerField;
    ibtCaixaCAI_DATAABT: TDateField;
    ibtCaixaCAI_HORAABT: TTimeField;
    ibtCaixaCAI_VALINI: TFloatField;
    ibtCaixaCAI_DATAFCH: TDateField;
    ibtCaixaCAI_HORAFCH: TTimeField;
    ibtCaixaCAI_VALDIN: TFloatField;
    ibtCaixaCAI_VALCHE: TFloatField;
    ibtCaixaCAI_VALFECDIN: TFloatField;
    ibtCaixaCAI_VALFECCHE: TFloatField;
    ibtCaixaCAI_VALCART: TFloatField;
    ibtCaixaCAI_VALFECCART: TFloatField;
    ibtMov_CaixaCAI_NUM: TIntegerField;
    ibtMov_CaixaMOV_COD: TIntegerField;
    ibtMov_CaixaUSE_COD: TIntegerField;
    ibtMov_CaixaMOV_TIP: TIBStringField;
    ibtMov_CaixaMOV_VAL: TFloatField;
    ibtMov_CaixaMOV_TIP_VAL: TIBStringField;
    ibtMov_CaixaMOV_MOT: TBlobField;
    ibtFuncionarioCOMISSAO: TFloatField;
    ibtPedidoPED_COD: TIntegerField;
    ibtPedidoMESA_COD: TIntegerField;
    ibtPedidoCAI_NUM: TIntegerField;
    ibtPedidoFUN_COD: TIntegerField;
    ibtPedidoPED_VALTOTAL: TFloatField;
    ibtPedidoPED_SIT: TIBStringField;
    ibtPedidoPGT_DIN: TFloatField;
    ibtPedidoPGT_CART: TFloatField;
    ibtPedidoPGT_CHE: TFloatField;
    ibtItem_PedidoPED_COD: TIntegerField;
    ibtItem_PedidoPRO_COD: TIntegerField;
    ibtItem_PedidoITPED_VAL: TFloatField;
    ibtItem_PedidoNome: TStringField;
    ibtItem_PedidoValor_Item: TFloatField;
    ibtItem_PedidoITPED_QTDTOTAL: TIntegerField;
    ibtItem_PedidoITPED_QTD: TIntegerField;
    ibtPedidoPED_DAT: TDateField;
    ibspFaturar: TIBStoredProc;
    ibtLookMesa: TIBTable;
    ibtLookMesaMESA_COD: TIntegerField;
    ibtLookMesaSET_COD: TIntegerField;
    ibtLookMesaMESA_LUG: TIntegerField;
    ibtLookMesaMESA_SIT: TIBStringField;
    dsLookMesa: TDataSource;
    dsCompra: TDataSource;
    ibtContas_Pagar_Compras: TIBTable;
    FloatField1: TFloatField;
    DateField1: TDateField;
    FloatField2: TFloatField;
    DateField2: TDateField;
    BlobField1: TBlobField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    dsContas_Pagar_Compras: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ibtProd_CompBeforePost(DataSet: TDataSet);
    procedure ibtItens_CompraCalcFields(DataSet: TDataSet);
    procedure ibtContas_PagarBeforePost(DataSet: TDataSet);
    procedure ibtContas_PagarCONT_OBSGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ibtItens_CompraAfterPost(DataSet: TDataSet);
    procedure ibtItens_CompraPRO_CODValidate(Sender: TField);
    procedure ibtContas_PagarCONT_DATVENCSetText(Sender: TField;
      const Text: String);
    procedure ibtContas_PagarCONT_PARCValidate(Sender: TField);
    procedure ibtContas_PagarCONT_VALPAGARValidate(Sender: TField);
    procedure ibtItens_CompraITCOM_QTDValidate(Sender: TField);
    procedure ibtItens_CompraITCOM_VALValidate(Sender: TField);
    procedure ibtProd_CompCOMP_PRO_CODValidate(Sender: TField);
    procedure ibtItens_CompraBeforePost(DataSet: TDataSet);
    procedure ibtContas_PagarCONT_DATPAGSetText(Sender: TField;
      const Text: String);
    procedure ibtChequeCHE_NUMValidate(Sender: TField);
    procedure ibtDep_ChequeDEP_LANCSetText(Sender: TField;
      const Text: String);
    procedure ibtDep_ChequeDEP_DEPSetText(Sender: TField;
      const Text: String);
    procedure ibtDep_ChequeBeforePost(DataSet: TDataSet);
    procedure evRetornaSituacaoCompleta(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure evATribuirSituacaoReduzida(Sender: TField;
      const Text: String);
    procedure ibtJunta_MesaSitGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ibtCaixaAfterInsert(DataSet: TDataSet);
    procedure ibtItem_PedidoPRO_CODValidate(Sender: TField);
    procedure ibtItem_PedidoBeforePost(DataSet: TDataSet);
    procedure ibtItem_PedidoAfterPost(DataSet: TDataSet);
    procedure ibtProd_CompCOMP_QTDValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSYS: TdmSYS;

implementation

uses uPrincipal, uCompra, uVariavel, Controls, uContas_Pagar, uCheque,
  ugridPedido;

{$R *.dfm}

procedure TdmSYS.DataModuleDestroy(Sender: TObject);
begin
 ibdSYS_DATABASE.Close;
 ibtSYS_DATABASE.Active := False;
end;

procedure TdmSYS.ibtProd_CompBeforePost(DataSet: TDataSet);
begin
  ibtProd_Comp.FieldByName('PRO_COD').AsInteger := ibtProduto.FieldByName('PRO_COD').AsInteger;
end;

procedure TdmSYS.ibtItens_CompraCalcFields(DataSet: TDataSet);
var valtotal: Real;
begin
  with ibtItens_Compra do
   begin
    valtotal := FieldByName('ITCOM_VAL').AsFloat * FieldByName('ITCOM_QTD').AsInteger;
    valtotal := valtotal - (valtotal*FieldByName('ITCOM_PERDESC').AsFloat/100);
    FieldByName('ValTotal').AsFloat := valtotal;
   end;
end;

procedure TdmSYS.ibtItens_CompraAfterPost(DataSet: TDataSet);
begin
  ibtSYS_DATABASE.CommitRetaining;
end;

procedure TdmSYS.ibtContas_PagarBeforePost(DataSet: TDataSet);
begin
 if (ibtContas_Pagar.State in [dsInsert]) then
  if (not(ibtContas_Pagar.FieldByName('CONT_NRODOC').IsNull) and not(ibtContas_Pagar.FieldByName('FOR_COD').IsNull)) then
   if (ibtCompra.State in [dsInsert]) then
    begin
     ibtContas_Pagar.FieldByName('CONT_NRODOC').AsInteger := ibtCompra.FieldByName('COM_NRODOC').AsInteger;
     ibtContas_Pagar.FieldByName('FOR_COD').AsInteger := ibtCompra.FieldByName('FOR_COD').AsInteger;
    end;
 ibtContas_PagarCONT_VALPAGARValidate(ibtContas_PagarCONT_VALPAGAR);
 ibtContas_PagarCONT_DATVENCSetText(ibtContas_PagarCONT_DATVENC,DateToStr(ibtContas_PagarCONT_DATVENC.Value));
end;

procedure TdmSYS.ibtContas_PagarCONT_OBSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Sender.AsString;
end;


procedure TdmSYS.ibtItens_CompraPRO_CODValidate(Sender: TField);
begin
 qryValidacao.Close;
 qryValidacao.SQL.Clear;
 qryValidacao.SQL.Add('select * from Produto where PRO_COD=:Codigo');
 if (ibtItens_Compra.FieldByName('PRO_COD').IsNull) then
  begin
   qryValidacao.ParamByName('Codigo').AsInteger := 0;
  end
 else
   qryValidacao.ParamByName('Codigo').AsInteger := StrToIntDef(ibtItens_Compra.FieldByName('PRO_COD').Value,0);
 qryValidacao.Open;
 if (qryValidacao.RecordCount = 0) then
  begin
   if (ibtItens_Compra.State in [dsInsert]) then
    begin
     qryValidacao.Close;
     MessageDlg('Produto Não Cadastrado'+#13+'Preciona ESC para Cancelar', mtWarning, [mbOK],0);
     Abort;
    end;
  end
 else
  begin
   qryValidacao.Close;
   qryValidacao.SQL.Clear;
   qryValidacao.SQL.Add('select * from Item_Compra where PRO_COD=:Codigo and ');
   qryValidacao.SQL.Add('COM_NRODOC=:Nota and FOR_COD=:Fornec');
   qryValidacao.ParamByName('Codigo').AsInteger := ibtItens_Compra.FieldByName('PRO_COD').Value;
   qryValidacao.ParamByName('Nota').AsInteger := ibtItens_Compra.FieldByName('COM_NRODOC').Value;
   qryValidacao.ParamByName('Fornec').AsInteger := ibtItens_Compra.FieldByName('FOR_COD').Value;
   qryValidacao.Open;
   if not(qryValidacao.RecordCount = 0) then
    begin
     if (ibtItens_Compra.State in [dsInsert,dsEdit]) then
      MessageDlg('Produto já Cadastrado'+#13+'A Operação sera Cancelada', mtWarning, [mbOK],0);
      Abort;
    end
  end;
end;

procedure TdmSYS.ibtContas_PagarCONT_DATVENCSetText(Sender: TField;
  const Text: String);
var data : Tdatetime;
    texto:string;
begin
 Texto := Text;
 data := StrToDate('01/01/1900');
 if StrToDateDef(texto,data) = data then begin
   ShowMessage('Data Invalida');
   Abort;
  end
 else
  ibtContas_Pagar.FieldByName('CONT_DATVENC').AsDateTime := StrToDate(texto);
end;

procedure TdmSYS.ibtContas_PagarCONT_PARCValidate(Sender: TField);
begin
  qryValidacao.Close;
  qryValidacao.SQL.Clear;
  qryValidacao.SQL.Add('select * from CONTAS_PAGAR where CONT_PARC=:Parcela and FOR_COD=:Fornec and CONT_NRODOC=:NF');
  if (ibtContas_Pagar.FieldByName('CONT_PARC').IsNull) then
   begin
    qryValidacao.ParamByName('Parcela').AsInteger := 0;
    qryValidacao.ParamByName('Fornec').AsInteger := 0;
    qryValidacao.ParamByName('NF').AsInteger := 0;
   end
  else
   begin
    qryValidacao.ParamByName('Parcela').AsInteger := StrToIntDef(ibtContas_Pagar.FieldByName('CONT_PARC').Value,0);
    qryValidacao.ParamByName('Fornec').AsInteger := StrToIntDef(ibtContas_Pagar.FieldByName('FOR_COD').Value,0);
    qryValidacao.ParamByName('NF').AsInteger := StrToIntDef(ibtContas_Pagar.FieldByName('CONT_NRODOC').Value,0);
   end;
  qryValidacao.Open;
  if not(qryValidacao.RecordCount = 0) then
   begin
    if (ibtContas_Pagar.State in [dsInsert]) then
     begin
      qryValidacao.Close;
      MessageDlg('Parcela Já Cadastrada', mtWarning, [mbOK],0);
      //ibtContas_Pagar.Cancel;
      Abort;
     end;
   end
  else
   if (ibtContas_Pagar.FieldByName('CONT_PARC').IsNull) or
      (ibtContas_Pagar.FieldByName('CONT_PARC').AsInteger = 0) then
    begin
     qryValidacao.Close;
     MessageDlg('Parcela Invalida', mtWarning, [mbOK],0);
     Abort;
    end;
end;

procedure TdmSYS.ibtContas_PagarCONT_VALPAGARValidate(Sender: TField);
begin
 if (ibtContas_Pagar.FieldByName('CONT_VALPAGAR').IsNull) or
    (ibtContas_Pagar.FieldByName('CONT_VALPAGAR').AsInteger = 0) then
  begin
   MessageDlg('Valor da Parcela Invalido', mtWarning, [mbOK],0);
   Abort;
  end;
end;

procedure TdmSYS.ibtItens_CompraITCOM_QTDValidate(Sender: TField);
begin
 if (ibtItens_Compra.FieldByName('ITCOM_QTD').IsNull) or
    (ibtItens_Compra.FieldByName('ITCOM_QTD').AsInteger = 0) then
  begin
   MessageDlg('Quantidade Invalida', mtWarning, [mbOK],0);
   Abort;
  end;
end;

procedure TdmSYS.ibtItens_CompraITCOM_VALValidate(Sender: TField);
begin
  if (ibtItens_Compra.FieldByName('ITCOM_VAL').IsNull) or
     (ibtItens_Compra.FieldByName('ITCOM_VAL').AsInteger = 0) then
  begin
   MessageDlg('Valor do Item Invalido', mtWarning, [mbOK],0);
   Abort;
  end;
end;

procedure TdmSYS.ibtProd_CompCOMP_PRO_CODValidate(Sender: TField);
begin
 qryValidacao.Close;
 qryValidacao.SQL.Clear;
 qryValidacao.SQL.Add('select * from Produto where PRO_COD=:Codigo and PRO_TIP=:Tipo');
 if (ibtProd_Comp.FieldByName('COMP_PRO_COD').IsNull) then
  begin
   qryValidacao.ParamByName('Codigo').AsInteger := 0;
   qryValidacao.ParamByName('Tipo').AsString := 'M';
  end
 else
  begin
   qryValidacao.ParamByName('Codigo').AsInteger := StrToIntDef(ibtProd_Comp.FieldByName('COMP_PRO_COD').Value,0);
   qryValidacao.ParamByName('Tipo').AsString := 'M';
  end;
 qryValidacao.Open;
 if (qryValidacao.RecordCount = 0) then
  begin
   if (ibtProd_Comp.State in [dsInsert]) then
    begin
     qryValidacao.Close;
     MessageDlg('Produto Invalido'+#13+'Preciona ESC para Cancelar', mtWarning, [mbOK],0);
     Abort;
    end;
  end
 else
  begin
   qryValidacao.Close;
   qryValidacao.SQL.Clear;
   qryValidacao.SQL.Add('select * from COMPOSICAO where COMP_PRO_COD=:Cod_Comp and PRO_COD=:Cod_Pro');
   qryValidacao.ParamByName('Cod_Comp').AsInteger := ibtProd_Comp.FieldByName('COMP_PRO_COD').Value;
   qryValidacao.ParamByName('Cod_Pro').AsInteger := ibtProd_Comp.FieldByName('PRO_COD').Value;
   qryValidacao.Open;
   if not(qryValidacao.RecordCount = 0) then
    begin
     if (ibtProd_Comp.State in [dsInsert,dsEdit]) then
      MessageDlg('Produto já Cadastrado'+#13+'A Operação sera Cancelada', mtWarning, [mbOK],0);
      Abort;
    end
   else
    begin
     if (ibtProd_Comp.FieldByName('COMP_PRO_COD').IsNull) then begin
       MessageDlg('Produto Invalido', mtWarning, [mbOK],0);
       Abort;
      end;
    end;
  end;
end;

procedure TdmSYS.ibtItens_CompraBeforePost(DataSet: TDataSet);
begin
 if not(ibtItens_Compra.FieldByName('PRO_COD').IsNull) then
  begin
   ibtItens_Compra.FieldByName('COM_NRODOC').AsInteger := ibtCompra.FieldByName('COM_NRODOC').AsInteger;
   ibtItens_Compra.FieldByName('FOR_COD').AsInteger := ibtCompra.FieldByName('FOR_COD').AsInteger;
   ibtItens_CompraITCOM_QTDValidate(ibtItens_CompraITCOM_QTD);
   ibtItens_CompraITCOM_VALValidate(ibtItens_CompraITCOM_VAL);
  end;
end;

procedure TdmSYS.ibtContas_PagarCONT_DATPAGSetText(Sender: TField;
  const Text: String);
var data : Tdatetime;
    texto:string;
begin
 Texto := Text;
 if (texto <> '  /  /    ') then begin
  data := StrToDate('01/01/1900');
  if StrToDateDef(texto,data) = data then begin
    ShowMessage('Data Invalida');
    Abort;
   end
  else begin
    ibtContas_Pagar.FieldByName('CONT_DATPAG').AsDateTime := StrToDate(texto);
   end;
  end;
end;

procedure TdmSYS.ibtDep_ChequeDEP_LANCSetText(Sender: TField;
  const Text: String);
var data : Tdatetime;
    texto:string;
begin
 Texto := Text;
 //if (texto <> '  /  /    ') then begin
  data := StrToDate('01/01/1900');
  if StrToDateDef(texto,data) = data then begin
    ShowMessage('Data Invalida');
    Abort;
   end
  else begin
    ibtDep_Cheque.FieldByName('DEP_LANC').AsDateTime := StrToDate(texto);
   end;
 //end;
end;

procedure TdmSYS.ibtDep_ChequeDEP_DEPSetText(Sender: TField;
  const Text: String);
var data : Tdatetime;
    texto:string;
begin
 Texto := Text;
 if (texto <> '  /  /    ') then begin
  data := StrToDate('01/01/1900');
  if StrToDateDef(texto,data) = data then begin
    ShowMessage('Data Invalida');
    Abort;
   end
  else begin
    ibtDep_Cheque.FieldByName('DEP_DEP').AsDateTime := StrToDate(texto);
   end;
 end;
end;

procedure TdmSYS.ibtDep_ChequeBeforePost(DataSet: TDataSet);
begin
 ibtDep_Cheque.FieldByName('CHE_BANCO').AsInteger := ibtCheque.FieldByName('CHE_BANCO').AsInteger;
 ibtDep_Cheque.FieldByName('CHE_AGEN').AsInteger := ibtCheque.FieldByName('CHE_AGEN').AsInteger;
 ibtDep_Cheque.FieldByName('CHE_CONTA').AsInteger := ibtCheque.FieldByName('CHE_CONTA').AsInteger;
 ibtDep_Cheque.FieldByName('CLI_COD').AsInteger := ibtCheque.FieldByName('CLI_COD').AsInteger;
 ibtDep_Cheque.FieldByName('CHE_NUM').AsInteger := ibtCheque.FieldByName('CHE_NUM').AsInteger;
 if ibtDep_Cheque.FieldByName('DEP_LANC').IsNull then
  Abort;
end;

procedure TdmSYS.ibtChequeCHE_NUMValidate(Sender: TField);
begin     //Validação Cheque
 qryValidacao.Close;
 qryValidacao.SQL.Clear;
 qryValidacao.SQL.Add('select * from CHEQUE where cheque.cli_cod = :cli and');
 qryValidacao.SQL.Add('cheque.che_banco = :banc and cheque.che_agen = :agen and');
 qryValidacao.SQL.Add('cheque.che_conta = :conta and cheque.che_num = :nunche');
 qryValidacao.Prepare;


 if ibtCheque.FieldByName('cli_cod').IsNull then begin
   ShowMessage('Cliente Invalido');
   abort;
  end
 else
  qryValidacao.ParamByName('cli').AsInteger := ibtCheque.FieldByName('cli_cod').AsInteger;

 if ibtCheque.FieldByName('che_banco').IsNull then begin
   ShowMessage('Banco Invalido');
   abort;
  end
 else
  qryValidacao.ParamByName('banc').AsInteger := ibtCheque.FieldByName('che_banco').AsInteger;

 if ibtCheque.FieldByName('che_agen').IsNull then begin
   ShowMessage('Agência Invalido');
   abort;
  end
 else
  qryValidacao.ParamByName('agen').AsInteger := ibtCheque.FieldByName('che_agen').AsInteger;

 if ibtCheque.FieldByName('che_conta').IsNull then begin
   ShowMessage('Conta Invalido');
   abort;
  end
 else
  qryValidacao.ParamByName('conta').AsInteger := ibtCheque.FieldByName('che_conta').AsInteger;

 if ibtCheque.FieldByName('che_num').IsNull then begin
   ShowMessage('N° Cheque Invalido');
   abort;
  end
 else
  qryValidacao.ParamByName('nunche').AsInteger := ibtCheque.FieldByName('che_num').AsInteger;

 qryValidacao.Open;
 if not(qryValidacao.RecordCount = 0) then
  begin
   if (ibtCheque.State in [dsInsert,dsEdit]) then
    MessageDlg(#13+'Cheque já Cadastrado', mtWarning, [mbOK],0);
    Abort;
   end

end;

procedure TdmSYS.evRetornaSituacaoCompleta(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if AnsiUpperCase(sender.AsString) = 'D' then Text := 'Depositado'
   else
     if AnsiUpperCase(sender.asString) = 'F' then Text := 'Sem Fundo'
     else
       if AnsiUpperCase(sender.asString) = 'S' then Text := 'Sustado' ;
end;

procedure TdmSYS.evATribuirSituacaoReduzida(Sender: TField;
  const Text: String);
begin
   if AnsiUpperCase(Text) = 'DEPOSITADO' then  sender.asString := 'D'
   else
     if AnsiUpperCase(Text) = 'SEM FUNDO' then sender.asString := 'F'
     else
       if AnsiUpperCase(Text) = 'SUSTADO' then sender.AsString := 'S' ;
end;

procedure TdmSYS.ibtJunta_MesaSitGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
 if AnsiUpperCase(sender.AsString) = 'A' then Text := 'ABERTA'
  else
   if AnsiUpperCase(sender.AsString) = 'D' then Text := 'DISPONIVEL'
    else
     if AnsiUpperCase(sender.asString) = 'O' then Text := 'OCUPADA'
     else
      if AnsiUpperCase(sender.asString) = 'F' then Text := 'FECHADA'
      else
       if AnsiUpperCase(sender.asString) = 'I' then Text := 'INATIVA'
end;

procedure TdmSYS.ibtCaixaAfterInsert(DataSet: TDataSet);
begin
 ibtCaixa.FieldByName('CAI_DATAABT').Value := Date;
 ibtCaixa.FieldByName('CAI_HORAABT').Value := Time;
end;

procedure TdmSYS.ibtItem_PedidoPRO_CODValidate(Sender: TField);
begin
 qryValidacao.Close;
 qryValidacao.SQL.Clear;
 qryValidacao.SQL.Add('select * from Produto where PRO_COD=:Codigo');
 if (ibtItem_Pedido.FieldByName('PRO_COD').IsNull) then
  begin
   qryValidacao.ParamByName('Codigo').AsInteger := 0;
  end
 else
   qryValidacao.ParamByName('Codigo').AsInteger := StrToIntDef(ibtItem_Pedido.FieldByName('PRO_COD').Value,0);
 qryValidacao.Open;
 if (qryValidacao.RecordCount = 0) then
  begin
   if (ibtItem_Pedido.State in [dsInsert]) then
    begin
     qryValidacao.Close;
     MessageDlg('Produto Não Cadastrado'+#13+'Preciona ESC para Cancelar', mtWarning, [mbOK],0);
     Abort;
    end;
  end
 else
  begin
   qryValidacao.Close;
   qryValidacao.SQL.Clear;
   qryValidacao.SQL.Add('select * from Item_Pedido where PRO_COD=:Codigo and Ped_Cod=:Pedido');
   qryValidacao.ParamByName('Codigo').AsInteger := ibtItem_Pedido.FieldByName('PRO_COD').Value;
   qryValidacao.ParamByName('Pedido').AsInteger := ibtItem_Pedido.FieldByName('PED_COD').Value;
   qryValidacao.Open;
   if not(qryValidacao.RecordCount = 0) then
    begin
     if (ibtItem_Pedido.State in [dsInsert,dsEdit]) then
      MessageDlg('Produto já Cadastrado'+#13+'A Operação sera Cancelada', mtWarning, [mbOK],0);
      uVariavel.chamada := '2';
      Abort;
    end
  end;
end;

procedure TdmSYS.ibtItem_PedidoBeforePost(DataSet: TDataSet);
begin
 if not(ibtItem_Pedido.FieldByName('PRO_COD').IsNull) THEN
  begin
   if (ibtItem_Pedido.FieldByName('ITPED_QTDTOTAL').IsNull) then
    ibtItem_Pedido.FieldByName('ITPED_QTDTOTAL').AsInteger := 0;
   if (ibtItem_Pedido.FieldByName('ITPED_QTD').IsNull) then
    ibtItem_Pedido.FieldByName('ITPED_QTD').AsInteger := 0;
   if (ibtItem_Pedido.FieldByName('ITPED_VAL').IsNull) then
    ibtItem_Pedido.FieldByName('ITPED_VAL').AsInteger := 0;
  end;
end;

procedure TdmSYS.ibtItem_PedidoAfterPost(DataSet: TDataSet);
begin
 ibtSYS_DATABASE.CommitRetaining;
 frmGridPedido.ValorTotalPedido();
end;

procedure TdmSYS.ibtProd_CompCOMP_QTDValidate(Sender: TField);
begin
 if (ibtProd_Comp.FieldByName('COMP_QTD').IsNull) or
    (ibtProd_Comp.FieldByName('COMP_QTD').AsInteger < 0) then
  begin
   MessageDlg('Quantidade Invalida', mtWarning, [mbOK],0);
   Abort;
  end;
end;

end.

