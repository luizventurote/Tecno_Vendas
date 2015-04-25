unit U_PermissoesUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TF_PermissoesUsuario = class(TForm)
    Label1: TLabel;
    ListBox1: TListBox;
    btnCancelar: TButton;
    btnEditar: TButton;
    ListBoxTelasUsuario: TListBox;
    btnSalvar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PermissoesUsuario: TF_PermissoesUsuario;  
  usuario : integer; // ID DO USUÁRIO

implementation

uses U_DM;

{$R *.dfm}

procedure TF_PermissoesUsuario.FormShow(Sender: TObject);
var tela_id : integer; // ID DA TELA
var tela_id_aux : integer; // ID PARA CONTROLE DE DADOS ENTRE OS LISTBOX
var tela_qtd : integer; // QUANTIDADE DE TELAS CADASTRADAS NO SISTEMA
var usuario_tela_qtd : integer; // QUANTIDADE DE TELAS CADASTRADAS NO USUÁRIO SELECIONADO
var i, j : integer;
begin

  // SELECIONA UM USUÁRIO
  // ---------------------------------------------------------------------------
  usuario := 1;

  DM.Q_PermissoesDeUsuario.SQL.Text := 'select * from usuario';
  DM.Q_PermissoesDeUsuario.Open;
  //DM.Q_PermissoesDeUsuario.First;



end;



procedure TF_PermissoesUsuario.btnEditarClick(Sender: TObject);
begin
  ListBox1.Enabled := true;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := false;
  btnCancelar.Enabled := true;

end;

procedure TF_PermissoesUsuario.btnCancelarClick(Sender: TObject);
begin
  ListBox1.Enabled := false;
  btnSalvar.Enabled := false;
  btnEditar.Enabled := true;
  btnCancelar.Enabled := false;
end;

end.
