object dmDados: TdmDados
  OldCreateOrder = False
  Left = 195
  Top = 118
  Height = 150
  Width = 260
  object bdCon: TADOConnection
    LoginPrompt = False
    Left = 8
    Top = 8
  end
  object query: TADOQuery
    Connection = bdCon
    Parameters = <>
    Left = 56
    Top = 8
  end
  object dataSet: TADODataSet
    Connection = bdCon
    Parameters = <>
    Left = 120
    Top = 8
  end
end
