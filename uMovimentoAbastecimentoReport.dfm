inherited frmMovimentoAbastecimentoReport: TfrmMovimentoAbastecimentoReport
  Caption = 'frmMovimentoAbastecimentoReport'
  ClientHeight = 571
  ClientWidth = 771
  ExplicitTop = -27
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
        Left = 248
        Top = 6
        Width = 249
        Height = 23
        Caption = 'Relatorio de Abastecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
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
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.FixedBottom = True
        Color = clBtnFace
        ParentColor = False
        Transparent = False
        object RLLabel2: TRLLabel
          Left = 13
          Top = 11
          Width = 37
          Height = 16
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 56
          Top = 11
          Width = 38
          Height = 16
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'DATA'
          DataSource = dsRelatorio
          Text = ''
          Transparent = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 52
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
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
          Left = 608
          Top = 28
          Width = 99
          Height = 16
          Alignment = taRightJustify
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 264
          Top = 6
          Width = 45
          Height = 16
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 608
          Top = 6
          Width = 54
          Height = 16
          Caption = 'Valor R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 40
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.FixedTop = True
      BeforePrint = RLBand4BeforePrint
      object RLLabel6: TRLLabel
        Left = 526
        Top = 11
        Width = 94
        Height = 16
        Caption = 'Total Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlTotalPeriodo: TRLLabel
        Left = 626
        Top = 11
        Width = 83
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
    object cdsRelAbastecimentosDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsRelAbastecimentosNOME_TANQUE: TStringField
      FieldName = 'NOME_TANQUE'
      Required = True
      Size = 50
    end
    object cdsRelAbastecimentosNOME_BOMBA: TStringField
      FieldName = 'NOME_BOMBA'
      Required = True
      Size = 50
    end
    object cdsRelAbastecimentosVALOR_BRUTO: TFMTBCDField
      FieldName = 'VALOR_BRUTO'
      Required = True
      Precision = 18
      Size = 2
    end
  end
end
