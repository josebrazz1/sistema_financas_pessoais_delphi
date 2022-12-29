object formOrcamento: TformOrcamento
  Left = 292
  Top = 111
  BorderStyle = bsSingle
  Caption = 'Or'#231'amento'
  ClientHeight = 561
  ClientWidth = 884
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 900
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    884
    561)
  PixelsPerInch = 96
  TextHeight = 13
  object labelGerarOrcamento: TLabel
    Left = 568
    Top = 8
    Width = 299
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Ainda n'#227'o foi gerado or'#231'amento para este m'#234's'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labelDataPesquisaOrc: TLabel
    Left = 8
    Top = 24
    Width = 29
    Height = 16
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object stringGridOrcamento: TStringGrid
    Left = 8
    Top = 72
    Width = 869
    Height = 417
    Cursor = crHandPoint
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnShadow
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    TabOrder = 0
    OnDrawCell = stringGridOrcamentoDrawCell
    OnKeyDown = stringGridOrcamentoKeyDown
    OnSelectCell = stringGridOrcamentoSelectCell
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 495
    Width = 145
    Height = 57
    Anchors = [akLeft, akBottom]
    Caption = '&Salvar'
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
    Left = 176
    Top = 495
    Width = 145
    Height = 57
    Anchors = [akLeft, akBottom]
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 728
    Top = 493
    Width = 145
    Height = 57
    Anchors = [akRight, akBottom]
    Caption = '&Atualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn3Click
    Kind = bkRetry
  end
  object btnGerarOrcamento: TBitBtn
    Left = 728
    Top = 24
    Width = 147
    Height = 41
    Anchors = [akTop, akRight]
    Caption = '&Gerar or'#231'amento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnGerarOrcamentoClick
    Kind = bkAll
  end
  object BitBtn4: TBitBtn
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 88
    Top = 40
    Width = 75
    Height = 25
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object mskDataInicioOrc: TMaskEdit
    Left = 168
    Top = 40
    Width = 120
    Height = 22
    EditMask = '!99/99/0000;2;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 7
    Text = '  /  /    '
    Visible = False
  end
  object mskDataFinalOrc: TMaskEdit
    Left = 296
    Top = 40
    Width = 120
    Height = 22
    EditMask = '!99/99/0000;2;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 8
    Text = '  /  /    '
    Visible = False
  end
end
