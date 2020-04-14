unit ugridPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, Mask, DBCtrls, DB,
  IBCustomDataSet, IBQuery, ToolWin, ComCtrls, ImgList, Menus, RpCon,
  RpConDS, RpDefine, RpRave, DataBkr, DBClient;

type
  TfrmGridPedido = class(TForm)
    lbmesa: TLabel;
    dbgItensPedido: TDBGrid;
    Label2: TLabel;
    bitFarurar: TBitBtn;
    bitCancelar: TBitBtn;
    lbdin: TLabel;
    lbCheque: TLabel;
    pntotalvenda: TPanel;
    lbcart: TLabel;
    lbtroco: TLabel;
    Label6: TLabel;
    grbFuncionario: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    bitConsFun: TBitBtn;
    pnNomFun: TPanel;
    dbeDin: TDBEdit;
    dbeChe: TDBEdit;
    dbeCart: TDBEdit;
    pnTroco: TPanel;
    qryPedido: TIBQuery;
    imlBotoes: TImageList;
    pomFuncoes: TPopupMenu;
    Pedido: TMenuItem;
    N1: TMenuItem;
    TrocarMesa: TMenuItem;
    N2: TMenuItem;
    FecharConta: TMenuItem;
    Faturar: TMenuItem;
    Sair1: TMenuItem;
    N4: TMenuItem;
    rvpConta: TRvProject;
    rvdscConta: TRvDataSetConnection;
    qryConta: TIBQuery;
    edtCodFun: TEdit;
    N5: TMenuItem;
    pesqprod: TMenuItem;
    AbrirMesa: TMenuItem;
    ConfPedido: TMenuItem;
    Caixa1: TMenuItem;
    EntradaSangria: TMenuItem;
    N3: TMenuItem;
    Cheque1: TMenuItem;
    Mesa1: TMenuItem;
    JuntaMesa1: TMenuItem;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    qryMesa: TIBQuery;
    dbgMesas: TDBGrid;
    dsMesas: TDataSource;
    cdsMesas: TClientDataSet;
    cdsMesasMesa: TStringField;
    cdsMesasCodigo: TIntegerField;
    Proxima1: TMenuItem;
    Anterior1: TMenuItem;
    qryContaPED_COD: TIntegerField;
    qryContaMESA_COD: TIntegerField;
    qryContaFUN_COD: TIntegerField;
    qryContaFUN_NOM: TIBStringField;
    qryContaPED_DAT: TDateField;
    qryContaPED_VALTOTAL: TFloatField;
    qryContaPGT_DIN: TFloatField;
    qryContaPGT_CART: TFloatField;
    qryContaPGT_CHE: TFloatField;
    qryContaPRO_COD: TIntegerField;
    qryContaPRO_NOM: TIBStringField;
    qryContaPRO_PRE: TFloatField;
    qryContaITPED_QTD: TIntegerField;
    qryContaITPED_QTDTOTAL: TIntegerField;
    qryContaITPED_VAL: TFloatField;
    lbsit: TLabel;
    Label3: TLabel;
    qryValidaMesa: TIBQuery;
    Label1: TLabel;
    procedure CarregaMesa();
    procedure CarregaPedido();
    procedure LocFun(cod:Integer);
    procedure ValorTotalPedido();
    procedure ConfirmarPedido();
    procedure HabilitaFaturar(sit: Boolean);
    procedure edtCodFunChange(Sender: TObject);
    procedure bitConsFunClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Proxima1Click(Sender: TObject);
    procedure Anterior1Click(Sender: TObject);
    procedure PedidoClick(Sender: TObject);
    procedure FecharContaClick(Sender: TObject);
    procedure edtCodFunKeyPress(Sender: TObject; var Key: Char);
    procedure ConfPedidoClick(Sender: TObject);
    procedure TrocarMesaClick(Sender: TObject);
    procedure pesqprodClick(Sender: TObject);
    procedure Cheque1Click(Sender: TObject);
    procedure JuntaMesa1Click(Sender: TObject);
    procedure EntradaSangriaClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FaturarClick(Sender: TObject);
    procedure bitFarurarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure dbeDinExit(Sender: TObject);
    procedure dbgItensPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgItensPedidoEnter(Sender: TObject);
    procedure dbgItensPedidoExit(Sender: TObject);
    procedure dbgMesasCellClick(Column: TColumn);
    procedure dbgMesasColEnter(Sender: TObject);
    procedure dbgMesasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsMesasDataChange(Sender: TObject; Field: TField);
    procedure dbgMesasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mesa : String;
  carregaped : Integer;
  frmGridPedido: TfrmGridPedido;

