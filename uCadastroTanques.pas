unit uCadastroTanques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, udmPrincipal,
  Vcl.Mask;

type
  TfrmCadastroTanque = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoTanque: TDBEdit;
    Label2: TLabel;
    dbeNomeTanque: TDBEdit;
    Label3: TLabel;
    dbeCodigoCombustivel: TDBEdit;
    dsLookupCombustivel: TDataSource;
    dblCombustivel: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FdmprincipalCombustiveis: TdmPrincipal;
  protected
    function ValidaDados: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadastroTanque: TfrmCadastroTanque;

implementation

{$R *.dfm}

uses uMensagemUtils;

procedure TfrmCadastroTanque.FormCreate(Sender: TObject);
begin
  inherited;
  FdmprincipalCombustiveis := TdmPrincipal.Create(Self);
end;

procedure TfrmCadastroTanque.FormShow(Sender: TObject);
begin
  inherited;
  dsLookupCombustivel.DataSet := FdmprincipalCombustiveis.cdsCombustiveis;
  dsLookupCombustivel.DataSet.Open;
end;

function TfrmCadastroTanque.ValidaDados: Boolean;
begin
  Result := False;

  if (dbeCodigoCombustivel.Text = '') or
     (StrToInt(dbeCodigoCombustivel.Text) <> FdmprincipalCombustiveis.cdsCombustiveisID.AsInteger) then
  begin
    Showmensagewarning('Codigo do combustivel incorreto ou não informado.');
    dblCombustivel.SetFocus;
    Exit;
  end;

  if dbeNomeTanque.text = '' then
  begin
    Showmensagewarning('Informe o nome do tanque.');
    dbeNomeTanque.SetFocus;
    Exit;
  end;

  Result := inherited ValidaDados;
end;

end.
