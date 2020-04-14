inherited frmCliente: TfrmCliente
  Left = 203
  Top = 252
  Caption = 'Cadastro de Cliente'
  ClientHeight = 303
  ClientWidth = 677
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 677
    inherited bitok: TBitBtn
      OnClick = bitokClick
    end
    inherited bitIncluir: TBitBtn
      OnClick = bitIncluirClick
    end
    inherited bitAlterar: TBitBtn
      TabOrder = 3
      OnClick = bitAlterarClick
    end
    inherited bitCancelar: TBitBtn
      TabOrder = 4
      OnClick = bitCancelarClick
    end
    inherited bitExcluir: TBitBtn
      OnClick = bitExcluirClick
    end
    inherited dbnNavegacao: TDBNavigator
      DataSource = dmSYS.dsCliente
      Hints.Strings = ()
      OnClick = dbnNavegacaoClick
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Width = 677
    Height = 262
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object Label1: TLabel
        Left = 146
        Top = 3
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbeCod
      end
      object lbNome: TLabel
        Left = 4
        Top = 45
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNom
      end
      object lbCPFCNPJ: TLabel
        Left = 439
        Top = 44
        Width = 20
        Height = 13
        Caption = '*****'
        FocusControl = dbecpfcnpj
      end
      object lbRGIE: TLabel
        Left = 555
        Top = 44
        Width = 20
        Height = 13
        Caption = '*****'
        FocusControl = dbergie
      end
      object lbsex: TLabel
        Left = 555
        Top = 123
        Width = 24
        Height = 13
        Caption = 'Sexo'
        FocusControl = dbeSex
      end
      object Label5: TLabel
        Left = 4
        Top = 86
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = dbeEnd
      end
      object Label6: TLabel
        Left = 439
        Top = 86
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = dbeComp
      end
      object Label7: TLabel
        Left = 4
        Top = 123
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = dbeBai
      end
      object Label8: TLabel
        Left = 555
        Top = 86
        Width = 21
        Height = 13
        Caption = 'CEP'
        FocusControl = dbeCEP
      end
      object Label14: TLabel
        Left = 253
        Top = 123
        Width = 29
        Height = 13
        Caption = 'E-Mail'
        FocusControl = dbeEmail
      end
      object Label15: TLabel
        Left = 439
        Top = 123
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = dbeTel
      end
      object Label13: TLabel
        Left = 439
        Top = 162
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label17: TLabel
        Left = 613
        Top = 2
        Width = 42
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object dbeCod: TDBEdit
        Left = 146
        Top = 20
        Width = 115
        Height = 21
        DataField = 'CLI_COD'
        DataSource = dmSYS.dsCliente
        ReadOnly = True
        TabOrder = 15
      end
      object bitConsCli: TBitBtn
        Left = 266
        Top = 15
        Width = 32
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        OnClick = bitConsCliClick
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
      object dbeNom: TDBEdit
        Left = 4
        Top = 60
        Width = 433
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLI_NOM'
        DataSource = dmSYS.dsCliente
        TabOrder = 1
      end
      object rgTipo: TDBRadioGroup
        Left = 4
        Top = 3
        Width = 127
        Height = 37
        Caption = 'Tipo'
        Columns = 2
        DataField = 'CLI_TIP'
        DataSource = dmSYS.dsCliente
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
      object dbecpfcnpj: TDBEdit
        Left = 439
        Top = 60
        Width = 115
        Height = 21
        DataField = 'CLI_CPFCNPJ'
        DataSource = dmSYS.dsCliente
        TabOrder = 2
        OnExit = dbecpfcnpjExit
      end
      object dbergie: TDBEdit
        Left = 555
        Top = 60
        Width = 115
        Height = 21
        DataField = 'CLI_RGIE'
        DataSource = dmSYS.dsCliente
        TabOrder = 3
      end
      object dbeSex: TDBEdit
        Left = 555
        Top = 139
        Width = 27
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLI_SEX'
        DataSource = dmSYS.dsCliente
        TabOrder = 10
      end
      object dbeEnd: TDBEdit
        Left = 4
        Top = 102
        Width = 433
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLI_END'
        DataSource = dmSYS.dsCliente
        TabOrder = 4
      end
      object dbeComp: TDBEdit
        Left = 439
        Top = 102
        Width = 88
        Height = 21
        DataField = 'CLI_COM'
        DataSource = dmSYS.dsCliente
        TabOrder = 5
      end
      object dbeBai: TDBEdit
        Left = 4
        Top = 139
        Width = 241
        Height = 21
        DataField = 'CLI_BAI'
        DataSource = dmSYS.dsCliente
        TabOrder = 7
      end
      object dbeCEP: TDBEdit
        Left = 555
        Top = 102
        Width = 88
        Height = 21
        DataField = 'CLI_CEP'
        DataSource = dmSYS.dsCliente
        TabOrder = 6
      end
      object dbeEmail: TDBEdit
        Left = 251
        Top = 139
        Width = 186
        Height = 21
        DataField = 'CLI_EMAIL'
        DataSource = dmSYS.dsCliente
        TabOrder = 8
      end
      object dbeTel: TDBEdit
        Left = 439
        Top = 139
        Width = 88
        Height = 21
        DataField = 'CLI_TEL'
        DataSource = dmSYS.dsCliente
        TabOrder = 9
      end
      object dbmObs: TDBMemo
        Left = 439
        Top = 177
        Width = 229
        Height = 54
        DataField = 'CLI_OBS'
        DataSource = dmSYS.dsCliente
        TabOrder = 12
      end
      object grbCidade: TGroupBox
        Left = 4
        Top = 171
        Width = 433
        Height = 61
        Caption = 'Cidade'
        TabOrder = 11
        object Label10: TLabel
          Left = 7
          Top = 19
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
          Left = 349
          Top = 20
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object dbeCodCid: TDBEdit
          Left = 7
          Top = 36
          Width = 73
          Height = 21
          DataField = 'CID_COD'
          DataSource = dmSYS.dsCliente
          TabOrder = 1
          OnChange = dbeCodCidChange
          OnDblClick = bitConsCidClick
        end
        object bitConsCid: TBitBtn
          Left = 394
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
          Top = 35
          Width = 254
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 2
        end
        object pnSigEst: TPanel
          Left = 349
          Top = 33
          Width = 36
          Height = 22
          TabOrder = 3
        end
      end
      object dbcbSit: TDBCheckBox
        Left = 614
        Top = 17
        Width = 54
        Height = 17
        TabStop = False
        BiDiMode = bdLeftToRight
        Caption = 'Inativo'
        Ctl3D = True
        DataField = 'CLI_SIT'
        DataSource = dmSYS.dsCliente
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 14
        ValueChecked = 'I'
        ValueUnchecked = 'A'
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
      object edtBusc: TEdit [1]
        Left = 165
        Top = 18
        Width = 282
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = edtBuscChange
      end
      object cbFiltro: TComboBox [2]
        Left = 4
        Top = 19
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'Nome'
        OnChange = cbFiltroChange
        Items.Strings = (
          'Nome'
          'Telefone'
          'Endere'#231'o'
          'Codigo')
      end
      object mkeBusc: TMaskEdit [3]
        Left = 165
        Top = 18
        Width = 96
        Height = 21
        Enabled = False
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 2
        Text = '(  )    -    '
        Visible = False
        OnChange = edtBuscChange
      end
      object bitConsOK: TBitBtn [4]
        Left = 594
        Top = 13
        Width = 70
        Height = 30
        Caption = '&OK'
        TabOrder = 3
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
      inherited dbgCons: TDBGrid
        Top = 47
        Width = 669
        Height = 185
        Align = alNone
        DataSource = dsConsulta
        TabOrder = 4
        OnDblClick = bitConsOKClick
      end
    end
  end
  object ibqCliente: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select CLI_COD as Codigo, CLI_NOM as Nome, CLI_TEL as Telefone, ' +
        'CLI_END as Endereco From Cliente ORDER BY CLI_COD')
    Left = 340
    Top = 57
  end
  object dsConsulta: TDataSource
    DataSet = ibqCliente
    Left = 396
    Top = 57
  end
end
