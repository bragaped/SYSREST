unit uFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, ToolWin, Mask, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TfrmFuncionario = class(TfrmPadraoCadastro)
    grbCidade: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbeCodCid: TDBEdit;
    bitConsCid: TBitBtn;
    dbeCod: TDBEdit;
    Label1: TLabel;
    bitConsFunc: TBitBtn;
    Label17: TLabel;
    lbNome: TLabel;
    dbeNom: TDBEdit;
    lbCPFCNPJ: TLabel;
    dbecpf: TDBEdit;
    dberg: TDBEdit;
    lbRGIE: TLabel;
    Label9: TLabel;
    dbeSex: TDBEdit;
    Label5: TLabel;
    dbeEnd: TDBEdit;
    Label7: TLabel;
    dbeBai: TDBEdit;
    dbeComp: TDBEdit;
    Label6: TLabel;
    Label8: TLabel;
    dbeCEP: TDBEdit;
    Label14: TLabel;
    dbeEmail: TDBEdit;
    Label15: TLabel;
    dbeTel: TDBEdit;
    dbmObs: TDBMemo;
    Label13: TLabel;
    Label2: TLabel;
    dbeFuncao: TDBEdit;
    Label3: TLabel;
    dtpAdmissao: TDateTimePicker;
    bitConsOK: TBitBtn;
    cbFiltro: TComboBox;
    edtBusc: TEdit;
    Label16: TLabel;
    ibqFuncionario: TIBQuery;
    dsConsulta: TDataSource;
    mkeBusc: TMaskEdit;
    dbcbSit: TDBCheckBox;
    pnNomCid: TPanel;
    pnSigEst: TPanel;
    Label4: TLabel;
    dbeComissao: TDBEdit;
    procedure Situacao();
    procedure Alter(Sit: Char);
    procedure LocCid(Cod: Integer);
    procedure bitSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitConsFuncClick(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure dbeCodCidChange(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure bitConsCidClick(Sender: TObject);
    procedure dbecpfExit(Sender: TObject);
    procedure bitConsOKClick(Sender: TObject);
    procedure dbnNavegacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure edtBuscChange(Sender: TObject);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionario: TfrmFuncionario;

implementation

uses udmSYS, uCidade, uVariavel, StrUtils, ugridPedido;

{$R *.dfm}

procedure TfrmFuncionario.Situacao();   //Verificação se o Cliente está ATIVO ou INATIVO
Begin
  with dmSYS do
   Begin
    if (ibtFuncionario.FieldByName('FUN_SIT').AsString ='I') then
     dbcbSit.Checked := True
    else
     if (ibtFuncionario.FieldByName('FUN_SIT').AsString = 'A') then
      dbcbSit.Checked := False;
    dtpAdmissao.DateTime := ibtFuncionario.FieldByName('FUN_DTAADM').AsDateTime;
   end;
end;

procedure TfrmFuncionario.Alter(sit: Char);   //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
 procedure alteravalor(TF,FT:Boolean);
  begin
   dbeNom.ReadOnly := TF;
   dbecpf.ReadOnly := TF;
   dberg.ReadOnly := TF;
   dbeSex.ReadOnly := TF;
   dbeEnd.ReadOnly := TF;
   dbeBai.ReadOnly := TF;
   dbeComp.ReadOnly := TF;
   dbeCEP.ReadOnly := TF;
   dbeFuncao.ReadOnly := TF;
   dbeComissao.ReadOnly := TF;
   dtpAdmissao.Enabled := FT;
   dbeEmail.ReadOnly := TF;
   dbeTel.ReadOnly := TF;
   dbeCodCid.ReadOnly := TF;
   dbmObs.ReadOnly := TF;
   dbcbSit.ReadOnly := TF;
  end;
begin
  case sit of
   'I':Begin  //Permição de Altração negada
        alteravalor(True,False);
        Botoes('O'); //chamada da Ativação dos Botões
       end;
   'A':Begin  //Permição de Altração Autorizada
        alteravalor(False,True);
        Botoes('I'); //chamada da Ativação dos Botões
       end;
  end;
if (dbeCodCid.Text <> '') then
  LocCid(StrToInt(dbeCodCid.Text));
end;

procedure TfrmFuncionario.LocCid(Cod: Integer);
Begin
 with dmSYS do              //localização da cidade atravez da digitação do codigo
  Begin
    ibtCidade.Open;
    ibtCidade.Locate('Cid_Cod',Cod,[loCaseInsensitive]);
    if (ibtCidade.FieldByName('CID_COD').AsInteger = Cod) then
      Begin
        pnNomCid.Caption := ibtCidade.FieldByName('CID_NOM').AsString;
        pnSigEst.Caption := ibtCidade.FieldByName('EST_SIG').AsString;
      end
    else
      Begin
        MessageDlg('Cidade não Cadastrada', mtInformation, [mbOK],0);
        dbeCodCid.SetFocus;
        pnNomCid.Caption := '';
        pnSigEst.Caption := '';
      end;
  end;
end;

procedure TfrmFuncionario.bitSairClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (dbeNom.ReadOnly = True) then
     begin
      Close;
     end
    else
     if ibtFuncionario.State in [dsInsert, dsEdit] then
      begin
       if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
         ibtFuncionario.Cancel;
         Close;
        end;
      end;
   end;
end;

procedure TfrmFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  with dmSYS do
    Begin
      ibtFuncionario.Open;
      ibtCidade.Open;
      dsFuncionario.AutoEdit := True;
      dsCidade.AutoEdit := True;
      Situacao;   //Chamada da procedure para alterar Box de Situação
      Alter('I');  //Chamada da alterção dos DBEdits
      pgcPadraoCad.TabIndex := 0;
      cbFiltro.ItemIndex := -1;
      bitConsFunc.Enabled := True;
      bitConsCid.Enabled := False;
    end;
end;

procedure TfrmFuncionario.FormClose(Sender: TObject;      //Saida do Formulario
  var Action: TCloseAction);
begin
  inherited;
    with dmSYS do
    Begin
      ibtFuncionario.Close;
      ibtCidade.Close;
      dsFuncionario.AutoEdit := False;
      dsCidade.AutoEdit := False;
      Action := caFree;
    end;
end;

procedure TfrmFuncionario.bitIncluirClick(Sender: TObject);
var
  cont: integer;
begin
  inherited;
  with dmSYS do
   Begin
    if (ibqFuncionario.Active = True) then
      ibqFuncionario.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtFuncionario.Last;                                        //Linha 1
    cont:=1;                                                    //Linha 2
    cont:=cont+ibtFuncionario.FieldByName('FUN_COD').AsInteger; //Linha 3
    ibtFuncionario.Append;                          //Referece a inserção do codigo automatico na hora da inclusão Linhas 1,2,3
    Alter('A');    //Chamada da alterção dos DBEdits
    ibtFuncionario.FieldByName('FUN_COD').AsInteger := cont;  //Atribuindo o codigo ao campo referente as Linas 1,2,3
    dbeNom.SetFocus;
    ibtCidade.Close;
    dbcbSit.Checked := False;
    pnNomCid.Caption := '';
    pnSigEst.Caption := '';
    bitConsFunc.Enabled := False;
    bitConsCid.Enabled := True;
   end;
end;

procedure TfrmFuncionario.bitokClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtFuncionario.FieldByName('CID_COD').IsNull then
     begin
      Botoes('I');
      MessageDlg('Cidade em branco!', mtInformation, [mbOk], 0);
      dbeCodCid.SetFocus;
      Exit;
     end;                     //Validação de Codigo  da Cidade e Nome caso estejão em branco
    if ibtFuncionario.FieldByName('FUN_NOM').IsNull then
     begin
      Botoes('I');
      MessageDlg('Nome em branco!', mtInformation, [mbOk], 0);
      dbeNom.SetFocus;
      Exit;
     end;
    if (dbcbSit.Checked = True) then
     ibtFuncionario.FieldByName('FUN_SIT').AsString := 'I'
    else
      if (dbcbSit.Checked = False) then
        ibtFuncionario.FieldByName('FUN_SIT').AsString := 'A';
    ibtFuncionario.FieldByName('FUN_DTAADM').AsDateTime := dtpAdmissao.Date;
    ibtFuncionario.Post;
    Alter('I');   //Chamada da alterção dos DBEdits
    Situacao();   //Chamada da procedure para alterar Box de Situação
    bitConsFunc.Enabled := True;
    bitConsCid.Enabled := False;
   end;
  dmSYS.ibtSYS_DATABASE.CommitRetaining;
end;

procedure TfrmFuncionario.bitAlterarClick(Sender: TObject);
begin
  inherited;
  if  pgcPadraoCad.TabIndex = 1 then
   Begin
    dmSYS.ibtFuncionario.Locate('FUN_COD',ibqFuncionario.FieldByName('Codigo').Value,[loCaseInsensitive]);
    ibqFuncionario.Close;
    pgcPadraoCad.TabIndex := 0;
    Situacao(); //Chamada da procedure para alterar Box de Situação
   end;
  Alter('A');  //Chamada da alterção dos DBEdits
  dmSYS.ibtFuncionario.Edit;
  bitConsFunc.Enabled := False;
  bitConsCid.Enabled := True;
end;

procedure TfrmFuncionario.bitExcluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtFuncionario.Locate('FUN_COD',ibqFuncionario.FieldByName('Codigo').Value,[loCaseInsensitive]);
       end;
      if (ibtFuncionario.FieldByName('FUN_COD').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK], 0);
        Exit;
       end
      else
       begin
        ibtFuncionario.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          ibqFuncionario.Close;
          ibqFuncionario.Open;
         end;
       end;
     end;
   end;
  Situacao(); //Chamada da procedure para alterar Box de Situação
  Alter('I'); //Chamada da alterção dos DBEdits
end;

procedure TfrmFuncionario.bitCancelarClick(Sender: TObject);
begin
  inherited;
  dmSYS.ibtFuncionario.Cancel;
  Situacao();  //Chamada da procedure para alterar Box de Situação
  Alter('I');  //Chamada da alterção dos DBEdits
  bitConsFunc.Enabled := True;
  bitConsCid.Enabled := False;
end;

procedure TfrmFuncionario.bitConsFuncClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmFuncionario.tbsCadastroShow(Sender: TObject);
var cod:Integer;
begin
  inherited;
  cod:=0;
  dbnNavegacao.Enabled := True;
  if (ibqFuncionario.Active = True) then
   begin
    if not(ibqFuncionario.FieldByName('Codigo').IsNull) then
      cod := ibqFuncionario.FieldByName('Codigo').Value;
    if ( cod <> 0) then
     Begin
      ibqFuncionario.Close;
      dmSYS.ibtFuncionario.Locate('FUN_COD',cod,[loCaseInsensitive]);
      Situacao(); //Chamada da procedure para alterar Box de Situação
      Alter('I'); //Chamada da alterção dos DBEdits
     end;
   end;
  if (ibqFuncionario.Active = True) then
    ibqFuncionario.Close;
end;

procedure TfrmFuncionario.tbsConsultaShow(Sender: TObject);
begin
  inherited;
  Alter('I');
  dbnNavegacao.Enabled := False;
  edtBuscChange(tbsConsulta);
  ibqFuncionario.Open;
end;

procedure TfrmFuncionario.dbeCodCidChange(Sender: TObject);
begin
  inherited;
  if dbeCodCid.Text <> '' then
   begin
    LocCid(StrToInt(dbeCodCid.Text));
    if (uVariavel.chamada = 'C') then
     begin
      dmSYS.ibtFuncionario.FieldByName('CID_COD').AsInteger := StrToInt(dbeCodCid.Text);
     end;
   end
  else
    Begin
      pnNomCid.Caption := '';
      pnSigEst.Caption := '';
    end
end;

procedure TfrmFuncionario.cbFiltroChange(Sender: TObject);
begin
  inherited;
  if cbFiltro.ItemIndex = 1 then
    Begin
      mkeBusc.Enabled := True;
      mkeBusc.Visible := True;
      edtBusc.Enabled := False;
      edtBusc.Visible := False;
      edtBuscChange(cbFiltro);
    end                               //Alteração para utilização de mascara para telefone
  else
    Begin
      mkeBusc.Enabled := False;
      mkeBusc.Visible := False;
      edtBusc.Enabled := True;
      edtBusc.Visible := True;
    end;
end;

procedure TfrmFuncionario.bitConsCidClick(Sender: TObject);
begin
  inherited;
  if (dbeCodCid.ReadOnly = False) then
   begin
    uVariavel.chamada:= '3';
    Application.CreateForm(TfrmCidade,frmCidade);
    frmCidade.Show;
    frmCidade.pgcPadraoCad.TabIndex := 1;
    frmCidade.edtBusc.SetFocus;
   end;
end;

procedure TfrmFuncionario.dbecpfExit(Sender: TObject);
begin
  inherited;
  if dbecpf.Text <> '' then
   if (CPF(dbecpf.Text) = False) then
    Begin
      MessageDlg('CPF Invalido', mtInformation, [mbOK],0);
      dbecpf.SetFocus;
      Exit;
    end;
end;

procedure TfrmFuncionario.bitConsOKClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (uVariavel.chamada <> '0') then
     begin
      ibtFuncionario.Locate('FUN_COD',ibqFuncionario.FieldByName('Codigo').Value,[loCaseInsensitive]);
      case uVariavel.chamada of
       '1':Begin
            uVariavel.chamada := 'C';
            frmGridPedido.edtCodFun.Text := ibtFuncionario.FieldByName('FUN_COD').Value;
            uVariavel.chamada := '0';
            Close;
           end;
      end;
     end;
   end;
end;

procedure TfrmFuncionario.dbnNavegacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  Situacao(); //Chamada da procedure para alterar Box de Situação
  Alter('I'); //Chamada da alterção dos DBEdits
end;

procedure TfrmFuncionario.edtBuscChange(Sender: TObject);
Var AuxFone: String;
begin
   inherited;
   if (edtBusc.Text <> '') or (mkeBusc.Text <>'') then
    begin
      with dmSYS.ibtFuncionario do
      	begin
          ibqFuncionario.Close;
          ibqFuncionario.SQL.Clear;
          case cbFiltro.ItemIndex of
            -1:Begin
                ibqFuncionario.SQL.Add('Select FUN_COD as Codigo, FUN_NOM as Nome,');
                ibqFuncionario.SQL.Add('FUN_TEL as Telefone, FUN_END as Endereco,');
                ibqFuncionario.SQL.Add('FUN_FUNC as Funcao, FUN_DTAADM as Data_Admissao');
                ibqFuncionario.SQL.Add('From Funcionario ORDER BY FUN_COD');
               end;
            0:Begin
                ibqFuncionario.SQL.Add('Select FUN_NOM as Nome, FUN_TEL as Telefone, FUN_END as Endereco,');
                ibqFuncionario.SQL.Add('FUN_FUNC as Funcao, FUN_DTAADM as Data_Admissao,');
                ibqFuncionario.SQL.Add('FUN_COD as Codigo From Funcionario Where FUN_NOM');
                ibqFuncionario.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
              End;
            1:Begin
               if (Length(Trim(mkeBusc.Text)) = 9) then
                begin
                 AuxFone := Copy(mkeBusc.Text,0,8);
                 AuxFone := Trim(AuxFone);
                end
               else
                AuxFone := Trim(mkeBusc.Text);
               ibqFuncionario.SQL.Add('Select FUN_TEL as Telefone, FUN_NOM as Nome, FUN_END as Endereco,');
               ibqFuncionario.SQL.Add('FUN_FUNC as Funcao, FUN_DTAADM as Data_Admissao');
               ibqFuncionario.SQL.Add('FUN_COD as Codigo From Funcionario Where FUN_TEL');
               ibqFuncionario.SQL.Add('Like'+#39+Trim(AuxFone)+'%'+#39);
              End;
            2:Begin
               ibqFuncionario.SQL.Add('Select FUN_END as Endereco, FUN_NOM as Nome, FUN_TEL as Telefone,');
               ibqFuncionario.SQL.Add('FUN_FUNC as Funcao, FUN_DTAADM as Data_Admissao');
               ibqFuncionario.SQL.Add('FUN_COD as Codigo From Funcionario Where FUN_END');
               ibqFuncionario.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
              End;
            3:Begin
               ibqFuncionario.SQL.Add('Select FUN_COD as Codigo, FUN_NOM as Nome, FUN_TEL as Telefone,');
               ibqFuncionario.SQL.Add('FUN_END as Endereco, FUN_FUNC as Funcao,');
               ibqFuncionario.SQL.Add('FUN_DTAADM as Data_Admissao From Funcionario Where FUN_COD');
               ibqFuncionario.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
              End;
	        end;
        ibqFuncionario.Open;
      	end;
    end
end;

procedure TfrmFuncionario.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtFuncionario.State in [dsInsert, dsEdit] then
     if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      Begin
       AllowChange := True;
       ibtFuncionario.Cancel;
       Alter('I');
       pgcPadraoCad.TabIndex := 1;
       ibqFuncionario.Open;    //Ativar a Query para trazer todos os registros
      end
     else
      Begin
       AllowChange := False;
       if (ibqFuncionario.Active = True) then
         ibqFuncionario.Close;  //Desativar a Query
       Alter('A');
       pgcPadraoCad.TabIndex := 0;
      end;
   end;
end;

end.
