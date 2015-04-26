inherited F_PEDIDO: TF_PEDIDO
  Left = 366
  Top = 233
  Caption = 'Pedido'
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
          Width = 41
          Height = 13
          Caption = 'idPedido'
          FocusControl = editPedidoID
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
          Width = 59
          Height = 13
          Caption = 'data_pedido'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 24
          Top = 144
          Width = 85
          Height = 13
          Caption = 'prazo_pagamento'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 24
          Top = 184
          Width = 23
          Height = 13
          Caption = 'valor'
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 24
          Top = 224
          Width = 15
          Height = 13
          Caption = 'qtd'
          FocusControl = DBEdit6
        end
        object editPedidoID: TDBEdit
          Left = 24
          Top = 40
          Width = 134
          Height = 21
          DataField = 'idPedido'
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
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 24
          Top = 120
          Width = 329
          Height = 21
          DataField = 'data_pedido'
          DataSource = DS
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 24
          Top = 160
          Width = 134
          Height = 21
          DataField = 'prazo_pagamento'
          DataSource = DS
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 24
          Top = 200
          Width = 134
          Height = 21
          DataField = 'valor'
          DataSource = DS
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 24
          Top = 240
          Width = 134
          Height = 21
          DataField = 'qtd'
          DataSource = DS
          TabOrder = 5
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 80
          Top = 80
          Width = 274
          Height = 21
          DataField = 'Cliente'
          DataSource = DS
          TabOrder = 6
        end
        object GroupBox1: TGroupBox
          Left = 424
          Top = 24
          Width = 593
          Height = 393
          Caption = 'Produtos'
          TabOrder = 7
          object Label7: TLabel
            Left = 8
            Top = 24
            Width = 37
            Height = 13
            Caption = 'Produto'
            FocusControl = DBLookupComboBox2
          end
          object Label8: TLabel
            Left = 296
            Top = 24
            Width = 55
            Height = 13
            Caption = 'Quantidade'
          end
          object DBLookupComboBox2: TDBLookupComboBox
            Left = 72
            Top = 40
            Width = 210
            Height = 21
            DataField = 'Produto'
            DataSource = DS_Produto
            TabOrder = 0
          end
          object editProdutoID: TDBEdit
            Left = 8
            Top = 40
            Width = 57
            Height = 21
            DataField = 'idProduto'
            DataSource = DS_Produto
            TabOrder = 1
          end
          object btnAddProduto: TButton
            Left = 432
            Top = 38
            Width = 75
            Height = 25
            Caption = 'Adicionar'
            TabOrder = 2
            OnClick = btnAddProdutoClick
          end
          object editProdutoQtd: TEdit
            Left = 296
            Top = 40
            Width = 121
            Height = 21
            TabOrder = 3
          end
          object gridProdutos: TDBGrid
            Left = 8
            Top = 80
            Width = 569
            Height = 297
            DataSource = DS_Produto
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_Pedido
  end
  object DS_Produto: TDataSource
    Left = 344
    Top = 16
  end
end
