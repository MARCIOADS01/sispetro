inherited frmCadastroBombas: TfrmCadastroBombas
  Caption = 'Cadastro de bombas '
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
          FocusControl = dbeCodigoBomba
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 77
          Height = 13
          Caption = 'Nome da bomba'
          FocusControl = dbeNomeBomba
        end
        object Label3: TLabel
          Left = 8
          Top = 88
          Width = 85
          Height = 13
          Caption = 'C'#243'digo do tanque'
          FocusControl = dbeCodigoTanque
        end
        object dbeCodigoBomba: TDBEdit
          Left = 8
          Top = 24
          Width = 85
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ID'
          DataSource = dsDados
          Enabled = False
          TabOrder = 0
        end
        object dbeNomeBomba: TDBEdit
          Left = 8
          Top = 64
          Width = 394
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME_BOMBA'
          DataSource = dsDados
          TabOrder = 1
        end
        object dbeCodigoTanque: TDBEdit
          Left = 8
          Top = 104
          Width = 85
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TANQUE_ID'
          DataSource = dsDados
          TabOrder = 2
        end
        object dblTanque: TDBLookupComboBox
          Left = 99
          Top = 104
          Width = 190
          Height = 21
          DataField = 'TANQUE_ID'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'NOME_TANQUE'
          ListSource = dsLookupTanque
          TabOrder = 3
        end
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmPrincipal.cdsBombas
    Left = 584
    Top = 232
  end
  object dsLookupTanque: TDataSource
    Left = 584
    Top = 168
  end
end
