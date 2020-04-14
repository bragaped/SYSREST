unit uMesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, ToolWin, IBQuery, DB, IBCustomDataSet, IBTable, Mask,
  DBClient;

type
  TfrmMesa = class(TfrmPadraoCadastro)
    dsConsulta: TDataSource;
    ibqMesa: TIBQuery;
    lbCod: TLabel;
    dbeCod: TDBEdit;
    lbqtde: TLabel;
    dbeQtdeLug: TDBEdit;
    gbSetor: TGroupBox;
    Label2: TLabel;
    dbeCodSet: TDBEdit;
    Label11: TLabel;
    bitConsSet: TBitBtn;
    bitConsMesa: TBitBtn;
    Label17: TLabel;
    bitConsOK: TBitBtn;
    cbFiltro: TComboBox;
    edtBusc: TEdit;
    Label16: TLabel;
    cbFiltro1: TComboBox;
    edtBusc1: TEdit;
    lbSituacao: TLabel;
    lbSetor: TLabel;
    dbcbSit: TDBCheckBox;
    pnNomSet: TPanel;
    pnSit: TPanel;
    lbsit: TLabel;
    sbAgrupT: TSpeedButton;
    sbDesagrupT: TSpeedButton;
    sbAgrup1: TSpeedButton;
    sbDesagrup1: TSpeedButton;
    Label1: TLabel;
    Label3: TLabel;
    dbgdisponivel: TDBGrid;
    dbgAgrupadas: TDBGrid;
    cdsDisponiveis: TClientDataSet;
    cdsAgrupadas: TClientDataSet;
    dsAgrupadas: TDataSource;
    qryDisponiveis: TIBQuery;
    qryAgrupadas: TIBQuery;
    qryDisponiveisMESA_COD: TIntegerField;
    cdsDisponiveiscodigo: TIntegerField;
    cdsDisponiveisMesa: TStringField;
    cdsAgrupadasMesa: TStringField;
    cdsAgrupadascodigo: TIntegerField;
    dsDisponiveis: TDataSource;
    qryAgrupadasMESA_FIL: TIntegerField;
    procedure CarregaMesaDisponiveis();
    procedure CarregaMesaAgrupadas();
    procedure Situacao();
    procedure Alter(Sit: Char);
    procedure LocSet(Cod: Integer);
    procedure FormCreate(Sender: TObject);
    procedure bitConsSetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitSairClick(Sender: TObject);
    procedure bitConsMesaClick(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure dbeCodSetChange(Sender: TObject);
    procedure bitConsOKClick(Sender: TObject);
    procedure dbnNavegacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure cbFiltroChange(Sender: TObject);
    procedure edtBuscChange(Sender: TObject);
    procedure cbFiltro1Change(Sender: TObject);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure GroupBox1Enter(Sender: TObject);
    procedure GroupBox1Exit(Sender: TObject);
    procedure sbAgrup1Click(Sender: TObject);
    procedure sbDesagrup1Click(Sender: TObject);
    procedure sbAgrupTClick(Sender: TObject);
    procedure sbDesagrupTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMesa: TfrmMesa;

implementation

uses udmSYS, uSetor, uVariavel, uCidade, Math, ugridPedido, uPrincipal;

{$R *.dfm}

procedure TfrmMesa.CarregaMesaDisponiveis();
var cont, total: Integer;
begin
 qryDisponiveis.Close;
 qryDisponiveis.Open;
 //somar quantidade de Mesas Disponiveis
 qryDisponiveis.DisableControls;
 qryDisponiveis.First;
 total:=0;
 while not qryDisponiveis.Eof do begin
   Inc(total);
   qryDisponiveis.Next;
  end ;
 qryDisponiveis.EnableControls;
 //adicionar no Grid as mesas Disponiveis
 qryDisponiveis.First;

 for cont := 0 to total do
  begin
   if not qryDisponiveis.Eof then
    begin
     cdsDisponiveis.Append;
     cdsDisponiveis.FieldByName('mesa').AsString := 'Mesa:';
     cdsDisponiveis.FieldByName('codigo').AsInteger := qryDisponiveis.FieldByName('Mesa_Cod').AsInteger;
     cdsDisponiveis.Post;
     qryDisponiveis.Next;
    end;
  end;
 cdsDisponiveis.First;
end;

procedure TfrmMesa.CarregaMesaAgrupadas();
var cont, total: Integer;
begin
 qryAgrupadas.Close;
 qryAgrupadas.ParamByName('cod').AsInteger := StrToInt(dbeCod.Text);
 qryAgrupadas.Open;
 //somar quantidade de Mesas Agrupadas
 qryAgrupadas.DisableControls;
 qryAgrupadas.First;
 total:=0;
 while not qryAgrupadas.Eof do begin
   Inc(total);
   qryAgrupadas.Next;
  end ;
 qryAgrupadas.EnableControls;
 //adicionar no Grid as mesas Agrupadas a mesa Atual
 qryAgrupadas.First;

 for cont := 0 to total do
  begin
   if not qryAgrupadas.Eof then
    begin
     cdsAgrupadas.Append;
     cdsAgrupadas.FieldByName('mesa').AsString := 'Mesa:';
     cdsAgrupadas.FieldByName('codigo').AsInteger := qryAgrupadas.FieldByName('MESA_FIL').AsInteger;
     cdsAgrupadas.Post;
     qryAgrupadas.Next;
    end;
  end;
 cdsAgrupadas.First;
end;

procedure TfrmMesa.Alter(sit: Char);   //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
 procedure alteravalor(TF,FT:Boolean);
  begin
   dbeQtdeLug.ReadOnly := TF;
   dbeCodSet.ReadOnly := TF;
   dbcbSit.ReadOnly := TF;
   //dbgdisponivel.ReadOnly := TF;
   //dbgAgrupadas.ReadOnly := TF;
   //sbAgrupT.Enabled := FT;
   //sbAgrup1.Enabled := FT;
   //sbDesagrupT.Enabled := FT;
   //sbDesagrup1.Enabled := FT;
  end;
begin
  case sit of
   'I':Begin  //Permição de Altração negada
        alteravalor(True,False);
        Botoes('O'); //chamada da Ativação dos Botões
       end;
   'A':Begin  //Permição de Altração Autorizada
        alteravalor(false,True);
        Botoes('I'); //chamada da Ativação dos Botões
       end;
  end;
if (dbeCodSet.Text <> '') then
  LocSet(StrToInt(dbeCodSet.Text));
end;

procedure TfrmMesa.LocSet(Cod: Integer);
Begin
 with dmSYS do              //localização da cidade atravez da digitação do codigo
  Begin
    ibtSetor.Open;
    ibtSetor.Locate('SET_COD',Cod,[loCaseInsensitive]);
    if (ibtSetor.FieldByName('SET_COD').AsInteger = Cod) then
      Begin
        pnNomSet.Caption := ibtSetor.FieldByName('SET_NOM').AsString;
      end
    else
      Begin
        MessageDlg('Setor não Cadastrada', mtInformation, [mbOK],0);
        dbeCodSet.SetFocus;
        pnNomSet.Caption := '';
      end;
  end;
end;

procedure TfrmMesa.Situacao();   //Verificação se o Cliente está ATIVO ou INATIVO
Begin
 with dmSYS do
  Begin
   if (ibtMesa.FieldByName('MESA_SIT').AsString ='I') then
    begin
     dbcbSit.Checked := True;
     pnSit.Visible := False;
     lbsit.Visible := False;
    end
   else
    begin
     dbcbSit.Checked := False;
     pnSit.Visible := True;
     lbsit.Visible := True;
     if (ibtMesa.FieldByName('MESA_SIT').AsString = 'A') then
      pnSit.Caption := 'ABERTA'
     else
      begin
       if (ibtMesa.FieldByName('MESA_SIT').AsString = 'D') then
        pnSit.Caption := 'DISPONIVEL'
       else
        begin
         if (ibtMesa.FieldByName('MESA_SIT').AsString = 'O') then
          pnSit.Caption := 'OCUPADA'
         else
          if (ibtMesa.FieldByName('MESA_SIT').AsString = 'F') then
           pnSit.Caption := 'FECHADA';
        end;
      end;
    end;
  end;
end;

procedure TfrmMesa.bitConsSetClick(Sender: TObject);
begin                    //Chamada da tela de Setor
  inherited;
  if (dbeCodSet.ReadOnly = False) then
   begin
    uVariavel.chamada:= '1';
    Application.CreateForm(TfrmSetor,frmSetor);
    frmSetor.Show;
    frmSetor.pgcPadraoCad.TabIndex := 1;
   end;
end;

procedure TfrmMesa.FormCreate(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    ibtMesa.Open;
    ibtJunta_Mesa.Open;
    ibtSetor.Open;
    dsMesa.AutoEdit := True;
    dsJunta_Mesa.AutoEdit := True;
    dsSetor.AutoEdit := True;
    Situacao;   //Chamada da procedure para alterar Box de Situação
    Alter('I');  //Chamada da alterção dos DBEdits
    pgcPadraoCad.TabIndex := 0;
    cbFiltro.ItemIndex := -1;
    cbFiltro1.ItemIndex := -1;
    bitConsMesa.Enabled := True;
    bitConsSet.Enabled := False;
   end;
 cdsDisponiveis.CreateDataSet;
 cdsAgrupadas.CreateDataSet;
 CarregaMesaAgrupadas();
 CarregaMesaDisponiveis();
end;

procedure TfrmMesa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    with dmSYS do
    Begin
      //ibtMesa.Close;
      //dsMesa.AutoEdit := False;
      ibtSetor.Close;
      dsSetor.AutoEdit := False;
      Action := caFree;
    end;
 if Principal.Ativacao('FRMGRIDPEDIDO') then
  begin
   if (frmGridPedido.cdsMesas.Active) then
    begin
     frmGridPedido.cdsMesas.Close;
     frmGridPedido.cdsMesas.Open;
    end;
  end;
end;

procedure TfrmMesa.bitIncluirClick(Sender: TObject);
var
  cont: integer;
begin
  inherited;
  with dmSYS do
   Begin
    if (ibqMesa.Active = True) then
     ibqMesa.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtMesa.Last;                                         //Linha 1
    cont:=1;                                              //Linha 2
    cont:=cont+ibtMesa.FieldByName('MESA_Cod').AsInteger; //Linha 3
    ibtMesa.Append;                          //Referece a inserção do codigo automatico na hora da inclusão Linhas 1,2,3
    Alter('A');    //Chamada da alterção dos DBEdits
    ibtMesa.FieldByName('MESA_Cod').AsInteger := cont;  //Atribuindo o codigo ao campo referente as Linas 1,2,3
    dbeQtdeLug.SetFocus;
    ibtSetor.Close;
    dbcbSit.Checked := False;
    pnNomSet.Caption := '';
    bitConsMesa.Enabled := False;
    bitConsSet.Enabled := True;
   end;
  //dbgdisponivel.ReadOnly := True;
  //dbgAgrupadas.ReadOnly := True;
  //sbAgrupT.Enabled := False;
  //sbAgrup1.Enabled := False;
  //sbDesagrupT.Enabled := False;
  //sbDesagrup1.Enabled := False;
end;

procedure TfrmMesa.bitokClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtMesa.FieldByName('SET_COD').IsNull then
     begin
      Botoes('I');
      MessageDlg('Setor em branco!', mtInformation, [mbOk], 0);
      dbeCodSet.SetFocus;
      Exit;
     end;                     //Validação de Codigo  da Cidade e Nome caso estejão em branco
    if ibtMesa.FieldByName('MESA_Lug').IsNull then
     begin
      Botoes('I');
      MessageDlg('Quantidade de Lugares em branco!', mtInformation, [mbOk], 0);
      dbeQtdeLug.SetFocus;
      Exit;
     end;
    if (dbcbSit.Checked = True) then
     ibtMesa.FieldByName('MESA_SIT').AsString := 'I'
    else
      if (dbcbSit.Checked = False) then
        ibtMesa.FieldByName('MESA_SIT').AsString := 'D';
    ibtMesa.Post;
    Alter('I');   //Chamada da alterção dos DBEdits
    Situacao();   //Chamada da procedure para alterar Box de Situação
    bitConsMesa.Enabled := True;
    bitConsSet.Enabled := False;
   end;
  dmSYS.ibtSYS_DATABASE.CommitRetaining;
  CarregaMesaDisponiveis();
end;

procedure TfrmMesa.bitAlterarClick(Sender: TObject);
begin
 if  pgcPadraoCad.TabIndex = 1 then
  Begin
   dmSYS.ibtMesa.Locate('MESA_COD',ibqMesa.FieldByName('Codigo').Value,[loCaseInsensitive]);
   ibqMesa.Close;
   pgcPadraoCad.TabIndex := 0;
   Situacao(); //Chamada da procedure para alterar Box de Situação
  end;
 if (dmSYS.ibtMesa.FieldByName('MESA_SIT').AsString = 'D') then
  begin
   Alter('A');  //Chamada da alterção dos DBEdits
   dmSYS.ibtMesa.Edit;
   bitConsMesa.Enabled := False;
   bitConsSet.Enabled := True;
  end
 else
  begin
   if (dmSYS.ibtMesa.FieldByName('MESA_SIT').AsString = 'A') then
    ShowMessage('Mesa Possui Pedido');
   if (dmSYS.ibtMesa.FieldByName('MESA_SIT').AsString = 'O') then
    ShowMessage('Mesa está Ocupada');
  end;
end;

procedure TfrmMesa.bitExcluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtMesa.Locate('MESA_COD',ibqMesa.FieldByName('Codigo').Value,[loCaseInsensitive]);
       end;
      if (ibtMesa.FieldByName('MESA_COD').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
        Exit;
       end
      else
       begin
        ibtMesa.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          ibqMesa.Close;
          ibqMesa.Open;
         end;
       end;
     end;
   end;
  Situacao(); //Chamada da procedure para alterar Box de Situação
  Alter('I'); //Chamada da alterção dos DBEdits
end;

procedure TfrmMesa.bitCancelarClick(Sender: TObject);
begin
  inherited;
  dmSYS.ibtMesa.Cancel;
  Situacao();  //Chamada da procedure para alterar Box de Situação
  Alter('I');  //Chamada da alterção dos DBEdits
  bitConsMesa.Enabled := True;
  bitConsSet.Enabled := False;
end;

procedure TfrmMesa.bitSairClick(Sender: TObject);
begin                          //Saida do Formulario
  inherited;
  with dmSYS do
   Begin
    if ibtMesa.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        ibtMesa.Cancel;
        Close;
       end;
     end
    else
     Close;
   end;
end;

procedure TfrmMesa.bitConsMesaClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmMesa.tbsCadastroShow(Sender: TObject);
var cod:Integer;
begin
  inherited;
  cod:=0;
  if (dbnNavegacao.Enabled = False) then
   dbnNavegacao.Enabled := True;
  if (ibqMesa.Active = True) then
   begin
    if not(ibqMesa.FieldByName('Codigo').IsNull) then
      cod := ibqMesa.FieldByName('Codigo').Value;
    if ( cod <> 0) then
     Begin
      ibqMesa.Close;
      dmSYS.ibtMesa.Locate('MESA_COD',cod,[loCaseInsensitive]);
      Situacao(); //Chamada da procedure para alterar Box de Situação
      Alter('I'); //Chamada da alterção dos DBEdits
     end;
   end;
  if (ibqMesa.Active = True) then
    ibqMesa.Close;
end;

procedure TfrmMesa.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  dbnNavegacao.Enabled := False;
  Alter('I');
  ibqMesa.Open;
  if (cbFiltro.ItemIndex = -1) then
   begin
    cbFiltro1.Enabled := False;
    cbFiltro1.Visible := False;
    edtBusc1.Enabled := False;
    edtBusc1.Visible := False;
    lbSituacao.Visible := False;
    lbSetor.Visible := False;
    edtBusc.Enabled := False;
    edtBusc.Visible := False;
   end;
end;

procedure TfrmMesa.dbeCodSetChange(Sender: TObject);
begin                                  //Seleção do codigo do setor
  inherited;
  if dbeCodSet.Text <> '' then
   begin
    LocSet(StrToInt(dbeCodSet.Text));
    if (uVariavel.chamada = 'C') then
     begin
      dmSYS.ibtMesa.FieldByName('SET_COD').AsInteger := StrToInt(dbeCodSet.Text);
     end;
   end
  else
    Begin
      pnNomSet.Caption := '';
    end;
end;

procedure TfrmMesa.bitConsOKClick(Sender: TObject);
begin                              //Passagem por parametros do codigo da mesa
  inherited;
  with dmSYS do
   Begin
    if (uVariavel.chamada <> '0') then
     begin
      ibtMesa.Locate('MESA_COD',ibqMesa.FieldByName('Codigo').Value,[loCaseInsensitive]);
      uVariavel.chamada := 'C';
      //frmVendas.dbeMesaCod.Text := ibtMesa.FieldByName('MESA_COD').Value;
      uVariavel.chamada := '0';
      Close;
     end;
   end;
end;

procedure TfrmMesa.dbnNavegacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  Situacao(); //Chamada da procedure para alterar Box de Situação
  Alter('I'); //Chamada da alterção dos DBEdits
  cdsAgrupadas.Close;
  if (dmSYS.ibtMesa.FieldByName('MESA_SIT').AsString = 'A') then
   begin
    cdsAgrupadas.CreateDataSet;
    CarregaMesaAgrupadas();
   end;
end;

procedure TfrmMesa.cbFiltroChange(Sender: TObject);
begin
  inherited;
  if (cbFiltro.ItemIndex = 0) then
   begin                                   //Alteração do tipo de busca
    cbFiltro1.Enabled := True;
    cbFiltro1.Visible := True;
    edtBusc1.Enabled := True;
    edtBusc1.Visible := True;
    lbSituacao.Visible := True;
    lbSetor.Visible := True;
    edtBusc.Enabled := False;
    edtBusc.Visible := False;
   end
  else
   if (cbFiltro.ItemIndex = 1) then
   begin
    cbFiltro1.Enabled := False;
    cbFiltro1.Visible := False;
    edtBusc1.Enabled := False;
    edtBusc1.Visible := False;
    lbSituacao.Visible := False;
    lbSetor.Visible := False;
    edtBusc.Enabled := True;
    edtBusc.Visible := True;
   end;
end;

procedure TfrmMesa.edtBuscChange(Sender: TObject);  //Consulta por codigo da mesa
begin
  inherited;
  if (edtBusc.Text <> '') then
   begin
    ibqMesa.Close;
    ibqMesa.SQL.Clear;
    ibqMesa.SQL.Add('Select mesa.mesa_cod as Codigo, mesa.mesa_lug as Qtd_Lugares,');
    ibqMesa.SQL.Add('mesa.MESA_SIT as Situacao, setor.set_nom as Nome_Setor From Setor, Mesa');
    ibqMesa.SQL.Add('Where mesa.set_cod = setor.set_cod and mesa.mesa_cod');
    ibqMesa.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
    ibqMesa.Open;
   end;
end;

procedure TfrmMesa.cbFiltro1Change(Sender: TObject);
var sit: char;                               //Consulta por situação da mesa
begin
  inherited;
  if (cbFiltro.ItemIndex = 0) then
   begin
    ibqMesa.Close;
    ibqMesa.SQL.Clear;
    ibqMesa.SQL.Add('Select mesa.mesa_cod as Codigo, mesa.mesa_lug as Qtd_Lugares,');
    ibqMesa.SQL.Add('mesa.MESA_SIT as Situacao, setor.set_nom as Nome_Setor From Setor, Mesa');
    ibqMesa.SQL.Add('Where mesa.MESA_SIT = :Situacao and mesa.set_cod = setor.set_cod');
    if (Trim(edtBusc1.Text) <> '') then
     begin
      ibqMesa.SQL.Add('and mesa.set_cod = setor.set_cod and setor.set_nom');
      ibqMesa.SQL.Add('Like'+#39+Trim(edtBusc1.Text)+'%'+#39' ORDER BY mesa.mesa_cod');
     end;
    case cbFiltro1.ItemIndex of
      0: begin
         sit:='A';      //Situação ABERTA
         ibqMesa.Prepare;
         ibqMesa.ParamByName('Situacao').AsString := sit;
         ibqMesa.Open;
         edtBusc1.SetFocus;
         exit;
        end;
      1: begin
         sit:='D';      //Situação DISPONIVEL
         ibqMesa.Prepare;
         ibqMesa.ParamByName('Situacao').AsString := sit;
         ibqMesa.Open;
         edtBusc1.SetFocus;
         exit;
        end;
      2: begin
         sit:='O';      //Situação OCUPADA
         ibqMesa.Prepare;
         ibqMesa.ParamByName('Situacao').AsString := sit;
         ibqMesa.Open;
         exit;
        end;
      3: begin
         sit:='I';      //Situação INATIVA
         ibqMesa.Prepare;
         ibqMesa.ParamByName('Situacao').AsString := sit;
         ibqMesa.Open;
         exit;
        end;
    end;
  end;
end;

procedure TfrmMesa.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtMesa.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
       Begin
        AllowChange := True;
        ibtMesa.Cancel;
        Alter('I');
        pgcPadraoCad.TabIndex := 1;
        ibqMesa.Open;    //Ativar a Query para trazer todos os registros
       end
      else
       Begin
        AllowChange := False;
        if (ibqMesa.Active = True) then
          ibqMesa.Close;  //Desativar a Query
        Alter('A');
        pgcPadraoCad.TabIndex := 0;
       end;
     end;
   end;
end;

procedure TfrmMesa.GroupBox1Enter(Sender: TObject);
begin
  inherited;
  frmMesa.KeyPreview := False;
end;

procedure TfrmMesa.GroupBox1Exit(Sender: TObject);
begin
  inherited;
  frmMesa.KeyPreview := True;
end;

procedure TfrmMesa.sbAgrup1Click(Sender: TObject);
begin
 if cdsDisponiveis.RecordCount > 0 then
  begin
   cdsAgrupadas.Append;
   cdsAgrupadas.FieldByName('mesa').AsString := 'Mesa: ';
   cdsAgrupadas.FieldByName('codigo').AsInteger := cdsDisponiveis.FieldByName('codigo').AsInteger;
   cdsAgrupadas.Post;
   dmSYS.ibtJunta_Mesa.Append;
   dmSYS.ibtJunta_Mesa.FieldByName('MESA_COD').AsInteger := StrToInt(dbeCod.Text);
   dmSYS.ibtJunta_Mesa.FieldByName('MESA_FIL').AsInteger := cdsDisponiveis.FieldByName('codigo').AsInteger;
   dmSYS.ibtJunta_Mesa.Post;
   dmSYS.ibtSYS_DATABASE.CommitRetaining;
   cdsDisponiveis.Delete;
  end
end;

procedure TfrmMesa.sbDesagrup1Click(Sender: TObject);
begin
 if cdsAgrupadas.RecordCount > 0 then
  begin
   cdsDisponiveis.Append;
   cdsDisponiveis.FieldByName('mesa').AsString := 'Mesa: ';
   cdsDisponiveis.FieldByName('codigo').AsInteger := cdsAgrupadas.FieldByName('codigo').AsInteger;
   cdsDisponiveis.Post;
   dmSYS.ibtJunta_Mesa.Locate('MESA_COD;MESA_FIL',
           VarArrayOf([dbeCod.Text,cdsAgrupadas.FieldByName('codigo').AsInteger]),[loCaseInsensitive]);
   dmSYS.ibtJunta_Mesa.Delete;
   dmSYS.ibtSYS_DATABASE.CommitRetaining;
   cdsAgrupadas.Delete;
  end;
end;

procedure TfrmMesa.sbAgrupTClick(Sender: TObject);
begin
 if cdsDisponiveis.RecordCount > 0 then
  begin
   cdsDisponiveis.First;
   while not cdsDisponiveis.Eof do
    begin
     cdsAgrupadas.Append;
     cdsAgrupadas.FieldByName('mesa').AsString := 'Mesa: ';
     cdsAgrupadas.FieldByName('codigo').AsInteger := cdsDisponiveis.FieldByName('codigo').AsInteger;
     cdsAgrupadas.Post;
     dmSYS.ibtJunta_Mesa.Append;
     dmSYS.ibtJunta_Mesa.FieldByName('MESA_COD').AsInteger := StrToInt(dbeCod.Text);
     dmSYS.ibtJunta_Mesa.FieldByName('MESA_FIL').AsInteger := cdsDisponiveis.FieldByName('codigo').AsInteger;
     dmSYS.ibtJunta_Mesa.Post;
     cdsDisponiveis.Delete;
    end;
  end;
 dmSYS.ibtSYS_DATABASE.CommitRetaining;
 dbgAgrupadas.SetFocus;
end;

procedure TfrmMesa.sbDesagrupTClick(Sender: TObject);
begin
 if cdsAgrupadas.RecordCount > 0 then
  begin
   cdsAgrupadas.First;
   while not cdsAgrupadas.Eof do
    begin
     cdsDisponiveis.Append;
     cdsDisponiveis.FieldByName('mesa').AsString := 'Mesa: ';
     cdsDisponiveis.FieldByName('codigo').AsInteger := cdsAgrupadas.FieldByName('codigo').AsInteger;
     cdsDisponiveis.Post;
     dmSYS.ibtJunta_Mesa.Locate('MESA_COD;MESA_FIL',
           VarArrayOf([dbeCod.Text,cdsAgrupadas.FieldByName('codigo').AsInteger]),[loCaseInsensitive]);
     dmSYS.ibtJunta_Mesa.Delete;
     cdsAgrupadas.Delete;
    end;
  end;
 dmSYS.ibtSYS_DATABASE.CommitRetaining;
 dbgdisponivel.SetFocus;
end;

end.
