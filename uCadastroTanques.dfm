inherited frmCadastroTanque: TfrmCadastroTanque
  Caption = 'Cadastro de tanques de combustiveis'
  OnCreate = FormCreate
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
          FocusControl = dbeCodigoTanque
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 79
          Height = 13
          Caption = 'Nome do tanque'
          FocusControl = dbeNomeTanque
        end
        object Label3: TLabel
          Left = 8
          Top = 88
          Width = 107
          Height = 13
          Caption = 'C'#243'digo do combustivel'
          FocusControl = dbeCodigoCombustivel
        end
        object dbeCodigoTanque: TDBEdit
          Left = 6
          Top = 21
          Width = 81
          Height = 21
          DataField = 'ID'
          DataSource = dsDados
          Enabled = False
          TabOrder = 0
        end
        object dbeNomeTanque: TDBEdit
          Left = 8
          Top = 64
          Width = 394
          Height = 21
          DataField = 'NOME_TANQUE'
          DataSource = dsDados
          TabOrder = 1
        end
        object dbeCodigoCombustivel: TDBEdit
          Left = 6
          Top = 107
          Width = 81
          Height = 21
          DataField = 'COMBUSTIVEL_ID'
          DataSource = dsDados
          TabOrder = 2
        end
        object dblCombustivel: TDBLookupComboBox
          Left = 93
          Top = 107
          Width = 190
          Height = 21
          DataField = 'COMBUSTIVEL_ID'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'NOME_COMBUSTIVEL'
          ListSource = dsLookupCombustivel
          TabOrder = 3
        end
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmPrincipal.cdsTanques
    Left = 592
    Top = 232
  end
  object dsLookupCombustivel: TDataSource
    Left = 589
    Top = 176
  end
end
