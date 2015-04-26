inherited F_ENTRADA_ESTOQUE: TF_ENTRADA_ESTOQUE
  Left = 510
  Top = 174
  Caption = 'Entrada no estoque'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = tbDados
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 84
          Height = 13
          Caption = 'idEntradaEstoque'
        end
        object Label4: TLabel
          Left = 16
          Top = 144
          Width = 62
          Height = 13
          Caption = 'qtd_entradas'
        end
        object Label5: TLabel
          Left = 16
          Top = 64
          Width = 36
          Height = 13
          Caption = 'Usuario'
          FocusControl = DBLookupComboBox1
        end
        object Label2: TLabel
          Left = 16
          Top = 104
          Width = 37
          Height = 13
          Caption = 'Produto'
          FocusControl = DBLookupComboBox2
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 64
          Top = 80
          Width = 217
          Height = 21
          DataField = 'Usuario'
          DataSource = DS
          TabOrder = 1
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 64
          Top = 120
          Width = 217
          Height = 21
          DataField = 'Produto'
          DataSource = DS
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 16
          Top = 80
          Width = 41
          Height = 21
          TabStop = False
          DataField = 'idUsuario'
          DataSource = DS
          TabOrder = 3
        end
        object DBEdit2: TDBEdit
          Left = 16
          Top = 120
          Width = 41
          Height = 21
          TabStop = False
          DataField = 'idProduto'
          DataSource = DS
          TabOrder = 4
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 40
          Width = 134
          Height = 21
          DataField = 'idEntradaEstoque'
          DataSource = DS
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 160
          Width = 134
          Height = 21
          DataField = 'qtd_entradas'
          DataSource = DS
          TabOrder = 5
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_EntradaEstq
  end
end
