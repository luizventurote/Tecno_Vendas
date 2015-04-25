unit U_SISTEMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, StdCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_SISTEMA: TF_SISTEMA;

implementation

uses U_Login;

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
  // Faz refer�ncia de uma procedure em um evento
  for index := 0 to ComponentCount - 1 do
    if Components[index] is TEdit then
      begin
      (Components[index] as TEdit).OnEnter := ChangeFocus;
      end;
end;

// Altera a cor do foco do edit
procedure TF_SISTEMA.ChangeFocus(Sender: TObject);
var
  index: integer;
  edit: TEdit;
begin
  for index := 0 to ComponentCount - 1 do
    // Verifica se � do tipo TEdit
    if Components[index] is TEdit then
    begin
      // Faz um type-casting (Convers�o de tipos) pata o tipo TEdit
      edit := Components[index] as TEdit;

      // Verifica se o Edit est� com foco
      if edit.Focused then
        edit.Color := $DCF8FF
      else
        edit.Color := clWindow;
    end;
end;

end.
