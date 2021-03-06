unit U_PermissoesDeTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, U_DM;

type
  TF_PERMISSOES = class(TForm)
    ListBox1: TListBox;
    btnSalvar: TButton;
    btnEditar: TButton;
    Label1: TLabel;
    ListBoxTelasUsuario: TListBox;
    btnCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario : integer; // ID DO USU�RIO
  end;

var
  F_PERMISSOES: TF_PERMISSOES;

implementation

uses DB;

{$R *.dfm}

procedure TF_PERMISSOES.FormShow(Sender: TObject);
var tela_id : integer; // ID DA TELA
var tela_id_aux : integer; // ID PARA CONTROLE DE DADOS ENTRE OS LISTBOX
var tela_qtd : integer; // QUANTIDADE DE TELAS CADASTRADAS NO SISTEMA
var usuario_tela_qtd : integer; // QUANTIDADE DE TELAS CADASTRADAS NO USU�RIO SELECIONADO
var i, j : integer;
begin

  // CARREGA AS TELAS CADASTRADAS NO BANCO
  // ---------------------------------------------------------------------------
  DM.Q_PermissoesDeUsuario.SQL.Text := 'select * from Tela';
  DM.Q_PermissoesDeUsuario.Open;
  DM.Q_PermissoesDeUsuario.First;

  i := 0;
  tela_qtd := 0;

  While not (DM.Q_PermissoesDeUsuario.Eof) do
  begin

    tela_id := StrToInt(DM.Q_PermissoesDeUsuario.FieldByName('idTela').AsString);
    ListBox1.Items.Add( IntToStr(tela_id) );

    tela_qtd:= tela_qtd + 1;
    i:= i + 1;
    DM.Q_PermissoesDeUsuario.Next;

  end;

  DM.Q_PermissoesDeUsuario.Close;


  // CARREGA AS TELAS CADASTRADAS NO USU�RIO
  // ---------------------------------------------------------------------------

  // Qtd de telas do usu�rio
  usuario_tela_qtd := 0;

  DM.Q_PermissoesDeUsuario.SQL.Clear;
  DM.Q_PermissoesDeUsuario.SQL.Text := 'select * from Tela_Usuario where idUsuario = :usuarioID';
  DM.Q_PermissoesDeUsuario.ParamByName('usuarioID').AsString := IntToStr( usuario );
  DM.Q_PermissoesDeUsuario.Open;
  DM.Q_PermissoesDeUsuario.First;

  While not (DM.Q_PermissoesDeUsuario.Eof) do
  begin
    tela_id := StrToInt( DM.Q_PermissoesDeUsuario.FieldByName('idTela').AsString );
    ListBoxTelasUsuario.Items.Add( IntToStr( tela_id ) );
    usuario_tela_qtd:= usuario_tela_qtd + 1;
    DM.Q_PermissoesDeUsuario.Next;
  end;

  DM.Q_PermissoesDeUsuario.Close;


  // SELECIONA AS TELAS CADASTRADAS NO LIST BOX
  // ---------------------------------------------------------------------------
  for i:=0 to tela_qtd-1 do
  begin

    tela_id := StrToInt( ListBox1.Items[i] );

    for j:=0 to usuario_tela_qtd-1 do
    begin

      tela_id_aux := StrToInt( ListBoxTelasUsuario.Items[j] );

      if( tela_id = tela_id_aux) then
      begin
        ListBox1.Selected[i] := true;
      end;

    end; // end for
  end; // end for


end;

procedure TF_PERMISSOES.btnSalvarClick(Sender: TObject);
var i: integer;
begin

  // APAGA OS REGISTROS NO BANCO
  // ---------------------------------------------------------------------------
  DM.Q_PermissoesDeUsuario.SQL.Text := 'DELETE FROM Tela_Usuario WHERE idUsuario = :usuarioID';
  DM.Q_PermissoesDeUsuario.ParamByName('usuarioID').AsString := IntToStr(usuario);
  DM.Q_PermissoesDeUsuario.ExecSQL;


  // INSERE OS NOVOS REGISTROS
  // ---------------------------------------------------------------------------
  for i:=0 to ListBox1.Items.Count-1 do
  begin
      if( ListBox1.Selected[i] ) then
    begin
      DM.Q_PermissoesDeUsuario.SQL.Text := 'INSERT INTO Tela_Usuario (idTela, idUsuario) VALUES (:idTela, :usuarioID);';
      DM.Q_PermissoesDeUsuario.ParamByName('usuarioID').AsString := IntToStr(usuario);
      DM.Q_PermissoesDeUsuario.ParamByName('idTela').AsString := ListBox1.Items[i];
      DM.Q_PermissoesDeUsuario.ExecSQL;
    end;
  end;


  // DESABILITA OS BOT�ES
  // ---------------------------------------------------------------------------
  ListBox1.Enabled := false;
  btnSalvar.Enabled := false;
  btnEditar.Enabled := true;
  btnCancelar.Enabled := false;

  F_PERMISSOES.Close;

end;

procedure TF_PERMISSOES.btnEditarClick(Sender: TObject);
begin
  ListBox1.Enabled := true;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := false;
  btnCancelar.Enabled := true;

end;

procedure TF_PERMISSOES.btnCancelarClick(Sender: TObject);
begin
  ListBox1.Enabled := false;
  btnSalvar.Enabled := false;
  btnEditar.Enabled := true;
  btnCancelar.Enabled := false;
end;

end.
