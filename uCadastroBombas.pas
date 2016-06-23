unit uCadastroBombas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,udmPrincipal,
  Vcl.Mask;

type
  TfrmCadastroBombas = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoBomba: TDBEdit;
    Label2: TLabel;
    dbeNomeBomba: TDBEdit;
    Label3: TLabel;
    dbeCodigoTanque: TDBEdit;
    dblTanque: TDBLookupComboBox;
    dsLookupTanque: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FdmPrincipalTanque: TdmPrincipal;
  protected
    function ValidaDados: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadastroBombas: TfrmCadastroBombas;

implementation

{$R *.dfm}

uses uMensagemUtils;

{ TfrmCadastroBombas }

procedure TfrmCadastroBombas.FormCreate(Sender: TObject);
begin
  inherited;
    FdmPrincipalTanque := TdmPrincipal.Create(Self);
end;

procedure TfrmCadastroBombas.FormShow(Sender: TObject);
begin
  inherited;
  dsLookupTanque.DataSet := FdmprincipalTanque.cdsTanques;
  dsLookupTanque.DataSet.Open;
end;

function TfrmCadastroBombas.ValidaDados: Boolean;
begin
  Result := False;

  if (dbeCodigoTanque.Text = '') or
     (StrToInt(dbeCodigoTanque.Text) <> FdmprincipalTanque.cdsTanquesID.AsInteger) then
  begin
    Showmensagewarning('Codigo do tanque incorreto ou não informado.');
    dblTanque.SetFocus;
    Exit;
  end;

  if dbeNomeBomba.text = '' then
  begin
    Showmensagewarning('Informe o nome da bomba.');
    dbeNomeBomba.SetFocus;
    Exit;
  end;

  Result := inherited ValidaDados;
end;

end.
