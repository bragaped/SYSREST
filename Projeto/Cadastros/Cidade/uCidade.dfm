inherited frmCidade: TfrmCidade
  Left = 231
  Top = 215
  Caption = 'Cadastro de Cidade'
  ClientHeight = 215
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited bitok: TBitBtn
      TabOrder = 0
      OnClick = bitokClick
    end
    inherited bitIncluir: TBitBtn
      TabOrder = 1
      OnClick = bitIncluirClick
    end
    inherited bitAlterar: TBitBtn
      TabOrder = 2
      OnClick = bitAlterarClick
    end
    inherited bitCancelar: TBitBtn
      OnClick = bitCancelarClick
    end
    inherited bitExcluir: TBitBtn
      TabOrder = 4
      OnClick = bitExcluirClick
    end
    inherited dbnNavegacao: TDBNavigator
      DataSource = dmSYS.dsCidade
      Hints.Strings = ()
      TabOrder = 6
    end
    inherited bitSair: TBitBtn
      TabOrder = 5
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Height = 174
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbeCod
      end
      object Label2: TLabel
        Left = 8
        Top = 53
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNom
      end
      object Label3: TLabel
        Left = 8
        Top = 101
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object dbeCod: TDBEdit
        Left = 8
        Top = 21
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CID_COD'
        DataSource = dmSYS.dsCidade
        ReadOnly = True
        TabOrder = 0
      end
      object dbeNom: TDBEdit
        Left = 8
        Top = 70
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CID_NOM'
        DataSource = dmSYS.dsCidade
        TabOrder = 1
      end
      object cbEst: TDBComboBox
        Left = 8
        Top = 118
        Width = 49
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EST_SIG'
        DataSource = dmSYS.dsCidade
        ItemHeight = 13
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        TabOrder = 2
      end
      object bitConsCid: TBitBtn
        Left = 150
        Top = 14
        Width = 32
        Height = 32
        TabOrder = 3
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
    end
    inherited tbsConsulta: TTabSheet
      OnShow = tbsConsultaShow
      object Label16: TLabel [0]
        Left = 10
        Top = -1
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
        Left = 1
        Top = 43
        Width = 545
        Height = 101
        Align = alNone
        DataSource = dsConsulta
        TabOrder = 1
        OnDblClick = bitOKConsClick
      end
      object cbFiltro: TComboBox
        Left = 8
        Top = 17
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = 'Nome'
        Items.Strings = (
          'Nome'
          'Codigo')
      end
      object edtBusc: TEdit
        Left = 166
        Top = 17
        Width = 291
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = edtBuscChange
      end
      object bitOKCons: TBitBtn
        Left = 467
        Top = 11
        Width = 70
        Height = 30
        Caption = '&OK'
        TabOrder = 3
        OnClick = bitOKConsClick
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
  object ibqCidade: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select CID_COD as Codigo, CID_NOM as Nome, EST_SIG as Estado Fro' +
        'm Cidade ORDER BY CID_COD')
    Left = 236
    Top = 49
  end
  object dsConsulta: TDataSource
    DataSet = ibqCidade
    Left = 292
    Top = 49
  end
end
