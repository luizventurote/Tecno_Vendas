inherited F_CONTAS_RECEBER: TF_CONTAS_RECEBER
  Left = 263
  Top = 164
  Caption = 'Contas a Receber'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnAdicionar: TBitBtn
    Visible = False
  end
  inherited PageControl1: TPageControl
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 24
          Top = 24
          Width = 11
          Height = 13
          Caption = 'ID'
          FocusControl = editIdContasReceber
        end
        object Label2: TLabel
          Left = 24
          Top = 64
          Width = 32
          Height = 13
          Caption = 'Cliente'
          FocusControl = editCliente
        end
        object Label4: TLabel
          Left = 24
          Top = 104
          Width = 103
          Height = 13
          Caption = 'N'#250'mero da nota fiscal'
          FocusControl = editNota
        end
        object Label5: TLabel
          Left = 24
          Top = 144
          Width = 56
          Height = 13
          Caption = 'Vencimento'
          FocusControl = editVencimento
        end
        object editIdContasReceber: TDBEdit
          Left = 24
          Top = 40
          Width = 134
          Height = 21
          DataField = 'idContasReceber'
          DataSource = DS
          ReadOnly = True
          TabOrder = 0
          OnChange = editIdContasReceberChange
        end
        object editCliente: TDBEdit
          Left = 24
          Top = 80
          Width = 49
          Height = 21
          DataField = 'idCliente'
          DataSource = DS
          ReadOnly = True
          TabOrder = 1
          OnChange = editClienteChange
          OnExit = editClienteExit
        end
        object editNota: TDBEdit
          Left = 24
          Top = 120
          Width = 134
          Height = 21
          DataField = 'num_nota_fiscal'
          DataSource = DS
          ReadOnly = True
          TabOrder = 2
          OnExit = editNotaExit
        end
        object editVencimento: TDBEdit
          Left = 24
          Top = 160
          Width = 273
          Height = 21
          DataField = 'vencimento'
          DataSource = DS
          ReadOnly = True
          TabOrder = 3
          OnChange = editVencimentoChange
          OnExit = editVencimentoExit
        end
        object gpBaixa: TGroupBox
          Left = 24
          Top = 200
          Width = 353
          Height = 121
          Caption = 'Baixa'
          TabOrder = 4
          Visible = False
          object Label7: TLabel
            Left = 16
            Top = 24
            Width = 66
            Height = 13
            Caption = 'Data da baixa'
            FocusControl = editDataBaixa
          end
          object editDataBaixa: TDBEdit
            Left = 16
            Top = 40
            Width = 313
            Height = 21
            DataField = 'data_baixa'
            DataSource = DS
            ReadOnly = True
            TabOrder = 0
          end
          object btnDarBaixar: TBitBtn
            Left = 232
            Top = 72
            Width = 97
            Height = 25
            Caption = 'Dar baixa'
            TabOrder = 1
            OnClick = btnDarBaixarClick
            NumGlyphs = 2
          end
          object btnCAncelarBaixa: TBitBtn
            Left = 16
            Top = 72
            Width = 97
            Height = 25
            Caption = 'Cancelar baixar'
            TabOrder = 2
            OnClick = btnCAncelarBaixaClick
          end
        end
        object editClienteName: TEdit
          Left = 80
          Top = 80
          Width = 217
          Height = 21
          ReadOnly = True
          TabOrder = 5
          OnChange = editClienteNameChange
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Contas em atraso'
      ImageIndex = 2
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 1033
        Height = 437
        Align = alCustom
        DataSource = DS_ContasAtrasadas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_ContasReceber
  end
  object DS_ContasAtrasadas: TDataSource
    DataSet = DM.Q_Aux
    Left = 344
    Top = 16
  end
end
