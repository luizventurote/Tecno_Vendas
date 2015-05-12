inherited F_FATURAMENTO: TF_FATURAMENTO
  Left = 425
  Top = 245
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
        object lookPedido: TDBLookupComboBox
          Left = 96
          Top = 80
          Width = 129
          Height = 21
          DataField = 'Pedido'
          DataSource = DS
          TabOrder = 4
        end
        object btnDuplicata: TBitBtn
          Left = 888
          Top = 24
          Width = 129
          Height = 33
          Caption = 'Duplicata'
          TabOrder = 5
          Visible = False
          OnClick = btnDuplicataClick
        end
        object gbDuplicata: TGroupBox
          Left = 456
          Top = 72
          Width = 561
          Height = 345
          Caption = 'Duplicata'
          TabOrder = 6
          Visible = False
          object Label5: TLabel
            Left = 8
            Top = 24
            Width = 53
            Height = 13
            Caption = 'idDuplicata'
            FocusControl = DBEdit1
          end
          object Label6: TLabel
            Left = 8
            Top = 64
            Width = 67
            Height = 13
            Caption = 'idFaturamento'
            FocusControl = DBEdit2
          end
          object Label7: TLabel
            Left = 8
            Top = 104
            Width = 21
            Height = 13
            Caption = 'data'
            FocusControl = DBEdit4
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 40
            Width = 81
            Height = 21
            DataField = 'idDuplicata'
            DataSource = DS_Duplicata
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 8
            Top = 80
            Width = 89
            Height = 21
            DataField = 'idFaturamento'
            DataSource = DS_Duplicata
            TabOrder = 1
          end
          object DBEdit4: TDBEdit
            Left = 8
            Top = 120
            Width = 137
            Height = 21
            DataField = 'data'
            DataSource = DS_Duplicata
            TabOrder = 2
          end
          object BitBtn1: TBitBtn
            Left = 8
            Top = 152
            Width = 137
            Height = 33
            Caption = 'Gerar duplicata'
            TabOrder = 3
            OnClick = BitBtn1Click
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_Faturamento
  end
  object DS_Duplicata: TDataSource
    DataSet = DM.M_Duplicata
    Left = 344
    Top = 16
  end
end
