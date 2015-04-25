object F_PERMISSOES: TF_PERMISSOES
  Left = 842
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Permiss'#245'es de telas'
  ClientHeight = 364
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 14
    Width = 26
    Height = 13
    Caption = 'Telas'
  end
  object ListBox1: TListBox
    Left = 16
    Top = 32
    Width = 345
    Height = 289
    Enabled = False
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 0
  end
  object btnSalvar: TButton
    Left = 288
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnEditar: TButton
    Left = 104
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 2
    TabStop = False
    OnClick = btnEditarClick
  end
  object ListBoxTelasUsuario: TListBox
    Left = 232
    Top = 328
    Width = 33
    Height = 25
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object btnCancelar: TButton
    Left = 16
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 4
    TabStop = False
    OnClick = btnCancelarClick
  end
end
