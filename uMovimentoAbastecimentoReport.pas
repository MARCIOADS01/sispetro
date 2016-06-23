unit uMovimentoAbastecimentoReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase,Data.DB, RLReport,RLConsts,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, DateUtils, StrUtils, udmPrincipal,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmMovimentoAbastecimentoReport = class(TfrmFormBase)
    dsRelatorio: TDataSource;
    qrRelAbastecimentos: TSQLQuery;
    dpRelAbastecimentos: TDataSetProvider;
    cdsRelAbastecimentos: TClientDataSet;
    rlMovimentoAbastecimento: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand4: TRLBand;
    RLLabel6: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel7: TRLLabel;
    procedure rlMovimentoAbastecimentoBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FTotal: Currency;
    { Private declarations }
  public
    DataInicial, DataFinal: TDateTime;
    { Public declarations }
  end;

var
  frmMovimentoAbastecimentoReport: TfrmMovimentoAbastecimentoReport;

implementation

{$R *.dfm}

const
  SQL_REL = 'SELECT ABAS.DATA, TQN.NOME_TANQUE, BOMB.NOME_BOMBA, ABAS.VALOR_BRUTO ' +
            'FROM ABASTECIMENTOS ABAS ' +
            'INNER JOIN BOMBAS_COMBUSTIVEIS BOMB ON BOMB.ID = ABAS.BOMBA_ID ' +
            'INNER JOIN TANQUES_COMBUSTIVEIS TQN ON TQN.ID = BOMB.TANQUE_ID ';

procedure TfrmMovimentoAbastecimentoReport.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  FTotal := FTotal + cdsRelAbastecimentos.FieldByName('VALOR_BRUTO').AsCurrency;
end;

procedure TfrmMovimentoAbastecimentoReport.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  RLLabel7.Caption := FormatCurr(',0.00', FTotal);
end;

procedure TfrmMovimentoAbastecimentoReport.rlMovimentoAbastecimentoBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
var
  Dia, Mes, Ano: Word;
begin
  inherited;
  qrRelAbastecimentos.SQL.Text := SQL_REL;
  qrRelAbastecimentos.SQL.Text := qrRelAbastecimentos.SQL.Text + ' ORDER BY ABAS.DATA ';
  cdsRelAbastecimentos.Open;
  Exit;



  FTotal := 0;
  qrRelAbastecimentos.SQL.Text := SQL_REL;
  if DataInicial > 0 then
  begin
    DecodeDate(DataInicial, Ano, Mes, Dia);
    qrRelAbastecimentos.SQL.Text := qrRelAbastecimentos.SQL.Text +
    ' WHERE ABAS.DATA >= ' + QuotedStr(IntToStr(Ano) + '-' + IntToStr(Mes) + '-' + IntToStr(Dia) + ' 00:00:00');
  end;

  if DataFinal > 0 then
  begin
    if AnsiContainsText(qrRelAbastecimentos.SQL.Text, ' WHERE ') then
      qrRelAbastecimentos.SQL.Text := qrRelAbastecimentos.SQL.Text + ' AND '
    else
      qrRelAbastecimentos.SQL.Text := qrRelAbastecimentos.SQL.Text + ' WHERE ';
      DecodeDate(DataFinal, Ano, Mes, Dia);
      qrRelAbastecimentos.SQL.Text := qrRelAbastecimentos.SQL.Text +
      ' ABAS.DATA <= ' + QuotedStr(IntToStr(Ano) + '-' + IntToStr(Mes) + '-' + IntToStr(Dia) + ' 23:59:59');
  end;

  qrRelAbastecimentos.SQL.Text := qrRelAbastecimentos.SQL.Text + ' ORDER BY ABAS.DATA ';
  cdsRelAbastecimentos.Open;
end;

end.
