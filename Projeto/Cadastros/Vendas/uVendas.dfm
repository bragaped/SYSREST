inherited frmVendas: TfrmVendas
  Left = 198
  Top = 163
  Caption = 'Cadastro de Pedido'
  ClientHeight = 384
  ClientWidth = 581
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 581
    inherited dbnNavegacao: TDBNavigator
      Hints.Strings = ()
    end
    inherited bitSair: TBitBtn
      OnClick = bitSairClick
    end
  end
  inherited pgcPadraoCad: TPageControl
    Width = 581
    Height = 343
    inherited tbsCadastro: TTabSheet
      object Label2: TLabel
        Left = 447
        Top = 20
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 335
        Top = 77
        Width = 23
        Height = 13
        Caption = 'Nota'
        FocusControl = DBEdit2
      end
      object Label4: TLabel
        Left = 447
        Top = 78
        Width = 56
        Height = 13
        Caption = 'N'#176' da Mesa'
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 335
        Top = 22
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label7: TLabel
        Left = 335
        Top = 122
        Width = 51
        Height = 13
        Caption = 'Valor Total'
        FocusControl = DBEdit5
      end
      object Label8: TLabel
        Left = 195
        Top = 122
        Width = 101
        Height = 13
        Caption = 'Forma de Pagamento'
      end
      object Label9: TLabel
        Left = 8
        Top = 122
        Width = 42
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 3
        Width = 324
        Height = 58
        Caption = 'Cliente'
        TabOrder = 0
        object Label6: TLabel
          Left = 4
          Top = 14
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object dbeCodCli: TDBEdit
          Left = 4
          Top = 30
          Width = 60
          Height = 21
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
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
          TabOrder = 2
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
      object pgcNF: TPageControl
        Left = 0
        Top = 162
        Width = 574
        Height = 153
        ActivePage = tbsItens
        TabOrder = 1
        object tbsItens: TTabSheet
          Caption = 'Itens'
          ImageIndex = 1
          object SpeedButton1: TSpeedButton
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
          end
          object dbgItens: TDBGrid
            Left = 24
            Top = 0
            Width = 542
            Height = 123
            DataSource = dmSYS.dsItens_Compra
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'PRO_COD'
                Title.Caption = 'C'#243'digo'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeProduto'
                Title.Caption = 'Nome'
                Width = 220
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITCOM_QTD'
                Title.Caption = 'Qtde.'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITCOM_VAL'
                Title.Caption = 'Pre'#231'o'
                Width = 75
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
                Width = 75
                Visible = True
              end>
          end
        end
        object tbsCheque: TTabSheet
          Caption = 'Cheque'
          ImageIndex = 2
          object SpeedButton2: TSpeedButton
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
          end
          object dbgContPagar: TDBGrid
            Left = 24
            Top = 0
            Width = 541
            Height = 122
            DataSource = dmSYS.dsCheque
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CHE_BANCO'
                Title.Caption = 'Banco'
                Width = 37
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHE_AGEN'
                Title.Caption = 'Ag'#234'ncia'
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHE_CONTA'
                Title.Caption = 'Conta'
                Width = 66
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHE_NUM'
                Title.Caption = 'N'#250'mero'
                Width = 61
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHE_DTAEMI'
                Title.Caption = 'Data Emiss'#227'o'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHE_VALOR'
                Title.Caption = 'Valor'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHE_TIP'
                Title.Caption = 'Forma Pagamento'
                Width = 92
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHE_OBS'
                Title.Caption = 'Observa'#231#227'o'
                Width = 278
                Visible = True
              end>
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 62
        Width = 324
        Height = 58
        Caption = 'Funcion'#225'rio'
        TabOrder = 2
        object Label1: TLabel
          Left = 4
          Top = 14
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object dbeCodFun: TDBEdit
          Left = 4
          Top = 30
          Width = 60
          Height = 21
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
        object Panel1: TPanel
          Left = 70
          Top = 29
          Width = 205
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 1
        end
        object BitBtn1: TBitBtn
          Left = 286
          Top = 20
          Width = 32
          Height = 32
          TabOrder = 2
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
      object DBEdit1: TDBEdit
        Left = 447
        Top = 36
        Width = 100
        Height = 21
        DataField = 'VEN_COD'
        DataSource = DataSource1
        TabOrder = 3
      end
      object DBEdit2: TDBEdit
        Left = 335
        Top = 93
        Width = 100
        Height = 21
        DataField = 'NRO_DOC'
        DataSource = DataSource1
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 447
        Top = 94
        Width = 60
        Height = 21
        DataField = 'MESA_COD'
        DataSource = DataSource1
        TabOrder = 5
      end
      object DBEdit5: TDBEdit
        Left = 335
        Top = 138
        Width = 100
        Height = 21
        DataField = 'VEN_VALTOTAL'
        DataSource = DataSource1
        TabOrder = 6
      end
      object DBComboBox1: TDBComboBox
        Left = 8
        Top = 138
        Width = 120
        Height = 21
        ItemHeight = 13
        Items.Strings = (
          'Aberto'
          'Fechamento'
          'Faturado')
        TabOrder = 7
      end
      object DBComboBox2: TDBComboBox
        Left = 195
        Top = 138
        Width = 130
        Height = 21
        ItemHeight = 13
        Items.Strings = (
          'Dinheiro'
          'Cheque')
        TabOrder = 8
      end
      object DateTimePicker1: TDateTimePicker
        Left = 335
        Top = 35
        Width = 100
        Height = 21
        Date = 39312.595913263890000000
        Time = 39312.595913263890000000
        TabOrder = 9
      end
    end
    inherited tbsConsulta: TTabSheet
      inherited dbgCons: TDBGrid
        Width = 573
        Height = 315
      end
    end
  end
  object IBTable1: TIBTable
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'VENDAS'
    Left = 364
    Top = 57
    object IBTable1VEN_COD: TIntegerField
      FieldName = 'VEN_COD'
    end
    object IBTable1MESA_COD: TIntegerField
      FieldName = 'MESA_COD'
    end
    object IBTable1CAI_NUM: TIntegerField
      FieldName = 'CAI_NUM'
    end
    object IBTable1FUN_COD: TIntegerField
      FieldName = 'FUN_COD'
    end
    object IBTable1CLI_COD: TIntegerField
      FieldName = 'CLI_COD'
    end
    object IBTable1NRO_DOC: TIntegerField
      FieldName = 'NRO_DOC'
    end
    object IBTable1VEN_DAT: TDateField
      FieldName = 'VEN_DAT'
    end
    object IBTable1VEN_VALTOTAL: TFloatField
      FieldName = 'VEN_VALTOTAL'
    end
    object IBTable1VEN_FRMPAG: TIntegerField
      FieldName = 'VEN_FRMPAG'
    end
    object IBTable1VEN_SIT: TIBStringField
      FieldName = 'VEN_SIT'
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 336
    Top = 56
  end
end
