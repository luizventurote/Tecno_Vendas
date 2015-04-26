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
  U_Produto in 'U_Produto.pas' {F_PRODUTO};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TecnoVendas';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TF_LOGIN, F_LOGIN);
  Application.CreateForm(TF_PRODUTO, F_PRODUTO);
  Application.Run;
end.