object formCadConta: TformCadConta
  Left = 462
  Top = 239
  BorderStyle = bsSingle
  Caption = 'Nova conta'
  ClientHeight = 261
  ClientWidth = 384
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  DesignSize = (
    384
    261)
  PixelsPerInch = 96
  TextHeight = 13
  object txtNomeCategoria: TLabeledEdit
    Left = 8
    Top = 24
    Width = 369
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 96
    EditLabel.Height = 16
    EditLabel.Caption = 'Nome da conta'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Arial'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 208
    Width = 150
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = '&Inserir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkYes
  end
  object btnCancelar: TBitBtn
    Left = 224
    Top = 208
    Width = 150
    Height = 41
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnCancelarClick
    Kind = bkNo
  end
end
