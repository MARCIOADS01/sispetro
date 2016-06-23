inherited frmCombustiveis: TfrmCombustiveis
  Caption = 'Cadastro de Combustiveis'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    inherited tsGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 654
      ExplicitHeight = 372
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 654
      ExplicitHeight = 372
      inherited pnlDados: TPanel
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbeCodigoCombustivel
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = dbeNomeCombustivel
        end
        object Label3: TLabel
          Left = 8
          Top = 88
          Width = 40
          Height = 13
          Caption = 'Valor R$'
          FocusControl = dbeValorCombustivel
        end
        object dbeCodigoCombustivel: TDBEdit
          Left = 8
          Top = 24
          Width = 89
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ID'
          DataSource = dsDados
          Enabled = False
          TabOrder = 0
        end
        object dbeNomeCombustivel: TDBEdit
          Left = 8
          Top = 64
          Width = 199
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME_COMBUSTIVEL'
          DataSource = dsDados
          TabOrder = 1
        end
        object dbeValorCombustivel: TDBEdit
          Left = 8
          Top = 104
          Width = 89
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_COMBUSTIVEL'
          DataSource = dsDados
          TabOrder = 2
          OnKeyPress = dbeValorCombustivelKeyPress
        end
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmPrincipal.cdsCombustiveis
    Left = 600
    Top = 176
  end
end
