unit U_DM;

interface

uses
  SysUtils, Classes, DB, DBTables, Provider, DBClient, Dialogs;

type
  TDM = class(TDataModule)
    sistema_vendas: TDatabase;
    Q_Usuario: TQuery;
    M_Usuario: TClientDataSet;
    P_Usuario: TDataSetProvider;
    Q_UsuarioidUsuario: TIntegerField;
    Q_Usuarionome: TStringField;
    Q_Usuariosenha: TStringField;
    Q_Usuariologin: TStringField;
    M_UsuarioidUsuario: TIntegerField;
    M_Usuarionome: TStringField;
    M_Usuariosenha: TStringField;
    M_Usuariologin: TStringField;
    Q_PermissoesDeUsuario: TQuery;
    P_Cliente: TDataSetProvider;
    Q_Cliente: TQuery;
    M_Cliente: TClientDataSet;
    Q_ClienteidCliente: TIntegerField;
    Q_Clientenome: TStringField;
    Q_Clientetelefone: TStringField;
    Q_Clientelogradouro: TStringField;
    Q_Clientecnpj: TStringField;
    Q_Clienteestado: TStringField;
    Q_Clientepais: TStringField;
    Q_Clientenumero: TIntegerField;
    M_ClienteidCliente: TIntegerField;
    M_Clientenome: TStringField;
    M_Clientetelefone: TStringField;
    M_Clientelogradouro: TStringField;
    M_Clientecnpj: TStringField;
    M_Clienteestado: TStringField;
    M_Clientepais: TStringField;
    M_Clientenumero: TIntegerField;
    P_Produto: TDataSetProvider;
    Q_Produto: TQuery;
    M_Produto: TClientDataSet;
    Q_Aux: TQuery;
    Q_EntradaEstq: TQuery;
    P_EntradaEstq: TDataSetProvider;
    M_EntradaEstq: TClientDataSet;
    Q_EntradaEstqidEntradaEstoque: TIntegerField;
    Q_EntradaEstqidUsuario: TIntegerField;
    Q_EntradaEstqidProduto: TIntegerField;
    Q_EntradaEstqqtd_entradas: TIntegerField;
    M_EntradaEstqidEntradaEstoque: TIntegerField;
    M_EntradaEstqidUsuario: TIntegerField;
    M_EntradaEstqidProduto: TIntegerField;
    M_EntradaEstqqtd_entradas: TIntegerField;
    M_EntradaEstqUsuario: TStringField;
    M_EntradaEstqProduto: TStringField;
    M_Pedido: TClientDataSet;
    P_Pedido: TDataSetProvider;
    Q_Pedido: TQuery;
    M_Faturamento: TClientDataSet;
    P_Faturamento: TDataSetProvider;
    Q_Faturamento: TQuery;
    Q_FaturamentoidFaturamento: TIntegerField;
    Q_FaturamentoidPedido: TIntegerField;
    Q_Faturamentonum_nota_fiscal: TIntegerField;
    Q_Faturamentodata: TStringField;
    M_FaturamentoidFaturamento: TIntegerField;
    M_FaturamentoidPedido: TIntegerField;
    M_Faturamentonum_nota_fiscal: TIntegerField;
    M_Faturamentodata: TStringField;
    M_FaturamentoPedido: TStringField;
    M_ContasReceber: TClientDataSet;
    P_ContasReceber: TDataSetProvider;
    Q_ContasReceber: TQuery;
    Q_ContasReceberidContasReceber: TIntegerField;
    Q_ContasReceberidCliente: TIntegerField;
    Q_ContasReceberidDuplicata: TIntegerField;
    Q_ContasRecebernum_nota_fiscal: TIntegerField;
    Q_ContasRecebervencimento: TStringField;
    Q_ContasReceberdata_baixa: TStringField;
    M_ContasReceberidContasReceber: TIntegerField;
    M_ContasReceberidCliente: TIntegerField;
    M_ContasReceberidDuplicata: TIntegerField;
    M_ContasRecebernum_nota_fiscal: TIntegerField;
    M_ContasRecebervencimento: TStringField;
    M_ContasReceberdata_baixa: TStringField;
    M_ContasReceberCliente: TStringField;
    M_ContasReceberDuplicata: TStringField;
    M_ProdutoProduto: TStringField;
    M_PedidoProduto: TClientDataSet;
    P_PedidoProduto: TDataSetProvider;
    Q_PedidoProduto: TQuery;
    Q_PedidoProdutoidProduto: TIntegerField;
    Q_PedidoProdutoidPedido: TIntegerField;
    Q_PedidoProdutoqtd: TIntegerField;
    M_PedidoProdutoidProduto: TIntegerField;
    M_PedidoProdutoidPedido: TIntegerField;
    M_PedidoProdutoqtd: TIntegerField;
    Q_SaidaEstoque: TQuery;
    P_SaidaEstoque: TDataSetProvider;
    M_SaidaEstoque: TClientDataSet;
    Q_SaidaEstoqueidSaidaEstoque: TIntegerField;
    Q_SaidaEstoqueidUsuario: TIntegerField;
    Q_SaidaEstoqueidProduto: TIntegerField;
    Q_SaidaEstoqueqtd_saida: TIntegerField;
    M_SaidaEstoqueidSaidaEstoque: TIntegerField;
    M_SaidaEstoqueidUsuario: TIntegerField;
    M_SaidaEstoqueidProduto: TIntegerField;
    M_SaidaEstoqueqtd_saida: TIntegerField;
    M_SaidaEstoqueUsuario: TStringField;
    M_SaidaEstoqueProduto: TStringField;
    Q_ProdutoidProduto: TIntegerField;
    Q_Produtodescricao: TMemoField;
    Q_Produtoqtd_estoque: TIntegerField;
    Q_Produtovalor: TFloatField;
    Q_Produtocod_barra: TStringField;
    M_ProdutoidProduto: TIntegerField;
    M_Produtodescricao: TMemoField;
    M_Produtoqtd_estoque: TIntegerField;
    M_Produtovalor: TFloatField;
    M_Produtocod_barra: TStringField;
    Q_PedidoidPedido: TIntegerField;
    Q_PedidoidCliente: TIntegerField;
    Q_Pedidodata_pedido: TDateTimeField;
    Q_Pedidoprazo_pagamento: TIntegerField;
    Q_Pedidovalor: TFloatField;
    Q_Pedidoqtd: TIntegerField;
    M_PedidoidPedido: TIntegerField;
    M_PedidoidCliente: TIntegerField;
    M_Pedidodata_pedido: TDateTimeField;
    M_Pedidoprazo_pagamento: TIntegerField;
    M_Pedidovalor: TFloatField;
    M_Pedidoqtd: TIntegerField;
    M_PedidoCliente: TStringField;
    Q_Aux_2: TQuery;
    Q_Aux_3: TQuery;
    procedure M_UsuarioAfterPost(DataSet: TDataSet);
    procedure M_UsuarioAfterDelete(DataSet: TDataSet);
    procedure M_UsuarioAfterCancel(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure M_UsuarioAfterInsert(DataSet: TDataSet);
    procedure M_ClienteAfterInsert(DataSet: TDataSet);
    procedure M_ProdutoAfterInsert(DataSet: TDataSet);
    procedure M_ClienteAfterCancel(DataSet: TDataSet);
    procedure M_ClienteAfterDelete(DataSet: TDataSet);
    procedure M_ClienteAfterPost(DataSet: TDataSet);
    procedure M_ProdutoAfterPost(DataSet: TDataSet);
    procedure M_ProdutoAfterDelete(DataSet: TDataSet);
    procedure M_ProdutoAfterCancel(DataSet: TDataSet);
    procedure M_EntradaEstqAfterCancel(DataSet: TDataSet);
    procedure M_EntradaEstqAfterDelete(DataSet: TDataSet);
    procedure M_EntradaEstqAfterPost(DataSet: TDataSet);
    procedure M_EntradaEstqAfterInsert(DataSet: TDataSet);
    procedure M_PedidoAfterCancel(DataSet: TDataSet);
    procedure M_PedidoAfterDelete(DataSet: TDataSet);
    procedure M_PedidoAfterPost(DataSet: TDataSet);
    procedure M_PedidoAfterInsert(DataSet: TDataSet);
    procedure M_FaturamentoAfterCancel(DataSet: TDataSet);
    procedure M_FaturamentoAfterDelete(DataSet: TDataSet);
    procedure M_FaturamentoAfterPost(DataSet: TDataSet);
    procedure M_FaturamentoAfterInsert(DataSet: TDataSet);
    procedure M_ContasReceberAfterCancel(DataSet: TDataSet);
    procedure M_ContasReceberAfterDelete(DataSet: TDataSet);
    procedure M_ContasReceberAfterPost(DataSet: TDataSet);
    procedure M_ContasReceberAfterInsert(DataSet: TDataSet);
    procedure M_SaidaEstoqueAfterCancel(DataSet: TDataSet);
    procedure M_SaidaEstoqueAfterDelete(DataSet: TDataSet);
    procedure M_SaidaEstoqueAfterInsert(DataSet: TDataSet);
    procedure M_SaidaEstoqueAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario_ativo: string;
    id_usuario_ativo: integer;
    nome_usuario_ativo: string;
    syslog: TStringList;
    function buscaProximoParametro(p:string):integer;


    procedure addLog(Desc: String);
    function getSystemLog: TStrings;
    function closeSystemLog: integer;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.M_UsuarioAfterPost(DataSet: TDataSet);
begin
  M_Usuario.ApplyUpdates(-1);
end;

procedure TDM.M_UsuarioAfterDelete(DataSet: TDataSet);
begin
  M_Usuario.ApplyUpdates(-1);
end;

procedure TDM.M_UsuarioAfterCancel(DataSet: TDataSet);
begin
  M_Usuario.CancelUpdates;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  sistema_vendas.Close;
  DM.closeSystemLog();
end;


// -----------------------------------------------------------------------------
// Busca o próximo parâmetro
// -----------------------------------------------------------------------------
function TDM.buscaProximoParametro(p: string): integer;
var i : integer;
begin
  Q_Aux.SQL.Text := 'select valor from parametros where parametro =:p';
  Q_Aux.ParamByName('p').AsString := p;
  Q_Aux.Open;
  
  if not Q_Aux.IsEmpty then
  begin
    i := StrToInt(Q_Aux.Fields[0].AsString);
    Q_Aux.SQL.Text := 'update parametros set valor =:v where parametro =:p';
    Q_Aux.ParamByName('p').AsString := p;
    Q_Aux.ParamByName('v').AsString := IntToStr(i+1);
    Q_Aux.ExecSQL;
    buscaProximoParametro := i;
  end
  else
    showmessage('Parametro Inválido');
end;

procedure TDM.M_UsuarioAfterInsert(DataSet: TDataSet);
begin
  M_UsuarioidUsuario.AsInteger := buscaProximoParametro('SeqUsuario');
end;

procedure TDM.M_ClienteAfterInsert(DataSet: TDataSet);
begin
  M_ClienteidCliente.AsInteger := buscaProximoParametro('SeqCliente');
end;

procedure TDM.M_ProdutoAfterInsert(DataSet: TDataSet);
begin
  M_ProdutoidProduto.AsInteger := buscaProximoParametro('SeqProduto');
end;

procedure TDM.M_ClienteAfterCancel(DataSet: TDataSet);
begin
  M_Cliente.CancelUpdates;
end;

procedure TDM.M_ClienteAfterDelete(DataSet: TDataSet);
begin
  M_Cliente.ApplyUpdates(-1);
end;

procedure TDM.M_ClienteAfterPost(DataSet: TDataSet);
begin
  M_Cliente.ApplyUpdates(-1);
end;

procedure TDM.M_ProdutoAfterPost(DataSet: TDataSet);
begin
  M_Produto.ApplyUpdates(-1);
end;

procedure TDM.M_ProdutoAfterDelete(DataSet: TDataSet);
begin
  M_Produto.ApplyUpdates(-1);
end;

procedure TDM.M_ProdutoAfterCancel(DataSet: TDataSet);
begin
  M_Produto.CancelUpdates;
end;

procedure TDM.M_EntradaEstqAfterCancel(DataSet: TDataSet);
begin
  M_EntradaEstq.CancelUpdates;
end;

procedure TDM.M_EntradaEstqAfterDelete(DataSet: TDataSet);
begin
  M_EntradaEstq.ApplyUpdates(-1);
end;

procedure TDM.M_EntradaEstqAfterPost(DataSet: TDataSet);
begin
  M_EntradaEstq.ApplyUpdates(-1);
end;

procedure TDM.M_EntradaEstqAfterInsert(DataSet: TDataSet);
begin
  M_EntradaEstqidEntradaEstoque.AsInteger := buscaProximoParametro('SeqEntradaEstoque');
end;

procedure TDM.M_PedidoAfterCancel(DataSet: TDataSet);
begin
  M_Pedido.CancelUpdates;
end;

procedure TDM.M_PedidoAfterDelete(DataSet: TDataSet);
begin
  M_Pedido.ApplyUpdates(-1);
end;

procedure TDM.M_PedidoAfterPost(DataSet: TDataSet);
begin
  M_Pedido.ApplyUpdates(-1);
end;

procedure TDM.M_PedidoAfterInsert(DataSet: TDataSet);
begin
  M_PedidoidPedido.AsInteger := buscaProximoParametro('SeqPedido');
end;

procedure TDM.M_FaturamentoAfterCancel(DataSet: TDataSet);
begin
  M_Faturamento.CancelUpdates;
end;

procedure TDM.M_FaturamentoAfterDelete(DataSet: TDataSet);
begin
  M_Faturamento.ApplyUpdates(-1);
end;

procedure TDM.M_FaturamentoAfterPost(DataSet: TDataSet);
begin
  M_Faturamento.ApplyUpdates(-1);
end;

procedure TDM.M_FaturamentoAfterInsert(DataSet: TDataSet);
begin
  M_FaturamentoidFaturamento.AsInteger := buscaProximoParametro('SeqFaturamento');
end;

procedure TDM.M_ContasReceberAfterCancel(DataSet: TDataSet);
begin
  M_ContasReceber.CancelUpdates;
end;

procedure TDM.M_ContasReceberAfterDelete(DataSet: TDataSet);
begin
  M_ContasReceber.ApplyUpdates(-1);
end;

procedure TDM.M_ContasReceberAfterPost(DataSet: TDataSet);
begin
  M_ContasReceber.ApplyUpdates(-1);
end;

procedure TDM.M_ContasReceberAfterInsert(DataSet: TDataSet);
begin
  M_ContasReceberidContasReceber.AsInteger := buscaProximoParametro('SeqContasReceber');
end;

procedure TDM.M_SaidaEstoqueAfterCancel(DataSet: TDataSet);
begin

  M_SaidaEstoque.CancelUpdates;

end;

procedure TDM.M_SaidaEstoqueAfterDelete(DataSet: TDataSet);
begin
  M_SaidaEstoque.ApplyUpdates(-1);
end;

procedure TDM.M_SaidaEstoqueAfterInsert(DataSet: TDataSet);
begin
  M_SaidaEstoqueidSaidaEstoque.AsInteger := buscaProximoParametro('SeqSaidaEstoque');
end;

procedure TDM.M_SaidaEstoqueAfterPost(DataSet: TDataSet);
begin
  M_SaidaEstoque.ApplyUpdates(-1);
end;

// Construtor
procedure TDM.DataModuleCreate(Sender: TObject);
var
  F: TextFile;
begin

  // Create the String List to store the log
  Self.syslog := TStringList.Create;

  if FileExists('log.txt') then
  begin
    Self.syslog.LoadFromFile('log.txt');
  end
  else
  begin

      AssignFile(F,'log.txt');

      Rewrite(f); //abre o arquivo para escrita

      Closefile(f); //fecha o handle de arquivo

  end;

end;

// Add log
procedure TDM.addLog(Desc: String);
begin
  Self.syslog.Add( DateToStr(date) + ' ' + TimeToStr(time) + ' | ' + usuario_ativo + ' | ' +Desc);
end;

// Get system log
function TDM.getSystemLog;
begin
  Result := Self.syslog;
end;

// CLose system log
function TDM.closeSystemLog;
begin

  // Save log to file
  Self.syslog.SaveToFile('log.txt');

  Result := 1;

end;

end.
