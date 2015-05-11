inherited F_PRODUTO: TF_PRODUTO
  Left = 571
  Top = 202
  Caption = 'Produto'
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
          FocusControl = editProdutoiD
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label3: TLabel
          Left = 16
          Top = 112
          Width = 113
          Height = 13
          Caption = 'Quantidade em estoque'
          FocusControl = editEstoque
        end
        object Label4: TLabel
          Left = 16
          Top = 152
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 16
          Top = 192
          Width = 80
          Height = 13
          Caption = 'C'#243'digo de barras'
          FocusControl = editCodBarras
        end
        object editProdutoiD: TDBEdit
          Left = 16
          Top = 40
          Width = 65
          Height = 21
          DataField = 'idProduto'
          DataSource = DS
          TabOrder = 0
        end
        object editEstoque: TDBEdit
          Left = 16
          Top = 128
          Width = 134
          Height = 21
          DataField = 'qtd_estoque'
          DataSource = DS
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 168
          Width = 134
          Height = 21
          DataField = 'valor'
          DataSource = DS
          TabOrder = 2
        end
        object editCodBarras: TDBEdit
          Left = 16
          Top = 208
          Width = 134
          Height = 21
          DataField = 'cod_barra'
          DataSource = DS
          TabOrder = 3
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 80
          Width = 217
          Height = 21
          DataField = 'descricao'
          DataSource = DS
          TabOrder = 4
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Hist'#243'rico de movimenta'#231#227'o de estoque'
      ImageIndex = 2
      object Label7: TLabel
        Left = 16
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Produto'
      end
      object btnExibirHistorico: TBitBtn
        Left = 168
        Top = 37
        Width = 105
        Height = 25
        Caption = 'Exibir hist'#243'rico'
        TabOrder = 0
        OnClick = btnExibirHistoricoClick
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 80
        Width = 993
        Height = 337
        Caption = 'Movimenta'#231#227'o'
        TabOrder = 1
        object gridMovimentacao: TDBGrid
          Left = 16
          Top = 24
          Width = 961
          Height = 297
          DataSource = DS_Movimentacao
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object editprodutoIDhistorico: TDBEdit
        Left = 16
        Top = 40
        Width = 134
        Height = 21
        DataField = 'idProduto'
        DataSource = DS
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_Produto
  end
  object DS_Movimentacao: TDataSource
    DataSet = DM.Q_Aux
    Left = 344
    Top = 16
  end
end
