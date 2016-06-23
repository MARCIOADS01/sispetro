inherited frmCadastroImpostos: TfrmCadastroImpostos
  Caption = 'Cadastro de Impostos'
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
          FocusControl = dbeCodigoImposto
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 75
          Height = 13
          Caption = 'Tipo de imposto'
          FocusControl = dbeTipoImposto
        end
        object Label3: TLabel
          Left = 8
          Top = 88
          Width = 65
          Height = 13
          Caption = 'Percentual %'
          FocusControl = dbePercentualImposto
        end
        object dbeCodigoImposto: TDBEdit
          Left = 8
          Top = 24
          Width = 75
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ID'
          DataSource = dsDados
          Enabled = False
          TabOrder = 0
        end
        object dbeTipoImposto: TDBEdit
          Left = 8
          Top = 63
          Width = 251
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPO_IMPOSTO'
          DataSource = dsDados
          TabOrder = 1
        end
        object dbePercentualImposto: TDBEdit
          Left = 8
          Top = 104
          Width = 75
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PERCENTUAL'
          DataSource = dsDados
          TabOrder = 2
          OnKeyPress = dbePercentualImpostoKeyPress
        end
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmPrincipal.cdsImpostos
    Left = 608
    Top = 216
  end
end
