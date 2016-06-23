unit uMovimentacoesAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, udmPrincipal,
  Vcl.Mask, Data.FMTBcd, Data.SqlExpr;

type
  TfrmMovimentacoesAbastecimentos = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoAbastecimento: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeCodigoBomba: TDBEdit;
    Label4: TLabel;
    dbeCodigoImposto: TDBEdit;
    Label5: TLabel;
    dbeQtdLitros: TDBEdit;
    Label6: TLabel;
    dbeValorLiquido: TDBEdit;
    Label7: TLabel;
    dbeValorbruto: TDBEdit;
    dsLookupBomba: TDataSource;
    dsLookupImposto: TDataSource;
    dblBomba: TDBLookupComboBox;
    dblImposto: TDBLookupComboBox;
    dtpDataAbastecimento: TDateTimePicker;
    Label8: TLabel;
    dbeValorImposto: TDBEdit;
    qrPesquisaValorCombustivel: TSQLQuery;
    edtValorLitro: TEdit;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbeCodigoBombaChange(Sender: TObject);
    procedure dbeQtdLitrosChange(Sender: TObject);
    procedure dbeQtdLitrosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FdmprincipalImpostos: TdmPrincipal;
    FdmprincipalBombas: TdmPrincipal;
    FValorPorLitro: Currency;
  protected
    function ValidaDados: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmMovimentacoesAbastecimentos: TfrmMovimentacoesAbastecimentos;

implementation

{$R *.dfm}

uses uMensagemUtils;

const
  SQL_PESQUISA_VALOR_COMBUSTIVEL = 'SELECT VALOR_COMBUSTIVEL FROM COMBUSTIVEIS COMB ' +
                                   'INNER JOIN TANQUES_COMBUSTIVEIS TQN ON TQN.COMBUSTIVEL_ID = COMB.ID '+
                                   'INNER JOIN BOMBAS_COMBUSTIVEIS BOMB ON BOMB.TANQUE_ID = TQN.ID';

procedure TfrmMovimentacoesAbastecimentos.btnAlterarClick(Sender: TObject);
begin
  inherited;
   dtpDataAbastecimento.DateTime  := dmPrincipal.cdsAbastecimentos.FieldByName('DATA').AsDateTime;
end;

procedure TfrmMovimentacoesAbastecimentos.dbeCodigoBombaChange(Sender: TObject);
begin
  inherited;
  qrPesquisaValorCombustivel.SQL.Clear;
  edtValorLitro.Text := '';

  if dbeCodigoBomba.Text <> '' then
  begin
    qrPesquisaValorCombustivel.SQL.Clear;
    qrPesquisaValorCombustivel.SQL.Text := SQL_PESQUISA_VALOR_COMBUSTIVEL + ' WHERE BOMB.ID = ' + dbeCodigoBomba.Text;
    qrPesquisaValorCombustivel.Open;
    edtValorLitro.Text := FormatCurr(',0.00', qrPesquisaValorCombustivel.FieldByName('VALOR_COMBUSTIVEL').AsCurrency);
    FValorPorLitro := qrPesquisaValorCombustivel.FieldByName('VALOR_COMBUSTIVEL').AsCurrency;
    qrPesquisaValorCombustivel.close;
  end;
end;

procedure TfrmMovimentacoesAbastecimentos.dbeQtdLitrosChange(Sender: TObject);
begin
  inherited;

  if (dsdados.State in [dsInsert,dsEdit])  and (dbeQtdLitros.Text <> '') then
  begin
    dbeValorLiquido.Text := FormatCurr(',0.00', FValorPorLitro * StrToCurr(dbeQtdLitros.Text));
    dbeValorImposto.Text := FormatCurr(',0.00', (StrToCurr(dbeValorLiquido.Text) * dsLookupImposto.DataSet.FieldByName('PERCENTUAL').AsCurrency) / 100);
    dbeValorbruto.Text := CurrToStr((StrToCurr(dbeValorLiquido.Text)) + (StrToCurr(dbeValorImposto.Text)));
  end;

  if (dsdados.State in [dsInsert]) then
  begin
    dtpDataAbastecimento.Date := (now);
  end;
end;

procedure TfrmMovimentacoesAbastecimentos.dbeQtdLitrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = '.' then
  key:= FormatSettings.DecimalSeparator;
end;

procedure TfrmMovimentacoesAbastecimentos.FormCreate(Sender: TObject);
begin
  inherited;
  FdmprincipalImpostos := TdmPrincipal.Create(Self);
  FdmprincipalBombas := TdmPrincipal.Create(Self);
end;

procedure TfrmMovimentacoesAbastecimentos.FormShow(Sender: TObject);
begin
  inherited;
  dsLookupBomba.DataSet := FdmprincipalBombas.cdsBombas;
  dsLookupBomba.DataSet.Open;
  dsLookupImposto.DataSet := FdmprincipalImpostos.cdsImpostos;
  dsLookupImposto.DataSet.Open;
end;

function TfrmMovimentacoesAbastecimentos.ValidaDados: Boolean;
begin
  Result := False;

  if (dbeCodigoBomba.Text = '') or
     (StrToInt(dbeCodigoBomba.Text) <> FdmprincipalBombas.cdsBombasID.AsInteger) then
  begin
    Showmensagewarning('Codigo da bomba incorreto ou não informado.');
    dblBomba.SetFocus;
    Exit;
  end;

  if dtpDataAbastecimento.Date > strtodate(DateToStr(Now)) then
  begin
    Showmensagewarning('Data alem do dia corrente.');
    dtpDataAbastecimento.SetFocus;
    Exit;
  end;

  if (dbeCodigoImposto.Text = '') or
     (StrToInt(dbeCodigoImposto.Text) <> FdmprincipalImpostos.cdsImpostosID.AsInteger) then
  begin
    Showmensagewarning('Codigo do imposto incorreto ou não informado.');
    dblImposto.SetFocus;
    Exit;
  end;

  if dbeQtdLitros.Text = '' then
  begin
    Showmensagewarning('Informe a quantidade de litros abastecido.');
    dbeQtdLitros.SetFocus;
    Exit;
  end;

  Result := inherited ValidaDados;
  dmPrincipal.cdsAbastecimentos.FieldByName('DATA').AsDateTime := dtpDataAbastecimento.DateTime;
  end;

end.
