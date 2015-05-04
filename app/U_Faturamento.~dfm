inherited F_FATURAMENTO: TF_FATURAMENTO
  Left = 289
  Top = 142
  Caption = 'Faturamento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = tbDados
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 11
          Height = 13
          Caption = 'ID'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Pedido'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 16
          Top = 104
          Width = 103
          Height = 13
          Caption = 'N'#250'mero da nota fiscal'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 16
          Top = 144
          Width = 23
          Height = 13
          Caption = 'Data'
          FocusControl = editData
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 40
          Width = 134
          Height = 21
          DataField = 'idFaturamento'
          DataSource = DS
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 16
          Top = 80
          Width = 73
          Height = 21
          DataField = 'idPedido'
          DataSource = DS
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 120
          Width = 209
          Height = 21
          DataField = 'num_nota_fiscal'
          DataSource = DS
          TabOrder = 2
        end
        object editData: TDBEdit
          Left = 16
          Top = 160
          Width = 209
          Height = 21
          DataField = 'data'
          DataSource = DS
          ReadOnly = True
          TabOrder = 3
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 96
          Top = 80
          Width = 129
          Height = 21
          DataField = 'Pedido'
          DataSource = DS
          TabOrder = 4
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_Faturamento
  end
end
