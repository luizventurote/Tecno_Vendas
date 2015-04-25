unit U_SISTEMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls;

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

end.
