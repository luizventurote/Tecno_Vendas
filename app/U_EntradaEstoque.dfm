inherited F_ENTRADA_ESTOQUE: TF_ENTRADA_ESTOQUE
  Left = 349
  Top = 184
  Caption = 'Entrada no estoque'
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
        end
        object Label4: TLabel
          Left = 16
          Top = 104
          Width = 115
          Height = 13
          Caption = 'Quantidade de Entredas'
        end
        object Label5: TLabel
          Left = 752
          Top = 24
          Width = 36
          Height = 13
          Caption = 'Usuario'
          FocusControl = cbUsuario
          Visible = False
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 37
          Height = 13
          Caption = 'Produto'
        end
        object cbUsuario: TDBLookupComboBox
          Left = 800
          Top = 40
          Width = 217
          Height = 21
          DataField = 'Usuario'
          DataSource = DS
          TabOrder = 1
          Visible = False
        end
        object editUsuario: TDBEdit
          Left = 752
          Top = 40
          Width = 41
          Height = 21
          TabStop = False
          DataField = 'idUsuario'
          DataSource = DS
          ReadOnly = True
          TabOrder = 2
          Visible = False
          OnExit = editUsuarioExit
        end
        object editProduto: TDBEdit
          Left = 16
          Top = 80
          Width = 41
          Height = 21
          TabStop = False
          DataField = 'idProduto'
          DataSource = DS
          ReadOnly = True
          TabOrder = 3
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
        object editEntradas: TDBEdit
          Left = 16
          Top = 120
          Width = 134
          Height = 21
          DataField = 'qtd_entradas'
          DataSource = DS
          TabOrder = 4
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 64
          Top = 80
          Width = 217
          Height = 21
          DataField = 'Produto'
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
