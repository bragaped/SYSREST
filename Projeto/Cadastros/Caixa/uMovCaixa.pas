unit uMovCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TfrmMov_Caixa = class(TForm)
    edtValor: TEdit;
    Label2: TLabel;
    bitOK: TBitBtn;
    bitSair: TBitBtn;
    mObs: TMemo;
    Label4: TLabel;
    rgTipo: TRadioGroup;
    rgOperacao: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bitOKClick(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMov_Caixa: TfrmMov_Caixa;

implementation

uses udmSYS, uVariavel,DB;

{$R *.dfm}

procedure TfrmMov_Caixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmSYS.ibtCaixa.Close;
  Action := caFree;
end;

procedure TfrmMov_Caixa.bitSairClick(Sender: TObject);
begin
 close;
 dmSYS.ibtMov_Caixa.Close;
 dmSYS.dsMov_Caixa.AutoEdit := False;
end;

procedure TfrmMov_Caixa.FormCreate(Sender: TObject);
begin
 Height := 218;
 Width := 326;
 dmSYS.ibtMov_Caixa.Open;
 dmSYS.dsMov_Caixa.AutoEdit := True;
 dmSYS.ibtMov_Caixa.Append;
end;

procedure TfrmMov_Caixa.bitOKClick(Sender: TObject);
begin
 if MessageDlg('Confirma a Operação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
   dmSYS.ibtMov_Caixa.FieldByName('USE_COD').Value := uVariavel.codUser;
   dmSYS.ibtMov_Caixa.FieldByName('MOV_VAL').AsFloat := StrToFloat(edtValor.Text);
   dmSYS.ibtMov_Caixa.FieldByName('MOV_MOT').Value := mObs.Text;
   // Verificar o Operação que Sera Realizada
   IF rgOperacao.ItemIndex = 0 then
    dmSYS.ibtMov_Caixa.FieldByName('MOV_TIP').Value := 'E'
   else
    IF rgOperacao.ItemIndex = 1 then
     dmSYS.ibtMov_Caixa.FieldByName('MOV_TIP').Value := 'S';

   // Verificar se é Dinheiro ou Cheque
   if rgTipo.ItemIndex = 0 then
    begin
     dmSYS.ibtMov_Caixa.FieldByName('MOV_TIP_VAL').Value := 'DIN';
     if (rgOperacao.ItemIndex = 1) then
      begin
       if (dmSYS.ibtMov_Caixa.FieldByName('MOV_VAL').Value >
              dmSYS.ibtCaixa.FieldByName('CAI_VALDIN').AsFloat) then
        begin
         MessageDlg('Valor Maior que o Disponivel em Caixa'+#13+
                  'A Operação sera Cancelada',mtWarning,[mbOK],0);
         edtValor.SelectAll;
         edtValor.SetFocus;
         Exit;
        end;
      end;
    end
   else
    if rgTipo.ItemIndex = 1 then
     begin
      dmSYS.ibtMov_Caixa.FieldByName('MOV_TIP_VAL').Value := 'CHE';
      if (rgOperacao.ItemIndex = 1) then
       begin
        if (dmSYS.ibtMov_Caixa.FieldByName('MOV_VAL').Value >
             dmSYS.ibtCaixa.FieldByName('CAI_VALCHE').AsFloat) then
         begin
          MessageDlg('Valor Maior que o Disponivel em Caixa'+#13+
                  'A Operação sera Cancelada',mtWarning,[mbOK],0);
          edtValor.SelectAll;
          edtValor.SetFocus;
          Exit;
         end;
       end;
     end;

   if (dmSYS.ibtMov_Caixa.State in [dsInsert, dsEdit]) then
    begin
     dmSYS.ibtMov_Caixa.Post;
     dmSYS.ibtSYS_DATABASE.CommitRetaining;
     ShowMessage('Operação Realizada Com Sucesso!');
     Close;
    end;
  end
 else
  begin
   edtValor.SelectAll;
   edtValor.SetFocus;
   Exit;
  end;
end;

procedure TfrmMov_Caixa.edtValorChange(Sender: TObject);
begin
 if (Length(edtValor.Text) <> 0) then
  begin
   if (StrToFloat(edtValor.Text) > 0) then
    bitOK.Enabled := True
   else
    bitOK.Enabled := False;
  end
 else
  begin
   bitOK.Enabled := False;
  end;
end;

procedure TfrmMov_Caixa.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
 if not(key in ['0'..'9', ',', #8]) then
  begin
   Beep;
   key := #0;
  end;
end;

procedure TfrmMov_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
  Begin
   Perform(WM_NEXTDLGCTL, 0, 0);
   Key := #0;
  End;
 if Key = #27 then
  Perform(WM_NEXTDLGCTL, 1, 0);
end;

end.
