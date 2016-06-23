object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 312
  Width = 582
  object SQLConexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver230.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=23.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver230.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=23.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'Database=D:\Posto Combustivel\Db\combustiveis.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 32
    Top = 8
  end
  object qrCombustiveis: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM COMBUSTIVEIS')
    SQLConnection = SQLConexao
    Left = 32
    Top = 56
    object qrCombustiveisID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrCombustiveisNOME_COMBUSTIVEL: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME_COMBUSTIVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object qrCombustiveisVALOR_COMBUSTIVEL: TFMTBCDField
      DisplayLabel = 'Valor R$'
      FieldName = 'VALOR_COMBUSTIVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object cdsCombustiveis: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCombustiveis'
    AfterPost = cdsCombustiveisAfterPost
    AfterDelete = cdsCombustiveisAfterDelete
    Left = 32
    Top = 168
    object cdsCombustiveisID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsCombustiveisNOME_COMBUSTIVEL: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME_COMBUSTIVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object cdsCombustiveisVALOR_COMBUSTIVEL: TFMTBCDField
      DisplayLabel = 'Valor R$'
      FieldName = 'VALOR_COMBUSTIVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object dspCombustiveis: TDataSetProvider
    DataSet = qrCombustiveis
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    Left = 32
    Top = 112
  end
  object qrImpostos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM IMPOSTOS')
    SQLConnection = SQLConexao
    Left = 112
    Top = 56
    object qrImpostosID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrImpostosTIPO_IMPOSTO: TStringField
      DisplayLabel = 'Tipo de imposto'
      DisplayWidth = 30
      FieldName = 'TIPO_IMPOSTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object qrImpostosPERCENTUAL: TFMTBCDField
      DisplayLabel = 'Percentual %'
      FieldName = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object cdsImpostos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImpostos'
    AfterPost = cdsImpostosAfterPost
    AfterDelete = cdsImpostosAfterDelete
    Left = 112
    Top = 168
    object cdsImpostosID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsImpostosTIPO_IMPOSTO: TStringField
      DisplayLabel = 'Tipo de imposto'
      DisplayWidth = 50
      FieldName = 'TIPO_IMPOSTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object cdsImpostosPERCENTUAL: TFMTBCDField
      DisplayLabel = 'Percentual %'
      FieldName = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dspImpostos: TDataSetProvider
    DataSet = qrImpostos
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    Left = 112
    Top = 112
  end
  object qrBombas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM BOMBAS_COMBUSTIVEIS')
    SQLConnection = SQLConexao
    Left = 184
    Top = 56
    object qrBombasID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrBombasNOME_BOMBA: TStringField
      DisplayLabel = 'Nome da bomba'
      FieldName = 'NOME_BOMBA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object qrBombasTANQUE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo do tanque'
      FieldName = 'TANQUE_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
  end
  object cdsBombas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBombas'
    AfterPost = cdsBombasAfterPost
    AfterDelete = cdsBombasAfterDelete
    Left = 184
    Top = 168
    object cdsBombasID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsBombasNOME_BOMBA: TStringField
      DisplayLabel = 'Nome da bomba'
      FieldName = 'NOME_BOMBA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object cdsBombasTANQUE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo do tanque'
      FieldName = 'TANQUE_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
  end
  object dspBombas: TDataSetProvider
    DataSet = qrBombas
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    Left = 184
    Top = 112
  end
  object qrTanques: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TANQUES_COMBUSTIVEIS')
    SQLConnection = SQLConexao
    Left = 256
    Top = 56
    object qrTanquesID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrTanquesNOME_TANQUE: TStringField
      DisplayLabel = 'Nome do tanque'
      FieldName = 'NOME_TANQUE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object qrTanquesCOMBUSTIVEL_ID: TIntegerField
      DisplayLabel = 'C'#243'digo do combustivel'
      FieldName = 'COMBUSTIVEL_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
  end
  object cdsTanques: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTanques'
    AfterPost = cdsTanquesAfterPost
    AfterDelete = cdsTanquesAfterDelete
    Left = 256
    Top = 168
    object cdsTanquesID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsTanquesNOME_TANQUE: TStringField
      DisplayLabel = 'Nome do tanque'
      FieldName = 'NOME_TANQUE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object cdsTanquesCOMBUSTIVEL_ID: TIntegerField
      DisplayLabel = 'C'#243'digo do combustivel'
      FieldName = 'COMBUSTIVEL_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
  end
  object dspTanques: TDataSetProvider
    DataSet = qrTanques
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    Left = 256
    Top = 112
  end
  object qrAbastecimentos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM ABASTECIMENTOS')
    SQLConnection = SQLConexao
    Left = 352
    Top = 56
    object qrAbastecimentosID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrAbastecimentosDATA: TSQLTimeStampField
      DisplayLabel = 'Data de Abastecimento'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrAbastecimentosBOMBA_ID: TIntegerField
      DisplayLabel = 'C'#243'digo da Bomba'
      FieldName = 'BOMBA_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object qrAbastecimentosIMPOSTO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo do Imposto'
      FieldName = 'IMPOSTO_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object qrAbastecimentosQTD_LITROS_ABASTECIDO: TFMTBCDField
      DisplayLabel = 'Qtd. Litros'
      FieldName = 'QTD_LITROS_ABASTECIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 3
    end
    object qrAbastecimentosVALOR_LIQUIDO: TFMTBCDField
      DisplayLabel = 'Valor liquido'
      FieldName = 'VALOR_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qrAbastecimentosVALOR_BRUTO: TFMTBCDField
      DisplayLabel = 'Valor bruto'
      FieldName = 'VALOR_BRUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qrAbastecimentosVALOR_IMPOSTO: TFMTBCDField
      DisplayLabel = 'Valor imposto R$'
      FieldName = 'VALOR_IMPOSTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object cdsAbastecimentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAbastecimentos'
    AfterPost = cdsAbastecimentosAfterPost
    AfterDelete = cdsAbastecimentosAfterDelete
    Left = 352
    Top = 168
    object cdsAbastecimentosID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsAbastecimentosDATA: TSQLTimeStampField
      DisplayLabel = 'Data de Abastecimento'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAbastecimentosBOMBA_ID: TIntegerField
      DisplayLabel = 'C'#243'digo da Bomba'
      FieldName = 'BOMBA_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsAbastecimentosIMPOSTO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo do Imposto'
      FieldName = 'IMPOSTO_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsAbastecimentosQTD_LITROS_ABASTECIDO: TFMTBCDField
      DisplayLabel = 'Qtd. Litros'
      FieldName = 'QTD_LITROS_ABASTECIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsAbastecimentosVALOR_LIQUIDO: TFMTBCDField
      DisplayLabel = 'Valor liquido'
      FieldName = 'VALOR_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsAbastecimentosVALOR_BRUTO: TFMTBCDField
      DisplayLabel = 'Valor bruto'
      FieldName = 'VALOR_BRUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsAbastecimentosVALOR_IMPOSTO: TFMTBCDField
      DisplayLabel = 'Valor imposto R$'
      FieldName = 'VALOR_IMPOSTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object dspAbastecimentos: TDataSetProvider
    DataSet = qrAbastecimentos
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    Left = 352
    Top = 112
  end
end