implementation

uses udmSYS, StrUtils, uFuncionario, uVariavel, uPrincipal, uTrocaMesa,
  uProduto, uCheque, uAbtCaixa, uMesa, uMovCaixa;

{$R *.dfm}

procedure TfrmGridPedido.CarregaPedido();
begin
 qryPedido.SQL.Clear;
 qryPedido.SQL.Add('select ped_cod from pedido');
 qryPedido.SQL.Add('where mesa_cod = :mesa and ped_sit = :sit');
 qryPedido.ParamByName('mesa').AsInteger := cdsMesas.FieldByName('codigo').AsInteger;
 qryPedido.ParamByName('sit').AsString := 'A';
 qryPedido.Open;
 if qryPedido.RecordCount = 1 then
  begin
   dmSYS.ibtPedido.Open;
   dmSYS.dsPedido.AutoEdit := True;
   dmSYS.ibtItem_Pedido.Open;
   dmSYS.dsItem_Pedido.AutoEdit := True;
   dmSYS.ibtPedido.Locate('PED_COD',qryPedido.FieldByName('PED_COD').Value,[loCaseInsensitive]);
   edtCodFun.Text := dmSYS.ibtPedido.fieldbyname('FUN_COD').AsString;
   edtCodFun.ReadOnly := True;
   pntotalvenda.Caption := '';
   lbmesa.Caption := '';
   lbmesa.Caption := 'Mesa: '+cdsMesas.FieldByName('codigo').AsString;
   ValorTotalPedido();
   dmSYS.ibtItem_Pedido.First;
  end
 else
  begin
   dmSYS.ibtItem_Pedido.Close;
   dmSYS.ibtPedido.Close;
   edtCodFun.Text := '';
   pntotalvenda.Caption := '';
   lbmesa.Caption := '';
   lbmesa.Caption := 'Mesa: '+cdsMesas.FieldByName('codigo').AsString;
   edtCodFun.ReadOnly := False;
  end;
 HabilitaFaturar(False);
end;

procedure TfrmGridPedido.CarregaMesa();
var cont, total: Integer;
begin
 qryMesa.Close;
 qryMesa.SQL.Clear;
 qryMesa.SQL.Add('select mesa_cod from mesa');
 qryMesa.SQL.Add('where mesa_sit <>  :sit order by mesa_cod');
 qryMesa.ParamByName('sit').AsString := 'I';
 qryMesa.Open;
 //somar quantidade de Mesas Disponiveis
 qryMesa.DisableControls;
 qryMesa.First;
 total:=0;
 while not qryMesa.Eof do begin
   Inc(total);
   qryMesa.Next;
  end ;
 qryMesa.EnableControls;
 //adicionar no Listem box as mesas
 qryMesa.First;

 for cont := 0 to total do
  begin
   if not qryMesa.Eof then
    begin
     cdsMesas.Append;
     cdsMesas.FieldByName('mesa').AsString := 'Mesa:';
     cdsMesas.FieldByName('codigo').AsInteger := qryMesa.FieldByName('Mesa_Cod').AsInteger;
     cdsMesas.Post;
     qryMesa.Next;
    end;
  end;
 carregaped := 1;
end;

procedure TfrmGridPedido.HabilitaFaturar(sit: Boolean);
begin
 //Desabilitar e Habilitar os botoes para Faturamento
 lbdin.Enabled := sit;
 dbeDin.Enabled := sit;
 lbCheque.Enabled := sit;
 dbeChe.Enabled := sit;
 lbcart.Enabled := sit;
 dbeCart.Enabled := sit;
 lbtroco.Enabled := sit;
 pnTroco.Enabled := sit;
 pnTroco.Caption := '';
 bitCancelar.Enabled := sit;
 bitFarurar.Enabled := sit;
end;

