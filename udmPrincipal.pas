unit udmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, Vcl.Forms;

type
  TdmPrincipal = class(TDataModule)
    SQLConexao: TSQLConnection;
    qrCombustiveis: TSQLQuery;
    cdsCombustiveis: TClientDataSet;
    dspCombustiveis: TDataSetProvider;
    qrCombustiveisID: TIntegerField;
    qrCombustiveisNOME_COMBUSTIVEL: TStringField;
    qrCombustiveisVALOR_COMBUSTIVEL: TFMTBCDField;
    cdsCombustiveisID: TIntegerField;
    cdsCombustiveisNOME_COMBUSTIVEL: TStringField;
    qrImpostos: TSQLQuery;
    cdsImpostos: TClientDataSet;
    dspImpostos: TDataSetProvider;
    qrImpostosID: TIntegerField;
    qrImpostosTIPO_IMPOSTO: TStringField;
    qrImpostosPERCENTUAL: TFMTBCDField;
    cdsImpostosID: TIntegerField;
    cdsImpostosTIPO_IMPOSTO: TStringField;
    cdsImpostosPERCENTUAL: TFMTBCDField;
    qrBombas: TSQLQuery;
    cdsBombas: TClientDataSet;
    dspBombas: TDataSetProvider;
    qrBombasID: TIntegerField;
    qrBombasNOME_BOMBA: TStringField;
    qrBombasTANQUE_ID: TIntegerField;
    cdsBombasID: TIntegerField;
    cdsBombasNOME_BOMBA: TStringField;
    cdsBombasTANQUE_ID: TIntegerField;
    qrTanques: TSQLQuery;
    cdsTanques: TClientDataSet;
    dspTanques: TDataSetProvider;
    qrTanquesID: TIntegerField;
    qrTanquesNOME_TANQUE: TStringField;
    qrTanquesCOMBUSTIVEL_ID: TIntegerField;
    qrAbastecimentos: TSQLQuery;
    cdsAbastecimentos: TClientDataSet;
    dspAbastecimentos: TDataSetProvider;
    qrAbastecimentosID: TIntegerField;
    qrAbastecimentosDATA: TSQLTimeStampField;
    qrAbastecimentosBOMBA_ID: TIntegerField;
    qrAbastecimentosIMPOSTO_ID: TIntegerField;
    qrAbastecimentosVALOR_LIQUIDO: TFMTBCDField;
    qrAbastecimentosVALOR_BRUTO: TFMTBCDField;
    cdsAbastecimentosID: TIntegerField;
    cdsAbastecimentosDATA: TSQLTimeStampField;
    cdsAbastecimentosBOMBA_ID: TIntegerField;
    cdsAbastecimentosIMPOSTO_ID: TIntegerField;
    cdsAbastecimentosVALOR_LIQUIDO: TFMTBCDField;
    cdsAbastecimentosVALOR_BRUTO: TFMTBCDField;
    cdsTanquesID: TIntegerField;
    cdsTanquesNOME_TANQUE: TStringField;
    cdsTanquesCOMBUSTIVEL_ID: TIntegerField;
    cdsCombustiveisVALOR_COMBUSTIVEL: TFMTBCDField;
    qrAbastecimentosQTD_LITROS_ABASTECIDO: TFMTBCDField;
    cdsAbastecimentosQTD_LITROS_ABASTECIDO: TFMTBCDField;
    qrAbastecimentosVALOR_IMPOSTO: TFMTBCDField;
    cdsAbastecimentosVALOR_IMPOSTO: TFMTBCDField;
    procedure cdsCombustiveisAfterDelete(DataSet: TDataSet);
    procedure cdsCombustiveisAfterPost(DataSet: TDataSet);
    procedure cdsImpostosAfterPost(DataSet: TDataSet);
    procedure cdsImpostosAfterDelete(DataSet: TDataSet);
    procedure cdsBombasAfterDelete(DataSet: TDataSet);
    procedure cdsBombasAfterPost(DataSet: TDataSet);
    procedure cdsTanquesAfterDelete(DataSet: TDataSet);
    procedure cdsTanquesAfterPost(DataSet: TDataSet);
    procedure cdsAbastecimentosAfterDelete(DataSet: TDataSet);
    procedure cdsAbastecimentosAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
   procedure Commit(aClient: Tclientdataset);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPrincipal.cdsAbastecimentosAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsAbastecimentos);
end;

procedure TdmPrincipal.cdsAbastecimentosAfterPost(DataSet: TDataSet);
begin
  Commit(cdsAbastecimentos);
end;

procedure TdmPrincipal.cdsBombasAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsBombas);
end;

procedure TdmPrincipal.cdsBombasAfterPost(DataSet: TDataSet);
begin
  Commit(cdsBombas);
end;

procedure TdmPrincipal.cdsCombustiveisAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsCombustiveis);
end;

procedure TdmPrincipal.cdsCombustiveisAfterPost(DataSet: TDataSet);
begin
  Commit(cdsCombustiveis);
end;

procedure TdmPrincipal.cdsImpostosAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsImpostos);
end;

procedure TdmPrincipal.cdsImpostosAfterPost(DataSet: TDataSet);
begin
  Commit(cdsImpostos);
end;

procedure TdmPrincipal.cdsTanquesAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsTanques);
end;

procedure TdmPrincipal.cdsTanquesAfterPost(DataSet: TDataSet);
begin
  Commit(cdsTanques);
end;

procedure TdmPrincipal.Commit(aClient: Tclientdataset);
begin
  aClient.applyUpdates(-1);
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
var
  PathDB: string;
begin
  PathDB := ExtractFilePath(Application.ExeName) + '..\..\Db\COMBUSTIVEIS.FDB';
  SQLConexao.Params.Values['Database'] := PathDB;
  SQLConexao.Open;
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  SQLConexao.Close;
end;

end.
