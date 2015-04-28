object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 416
  Top = 260
  Height = 591
  Width = 714
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
    Top = 24
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
    Left = 144
    Top = 24
  end
  object P_Cliente: TDataSetProvider
    DataSet = Q_Cliente
    Left = 128
    Top = 184
  end
  object Q_Cliente: TQuery
    DatabaseName = 'sistema_vendas'
    SQL.Strings = (
      'select * from cliente')
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
    AfterInsert = M_ClienteAfterInsert
    AfterPost = M_ClienteAfterPost
    AfterCancel = M_ClienteAfterCancel
    AfterDelete = M_ClienteAfterDelete
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
      'select * from produto')
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
    object Q_Produtocod_barra: TStringField
      FieldName = 'cod_barra'
      Origin = 'SISTEMA_VENDAS.produto.cod_barra'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object M_Produto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_Produto'
    AfterInsert = M_ProdutoAfterInsert
    AfterPost = M_ProdutoAfterPost
    AfterCancel = M_ProdutoAfterCancel
    AfterDelete = M_ProdutoAfterDelete
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
    object M_Produtocod_barra: TStringField
      FieldName = 'cod_barra'
      Size = 50
    end
    object M_ProdutoProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'Produto'
      LookupDataSet = Q_Produto
      LookupKeyFields = 'idProduto'
      LookupResultField = 'idProduto'
      KeyFields = 'idProduto'
      Lookup = True
    end
  end
  object Q_Aux: TQuery
    DatabaseName = 'sistema_vendas'
    Left = 256
    Top = 24
  end
  object Q_EntradaEstq: TQuery
    DatabaseName = 'sistema_vendas'
    SQL.Strings = (
      'select * from entrada_estoque')
    Left = 40
    Top = 336
    object Q_EntradaEstqidEntradaEstoque: TIntegerField
      FieldName = 'idEntradaEstoque'
      Origin = 'SISTEMA_VENDAS.entrada_estoque.idEntradaEstoque'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_EntradaEstqidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'SISTEMA_VENDAS.entrada_estoque.idUsuario'
      ProviderFlags = [pfInUpdate]
    end
    object Q_EntradaEstqidProduto: TIntegerField
      FieldName = 'idProduto'
      Origin = 'SISTEMA_VENDAS.entrada_estoque.idProduto'
      ProviderFlags = [pfInUpdate]
    end
    object Q_EntradaEstqqtd_entradas: TIntegerField
      FieldName = 'qtd_entradas'
      Origin = 'SISTEMA_VENDAS.entrada_estoque.qtd_entradas'
      ProviderFlags = [pfInUpdate]
    end
  end
  object P_EntradaEstq: TDataSetProvider
    DataSet = Q_EntradaEstq
    Left = 128
    Top = 336
  end
  object M_EntradaEstq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_EntradaEstq'
    AfterInsert = M_EntradaEstqAfterInsert
    AfterPost = M_EntradaEstqAfterPost
    AfterCancel = M_EntradaEstqAfterCancel
    AfterDelete = M_EntradaEstqAfterDelete
    Left = 216
    Top = 336
    object M_EntradaEstqidEntradaEstoque: TIntegerField
      FieldName = 'idEntradaEstoque'
    end
    object M_EntradaEstqidUsuario: TIntegerField
      FieldName = 'idUsuario'
    end
    object M_EntradaEstqidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object M_EntradaEstqqtd_entradas: TIntegerField
      FieldName = 'qtd_entradas'
    end
    object M_EntradaEstqUsuario: TStringField
      FieldKind = fkLookup
      FieldName = 'Usuario'
      LookupDataSet = Q_Usuario
      LookupKeyFields = 'idUsuario'
      LookupResultField = 'nome'
      KeyFields = 'idUsuario'
      Size = 30
      Lookup = True
    end
    object M_EntradaEstqProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'Produto'
      LookupDataSet = Q_Produto
      LookupKeyFields = 'idProduto'
      LookupResultField = 'descricao'
      KeyFields = 'idProduto'
      Size = 30
      Lookup = True
    end
  end
  object M_Pedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_Pedido'
    AfterInsert = M_PedidoAfterInsert
    AfterPost = M_PedidoAfterPost
    AfterCancel = M_PedidoAfterCancel
    AfterDelete = M_PedidoAfterDelete
    Left = 216
    Top = 416
    object M_PedidoidPedido: TIntegerField
      FieldName = 'idPedido'
    end
    object M_PedidoidCliente: TIntegerField
      FieldName = 'idCliente'
    end
    object M_Pedidodata_pedido: TStringField
      FieldName = 'data_pedido'
      Size = 45
    end
    object M_Pedidoprazo_pagamento: TIntegerField
      FieldName = 'prazo_pagamento'
    end
    object M_Pedidovalor: TFloatField
      FieldName = 'valor'
    end
    object M_Pedidoqtd: TIntegerField
      FieldName = 'qtd'
    end
    object M_PedidoCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'Cliente'
      LookupDataSet = Q_Cliente
      LookupKeyFields = 'idCliente'
      LookupResultField = 'nome'
      KeyFields = 'idCliente'
      Lookup = True
    end
  end
  object P_Pedido: TDataSetProvider
    DataSet = Q_Pedido
    Left = 128
    Top = 416
  end
  object Q_Pedido: TQuery
    DatabaseName = 'sistema_vendas'
    SQL.Strings = (
      'select * from pedido')
    Left = 40
    Top = 416
    object Q_PedidoidPedido: TIntegerField
      FieldName = 'idPedido'
      Origin = 'SISTEMA_VENDAS.pedido.idPedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_PedidoidCliente: TIntegerField
      FieldName = 'idCliente'
      Origin = 'SISTEMA_VENDAS.pedido.idCliente'
      ProviderFlags = [pfInUpdate]
    end
    object Q_Pedidodata_pedido: TStringField
      FieldName = 'data_pedido'
      Origin = 'SISTEMA_VENDAS.pedido.data_pedido'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object Q_Pedidoprazo_pagamento: TIntegerField
      FieldName = 'prazo_pagamento'
      Origin = 'SISTEMA_VENDAS.pedido.prazo_pagamento'
      ProviderFlags = [pfInUpdate]
    end
    object Q_Pedidovalor: TFloatField
      FieldName = 'valor'
      Origin = 'SISTEMA_VENDAS.pedido.valor'
      ProviderFlags = [pfInUpdate]
    end
    object Q_Pedidoqtd: TIntegerField
      FieldName = 'qtd'
      Origin = 'SISTEMA_VENDAS.pedido.qtd'
      ProviderFlags = [pfInUpdate]
    end
  end
  object M_Faturamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_Faturamento'
    AfterInsert = M_FaturamentoAfterInsert
    AfterPost = M_FaturamentoAfterPost
    AfterCancel = M_FaturamentoAfterCancel
    AfterDelete = M_FaturamentoAfterDelete
    Left = 216
    Top = 480
    object M_FaturamentoidFaturamento: TIntegerField
      FieldName = 'idFaturamento'
    end
    object M_FaturamentoidPedido: TIntegerField
      FieldName = 'idPedido'
    end
    object M_Faturamentonum_nota_fiscal: TIntegerField
      FieldName = 'num_nota_fiscal'
    end
    object M_Faturamentodata: TStringField
      FieldName = 'data'
      Size = 45
    end
    object M_FaturamentoPedido: TStringField
      FieldKind = fkLookup
      FieldName = 'Pedido'
      LookupDataSet = Q_Pedido
      LookupKeyFields = 'idPedido'
      LookupResultField = 'idPedido'
      KeyFields = 'idPedido'
      Lookup = True
    end
  end
  object P_Faturamento: TDataSetProvider
    DataSet = Q_Faturamento
    Left = 128
    Top = 480
  end
  object Q_Faturamento: TQuery
    DatabaseName = 'sistema_vendas'
    SQL.Strings = (
      'select * from faturamento')
    Left = 40
    Top = 480
    object Q_FaturamentoidFaturamento: TIntegerField
      FieldName = 'idFaturamento'
      Origin = 'SISTEMA_VENDAS.faturamento.idFaturamento'
    end
    object Q_FaturamentoidPedido: TIntegerField
      FieldName = 'idPedido'
      Origin = 'SISTEMA_VENDAS.faturamento.idPedido'
    end
    object Q_Faturamentonum_nota_fiscal: TIntegerField
      FieldName = 'num_nota_fiscal'
      Origin = 'SISTEMA_VENDAS.faturamento.num_nota_fiscal'
    end
    object Q_Faturamentodata: TStringField
      FieldName = 'data'
      Origin = 'SISTEMA_VENDAS.faturamento.data'
      Size = 45
    end
  end
  object M_ContasReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_ContasReceber'
    AfterInsert = M_ContasReceberAfterInsert
    AfterPost = M_ContasReceberAfterPost
    AfterCancel = M_ContasReceberAfterCancel
    AfterDelete = M_ContasReceberAfterDelete
    Left = 592
    Top = 112
    object M_ContasReceberidContasReceber: TIntegerField
      FieldName = 'idContasReceber'
    end
    object M_ContasReceberidCliente: TIntegerField
      FieldName = 'idCliente'
    end
    object M_ContasReceberidDuplicata: TIntegerField
      FieldName = 'idDuplicata'
    end
    object M_ContasRecebernum_nota_fiscal: TIntegerField
      FieldName = 'num_nota_fiscal'
    end
    object M_ContasRecebervencimento: TStringField
      FieldName = 'vencimento'
      Size = 50
    end
    object M_ContasReceberdata_baixa: TStringField
      FieldName = 'data_baixa'
      Size = 50
    end
    object M_ContasReceberCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'Cliente'
      LookupDataSet = Q_Cliente
      LookupKeyFields = 'idCliente'
      LookupResultField = 'nome'
      KeyFields = 'idCliente'
      Lookup = True
    end
    object M_ContasReceberDuplicata: TStringField
      FieldKind = fkLookup
      FieldName = 'Duplicata'
      LookupDataSet = Q_Faturamento
      LookupKeyFields = 'idFaturamento'
      LookupResultField = 'idFaturamento'
      KeyFields = 'idDuplicata'
      Lookup = True
    end
  end
  object P_ContasReceber: TDataSetProvider
    DataSet = Q_ContasReceber
    Left = 464
    Top = 112
  end
  object Q_ContasReceber: TQuery
    DatabaseName = 'sistema_vendas'
    SQL.Strings = (
      'select * from contas_receber')
    Left = 344
    Top = 112
    object Q_ContasReceberidContasReceber: TIntegerField
      FieldName = 'idContasReceber'
      Origin = 'SISTEMA_VENDAS.contas_receber.idContasReceber'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_ContasReceberidCliente: TIntegerField
      FieldName = 'idCliente'
      Origin = 'SISTEMA_VENDAS.contas_receber.idCliente'
      ProviderFlags = [pfInUpdate]
    end
    object Q_ContasReceberidDuplicata: TIntegerField
      FieldName = 'idDuplicata'
      Origin = 'SISTEMA_VENDAS.contas_receber.idDuplicata'
      ProviderFlags = [pfInUpdate]
    end
    object Q_ContasRecebernum_nota_fiscal: TIntegerField
      FieldName = 'num_nota_fiscal'
      Origin = 'SISTEMA_VENDAS.contas_receber.num_nota_fiscal'
      ProviderFlags = [pfInUpdate]
    end
    object Q_ContasRecebervencimento: TStringField
      FieldName = 'vencimento'
      Origin = 'SISTEMA_VENDAS.contas_receber.vencimento'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Q_ContasReceberdata_baixa: TStringField
      FieldName = 'data_baixa'
      Origin = 'SISTEMA_VENDAS.contas_receber.data_baixa'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object M_PedidoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_PedidoProduto'
    Left = 592
    Top = 184
    object M_PedidoProdutoidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object M_PedidoProdutoidPedido: TIntegerField
      FieldName = 'idPedido'
    end
    object M_PedidoProdutoqtd: TIntegerField
      FieldName = 'qtd'
    end
  end
  object P_PedidoProduto: TDataSetProvider
    DataSet = Q_PedidoProduto
    Left = 464
    Top = 184
  end
  object Q_PedidoProduto: TQuery
    DatabaseName = 'sistema_vendas'
    SQL.Strings = (
      'select * from Produto_Pedido_Item')
    Left = 344
    Top = 184
    object Q_PedidoProdutoidProduto: TIntegerField
      FieldName = 'idProduto'
      Origin = 'SISTEMA_VENDAS.Produto_Pedido_Item.idProduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_PedidoProdutoidPedido: TIntegerField
      FieldName = 'idPedido'
      Origin = 'SISTEMA_VENDAS.Produto_Pedido_Item.idPedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_PedidoProdutoqtd: TIntegerField
      FieldName = 'qtd'
      Origin = 'SISTEMA_VENDAS.Produto_Pedido_Item.qtd'
      ProviderFlags = [pfInUpdate]
    end
  end
  object Q_SaidaEstoque: TQuery
    DatabaseName = 'sistema_vendas'
    SQL.Strings = (
      'select * from saida_estoque')
    Left = 336
    Top = 256
    object Q_SaidaEstoqueidSaidaEstoque: TIntegerField
      FieldName = 'idSaidaEstoque'
      Origin = 'SISTEMA_VENDAS.saida_estoque.idSaidaEstoque'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_SaidaEstoqueidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'SISTEMA_VENDAS.saida_estoque.idUsuario'
      ProviderFlags = [pfInUpdate]
    end
    object Q_SaidaEstoqueidProduto: TIntegerField
      FieldName = 'idProduto'
      Origin = 'SISTEMA_VENDAS.saida_estoque.idProduto'
      ProviderFlags = [pfInUpdate]
    end
    object Q_SaidaEstoqueqtd_saida: TIntegerField
      FieldName = 'qtd_saida'
      Origin = 'SISTEMA_VENDAS.saida_estoque.qtd_saida'
      ProviderFlags = [pfInUpdate]
    end
  end
  object P_SaidaEstoque: TDataSetProvider
    DataSet = Q_SaidaEstoque
    Left = 424
    Top = 256
  end
  object M_SaidaEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_SaidaEstoque'
    AfterInsert = M_SaidaEstoqueAfterInsert
    AfterPost = M_SaidaEstoqueAfterPost
    AfterCancel = M_SaidaEstoqueAfterCancel
    AfterDelete = M_SaidaEstoqueAfterDelete
    Left = 512
    Top = 256
    object M_SaidaEstoqueidSaidaEstoque: TIntegerField
      FieldName = 'idSaidaEstoque'
    end
    object M_SaidaEstoqueidUsuario: TIntegerField
      FieldName = 'idUsuario'
    end
    object M_SaidaEstoqueidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object M_SaidaEstoqueqtd_saida: TIntegerField
      FieldName = 'qtd_saida'
    end
    object M_SaidaEstoqueUsuario: TStringField
      FieldKind = fkLookup
      FieldName = 'Usuario'
      LookupDataSet = Q_Usuario
      LookupKeyFields = 'idUsuario'
      LookupResultField = 'nome'
      KeyFields = 'idUsuario'
      Lookup = True
    end
    object M_SaidaEstoqueProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'Produto'
      LookupDataSet = Q_Produto
      LookupKeyFields = 'idProduto'
      LookupResultField = 'descricao'
      KeyFields = 'idProduto'
      Size = 40
      Lookup = True
    end
  end
end
