program SisPetro;

//{$apptype console}

uses
  Vcl.Forms,
  uFormBase in 'uFormBase.pas' {frmFormBase},
  udmPrincipal in 'udmPrincipal.pas' {dmPrincipal: TDataModule},
  uMensagemUtils in 'uMensagemUtils.pas',
  uCadastroBase in 'uCadastroBase.pas' {frmCadastroBase},
  uCadastroCombustiveis in 'uCadastroCombustiveis.pas' {frmCombustiveis},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCadastroImpostos in 'uCadastroImpostos.pas' {frmCadastroImpostos},
  uCadastroTanques in 'uCadastroTanques.pas' {frmCadastroTanque},
  uCadastroBombas in 'uCadastroBombas.pas' {frmCadastroBombas},
  uMovimentacoesAbastecimentos in 'uMovimentacoesAbastecimentos.pas' {frmMovimentacoesAbastecimentos},
  uMovimentoAbastecimentoRelatorio in 'uMovimentoAbastecimentoRelatorio.pas' {frmMovimentoAbastecimentoRelatorio},
  uMovimentoAbastecimentoReport in 'uMovimentoAbastecimentoReport.pas' {frmMovimentoAbastecimentoReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SisPetro';
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
