inherited F_CLIENTE: TF_CLIENTE
  Left = 465
  Top = 208
  Caption = 'Cliente'
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
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 28
          Height = 13
          Caption = 'Nome'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 16
          Top = 104
          Width = 42
          Height = 13
          Caption = 'Telefone'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 16
          Top = 184
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 16
          Top = 144
          Width = 27
          Height = 13
          Caption = 'CNPJ'
          FocusControl = editCNPJ
        end
        object Label6: TLabel
          Left = 16
          Top = 224
          Width = 58
          Height = 13
          Caption = 'UF / Estado'
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 16
          Top = 264
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 16
          Top = 304
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = DBEdit8
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 40
          Width = 134
          Height = 21
          DataField = 'idCliente'
          DataSource = DS
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 16
          Top = 80
          Width = 457
          Height = 21
          DataField = 'nome'
          DataSource = DS
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 120
          Width = 199
          Height = 21
          DataField = 'telefone'
          DataSource = DS
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 16
          Top = 200
          Width = 458
          Height = 21
          DataField = 'logradouro'
          DataSource = DS
          TabOrder = 4
        end
        object editCNPJ: TDBEdit
          Left = 16
          Top = 160
          Width = 201
          Height = 21
          DataField = 'cnpj'
          DataSource = DS
          TabOrder = 3
          OnExit = editCNPJExit
        end
        object DBEdit6: TDBEdit
          Left = 16
          Top = 240
          Width = 41
          Height = 21
          DataField = 'estado'
          DataSource = DS
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 16
          Top = 280
          Width = 201
          Height = 21
          DataField = 'pais'
          DataSource = DS
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 16
          Top = 320
          Width = 134
          Height = 21
          DataField = 'numero'
          DataSource = DS
          TabOrder = 7
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM.M_Cliente
  end
end
