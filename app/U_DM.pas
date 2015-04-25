unit U_DM;

interface

uses
  SysUtils, Classes, DB, DBTables, Provider, DBClient;

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
    Q_ProdutoidProduto: TIntegerField;
    Q_Produtodescricao: TMemoField;
    Q_Produtoqtd_estoque: TIntegerField;
    Q_Produtovalor: TFloatField;
    Q_Produtocod_barra: TIntegerField;
    M_ProdutoidProduto: TIntegerField;
    M_Produtodescricao: TMemoField;
    M_Produtoqtd_estoque: TIntegerField;
    M_Produtovalor: TFloatField;
    M_Produtocod_barra: TIntegerField;
    procedure M_UsuarioAfterPost(DataSet: TDataSet);
    procedure M_UsuarioAfterDelete(DataSet: TDataSet);
    procedure M_UsuarioAfterCancel(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario_ativo: string;
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
end;

end.
