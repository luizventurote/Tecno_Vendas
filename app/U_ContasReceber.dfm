inherited F_CONTAS_RECEBER: TF_CONTAS_RECEBER
  Left = 419
  Top = 130
  Caption = 'Contas a Receber'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = tbDados
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 24
          Top = 24
          Width = 82
          Height = 13
          Caption = 'idContasReceber'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 24
          Top = 64
          Width = 32
          Height = 13
          Caption = 'Cliente'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 24
          Top = 104
          Width = 45
          Height = 13
          Caption = 'Duplicata'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 24
          Top = 144
          Width = 77
          Height = 13
          Caption = 'num_nota_fiscal'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 24
          Top = 184
          Width = 55
          Height = 13
          Caption = 'vencimento'
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 24
          Top = 224
          Width = 52
          Height = 13
          Caption = 'data_baixa'
          FocusControl = editDataBaixa
        end
        object DBEdit1: TDBEdit
          Left = 24
          Top = 40
          Width = 134
          Height = 21
          DataField = 'idContasReceber'
          DataSource = DS
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 24
          Top = 80
          Width = 49
          Height = 21
          DataField = 'idCliente'
          DataSource = DS
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 24
          Top = 120
          Width = 49
          Height = 21
          DataField = 'idDuplicata'
          DataSource = DS
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 24
          Top = 160
          Width = 134
          Height = 21
          DataField = 'num_nota_fiscal'
          DataSource = DS
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 24
          Top = 200
          Width = 273
          Height = 21
          DataField = 'vencimento'
          DataSource = DS
          TabOrder = 4
        end
        object editDataBaixa: TDBEdit
          Left = 24
          Top = 240
          Width = 273
          Height = 21
          DataField = 'data_baixa'
          DataSource = DS
          TabOrder = 5
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 80
          Top = 80
          Width = 217
          Height = 21
          DataField = 'Cliente'
          DataSource = DS
          TabOrder = 6
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 80
          Top = 120
          Width = 217
          Height = 21
          DataField = 'Duplicata'
          DataSource = DS
          TabOrder = 7
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_ContasReceber
  end
end