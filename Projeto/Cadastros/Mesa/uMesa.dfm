inherited frmMesa: TfrmMesa
  Left = 257
  Top = 202
  Caption = 'Cadastro de Mesa'
  ClientHeight = 367
  ClientWidth = 560
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 560
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
      DataSource = dmSYS.dsMesa
      Hints.Strings = ()
      OnClick = dbnNavegacaoClick
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Width = 560
    Height = 326
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object lbCod: TLabel
        Left = 8
        Top = 5
        Width = 41
        Height = 13
        Caption = 'N'#176' Mesa'
        FocusControl = dbeCod
      end
      object lbqtde: TLabel
        Left = 8
        Top = 51
        Width = 82
        Height = 13
        Caption = 'Qtde. de Lugares'
        FocusControl = dbeQtdeLug
      end
      object Label17: TLabel
        Left = 484
        Top = 3
        Width = 42
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object lbsit: TLabel
        Left = 126
        Top = 53
        Width = 42
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object sbAgrupT: TSpeedButton
        Left = 263
        Top = 205
        Width = 23
        Height = 22
        Enabled = False
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7000777707707777700077770070077770007777060060777000000006606607
          7000066666660660700006666666606600000666666606607000000006606607
          7000777706006077700077770070077770007777077077777000777777777777
          7000}
        OnClick = sbAgrupTClick
      end
      object sbDesagrupT: TSpeedButton
        Left = 263
        Top = 245
        Width = 23
        Height = 22
        Enabled = False
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          04000000000068000000120B0000120B00001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7000777770770777700077770070077770007770600607777000770660660000
          0000706606666666000006606666666600007066066666660000770660660000
          0000777060060777700077770070077770007777707707777000777777777777
          7000}
        OnClick = sbDesagrupTClick
      end
      object sbAgrup1: TSpeedButton
        Left = 263
        Top = 177
        Width = 23
        Height = 22
        Enabled = False
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7000777777077777700077777700777770007777770607777000770000066077
          7000770666666607700077066666666070007706666666077000770000066077
          7000777777060777700077777700777770007777770777777000777777777777
          7000}
        OnClick = sbAgrup1Click
      end
      object sbDesagrup1: TSpeedButton
        Left = 263
        Top = 271
        Width = 23
        Height = 22
        Enabled = False
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7000777777077777700077777007777770007777060777777000777066000007
          7000770666666607700070666666660770007706666666077000777066000007
          7000777706077777700077777007777770007777770777777000777777777777
          7000}
        OnClick = sbDesagrup1Click
      end
      object Label1: TLabel
        Left = 8
        Top = 160
        Width = 54
        Height = 13
        Caption = 'Disponiveis'
      end
      object Label3: TLabel
        Left = 292
        Top = 160
        Width = 51
        Height = 13
        Caption = 'Agrupadas'
      end
      object dbeCod: TDBEdit
        Left = 8
        Top = 21
        Width = 97
        Height = 21
        DataField = 'MESA_COD'
        DataSource = dmSYS.dsMesa
        ReadOnly = True
        TabOrder = 0
      end
      object dbeQtdeLug: TDBEdit
        Left = 8
        Top = 67
        Width = 73
        Height = 21
        DataField = 'MESA_LUG'
        DataSource = dmSYS.dsMesa
        TabOrder = 1
      end
      object gbSetor: TGroupBox
        Left = 8
        Top = 96
        Width = 537
        Height = 61
        Caption = 'Setor'
        TabOrder = 2
        object Label2: TLabel
          Left = 10
          Top = 15
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbeCodSet
        end
        object Label11: TLabel
          Left = 118
          Top = 15
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object dbeCodSet: TDBEdit
          Left = 10
          Top = 31
          Width = 94
          Height = 21
          DataField = 'SET_COD'
          DataSource = dmSYS.dsMesa
          TabOrder = 0
          OnChange = dbeCodSetChange
          OnDblClick = bitConsSetClick
        end
        object bitConsSet: TBitBtn
          Left = 468
          Top = 21
          Width = 32
          Height = 32
          TabOrder = 1
          OnClick = bitConsSetClick
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
        object pnNomSet: TPanel
          Left = 118
          Top = 31
          Width = 339
          Height = 22
          Alignment = taLeftJustify
          TabOrder = 2
        end
      end
      object bitConsMesa: TBitBtn
        Left = 111
        Top = 15
        Width = 32
        Height = 32
        TabOrder = 3
        OnClick = bitConsMesaClick
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
        Left = 484
        Top = 19
        Width = 58
        Height = 17
        TabStop = False
        BiDiMode = bdLeftToRight
        Caption = 'Inativo'
        Ctl3D = True
        DataField = 'MESA_SIT'
        DataSource = dmSYS.dsMesa
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 4
        ValueChecked = 'I'
        ValueUnchecked = 'A'
      end
      object pnSit: TPanel
        Left = 125
        Top = 67
        Width = 100
        Height = 21
        TabOrder = 5
      end
      object dbgdisponivel: TDBGrid
        Left = 8
        Top = 176
        Width = 249
        Height = 120
        DataSource = dsDisponiveis
        Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Width = 10
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Mesa'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigo'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            Width = 150
            Visible = True
          end>
      end
      object dbgAgrupadas: TDBGrid
        Left = 292
        Top = 176
        Width = 249
        Height = 120
        DataSource = dsAgrupadas
        Options = [dgColumnResize, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Width = 10
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Mesa'
            Title.Caption = 'Mesas'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Caption = 'Qauntidade de Lugares'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            Width = 150
            Visible = True
          end>
      end
    end
    inherited tbsConsulta: TTabSheet
      OnShow = tbsConsultaShow
      object Label16: TLabel [0]
        Left = 10
        Top = 0
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
      object lbSituacao: TLabel [1]
        Left = 169
        Top = 0
        Width = 56
        Height = 16
        Caption = 'Situa'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbSetor: TLabel [2]
        Left = 275
        Top = 0
        Width = 35
        Height = 16
        Caption = 'Setor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      inherited dbgCons: TDBGrid
        Top = 45
        Width = 546
        Height = 252
        Align = alNone
        DataSource = dsConsulta
        OnDblClick = bitConsOKClick
      end
      object bitConsOK: TBitBtn
        Left = 473
        Top = 9
        Width = 70
        Height = 30
        Caption = '&OK'
        TabOrder = 1
        Visible = False
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
        Left = 10
        Top = 18
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        OnChange = cbFiltroChange
        Items.Strings = (
          'Situa'#231#227'o'
          'Codigo')
      end
      object edtBusc: TEdit
        Left = 168
        Top = 18
        Width = 145
        Height = 21
        TabOrder = 3
        OnChange = edtBuscChange
      end
      object cbFiltro1: TComboBox
        Left = 169
        Top = 18
        Width = 100
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        OnChange = cbFiltro1Change
        Items.Strings = (
          'ABERTA'
          'DISPONIVEL'
          'OCUPADA'
          'INATIVA')
      end
      object edtBusc1: TEdit
        Left = 275
        Top = 18
        Width = 190
        Height = 21
        TabOrder = 5
        OnChange = cbFiltro1Change
      end
    end
  end
  object dsConsulta: TDataSource
    DataSet = ibqMesa
    Left = 436
    Top = 49
  end
  object ibqMesa: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select mesa.mesa_cod as Codigo, mesa.mesa_lug as Qtd_Lugares, me' +
        'sa.mesa_sit as Situacao, setor.set_nom as Nome_Setor'
      'from Setor , Mesa where mesa.set_cod = setor.set_cod')
    Left = 380
    Top = 49
  end
  object cdsDisponiveis: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Mesa'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'cdsDisponiveisIndex4'
        Fields = 'codigo'
        Options = [ixPrimary]
      end>
    IndexFieldNames = 'codigo'
    Params = <>
    StoreDefs = True
    Left = 228
    Top = 289
    object cdsDisponiveisMesa: TStringField
      FieldName = 'Mesa'
      Size = 8
    end
    object cdsDisponiveiscodigo: TIntegerField
      FieldName = 'codigo'
      KeyFields = 'codigo'
      DisplayFormat = '00'
      EditFormat = '00'
    end
  end
  object cdsAgrupadas: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsAgrupadasIndex1'
        Fields = 'codigo'
      end>
    IndexFieldNames = 'codigo'
    Params = <>
    StoreDefs = True
    Left = 516
    Top = 289
    object cdsAgrupadasMesa: TStringField
      FieldName = 'Mesa'
      Size = 8
    end
    object cdsAgrupadascodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '00'
      EditFormat = '00'
    end
  end
  object dsAgrupadas: TDataSource
    DataSet = cdsAgrupadas
    Left = 516
    Top = 329
  end
  object qryDisponiveis: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select mesa_cod from mesa'
      'where mesa_sit =  :sit order by mesa_cod')
    Left = 228
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'sit'
        ParamType = ptUnknown
        Value = 'D'
      end>
    object qryDisponiveisMESA_COD: TIntegerField
      FieldName = 'MESA_COD'
      Origin = 'MESA.MESA_COD'
      Required = True
    end
  end
  object qryAgrupadas: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select junta_mesa.mesa_fil'
      ' from junta_mesa'
      ' where junta_mesa.mesa_cod = :cod')
    Left = 516
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'cod'
        ParamType = ptUnknown
      end>
    object qryAgrupadasMESA_FIL: TIntegerField
      FieldName = 'MESA_FIL'
      Origin = 'JUNTA_MESA.MESA_FIL'
      Required = True
    end
  end
  object dsDisponiveis: TDataSource
    DataSet = cdsDisponiveis
    Left = 228
    Top = 329
  end
end
