inherited frmCheque: TfrmCheque
  Left = 229
  Top = 159
  Caption = 'Cadastro de Cheque'
  ClientHeight = 382
  ClientWidth = 556
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 556
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
      DataSource = dmSYS.dsCheque
      Hints.Strings = ()
      OnClick = dbnNavegacaoClick
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Width = 556
    Height = 341
    OnChanging = pgcPadraoCadChanging
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object Label1: TLabel
        Left = 157
        Top = 69
        Width = 39
        Height = 13
        Caption = 'Ag'#234'ncia'
        FocusControl = dbeAgencia
      end
      object Label2: TLabel
        Left = 109
        Top = 69
        Width = 31
        Height = 13
        Caption = 'Banco'
        FocusControl = dbeBanco
      end
      object Label3: TLabel
        Left = 301
        Top = 69
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = dbeNunCheque
      end
      object Label4: TLabel
        Left = 386
        Top = 69
        Width = 24
        Height = 13
        Caption = 'Valor'
        FocusControl = dbeValor
      end
      object Label5: TLabel
        Left = 109
        Top = 112
        Width = 78
        Height = 13
        Caption = 'Data da Entrada'
      end
      object Label6: TLabel
        Left = 3
        Top = 152
        Width = 92
        Height = 13
        Caption = 'Data para Dep'#243'sito'
      end
      object Label7: TLabel
        Left = 3
        Top = 69
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label8: TLabel
        Left = 148
        Top = 152
        Width = 61
        Height = 13
        Caption = 'Observa'#231#227'o:'
      end
      object Label10: TLabel
        Left = 386
        Top = 24
        Width = 46
        Height = 13
        Caption = 'N'#186' Venda'
        FocusControl = dbeNVenda
      end
      object Label12: TLabel
        Left = 212
        Top = 69
        Width = 28
        Height = 13
        Caption = 'Conta'
        FocusControl = dbeConta
      end
      object Label13: TLabel
        Left = 3
        Top = 112
        Width = 80
        Height = 13
        Caption = 'Data de Emiss'#227'o'
      end
      object Label14: TLabel
        Left = 212
        Top = 112
        Width = 81
        Height = 13
        Caption = 'Emitente Cheque'
        FocusControl = dbeEmitente
      end
      object dbeAgencia: TDBEdit
        Left = 155
        Top = 85
        Width = 51
        Height = 21
        DataField = 'CHE_AGEN'
        DataSource = dmSYS.dsCheque
        MaxLength = 4
        TabOrder = 4
      end
      object dbeBanco: TDBEdit
        Left = 109
        Top = 85
        Width = 40
        Height = 21
        DataField = 'CHE_BANCO'
        DataSource = dmSYS.dsCheque
        MaxLength = 3
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
      end
      object dbeNunCheque: TDBEdit
        Left = 301
        Top = 85
        Width = 75
        Height = 21
        DataField = 'CHE_NUM'
        DataSource = dmSYS.dsCheque
        MaxLength = 6
        TabOrder = 6
        OnEnter = dbeNunChequeEnter
      end
      object dbeValor: TDBEdit
        Left = 386
        Top = 85
        Width = 134
        Height = 21
        DataField = 'CHE_VALOR'
        DataSource = dmSYS.dsCheque
        TabOrder = 7
      end
      object dbeNVenda: TDBEdit
        Left = 386
        Top = 40
        Width = 97
        Height = 21
        DataField = 'PED_COD'
        DataSource = dmSYS.dsCheque
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 3
        Width = 372
        Height = 62
        Caption = 'Cliente'
        TabOrder = 0
        object Label9: TLabel
          Left = 8
          Top = 15
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbeCodCli
        end
        object Label11: TLabel
          Left = 88
          Top = 15
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object dbeCodCli: TDBEdit
          Left = 8
          Top = 31
          Width = 71
          Height = 21
          DataField = 'CLI_COD'
          DataSource = dmSYS.dsCheque
          TabOrder = 1
          OnChange = dbeCodCliChange
          OnDblClick = bitConsCliClick
        end
        object pnNomCli: TPanel
          Left = 88
          Top = 31
          Width = 241
          Height = 23
          Alignment = taLeftJustify
          TabOrder = 2
        end
        object bitConsCli: TBitBtn
          Left = 333
          Top = 21
          Width = 32
          Height = 32
          TabOrder = 0
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
      end
      object dbcbTipo: TDBComboBox
        Left = 3
        Top = 85
        Width = 100
        Height = 21
        DataField = 'CHE_TIP'
        DataSource = dmSYS.dsCheque
        ItemHeight = 13
        Items.Strings = (
          'A Vista'
          'A Prazo')
        TabOrder = 2
      end
      object dbeConta: TDBEdit
        Left = 212
        Top = 85
        Width = 85
        Height = 21
        Hint = 'Digite Apenas N'#250'meros'
        DataField = 'CHE_CONTA'
        DataSource = dmSYS.dsCheque
        MaxLength = 9
        ReadOnly = True
        TabOrder = 5
      end
      object dbmObs: TDBMemo
        Left = 212
        Top = 152
        Width = 327
        Height = 35
        DataField = 'CHE_OBS'
        DataSource = dmSYS.dsCheque
        TabOrder = 11
      end
      object dtpEmissao: TDateTimePicker
        Left = 3
        Top = 128
        Width = 100
        Height = 21
        Date = 39312.557740335650000000
        Time = 39312.557740335650000000
        TabOrder = 8
      end
      object dtpEntrada: TDateTimePicker
        Left = 109
        Top = 128
        Width = 100
        Height = 21
        Date = 39312.557740335650000000
        Time = 39312.557740335650000000
        TabOrder = 9
      end
      object dtpParaDeposito: TDateTimePicker
        Left = 3
        Top = 168
        Width = 100
        Height = 21
        Date = 39312.557740335650000000
        Time = 39312.557740335650000000
        TabOrder = 10
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 194
        Width = 538
        Height = 119
        Caption = 'Situa'#231#227'o'
        TabOrder = 12
        OnEnter = GroupBox2Enter
        OnExit = GroupBox2Exit
        object sbExcluir: TSpeedButton
          Left = 5
          Top = 18
          Width = 23
          Height = 22
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
          OnClick = sbExcluirClick
        end
        object dbgSitCheque: TDBGrid
          Left = 31
          Top = 16
          Width = 503
          Height = 98
          DataSource = dmSYS.dsDep_Cheque
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnEnter = dbgSitChequeEnter
          Columns = <
            item
              Expanded = False
              FieldName = 'DEP_SIT'
              PickList.Strings = (
                'Depositado'
                'Sem Fundo'
                'Sustado')
              Title.Caption = 'Tipo'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEP_LANC'
              Title.Caption = 'Data Lan'#231'amento'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEP_DEP'
              Title.Caption = 'Data Deposito'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEP_OBS'
              Title.Caption = 'Observa'#231#227'o'
              Width = 195
              Visible = True
            end>
        end
      end
      object bitConsCheque: TBitBtn
        Left = 509
        Top = 30
        Width = 32
        Height = 32
        TabOrder = 13
        OnClick = bitConsChequeClick
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
      object dbeEmitente: TDBEdit
        Left = 212
        Top = 128
        Width = 327
        Height = 21
        DataField = 'CHE_NOM_EMIT'
        DataSource = dmSYS.dsCheque
        TabOrder = 14
      end
    end
    inherited tbsConsulta: TTabSheet
      ImageIndex = 0
      OnShow = tbsConsultaShow
      object Label15: TLabel [0]
        Left = 5
        Top = 3
        Width = 54
        Height = 13
        Caption = 'Buscar por:'
      end
      object lbNome: TLabel [1]
        Left = 160
        Top = 3
        Width = 28
        Height = 13
        Caption = 'Nome'
        Visible = False
      end
      object lbdateIni: TLabel [2]
        Left = 160
        Top = 3
        Width = 27
        Height = 13
        Caption = 'Inicial'
        Visible = False
      end
      object lbDateFim: TLabel [3]
        Left = 280
        Top = 3
        Width = 22
        Height = 13
        Caption = 'Final'
        Visible = False
      end
      object lbConta: TLabel [4]
        Left = 160
        Top = 3
        Width = 28
        Height = 13
        Caption = 'Conta'
        Visible = False
      end
      inherited dbgCons: TDBGrid
        Top = 48
        Width = 548
        Height = 265
        Align = alNone
        DataSource = dsConsulta
      end
      object cbFiltro: TComboBox
        Left = 5
        Top = 20
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbFiltroChange
        Items.Strings = (
          'Cliente'
          'Emitente do Cheque'
          'Data Emiss'#227'o'
          'Data Entrada'
          'Data para Deposito'
          'Conta')
      end
      object edtBusc: TEdit
        Left = 160
        Top = 20
        Width = 297
        Height = 21
        TabOrder = 2
        Visible = False
        OnChange = edtBuscChange
      end
      object dtpIni: TDateTimePicker
        Left = 160
        Top = 20
        Width = 100
        Height = 21
        Date = 37595.359135081020000000
        Time = 37595.359135081020000000
        TabOrder = 3
        Visible = False
      end
      object dtpFim: TDateTimePicker
        Left = 280
        Top = 20
        Width = 100
        Height = 21
        Date = 37595.359580393520000000
        Time = 37595.359580393520000000
        TabOrder = 4
        Visible = False
      end
      object edtConta: TEdit
        Left = 160
        Top = 20
        Width = 120
        Height = 21
        MaxLength = 9
        TabOrder = 5
        Visible = False
        OnChange = edtBuscChange
      end
      object bitokdtp: TBitBtn
        Left = 398
        Top = 20
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
  object qryCheque: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select Cliente.cli_cod as Codigo, Cliente.cli_nom as Cliente, ch' +
        'eque.che_nom_emit as Emitente, cheque.che_dtaemi as Data_Emissao' +
        ', cheque.che_datent as Data_Entrada,cheque.che_datpdep as Data_P' +
        'ara_Deposito, cheque.che_banco as Banco,  cheque.che_agen as Age' +
        'ncia,  cheque.che_conta as Conta, cheque.che_num as Numero_Chequ' +
        'e, cheque.che_valor as Valor, cheque.ped_cod as Pedido'
      
        'from Cliente, cheque where Cheque.cli_cod=cliente.cli_cod order ' +
        'by Cliente.cli_nom')
    Left = 456
    Top = 40
  end
  object dsConsulta: TDataSource
    DataSet = qryCheque
    Left = 512
    Top = 40
  end
end
