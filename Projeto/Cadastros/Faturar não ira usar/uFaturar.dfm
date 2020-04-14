object frmFaturar: TfrmFaturar
  Left = 251
  Top = 179
  Width = 699
  Height = 402
  BorderIcons = [biSystemMenu]
  Caption = 'Faturar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 6
    Width = 43
    Height = 16
    Caption = 'Mesa:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 114
    Top = 4
    Width = 38
    Height = 16
    Caption = 'Itens:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 587
    Top = 108
    Width = 59
    Height = 16
    Caption = 'Dinheiro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtCheque: TLabel
    Left = 586
    Top = 156
    Width = 54
    Height = 16
    Caption = 'Cheque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ListBox2: TListBox
    Left = 8
    Top = 21
    Width = 97
    Height = 340
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      'Mesa - 01'
      'Mesa - 02'
      'Mesa - 03'
      'Mesa - 04'
      'Mesa - 05'
      'Mesa - 06'
      'Mesa - 07'
      'Mesa - 08'
      'Mesa - 09'
      'Mesa - 10'
      'Mesa - 11'
      'Mesa - 12'
      'Mesa - 13'
      'Mesa - 14'
      'Mesa - 15'
      'Mesa - 16'
      'Mesa - 17'
      'Mesa - 18'
      'Mesa - 19'
      'Mesa - 20'
      'Mesa - 21')
    ParentFont = False
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 112
    Top = 22
    Width = 465
    Height = 340
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Nome'
        Width = 248
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Qtde Pedido'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Valor Total'
        Visible = True
      end>
  end
  object edtDinheiro: TEdit
    Left = 586
    Top = 126
    Width = 97
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 586
    Top = 174
    Width = 97
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object bitFarurar: TBitBtn
    Left = 584
    Top = 24
    Width = 97
    Height = 33
    Caption = '&Faturar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
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
  object BitBtn1: TBitBtn
    Left = 584
    Top = 64
    Width = 97
    Height = 33
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
      993337777F777F3377F3393999707333993337F77737333337FF993399933333
      399377F3777FF333377F993339903333399377F33737FF33377F993333707333
      399377F333377FF3377F993333101933399377F333777FFF377F993333000993
      399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
      99333773FF777F777733339993707339933333773FF7FFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
  end
end
