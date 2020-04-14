unit uFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, upadraocad, DB, IBCustomDataSet, IBTable, StdCtrls, DBCtrls,
  ExtCtrls, Mask, Buttons, Grids, DBGrids, ComCtrls, ToolWin, IBQuery;

type
  TfrmFornecedor = class(TfrmPadraoCadastro)
    Label16: TLabel;
    cbFiltro: TComboBox;
    edtBusc: TEdit;
    Label1: TLabel;
    dbeCod: TDBEdit;
    lbFantasia: TLabel;
    dbeNomFant: TDBEdit;
    rgTipo: TDBRadioGroup;
    lbCPFCNPJ: TLabel;
    dbeCPFCNPJ: TDBEdit;
    lbRGIE: TLabel;
    dbeRGIE: TDBEdit;
    Label5: TLabel;
    dbeEnd: TDBEdit;
    Label6: TLabel;
    dbeBai: TDBEdit;
    Label7: TLabel;
    dbeCEP: TDBEdit;
    grbCidade: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbeCodCid: TDBEdit;
    bitConsCid: TBitBtn;
    Label8: TLabel;
    dbeEmail: TDBEdit;
    Label9: TLabel;
    dbeTel: TDBEdit;
    dbmObs: TDBMemo;
    Label13: TLabel;
    bitConsFor: TBitBtn;
    dsConsulta: TDataSource;
    ibqFornecedor: TIBQuery;
    mkeBusc: TMaskEdit;
    Label17: TLabel;
    dbeRazSoc: TDBEdit;
    lbRazao: TLabel;
    bitConsOK: TBitBtn;
    dbcbSit: TDBCheckBox;
    pnNomCid: TPanel;
    pnSigEst: TPanel;
    procedure Alter(sit:Char);
    procedure LocCid(Cod: Integer);
    procedure Situacao();
    procedure Tipo();
    procedure bitSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure bitConsForClick(Sender: TObject);
    procedure bitIncluirClick(Sender: TObject);
    procedure bitokClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure bitExcluirClick(Sender: TObject);
    procedure edtBuscChange(Sender: TObject);
    procedure dbeCodCidChange(Sender: TObject);
    procedure bitAlterarClick(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure dbeCPFCNPJExit(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure bitConsCidClick(Sender: TObject);
    procedure bitConsOKClick(Sender: TObject);
    procedure dbnNavegacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure pgcPadraoCadChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedor: TfrmFornecedor;

implementation

uses udmSYS, Math, StrUtils, uCidade, uVariavel, uCompra, uContas_Pagar;

{$R *.dfm}

procedure TfrmFornecedor.Tipo(); //Verificação se o Fornecedor é (FISICA ou JURIDICA)
 procedure alteravalor(CPFCNPJ,RGIE,CAMPO,MASK,LB: String; TF: Boolean) ;
  begin
   with dmSYS do
    begin
     lbCPFCNPJ.Caption := CPFCNPJ;
     lbRGIE.Caption := RGIE;
     if ibtFornecedor.State in [dsInsert, dsEdit] then
      ibtFornecedor.FieldByName(CAMPO).Clear;
     ibtFornecedor.FieldByName(CAMPO).EditMask := MASK;
     dbeNomFant.Visible := TF;
     lbFantasia.Visible := TF;
     lbRazao.Caption := LB;
    end;
  end;
begin
  Begin
   if rgTipo.ItemIndex = 0 then
    Begin
     alteravalor('CPF','RG','FOR_CNPJCPF','999.999.999-99;1; ','Nome',False);
     dbeNomFant.Clear;
    End
   else
    if rgTipo.ItemIndex = 1 then
     alteravalor('CNPJ','IE','FOR_CNPJCPF','99.999.999/9999-99;1; ','Razao Social',True);
  end;
end;

procedure TfrmFornecedor.Situacao(); //Verificação se o Fornecedor está ATIVO ou INATIVO
Begin
  with dmSYS do
    Begin
      if (ibtFornecedor.FieldByName('FOR_SIT').AsString ='I') then
        dbcbSit.Checked := True
      else
        if (ibtFornecedor.FieldByName('FOR_SIT').AsString ='A') then
          dbcbSit.Checked := False;
    end;
end;

procedure TfrmFornecedor.Alter(sit: Char);  //Ateração dos estatus dos DBEdits para modo de edição ( SIM ou NÃO )
 procedure alteravalor(TF:Boolean);
  begin
   dbeRazSoc.ReadOnly := TF;
   dbeNomFant.ReadOnly := TF;
   dbeCPFCNPJ.ReadOnly := TF;
   dbeRGIE.ReadOnly := TF;
   dbeEnd.ReadOnly := TF;
   dbeBai.ReadOnly := TF;
   dbeCEP.ReadOnly := TF;
   dbeCodCid.ReadOnly := TF;
   dbeEmail.ReadOnly := TF;
   dbeTel.ReadOnly := TF;
   dbmObs.ReadOnly := TF;
   rgTipo.ReadOnly := TF;
  end;
begin
 if (sit = 'I') then   //Permição de Altração negada
  Begin
   alteravalor(True);
   Botoes('O'); //chamada da Ativação dos Botões
  end;
 if (sit = 'A') then     //Permição de Altração Autorizada
  Begin
   alteravalor(False);
   Botoes('I'); //chamada da Ativação dos Botões
  end;
end;

procedure TfrmFornecedor.LocCid(Cod: Integer);
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

procedure TfrmFornecedor.bitSairClick(Sender: TObject); //Botão Sair
begin
  inherited;
  with dmSYS do
   Begin
    if ibtFornecedor.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Você deseja realmente sair do Cadastro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        ibtFornecedor.Cancel;
        Close;
       end;
     end
    else
     Close;
   end;
end;

procedure TfrmFornecedor.FormClose(Sender: TObject;  //Saida do Formulario
  var Action: TCloseAction);
begin
  inherited;
  with dmSYS do
    Begin
      ibtCidade.Close;
      ibtFornecedor.Close;
      dsFornecedor.AutoEdit := False;
      dsCidade.AutoEdit := False;
      Action := caFree;
    end;
end;

procedure TfrmFornecedor.FormCreate(Sender: TObject);  //Criação do Formulario
begin
  inherited;
  with dmSYS do
   Begin
    ibtFornecedor.Open;
    ibtCidade.Open;
    dsFornecedor.AutoEdit := True;
    dsCidade.AutoEdit := True;
    Tipo;       //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
    Situacao;   //Chamada da procedure para alterar Box de Situação
    Alter('I');  //Chamada da alterção dos DBEdits
    pgcPadraoCad.TabIndex := 0;
    cbFiltro.ItemIndex := -1;
    bitConsFor.Enabled := True;
    bitConsCid.Enabled := False;
   end;
end;

procedure TfrmFornecedor.rgTipoClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtFornecedor.State in [dsInsert, dsEdit] then
     ibtFornecedor.FieldByName('FOR_TIP').AsInteger := rgTipo.ItemIndex;
    Tipo();  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
   end;
end;

procedure TfrmFornecedor.bitConsForClick(Sender: TObject);
begin
  inherited;
  pgcPadraoCad.TabIndex := 1;
end;

procedure TfrmFornecedor.bitIncluirClick(Sender: TObject);
var cont:Integer;
begin
  inherited;
  with dmSYS do
   Begin
    ibqFornecedor.Close;
    pgcPadraoCad.TabIndex := 0;
    ibtFornecedor.Last;                                          //Linha 1
    cont:=1;                                                     //Linha 2
    cont:=cont+ibtFornecedor.FieldByName('For_Cod').AsInteger;   //Linha 3
    ibtFornecedor.Append;                          //Referece a inserção do codigo automatico na hora da inclusão Linhas 1,2,3
    Alter('A');  //Chamada da alterção dos DBEdits
    dbcbSit.Checked := False;
    rgTipo.ItemIndex := 1;
    ibtFornecedor.FieldByName('For_Cod').AsInteger := cont;    //Atribuindo o codigo ao campo referente as Linas 1,2,3
    dbeRazSoc.SetFocus;
    ibtCidade.Close;
    pnNomCid.Caption := '';
    pnSigEst.Caption := '';
    bitConsFor.Enabled := False;
    bitConsCid.Enabled := True;
   end;
end;

procedure TfrmFornecedor.bitokClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if ibtFornecedor.FieldByName('CID_COD').IsNull then
     begin
      Botoes('I');
      MessageDlg('Cidade em branco!', mtInformation, [mbOk], 0);
      dbeCodCid.SetFocus;
      Exit;
     end
    else                            //Validação do Codigo da Cidade e Nome caso estejão em branco
    if ibtFornecedor.FieldByName('FOR_RAZ_SOC').IsNull then
     if rgTipo.ItemIndex = 1 then
      Begin
       Botoes('I');
       MessageDlg('Razão Social em branco', mtConfirmation, [mbOK],0);
       dbeRazSoc.SetFocus;
       Exit;
      end
     else
      Begin
       Botoes('I');
       MessageDlg('Nome em branco', mtConfirmation, [mbOK],0);
       dbeRazSoc.SetFocus;
       Exit;
      end;
    if (dbcbSit.Checked = True) then
     ibtFornecedor.FieldByName('FOR_SIT').AsString := 'I'
    else
     if (dbcbSit.Checked = False) then
      ibtFornecedor.FieldByName('FOR_SIT').AsString := 'A';
    ibtFornecedor.Post;
    Alter('I');  //Chamada da alterção dos DBEdits
    Situacao();   //Chamada da procedure para alterar Box de Situação
    bitConsFor.Enabled := True;
    bitConsCid.Enabled := False;
   end;
  dmSYS.ibtSYS_DATABASE.CommitRetaining;
end;

procedure TfrmFornecedor.bitAlterarClick(Sender: TObject);
begin
  inherited;
  if  pgcPadraoCad.TabIndex = 1 then
   Begin
    dmSYS.ibtFornecedor.Locate('FOR_COD',ibqFornecedor.FieldByName('Codigo').Value,[loCaseInsensitive]);
    ibqFornecedor.Close;
    pgcPadraoCad.TabIndex := 0;
    Tipo;  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
    Situacao; //Chamada da procedure para alterar Box de Situação
   end;
  Alter('A');  //Chamada da alterção dos DBEdits
  dmSYS.ibtFornecedor.Edit;
  bitConsFor.Enabled := False;
  bitConsCid.Enabled := True;
end;

procedure TfrmFornecedor.bitCancelarClick(Sender: TObject);
begin
  inherited;
  dmSYS.ibtFornecedor.Cancel;
  Tipo();  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
  Situacao();  //Chamada da procedure para alterar Box de Situação
  Alter('I');  //Chamada da alterção dos DBEdits
  bitConsFor.Enabled := True;
  bitConsCid.Enabled := False;
end;

procedure TfrmFornecedor.bitExcluirClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      if (pgcPadraoCad.TabIndex = 1) then
       begin
        ibtFornecedor.Locate('FOR_COD',ibqFornecedor.FieldByName('Codigo').Value,[loCaseInsensitive]);
       end;
      if (ibtFornecedor.FieldByName('FOR_COD').AsInteger = 0) then
       begin
        MessageDlg('Nenhum registro selecionado!', mtInformation, [mbOK],0);
        Exit;
       end
      else
        ibtFornecedor.Delete;
        if (pgcPadraoCad.TabIndex = 1) then
         begin
          ibqFornecedor.Close;
          ibqFornecedor.Open;
         end;
     end;
   end;
  Tipo();  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
  Situacao(); //Chamada da procedure para alterar Box de Situação
  Alter('I'); //Chamada da alterção dos DBEdits
end;

procedure TfrmFornecedor.edtBuscChange(Sender: TObject);
var AuxFone: String;
begin
  inherited;
  if (edtBusc.Text <> '') or (mkeBusc.Text <>'') then
    begin
     with dmSYS.ibtFornecedor do
      begin
       ibqFornecedor.Close;
       ibqFornecedor.SQL.Clear;
       case cbFiltro.ItemIndex of
       -1:Begin
           ibqFornecedor.SQL.Add('select FOR_COD as Codigo, FOR_RAZ_SOC as Razao_Social, FOR_NOM_FANT as Nome_Fantasia,');
           ibqFornecedor.SQL.Add(' FOR_CNPJCPF as CNPJ_CPF, FOR_TEL as Telefone, FOR_EMAIL as EMAIL,');
           ibqFornecedor.SQL.Add('FOR_END as Endereco From FORNECEDOR ORDER BY FOR_COD');
          end;
        0:Begin
           ibqFornecedor.SQL.Add('Select FOR_RAZ_SOC as Razao_Social, FOR_NOM_FANT as Nome_Fantasia,');
           ibqFornecedor.SQL.Add('FOR_CNPJCPF as CNPJ_CPF, FOR_TEL as Telefone, FOR_EMAIL as EMAIL,');
           ibqFornecedor.SQL.Add('FOR_END as Endereco, FOR_COD as Codigo From FORNECEDOR where FOR_RAZ_SOC');
           ibqFornecedor.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
          End;
        1:Begin
           ibqFornecedor.SQL.Add('Select FOR_NOM_FANT as Nome_Fantasia, FOR_RAZ_SOC as Razao_Social,');
           ibqFornecedor.SQL.Add('FOR_CNPJCPF as CNPJ_CPF, FOR_TEL as Telefone, FOR_EMAIL as EMAIL,');
           ibqFornecedor.SQL.Add('FOR_END as Endereco, FOR_COD as Codigo From FORNECEDOR where FOR_NOM_FANT');
           ibqFornecedor.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
          End;
        2:Begin
           ibqFornecedor.SQL.Add('Select FOR_CNPJCPF as CNPJ_CPF, FOR_RAZ_SOC as Razao_Social,');
           ibqFornecedor.SQL.Add('FOR_NOM_FANT as Nome_Fantasia, FOR_TEL as Telefone, FOR_EMAIL as EMAIL,');
           ibqFornecedor.SQL.Add('FOR_END as Endereco, FOR_COD as Codigo From FORNECEDOR where FOR_CNPJCPF');
           ibqFornecedor.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
          End;
        3:Begin
           if (Length(Trim(mkeBusc.Text)) = 9) then
            begin
             AuxFone := Copy(mkeBusc.Text,0,8);
             AuxFone := Trim(AuxFone);
            end
           else
            AuxFone := Trim(mkeBusc.Text);
           ibqFornecedor.SQL.Add('Select FOR_TEL as Telefone, FOR_RAZ_SOC as Razao_Social,');
           ibqFornecedor.SQL.Add('FOR_NOM_FANT as Nome_Fantasia, FOR_CNPJCPF as CNPJ_CPF, FOR_EMAIL as EMAIL,');
           ibqFornecedor.SQL.Add('FOR_END as Endereco, FOR_COD as Codigo From FORNECEDOR where FOR_TEL ');
           ibqFornecedor.SQL.Add('Like'+#39+Trim(AuxFone)+'%'+#39);
          End;
        4:Begin
           ibqFornecedor.SQL.Add('Select FOR_END as Endereco, FOR_RAZ_SOC as Razao_Social,');
           ibqFornecedor.SQL.Add('FOR_NOM_FANT as Nome_Fantasia, FOR_CNPJCPF as CNPJ_CPF, FOR_TEL as Telefone,');
           ibqFornecedor.SQL.Add('FOR_EMAIL as EMAIL, FOR_COD as Codigo From FORNECEDOR where FOR_END ');
           ibqFornecedor.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
          End;
        5:Begin
           ibqFornecedor.SQL.Add('Select FOR_EMAIL as EMAIL, FOR_RAZ_SOC as Razao_Social,');
           ibqFornecedor.SQL.Add('FOR_NOM_FANT as Nome_Fantasia, FOR_CNPJCPF as CNPJ_CPF, FOR_TEL as Telefone,');
           ibqFornecedor.SQL.Add('FOR_END as Endereco, FOR_COD as Codigo From FORNECEDOR where FOR_EMAIL ');
           ibqFornecedor.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
          End;
        6:Begin
           ibqFornecedor.SQL.Add('Select FOR_COD as Codigo, FOR_RAZ_SOC as Razao_Social,');
           ibqFornecedor.SQL.Add('FOR_NOM_FANT as Nome_Fantasia, FOR_CNPJCPF as CNPJ_CPF, FOR_TEL as Telefone,');
           ibqFornecedor.SQL.Add('FOR_EMAIL as EMAIL, FOR_END as Endereco From FORNECEDOR where FOR_COD ');
           ibqFornecedor.SQL.Add('Like'+#39+Trim(edtBusc.Text)+'%'+#39);
          End;
       end;
       ibqFornecedor.Open;
      end;
    end
end;

procedure TfrmFornecedor.dbeCodCidChange(Sender: TObject);
begin
  inherited;
  if dbeCodCid.Text <> '' then
   begin
    LocCid(StrToInt(dbeCodCid.Text));
    if (uVariavel.chamada = 'C') then
     begin
      dmSYS.ibtFornecedor.FieldByName('CID_COD').AsInteger := StrToInt(dbeCodCid.Text);
     end;
   end
  else
    Begin
      pnNomCid.Caption := '';
      pnSigEst.Caption := '';
    end
end;

procedure TfrmFornecedor.cbFiltroChange(Sender: TObject);
begin
  inherited;
  if cbFiltro.ItemIndex = 3 then
    Begin
      mkeBusc.Enabled := True;
      mkeBusc.Visible := True;
      edtBusc.Enabled := False;
      edtBusc.Visible := False;
      edtBuscChange(cbFiltro);
    end                                     //Alteração para utilização de mascara para telefone
  else
    Begin
      mkeBusc.Enabled := False;
      mkeBusc.Visible := False;
      edtBusc.Enabled := True;
      edtBusc.Visible := True;
      edtBusc.Clear;
    end;
end;

procedure TfrmFornecedor.tbsConsultaShow(Sender: TObject); //Ativação da Aba Consulta
begin
  inherited;
  Alter('I');
  dbnNavegacao.Enabled := False;
  cbFiltroChange(tbsConsulta);
  edtBuscChange(tbsConsulta);
  ibqFornecedor.Open;     //Ativação da Query para trazer todos os registros
end;

procedure TfrmFornecedor.dbeCPFCNPJExit(Sender: TObject);
begin
  inherited;
  if rgTipo.ItemIndex = 0 then
   begin
    if dbeCPFCNPJ.Text <> '' then
     if (CPF(dbeCPFCNPJ.Text) = False) then
      Begin
        MessageDlg('CPF Invalido', mtInformation, [mbOK],0);
        dbeCPFCNPJ.SetFocus;
      end;
   end;
  if rgTipo.ItemIndex = 1 then
   if dbecpfcnpj.Text <> '' then
    if (CNPJ(dbecpfcnpj.Text) = False) then
      Begin
        MessageDlg('CNPJ Invalido', mtInformation, [mbOK],0);
        dbecpfcnpj.SetFocus;
      end;
end;

procedure TfrmFornecedor.tbsCadastroShow(Sender: TObject);
var cod:Integer;
begin
  inherited;
  cod:=0;
  if (dbnNavegacao.Enabled = False) then
   dbnNavegacao.Enabled := True;
  if (ibqFornecedor.Active = True) then
   begin
    if not(ibqFornecedor.FieldByName('Codigo').IsNull) then
     cod := ibqFornecedor.FieldByName('Codigo').Value;
    if ( cod <> 0) then
     Begin
      ibqFornecedor.Close;
      dmSYS.ibtFornecedor.Locate('FOR_COD',cod,[loCaseInsensitive]);
      Tipo();  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
      Situacao(); //Chamada da procedure para alterar Box de Situação
      Alter('I'); //Chamada da alterção dos DBEdits
     end;
   end;
   if (ibqFornecedor.Active = True) then
    ibqFornecedor.Close;
end;

procedure TfrmFornecedor.bitConsCidClick(Sender: TObject);
begin
  inherited;
  if (dbeCodCid.ReadOnly = False) then
   begin
    uVariavel.chamada:= '2';
    Application.CreateForm(TfrmCidade,frmCidade);
    frmCidade.Show;
    frmCidade.pgcPadraoCad.TabIndex := 1;
    frmCidade.edtBusc.SetFocus;
   end;
end;

procedure TfrmFornecedor.bitConsOKClick(Sender: TObject);
begin
  inherited;
  with dmSYS do
   Begin
    if (uVariavel.chamada <> '0') then
     begin
      ibtFornecedor.Locate('FOR_COD',ibqFornecedor.FieldByName('Codigo').Value,[loCaseInsensitive]);
      case uVariavel.chamada of
       '1':Begin
            uVariavel.chamada := 'C';
            frmCompra.dbeCodFor.Text := ibtFornecedor.FieldByName('FOR_COD').Value;
            uVariavel.chamada := '0';
            Close;
           End;
       '2':Begin
            uVariavel.chamada := 'C';
            frmContas_Pagar.dbeCodFor.Text := ibtFornecedor.FieldByName('FOR_COD').Value;
            uVariavel.chamada := '0';
            Close;
           End;
      end;
     end;
   end;
end;

procedure TfrmFornecedor.dbnNavegacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  Tipo();  //Chamada da procedure para alterar o Label (FISICA ou JURIDICA)
  Situacao(); //Chamada da procedure para alterar Box de Situação
  Alter('I'); //Chamada da alterção dos DBEdits
end;

procedure TfrmFornecedor.pgcPadraoCadChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  with dmSYS do
   if ibtFornecedor.State in [dsInsert, dsEdit] then
     begin
      if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
       Begin
        AllowChange := True;
        ibtFornecedor.Cancel;
        ibqFornecedor.Open;    //Ativar a Query para trazer todos os registros
        Alter('I');
        pgcPadraoCad.TabIndex := 1;
       end
      else
       begin
        AllowChange := False;
        ibqFornecedor.Close;  //Desativar a Query
        Alter('A');
        pgcPadraoCad.TabIndex := 0;
       end;
     end
    else
end;

end.
