object frmRelPedido: TfrmRelPedido
  Left = 277
  Top = 171
  Width = 274
  Height = 134
  Caption = 'Relat'#243'rio de Pedidos'
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
  object Label20: TLabel
    Left = 19
    Top = 11
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object Label1: TLabel
    Left = 139
    Top = 11
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object dtpDtaInicial: TDateTimePicker
    Left = 19
    Top = 27
    Width = 98
    Height = 21
    Date = 39261.926910798610000000
    Time = 39261.926910798610000000
    TabOrder = 0
  end
  object dtpDtaFinal: TDateTimePicker
    Left = 139
    Top = 27
    Width = 98
    Height = 21
    Date = 39261.926910798610000000
    Time = 39261.926910798610000000
    TabOrder = 1
  end
  object bitSair: TBitBtn
    Left = 147
    Top = 56
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 2
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
    Left = 19
    Top = 56
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 3
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
  object ibqRelPed: TIBQuery
    Database = dmSYS.ibdSYS_DATABASE
    Transaction = dmSYS.ibtSYS_DATABASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PEDIDO'
      'where PEDIDO.PED_DAT between :data_inicial and :data_final')
    Left = 152
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data_inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data_final'
        ParamType = ptUnknown
      end>
  end
  object rvdsPedido: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ibqRelPed
    Left = 120
    Top = 56
  end
  object rvpRelPed: TRvProject
    ProjectFile = '..\Relatorios\RelPedido.rav'
    Left = 88
    Top = 56
  end
end
