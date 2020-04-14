unit uCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, ToolWin, DB, IBCustomDataSet, IBTable, Mask, IBQuery;

type
  TfrmCompra = class(TfrmPadraoCadastro)
    pgcNF: TPageControl;
    tbsItens: TTabSheet;
    tbsContPagar: TTabSheet;
    dbgItens: TDBGrid;
    dbgContPagar: TDBGrid;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    dbeCodFor: TDBEdit;
    pnNomFor: TPanel;
    bitConsFor: TBitBtn;
    Label8: TLabel;
    dbeNroNF: TDBEdit;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    dbeCod_Fisc: TDBEdit;
    pnDecCod: TPanel;
    Label19: TLabel;
    dtpDtaEmisao: TDateTimePicker;
    Label20: TLabel;
    dtpDtaEnt: TDateTimePicker;
    Label21: TLabel;
    dbeValNF: TDBEdit;
    Label22: TLabel;
    dbeDesc: TDBEdit;
    Label23: TLabel;
    dbeICM: TDBEdit;
    Label24: TLabel;
    dbeIPI: TDBEdit;
    Label25: TLabel;
    dbeFrete: TDBEdit;
    Label26: TLabel;
    dbmObs: TDBMemo;
    sbExcItensCompra: TSpeedButton;
    sbExcContPag: TSpeedButton;
    bitConsCodFisc: TBitBtn;
    bitConsCompra: TBitBtn;
    pnCFOP: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    qryCompra: TIBQuery;
    dsConsulta: TDataSource;
    cbFiltro: TComboBox;
    lbBusca: TLabel;
    dtpIni: TDateTimePicker;
    dtpFim: TDateTimePicker;
    edtNF: TEdit;
    lbDtaIni: TLabel;
    lbDtaFim: TLabel;
    lbnota: TLabel;
    edtForn: TEdit;
    lbfornecedor: TLabel;
    bitokdtp: TBitBtn;
    function ValorTotalItens(): Boolean;
    function ValorTotalParcelas(): Boolean;
    procedure Alter(sit: Char);
    procedure LocFor(Cod: Integer);
    procedure LocCod_Fisc(Cod: Integer);
    procedure Loc_Nota();
    procedure VerificaNota(NF,CodFor : Integer);
    procedure CarregaDatas();
    procedure SQL();
    procedure bitSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbeCodForChange(Sender: TObject);
    procedure bitConsForClick(Sender: TObject);
    procedure bitConsCodFiscClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure dbnNavegacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure tbsItensEnter(Sender: TObject);
    procedure tbsItensExit(Sender: TObject);
    procedure tbsContPagarEnter(Sender: TObject);
    procedure tbsContPagarExit(Sender: TObject);
    procedure dbgItensExit(Sender: TObject);
    procedure sbExcItensCompraClick(Sender: TObject);
    procedure sbExcContPagClick(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure dbgItensDblClick(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure edtFornChange(Sender: TObject);
    procedure dbeCodForExit(Sender: TObject);
    procedure dbeNroNFExit(Sender: TObject);
    procedure dbgItensEnter(Sender: TObject);
    procedure dbeCod_FiscChange(Sender: TObject);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure bitConsCompraClick(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure dbgItensKeyPress(Sender: TObject; var Key: Char);
    procedure dbgContPagarKeyPress(Sender: TObject; var Key: Char);
    procedure bitokdtpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompra: TfrmCompra;

implementation

uses udmSYS, uFuncionario, uPrincipal, uProduto, uUsuario, uVariavel,
  uFornecedor, uCod_Fiscal;

{$R *.dfm}

procedure TfrmCompra.Alter(sit: Char);   //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
 procedure AlteraValor(FT, TF :Boolean);
  begin
   dbeCodFor.ReadOnly := TF;
   dbeCod_Fisc.ReadOnly := TF;
   dbeNroNF.ReadOnly := TF;
   dbeValNF.ReadOnly := TF;
   dbeICM.ReadOnly := TF;
   dbeDesc.ReadOnly := TF;
   dbeIPI.ReadOnly := TF;
   dbeFrete.ReadOnly := TF;
   dbmObs.ReadOnly := TF;
   dbnNavegacao.Enabled := FT;
   bitConsFor.Enabled := FT;
   bitConsCodFisc.Enabled := FT;
   bitConsCompra.Enabled := TF;
   tbsItens.Enabled := FT;
   tbsContPagar.Enabled := FT;
  end;
begin
  case sit of
   'I':Begin  //Permição de Altração negada
        AlteraValor(False, True);
        Botoes('O'); //chamada da Ativação dos Botões
       end;
   'A':Begin  //Permição de Altração Autorizada
        AlteraValor(True, False);
        Botoes('I'); //chamada da Ativação dos Botões
       end;
  end;
if (dbeCodFor.Text <> '') then
  LocFor(StrToInt(dbeCodFor.Text));
if (dbeCod_Fisc.Text <> '') then
  LocCod_Fisc(StrToInt(dbeCod_Fisc.Text));
end;

procedure TfrmCompra.LocFor(Cod: Integer);
Begin
 with dmSYS do              //localização da cidade atravez da digitação do codigo
  Begin
    ibtFornecedor.Open;
    ibtFornecedor.Locate('FOR_COD',Cod,[loCaseInsensitive]);
    if (ibtFornecedor.FieldByName('FOR_COD').AsInteger = Cod) then
      Begin
        pnNomFor.Caption := ibtFornecedor.FieldByName('FOR_RAZ_SOC').AsString;
      end
    else
      Begin
        MessageDlg('Fornecedor não Cadastrada', mtInformation, [mbOK],0);
        dbeCodFor.SetFocus;
        pnNomFor.Caption := '';
      end;
  end;
end;

procedure TfrmCompra.VerificaNota(NF,CodFor : Integer);
begin
   qryCompra.Close;
   qryCompra.SQL.Clear;
   qryCompra.SQL.Add('select  FOR_COD, COM_NRODOC from compras');
   qryCompra.SQL.Add('where FOR_COD = :for and COM_NRODOC = :nf');
   qryCompra.Prepare;
   qryCompra.ParamByName('for').AsInteger := CodFor;
   qryCompra.ParamByName('nf').AsInteger := NF;
   qryCompra.Open;
   if not(qryCompra.FieldByName('FOR_COD').IsNull) and (dmSYS.ibtCompra.State in [dsInsert]) then
    begin
     MessageDlg('Nota já cadastrada pra esse Fornecedor!',mtWarning,[mbOK],0);
     dbeNroNF.SelectAll;
     dbeNroNF.SetFocus;
     exit;
    end;
end;

function TfrmCompra.ValorTotalItens(): Boolean;
var
totalitens, total:Double;
begin
 dmSYS.ibtItens_Compra.DisableControls;   //tabela
 dmSYS.ibtItens_Compra.First;
 totalitens:=0;
 while not dmSYS.ibtItens_Compra.Eof do begin
   totalitens:=totalitens+dmSYS.ibtItens_Compra.FieldByName('ValTotal').AsFloat; //somatoria
   dmSYS.ibtItens_Compra.Next;
  end ;
 dmSYS.ibtItens_Compra.EnableControls;
 total := dmSYS.ibtCompra.FieldByName('COM_VALNOT').AsFloat;
 if (totalitens > total) then
  begin
   ShowMessage('Valor Total do Itens Não pode ser maior que Valor da Nota '+#13
                +'Total dos Itens = '+FloatToStr(totalitens)+#13
                +'Total da Nota = '+FloatToStr(total));
   Result := False;
   pgcNF.TabIndex := 0;
   if MessageDlg('Deseja Alterar o Valor da Nota para o Valor dos Itens',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
     dbeValNF.Text := FloatToStr(totalitens);
     Result := True;
    end;
   Exit;
  end
 else
  begin
   if (totalitens < total) then
    begin
     ShowMessage('Total da Nota = '+FloatToStr(total)+#13
                +'Total dos Itens = '+FloatToStr(totalitens));
     if MessageDlg('Deseja Alterar o Valor da Nota para o Valor dos Itens',mtConfirmation, [mbYes,mbNo],0) = mrYes then
      dbeValNF.Text := FloatToStr(totalitens);
    end;
   Result := True;
  end;
end;

function TfrmCompra.ValorTotalParcelas(): Boolean;
var
totaliparc, total:Double;
begin
 dmSYS.ibtContas_Pagar_Compras.DisableControls;   //tabela
 dmSYS.ibtContas_Pagar_Compras.First;
 totaliparc:=0;
 while not dmSYS.ibtContas_Pagar_Compras.Eof do begin
   totaliparc:=totaliparc+dmSYS.ibtContas_Pagar_Compras.FieldByName('CONT_VALPAGAR').AsFloat; //somatoria
   dmSYS.ibtContas_Pagar_Compras.Next;
  end ;
 dmSYS.ibtContas_Pagar_Compras.EnableControls;
 total := dmSYS.ibtCompra.FieldByName('COM_VALNOT').AsFloat;
 if (totaliparc > total) then
  begin
   ShowMessage('Valor Total das Parcelas Não pode ser maior que Valor da Nota '+#13
                +'Total das Parcelas = '+FloatToStr(totaliparc)+#13
                +'Total da Nota = '+FloatToStr(total));
   Result := False;
   pgcNF.TabIndex := 1;
   Exit;
  end
 else
  begin
   Result := True;
   pgcNF.TabIndex := 0;
  end;
end;

procedure TfrmCompra.LocCod_Fisc(Cod: Integer);
Begin
 with dmSYS do              //localização da cidade atravez da digitação do codigo
  Begin
    ibtCod_Fiscal.Open;
    ibtCod_Fiscal.Locate('FISC_COD',Cod,[loCaseInsensitive]);
    if (ibtCod_Fiscal.FieldByName('FISC_COD').AsInteger = Cod) then
      Begin
      // if (ibtCod_Fiscal.FieldByName('FISC_TIPO').AsString = 'E') then
      //  begin
         pnCFOP.Caption := ibtCod_Fiscal.FieldByName('CFOP1').AsString;
         pnDecCod.Caption := ibtCod_Fiscal.FieldByName('FISC_NATOPR').AsString;
      //  end
      // else
      //  begin
      //   MessageDlg('Código Fiscal Invalido'+#13+#13+'SELECIONE UM DO TIPO ENTRADA', mtWarning,[mbOK],0);
      //   dbeCod_Fisc.Clear;
      //   dbeCod_Fisc.SetFocus;
      //  end;
      end
    else
      Begin
        MessageDlg('Codigo Fiscal não Cadastrada', mtInformation, [mbOK],0);
        dbeCod_Fisc.Clear;
        dbeCod_Fisc.SetFocus;
        pnDecCod.Caption := '';
        pnCFOP.Caption := '';
      end;
  end;
end;

procedure TfrmCompra.Loc_Nota();
begin
 if  pgcPadraoCad.TabIndex = 1 then
   Begin
    dmSYS.ibtCompra.Locate('FOR_COD;COM_NRODOC',
              VarArrayOf([qryCompra.FieldByName('Codigo').Value,
              qryCompra.FieldByName('Nota').Value]),[loCaseInsensitive]);
    qryCompra.Close;
    pgcPadraoCad.TabIndex := 0;
    CarregaDatas; //Carrega Datas
   end;
end;

procedure TfrmCompra.CarregaDatas();
begin
  with dmSYS.ibtCompra do
   begin
    dtpDtaEmisao.Date := FieldByName('COM_DATEMI').AsDateTime;
    dtpDtaEnt.Date := FieldByName('COM_DATENT').AsDateTime;
   end;
end;

procedure TfrmCompra.SQL();
begin
 with qryCompra do
  begin
   if (edtNF.Text <> '') or (edtForn.Text <> '') or
     ((DateToStr(dtpIni.DateTime) <> '') and (DateToStr(dtpFim.DateTime) <> '')) then
    begin
     Close;
     SQL.Clear;
     case cbFiltro.ItemIndex of
      0:Begin
         SQL.Add('select compras.FOR_COD as Codigo, fornecedor.FOR_RAZ_SOC as Fornecedor,');
         SQL.Add('compras.com_nrodoc as Nota, codigo_fiscal.CFOP1 as Cod_Fiscal,');
         SQL.Add('compras.COM_VALNOT as Valor_Nota, compras.COM_DATEMI as Data_Emissao,');
         SQL.Add('compras.COM_DATENT as Data_Entrada, compras.COM_PERDEC as Desconto ');
         SQL.Add('from compras , fornecedor, codigo_fiscal');
         SQL.Add('where fornecedor.FOR_RAZ_SOC Like'+#39+Trim(edtForn.Text)+'%'+#39);
         SQL.Add('and fornecedor.for_cod = compras.for_cod and ');
         SQL.Add('compras.fisc_cod= codigo_fiscal.fisc_cod');
         SQL.Add('ORDER BY compras.FOR_COD,compras.com_nrodoc');
        End;
      1:Begin
         SQL.Add('select compras.FOR_COD as Codigo, fornecedor.FOR_RAZ_SOC as Fornecedor,');
         SQL.Add('compras.com_nrodoc as Nota, codigo_fiscal.CFOP1 as Cod_Fiscal,');
         SQL.Add('compras.COM_VALNOT as Valor_Nota, compras.COM_DATEMI as Data_Emissao,');
         SQL.Add('compras.COM_DATENT as Data_Entrada, compras.COM_PERDEC as Desconto ');
         SQL.Add('from compras , fornecedor, codigo_fiscal');
         SQL.Add('where compras.COM_DATEMI Between :nDataIni and :nDataFim');
         SQL.Add('and fornecedor.for_cod = compras.for_cod and ');
         SQL.Add('compras.fisc_cod= codigo_fiscal.fisc_cod');
         SQL.Add('ORDER BY compras.FOR_COD,compras.com_nrodoc');
         Prepare;
         ParamByName('nDataIni').AsDateTime := dtpIni.DateTime;
         ParamByName('nDataFim').AsDateTime := dtpFim.DateTime;
        End;
      2:Begin
         SQL.Add('select compras.FOR_COD as Codigo, fornecedor.FOR_RAZ_SOC as Fornecedor,');
         SQL.Add('compras.com_nrodoc as Nota, codigo_fiscal.CFOP1 as Cod_Fiscal,');
         SQL.Add('compras.COM_VALNOT as Valor_Nota, compras.COM_DATEMI as Data_Emissao,');
         SQL.Add('compras.COM_DATENT as Data_Entrada, compras.COM_PERDEC as Desconto ');
         SQL.Add('from compras , fornecedor, codigo_fiscal');
         SQL.Add('where compras.com_nrodoc Like'+#39+Trim(edtNF.Text)+'%'+#39);
         SQL.Add('and fornecedor.for_cod = compras.for_cod and ');
         SQL.Add('compras.fisc_cod= codigo_fiscal.fisc_cod');
         SQL.Add('ORDER BY compras.FOR_COD,compras.com_nrodoc');
        End;
	   end;
     qryCompra.Open;
    end
   else
    Begin
     Close;
     SQL.Clear;
     SQL.Add('select compras.FOR_COD as Codigo, fornecedor.FOR_RAZ_SOC as Fornecedor,');
     SQL.Add('compras.com_nrodoc as Nota, codigo_fiscal.CFOP1 as Cod_Fiscal,');
     SQL.Add('compras.COM_VALNOT as Valor_Nota, compras.COM_DATEMI as Data_Emissao,');
     SQL.Add('compras.COM_DATENT as Data_Entrada, compras.COM_PERDEC as Desconto ');
     SQL.Add('from compras, fornecedor, codigo_fiscal ORDER BY compras.FOR_COD,compras.com_nrodoc');
     Open;
    end;
  end;
end;

procedure TfrmCompra.bitSairClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtCompra.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        ibtCompra.Cancel;
        ibtItens_Compra.Cancel;
        ibtContas_Pagar.Cancel;
        Close;
       end;
     end
    else
      Close;
   end;
end;

procedure TfrmCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmSYS.ibtCompra.Close;
  dmSYS.dsCompra.AutoEdit := False;
  dmSYS.ibtItens_Compra.Close;
  dmSYS.dsItens_Compra.AutoEdit := False;
  //dmSYS.ibtProduto.Close;
  dmSYS.ibtContas_Pagar_Compras.Close;
  dmSYS.dsContas_Pagar_Compras.AutoEdit := False;
  Action := caFree;
end;

procedure TfrmCompra.FormCreate(Sender: TObject);
begin
  inherited;
  with dmSYS do
   begin
    ibtCompra.Open;
    dmSYS.dsCompra.AutoEdit := True;
    ibtItens_Compra.Open;
    dsItens_Compra.AutoEdit := True;
    ibtProduto.Open;
    //contas a Pagar
    ibtContas_Pagar_Compras.Open;
    dsContas_Pagar_Compras.AutoEdit := True;
    CarregaDatas;
    Alter('I');
    pgcPadraoCad.TabIndex := 0;
    pgcNF.TabIndex := 0;
    dbnNavegacao.DataSource := dsCompra;
   end;
end;

procedure TfrmCompra.dbeCodForChange(Sender: TObject);
begin
  inherited;
  if dbeCodFor.Text <> '' then
   begin
    LocFor(StrToInt(dbeCodFor.Text));
    if (uVariavel.chamada = 'C') then
     begin
      dmSYS.ibtCompra.FieldByName('FOR_COD').AsInteger := StrToInt(dbeCodFor.Text);
     end;
   end
  else
    Begin
      pnNomFor.Caption := '';
    end
end;

procedure TfrmCompra.bitConsForClick(Sender: TObject);
begin
  inherited;
  if (dbeCodFor.ReadOnly = False) then
   begin
    uVariavel.chamada:= '1';
    Application.CreateForm(TfrmFornecedor,frmFornecedor);
    frmFornecedor.Show;
    frmFornecedor.pgcPadraoCad.TabIndex := 1;
    exit;
   end;
end;

procedure TfrmCompra.bitConsCodFiscClick(Sender: TObject);
begin
  inherited;
  if (dbeCod_Fisc.ReadOnly = False) then
   begin
    uVariavel.chamada:= '1';
    Application.CreateForm(TfrmCod_Fiscal,frmCod_Fiscal);
    frmCod_Fiscal.Show;
    frmCod_Fiscal.pgcPadraoCad.TabIndex := 1;
    exit;
   end;
end;

procedure TfrmCompra.bitCancelarClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja Cancelar a Operação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      IF (uVariavel.insertCompra = 2) then
       begin
        ibtContas_Pagar.Cancel;
        ibtItens_Compra.CancelUpdates;
        ibtCompra.Cancel;
        ibtCompra.Delete;
       end
      else
       begin
        if (ibtItens_Compra.State in [dsEdit]) then
         ibtItens_Compra.CancelUpdates
        else
         ibtItens_Compra.Cancel;
        if (ibtContas_Pagar.State in [dsEdit]) then
         ibtContas_Pagar.CancelUpdates
        else
         ibtContas_Pagar.Cancel;
        ibtCompra.Cancel;
       end;
      Alter('I');  //Chamada da alterção dos DBEdits
      CarregaDatas;   ///Carrega as datas de lançamento da nota
     end;
   end;
end;

procedure TfrmCompra.bitExcluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtCompra.Locate('COM_NRODOC;FOR_COD',
           VarArrayOf([qryCompra.FieldByName('Nota').Value,
           qryCompra.FieldByName('Fornecedor').Value]),[loCaseInsensitive]);
        if (ibtContas_Pagar.FieldByName('COM_NRODOC').AsInteger = 0) then
         begin
          MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
          Exit;
         end
        else
         begin
          ibtCompra.Delete;
          if (pgcPadraoCad.TabIndex = 1) then
           begin
            qryCompra.Close;
            qryCompra.Open;
           end;
         end;
       end
      else
       begin
        ibtCompra.Delete;
       end;
     end;
   end;
  Alter('I'); //Chamada da alterção dos DBEdits
  CarregaDatas;   ///Carrega as datas de lançamento da nota
end;

procedure TfrmCompra.bitIncluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    uVariavel.insertcompra :=2;//Atribuição para poder identiciar qual procedimento foi chamado
    if (qryCompra.Active = True) then
     qryCompra.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtCompra.Append;
    Alter('A');    //Chamada da alterção dos DBEdits
    dbeCodFor.SetFocus;
    ibtCod_Fiscal.Close;
    pnNomFor.Caption := '';
    dbeCod_Fisc.Text := '';
    pnDecCod.Caption := '';
    pnCFOP.Caption := '';
    ibtProduto.Open;
    ibtItens_Compra.Close;
    ibtContas_Pagar.Close;
    dtpDtaEmisao.Date := Date;
    dtpDtaEnt.Date := Date;
   end;
end;

procedure TfrmCompra.bitAlterarClick(Sender: TObject);
begin
  inherited;
  Loc_Nota;
  Alter('A');  //Chamada da alterção dos DBEdits
  uVariavel.insertCompra := 1; //Atribuição para poder identiciar qual procedimento foi chamado
  dmSYS.ibtCompra.Edit;
  dbeCodFor.ReadOnly := True;
  dbeNroNF.ReadOnly := True;
  bitConsFor.Enabled := False;
  dbeValNF.SetFocus;
end;

procedure TfrmCompra.bitokClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
  begin
   if (dbeCodFor.Text = '') then
    begin
     MessageDlg('Código Fornecedor em Branco',mtWarning,[mbOK],0);
     dbeCodFor.SetFocus;
     exit;
    end;
   if (dbeNroNF.Text = '') then
    begin
     MessageDlg('Número Nota Fiscal em Branco',mtWarning,[mbOK],0);
     dbeNroNF.SetFocus;
     exit;
    end;
   //verificar se a somatoria dos itens é maior que o valor da nota fical
   if not ValorTotalItens then
    begin
     //caso valor dos itens seja maior que valor da Nota Fiscal
     abort;
    end;
   //verificar se a somatoria das parcelas é maior que o valor da nota fical
   if not ValorTotalParcelas then
    begin
     //caso valor das parcelas seja maior que valor da Nota Fiscal
     abort;
    end;

   if (ibtCompra.State in [dsInsert, dsEdit]) then
    begin
     ibtCompra.FieldByName('COM_DATEMI').AsDateTime := dtpDtaEmisao.Date;
     ibtCompra.FieldByName('COM_DATENT').AsDateTime := dtpDtaEnt.Date;
     ibtCompra.Post;
     if (ibtItens_Compra.State in [dsEdit, dsInsert]) then
      ibtItens_Compra.Post;
     if (ibtContas_Pagar.State in [dsEdit, dsInsert]) then
      ibtContas_Pagar.Post;
     if not(uVariavel.insertCompra = 0) then
      begin
       Alter('I');
       uVariavel.insertCompra := 0;
      end;
     ibtSYS_DATABASE.CommitRetaining;
    end;

  end;
end;

procedure TfrmCompra.dbnNavegacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  CarregaDatas;
end;

procedure TfrmCompra.tbsItensEnter(Sender: TObject);
begin
  inherited;
  frmCompra.KeyPreview := False;
end;

procedure TfrmCompra.tbsItensExit(Sender: TObject);
begin
  inherited;
  frmCompra.KeyPreview := True;
end;

procedure TfrmCompra.tbsContPagarEnter(Sender: TObject);
begin
  inherited;
  frmCompra.KeyPreview := False;
end;

procedure TfrmCompra.tbsContPagarExit(Sender: TObject);
begin
  inherited;
  frmCompra.KeyPreview := True;
end;

procedure TfrmCompra.dbgItensExit(Sender: TObject);
begin
  inherited;
  if (dmSYS.ibtItens_Compra.State in [dsEdit, dsInsert]) then
   tbsItens.SetFocus;
end;

procedure TfrmCompra.sbExcItensCompraClick(Sender: TObject);
begin
  inherited;
  dmSYS.ibtItens_Compra.Delete;
end;

procedure TfrmCompra.sbExcContPagClick(Sender: TObject);
begin
  inherited;
  dmSYS.ibtContas_Pagar.Delete;
end;

procedure TfrmCompra.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  if not(dmSYS.ibtCompra.State in [dsInsert, dsEdit]) then
   begin
    qryCompra.Open;
   end;
end;

procedure TfrmCompra.dbgItensDblClick(Sender: TObject);
begin
  inherited;
  if (dbgItens.ReadOnly = False) then
   begin
    uVariavel.chamada:= '1';
    if not Principal.Ativacao('FRMPRODUTO') then
     begin
      Application.CreateForm(TfrmProduto,frmProduto);
     end;
    frmProduto.Show;
    frmProduto.pgcPadraoCad.TabIndex := 1;
    frmProduto.cbFiltro.SetFocus;
   end;
end;

procedure TfrmCompra.cbFiltroChange(Sender: TObject);
 procedure Consulta(nf,forn,dta : Boolean);
  begin
   lbDtaIni.Visible := dta;
   lbDtaFim.Visible := dta;
   dtpIni.Visible := dta;
   dtpFim.Visible := dta;
   bitokdtp.Visible := dta;
   lbnota.Visible := nf;
   edtNF.Visible := nf;
   lbfornecedor.Visible := forn;
   edtForn.Visible := forn;
  end;
begin
  inherited;
  dtpIni.DateTime := Date;
  dtpFim.DateTime := Date;
  if (cbFiltro.ItemIndex = -1) then
   begin
    Consulta(False,False,False);
    exit;
   end;
  if (cbFiltro.ItemIndex = 0) then
   begin
    Consulta(False,True,False);
    exit;
   end
  else
   begin
    if (cbFiltro.ItemIndex = 1) then
     begin
      Consulta(False,False,True);
      exit;
     end
    else
     if (cbFiltro.ItemIndex = 2) then
      begin
       Consulta(True,False,False);
       exit;
      end;
  end;
end;

procedure TfrmCompra.edtFornChange(Sender: TObject);
begin
  SQL();
end;

procedure TfrmCompra.dbeCodForExit(Sender: TObject);
begin
  inherited;
  if (dmSYS.ibtCompra.State in [dsInsert]) and (dbeNroNF.Text <> '') and (dbeCodFor.Text <>'') then
   VerificaNota(StrToInt(dbeNroNF.Text),StrToInt(dbeCodFor.Text));
end;

procedure TfrmCompra.dbeNroNFExit(Sender: TObject);
begin
  inherited;
  if (dmSYS.ibtCompra.State in [dsInsert]) and (dbeNroNF.Text <> '') and (dbeCodFor.Text <>'') then
   begin
    VerificaNota(StrToInt(dbeNroNF.Text),StrToInt(dbeCodFor.Text));
   end;
  if (dbeNroNF.Text = '') then
     dbeNroNF.SetFocus;
end;

procedure TfrmCompra.dbgItensEnter(Sender: TObject);
begin
  inherited;
  if (dmSYS.ibtCompra.State in [dsInsert]) and (dbeNroNF.Text <> '') and (dbeCodFor.Text <>'') then
   if (uVariavel.insertCompra = 2) then
    begin
     //uVariavel.insertCompra := 2;
     dmSYS.ibtCompra.Post;
     dmSYS.ibtSYS_DATABASE.CommitRetaining;
     dmSYS.ibtCompra.Edit;
     dmSYS.ibtItens_Compra.Open
    end;
end;

procedure TfrmCompra.dbeCod_FiscChange(Sender: TObject);
begin
  inherited;
  if dbeCod_Fisc.Text <> '' then
   begin
    LocCod_Fisc(StrToInt(dbeCod_Fisc.Text));
    if (uVariavel.chamada = 'C') then
     begin
      dmSYS.ibtCompra.FieldByName('FISC_COD').AsInteger := StrToInt(dbeCod_Fisc.Text);
     end;
   end
  else
    Begin
      pnDecCod.Caption := '';
      pnCFOP.Caption := '';
    end
end;

procedure TfrmCompra.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   begin
    if ibtCompra.State in [dsInsert, dsEdit] then
     if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      begin
       AllowChange := True;
       ibtCompra.Cancel;
       Alter('I');
       pgcPadraoCad.TabIndex := 1;
       qryCompra.Open;    //Ativar a Query para trazer todos os registros
      end
     else
      begin
       AllowChange := False;
       if (qryCompra.Active = True) then
        qryCompra.Close;  //Desativar a Query
       Alter('A');
       pgcPadraoCad.TabIndex := 0;
      end;
    if qryCompra.Active then
     if pgcPadraoCad.TabIndex = 1 then
      Loc_Nota;  
   end;
end;

procedure TfrmCompra.bitConsCompraClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmCompra.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  if (dbnNavegacao.Enabled = False) then
   dbnNavegacao.Enabled := True;
end;

procedure TfrmCompra.dbgItensKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
  Begin
   key:=#0;
   if (sender is TDBGrid) then
    TDBGrid(Sender).Perform(WM_KEYDOWN,VK_RIGHT,0)
   else
    Perform(WM_NEXTDLGCTL,0,0);
  End;

end;

procedure TfrmCompra.dbgContPagarKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
  Begin
   key:=#0;
   if (sender is TDBGrid) then
    TDBGrid(Sender).Perform(WM_KEYDOWN,VK_RIGHT,0)
   else
    Perform(WM_NEXTDLGCTL,0,0);
  End;
end;

procedure TfrmCompra.bitokdtpClick(Sender: TObject);
begin
 if dtpIni.Date > dtpFim.Date then
  ShowMessage('Período Invalida')
 else
  SQL();
end;

end.


