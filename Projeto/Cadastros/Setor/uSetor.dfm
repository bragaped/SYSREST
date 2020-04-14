inherited frmSetor: TfrmSetor
  Left = 271
  Top = 289
  Caption = 'Cadastro de Setor'
  ClientHeight = 215
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
      DataSource = dmSYS.dsSetor
      Hints.Strings = ()
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Height = 174
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object lbCod: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbeCod
      end
      object lbNome: TLabel
        Left = 8
        Top = 52
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNome
      end
      object lbDesc: TLabel
        Left = 8
        Top = 97
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDesc
      end
      object dbeCod: TDBEdit
        Left = 8
        Top = 24
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SET_COD'
        DataSource = dmSYS.dsSetor
        ReadOnly = True
        TabOrder = 0
      end
      object dbeNome: TDBEdit
        Left = 8
        Top = 68
        Width = 264
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SET_NOM'
        DataSource = dmSYS.dsSetor
        TabOrder = 1
      end
      object dbeDesc: TDBEdit
        Left = 8
        Top = 113
        Width = 264
        Height = 21
        DataField = 'SET_DESC'
        DataSource = dmSYS.dsSetor
        TabOrder = 2
      end
      object bitConsSetor: TBitBtn
        Left = 151
        Top = 18
        Width = 32
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = bitConsSetorClick
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
    end
    inherited tbsConsulta: TTabSheet
      OnShow = tbsConsultaShow
      inherited dbgCons: TDBGrid
        Height = 146
        DataSource = dsConsulta
        OnDblClick = DBGrid1DblClick
      end
    end
  end
  object ibqSetor: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select SET_COD, SET_NOM,  SET_DESC from SETOR ORDER BY SET_COD')
    Left = 484
    Top = 65
    object ibqSetorSET_COD: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'SET_COD'
      Origin = 'SETOR.SET_COD'
      Required = True
    end
    object ibqSetorSET_NOM: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'SET_NOM'
      Origin = 'SETOR.SET_NOM'
    end
    object ibqSetorSET_DESC: TIBStringField
      DisplayLabel = 'Descricao'
      FieldName = 'SET_DESC'
      Origin = 'SETOR.SET_DESC'
    end
  end
  object dsConsulta: TDataSource
    DataSet = ibqSetor
    Left = 516
    Top = 65
  end
end
