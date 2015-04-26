inherited F_PRODUTO: TF_PRODUTO
  Left = 407
  Top = 220
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
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = DBMemo1
        end
        object Label3: TLabel
          Left = 16
          Top = 176
          Width = 113
          Height = 13
          Caption = 'Quantidade em estoque'
          FocusControl = DBEdit2
        end
        object Label4: TLabel
          Left = 16
          Top = 216
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 16
          Top = 256
          Width = 80
          Height = 13
          Caption = 'C'#243'digo de barras'
          FocusControl = DBEdit4
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 40
          Width = 65
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
