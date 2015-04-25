unit U_SISTEMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, StdCtrls, U_DM;

type
  TF_SISTEMA = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Arquiv1: TMenuItem;
    Fechar1: TMenuItem;
    StatusBar1: TStatusBar;
    Cliente1: TMenuItem;
    Produto1: TMenuItem;
    Estoque1: TMenuItem;
    Entradanoestoque1: TMenuItem;
    Pedido1: TMenuItem;
    Usurios1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Fechar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChangeFocus(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_SISTEMA: TF_SISTEMA;

implementation

uses U_Login, U_Usuario, U_Cliente, U_PermissoesDeTela,
  U_PermissoesUsuario, U_Produto;

{$R *.dfm}

procedure TF_SISTEMA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_LOGIN.Close;
end;

procedure TF_SISTEMA.Fechar1Click(Sender: TObject);
begin
  F_SISTEMA.Close;
  F_LOGIN.Close;
end;

procedure TF_SISTEMA.FormCreate(Sender: TObject);
var
  index: integer;
begin

  // Faz referência de uma procedure em um evento
  for index := 0 to ComponentCount - 1 do
    if Components[index] is TEdit then
      begin
      (Components[index] as TEdit).OnEnter := ChangeFocus;
      end;

  // Exibe o usuário ativo no sistema
  StatusBar1.Panels[0].Text := 'Usuário: ' + DM.usuario_ativo;

end;

// Altera a cor do foco do edit
procedure TF_SISTEMA.ChangeFocus(Sender: TObject);
var
  index: integer;
  edit: TEdit;
begin
  for index := 0 to ComponentCount - 1 do
    // Verifica se é do tipo TEdit
    if Components[index] is TEdit then
    begin
      // Faz um type-casting (Conversão de tipos) pata o tipo TEdit
      edit := Components[index] as TEdit;

      // Verifica se o Edit está com foco
      if edit.Focused then
        edit.Color := $DCF8FF
      else
        edit.Color := clWindow;
    end;
end;

procedure TF_SISTEMA.Usurios1Click(Sender: TObject);
begin

  // Abre From
  Application.CreateForm(TF_USUARIO, F_USUARIO);
  F_USUARIO.show;

end;

procedure TF_SISTEMA.Cliente1Click(Sender: TObject);
begin

  // Abre From
  Application.CreateForm(TF_CLIENTE, F_CLIENTE);
  F_CLIENTE.show;

end;

procedure TF_SISTEMA.Button1Click(Sender: TObject);
begin
// Abre From
  Application.CreateForm(TF_PermissoesUsuario, F_PermissoesUsuario);
  F_PermissoesUsuario.show;
end;

procedure TF_SISTEMA.Produto1Click(Sender: TObject);
begin

  // Abre From
  Application.CreateForm(TF_PRODUTO, F_PRODUTO);
  F_PRODUTO.show;

end;

end.
