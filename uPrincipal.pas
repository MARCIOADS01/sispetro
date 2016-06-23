unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    mnMenuPrincipal: TMainMenu;
    mnCadastros: TMenuItem;
    mnMovimentacoes: TMenuItem;
    mnRelatorios: TMenuItem;
    mnTanquesCombustiveis: TMenuItem;
    mnBombasCombustiveis: TMenuItem;
    mnAbastecimentos: TMenuItem;
    mnRelatorioAbastecimentos: TMenuItem;
    mnImpostosAbastecimento: TMenuItem;
    mnSair: TMenuItem;
    mnCombustiveis: TMenuItem;
    N1: TMenuItem;
    stbInformacoes: TStatusBar;
    tmrAtualizaHora: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnCombustiveisClick(Sender: TObject);
    procedure mnImpostosAbastecimentoClick(Sender: TObject);
    procedure mnSairClick(Sender: TObject);
    procedure mnTanquesCombustiveisClick(Sender: TObject);
    procedure mnBombasCombustiveisClick(Sender: TObject);
    procedure mnAbastecimentosClick(Sender: TObject);
    procedure mnRelatorioAbastecimentosClick(Sender: TObject);
    procedure stbInformacoesResize(Sender: TObject);
    procedure tmrAtualizaHoraTimer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadastroCombustiveis, uCadastroImpostos, uCadastroTanques, uCadastroBombas,
  uMovimentacoesAbastecimentos, uMovimentoAbastecimentoRelatorio;

procedure TfrmPrincipal.stbInformacoesResize(Sender: TObject);
begin
  stbInformacoes.Panels[0].Width := stbInformacoes.Width div 4;
  stbInformacoes.Panels[1].Width := stbInformacoes.Width div 4;
  stbInformacoes.Panels[2].Width := stbInformacoes.Width div 4;
  stbInformacoes.Panels[3].Width := stbInformacoes.Width div 4;
end;

procedure TfrmPrincipal.tmrAtualizaHoraTimer(Sender: TObject);
var
  KS: TKeyboardState;
begin
  stbinformacoes.Panels [2].Text := 'Data:' + ' ' + FormatDateTime ('dddd","dd" de "mmmm" de "yyyy',now);// para data
  stbinformacoes.Panels [3].Text := 'Hora:' + ' ' + FormatDateTime ('hh:mm:ss',Now);//para hora

  GetKeyboardState(Ks);

  if Odd(Ks[VK_CAPITAL]) then
  begin
    stbInformacoes.Panels[0].Text := 'CAPS LOCK'
  end
  else
    stbInformacoes.Panels[0].Text := '';

  If Odd( Ks[VK_NUMLOCK]) then
  begin
    stbInformacoes.Panels[1].Text := 'NUM LOCK'
  end
  else
    stbInformacoes.Panels[1].Text := '';
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;
procedure TfrmPrincipal.mnAbastecimentosClick(Sender: TObject);
begin
  frmMovimentacoesAbastecimentos := TfrmMovimentacoesAbastecimentos.Create(Self);
  frmMovimentacoesAbastecimentos.Show;
end;

procedure TfrmPrincipal.mnBombasCombustiveisClick(Sender: TObject);
begin
  frmCadastroBombas := TfrmCadastroBombas.Create(Self);
  frmCadastroBombas.Show;
end;

procedure TfrmPrincipal.mnCombustiveisClick(Sender: TObject);
begin
  frmCombustiveis := TfrmCombustiveis.Create(Self);
  frmCombustiveis.Show;
end;

procedure TfrmPrincipal.mnImpostosAbastecimentoClick(Sender: TObject);
begin
  frmCadastroImpostos := TfrmCadastroImpostos.Create(Self);
  frmCadastroImpostos.Show;
end;

procedure TfrmPrincipal.mnRelatorioAbastecimentosClick(Sender: TObject);
begin
  frmMovimentoAbastecimentoRelatorio := TfrmMovimentoAbastecimentoRelatorio.Create(Self);
  frmMovimentoAbastecimentoRelatorio.Show;
end;

procedure TfrmPrincipal.mnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPrincipal.mnTanquesCombustiveisClick(Sender: TObject);
begin
  frmCadastroTanque := TfrmCadastroTanque.Create(Self);
  frmCadastroTanque.Show;
end;

end.
