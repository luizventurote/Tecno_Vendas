object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 439
  Top = 246
  Height = 521
  Width = 342
  object sistema_vendas: TDatabase
    AliasName = 'ODBC_VENDAS'
    DatabaseName = 'sistema_vendas'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME='
      'USER NAME=sa'
      'ODBC DSN=ODBC_VENDAS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'SQLQRYMODE='
      'LANGDRIVER='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'PASSWORD=123456')
    SessionName = 'Default'
    Left = 40
    Top = 32
  end
  object Q_Usuario: TQuery
    DatabaseName = 'sistema_vendas'
    SQL.Strings = (
      'select * from usuario')
    Left = 40
    Top = 112
    object Q_UsuarioidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'SISTEMA_VENDAS.usuario.idUsuario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_Usuarionome: TStringField
      FieldName = 'nome'
      Origin = 'SISTEMA_VENDAS.usuario.nome'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object Q_Usuariosenha: TStringField
      FieldName = 'senha'
      Origin = 'SISTEMA_VENDAS.usuario.senha'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object Q_Usuariologin: TStringField
      FieldName = 'login'
      Origin = 'SISTEMA_VENDAS.usuario.login'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
  end
  object M_Usuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_Usuario'
    AfterInsert = M_UsuarioAfterInsert
    AfterPost = M_UsuarioAfterPost
    AfterCancel = M_UsuarioAfterCancel
    AfterDelete = M_UsuarioAfterDelete
    Left = 216
    Top = 112
    object M_UsuarioidUsuario: TIntegerField
      FieldName = 'idUsuario'
    end
    object M_Usuarionome: TStringField
      FieldName = 'nome'
      Size = 45
    end
    object M_Usuariosenha: TStringField
      FieldName = 'senha'
      Size = 45
    end
    object M_Usuariologin: TStringField
      FieldName = 'login'
      Size = 45
    end
  end
  object P_Usuario: TDataSetProvider
    DataSet = Q_Usuario
    Left = 128
    Top = 112
  end
  object Q_PermissoesDeUsuario: TQuery
    DatabaseName = 'sistema_vendas'
    Left = 160
    Top = 32
  end
  object P_Cliente: TDataSetProvider
    DataSet = Q_Cliente
    Left = 128
    Top = 184
  end
  object Q_Cliente: TQuery
    DatabaseName = 'sistema_vendas'
    SQL.Strings = (
      'select *from cliente')
    Left = 40
    Top = 184
    object Q_ClienteidCliente: TIntegerField
      FieldName = 'idCliente'
      Origin = 'SISTEMA_VENDAS.cliente.idCliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_Clientenome: TStringField
      FieldName = 'nome'
      Origin = 'SISTEMA_VENDAS.cliente.nome'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Q_Clientetelefone: TStringField
      FieldName = 'telefone'
      Origin = 'SISTEMA_VENDAS.cliente.telefone'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Q_Clientelogradouro: TStringField
      FieldName = 'logradouro'
      Origin = 'SISTEMA_VENDAS.cliente.logradouro'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object Q_Clientecnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'SISTEMA_VENDAS.cliente.cnpj'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Q_Clienteestado: TStringField
      FieldName = 'estado'
      Origin = 'SISTEMA_VENDAS.cliente.estado'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object Q_Clientepais: TStringField
      FieldName = 'pais'
      Origin = 'SISTEMA_VENDAS.cliente.pais'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object Q_Clientenumero: TIntegerField
      FieldName = 'numero'
      Origin = 'SISTEMA_VENDAS.cliente.numero'
      ProviderFlags = [pfInUpdate]
    end
  end
  object M_Cliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_Cliente'
    Left = 216
    Top = 184
    object M_ClienteidCliente: TIntegerField
      FieldName = 'idCliente'
    end
    object M_Clientenome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object M_Clientetelefone: TStringField
      FieldName = 'telefone'
      Size = 15
    end
    object M_Clientelogradouro: TStringField
      FieldName = 'logradouro'
      Size = 150
    end
    object M_Clientecnpj: TStringField
      FieldName = 'cnpj'
      Size = 50
    end
    object M_Clienteestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object M_Clientepais: TStringField
      FieldName = 'pais'
      Size = 45
    end
    object M_Clientenumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object P_Produto: TDataSetProvider
    DataSet = Q_Produto
    Left = 128
    Top = 256
  end
  object Q_Produto: TQuery
    DatabaseName = 'sistema_vendas'
    SQL.Strings = (
      'select *from produto')
    Left = 40
    Top = 256
    object Q_ProdutoidProduto: TIntegerField
      FieldName = 'idProduto'
      Origin = 'SISTEMA_VENDAS.produto.idProduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_Produtodescricao: TMemoField
      FieldName = 'descricao'
      Origin = 'SISTEMA_VENDAS.produto.descricao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object Q_Produtoqtd_estoque: TIntegerField
      FieldName = 'qtd_estoque'
      Origin = 'SISTEMA_VENDAS.produto.qtd_estoque'
      ProviderFlags = [pfInUpdate]
    end
    object Q_Produtovalor: TFloatField
      FieldName = 'valor'
      Origin = 'SISTEMA_VENDAS.produto.valor'
      ProviderFlags = [pfInUpdate]
    end
    object Q_Produtocod_barra: TIntegerField
      FieldName = 'cod_barra'
      Origin = 'SISTEMA_VENDAS.produto.cod_barra'
      ProviderFlags = [pfInUpdate]
    end
  end
  object M_Produto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_Produto'
    Left = 216
    Top = 256
    object M_ProdutoidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object M_Produtodescricao: TMemoField
      FieldName = 'descricao'
      BlobType = ftMemo
      Size = 1
    end
    object M_Produtoqtd_estoque: TIntegerField
      FieldName = 'qtd_estoque'
    end
    object M_Produtovalor: TFloatField
      FieldName = 'valor'
    end
    object M_Produtocod_barra: TIntegerField
      FieldName = 'cod_barra'
    end
  end
  object Q_Aux: TQuery
    DatabaseName = 'sistema_vendas'
    Left = 264
    Top = 32
  end
end
