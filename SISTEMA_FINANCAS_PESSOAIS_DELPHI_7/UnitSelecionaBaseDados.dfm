object formSelecaoBaseDados: TformSelecaoBaseDados
  Left = 569
  Top = 200
  BorderStyle = bsSingle
  Caption = 'Sele'#231#227'o da base de dados'
  ClientHeight = 261
  ClientWidth = 284
  Color = clBtnFace
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 300
  Constraints.MinHeight = 300
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 196
    Height = 16
    Caption = 'Conex'#227'o com a base de dados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbSelecaoBD: TComboBox
    Left = 24
    Top = 32
    Width = 241
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    OnChange = cbSelecaoBDChange
    Items.Strings = (
      'FINANCAS_PESSOAIS_BD1_TESTE.mdb'
      'FINANCAS_PESSOAIS_BD1_PRINCIPAL.mdb')
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 128
    Width = 241
    Height = 49
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Buscar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn3: TBitBtn
    Left = 25
    Top = 185
    Width = 241
    Height = 49
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn3Click
    Kind = bkCancel
  end
  object XPManifest1: TXPManifest
    Left = 120
    Top = 96
  end
end
