inherited frmContas_Pagar: TfrmContas_Pagar
  Left = 228
  Top = 203
  Caption = 'Cadastro de Contas a Pagar'
  ClientHeight = 251
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
      DataSource = dmSYS.dsContas_Pagar
      Hints.Strings = ()
      OnClick = dbnNavegacaoClick
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Height = 210
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object Label2: TLabel
        Left = 4
        Top = 70
        Width = 23
        Height = 13
        Caption = 'Nota'
        FocusControl = dbeNroDoc
      end
      object Label3: TLabel
        Left = 90
        Top = 71
        Width = 33
        Height = 13
        Caption = 'Pacela'
        FocusControl = dbeParc
      end
      object Label4: TLabel
        Left = 176
        Top = 72
        Width = 97
        Height = 13
        Caption = 'Valor do Documento'
        FocusControl = dbeValDoc
      end
      object Label5: TLabel
        Left = 280
        Top = 73
        Width = 82
        Height = 13
        Caption = 'Data Vencimento'
      end
      object Label10: TLabel
        Left = 4
        Top = 110
        Width = 61
        Height = 13
        Caption = 'Observa'#231#227'o:'
      end
      object dbeNroDoc: TDBEdit
        Left = 4
        Top = 86
        Width = 80
        Height = 21
        DataField = 'CONT_NRODOC'
        DataSource = dmSYS.dsContas_Pagar
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 4
        Width = 378
        Height = 63
        Caption = 'Fornecedor'
        TabOrder = 0
        object Label9: TLabel
          Left = 8
          Top = 15
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbeCodFor
        end
        object Label11: TLabel
          Left = 87
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object dbeCodFor: TDBEdit
          Left = 8
          Top = 31
          Width = 71
          Height = 21
          DataField = 'FOR_COD'
          DataSource = dmSYS.dsContas_Pagar
          TabOrder = 0
          OnChange = dbeCodForChange
          OnDblClick = bitConsForClick
        end
        object pnNomFor: TPanel
          Left = 87
          Top = 31
          Width = 241
          Height = 23
          Alignment = taLeftJustify
          TabOrder = 1
        end
        object bitConsFor: TBitBtn
          Left = 333
          Top = 23
          Width = 32
          Height = 32
          TabOrder = 2
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
      end
      object dbeParc: TDBEdit
        Left = 90
        Top = 87
        Width = 80
        Height = 21
        DataField = 'CONT_PARC'
        DataSource = dmSYS.dsContas_Pagar
        TabOrder = 2
        OnEnter = dbeParcEnter
      end
      object dbeValDoc: TDBEdit
        Left = 177
        Top = 88
        Width = 85
        Height = 21
        DataField = 'CONT_VALPAGAR'
        DataSource = dmSYS.dsContas_Pagar
        TabOrder = 3
      end
      object dbmObs: TDBMemo
        Left = 4
        Top = 126
        Width = 297
        Height = 49
        DataField = 'CONT_OBS'
        DataSource = dmSYS.dsContas_Pagar
        TabOrder = 5
      end
      object dtpVenc: TDateTimePicker
        Left = 280
        Top = 88
        Width = 97
        Height = 21
        Date = 39312.566199178240000000
        Time = 39312.566199178240000000
        TabOrder = 4
      end
      object GroupBox2: TGroupBox
        Left = 385
        Top = 8
        Width = 121
        Height = 103
        Caption = 'Pagamento'
        TabOrder = 6
        object Label6: TLabel
          Left = 15
          Top = 16
          Width = 52
          Height = 13
          Caption = 'Valor Pago'
          FocusControl = dbeValPag
        end
        object Label7: TLabel
          Left = 17
          Top = 54
          Width = 80
          Height = 13
          Caption = 'Data Pagamento'
        end
        object dbeValPag: TDBEdit
          Left = 15
          Top = 28
          Width = 85
          Height = 21
          DataField = 'CONT_VALPAGO'
          DataSource = dmSYS.dsContas_Pagar
          TabOrder = 0
        end
        object dbeDtaPag: TDBEdit
          Left = 17
          Top = 72
          Width = 97
          Height = 21
          DataField = 'CONT_DATPAG'
          DataSource = dmSYS.dsContas_Pagar
          MaxLength = 10
          TabOrder = 1
        end
      end
      object bitConsContas: TBitBtn
        Left = 509
        Top = 15
        Width = 32
        Height = 32
        TabOrder = 7
        OnClick = bitConsContasClick
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
      object lbBusca: TLabel [0]
        Left = 2
        Top = -2
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
      object lbfornecedor: TLabel [1]
        Left = 160
        Top = 2
        Width = 28
        Height = 13
        Caption = 'Nome'
        Visible = False
      end
      object lbnota: TLabel [2]
        Left = 160
        Top = 2
        Width = 23
        Height = 13
        Caption = 'Nota'
        Visible = False
      end
      object lbDtaFim: TLabel [3]
        Left = 275
        Top = 2
        Width = 22
        Height = 13
        Caption = 'Final'
        Visible = False
      end
      object lbDtaIni: TLabel [4]
        Left = 160
        Top = 2
        Width = 27
        Height = 13
        Caption = 'Inicial'
        Visible = False
      end
      inherited dbgCons: TDBGrid
        Top = 40
        Height = 142
        Align = alNone
        DataSource = dsContas_Pagar
      end
      object cbFiltro: TComboBox
        Left = 2
        Top = 16
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbFiltroChange
        Items.Strings = (
          'Fornecedor'
          'Data Vencimento'
          'Data Pagamento'
          'Nota')
      end
      object edtForn: TEdit
        Left = 160
        Top = 16
        Width = 310
        Height = 21
        TabOrder = 2
        Visible = False
        OnChange = edtFornChange
      end
      object edtNF: TEdit
        Left = 160
        Top = 16
        Width = 105
        Height = 21
        TabOrder = 3
        Visible = False
        OnChange = edtFornChange
      end
      object dtpFim: TDateTimePicker
        Left = 275
        Top = 16
        Width = 106
        Height = 21
        Date = 39328.827461296300000000
        Time = 39328.827461296300000000
        TabOrder = 4
        Visible = False
      end
      object dtpIni: TDateTimePicker
        Left = 160
        Top = 16
        Width = 106
        Height = 21
        Date = 39328.827461296300000000
        Time = 39328.827461296300000000
        TabOrder = 5
        Visible = False
      end
      object bitokdtp: TBitBtn
        Left = 411
        Top = 15
        Width = 57
        Height = 21
        Caption = 'OK'
        TabOrder = 6
        Visible = False
        OnClick = bitokdtpClick
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
  object qryContas_Pagar: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select fornecedor.for_cod as Codigo, fornecedor.for_raz_soc as F' +
        'ornecedor, contas_pagar.cont_nrodoc as Nota, contas_pagar.cont_p' +
        'arc as Parcela,contas_pagar.cont_valpagar as Valor_Parcela, cont' +
        'as_pagar.cont_datvenc as data_Vencimento,contas_pagar.cont_valpa' +
        'go as Valor_Pago,'
      
        'contas_pagar.cont_datpag as Data_Pagamento from contas_pagar, fo' +
        'rnecedor where fornecedor.for_cod = contas_pagar.for_cod'
      
        'plan join(fornecedor natural,contas_pagar index(XPKCONTAS_PAGAR)' +
        ')')
    Left = 336
    Top = 192
  end
  object dsContas_Pagar: TDataSource
    DataSet = qryContas_Pagar
    Left = 424
    Top = 192
  end
end
