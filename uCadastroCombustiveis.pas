unit uCadastroCombustiveis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  TfrmCombustiveis = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoCombustivel: TDBEdit;
    Label2: TLabel;
    dbeNomeCombustivel: TDBEdit;
    Label3: TLabel;
    dbeValorCombustivel: TDBEdit;
    procedure dbeValorCombustivelKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    function ValidaDados: Boolean; override;
  public
    { Public declarations }
  end;

var
  FrmCombustiveis: TfrmCombustiveis;

implementation

{$R *.dfm}

uses udmPrincipal, uMensagemUtils;

{ TfrmCombustiveis }

procedure TfrmCombustiveis.dbeValorCombustivelKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = '.' then
  key:= FormatSettings.DecimalSeparator;
end;

function TfrmCombustiveis.ValidaDados: Boolean;
begin
  Result := False;

  if dbeNomeCombustivel.text = '' then
  begin
    Showmensagewarning('Informe o Nome.');
    dbeNomeCombustivel.SetFocus;
    Exit;
  end;

  if dbeValorCombustivel.text = '' then
  begin
    Showmensagewarning('Informe o valor.');
    dbeValorCombustivel.SetFocus;
    Exit;
  end;

  Result := inherited ValidaDados;
end;

end.
