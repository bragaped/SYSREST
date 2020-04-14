inherited frmCod_Fiscal: TfrmCod_Fiscal
  Left = 257
  Top = 266
  Caption = 'Cadastro de C'#243'digo Fiscal'
  ClientHeight = 284
  ClientWidth = 554
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 554
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
      DataSource = dmSYS.dsCod_Fiscal
      Hints.Strings = ()
      OnClick = dbnNavegacaoClick
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Width = 554
    Height = 243
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      object Label1: TLabel
        Left = 2
        Top = 3
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 145
        Top = 3
        Width = 63
        Height = 13
        Caption = 'C'#243'd. Cont'#225'bil'
      end
      object Label3: TLabel
        Left = 220
        Top = 20
        Width = 37
        Height = 13
        Caption = 'C.F.O.P'
      end
      object Label4: TLabel
        Left = 2
        Top = 40
        Width = 87
        Height = 13
        Caption = 'Natureza da Oper.'
      end
      object Label5: TLabel
        Left = 2
        Top = 81
        Width = 100
        Height = 13
        Caption = 'Descri'#231#227'o Detalhada'
      end
      object Label6: TLabel
        Left = 392
        Top = 95
        Width = 37
        Height = 13
        Caption = 'Tipo IPI'
      end
      object Label7: TLabel
        Left = 392
        Top = 133
        Width = 43
        Height = 13
        Caption = 'Tipo ICM'
      end
      object Label8: TLabel
        Left = 242
        Top = 169
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object dbeCodigo: TDBEdit
        Left = 2
        Top = 17
        Width = 95
        Height = 21
        DataField = 'FISC_COD'
        DataSource = dmSYS.dsCod_Fiscal
        ReadOnly = True
        TabOrder = 0
      end
      object dbeCodContabil: TDBEdit
        Left = 144
        Top = 17
        Width = 69
        Height = 21
        DataField = 'FISC_CODCONTABIL'
        DataSource = dmSYS.dsCod_Fiscal
        TabOrder = 1
      end
      object dbeCFOP1: TDBEdit
        Left = 262
        Top = 17
        Width = 60
        Height = 21
        DataField = 'CFOP1'
        DataSource = dmSYS.dsCod_Fiscal
        TabOrder = 2
        OnExit = dbeCFOP1Exit
      end
      object dbeCFOP3: TDBEdit
        Left = 392
        Top = 17
        Width = 60
        Height = 21
        DataField = 'CFOP3'
        DataSource = dmSYS.dsCod_Fiscal
        TabOrder = 4
      end
      object dbeCFOP2: TDBEdit
        Left = 327
        Top = 17
        Width = 60
        Height = 21
        DataField = 'CFOP2'
        DataSource = dmSYS.dsCod_Fiscal
        TabOrder = 3
      end
      object dbeNatOper: TDBEdit
        Left = 2
        Top = 56
        Width = 385
        Height = 21
        DataField = 'FISC_NATOPR'
        DataSource = dmSYS.dsCod_Fiscal
        TabOrder = 5
        OnExit = dbeNatOperExit
      end
      object dbeDesc: TDBMemo
        Left = 2
        Top = 96
        Width = 385
        Height = 73
        DataField = 'FISC_DESC'
        DataSource = dmSYS.dsCod_Fiscal
        TabOrder = 6
      end
      object dbcbTipoIPI: TDBComboBox
        Left = 392
        Top = 110
        Width = 113
        Height = 21
        DataField = 'FISC_TIPOIPI'
        DataSource = dmSYS.dsCod_Fiscal
        ItemHeight = 13
        Items.Strings = (
          'Isento'
          'Tributado'
          'Outros')
        TabOrder = 8
      end
      object dbcbTipo: TDBComboBox
        Left = 242
        Top = 184
        Width = 145
        Height = 21
        DataField = 'FISC_TIPO'
        DataSource = dmSYS.dsCod_Fiscal
        ItemHeight = 13
        Items.Strings = (
          'Entrada no Estoque'
          'Saida no Estoque'
          'Nenhum')
        TabOrder = 7
      end
      object dbcbTipoICM: TDBComboBox
        Left = 392
        Top = 148
        Width = 113
        Height = 21
        DataField = 'FISC_TIPOICM'
        DataSource = dmSYS.dsCod_Fiscal
        ItemHeight = 13
        Items.Strings = (
          'Isento'
          'Tributado'
          'Outros')
        TabOrder = 9
      end
      object cbGera: TDBCheckBox
        Left = 2
        Top = 185
        Width = 201
        Height = 17
        Caption = '&Gera Contas e dar entrada no Caixa?'
        DataField = 'FISC_GRCONT'
        DataSource = dmSYS.dsCod_Fiscal
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object bitConsCodFisc: TBitBtn
        Left = 102
        Top = 8
        Width = 32
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnClick = bitConsCodFiscClick
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
        Width = 546
        Height = 215
        DataSource = dsConsulta
        OnDblClick = dbgConsClick
      end
    end
  end
  object ibqCodFiscal: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FISC_COD, FISC_CODCONTABIL, FISC_NATOPR, CFOP1, CFOP2, CF' +
        'OP3, FISC_TIPO from CODIGO_FISCAL')
    Left = 488
    Top = 56
    object ibqCodFiscalFISC_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FISC_COD'
      Origin = 'CODIGO_FISCAL.FISC_COD'
      Required = True
    end
    object ibqCodFiscalNAT_OPR: TIBStringField
      DisplayLabel = 'Natureza_Oper.'
      FieldName = 'FISC_NATOPR'
      Origin = 'CODIGO_FISCAL.NAT_OPR'
      Required = True
      Size = 50
    end
    object ibqCodFiscalFISC_CODCONTABIL: TIntegerField
      DisplayLabel = 'C'#243'd._Contabil'
      FieldName = 'FISC_CODCONTABIL'
      Origin = 'CODIGO_FISCAL.FISC_CODCONTABIL'
    end
    object ibqCodFiscalCFOP1: TIntegerField
      FieldName = 'CFOP1'
      Origin = 'CODIGO_FISCAL.CFOP1'
      Required = True
    end
    object ibqCodFiscalCFOP2: TIntegerField
      FieldName = 'CFOP2'
      Origin = 'CODIGO_FISCAL.CFOP2'
    end
    object ibqCodFiscalCFOP3: TIntegerField
      FieldName = 'CFOP3'
      Origin = 'CODIGO_FISCAL.CFOP3'
    end
    object ibqCodFiscalFISC_TIPO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'FISC_TIPO'
      Origin = 'CODIGO_FISCAL.FISC_TIPO'
      Required = True
      Size = 25
    end
  end
  object dsConsulta: TDataSource
    DataSet = ibqCodFiscal
    Left = 516
    Top = 57
  end
end
