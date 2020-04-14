unit uGrupo_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, ToolWin, Mask, DB, IBCustomDataSet, IBQuery;

type
  TfrmGrupo_Produto = class(TfrmPadraoCadastro)
    Label1: TLabel;
    dbeCod: TDBEdit;
    bitConsGrupPro: TBitBtn;
    lbNome: TLabel;
    dbeNom: TDBEdit;
    ibqGrup_Prod: TIBQuery;
    dsConsulta: TDataSource;
    ibqGrup_ProdGRU_COD: TIntegerField;
    ibqGrup_ProdGRU_NOM: TIBStringField;
    procedure Alter(sit: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bitConsGrupProClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitSairClick(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupo_Produto: TfrmGrupo_Produto;

implementation

uses udmSYS, uVariavel, uPrincipal, uProduto;

{$R *.dfm}

procedure TfrmGrupo_Produto.Alter(sit: Char);   //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
begin
  case sit of
   'I':Begin  //Permição de Altração negada
         dbeNom.ReadOnly := True;
         Botoes('O'); //chamada da Ativação dos Botões
       end;
   'A':Begin  //Permição de Altração Autorizada
         dbeNom.ReadOnly := False;
         Botoes('I'); //chamada da Ativação dos Botões
       end;
  end;
end;

procedure TfrmGrupo_Produto.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (uVariavel.chamada <> '0') then
     begin
      ibtGrupPro.Locate('GRU_COD',ibqGrup_Prod.FieldByName('GRU_COD').Value,[loCaseInsensitive]);
      uVariavel.chamada:= 'C';
      frmProduto.dbeCodGrup.Text := ibtGrupPro.FieldByName('GRU_COD').Value;
      uVariavel.chamada := '0';
      Close;
     end;
   end;
end;

procedure TfrmGrupo_Produto.bitConsGrupProClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmGrupo_Produto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with dmSYS do
    Begin
      ibtGrupPro.Close;
      dsGrupPro.AutoEdit := False;
      Action := caFree;
    end;
end;

procedure TfrmGrupo_Produto.FormCreate(Sender: TObject);
begin
  inherited;
  with dmSYS do
    Begin
      ibtGrupPro.Open;
      dsGrupPro.AutoEdit := True;
      Alter('I');  //Chamada da alterção dos DBEdits
      pgcPadraoCad.TabIndex := 0;
    end;
end;

procedure TfrmGrupo_Produto.bitIncluirClick(Sender: TObject);
var
  cont: integer;
begin
  inherited;
  with dmSYS do
   Begin
    if (ibqGrup_Prod.Active = True) then
     ibqGrup_Prod.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtGrupPro.Last;                                        //Linha 1
    cont:=1;                                                //Linha 2
    cont:=cont+ibtGrupPro.FieldByName('GRU_COD').AsInteger; //Linha 3
    ibtGrupPro.Append;                          //Referece a inserção do codigo automatico na hora da inclusão Linhas 1,2,3
    Alter('A');    //Chamada da alterção dos DBEdits
    ibtGrupPro.FieldByName('GRU_COD').AsInteger := cont;  //Atribuindo o codigo ao campo referente as Linas 1,2,3
    dbeNom.SetFocus;
    bitConsGrupPro.Enabled := False;
   end;
end;

procedure TfrmGrupo_Produto.bitokClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtGrupPro.FieldByName('Gru_Nom').IsNull then
     begin
      Botoes('I');
      MessageDlg('Nome em branco!', mtInformation, [mbOk], 0);
      dbeNom.SetFocus;
      Exit;
     end;                     //Validação de Nome caso esteja em branco
    ibtGrupPro.Post;
    Alter('I');   //Chamada da alterção dos DBEdits
    dmSYS.ibtSYS_DATABASE.CommitRetaining;
    bitConsGrupPro.Enabled := True;
   end;
end;

procedure TfrmGrupo_Produto.bitAlterarClick(Sender: TObject);
begin
  inherited;
  if  pgcPadraoCad.TabIndex = 1 then
   Begin
    dmSYS.ibtGrupPro.Locate('GRU_COD',ibqGrup_Prod.FieldByName('GRU_COD').Value,[loCaseInsensitive]);
    ibqGrup_Prod.Close;
    pgcPadraoCad.TabIndex := 0;
   end;
  Alter('A');  //Chamada da alterção dos DBEdits
  bitConsGrupPro.Enabled := False;
  dmSYS.ibtGrupPro.Edit;
end;

procedure TfrmGrupo_Produto.bitExcluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtGrupPro.Locate('GRU_COD',ibqGrup_Prod.FieldByName('GRU_COD').Value,[loCaseInsensitive]);
       end;
      if (ibtGrupPro.FieldByName('GRU_COD').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
        Exit;
       end
      else
       begin
        ibtGrupPro.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          ibqGrup_Prod.Close;
          ibqGrup_Prod.Open;
         end;
       end;
     end;
   end;
  Alter('I'); //Chamada da alterção dos DBEdits
end;

procedure TfrmGrupo_Produto.bitCancelarClick(Sender: TObject);
begin
  inherited;
  dmSYS.ibtGrupPro.Cancel;
  Alter('I'); //Chamada da alterção dos DBEdits
  bitConsGrupPro.Enabled := True;
end;

procedure TfrmGrupo_Produto.bitSairClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtGrupPro.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        ibtGrupPro.Cancel;
        Close;
       end;
     end
    else
     Close;
   end;
end;

procedure TfrmGrupo_Produto.tbsCadastroShow(Sender: TObject);
var cod:Integer;
begin
  inherited;
  cod:=0;
  if (dbnNavegacao.Enabled = False) then
   dbnNavegacao.Enabled := True;
  if (ibqGrup_Prod.Active = True) then
   begin
    if not(ibqGrup_Prod.FieldByName('GRU_COD').IsNull) then
      cod := ibqGrup_Prod.FieldByName('GRU_COD').Value;
    if ( cod <> 0) then
     Begin
      ibqGrup_Prod.Close;
      dmSYS.ibtGrupPro.Locate('GRU_COD',cod,[loCaseInsensitive]);
      Alter('I'); //Chamada da alterção dos DBEdits
     end;
   end;
  if (ibqGrup_Prod.Active = True) then
    ibqGrup_Prod.Close;
end;

procedure TfrmGrupo_Produto.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  dbnNavegacao.Enabled := False;
  Alter('I');
  ibqGrup_Prod.Open;
end;

procedure TfrmGrupo_Produto.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtGrupPro.State in [dsInsert, dsEdit] then
     if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      Begin
       AllowChange := True;
       ibtGrupPro.Cancel;
       Alter('I');
       pgcPadraoCad.TabIndex := 1;
       ibqGrup_Prod.Open;    //Ativar a Query para trazer todos os registros
      end
     else
      Begin
       AllowChange := False;
       if (ibqGrup_Prod.Active = True) then
         ibqGrup_Prod.Close;  //Desativar a Query
       Alter('A');
       pgcPadraoCad.TabIndex := 0;
      end;
   end;
end;

end.
