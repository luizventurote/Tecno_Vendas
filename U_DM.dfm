object DM: TDM
  OldCreateOrder = False
  Left = 383
  Top = 194
  Height = 282
  Width = 358
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
    Left = 32
    Top = 112
    object Q_UsuarioidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'SISTEMA_VENDAS.usuario.idUsuario'
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
    Left = 168
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
    Left = 96
    Top = 112
  end
end
