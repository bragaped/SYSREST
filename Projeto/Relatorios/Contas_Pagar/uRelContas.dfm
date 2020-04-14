object frmRelContasPagar: TfrmRelContasPagar
  Left = 330
  Top = 168
  Width = 303
  Height = 266
  Caption = 'Relat'#243'rio Contas a Pagar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 160
    Top = 25
    Width = 112
    Height = 13
    Caption = 'Data Vencimento Inicial'
  end
  object Label1: TLabel
    Left = 160
    Top = 73
    Width = 107
    Height = 13
    Caption = 'Data Vencimento Final'
  end
  object Label2: TLabel
    Left = 32
    Top = 140
    Width = 84
    Height = 13
    Caption = 'Fornecedor Inicial'
  end
  object Label3: TLabel
    Left = 176
    Top = 138
    Width = 79
    Height = 13
    Caption = 'Fornecedor Final'
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 16
    Width = 97
    Height = 105
    Caption = 'Situa'#231#227'o'
    TabOrder = 0
    object rdbAberto: TRadioButton
      Left = 16
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Aberto'
      TabOrder = 0
    end
    object rdbPago: TRadioButton
      Left = 16
      Top = 48
      Width = 57
      Height = 17
      Caption = 'Pago'
      TabOrder = 1
    end
    object rdbGeral: TRadioButton
      Left = 16
      Top = 72
      Width = 57
      Height = 17
      Caption = 'Geral'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  object dtpInicial: TDateTimePicker
    Left = 160
    Top = 40
    Width = 97
    Height = 21
    Date = 39312.566199178240000000
    Time = 39312.566199178240000000
    TabOrder = 1
  end
  object dtpFinal: TDateTimePicker
    Left = 160
    Top = 88
    Width = 97
    Height = 21
    Date = 39312.566199178240000000
    Time = 39312.566199178240000000
    TabOrder = 2
  end
  object bitSair: TBitBtn
    Left = 171
    Top = 200
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 3
    OnClick = bitSairClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
  end
  object bitOK: TBitBtn
    Left = 40
    Top = 200
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 4
    OnClick = bitOKClick
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
  object edtForInicial: TEdit
    Left = 32
    Top = 156
    Width = 73
    Height = 21
    TabOrder = 5
  end
  object edtForFinal: TEdit
    Left = 176
    Top = 154
    Width = 73
    Height = 21
    TabOrder = 6
  end
  object BitBtn2: TBitBtn
    Left = 121
    Top = 155
    Width = 24
    Height = 22
    TabOrder = 7
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
  object BitBtn1: TBitBtn
    Left = 257
    Top = 155
    Width = 24
    Height = 22
    TabOrder = 8
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
  object ibqRelContas: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select contas_pagar.*, fornecedor.for_nom_fant from contas_pagar' +
        ', fornecedor where contas_pagar.for_cod = fornecedor.for_cod')
    Left = 216
    Top = 176
  end
  object rvpRelContas: TRvProject
    ProjectFile = '..\Relatorios\RelContas.rav'
    Left = 152
    Top = 176
  end
  object rvdsRelContas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ibqRelContas
    Left = 184
    Top = 176
  end
end
