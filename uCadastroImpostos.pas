unit uCadastroImpostos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  TfrmCadastroImpostos = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoImposto: TDBEdit;
    Label2: TLabel;
    dbeTipoImposto: TDBEdit;
    Label3: TLabel;
    dbePercentualImposto: TDBEdit;
    procedure dbePercentualImpostoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    function ValidaDados: Boolean; override;
  public
    { Public declarations }
  end;

var
  FrmCadastroImpostos: TfrmCadastroImpostos;

implementation

{$R *.dfm}

uses udmPrincipal, uMensagemUtils;

{ TfrmCadastroImpostos }

procedure TfrmCadastroImpostos.dbePercentualImpostoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = '.' then
  key:= FormatSettings.DecimalSeparator;
end;

function TfrmCadastroImpostos.ValidaDados: Boolean;
begin
  Result := False;

  if dbeTipoImposto.text = '' then
  begin
    Showmensagewarning('Informe o tipo de imposto.');
    dbeTipoImposto.SetFocus;
    Exit;
  end;

  if dbePercentualImposto.text = '' then
  begin
    Showmensagewarning('Informe o percentual.');
    dbePercentualImposto.SetFocus;
    Exit;
  end;

  Result := inherited ValidaDados;
end;

end.
