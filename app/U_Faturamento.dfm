inherited F_FATURAMENTO: TF_FATURAMENTO
  Left = 289
  Top = 116
  Caption = 'Faturamento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 11
          Height = 13
          Caption = 'ID'
          FocusControl = editIdFaturamento
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Pedido'
          FocusControl = editPedido
        end
        object Label3: TLabel
          Left = 16
          Top = 184
          Width = 103
          Height = 13
          Caption = 'N'#250'mero da nota fiscal'
          FocusControl = editnotaFiscal
        end
        object Label4: TLabel
          Left = 16
          Top = 224
          Width = 23
          Height = 13
          Caption = 'Data'
          FocusControl = editData
        end
        object Label5: TLabel
          Left = 16
          Top = 144
          Width = 77
          Height = 13
          Caption = 'Prazo do pedido'
        end
        object labelAlert: TLabel
          Left = 16
          Top = 412
          Width = 174
          Height = 13
          Caption = 'Aten'#231#227'o! Esse pedido j'#225' foi faturado.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label6: TLabel
          Left = 16
          Top = 104
          Width = 32
          Height = 13
          Caption = 'Cliente'
        end
        object editIdFaturamento: TDBEdit
          Left = 16
          Top = 40
          Width = 134
          Height = 21
          DataField = 'idFaturamento'
          DataSource = DS
          ReadOnly = True
          TabOrder = 0
        end
        object editPedido: TDBEdit
          Left = 16
          Top = 80
          Width = 73
          Height = 21
          DataField = 'idPedido'
          DataSource = DS
          ReadOnly = True
          TabOrder = 1
          OnChange = editPedidoChange
        end
        object editnotaFiscal: TDBEdit
          Left = 16
          Top = 200
          Width = 209
          Height = 21
          DataField = 'num_nota_fiscal'
          DataSource = DS
          TabOrder = 2
        end
        object editData: TDBEdit
          Left = 16
          Top = 240
          Width = 209
          Height = 21
          DataField = 'data'
          DataSource = DS
          ReadOnly = True
          TabOrder = 3
        end
        object lookPedido: TDBLookupComboBox
          Left = 96
          Top = 80
          Width = 129
          Height = 21
          DataField = 'Pedido'
          DataSource = DS
          TabOrder = 4
        end
        object editPrazo: TEdit
          Left = 16
          Top = 160
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 5
        end
        object editCliente: TEdit
          Left = 96
          Top = 120
          Width = 313
          Height = 21
          Enabled = False
          TabOrder = 6
        end
        object editClienteId: TEdit
          Left = 16
          Top = 120
          Width = 73
          Height = 21
          Enabled = False
          TabOrder = 7
        end
        object gpDuplicata: TGroupBox
          Left = 16
          Top = 272
          Width = 161
          Height = 73
          Caption = 'Duplicata'
          TabOrder = 8
          Visible = False
          object btnGerarDuplicata: TBitBtn
            Left = 16
            Top = 24
            Width = 129
            Height = 33
            Caption = 'Gerar duplicata'
            TabOrder = 0
            OnClick = btnGerarDuplicataClick
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_Faturamento
  end
  object DS_Duplicata: TDataSource
    Left = 344
    Top = 16
  end
end
