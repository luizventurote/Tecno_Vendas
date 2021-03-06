inherited F_PEDIDO: TF_PEDIDO
  Left = 388
  Top = 162
  Caption = 'Pedido'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 24
          Top = 24
          Width = 11
          Height = 13
          Caption = 'ID'
          FocusControl = editPedidoID
        end
        object Label2: TLabel
          Left = 24
          Top = 64
          Width = 32
          Height = 13
          Caption = 'Cliente'
          FocusControl = editCliente
        end
        object Label3: TLabel
          Left = 24
          Top = 104
          Width = 23
          Height = 13
          Caption = 'Data'
          FocusControl = editDataPedido
        end
        object Label4: TLabel
          Left = 24
          Top = 144
          Width = 98
          Height = 13
          Caption = 'Prazo do pagamento'
          FocusControl = editPrazo
        end
        object Label5: TLabel
          Left = 24
          Top = 184
          Width = 47
          Height = 13
          Caption = 'Valor total'
          FocusControl = editTotalValor
        end
        object Label6: TLabel
          Left = 24
          Top = 224
          Width = 78
          Height = 13
          Caption = 'Quantidade total'
          FocusControl = editTotalQtd
        end
        object editPedidoID: TDBEdit
          Left = 24
          Top = 40
          Width = 134
          Height = 21
          DataField = 'idPedido'
          DataSource = DS
          TabOrder = 0
          OnChange = editPedidoIDChange
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
        end
        object editDataPedido: TDBEdit
          Left = 24
          Top = 120
          Width = 329
          Height = 21
          DataField = 'data_pedido'
          DataSource = DS
          ReadOnly = True
          TabOrder = 2
        end
        object editPrazo: TDBEdit
          Left = 24
          Top = 160
          Width = 134
          Height = 21
          DataField = 'prazo_pagamento'
          DataSource = DS
          TabOrder = 3
        end
        object editTotalValor: TDBEdit
          Left = 24
          Top = 200
          Width = 134
          Height = 21
          DataField = 'valor'
          DataSource = DS
          Enabled = False
          ReadOnly = True
          TabOrder = 4
        end
        object editTotalQtd: TDBEdit
          Left = 24
          Top = 240
          Width = 134
          Height = 21
          DataField = 'qtd'
          DataSource = DS
          Enabled = False
          ReadOnly = True
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
        object gbProdutos: TGroupBox
          Left = 424
          Top = 24
          Width = 593
          Height = 393
          Caption = 'Produtos'
          Enabled = False
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
            Left = 392
            Top = 24
            Width = 55
            Height = 13
            Caption = 'Quantidade'
          end
          object gridProdutos: TDBGrid
            Left = 8
            Top = 88
            Width = 569
            Height = 249
            DataSource = DS_ProdutoItem
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
          object DBLookupComboBox2: TDBLookupComboBox
            Left = 64
            Top = 40
            Width = 313
            Height = 21
            DataField = 'Produto'
            DataSource = DS_Produto
            TabOrder = 1
          end
          object editProdutoQtd: TEdit
            Left = 392
            Top = 40
            Width = 89
            Height = 21
            TabOrder = 2
          end
          object btnAddProduto: TButton
            Left = 499
            Top = 37
            Width = 74
            Height = 23
            Caption = 'Add'
            TabOrder = 3
            OnClick = btnAddProdutoClick
          end
          object editProdutoID: TDBEdit
            Left = 8
            Top = 40
            Width = 49
            Height = 21
            DataField = 'idProduto'
            DataSource = DS_Produto
            TabOrder = 4
          end
          object btnRemoverItem: TBitBtn
            Left = 8
            Top = 352
            Width = 137
            Height = 25
            Caption = 'Remover item do pedido'
            TabOrder = 5
            OnClick = btnRemoverItemClick
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Produtos mais vendidos'
      ImageIndex = 2
      object Label9: TLabel
        Left = 8
        Top = 16
        Width = 52
        Height = 13
        Caption = 'Data inicial'
      end
      object Label10: TLabel
        Left = 240
        Top = 16
        Width = 45
        Height = 13
        Caption = 'Data final'
      end
      object gridMaisVendidos: TDBGrid
        Left = 0
        Top = 72
        Width = 1033
        Height = 365
        Align = alCustom
        DataSource = DS_Aux
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object btnRsultadoMiasVendos: TBitBtn
        Left = 464
        Top = 28
        Width = 129
        Height = 25
        Caption = 'Exibir resultados'
        TabOrder = 3
        OnClick = btnRsultadoMiasVendosClick
      end
      object editDataInicial: TEdit
        Left = 8
        Top = 32
        Width = 185
        Height = 21
        TabOrder = 0
      end
      object editDataFinal: TEdit
        Left = 240
        Top = 32
        Width = 185
        Height = 21
        TabOrder = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Clientes sem vendas'
      ImageIndex = 3
      object Label11: TLabel
        Left = 8
        Top = 16
        Width = 52
        Height = 13
        Caption = 'Data inicial'
      end
      object Label12: TLabel
        Left = 240
        Top = 16
        Width = 45
        Height = 13
        Caption = 'Data final'
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 72
        Width = 1033
        Height = 365
        Align = alCustom
        DataSource = DS_Aux
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object editClientesDataInicial: TEdit
        Left = 8
        Top = 32
        Width = 185
        Height = 21
        TabOrder = 1
      end
      object editClientesDataFinal: TEdit
        Left = 240
        Top = 32
        Width = 185
        Height = 21
        TabOrder = 2
      end
      object btnClientesSemVendas: TBitBtn
        Left = 464
        Top = 28
        Width = 129
        Height = 25
        Caption = 'Exibir resultados'
        TabOrder = 3
        OnClick = btnClientesSemVendasClick
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_Pedido
  end
  object DS_ProdutoItem: TDataSource
    DataSet = DM.M_PedidoProduto
    Left = 344
    Top = 16
  end
  object DS_Produto: TDataSource
    DataSet = DM.M_Produto
    Left = 384
    Top = 16
  end
  object DS_Aux: TDataSource
    DataSet = DM.Q_Aux
    Left = 424
    Top = 16
  end
end
