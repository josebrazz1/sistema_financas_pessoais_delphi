object formCadReceita: TformCadReceita
  Left = 303
  Top = 64
  BorderStyle = bsSingle
  Caption = 'Receita'
  ClientHeight = 561
  ClientWidth = 984
  Color = clInactiveCaption
  Constraints.MinHeight = 600
  Constraints.MinWidth = 1000
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    984
    561)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 720
    Top = 272
    Width = 257
    Height = 66
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 720
    Top = 8
    Width = 257
    Height = 258
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 8
    Top = 8
    Width = 705
    Height = 257
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 192
    Top = 112
    Width = 62
    Height = 16
    Caption = 'Categoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 368
    Top = 112
    Width = 85
    Height = 16
    Caption = 'Subcategoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 112
    Width = 37
    Height = 16
    Caption = 'Conta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 576
    Top = 112
    Width = 93
    Height = 16
    Caption = 'Pago/recebido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 272
    Width = 72
    Height = 16
    Caption = 'Data Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 136
    Top = 272
    Width = 65
    Height = 16
    Caption = 'Data Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labelDataPesquisa: TLabel
    Left = 272
    Top = 288
    Width = 118
    Height = 16
    Caption = 'labelDataPesquisa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labelContagemRegistrosStringGrid: TLabel
    Left = 10
    Top = 540
    Width = 134
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'N'#250'mero de resgistros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TLabel
    Left = 849
    Top = 64
    Width = 57
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Exclus'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label7: TLabel
    Left = 16
    Top = 160
    Width = 33
    Height = 16
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labelSomaValoresClicados: TLabel
    Left = 728
    Top = 280
    Width = 6
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labelValorFormatado: TLabel
    Left = 56
    Top = 160
    Width = 24
    Height = 16
    Caption = '(R$)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object stringGridTotalCategoriaMes: TStringGrid
    Left = 728
    Top = 16
    Width = 241
    Height = 113
    Cursor = crHandPoint
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnShadow
    ColCount = 1
    FixedColor = clBackground
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 31
    Visible = False
    OnDblClick = stringGridTotalCategoriaMesDblClick
    OnDrawCell = stringGridTotalCategoriaMesDrawCell
  end
  object stringGridTotalSubCategoriaMes: TStringGrid
    Left = 728
    Top = 144
    Width = 241
    Height = 113
    Cursor = crHandPoint
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
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
    ParentFont = False
    TabOrder = 32
    Visible = False
    OnDrawCell = stringGridTotalSubCategoriaMesDrawCell
  end
  object StaticText2: TStaticText
    Left = 16
    Top = 16
    Width = 33
    Height = 20
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 30
  end
  object cbCategoria: TComboBox
    Left = 192
    Top = 128
    Width = 110
    Height = 22
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 4
    OnChange = cbCategoriaChange
  end
  object cbSubcategoria: TComboBox
    Left = 368
    Top = 128
    Width = 110
    Height = 22
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 5
    OnChange = cbSubcategoriaChange
  end
  object cbConta: TComboBox
    Left = 16
    Top = 128
    Width = 110
    Height = 22
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 3
  end
  object cbPagoRecebido: TComboBox
    Left = 576
    Top = 128
    Width = 129
    Height = 22
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 6
  end
  object btnOk: TBitBtn
    Left = 16
    Top = 216
    Width = 150
    Height = 41
    Caption = '&Inserir'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 5
    ParentFont = False
    TabOrder = 8
    OnClick = btnOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCancelar: TBitBtn
    Left = 555
    Top = 216
    Width = 150
    Height = 41
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    TabStop = False
    OnClick = btnCancelarClick
    Kind = bkCancel
  end
  object stringGridTransacoes: TStringGrid
    Left = 8
    Top = 344
    Width = 970
    Height = 189
    Cursor = crHandPoint
    TabStop = False
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
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 15
    OnDrawCell = stringGridTransacoesDrawCell
    OnMouseDown = stringGridTransacoesMouseDown
  end
  object btnPesquisarPorData: TBitBtn
    Left = 8
    Top = 312
    Width = 249
    Height = 25
    Caption = '&Pesquisar'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 6
    ParentFont = False
    TabOrder = 12
    TabStop = False
    OnClick = btnPesquisarPorDataClick
    NumGlyphs = 2
  end
  object mskDataInicio: TMaskEdit
    Left = 8
    Top = 288
    Width = 118
    Height = 22
    TabStop = False
    EditMask = '!99/99/0000;2;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 10
    Text = '  /  /    '
  end
  object mskDataFinal: TMaskEdit
    Left = 136
    Top = 288
    Width = 118
    Height = 22
    TabStop = False
    EditMask = '!99/99/0000;2;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 11
    Text = '  /  /    '
  end
  object rdReceitaFixa: TRadioButton
    Left = 599
    Top = 16
    Width = 106
    Height = 17
    Caption = 'Receita fixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = rdReceitaFixaClick
  end
  object rdNormal: TRadioButton
    Left = 519
    Top = 16
    Width = 74
    Height = 17
    Caption = 'Normal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    OnClick = rdNormalClick
  end
  object btnHoje: TBitBtn
    Left = 144
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Hoje'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    TabStop = False
    OnClick = btnHojeClick
  end
  object btnMesAnterior: TBitBtn
    Left = 272
    Top = 312
    Width = 75
    Height = 25
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    TabStop = False
    OnClick = btnMesAnteriorClick
  end
  object btnMesPosterior: TBitBtn
    Left = 352
    Top = 312
    Width = 75
    Height = 25
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    TabStop = False
    OnClick = btnMesPosteriorClick
  end
  object btnAddConta: TBitBtn
    Left = 128
    Top = 128
    Width = 41
    Height = 25
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
    TabStop = False
    OnClick = btnAddContaClick
  end
  object btnAddCategoria: TBitBtn
    Left = 304
    Top = 128
    Width = 41
    Height = 25
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 23
    TabStop = False
    OnClick = btnAddCategoriaClick
  end
  object btnAddsubcategoria: TBitBtn
    Left = 480
    Top = 128
    Width = 41
    Height = 25
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 24
    TabStop = False
    OnClick = btnAddsubcategoriaClick
  end
  object btnCancelarAlteracao: TBitBtn
    Left = 176
    Top = 216
    Width = 150
    Height = 41
    Caption = '&Cancelar alter.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    TabStop = False
    OnClick = btnCancelarAlteracaoClick
    Kind = bkIgnore
  end
  object btnAlterar: TBitBtn
    Left = 16
    Top = 216
    Width = 150
    Height = 41
    Caption = '&Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    TabStop = False
    Visible = False
    OnClick = btnAlterarClick
    Kind = bkOK
  end
  object txtId: TLabeledEdit
    Left = 849
    Top = 352
    Width = 121
    Height = 22
    TabStop = False
    Anchors = [akTop, akRight]
    EditLabel.Width = 13
    EditLabel.Height = 16
    EditLabel.Caption = 'ID'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Arial'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 25
    Visible = False
  end
  object btnDeletar: TBitBtn
    Left = 336
    Top = 216
    Width = 150
    Height = 41
    Caption = '&Deletar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    TabStop = False
    Visible = False
    OnClick = btnDeletarClick
    Kind = bkCancel
  end
  object cbTransacoesExclusao: TComboBox
    Left = 849
    Top = 400
    Width = 121
    Height = 22
    Anchors = [akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 26
    TabStop = False
    Visible = False
  end
  object ckNormal: TCheckBox
    Left = 849
    Top = 432
    Width = 97
    Height = 17
    TabStop = False
    Anchors = [akTop, akRight]
    Caption = 'Normal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 27
    Visible = False
  end
  object ckFixa: TCheckBox
    Left = 849
    Top = 448
    Width = 113
    Height = 17
    TabStop = False
    Anchors = [akTop, akRight]
    Caption = 'Despesa fixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 28
    Visible = False
  end
  object ckCcr: TCheckBox
    Left = 849
    Top = 464
    Width = 121
    Height = 17
    TabStop = False
    Anchors = [akTop, akRight]
    Caption = 'Ccr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 29
    Visible = False
  end
  object txtData: TMaskEdit
    Left = 16
    Top = 32
    Width = 110
    Height = 22
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    Text = '  /  /    '
  end
  object txtValor: TMaskEdit
    Left = 16
    Top = 176
    Width = 110
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnChange = txtValorChange
    OnKeyPress = txtValorKeyPress
  end
  object cbDescricao: TComboBox
    Left = 576
    Top = 80
    Width = 129
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 2
    OnChange = cbDescricaoChange
    OnExit = cbDescricaoExit
  end
  object txtDescricao: TLabeledEdit
    Left = 16
    Top = 80
    Width = 553
    Height = 22
    EditLabel.Width = 62
    EditLabel.Height = 16
    EditLabel.Caption = 'Descri'#231#227'o'
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
    TabOrder = 1
    OnKeyUp = txtDescricaoKeyUp
  end
  object btnAbreCalc: TBitBtn
    Left = 128
    Top = 176
    Width = 41
    Height = 25
    Caption = '+%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 33
    TabStop = False
    OnClick = btnAbreCalcClick
  end
  object txtCampoPesquisa: TLabeledEdit
    Left = 448
    Top = 312
    Width = 265
    Height = 22
    EditLabel.Width = 57
    EditLabel.Height = 16
    EditLabel.Caption = 'Pesquisa'
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
    TabOrder = 34
    OnExit = txtCampoPesquisaExit
    OnKeyUp = txtCampoPesquisaKeyUp
  end
  object btnAbreDespesa: TBitBtn
    Left = 496
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Despesa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 35
    OnClick = btnAbreDespesaClick
  end
end
