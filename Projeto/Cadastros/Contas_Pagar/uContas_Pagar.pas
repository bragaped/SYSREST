unit uContas_Pagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, ToolWin, DB, Mask, IBCustomDataSet, IBTable, IBQuery;

type
  TfrmContas_Pagar = class(TfrmPadraoCadastro)
    Label2: TLabel;
    dbeNroDoc: TDBEdit;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    dbeCodFor: TDBEdit;
    pnNomFor: TPanel;
    bitConsFor: TBitBtn;
    Label3: TLabel;
    dbeParc: TDBEdit;
    Label4: TLabel;
    dbeValDoc: TDBEdit;
    Label5: TLabel;
    Label10: TLabel;
    dbmObs: TDBMemo;
    dtpVenc: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    dbeValPag: TDBEdit;
    Label7: TLabel;
    qryContas_Pagar: TIBQuery;
    dsContas_Pagar: TDataSource;
    dbeDtaPag: TDBEdit;
    lbBusca: TLabel;
    cbFiltro: TComboBox;
    lbfornecedor: TLabel;
    edtForn: TEdit;
    edtNF: TEdit;
    dtpFim: TDateTimePicker;
    dtpIni: TDateTimePicker;
    lbnota: TLabel;
    lbDtaFim: TLabel;
    lbDtaIni: TLabel;
    bitConsContas: TBitBtn;
    bitokdtp: TBitBtn;
    procedure Alter(sit : Char);
    procedure LocFor(cod : Integer);
    procedure CarregaDatas();
    procedure SQL();
    procedure LocConta();
    procedure bitSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bitConsForClick(Sender: TObject);
    procedure dbeCodForChange(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure dbnNavegacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure dbeParcEnter(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure edtFornChange(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure bitConsContasClick(Sender: TObject);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure bitokdtpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContas_Pagar: TfrmContas_Pagar;

implementation

uses udmSYS, uPrincipal, uFornecedor, uVariavel, DateUtils;

{$R *.dfm}

procedure TfrmContas_Pagar.Alter(sit: Char);   //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
 procedure AlteraValor(FT, TF :Boolean);
  begin
   dbeCodFor.ReadOnly := TF;
   dbeNroDoc.ReadOnly := TF;
   dbeParc.ReadOnly := TF;
   dbeValDoc.ReadOnly := TF;
   dbeValPag.ReadOnly := TF;
   dbmObs.ReadOnly := TF;
   dtpVenc.Enabled := FT;
   dbeDtaPag.ReadOnly := TF;
   bitConsFor.Enabled := FT;
   bitConsContas.Enabled := TF;
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
end;

procedure TfrmContas_Pagar.LocFor(Cod: Integer);
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

procedure TfrmContas_Pagar.LocConta();
begin
 if  pgcPadraoCad.TabIndex = 1 then
   Begin
    dmSYS.ibtContas_Pagar.Locate('FOR_COD;CONT_NRODOC;CONT_PARC',
              VarArrayOf([qryContas_Pagar.FieldByName('Codigo').Value,
              qryContas_Pagar.FieldByName('Nota').Value,
              qryContas_Pagar.FieldByName('Parcela').Value]),[loCaseInsensitive]);
    qryContas_Pagar.Close;
    pgcPadraoCad.TabIndex := 0;
    CarregaDatas; //Carrega Datas de vencimento
   end;
end;

procedure TfrmContas_Pagar.CarregaDatas();
begin
  with dmSYS.ibtContas_Pagar do
   begin
    dtpVenc.Date := FieldByName('CONT_DATVENC').AsDateTime;
    //dbeDtaPag.Text := FieldByName('CONT_DATPAG').AsDateTime;
   end;
end;

procedure TfrmContas_Pagar.bitSairClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtContas_Pagar.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        ibtContas_Pagar.Cancel;
        Close;
       end;
     end
    else
      Close;
   end;
end;

procedure TfrmContas_Pagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with dmSYS do
   begin
    dsContas_Pagar.AutoEdit := False;
    ibtContas_Pagar.Close;
   end;
  Action := caFree;
end;

procedure TfrmContas_Pagar.FormCreate(Sender: TObject);
begin
  inherited;
  with dmSYS do
   begin
    ibtContas_Pagar.MasterSource.Free;
    ibtContas_Pagar.MasterFields := '';
    ibtContas_Pagar.IndexFieldNames := '';
    ibtContas_Pagar.ForcedRefresh := True;
    ibtContas_Pagar.Open;
    dsContas_Pagar.AutoEdit := True;
    Alter('I');
    CarregaDatas();
    pgcPadraoCad.TabIndex := 0;
    dbnNavegacao.DataSource := dsContas_Pagar;
   end;
end;

procedure TfrmContas_Pagar.bitConsForClick(Sender: TObject);
begin
  inherited;
  if (dbeCodFor.ReadOnly = False) then
   begin
    uVariavel.chamada:= '2';
    if not Ativacao('FRMFORNECEDOR') then
     begin
      Application.CreateForm(TfrmFornecedor,frmFornecedor);
     end;
    //Application.CreateForm(TfrmFornecedor,frmFornecedor);
    //frmFornecedor.Show;
    frmFornecedor.pgcPadraoCad.TabIndex := 1;
    exit;
   end;
end;

procedure TfrmContas_Pagar.dbeCodForChange(Sender: TObject);
begin
  inherited;
  if dbeCodFor.Text <> '' then
   begin
    LocFor(StrToInt(dbeCodFor.Text));
    if (uVariavel.chamada = 'C') then
     begin
      dmSYS.ibtContas_Pagar.FieldByName('FOR_COD').AsInteger := StrToInt(dbeCodFor.Text);
     end;
   end
  else
    Begin
      pnNomFor.Caption := '';
    end
end;

procedure TfrmContas_Pagar.bitCancelarClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    ibtContas_Pagar.Cancel;
    Alter('I');  //Chamada da alterção dos DBEdits
    CarregaDatas;   ///Carrega as datas de lançamento da nota
   end;
end;

procedure TfrmContas_Pagar.bitExcluirClick(Sender: TObject);
begin
 if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   if (pgcPadraoCad.TabIndex = 1) then
    begin
    //inicio
     if not(qryContas_Pagar.FieldByName('Nota').IsNull) then
      begin
       dmSYS.ibtContas_Pagar.Locate('FOR_COD;CONT_NRODOC;CONT_PARC',
           VarArrayOf([qryContas_Pagar.FieldByName('Codigo').Value,
            qryContas_Pagar.FieldByName('Nota').Value,
            qryContas_Pagar.FieldByName('Parcela').Value]),[loCaseInsensitive]);
      end
     else
      begin
       MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
       Exit;
      end
    //fim
    end;

   dmSYS.ibtContas_Pagar.Delete;
   if (pgcPadraoCad.TabIndex = 1) then
    begin
     qryContas_Pagar.Close;
     qryContas_Pagar.Open;
    end;

  end;
 Alter('I'); //Chamada da alterção dos DBEdits
 CarregaDatas;   ///Carrega as datas de lançamento da nota
end;

procedure TfrmContas_Pagar.bitIncluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (qryContas_Pagar.Active = True) then
     qryContas_Pagar.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtContas_Pagar.Append;
    Alter('A');    //Chamada da alterção dos DBEdits
    dbeCodFor.SetFocus;
    pnNomFor.Caption := '';
    dtpVenc.Date := Date;
    dbeDtaPag.Clear;
   end;
end;

procedure TfrmContas_Pagar.bitAlterarClick(Sender: TObject);
begin
  inherited;
  LocConta;
  Alter('A');    //Chamada da alterção dos DBEdits
  dbeNroDoc.ReadOnly := True;
  dbeCodFor.ReadOnly := True;
  dbeParc.ReadOnly := True;
  bitConsFor.Enabled := False;
  dmSYS.ibtContas_Pagar.Edit;
end;

procedure TfrmContas_Pagar.bitokClick(Sender: TObject);
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
   if (dbeNroDoc.Text = '') then
    begin
     MessageDlg('Número Nota Fiscal em Branco',mtWarning,[mbOK],0);
     dbeNroDoc.SetFocus;
     exit;
    end;
   if (dbeValDoc.Text = '') then
    begin
     MessageDlg('Valor Invalido',mtWarning, [mbOK],0);
     dbeValDoc.SetFocus;
     exit;
    end;
   if (dbeParc.Text = '') then
    begin
     MessageDlg('Parcela Invalida',mtWarning, [mbOK],0);
     dbeParc.Text := '1';
     dbeParc.SetFocus;
     exit;
    end;
   qryContas_Pagar.Close;
   qryContas_Pagar.SQL.Clear;
   qryContas_Pagar.SQL.Add('select  FOR_COD, CONT_NRODOC, CONT_PARC from Contas_Pagar');
   qryContas_Pagar.SQL.Add('where FOR_COD=:for and CONT_NRODOC=:nf and CONT_PARC=:parc');
   qryContas_Pagar.Prepare;
   qryContas_Pagar.ParamByName('for').AsInteger := StrToInt(dbeCodFor.Text);
   qryContas_Pagar.ParamByName('nf').AsInteger := StrToInt(dbeNroDoc.Text);
   qryContas_Pagar.ParamByName('parc').AsInteger := StrToInt(dbeParc.Text);
   qryContas_Pagar.Open;
   if not(qryContas_Pagar.FieldByName('FOR_COD').IsNull) and (ibtContas_Pagar.State in [dsInsert]) then
    begin
     MessageDlg('Parcela já cadastrada pra esta Nota!',mtWarning,[mbOK],0);
     dbeParc.SelectAll;
     dbeParc.SetFocus;
     exit;
    end
   else
    begin
     ibtContas_Pagar.FieldByName('CONT_DATVENC').AsDateTime := dtpVenc.Date;
    // ibtContas_PagarCONT_DATVENCSetText(ibtContas_PagarCONT_DATVENC,DateToStr(dtpVenc.DateTime));
     ibtContas_Pagar.Post;
     Alter('I');
     ibtSYS_DATABASE.CommitRetaining;
    end;
  end;
end;

procedure TfrmContas_Pagar.dbnNavegacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  CarregaDatas();
end;

procedure TfrmContas_Pagar.dbeParcEnter(Sender: TObject);
begin
  inherited;
  if dbeNroDoc.Text = '' then
   dbeNroDoc.SetFocus;
end;

procedure TfrmContas_Pagar.cbFiltroChange(Sender: TObject);
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
       Consulta(False,False,True);
       exit;
      end
     else
      if (cbFiltro.ItemIndex = 3) then
       begin
        Consulta(True,False,False);
        exit;
       end;
  end;
end;

procedure TfrmContas_Pagar.SQL();
begin
 with qryContas_Pagar do
  begin
   if (edtNF.Text <> '') or (edtForn.Text <> '') or
     ((DateToStr(dtpIni.DateTime) <> '') and (DateToStr(dtpFim.DateTime) <> '')) then
    begin
     Close;
     SQL.Clear;
     case cbFiltro.ItemIndex of
      0:Begin
         SQL.Add('select fornecedor.for_cod as Codigo, fornecedor.for_raz_soc as Fornecedor, contas_pagar.cont_nrodoc as Nota,');
         SQL.Add('contas_pagar.cont_parc as Parcela, contas_pagar.cont_valpagar as Valor_Parcela,');
         SQL.Add('contas_pagar.cont_datvenc as Data_Vencimento, contas_pagar.cont_valpago as Valor_Pago,');
         SQL.Add('contas_pagar.cont_datpag as Data_Pagamento from contas_pagar, fornecedor');
         SQL.Add('where fornecedor.for_raz_soc Like'+#39+Trim(edtForn.Text)+'%'+#39);
         SQL.Add('and fornecedor.for_cod = contas_pagar.for_cod');
         SQL.Add('plan join(fornecedor natural,contas_pagar index(XPKCONTAS_PAGAR))');
        End;
      1:Begin
         SQL.Add('select fornecedor.for_cod as Codigo, fornecedor.for_raz_soc as Fornecedor, contas_pagar.cont_nrodoc as Nota,');
         SQL.Add('contas_pagar.cont_parc as Parcela, contas_pagar.cont_valpagar as Valor_Parcela,');
         SQL.Add('contas_pagar.cont_datvenc as Data_Vencimento, contas_pagar.cont_valpago as Valor_Pago,');
         SQL.Add('contas_pagar.cont_datpag as Data_Pagamento from contas_pagar, fornecedor');
         SQL.Add('where contas_pagar.cont_datvenc Between :nDataIni and :nDataFim');
         SQL.Add('and fornecedor.for_cod = contas_pagar.for_cod');
         SQL.Add('plan join(fornecedor natural,contas_pagar index(XPKCONTAS_PAGAR))');
         Prepare;
         ParamByName('nDataIni').AsDateTime := dtpIni.DateTime;
         ParamByName('nDataFim').AsDateTime := dtpFim.DateTime;
        End;
      2:Begin
         SQL.Add('select fornecedor.for_cod as Codigo, fornecedor.for_raz_soc as Fornecedor, contas_pagar.cont_nrodoc as Nota,');
         SQL.Add('contas_pagar.cont_parc as Parcela, contas_pagar.cont_valpagar as Valor_Parcela,');
         SQL.Add('contas_pagar.cont_datvenc as Data_Vencimento, contas_pagar.cont_valpago as Valor_Pago,');
         SQL.Add('contas_pagar.cont_datpag as Data_Pagamento from contas_pagar, fornecedor');
         SQL.Add('where contas_pagar.cont_datpag Between :nDataIni and :nDataFim');
         SQL.Add('and fornecedor.for_cod = contas_pagar.for_cod');
         SQL.Add('plan join(fornecedor natural,contas_pagar index(XPKCONTAS_PAGAR))');
         Prepare;
         ParamByName('nDataIni').AsDateTime := dtpIni.DateTime;
         ParamByName('nDataFim').AsDateTime := dtpFim.DateTime;
        End;
      3:Begin
         SQL.Add('select fornecedor.for_cod as Codigo, fornecedor.for_raz_soc as Fornecedor, contas_pagar.cont_nrodoc as Nota,');
         SQL.Add('contas_pagar.cont_parc as Parcela, contas_pagar.cont_valpagar as Valor_Parcela,');
         SQL.Add('contas_pagar.cont_datvenc as Data_Vencimento, contas_pagar.cont_valpago as Valor_Pago,');
         SQL.Add('contas_pagar.cont_datpag as Data_Pagamento from contas_pagar, fornecedor ');
         SQL.Add('where contas_pagar.cont_nrodoc Like'+#39+Trim(edtNF.Text)+'%'+#39);
         SQL.Add('and fornecedor.for_cod = contas_pagar.for_cod');
         SQL.Add('plan join(fornecedor natural,contas_pagar index(XPKCONTAS_PAGAR))');
        End;
	   end;
     qryContas_Pagar.Open;
    end
   else
    Begin
     Close;
     SQL.Clear;
     SQL.Add('select fornecedor.for_cod as Codigo, fornecedor.for_raz_soc as Fornecedor, contas_pagar.cont_nrodoc as Nota,');
     SQL.Add('contas_pagar.cont_parc as Parcela, contas_pagar.cont_valpagar as Valor_Parcela,');
     SQL.Add('contas_pagar.cont_datvenc as Data_Vencimento, contas_pagar.cont_valpago as Valor_Pago,');
     SQL.Add('contas_pagar.cont_datpag as Data_Pagamento from contas_pagar, fornecedor ');
     SQL.Add('where fornecedor.for_cod = contas_pagar.for_cod');
     SQL.Add('plan join(fornecedor natural,contas_pagar index(XPKCONTAS_PAGAR))');
     Open;
    end;
  end;
end;

procedure TfrmContas_Pagar.edtFornChange(Sender: TObject);
begin
  inherited;
  SQL();
end;

procedure TfrmContas_Pagar.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  if not(dmSYS.ibtContas_Pagar.State in [dsInsert, dsEdit]) then
   begin
    qryContas_Pagar.Open;
   end;
end;

procedure TfrmContas_Pagar.tbsCadastroShow(Sender: TObject);
begin
  inherited;
 qryContas_Pagar.Close;
end;

procedure TfrmContas_Pagar.bitConsContasClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmContas_Pagar.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   begin
    if ibtContas_Pagar.State in [dsInsert, dsEdit] then
     if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      begin
       AllowChange := True;
       ibtContas_Pagar.Cancel;
       Alter('I');
       pgcPadraoCad.TabIndex := 1;
       qryContas_Pagar.Open;    //Ativar a Query para trazer todos os registros
      end
     else
      begin
       AllowChange := False;
       if (qryContas_Pagar.Active = True) then
        qryContas_Pagar.Close;  //Desativar a Query
       Alter('A');
       pgcPadraoCad.TabIndex := 0;
      end;
    if qryContas_Pagar.Active then
     if pgcPadraoCad.TabIndex = 1 then
      LocConta;
   end;
end;

procedure TfrmContas_Pagar.bitokdtpClick(Sender: TObject);
begin
 if dtpIni.Date > dtpFim.Date then
  ShowMessage('Período Invalida')
 else
  SQL();
end;

end.
