inherited frmFornecedor: TfrmFornecedor
  Left = 190
  Top = 257
  Caption = 'Cadastro de Fornecedor'
  ClientHeight = 306
  ClientWidth = 778
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 778
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
      DataSource = dmSYS.dsFornecedor
      Hints.Strings = ()
      OnClick = dbnNavegacaoClick
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Width = 778
    Height = 265
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object Label1: TLabel
        Left = 136
        Top = 4
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbeCod
      end
      object lbFantasia: TLabel
        Left = 411
        Top = 43
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
        FocusControl = dbeNomFant
      end
      object lbCPFCNPJ: TLabel
        Left = 2
        Top = 84
        Width = 20
        Height = 13
        Caption = '*****'
        FocusControl = dbeCPFCNPJ
      end
      object lbRGIE: TLabel
        Left = 137
        Top = 83
        Width = 20
        Height = 13
        Caption = '*****'
        FocusControl = dbeRGIE
      end
      object Label5: TLabel
        Left = 2
        Top = 122
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = dbeEnd
      end
      object Label6: TLabel
        Left = 411
        Top = 123
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = dbeBai
      end
      object Label7: TLabel
        Left = 680
        Top = 123
        Width = 21
        Height = 13
        Caption = 'CEP'
        FocusControl = dbeCEP
      end
      object Label8: TLabel
        Left = 412
        Top = 82
        Width = 29
        Height = 13
        Caption = 'E-Mail'
        FocusControl = dbeEmail
      end
      object Label9: TLabel
        Left = 320
        Top = 82
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = dbeTel
      end
      object Label13: TLabel
        Left = 508
        Top = 161
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label17: TLabel
        Left = 714
        Top = 2
        Width = 42
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object lbRazao: TLabel
        Left = 2
        Top = 43
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
        FocusControl = dbeRazSoc
      end
      object dbeCod: TDBEdit
        Left = 136
        Top = 20
        Width = 115
        Height = 21
        DataField = 'FOR_COD'
        DataSource = dmSYS.dsFornecedor
        ReadOnly = True
        TabOrder = 12
      end
      object dbeNomFant: TDBEdit
        Left = 411
        Top = 59
        Width = 357
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FOR_NOM_FANT'
        DataSource = dmSYS.dsFornecedor
        TabOrder = 2
      end
      object rgTipo: TDBRadioGroup
        Left = 2
        Top = 3
        Width = 129
        Height = 38
        Caption = 'Tipo'
        Columns = 2
        DataField = 'FOR_TIP'
        DataSource = dmSYS.dsFornecedor
        Items.Strings = (
          'Fisica '
          'Juridica')
        TabOrder = 0
        TabStop = True
        Values.Strings = (
          '0'
          '1')
        OnClick = rgTipoClick
      end
      object dbeCPFCNPJ: TDBEdit
        Left = 2
        Top = 97
        Width = 115
        Height = 21
        DataField = 'FOR_CNPJCPF'
        DataSource = dmSYS.dsFornecedor
        TabOrder = 3
        OnExit = dbeCPFCNPJExit
      end
      object dbeRGIE: TDBEdit
        Left = 137
        Top = 97
        Width = 115
        Height = 21
        DataField = 'FOR_IERG'
        DataSource = dmSYS.dsFornecedor
        TabOrder = 4
      end
      object dbeEnd: TDBEdit
        Left = 2
        Top = 138
        Width = 405
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FOR_END'
        DataSource = dmSYS.dsFornecedor
        TabOrder = 7
      end
      object dbeBai: TDBEdit
        Left = 411
        Top = 138
        Width = 250
        Height = 21
        DataField = 'FOR_BAI'
        DataSource = dmSYS.dsFornecedor
        TabOrder = 8
      end
      object dbeCEP: TDBEdit
        Left = 680
        Top = 138
        Width = 88
        Height = 21
        DataField = 'FOR_CEP'
        DataSource = dmSYS.dsFornecedor
        TabOrder = 9
      end
      object grbCidade: TGroupBox
        Left = 2
        Top = 166
        Width = 496
        Height = 65
        Caption = 'Cidade'
        TabOrder = 10
        object Label10: TLabel
          Left = 6
          Top = 20
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbeCodCid
        end
        object Label11: TLabel
          Left = 83
          Top = 20
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label12: TLabel
          Left = 395
          Top = 20
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object dbeCodCid: TDBEdit
          Left = 6
          Top = 36
          Width = 72
          Height = 21
          DataField = 'CID_COD'
          DataSource = dmSYS.dsFornecedor
          TabOrder = 1
          OnChange = dbeCodCidChange
          OnDblClick = bitConsCidClick
        end
        object bitConsCid: TBitBtn
          Left = 454
          Top = 24
          Width = 32
          Height = 32
          TabOrder = 0
          OnClick = bitConsCidClick
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
        object pnNomCid: TPanel
          Left = 83
          Top = 36
          Width = 298
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 2
        end
        object pnSigEst: TPanel
          Left = 395
          Top = 36
          Width = 36
          Height = 21
          TabOrder = 3
        end
      end
      object dbeEmail: TDBEdit
        Left = 412
        Top = 98
        Width = 200
        Height = 21
        CharCase = ecLowerCase
        DataField = 'FOR_EMAIL'
        DataSource = dmSYS.dsFornecedor
        TabOrder = 6
      end
      object dbeTel: TDBEdit
        Left = 320
        Top = 98
        Width = 88
        Height = 21
        DataField = 'FOR_TEL'
        DataSource = dmSYS.dsFornecedor
        TabOrder = 5
      end
      object dbmObs: TDBMemo
        Left = 507
        Top = 174
        Width = 259
        Height = 56
        DataField = 'FOR_OBS'
        DataSource = dmSYS.dsFornecedor
        TabOrder = 11
      end
      object bitConsFor: TBitBtn
        Left = 257
        Top = 13
        Width = 32
        Height = 32
        TabOrder = 13
        OnClick = bitConsForClick
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
      object dbcbSit: TDBCheckBox
        Left = 713
        Top = 18
        Width = 58
        Height = 17
        TabStop = False
        BiDiMode = bdLeftToRight
        Caption = 'Inativo'
        Ctl3D = True
        DataField = 'FOR_SIT'
        DataSource = dmSYS.dsFornecedor
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 14
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dbeRazSoc: TDBEdit
        Left = 2
        Top = 59
        Width = 405
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FOR_RAZ_SOC'
        DataSource = dmSYS.dsFornecedor
        TabOrder = 1
      end
    end
    inherited tbsConsulta: TTabSheet
      OnShow = tbsConsultaShow
      object Label16: TLabel [0]
        Left = 4
        Top = 1
        Width = 64
        Height = 16
        Caption = 'Busca por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      inherited dbgCons: TDBGrid
        Top = 44
        Width = 769
        Height = 191
        Align = alNone
        DataSource = dsConsulta
        TabOrder = 1
        OnDblClick = bitConsOKClick
      end
      object cbFiltro: TComboBox
        Left = 2
        Top = 19
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        OnChange = cbFiltroChange
        Items.Strings = (
          'RAZ'#195'O SOCIAL'
          'NOME FANTASIA'
          'CNPJ / CPF'
          'TELEFONE'
          'ENDERE'#199'O'
          'E-MAIL'
          'CODIGO')
      end
      object edtBusc: TEdit
        Left = 151
        Top = 19
        Width = 291
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = edtBuscChange
      end
      object mkeBusc: TMaskEdit
        Left = 151
        Top = 19
        Width = 96
        Height = 21
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 3
        Text = '(  )    -    '
        Visible = False
        OnChange = edtBuscChange
      end
      object bitConsOK: TBitBtn
        Left = 697
        Top = 11
        Width = 70
        Height = 30
        Caption = '&OK'
        TabOrder = 4
        OnClick = bitConsOKClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
    end
  end
  object dsConsulta: TDataSource
    DataSet = ibqFornecedor
    Left = 420
    Top = 57
  end
  object ibqFornecedor: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dmSYS.dsFornecedor
    Left = 348
    Top = 57
  end
end
