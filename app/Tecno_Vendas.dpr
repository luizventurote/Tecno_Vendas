program Tecno_Vendas;

uses
  Forms,
  U_Login in 'U_Login.pas' {F_LOGIN},
  U_DM in 'U_DM.pas' {DM: TDataModule},
  U_SISTEMA in 'U_SISTEMA.pas' {F_SISTEMA},
  U_Base in 'U_Base.pas' {F_BASE},
  U_PermissoesDeTela in 'U_PermissoesDeTela.pas' {F_PERMISSOES},
  U_Usuario in 'U_Usuario.pas' {F_USUARIO},
  U_Cliente in 'U_Cliente.pas' {F_CLIENTE},
  U_Produto in 'U_Produto.pas' {F_PRODUTO},
  U_EntradaEstoque in 'U_EntradaEstoque.pas' {F_ENTRADA_ESTOQUE},
  U_Pedido in 'U_Pedido.pas' {F_PEDIDO},
  U_Faturamento in 'U_Faturamento.pas' {F_FATURAMENTO},
  U_ContasReceber in 'U_ContasReceber.pas' {F_CONTAS_RECEBER},
  U_SaidaEstoque in 'U_SaidaEstoque.pas' {F_SAIDA_ESTOQUE},
  U_Log in 'U_Log.pas' {F_LOG},
  u_relatorios in 'u_relatorios.pas' {f_relatorios};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TecnoVendas';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TF_LOGIN, F_LOGIN);
  Application.CreateForm(TF_PRODUTO, F_PRODUTO);
  Application.CreateForm(TF_ENTRADA_ESTOQUE, F_ENTRADA_ESTOQUE);
  Application.CreateForm(TF_PEDIDO, F_PEDIDO);
  Application.CreateForm(TF_FATURAMENTO, F_FATURAMENTO);
  Application.CreateForm(TF_CONTAS_RECEBER, F_CONTAS_RECEBER);
  Application.CreateForm(TF_SAIDA_ESTOQUE, F_SAIDA_ESTOQUE);
  Application.CreateForm(Tf_relatorios, f_relatorios);
  Application.Run;
end.
