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
    Usurios1: TMenuItem;
    Vendas1: TMenuItem;
    Pedido1: TMenuItem;
    Faturamento1: TMenuItem;
    Contas1: TMenuItem;
    Contasareceber1: TMenuItem;
    TrocarUsurio1: TMenuItem;
    Saidadeestoque1: TMenuItem;
    Organizarestoque1: TMenuItem;
    Logdosistema1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Fechar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChangeFocus(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Entradanoestoque1Click(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
    procedure Faturamento1Click(Sender: TObject);
    procedure Contasareceber1Click(Sender: TObject);
    procedure TrocarUsurio1Click(Sender: TObject);
    procedure Saidadeestoque1Click(Sender: TObject);
    procedure Organizarestoque1Click(Sender: TObject);
    procedure Logdosistema1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function liberarTela(idtela: integer):Boolean;
  end;

var
  F_SISTEMA: TF_SISTEMA;

implementation

uses U_Login, U_Usuario, U_Cliente, U_PermissoesDeTela,
  U_PermissoesUsuario, U_Produto, U_EntradaEstoque, U_Pedido,
  U_Faturamento, U_ContasReceber, U_SaidaEstoque, U_Log;

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
  tela: integer;
begin

  // Faz refer�ncia de uma procedure em um evento
  for index := 0 to ComponentCount - 1 do
    if Components[index] is TEdit then
      begin
      (Components[index] as TEdit).OnEnter := ChangeFocus;
      end;

  // Exibe o usu�rio ativo no sistema
  StatusBar1.Panels[0].Text := 'Usu�rio: ' + DM.nome_usuario_ativo + ' | Id: ' + IntToStr( DM.id_usuario_ativo);

  // Permiss�es de tela
  tela := 100;

  DM.Q_Aux.SQL.Clear;
  DM.Q_Aux.SQL.Text := 'select * from Tela_Usuario where idUsuario = :usuarioID';
  DM.Q_Aux.ParamByName('usuarioID').AsString := IntToStr( DM.id_usuario_ativo );
  DM.Q_Aux.Open;
  DM.Q_Aux.First;

  While not (DM.Q_Aux.Eof) do
  begin
    tela := StrToInt( DM.Q_Aux.FieldByName('idTela').AsString );
    liberarTela(tela);
    DM.Q_Aux.Next;
  end;

  DM.Q_Aux.Close;

end;

// Libera��o de telas
function TF_SISTEMA.liberarTela(idtela: integer):Boolean;
begin

  // Tela Cliente
  if idtela = 100 then
    Cliente1.Visible := true;

  // Tela Produtos
  if idtela = 200 then
    Produto1.Visible := true;

  // Tela Entrada Estoque
  if idtela = 310 then
  begin
    Estoque1.Visible := true;
    Entradanoestoque1.Visible := true;
    Saidadeestoque1.Visible   := true;
  end;

  // Tela Pedido
  if idtela = 410 then
  begin
    Vendas1.Visible := true;
    Pedido1.Visible := true;
  end;

  // Tela Vendas
  if idtela = 420 then
  begin
    Vendas1.Visible := true;
    Faturamento1.Visible := true;
  end;

  // Tela Contas a Receber
  if idtela = 510 then
  begin
    Contas1.Visible := true;
    Contasareceber1.Visible := true;
  end;

  // Tela Usu�rios
  if idtela = 600 then
    Usurios1.Visible := true;

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

procedure TF_SISTEMA.Usurios1Click(Sender: TObject);
begin

  // Abre From
  Application.CreateForm(TF_USUARIO, F_USUARIO);
  F_USUARIO.ShowModal;

end;

procedure TF_SISTEMA.Cliente1Click(Sender: TObject);
begin

  // Abre From
  Application.CreateForm(TF_CLIENTE, F_CLIENTE);
  F_CLIENTE.ShowModal;

end;

procedure TF_SISTEMA.Button1Click(Sender: TObject);
begin
// Abre From
  Application.CreateForm(TF_PermissoesUsuario, F_PermissoesUsuario);
  F_PermissoesUsuario.ShowModal;
end;

procedure TF_SISTEMA.Produto1Click(Sender: TObject);
begin

  // Abre From
  Application.CreateForm(TF_PRODUTO, F_PRODUTO);
  F_PRODUTO.ShowModal;

end;

procedure TF_SISTEMA.Entradanoestoque1Click(Sender: TObject);
begin
  // Abre From
  Application.CreateForm(TF_ENTRADA_ESTOQUE, F_ENTRADA_ESTOQUE);
  F_ENTRADA_ESTOQUE.ShowModal;
end;

procedure TF_SISTEMA.Pedido1Click(Sender: TObject);
begin

  // Abre From
  Application.CreateForm(TF_PEDIDO, F_PEDIDO);
  F_PEDIDO.ShowModal;

end;

procedure TF_SISTEMA.Faturamento1Click(Sender: TObject);
begin
  // Abre From
  Application.CreateForm(TF_FATURAMENTO, F_FATURAMENTO);
  F_FATURAMENTO.ShowModal;
end;

procedure TF_SISTEMA.Contasareceber1Click(Sender: TObject);
begin
  // Abre From
  Application.CreateForm(TF_CONTAS_RECEBER, F_CONTAS_RECEBER);
  F_CONTAS_RECEBER.ShowModal;
end;

procedure TF_SISTEMA.TrocarUsurio1Click(Sender: TObject);
begin

  F_SISTEMA.Hide;
  F_LOGIN.Show;

end;

procedure TF_SISTEMA.Saidadeestoque1Click(Sender: TObject);
begin

  // Abre From
  Application.CreateForm(TF_SAIDA_ESTOQUE, F_SAIDA_ESTOQUE);
  F_SAIDA_ESTOQUE.ShowModal;

end;

procedure TF_SISTEMA.Organizarestoque1Click(Sender: TObject);
begin

  // ATUALIZA TODO O ESTOQUE
  // ---------------------------------------------------------------------------
  DM.Q_Aux.SQL.Text := 'EXEC UPDATE_ALL_ESTOQUE';
  DM.Q_Aux.ExecSQL;

end;

procedure TF_SISTEMA.Logdosistema1Click(Sender: TObject);
begin

  Application.CreateForm(TF_LOG, F_LOG);
  F_LOG.ShowModal;

end;

end.