procedure TfrmGridPedido.LocFun(Cod: Integer);
Begin
 with dmSYS do              //localização da cidade atravez da digitação do codigo
  Begin
    ibtFuncionario.Open;
    ibtFuncionario.Locate('FUN_COD',cod,[loCaseInsensitive]);
    if (ibtFuncionario.FieldByName('FUN_COD').AsInteger = Cod) then
      Begin
        pnNomFun.Caption := ibtFuncionario.FieldByName('FUN_NOM').AsString;
      end
    else
      Begin
        MessageDlg('Funcionário não Cadastrada', mtInformation, [mbOK],0);
        edtCodFun.SelectAll;
        edtCodFun.SetFocus;
        pnNomFun.Caption := '';
      end;
  end;
end;

procedure TfrmGridPedido.ValorTotalPedido();
var
s:Double;
begin
 dmSYS.ibtItem_Pedido.DisableControls;   //tabela
 dmSYS.ibtItem_Pedido.First;
 s:=0;
 while not dmSYS.ibtItem_Pedido.Eof do begin
   s:=s+dmSYS.ibtItem_Pedido.FieldByName('ITPED_VAL').AsFloat; //somatoria
   dmSYS.ibtItem_Pedido.Next;
   pntotalvenda.Caption := FormatFloat(',0.00',s);
  end ;
 dmSYS.ibtItem_Pedido.EnableControls;
end;

procedure TfrmGridPedido.ConfirmarPedido();
begin
 dmSYS.ibtItem_Pedido.DisableControls;   //tabela
 dmSYS.ibtItem_Pedido.Edit;
 if dmSYS.ibtItem_Pedido.State in [dsEdit] then
  begin
   dmSYS.ibtItem_Pedido.FieldByName('ITPED_QTDTOTAL').AsInteger :=
     dmSYS.ibtItem_Pedido.FieldByName('ITPED_QTD').AsInteger +
      dmSYS.ibtItem_Pedido.FieldByName('ITPED_QTDTOTAL').AsInteger; //somatoria
   dmSYS.ibtItem_Pedido.FieldByName('ITPED_QTD').AsInteger := 0;
   dmSYS.ibtItem_Pedido.Post;
  end;
 dmSYS.ibtItem_Pedido.EnableControls;
 dmSYS.ibtSYS_DATABASE.CommitRetaining;
 CarregaPedido();
end;

procedure TfrmGridPedido.edtCodFunChange(Sender: TObject);
begin
 if edtCodFun.Text <> '' then
   begin
    LocFun(StrToInt(edtCodFun.Text));
    if (uVariavel.chamada = 'C') then
     begin
      dmSYS.ibtPedido.FieldByName('FUN_COD').AsInteger := StrToInt(edtCodFun.Text);
     end;
   end
  else
    Begin
      pnNomFun.Caption := '';
    end;
end;

procedure TfrmGridPedido.bitConsFunClick(Sender: TObject);
begin
 if (edtCodFun.ReadOnly = False) then
   begin
    uVariavel.chamada:= '1';
    Application.CreateForm(TfrmFuncionario,frmFuncionario);
    frmFuncionario.Show;
    frmFuncionario.pgcPadraoCad.TabIndex := 1;
   end;
end;

procedure TfrmGridPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dmSYS.ibtMesa.Close;
 dmSYS.dsMesa.AutoEdit := False;
 dmSYS.ibtPedido.Close;
 dmSYS.dsPedido.AutoEdit := False;
 dmSYS.ibtItem_Pedido.Close;
 dmSYS.dsItem_Pedido.AutoEdit := False;
 dmSYS.ibtLookMesa.Close;
 dmSYS.dsLookMesa.AutoEdit := False;
 cdsMesas.Close;
 Action := caFree;
end;

procedure TfrmGridPedido.FormCreate(Sender: TObject);
begin
 carregaped := 0;
 dmSYS.ibtMesa.Open;
 dmSYS.dsMesa.AutoEdit := True;
 dmSYS.ibtLookMesa.Open;
 dmSYS.dsLookMesa.AutoEdit := True;
 dmSYS.ibtPedido.Open;
 dmSYS.dsPedido.AutoEdit := True;
 dmSYS.ibtItem_Pedido.Open;
 dmSYS.dsItem_Pedido.AutoEdit := True;
 cdsMesas.CreateDataSet;
 CarregaMesa();
 cdsMesas.First;
 dbgMesasColEnter(dbgItensPedido);
 edtCodFun.Text := dmSYS.ibtPedido.fieldbyname('FUN_COD').AsString;
 frmGridPedido.Height := 555;
 frmGridPedido.Width := 790;
 frmGridPedido.Top := 5;
