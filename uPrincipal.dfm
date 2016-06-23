object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'SisPetro - Controle de abastecimentos'
  ClientHeight = 396
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnMenuPrincipal
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object stbInformacoes: TStatusBar
    Left = 0
    Top = 377
    Width = 726
    Height = 19
    BiDiMode = bdLeftToRight
    Panels = <
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end>
    ParentBiDiMode = False
    OnResize = stbInformacoesResize
    ExplicitLeft = -77
    ExplicitWidth = 803
  end
  object mnMenuPrincipal: TMainMenu
    Left = 248
    Top = 96
    object mnCadastros: TMenuItem
      Caption = 'Cadastros'
      object mnCombustiveis: TMenuItem
        Caption = 'Combustiveis'
        OnClick = mnCombustiveisClick
      end
      object mnTanquesCombustiveis: TMenuItem
        Caption = 'Tanques de Combustiveis'
        OnClick = mnTanquesCombustiveisClick
      end
      object mnBombasCombustiveis: TMenuItem
        Caption = 'Bombas de combustiveis'
        OnClick = mnBombasCombustiveisClick
      end
      object mnImpostosAbastecimento: TMenuItem
        Caption = 'Impostos'
        OnClick = mnImpostosAbastecimentoClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnSair: TMenuItem
        Caption = 'Sair do Sistema'
        OnClick = mnSairClick
      end
    end
    object mnMovimentacoes: TMenuItem
      Caption = 'Movimenta'#231#245'es'
      object mnAbastecimentos: TMenuItem
        Caption = 'Abastecimentos'
        OnClick = mnAbastecimentosClick
      end
    end
    object mnRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object mnRelatorioAbastecimentos: TMenuItem
        Caption = 'Abastecimentos por periodo'
        OnClick = mnRelatorioAbastecimentosClick
      end
    end
  end
  object tmrAtualizaHora: TTimer
    OnTimer = tmrAtualizaHoraTimer
    Left = 360
    Top = 216
  end
end
