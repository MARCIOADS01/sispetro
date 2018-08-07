inherited frmMovimentacoesAbastecimentos: TfrmMovimentacoesAbastecimentos
  Caption = 'Abastecimentos'
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
      inherited pnlBotoesDados: TPanel
        inherited btnSalvar: TButton
          Top = 0
          ExplicitTop = 0
        end
      end
      inherited pnlDados: TPanel
        object Label1: TLabel
          Left = 8
          Top = 0
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbeCodigoAbastecimento
        end
        object Label2: TLabel
          Left = 8
          Top = 40
          Width = 112
          Height = 13
          Caption = 'Data de Abastecimento'
        end
        object Label3: TLabel
          Left = 8
          Top = 80
          Width = 83
          Height = 13
          Caption = 'C'#243'digo da Bomba'
          FocusControl = dbeCodigoBomba
        end
        object Label4: TLabel
          Left = 8
          Top = 120
          Width = 90
          Height = 13
          Caption = 'C'#243'digo do Imposto'
          FocusControl = dbeCodigoImposto
        end
        object Label5: TLabel
          Left = 283
          Top = 120
          Width = 48
          Height = 13
          Caption = 'Qtd. litros'
          FocusControl = dbeQtdLitros
        end
        object Label6: TLabel
          Left = 6
          Top = 163
          Width = 57
          Height = 13
          Caption = 'Valor liquido'
          FocusControl = dbeValorLiquido
        end
        object Label7: TLabel
          Left = 259
          Top = 163
          Width = 96
          Height = 13
          Caption = 'Valor bruto (TOTAL)'
          FocusControl = dbeValorbruto
        end
        object Label8: TLabel
          Left = 133
          Top = 163
          Width = 80
          Height = 13
          Caption = 'Valor imposto R$'
          FocusControl = dbeValorImposto
        end
        object Label9: TLabel
          Left = 283
          Top = 77
          Width = 64
          Height = 13
          Caption = 'Valor por litro'
        end
        object dbeCodigoAbastecimento: TDBEdit
          Left = 8
          Top = 16
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ID'
          DataSource = dsDados
          Enabled = False
          TabOrder = 0
        end
        object dbeCodigoBomba: TDBEdit
          Left = 8
          Top = 96
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BOMBA_ID'
          DataSource = dsDados
          TabOrder = 2
          OnChange = dbeCodigoBombaChange
          OnExit = dbeCodigoBombaExit
        end
        object dbeCodigoImposto: TDBEdit
          Left = 8
          Top = 136
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          DataField = 'IMPOSTO_ID'
          DataSource = dsDados
          TabOrder = 4
        end
        object dbeQtdLitros: TDBEdit
          Left = 283
          Top = 136
          Width = 96
          Height = 21
          CharCase = ecUpperCase
          DataField = 'QTD_LITROS_ABASTECIDO'
          DataSource = dsDados
          TabOrder = 6
          OnChange = dbeQtdLitrosChange
          OnKeyPress = dbeQtdLitrosKeyPress
        end
        object dbeValorLiquido: TDBEdit
          Left = 6
          Top = 179
          Width = 120
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_LIQUIDO'
          DataSource = dsDados
          Enabled = False
          TabOrder = 7
        end
        object dbeValorbruto: TDBEdit
          Left = 259
          Top = 179
          Width = 120
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_BRUTO'
          DataSource = dsDados
          Enabled = False
          TabOrder = 8
        end
        object dblBomba: TDBLookupComboBox
          Left = 87
          Top = 96
          Width = 190
          Height = 21
          DataField = 'BOMBA_ID'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'NOME_BOMBA'
          ListSource = dsLookupBomba
          TabOrder = 3
          OnCloseUp = dblBombaCloseUp
        end
        object dblImposto: TDBLookupComboBox
          Left = 87
          Top = 136
          Width = 190
          Height = 21
          DataField = 'IMPOSTO_ID'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'TIPO_IMPOSTO'
          ListSource = dsLookupImposto
          TabOrder = 5
        end
        object dtpDataAbastecimento: TDateTimePicker
          Left = 8
          Top = 53
          Width = 112
          Height = 21
          Date = 42542.000000000000000000
          Time = 42542.000000000000000000
          TabOrder = 1
        end
        object dbeValorImposto: TDBEdit
          Left = 133
          Top = 179
          Width = 120
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_IMPOSTO'
          DataSource = dsDados
          Enabled = False
          TabOrder = 9
        end
        object edtValorLitro: TEdit
          Left = 283
          Top = 96
          Width = 96
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 10
        end
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmPrincipal.cdsAbastecimentos
    OnStateChange = dsDadosStateChange
    Left = 600
    Top = 352
  end
  object dsLookupBomba: TDataSource
    Left = 600
    Top = 240
  end
  object dsLookupImposto: TDataSource
    Left = 600
    Top = 296
  end
  object qrPesquisaValorCombustivel: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select valor_combustivel from combustiveis comb'
      
        'inner join tanques_combustiveis tqn on tqn.combustivel_id = comb' +
        '.id'
      'inner join bombas_combustiveis bomb on bomb.tanque_id = tqn.id')
    SQLConnection = dmPrincipal.SQLConexao
    Left = 552
    Top = 32
  end
end
