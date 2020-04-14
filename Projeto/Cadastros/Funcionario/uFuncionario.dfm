inherited frmFuncionario: TfrmFuncionario
  Left = 165
  Top = 248
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientHeight = 338
  ClientWidth = 663
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 663
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
      DataSource = dmSYS.dsFuncionario
      Hints.Strings = ()
      OnClick = dbnNavegacaoClick
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Width = 663
    Height = 297
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object Label1: TLabel
        Left = 2
        Top = 2
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbeCod
      end
      object Label17: TLabel
        Left = 592
        Top = 1
        Width = 42
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object lbNome: TLabel
        Left = 2
        Top = 40
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNom
      end
      object lbCPFCNPJ: TLabel
        Left = 2
        Top = 78
        Width = 20
        Height = 13
        Caption = 'CPF'
        FocusControl = dbecpf
      end
      object lbRGIE: TLabel
        Left = 125
        Top = 79
        Width = 16
        Height = 13
        Caption = 'RG'
        FocusControl = dberg
      end
      object Label9: TLabel
        Left = 437
        Top = 39
        Width = 24
        Height = 13
        Caption = 'Sexo'
        FocusControl = dbeSex
      end
      object Label5: TLabel
        Left = 2
        Top = 116
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = dbeEnd
      end
      object Label7: TLabel
        Left = 2
        Top = 155
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = dbeBai
      end
      object Label6: TLabel
        Left = 437
        Top = 117
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = dbeComp
      end
      object Label8: TLabel
        Left = 250
        Top = 155
        Width = 21
        Height = 13
        Caption = 'CEP'
        FocusControl = dbeCEP
      end
      object Label14: TLabel
        Left = 247
        Top = 82
        Width = 29
        Height = 13
        Caption = 'E-Mail'
        FocusControl = dbeEmail
      end
      object Label15: TLabel
        Left = 437
        Top = 81
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = dbeTel
      end
      object Label13: TLabel
        Left = 437
        Top = 193
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label2: TLabel
        Left = 437
        Top = 156
        Width = 36
        Height = 13
        Caption = 'Fun'#231#227'o'
        FocusControl = dbeFuncao
      end
      object Label3: TLabel
        Left = 345
        Top = 155
        Width = 71
        Height = 13
        Caption = 'Data Admiss'#227'o'
      end
      object Label4: TLabel
        Left = 533
        Top = 116
        Width = 56
        Height = 13
        Caption = '% Comiss'#227'o'
        FocusControl = dbeComissao
      end
      object grbCidade: TGroupBox
        Left = 2
        Top = 202
        Width = 433
        Height = 62
        Caption = 'Cidade'
        TabOrder = 12
        object Label10: TLabel
          Left = 5
          Top = 18
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbeCodCid
        end
        object Label11: TLabel
          Left = 83
          Top = 18
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label12: TLabel
          Left = 355
          Top = 19
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object dbeCodCid: TDBEdit
          Left = 5
          Top = 33
          Width = 73
          Height = 21
          DataField = 'CID_COD'
          DataSource = dmSYS.dsFuncionario
          TabOrder = 1
          OnChange = dbeCodCidChange
          OnDblClick = bitConsCidClick
        end
        object bitConsCid: TBitBtn
          Left = 395
          Top = 21
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
          Top = 32
          Width = 262
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 2
        end
        object pnSigEst: TPanel
          Left = 355
          Top = 33
          Width = 36
          Height = 20
          TabOrder = 3
        end
      end
      object dbeCod: TDBEdit
        Left = 2
        Top = 19
        Width = 115
        Height = 21
        DataField = 'FUN_COD'
        DataSource = dmSYS.dsFuncionario
        ReadOnly = True
        TabOrder = 16
      end
      object bitConsFunc: TBitBtn
        Left = 122
        Top = 12
        Width = 32
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
        OnClick = bitConsFuncClick
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
        Left = 592
        Top = 17
        Width = 58
        Height = 17
        TabStop = False
        BiDiMode = bdLeftToRight
        Caption = 'Inativo'
        Ctl3D = True
        DataField = 'FUN_SIT'
        DataSource = dmSYS.dsFuncionario
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 14
        ValueChecked = 'I'
        ValueUnchecked = 'A'
      end
      object dbeNom: TDBEdit
        Left = 2
        Top = 55
        Width = 433
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FUN_NOM'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 0
      end
      object dbecpf: TDBEdit
        Left = 2
        Top = 94
        Width = 115
        Height = 21
        DataField = 'FUN_CPF'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 2
        OnExit = dbecpfExit
      end
      object dberg: TDBEdit
        Left = 125
        Top = 95
        Width = 115
        Height = 21
        DataField = 'FUN_RG'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 3
      end
      object dbeSex: TDBEdit
        Left = 437
        Top = 55
        Width = 27
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FUN_SEX'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 1
      end
      object dbeEnd: TDBEdit
        Left = 2
        Top = 132
        Width = 433
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FUN_END'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 6
      end
      object dbeBai: TDBEdit
        Left = 2
        Top = 171
        Width = 239
        Height = 21
        DataField = 'FUN_BAI'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 8
      end
      object dbeComp: TDBEdit
        Left = 437
        Top = 132
        Width = 88
        Height = 21
        DataField = 'FUN_COM'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 7
      end
      object dbeCEP: TDBEdit
        Left = 250
        Top = 171
        Width = 88
        Height = 21
        DataField = 'FUN_CEP'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 9
      end
      object dbeEmail: TDBEdit
        Left = 247
        Top = 96
        Width = 188
        Height = 21
        DataField = 'FUN_EMAIL'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 4
      end
      object dbeTel: TDBEdit
        Left = 437
        Top = 96
        Width = 88
        Height = 21
        DataField = 'FUN_TEL'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 5
      end
      object dbmObs: TDBMemo
        Left = 437
        Top = 208
        Width = 217
        Height = 57
        DataField = 'FUN_OBS'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 13
      end
      object dbeFuncao: TDBEdit
        Left = 437
        Top = 171
        Width = 216
        Height = 21
        DataField = 'FUN_FUNC'
        DataSource = dmSYS.dsFuncionario
        TabOrder = 11
      end
      object dtpAdmissao: TDateTimePicker
        Left = 345
        Top = 170
        Width = 90
        Height = 24
        Date = 39221.585539814810000000
        Time = 39221.585539814810000000
        Color = clBtnHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 10
      end
      object dbeComissao: TDBEdit
        Left = 533
        Top = 132
        Width = 61
        Height = 21
        DataField = 'COMISSAO'
        DataSource = dmSYS.dsFuncionario
        MaxLength = 5
        TabOrder = 17
      end
    end
    inherited tbsConsulta: TTabSheet
      OnShow = tbsConsultaShow
      object Label16: TLabel [0]
        Left = 2
        Top = 2
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
        Top = 47
        Width = 654
        Height = 221
        Align = alNone
        DataSource = dsConsulta
        OnDblClick = bitConsOKClick
      end
      object bitConsOK: TBitBtn
        Left = 585
        Top = 12
        Width = 68
        Height = 30
        Caption = '&OK'
        TabOrder = 1
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
      object cbFiltro: TComboBox
        Left = 2
        Top = 20
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        OnChange = cbFiltroChange
        Items.Strings = (
          'Nome'
          'Telefone'
          'Endere'#231'o'
          'Codigo')
      end
      object edtBusc: TEdit
        Left = 160
        Top = 20
        Width = 282
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
        OnChange = edtBuscChange
      end
      object mkeBusc: TMaskEdit
        Left = 160
        Top = 20
        Width = 96
        Height = 21
        Enabled = False
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 4
        Text = '(  )    -    '
        Visible = False
      end
    end
  end
  object ibqFuncionario: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    Left = 260
    Top = 65
  end
  object dsConsulta: TDataSource
    DataSet = ibqFuncionario
    Left = 332
    Top = 65
  end
end