end;

procedure TfrmGridPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
  Begin
   key:=#0;
   Perform(WM_NEXTDLGCTL,0,0);
  End;     
 if Key = #27 then
    Perform(WM_NEXTDLGCTL, 1, 0);
end;

procedure TfrmGridPedido.Proxima1Click(Sender: TObject);
begin
 dbgMesas.SetFocus;
 cdsMesas.Next;
 CarregaPedido();
end;

procedure TfrmGridPedido.Anterior1Click(Sender: TObject);
begin
 dbgMesas.SetFocus;
 cdsMesas.Prior;
 CarregaPedido();
end;

procedure TfrmGridPedido.PedidoClick(Sender: TObject);
begin
 dmSYS.ibtMesa.Locate('MESA_COD',cdsMesas.FieldByName('codigo').AsInteger,[loCaseInsensitive]);
 if (dmSYS.ibtMesa.FieldByName('MESA_SIT').AsString = 'O') then
  // caso a mesa esteja ocupada
  begin
   ShowMessage('A Mesa Está Ocupada!!!');
   Exit;
  end
  
 else
  //caso a mesa esteja Livre
  begin
   if (edtCodFun.Text = '') then//(dmSYS.ibtPedido.FieldByName('FUN_COD').IsNull) then
    begin
     //caso Funcionario não esteja Selecionado
     ShowMessage('Funcionario Invalido');
     dmSYS.ibtPedido.Cancel;
     edtCodFun.SetFocus;
     exit;
    end
   else
    begin
     qryPedido.SQL.Clear;
     qryPedido.SQL.Add('select pedido.ped_cod from pedido');
     qryPedido.SQL.Add('where pedido.mesa_cod = :mesa and pedido.ped_sit = :sit');
     qryPedido.ParamByName('mesa').AsInteger := cdsMesas.FieldByName('codigo').AsInteger;
     qryPedido.ParamByName('sit').AsString := 'A';
     qryPedido.Open;

     if qryPedido.RecordCount = 0 then
      begin
      //Incluir um Novo Pedido Para Mesa *****
       dmSYS.ibtPedido.Open;
       dmSYS.dsPedido.AutoEdit := True;
       dmSYS.ibtPedido.Append;
       dmSYS.ibtPedido.FieldByName('FUN_COD').AsInteger := StrToInt(edtCodFun.Text);
       dmSYS.ibtPedido.FieldByName('MESA_COD').AsInteger := cdsMesas.FieldByName('codigo').AsInteger;
       dmSYS.ibtPedido.FieldByName('PED_DAT').AsDateTime := Date;
       dmSYS.ibtPedido.Post;
       dmSYS.ibtMesa.Locate('MESA_COD',cdsMesas.FieldByName('codigo').AsInteger,[loCaseInsensitive]);
       dmSYS.ibtMesa.Edit;
       dmSYS.ibtMesa.FieldByName('MESA_SIT').AsString := 'A';
       dmSYS.ibtMesa.Post;
       dmSYS.ibtSYS_DATABASE.CommitRetaining;
       ShowMessage('Mesa Aberta Com Sucesso.');
       dmSYS.ibtItem_Pedido.Close;
       dmSYS.ibtPedido.Close;
       CarregaPedido();
      end
     else
      begin
       ShowMessage('A Mesa já possui um pedido.');
       Exit;
      end;
   end;
  end;
end;

procedure TfrmGridPedido.FecharContaClick(Sender: TObject);
begin
 if (cdsMesas.FieldByName('codigo').AsInteger > 0) then
  if (dmSYS.ibtItem_Pedido.Active) then
    begin
     qryConta.Close;
     qryConta.Params.Items[0].Value := cdsMesas.FieldByName('codigo').AsInteger;
     qryConta.Open;
     if not(qryConta.RecordCount = 0) then
      begin
       rvpConta.ProjectFile := '..\Relatorios\FecConta02.rav';
       rvpConta.Execute;
       exit;
      end
     else
      begin
       ShowMessage('MESA NÃO possui ITENS!');
       exit;
      end;
    end;
end;

