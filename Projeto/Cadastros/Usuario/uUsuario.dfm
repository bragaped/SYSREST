inherited frmUsuario: TfrmUsuario
  Left = 259
  Top = 235
  Caption = 'Cadastro de Usuario'
  ClientHeight = 250
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited bitok: TBitBtn
      OnClick = bitokClick
    end
    inherited bitIncluir: TBitBtn
      OnClick = bitIncluirClick
    end
    inherited bitAlterar: TBitBtn
      OnClick = bitAlterarClick
    end
    inherited bitCancelar: TBitBtn
      OnClick = bitCancelarClick
    end
    inherited bitExcluir: TBitBtn
      OnClick = bitExcluirClick
    end
    inherited dbnNavegacao: TDBNavigator
      DataSource = dmSYS.dsUsuario
      Hints.Strings = ()
      OnClick = dbnNavegacaoClick
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Height = 209
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object Label1: TLabel
        Left = 10
        Top = 45
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNome
      end
      object Label2: TLabel
        Left = 10
        Top = 84
        Width = 31
        Height = 13
        Caption = 'Senha'
      end
      object Label3: TLabel
        Left = 10
        Top = 123
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label5: TLabel
        Left = 160
        Top = 84
        Width = 75
        Height = 13
        Caption = 'Confirma Senha'
      end
      object Label4: TLabel
        Left = 10
        Top = 4
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbeCod
      end
      object dbeNome: TDBEdit
        Left = 10
        Top = 61
        Width = 108
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dmSYS.dsUsuario
        TabOrder = 0
      end
      object bitConsUser: TBitBtn
        Left = 130
        Top = 14
        Width = 32
        Height = 32
        TabOrder = 3
        OnClick = bitConsUserClick
        Glyph.Data = {
          B6040000424DB604000000000000B60000002800000020000000200000000100
          0800000000000004000000000000000000002000000000000000FFFFFF00CCCC
          CC00BBBBBB00AAAAAA00CC999900888888007777770099666600666666005555
          5500444444006633330033333300222222001111110000000000C0C0C0000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000101010101010
          1010101010101010101010101010101010101010101010101010101010101010
          10100F0F0F0F0F0F0F0F0F060606101010101010101010101010101010101010
          0F0F0101010100040004040F0F0F060606101010101010101010101010100F0F
          01010101010100040004040404040F0F060610101010101010101010100F0404
          010101010101000400040404040404040F06061010101010101010100F040404
          01010101010100040004040404040404040C0606101010101010100F04040404
          01010F0F0F0F0F0F0F0F0F0404040404040906060610101010100F0404040404
          0F0F0000000000000000000F0F0F040404040F060610101010100F04040B0F05
          00020F060606060606060500000006050B040F060606101010100F040F000000
          0F0A0404040404040404040F0F0F0000000B0F060606061010100F0F0000000F
          04040404040404040404040404040F0000050F060606061010100F0000000F07
          0404040404040404000000040404040F00000F060606061010100F00000F0404
          070404040404040404040400040407040F000F060606101010100F00000F0404
          040701040404040404040400070704040F000F060606101010100F00000F0404
          040400010707070707070707040404040F000F060610101010100F0000000F04
          0404010404040404040404040403040F00000F06101010101010100F0000000F
          04040404040404040404040404040F00000F101010101010101010100F000000
          0F0F040404040404040404040F0F0000000F10101010101010101010100F0000
          00000F0F0F0F0F0F0F0F0F0F000000000F061010101010101010101010100F0F
          00000000000000000000000000000F0F050C0610101010101010101010101010
          0F0F000000000000000000000F0F0202020F0F06101010101010101010101010
          10100F0F0F0F0F0F0F0F0F0F0200000202080F0F061010101010101010101010
          1010101010101010101010100F020000020F0F0F0F0610101010101010101010
          10101010101010101010101010050F0E0C0E0F0F0F0F06021010101010101010
          1010101010101010101010101010100F0D0A0F0F0F0F0F061010101010101010
          101010101010101010101010101010100F090D0F0F0F0F0F1010101010101010
          10101010101010101010101010101010100F060D0F0F0F0F1010101010101010
          1010101010101010101010101010101010050D060D0F0F0F1010101010101010
          1010101010101010101010101010101010100F0D060D0F0F1010101010101010
          101010101010101010101010101010101010100F0F0F0F101010101010101010
          1010101010101010101010101010101010101010101010101010101010101010
          1010101010101010101010101010101010101010101010101010}
      end
      object edtConfSenha: TEdit
        Left = 160
        Top = 100
        Width = 134
        Height = 21
        PasswordChar = '*'
        TabOrder = 2
        OnExit = edtSenhaExit
      end
      object edtSenha: TEdit
        Left = 10
        Top = 100
        Width = 134
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtSenhaExit
      end
      object dbeCod: TDBEdit
        Left = 10
        Top = 20
        Width = 108
        Height = 21
        DataField = 'USE_COD'
        DataSource = dmSYS.dsUsuario
        ReadOnly = True
        TabOrder = 4
      end
      object dbeDesc: TDBMemo
        Left = 10
        Top = 137
        Width = 391
        Height = 41
        DataField = 'USE_DESC'
        DataSource = dmSYS.dsUsuario
        TabOrder = 5
      end
    end
    inherited tbsConsulta: TTabSheet
      OnShow = tbsConsultaShow
      inherited dbgCons: TDBGrid
        Height = 181
        DataSource = dsConsulta
      end
    end
  end
  object ibqUsuario: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select USE_COD, NOME, USE_DESC from USUARIO ORDER BY NOME')
    Left = 244
    Top = 57
    object ibqUsuarioUSE_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USE_COD'
      Origin = 'USUARIO.USE_COD'
      Required = True
    end
    object ibqUsuarioNOME: TIBStringField
      DisplayLabel = 'Usuario'
      FieldName = 'NOME'
      Origin = 'USUARIO.NOME'
      Required = True
      Size = 15
    end
    object ibqUsuarioUSE_DESC: TBlobField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'USE_DESC'
      Origin = 'USUARIO.USE_DESC'
      OnGetText = ibqUsuarioUSE_DESCGetText
      Size = 50
    end
  end
  object dsConsulta: TDataSource
    DataSet = ibqUsuario
    Left = 308
    Top = 57
  end
end
