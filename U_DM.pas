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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.