procedure TfrmGridPedido.edtCodFunKeyPress(Sender: TObject; var Key: Char);
begin
 if not(key in ['0'..'9', #8]) then
  begin
   Beep;
   key := #0;
  end;
end;

procedure TfrmGridPedido.ConfPedidoClick(Sender: TObject);
begin
 if (dmSYS.ibtItem_Pedido.FieldByName('ITPED_QTD').AsInteger <> 0) then
  begin
   if (MessageDlg('Confirma Pedido do Item Selecionado!!!',mtConfirmation, [mbYes,mbNo],0) = mrYes) then
    begin
     ConfirmarPedido();
     dmSYS.ibtSYS_DATABASE.CommitRetaining;
    end;
  end;
end;

procedure TfrmGridPedido.TrocarMesaClick(Sender: TObject);
var cont, total : Integer;
    mesa : String;
begin
 if dmSYS.ibtItem_Pedido.Active = True then
  begin
   Application.CreateForm(TfrmTrocaMesa,frmTrocaMesa);
   qryPedido.Close;
   qryPedido.SQL.Clear;
   qryPedido.SQL.Add('select mesa_cod from mesa');
   qryPedido.SQL.Add('where mesa_sit =  :sit order by mesa_cod');
   qryPedido.ParamByName('sit').AsString := 'D';
   qryPedido.Open;
   //somar quantidade de Mesas Disponiveis
   qryPedido.DisableControls;
   qryPedido.First;
   total:=0;
   while not qryPedido.Eof do begin
     Inc(total);
     qryPedido.Next;
    end ;
   qryPedido.EnableControls;
   //adicionar no combo box as mesas Disponiveis
   qryPedido.First;
   frmTrocaMesa.cbMesas.Items.Clear;
   for cont := 0 to total do
    begin
     if not qryPedido.Eof then
      begin
       mesa := 'Mesa: '+qryPedido.FieldByName('mesa_cod').AsString;
       qryPedido.Next;
       frmTrocaMesa.cbMesas.Items.Add(mesa);
      end;
    end;
   frmTrocaMesa.ShowModal;
  end
 else
  begin
   ShowMessage('Mesa não possui Pedido.');
  end;
end;

procedure TfrmGridPedido.pesqprodClick(Sender: TObject);
begin
 if (dmSYS.ibtItem_Pedido.Active = True) then
   begin
    uVariavel.chamada:= '2';
    if not Principal.Ativacao('FRMPRODUTO') then
     begin
      if not(dmSYS.ibtItem_Pedido.State in [dsInsert, dsEdit]) then
        dmSYS.ibtItem_Pedido.Edit;
      Application.CreateForm(TfrmProduto,frmProduto);
     end;
    frmProduto.Show;
    frmProduto.pgcPadraoCad.TabIndex := 1;
    frmProduto.cbFiltro.ItemIndex := 0;
    frmProduto.cbFiltroChange(pesqprod);
    frmProduto.edtBusc.SetFocus;
   end;
end;

procedure TfrmGridPedido.Cheque1Click(Sender: TObject);
begin
 if not Principal.Ativacao('FRMCHEQUE') then
   begin
    Application.CreateForm(TfrmCheque,frmCheque);
   end;
end;

procedure TfrmGridPedido.JuntaMesa1Click(Sender: TObject);
begin
 dmSYS.ibtMesa.Close;
 dmSYS.ibtJunta_Mesa.Close;
 dmSYS.ibtMesa.Open;
 dmSYS.ibtJunta_Mesa.Open;
 dmSYS.ibtMesa.Locate('MESA_COD',cdsMesas.FieldByName('codigo').AsInteger,[loCaseInsensitive]);
 if (dmSYS.ibtMesa.FieldByName('MESA_SIT').AsString = 'A') then
  begin
   if not Principal.Ativacao('FRMMESA') then
    begin
     uVariavel.chamada := 'P';
     Application.CreateForm(TfrmMesa,frmMesa);
     frmMesa.dbgdisponivel.ReadOnly := False;
     frmMesa.dbgAgrupadas.ReadOnly := False;
     frmMesa.sbAgrupT.Enabled := True;
     frmMesa.sbAgrup1.Enabled := True;
     frmMesa.sbDesagrupT.Enabled := True;
     frmMesa.sbDesagrup1.Enabled := True;
     uVariavel.chamada := '0';
    end;
  end
 else
  begin
   if (dmSYS.ibtMesa.FieldByName('MESA_SIT').AsString = 'O') then
     ShowMessage('Mesa Agrupada!!!')
   else
      ShowMessage('Mesa não Possui Pedido!!!');
  end;
end;

procedure TfrmGridPedido.EntradaSangriaClick(Sender: TObject);
begin
 if not Principal.Ativacao('FRMMOV_CAIXA') then
  begin
   Application.CreateForm(TfrmMov_Caixa,frmMov_Caixa);
  end;
end;

procedure TfrmGridPedido.Sair1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmGridPedido.FaturarClick(Sender: TObject);
begin
 if (dmSYS.ibtItem_Pedido.Active) then
  begin
   if dmSYS.ibtItem_Pedido.RecordCount > 0 then
    begin
     HabilitaFaturar(True);
     dmSYS.ibtPedido.Edit;
     dmSYS.ibtPedido.FieldByName('PGT_DIN').Value := pntotalvenda.Caption;
     pnTroco.Caption := '0,00';
     dbeDin.SetFocus;
    end
   else
     ShowMessage('Não Existem Itens a Ser Faturado!!!');
  end;
end;

procedure TfrmGridPedido.dbeDinExit(Sender: TObject);
var total: Real;
begin
 total := dmSYS.ibtPedido.FieldByName('PGT_DIN').AsFloat +
          dmSYS.ibtPedido.FieldByName('PGT_CHE').AsFloat +
          dmSYS.ibtPedido.FieldByName('PGT_CART').AsFloat;
 if (total > StrToFloat(pntotalvenda.Caption)) then
  begin
   total := (total - StrToFloat(pntotalvenda.Caption));
   pnTroco.Caption := FormatFloat(',0.00',total)
  end
 else
  begin
   pnTroco.Caption := '0,00';
  end;
end;

procedure TfrmGridPedido.bitFarurarClick(Sender: TObject);
var total,pntotal , troco: Real;
begin
 total := dmSYS.ibtPedido.FieldByName('PGT_DIN').Value +
          dmSYS.ibtPedido.FieldByName('PGT_CHE').Value +
          dmSYS.ibtPedido.FieldByName('PGT_CART').Value;
 troco := 0;
 if not(pnTroco.Caption = '') or not(pnTroco.Caption = '0,00') then
  troco := StrToFloat(pnTroco.Caption);
 pntotal := StrToFloat(pntotalvenda.Caption);
 if (total < pntotal) then
  begin
   ShowMessage('O Valor não deve ser menor que o Valor do Pedido!!!');
   dbeDin.SetFocus;
   dbeDin.SelectAll;
   Exit;
  end
 else
  begin
   dmSYS.ibtPedido.Post;

   //cadastrar Cheque apos o faturamento
   if (dmSYS.ibtPedido.FieldByName('PGT_CHE').IsNull) then
     if (MessageDlg('Deseja Cadastrar o Cheque?',mtConfirmation, [mbYes, mbNo],0) = mrYes) then
      begin
       Cheque1Click(bitFarurar);
       frmCheque.bitIncluirClick(bitFarurar);
       frmCheque.dbeNVenda.Text := dmSYS.ibtPedido.FieldByName('PED_COD').AsString;
       frmCheque.dbeValor.Text := dmSYS.ibtPedido.FieldByName('PGT_CHE').AsString;
      end;

   //Imprimir relatorio de fechamento de conta apos faturar
   begin
    qryConta.Close;
    qryConta.Params.Items[0].Value := cdsMesas.FieldByName('codigo').AsInteger;
    qryConta.Open;
    rvpConta.ProjectFile := '..\Relatorios\FecConta01.rav';
    rvpConta.Execute;
   end;

   //passagem de parametros para a procedure FATURAR
   dmSYS.ibspFaturar.ParamByName('pedcod').Value := dmSYS.ibtPedido.FieldByName('PED_COD').Value;
   dmSYS.ibspFaturar.ParamByName('usecod').Value := uVariavel.codUser;
   dmSYS.ibspFaturar.ParamByName('troco').Value := troco;
   //executar a procedure faturar
   dmSYS.ibspFaturar.ExecProc;
   dmSYS.ibtSYS_DATABASE.CommitRetaining;
   CarregaPedido();
  end;
 dmSYS.ibtLookMesa.Close;
 dmSYS.ibtLookMesa.Open;
 cdsMesas.Close;
 cdsMesas.Open;
 //CarregaMesa();
end;

procedure TfrmGridPedido.bitCancelarClick(Sender: TObject);
begin
 if dmSYS.ibtPedido.State in [dsEdit] then
  begin
   dmSYS.ibtPedido.FieldByName('PGT_DIN').AsInteger := 0;
   dmSYS.ibtPedido.FieldByName('PGT_CHE').AsInteger := 0;
   dmSYS.ibtPedido.FieldByName('PGT_CART').AsInteger := 0;
  end;
 dmSYS.ibtPedido.Cancel;
 HabilitaFaturar(False);
end;

procedure TfrmGridPedido.dbgItensPedidoKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfrmGridPedido.dbgItensPedidoEnter(Sender: TObject);
begin
 frmGridPedido.KeyPreview := False;
end;

procedure TfrmGridPedido.dbgItensPedidoExit(Sender: TObject);
begin
 frmGridPedido.KeyPreview := True;
end;

procedure TfrmGridPedido.dbgMesasCellClick(Column: TColumn);
begin
 CarregaPedido();
end;

procedure TfrmGridPedido.dbgMesasColEnter(Sender: TObject);
begin
 CarregaPedido();
end;

procedure TfrmGridPedido.dbgMesasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //if (key = 37) or (key = 38) or (key = 39) or (key = 40)then
 // Abort;
end;

procedure TfrmGridPedido.dsMesasDataChange(Sender: TObject; Field: TField);
begin
 if carregaped = 1 then
  begin
   CarregaPedido();
  end;
 qryValidaMesa.Close;
 qryValidaMesa.SQL.Clear;
 qryValidaMesa.SQL.Add('select mesa_sit from mesa');
 qryValidaMesa.SQL.Add('where mesa_cod = :cod');
 qryValidaMesa.ParamByName('cod').AsInteger := dsMesas.DataSet.FieldByName('codigo').AsInteger;
 qryValidaMesa.Open;
 //Situação Aberta
 if qryValidaMesa.FieldByName('mesa_sit').AsString = 'A' Then
   begin
     lbsit.Caption := 'Aberta';
     Exit;
   end
 else
  begin
   //Situação Ocupada
   if qryValidaMesa.FieldByName('mesa_sit').AsString = 'O' Then
    begin
      lbsit.Caption := 'Ocupada';
      Exit;
    end
   else
    begin
     //Situação Disponivel
     if qryValidaMesa.FieldByName('mesa_sit').AsString = 'D' Then
      begin
       lbsit.Caption := 'Disponível';
       Exit;
      end
    end
  end;
end;

procedure TfrmGridPedido.dbgMesasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 qryValidaMesa.Close;
 qryValidaMesa.SQL.Clear;
 qryValidaMesa.SQL.Add('select mesa_sit from mesa');
 qryValidaMesa.SQL.Add('where mesa_cod = :cod');
 qryValidaMesa.ParamByName('cod').AsInteger := dsMesas.DataSet.FieldByName('codigo').AsInteger;
 qryValidaMesa.Open;
 if qryValidaMesa.FieldByName('mesa_sit').AsString = 'A' Then
   begin
     dbgMesas.Canvas.Font.Color:= clBlack;
     dbgMesas.canvas.Brush.color := $008080FF;//clRed;
   end
 else
  begin
   //Situação Ocupada
   if qryValidaMesa.FieldByName('mesa_sit').AsString = 'O' Then
    begin
     dbgMesas.Canvas.Font.Color:= clRed;
     dbgMesas.canvas.Brush.color := $0080FFFF;//clYellow;//clSilver;
    end
   else
    begin
     //Situação Disponivel
     if qryValidaMesa.FieldByName('mesa_sit').AsString = 'D' Then
      begin
       dbgMesas.Canvas.Font.Color:= clBlue;
       dbgMesas.canvas.Brush.color := $0080FF80;//clLime;
      end
    end
  end;
 dbgMesas.Canvas.FillRect(Rect);
 dbgMesas.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.Text);

 //registro selecionado
 If ( GdSelected in State ) Then
   Begin
    dbgMesas.Canvas.Font.Color:= clWhite;
    dbgMesas.canvas.Brush.color := clBlack;
    dbgMesas.Canvas.FillRect( Rect );
    dbgMesas.DefaultDrawDataCell( Rect, Column.Field, State );
   end;
end;

end.
