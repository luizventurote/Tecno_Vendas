inherited F_PRODUTO: TF_PRODUTO
  Left = 469
  Top = 292
  Caption = 'Produto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = tbDados
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 45
          Height = 13
          Caption = 'idProduto'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 46
          Height = 13
          Caption = 'descricao'
          FocusControl = DBMemo1
        end
        object Label3: TLabel
          Left = 16
          Top = 176
          Width = 59
          Height = 13
          Caption = 'qtd_estoque'
          FocusControl = DBEdit2
        end
        object Label4: TLabel
          Left = 16
          Top = 216
          Width = 23
          Height = 13
          Caption = 'valor'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 16
          Top = 256
          Width = 48
          Height = 13
          Caption = 'cod_barra'
          FocusControl = DBEdit4
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 40
          Width = 134
          Height = 21
          DataField = 'idProduto'
          DataSource = DS
          TabOrder = 0
        end
        object DBMemo1: TDBMemo
          Left = 16
          Top = 80
          Width = 185
          Height = 89
          DataField = 'descricao'
          DataSource = DS
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 16
          Top = 192
          Width = 134
          Height = 21
          DataField = 'qtd_estoque'
          DataSource = DS
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 232
          Width = 134
          Height = 21
          DataField = 'valor'
          DataSource = DS
          TabOrder = 3
        end
        object DBEdit4: TDBEdit
          Left = 16
          Top = 272
          Width = 134
          Height = 21
          DataField = 'cod_barra'
          DataSource = DS
          TabOrder = 4
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_Produto
  end
end
