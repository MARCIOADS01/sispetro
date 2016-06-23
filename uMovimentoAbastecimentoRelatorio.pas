unit uMovimentoAbastecimentoRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  uMovimentoAbastecimentoReport, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMovimentoAbastecimentoRelatorio = class(TfrmFormBase)
    Panel1: TPanel;
    btnVisualizar: TButton;
    btnImprimir: TButton;
    dtInicial: TDateTimePicker;
    Label1: TLabel;
    dtFinal: TDateTimePicker;
    Label2: TLabel;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimentoAbastecimentoRelatorio: TfrmMovimentoAbastecimentoRelatorio;

implementation

{$R *.dfm}

procedure TfrmMovimentoAbastecimentoRelatorio.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  frmMovimentoAbastecimentoReport := TfrmMovimentoAbastecimentoReport.Create(Self);
   try
     frmMovimentoAbastecimentoReport.DataInicial := dtInicial.Date;
     frmMovimentoAbastecimentoReport.DataFinal := dtFinal.Date;


   if Sender = btnVisualizar then
     frmMovimentoAbastecimentoReport.rlMovimentoAbastecimento.Preview
   else
     frmMovimentoAbastecimentoReport.rlMovimentoAbastecimento.Print;

   finally
     frmMovimentoAbastecimentoReport.Free;
   end;
end;

procedure TfrmMovimentoAbastecimentoRelatorio.FormShow(Sender: TObject);
begin
  inherited;
  dtInicial.Date := Now;
  dtFinal.Date := Now;
end;

end.
