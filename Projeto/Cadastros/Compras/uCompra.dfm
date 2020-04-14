inherited frmCompra: TfrmCompra
  Left = 301
  Top = 247
  Caption = 'Cadastro de Compras'
  ClientHeight = 354
  ClientWidth = 585
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 585
    ExplicitWidth = 585
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
      DataSource = dmSYS.dsCompra
      Hints.Strings = ()
      OnClick = dbnNavegacaoClick
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Width = 585
    Height = 313
    OnChanging = pgcPadraoCadChanging
    ExplicitWidth = 585
    ExplicitHeight = 313
    inherited tbsCadastro: TTabSheet
      OnShow = tbsCadastroShow
      object Label8: TLabel
        Left = 329
        Top = 5
        Width = 38
        Height = 13
        Caption = 'N'#186' Nota'
        FocusControl = dbeNroNF
      end
      object Label19: TLabel
        Left = 329
        Top = 83
        Width = 60
        Height = 13
        Caption = 'Data Emis'#227'o'
      end
      object Label20: TLabel
        Left = 447
        Top = 83
        Width = 63
        Height = 13
        Caption = 'Data Entrada'
      end
      object Label21: TLabel
        Left = 329
        Top = 44
        Width = 50
        Height = 13
        Caption = 'Valor Nota'
        FocusControl = dbeValNF
      end
      object Label22: TLabel
        Left = 210
        Top = 120
        Width = 39
        Height = 13
        Caption = '% Desc.'
        FocusControl = dbeDesc
      end
      object Label23: TLabel
        Left = 2
        Top = 121
        Width = 61
        Height = 13
        Caption = 'Valor do ICM'
        FocusControl = dbeNroNF
      end
      object Label24: TLabel
        Left = 70
        Top = 121
        Width = 55
        Height = 13
        Caption = 'Valor do IPI'
        FocusControl = dbeNroNF
      end
      object Label25: TLabel
        Left = 137
        Top = 121
        Width = 66
        Height = 13
        Caption = 'Valor do Frete'
        FocusControl = dbeNroNF
      end
      object Label26: TLabel
        Left = 266
        Top = 122
        Width = 61
        Height = 13
        Caption = 'Observa'#231#227'o:'
      end
      object pgcNF: TPageControl
        Left = 1
        Top = 160
        Width = 574
        Height = 129
        ActivePage = tbsItens
        TabOrder = 12
        object tbsItens: TTabSheet
          Caption = 'Itens'
          ImageIndex = 1
          OnEnter = tbsItensEnter
          OnExit = tbsItensExit
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object sbExcItensCompra: TSpeedButton
            Left = 0
            Top = 4
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
            OnClick = sbExcItensCompraClick
          end
          object dbgItens: TDBGrid
            Left = 24
            Top = -1
            Width = 542
            Height = 101
            Hint = 'Produtos'
            DataSource = dmSYS.dsItens_Compra
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = dbgItensDblClick
            OnEnter = dbgItensEnter
            OnExit = dbgItensExit
            OnKeyPress = dbgItensKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'PRO_COD'
                Title.Caption = 'C'#243'digo'
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeProduto'
                Title.Caption = 'Nome'
                Width = 199
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITCOM_QTD'
                Title.Caption = 'Qtde.'
                Width = 32
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITCOM_VAL'
                Title.Caption = 'Pre'#231'o'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITCOM_PERDESC'
                Title.Caption = '% Desc.'
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValTotal'
                Title.Caption = 'Pre'#231'o Total'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITCOM_ICM'
                Title.Caption = '% ICM'
                Width = 40
                Visible = True
              end>
          end
        end
        object tbsContPagar: TTabSheet
          Caption = 'Contas a Pagar'
          ImageIndex = 2
          OnEnter = tbsContPagarEnter
          OnExit = tbsContPagarExit
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object sbExcContPag: TSpeedButton
            Left = 0
            Top = 4
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
            OnClick = sbExcContPagClick
          end
          object dbgContPagar: TDBGrid
            Left = 24
            Top = 0
            Width = 541
            Height = 101
            Hint = 'Contas a Pagar'
            DataSource = dmSYS.dsContas_Pagar_Compras
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyPress = dbgContPagarKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'CONT_PARC'
                Title.Caption = 'Parcela'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONT_VALPAGAR'
                Title.Caption = 'Valor'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONT_DATVENC'
                Title.Caption = 'Dta. Venc.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONT_VALPAGO'
                Title.Caption = 'Valor Pago'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONT_DATPAG'
                Title.Caption = 'Data Pgto.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONT_OBS'
                Title.Caption = 'Observa'#231#227'o'
                Width = 115
                Visible = True
              end>
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 3
        Width = 324
        Height = 58
        Caption = 'Fornecedor'
        TabOrder = 0
        object Label6: TLabel
          Left = 4
          Top = 14
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object dbeCodFor: TDBEdit
          Left = 4
          Top = 30
          Width = 60
          Height = 21
          Ctl3D = True
          DataField = 'FOR_COD'
          DataSource = dmSYS.dsCompra
          ParentCtl3D = False
          TabOrder = 0
          OnChange = dbeCodForChange
          OnDblClick = bitConsForClick
          OnExit = dbeCodForExit
        end
        object pnNomFor: TPanel
          Left = 70
          Top = 29
          Width = 205
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 1
        end
        object bitConsFor: TBitBtn
          Left = 286
          Top = 20
          Width = 32
          Height = 32
          DoubleBuffered = True
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
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = bitConsForClick
        end
      end
      object dbeNroNF: TDBEdit
        Left = 329
        Top = 21
        Width = 85
        Height = 21
        DataField = 'COM_NRODOC'
        DataSource = dmSYS.dsCompra
        TabOrder = 1
        OnExit = dbeNroNFExit
      end
      object GroupBox4: TGroupBox
        Left = 2
        Top = 61
        Width = 324
        Height = 58
        HelpType = htKeyword
        Caption = 'C'#243'd. Fiscal'
        TabOrder = 2
        object Label17: TLabel
          Left = 4
          Top = 14
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel
          Left = 64
          Top = 14
          Width = 28
          Height = 13
          Caption = 'CFOP'
        end
        object Label3: TLabel
          Left = 105
          Top = 14
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object dbeCod_Fisc: TDBEdit
          Left = 4
          Top = 30
          Width = 60
          Height = 21
          DataField = 'FISC_COD'
          DataSource = dmSYS.dsCompra
          TabOrder = 0
          OnChange = dbeCod_FiscChange
          OnDblClick = bitConsCodFiscClick
        end
        object pnDecCod: TPanel
          Left = 105
          Top = 30
          Width = 190
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 1
        end
        object bitConsCodFisc: TBitBtn
          Left = 296
          Top = 24
          Width = 25
          Height = 25
          DoubleBuffered = True
          Glyph.Data = {
            BE060000424DBE060000000000003604000028000000170000001B0000000100
            0800000000008802000000000000000000000001000000000000FFFFFF00CCCC
            CC00BBBBBB00AAAAAA00CC999900888888007777770099666600666666005555
            5500444444006633330033333300222222001111110000000000C0C0C0000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000101010101010
            1010101010101010101010101010101010001010101010100F0F0F0F0F0F0606
            10101010101010101000101010100F0F0101010400040F0F0606061010101010
            100010100F040101010101040004040404040F06101010101000100F04040101
            0101010400040404040404060610101010001004040401010F0F0F0F0F0F0404
            040404060610101010000F0404040F0F0000000000000F0F0404040F06101010
            10000F040B0F0002060606060605000006050B0F0606101010000F0000000404
            04040404040404040F00000F0606061010000F00000F04040404040400000404
            040F000F0606061010000F000F040704040404040404000407040F0F06061010
            10000F000F040407040404040404000704040F0F0606101010000F000F040404
            010707070707070404040F0F0610101010000F00000F04040404040404040404
            040F000F061010101000100F00000F0F040404040404040F0000001010101010
            100010100F0000000F0F0F0F0F0F0F0000000F101010101010001010100F0000
            00000000000000000F0F0506101010101000101010100F0F000000000000000F
            0202020F0610101010001010101010100F0F0F0F0F0F0F020002020F0F101010
            100010101010101010101010101010100F0E0C0F0F0F06021000101010101010
            1010101010101010100F0D0F0F0F0F0610001010101010101010101010101010
            10100F0D0F0F0F0F10001010101010101010101010101010101010060D0F0F0F
            100010101010101010101010101010101010100D060F0F0F1000101010101010
            1010101010101010101010100F0F0F1010001010101010101010101010101010
            1010101010101010100010101010101010101010101010101010101010101010
            1000}
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = bitConsCodFiscClick
        end
        object pnCFOP: TPanel
          Left = 64
          Top = 30
          Width = 40
          Height = 21
          TabOrder = 3
        end
      end
      object dtpDtaEmisao: TDateTimePicker
        Left = 329
        Top = 99
        Width = 97
        Height = 21
        Date = 39261.926910798610000000
        Time = 39261.926910798610000000
        TabOrder = 4
      end
      object dtpDtaEnt: TDateTimePicker
        Left = 447
        Top = 99
        Width = 98
        Height = 21
        Date = 39261.926910798610000000
        Time = 39261.926910798610000000
        TabOrder = 5
      end
      object dbeValNF: TDBEdit
        Left = 329
        Top = 60
        Width = 97
        Height = 21
        DataField = 'COM_VALNOT'
        DataSource = dmSYS.dsCompra
        TabOrder = 3
      end
      object dbeDesc: TDBEdit
        Left = 210
        Top = 136
        Width = 54
        Height = 21
        DataField = 'COM_PERDEC'
        DataSource = dmSYS.dsCompra
        TabOrder = 9
      end
      object dbeICM: TDBEdit
        Left = 2
        Top = 136
        Width = 65
        Height = 21
        DataField = 'COM_ICM'
        DataSource = dmSYS.dsCompra
        TabOrder = 6
      end
      object dbeIPI: TDBEdit
        Left = 70
        Top = 136
        Width = 65
        Height = 21
        DataField = 'COM_IPI'
        DataSource = dmSYS.dsCompra
        TabOrder = 7
      end
      object dbeFrete: TDBEdit
        Left = 137
        Top = 136
        Width = 71
        Height = 21
        DataField = 'COM_VALFRETE'
        DataSource = dmSYS.dsCompra
        TabOrder = 8
      end
      object dbmObs: TDBMemo
        Left = 329
        Top = 123
        Width = 216
        Height = 37
        DataField = 'COM_OBS'
        DataSource = dmSYS.dsCompra
        TabOrder = 10
      end
      object bitConsCompra: TBitBtn
        Left = 421
        Top = 14
        Width = 32
        Height = 32
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 11
        OnClick = bitConsCompraClick
      end
    end
    inherited tbsConsulta: TTabSheet
      OnShow = tbsConsultaShow
      object lbBusca: TLabel [0]
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
      object lbDtaIni: TLabel [1]
        Left = 161
        Top = 6
        Width = 27
        Height = 13
        Caption = 'Inicial'
        Visible = False
      end
      object lbDtaFim: TLabel [2]
        Left = 272
        Top = 6
        Width = 22
        Height = 13
        Caption = 'Final'
        Visible = False
      end
      object lbnota: TLabel [3]
        Left = 160
        Top = 6
        Width = 23
        Height = 13
        Caption = 'Nota'
        Visible = False
      end
      object lbfornecedor: TLabel [4]
        Left = 160
        Top = 6
        Width = 28
        Height = 13
        Caption = 'Nome'
        Visible = False
      end
      inherited dbgCons: TDBGrid
        Top = 48
        Width = 577
        Height = 237
        Align = alNone
        DataSource = dsConsulta
      end
      object cbFiltro: TComboBox
        Left = 2
        Top = 20
        Width = 145
        Height = 21
        TabOrder = 1
        OnChange = cbFiltroChange
        Items.Strings = (
          'Fornecedor'
          'Data Emis'#227'o'
          'Nota')
      end
      object dtpIni: TDateTimePicker
        Left = 160
        Top = 20
        Width = 106
        Height = 21
        Date = 39328.827461296300000000
        Time = 39328.827461296300000000
        TabOrder = 2
        Visible = False
      end
      object dtpFim: TDateTimePicker
        Left = 272
        Top = 20
        Width = 106
        Height = 21
        Date = 39328.827461296300000000
        Time = 39328.827461296300000000
        TabOrder = 3
        Visible = False
      end
      object edtNF: TEdit
        Left = 160
        Top = 20
        Width = 105
        Height = 21
        TabOrder = 4
        Visible = False
        OnChange = edtFornChange
      end
      object edtForn: TEdit
        Left = 160
        Top = 20
        Width = 310
        Height = 21
        TabOrder = 5
        Visible = False
        OnChange = edtFornChange
      end
      object bitokdtp: TBitBtn
        Left = 412
        Top = 20
        Width = 57
        Height = 21
        Caption = 'OK'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 6
        Visible = False
        OnClick = bitokdtpClick
      end
    end
  end
  object qryCompra: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    SQL.Strings = (
      
        'select compras.FOR_COD as Codigo, fornecedor.FOR_RAZ_SOC as Forn' +
        'ecedor, compras.com_nrodoc as Nota,  codigo_fiscal.CFOP1 as Cod_' +
        'Fiscal, compras.COM_VALNOT as Valor_Nota, compras.COM_DATEMI as ' +
        'Data_Emissao, compras.COM_DATENT as Data_Entrada,compras.COM_PER' +
        'DEC as Desconto from compras , fornecedor ,codigo_fiscal where f' +
        'ornecedor.for_cod = compras.for_cod and compras.fisc_cod= codigo' +
        '_fiscal.fisc_cod'
      'ORDER BY compras.FOR_COD, compras.com_nrodoc')
    Left = 484
    Top = 33
  end
  object dsConsulta: TDataSource
    DataSet = qryCompra
    Left = 540
    Top = 33
  end
end
