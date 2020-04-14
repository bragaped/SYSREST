inherited frmProduto: TfrmProduto
  Left = 234
  Top = 183
  Caption = 'Cadastro de Produto'
  ClientHeight = 411
  ClientWidth = 554
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 402
    Top = 201
    Width = 28
    Height = 13
    Caption = 'Pre'#231'o'
  end
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
      DataSource = dmSYS.dsProduto
      Hints.Strings = ()
      OnClick = dbnNavegacaoClick
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Width = 554
    Height = 370
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object lbCodigo: TLabel
        Left = 2
        Top = 1
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbeCod
      end
      object lbNome: TLabel
        Left = 2
        Top = 40
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNom
      end
      object lbPreco: TLabel
        Left = 452
        Top = 40
        Width = 28
        Height = 13
        Caption = 'Pre'#231'o'
        FocusControl = dbePreco
      end
      object lbTipo: TLabel
        Left = 207
        Top = 137
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object lbUnidade: TLabel
        Left = 341
        Top = 137
        Width = 40
        Height = 13
        Caption = 'Unidade'
      end
      object lbQtdeEst: TLabel
        Left = 452
        Top = 88
        Width = 62
        Height = 13
        Caption = 'Qtd. Estoque'
      end
      object lbEstMin: TLabel
        Left = 452
        Top = 137
        Width = 75
        Height = 13
        Caption = 'Estoque Minimo'
      end
      object Label17: TLabel
        Left = 487
        Top = -1
        Width = 42
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object lbICM: TLabel
        Left = 2
        Top = 137
        Width = 19
        Height = 13
        Caption = 'ICM'
      end
      object Label1: TLabel
        Left = 40
        Top = 137
        Width = 69
        Height = 13
        Caption = 'Cod. Tributario'
      end
      object dbeCod: TDBEdit
        Left = 2
        Top = 18
        Width = 115
        Height = 21
        DataField = 'PRO_COD'
        DataSource = dmSYS.dsProduto
        ReadOnly = True
        TabOrder = 0
      end
      object bitConsPro: TBitBtn
        Left = 122
        Top = 11
        Width = 32
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = bitConsProClick
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
        Left = 2
        Top = 57
        Width = 431
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRO_NOM'
        DataSource = dmSYS.dsProduto
        TabOrder = 1
        OnExit = dbeNomExit
      end
      object grbGrupo: TGroupBox
        Left = 2
        Top = 79
        Width = 431
        Height = 55
        Caption = 'Grupo'
        TabOrder = 3
        object lbGropCod: TLabel
          Left = 7
          Top = 13
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbeCodGrup
        end
        object lbNom: TLabel
          Left = 88
          Top = 13
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object dbeCodGrup: TDBEdit
          Left = 7
          Top = 28
          Width = 73
          Height = 21
          DataField = 'GRU_COD'
          DataSource = dmSYS.dsProduto
          TabOrder = 0
          OnChange = dbeCodGrupChange
          OnDblClick = bitConsGrupClick
        end
        object bitConsGrup: TBitBtn
          Left = 389
          Top = 18
          Width = 32
          Height = 32
          TabOrder = 1
          OnClick = bitConsGrupClick
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
        object pnNomGrup: TPanel
          Left = 88
          Top = 27
          Width = 287
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 2
        end
      end
      object dbePreco: TDBEdit
        Left = 452
        Top = 57
        Width = 76
        Height = 21
        DataField = 'PRO_PRE'
        DataSource = dmSYS.dsProduto
        TabOrder = 2
      end
      object dbcbTipo: TDBComboBox
        Left = 207
        Top = 154
        Width = 115
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRO_TIP'
        DataSource = dmSYS.dsProduto
        ItemHeight = 13
        Items.Strings = (
          'SIMPLES'
          'COMPOSTO'
          'MATERIA PRIMA')
        TabOrder = 6
        OnChange = dbcbTipoChange
      end
      object grbItemComposicao: TGroupBox
        Left = 2
        Top = 178
        Width = 543
        Height = 159
        Caption = 'Itens Composic'#227'o'
        Enabled = False
        TabOrder = 10
        OnEnter = grbItemComposicaoEnter
        OnExit = grbItemComposicaoExit
        object sbExcluirItem: TSpeedButton
          Left = 5
          Top = 22
          Width = 23
          Height = 22
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          OnClick = sbExcluirItemClick
        end
        object dbgItemComp: TDBGrid
          Left = 31
          Top = 16
          Width = 505
          Height = 137
          DataSource = dmSYS.dsProd_Comp
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'COMP_PRO_COD'
              Title.Caption = 'C'#243'digo'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeComp'
              PickList.Strings = (
                '')
              Title.Caption = 'Nome'
              Width = 340
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMP_QTD'
              Title.Caption = 'Qtde'
              Width = 60
              Visible = True
            end>
        end
      end
      object dbeEstMin: TDBEdit
        Left = 452
        Top = 154
        Width = 76
        Height = 21
        DataField = 'PRO_ESTMIN'
        DataSource = dmSYS.dsProduto
        TabOrder = 8
      end
      object dbcbSit: TDBCheckBox
        Left = 487
        Top = 15
        Width = 58
        Height = 17
        TabStop = False
        Caption = 'Inativo'
        Ctl3D = True
        DataField = 'PRO_SIT'
        DataSource = dmSYS.dsProduto
        ParentCtl3D = False
        TabOrder = 11
        ValueChecked = 'I'
        ValueUnchecked = 'A'
      end
      object dbcbUnidade: TDBComboBox
        Left = 341
        Top = 154
        Width = 92
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRO_UNI'
        DataSource = dmSYS.dsProduto
        ItemHeight = 13
        Items.Strings = (
          'UNIDADE'
          'LITRO'
          'KILO')
        TabOrder = 7
        OnChange = dbcbUnidadeChange
      end
      object dbePro_ICM: TDBEdit
        Left = 2
        Top = 154
        Width = 23
        Height = 21
        DataField = 'PRO_ICM'
        DataSource = dmSYS.dsProduto
        TabOrder = 4
        OnExit = dbePro_ICMExit
      end
      object dbcbCodTribut: TDBComboBox
        Left = 38
        Top = 154
        Width = 148
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRO_CODTRIBUT'
        DataSource = dmSYS.dsProduto
        ItemHeight = 13
        Items.Strings = (
          '00 - ISENTO'
          '00 - SUBSTITUI'#199#195'O'
          '00 - TRIB. NORMAL'
          '00 - N'#195'O TRIBUTADO')
        TabOrder = 5
      end
      object pnQtde: TPanel
        Left = 452
        Top = 104
        Width = 81
        Height = 25
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelWidth = 2
        Caption = '0,000'
        TabOrder = 12
      end
    end
    inherited tbsConsulta: TTabSheet
      OnShow = tbsConsultaShow
      object Label16: TLabel [0]
        Left = 2
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
      object lbtip: TLabel [1]
        Left = 160
        Top = 1
        Width = 15
        Height = 16
        Caption = '***'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      inherited dbgCons: TDBGrid
        Top = 44
        Height = 295
        Align = alNone
        DataSource = dsConsulta
        OnDblClick = dbgConsDblClick
      end
      object edtBusc: TEdit
        Left = 160
        Top = 19
        Width = 300
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        OnChange = edtBuscChange
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
          'Nome'
          'Tipo'
          'Codigo')
      end
      object bitConsOK: TBitBtn
        Left = 475
        Top = 11
        Width = 70
        Height = 30
        Caption = '&OK'
        TabOrder = 3
        OnClick = dbgConsDblClick
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
      object cbFiltroTipo: TComboBox
        Left = 160
        Top = 19
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        OnChange = cbFiltroTipoChange
        Items.Strings = (
          'SIMPLES'
          'COMPOSTO'
          'MATERIA PRIMA')
      end
    end
  end
  object ibqProduto: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select PRO_COD as Codigo, PRO_NOM as Nome, PRO_PRE as Preco, PRO' +
        '_TIP as Tipo, PRO_SIT as Situacao from PRODUTO ORDER BY PRO_NOM')
    Left = 252
    Top = 41
  end
  object dsConsulta: TDataSource
    DataSet = ibqProduto
    Left = 316
    Top = 41
  end
end
