inherited frmMovimentoAbastecimentoReport: TfrmMovimentoAbastecimentoReport
  Caption = 'frmMovimentoAbastecimentoReport'
  ClientHeight = 571
  ClientWidth = 771
  ExplicitWidth = 787
  ExplicitHeight = 610
  PixelsPerInch = 96
  TextHeight = 13
  object rlMovimentoAbastecimento: TRLReport
    Left = 0
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dsRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = rlMovimentoAbastecimentoBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 256
        Top = 16
        Width = 164
        Height = 16
        Caption = 'Relatorio de Abastecimento'
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 73
      Width = 718
      Height = 88
      DataFields = 'DATA'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        BandType = btColumnHeader
        object RLLabel2: TRLLabel
          Left = 13
          Top = 11
          Width = 35
          Height = 16
          Caption = 'Data:'
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 52
        BeforePrint = RLBand3BeforePrint
        object RLDBText2: TRLDBText
          Left = 13
          Top = 28
          Width = 103
          Height = 16
          DataField = 'NOME_TANQUE'
          DataSource = dsRelatorio
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 264
          Top = 28
          Width = 98
          Height = 16
          DataField = 'NOME_BOMBA'
          DataSource = dsRelatorio
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 432
          Top = 28
          Width = 99
          Height = 16
          DataField = 'VALOR_BRUTO'
          DataSource = dsRelatorio
          Text = ''
        end
        object RLLabel3: TRLLabel
          Left = 13
          Top = 6
          Width = 46
          Height = 16
          Caption = 'Tanque'
        end
        object RLLabel4: TRLLabel
          Left = 264
          Top = 6
          Width = 45
          Height = 16
          Caption = 'Bomba'
        end
        object RLLabel5: TRLLabel
          Left = 432
          Top = 6
          Width = 54
          Height = 16
          Caption = 'Valor R$'
        end
      end
      object RLDBText1: TRLDBText
        Left = 77
        Top = 11
        Width = 38
        Height = 16
        DataField = 'DATA'
        DataSource = dsRelatorio
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 48
      BandType = btSummary
      BeforePrint = RLBand4BeforePrint
      object RLLabel6: TRLLabel
        Left = 488
        Top = 14
        Width = 84
        Height = 16
        Caption = 'Total Per'#237'odo:'
      end
      object RLDBResult1: TRLDBResult
        Left = 579
        Top = 13
        Width = 138
        Height = 16
        DataField = 'VALOR_BRUTO'
        DataSource = dsRelatorio
        Info = riSum
        Text = ''
      end
      object RLLabel7: TRLLabel
        Left = 336
        Top = 16
        Width = 58
        Height = 16
      end
    end
  end
  object dsRelatorio: TDataSource
    DataSet = cdsRelAbastecimentos
    Left = 168
    Top = 352
  end
  object qrRelAbastecimentos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT ABAS.DATA, TQN.NOME_TANQUE, BOMB.NOME_BOMBA, ABAS.VALOR_B' +
        'RUTO'
      'FROM ABASTECIMENTOS ABAS'
      'INNER JOIN BOMBAS_COMBUSTIVEIS BOMB ON BOMB.ID = ABAS.BOMBA_ID'
      'INNER JOIN TANQUES_COMBUSTIVEIS TQN ON TQN.ID = BOMB.TANQUE_ID'
      'ORDER BY ABAS.DATA')
    SQLConnection = dmPrincipal.SQLConexao
    Left = 168
    Top = 208
  end
  object dpRelAbastecimentos: TDataSetProvider
    DataSet = qrRelAbastecimentos
    Left = 168
    Top = 256
  end
  object cdsRelAbastecimentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpRelAbastecimentos'
    Left = 168
    Top = 304
  end
end
