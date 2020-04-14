unit uCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, ToolWin, DB, IBCustomDataSet, IBTable, Mask, IBQuery,
  CheckLst, ActnList;  // Outline, FileCtrl 

type
  TfrmCidade = class(TfrmPadraoCadastro)
    Label1: TLabel;
    dbeCod: TDBEdit;
    Label2: TLabel;
    dbeNom: TDBEdit;
    Label3: TLabel;
    cbEst: TDBComboBox;
    Label16: TLabel;
    cbFiltro: TComboBox;
    edtBusc: TEdit;
    bitConsCid: TBitBtn;
    ibqCidade: TIBQuery;
    dsConsulta: TDataSource;
    bitOKCons: TBitBtn;
    procedure Alter(sit: Char);
    procedure bitSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure edtBuscChange(Sender: TObject);
    procedure bitConsCidClick(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitOKConsClick(Sender: TObject);
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
  frmCidade: TfrmCidade;

implementation

uses udmSYS, uVariavel, uCliente, uFornecedor, Math, uFuncionario;

{$R *.dfm}

procedure TfrmCidade.Alter(sit: Char);  //Alterar Sistuação dos DBEdits para poder Alterar para (Sim ou Não)
begin
  if (sit = 'I') then
    Begin
      dbeNom.ReadOnly := True;
      cbEst.ReadOnly := True;
      Botoes('O');
    end;
  if (sit = 'A') then
    Begin
      dbeNom.ReadOnly := False;
      cbEst.ReadOnly := False;
      Botoes('I');
    end;
end;

procedure TfrmCidade.bitSairClick(Sender: TObject); //Sair do Cadastro de Cidade
begin
  inherited;
  with dmSYS do
   Begin
    if ibtCidade.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        ibtCidade.Cancel;
        Close;
       end;
      end
     else
      Close;
    end;
end;

procedure TfrmCidade.FormClose(Sender: TObject; var Action: TCloseAction); //Fechando o Formulario de Cidade
begin
  inherited;
  with dmSYS do
    Begin
      ibtCidade.Close;
      dsCidade.AutoEdit := False;
    end;
  Action := caFree;
end;

procedure TfrmCidade.bitIncluirClick(Sender: TObject);  //Botão Incluir
var cont: Integer;
begin
  inherited;
  with dmSYS do
   Begin
    ibqCidade.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtCidade.Last;                                        // Linha 1
    cont:=1;                                               // Linha 2
    cont:=cont+ibtCidade.FieldByName('CID_COD').AsInteger; // Linha 3
    ibtCidade.Append;                        //Referece a inserção do codigo automatico na hora da inclusão Linhas 1,2,3
    Alter('A');    //Chamada da alterção dos DBEdits
    ibtCidade.FieldByName('CID_COD').AsInteger := cont; //Atribuindo o codigo ao campo referente as Linas 1,2,3
    dbeNom.SetFocus;
    bitConsCid.Enabled := False;
   end;
end;

procedure TfrmCidade.FormCreate(Sender: TObject);   //Criação do Formulario
begin
  inherited;
  with dmSYS do
    Begin
      ibtCidade.Open;
      Alter('I');  //Chamada da alterção dos DBEdits
      dsCidade.AutoEdit := True;
      pgcPadraoCad.TabIndex := 0;
    end;
end;

procedure TfrmCidade.bitokClick(Sender: TObject);  //Botão OK
begin
  inherited;
  with dmSYS do
   Begin
    if (dbeNom.Text = '') then    //Validação do Nome
     begin
      Botoes('I');
      MessageDlg('Nome em Branco',mtInformation, [mbOK], 0);
      dbeNom.SetFocus;
      Exit;
     end
    else
     begin
      ibtCidade.Post;
      Alter('I');  //Chamada da alterção dos DBEdits
      bitConsCid.Enabled := True;
     end;
   end;
  dmSYS.ibtSYS_DATABASE.CommitRetaining;
end;

procedure TfrmCidade.bitCancelarClick(Sender: TObject);  // Botão Cancelar
begin
  inherited;
  dmSYS.ibtCidade.Cancel;
  Alter('I'); //Chamada da alterção dos DBEdits
  bitConsCid.Enabled := True;
end;

procedure TfrmCidade.edtBuscChange(Sender: TObject); //Busca atravez dos filtros do cbFiltro
begin
  inherited;
  if edtBusc.Text <> '' then
    begin
      with dmSYS.ibtCidade do
      	begin
          ibqCidade.Close;
          ibqCidade.SQL.Clear;
          case cbFiltro.ItemIndex of
            0:Begin
                ibqCidade.SQL.Add('Select CID_NOM as Nome, EST_SIG as Estado, CID_COD as Codigo');
                ibqCidade.SQL.Add('From Cidade where CID_NOM Like'+#39+Trim(edtBusc.Text)+'%'+#39);
              End;
            1:Begin
                ibqCidade.SQL.Add('Select CID_COD as Codigo, CID_NOM as Nome, EST_SIG as Estado');
                ibqCidade.SQL.Add('From Cidade where CID_COD Like'+#39+Trim(edtBusc.Text)+'%'+#39);
              End;
	        end;
        ibqCidade.Open;
      	end;
    end
   else
    Begin
      ibqCidade.Close;
      ibqCidade.SQL.Clear;
      ibqCidade.SQL.Add('Select CID_COD as Codigo, CID_NOM as Nome, EST_SIG as Estado From Cidade ORDER BY CID_NOM');
      ibqCidade.Open;
    end;
end;

procedure TfrmCidade.bitConsCidClick(Sender: TObject);  //ir para aba Consulta
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmCidade.bitExcluirClick(Sender: TObject);  //Botão Excluir
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtCidade.Locate('CID_COD',ibqCidade.FieldByName('Codigo').Value,[loCaseInsensitive]);
       end;
      if (ibtCidade.FieldByName('CID_COD').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
        Exit;
       end
      else
       begin
        ibtCidade.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          ibqCidade.Close;
          ibqCidade.Open;
         end;
       end;
     end;
   end;
  Alter('I');  //Chamada da alterção dos DBEdits
end;

procedure TfrmCidade.bitAlterarClick(Sender: TObject); //Botão Alterar
begin
  inherited;
  if  pgcPadraoCad.TabIndex = 1 then
    Begin
      dmSYS.ibtCidade.Locate('CID_COD',ibqCidade.FieldByName('Codigo').Value,[loCaseInsensitive]);
      ibqCidade.Close;
      pgcPadraoCad.TabIndex := 0;
    end;
  Alter('A'); //Chamada da alterção dos DBEdits
  dmSYS.ibtCidade.Edit;
  bitConsCid.Enabled := False;
end;

procedure TfrmCidade.tbsCadastroShow(Sender: TObject);
var cod:Integer;
begin
  inherited;
  cod:=0;
  if (dbnNavegacao.Enabled = False) then
   dbnNavegacao.Enabled := True;
  if (ibqCidade.Active = True) then
   begin
    if not(ibqCidade.FieldByName('Codigo').IsNull) then
     cod := ibqCidade.FieldByName('Codigo').Value;
    if (cod <> 0) then
     Begin
      ibqCidade.Close;
      dmSYS.ibtCidade.Locate('CID_COD',cod,[loCaseInsensitive]);
     end;
   end;
  if (ibqCidade.Active = True) then
    ibqCidade.Close;
end;

procedure TfrmCidade.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (dbnNavegacao.Enabled = True) then
     dbnNavegacao.Enabled := False;
    edtBuscChange(tbsConsulta);
    Alter('I');
    ibqCidade.Open;
   end;
end;

procedure TfrmCidade.bitOKConsClick(Sender: TObject);
begin
  inherited;
with dmSYS do
 Begin
  if (uVariavel.chamada <> '0') then
   begin
    ibtCidade.Locate('CID_COD',ibqCidade.FieldByName('Codigo').Value,[loCaseInsensitive]);
    case uVariavel.chamada of
      '1':Begin
            uVariavel.chamada := 'C';
            frmCliente.dbeCodCid.Text := ibtCidade.FieldByName('CID_COD').Value;
            uVariavel.chamada := '0';
            //ibtCliente.FieldByName('CID_COD').AsInteger := ibtCidade.FieldByName('CID_COD').Value;
            Close;
          End;
      '2':Begin
            uVariavel.chamada := 'C';
            frmFornecedor.dbeCodCid.Text := ibtCidade.FieldByName('CID_COD').Value;
            //ibtFornecedor.FieldByName('CID_COD').AsInteger := ibtCidade.FieldByName('CID_COD').Value;
            uVariavel.chamada := '0';
            Close;
          End;
      '3':Begin
            uVariavel.chamada := 'C';
            frmFuncionario.dbeCodCid.Text := ibtCidade.FieldByName('CID_COD').Value;
            //ibtFuncionario.FieldByName('CID_COD').AsInteger := ibtCidade.FieldByName('CID_COD').Value;
            uVariavel.chamada := '0';
            Close;
          End;
    end;
   end;
 end;
end;

procedure TfrmCidade.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   begin
    if ibtCidade.State in [dsInsert, dsEdit] then
     if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      Begin
       AllowChange := True;
       ibtCidade.Cancel;
       Alter('I');
       pgcPadraoCad.TabIndex := 1;
       ibqCidade.Open;    //Ativar a Query para trazer todos os registros
      end
     else
      Begin
       AllowChange := False;
       if (ibqCidade.Active = True) then
         ibqCidade.Close;  //Desativar a Query
       Alter('A');
       pgcPadraoCad.TabIndex := 0;
      end;
   end;
end;

end.
