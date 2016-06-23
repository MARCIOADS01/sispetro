inherited frmMovimentoAbastecimentoRelatorio: TfrmMovimentoAbastecimentoRelatorio
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 124
  ClientWidth = 259
  OnShow = FormShow
  ExplicitWidth = 265
  ExplicitHeight = 153
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object Label2: TLabel
    Left = 136
    Top = 5
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object Panel1: TPanel
    Left = 0
    Top = 83
    Width = 259
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 93
    ExplicitWidth = 359
    object btnVisualizar: TButton
      Left = 30
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 0
      OnClick = btnVisualizarClick
    end
    object btnImprimir: TButton
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = btnVisualizarClick
    end
  end
  object dtInicial: TDateTimePicker
    Left = 8
    Top = 24
    Width = 113
    Height = 21
    Date = 0.764665902781416700
    Time = 0.764665902781416700
    TabOrder = 1
  end
  object dtFinal: TDateTimePicker
    Left = 136
    Top = 24
    Width = 113
    Height = 21
    Date = 42098.764665902780000000
    Time = 42098.764665902780000000
    TabOrder = 2
  end
end
