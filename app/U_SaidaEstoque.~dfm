inherited F_SAIDA_ESTOQUE: TF_SAIDA_ESTOQUE
  Left = 518
  Top = 188
  Caption = 'Saida de estoque'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = tbDados
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 24
          Top = 24
          Width = 11
          Height = 13
          Caption = 'ID'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 24
          Top = 64
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
          FocusControl = editUsuario
        end
        object Label3: TLabel
          Left = 24
          Top = 104
          Width = 37
          Height = 13
          Caption = 'Produto'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 24
          Top = 144
          Width = 103
          Height = 13
          Caption = 'Quantidade de saidas'
          FocusControl = DBEdit4
        end
        object DBEdit1: TDBEdit
          Left = 24
          Top = 40
          Width = 134
          Height = 21
          DataField = 'idSaidaEstoque'
          DataSource = DS
          TabOrder = 0
        end
        object editUsuario: TDBEdit
          Left = 24
          Top = 80
          Width = 49
          Height = 21
          DataField = 'idUsuario'
          DataSource = DS
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 24
          Top = 120
          Width = 49
          Height = 21
          DataField = 'idProduto'
          DataSource = DS
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 24
          Top = 160
          Width = 134
          Height = 21
          DataField = 'qtd_saida'
          DataSource = DS
          TabOrder = 3
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 80
          Top = 80
          Width = 274
          Height = 21
          DataField = 'Usuario'
          DataSource = DS
          TabOrder = 4
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 80
          Top = 120
          Width = 273
          Height = 21
          DataField = 'Produto'
          DataSource = DS
          TabOrder = 5
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_SaidaEstoque
  end
end
