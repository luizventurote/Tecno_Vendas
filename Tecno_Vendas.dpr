program Tecno_Vendas;

uses
  Forms,
  U_Login in '\\VBOXSVR\Repositories\software-eng-lab\trabalho-001\TecnoVendas_SistemaDeLogin\U_Login.pas' {F_LOGIN},
  U_DM in '\\VBOXSVR\Repositories\software-eng-lab\trabalho-001\TecnoVendas_SistemaDeLogin\U_DM.pas' {DM: TDataModule},
  U_SISTEMA in '\\VBOXSVR\Repositories\software-eng-lab\trabalho-001\TecnoVendas_SistemaDeLogin\U_SISTEMA.pas' {F_SISTEMA},
  U_Base in '\\VBOXSVR\Repositories\software-eng-lab\trabalho-001\TecnoVendas_TelaBase\U_Base.pas' {F_BASE},
  U_PermissoesDeTela in '\\VBOXSVR\Desktop\TecnoVendas_PermissoesDeTela\U_PermissoesDeTela.pas' {F_PERMISSOES};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TecnoVendas';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TF_LOGIN, F_LOGIN);
  Application.Run;
end.
