unit U_EntradaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, Mask, DBCtrls;

type
  TF_ENTRADA_ESTOQUE = class(TF_BASE)
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbUsuario: TDBLookupComboBox;
    Label2: TLabel;
    editUsuario: TDBEdit;
    editProduto: TDBEdit;
    DBEdit3: TDBEdit;
    editEntradas: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure editUsuarioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ENTRADA_ESTOQUE: TF_ENTRADA_ESTOQUE;

implementation

uses U_DM;

{$R *.dfm}

procedure TF_ENTRADA_ESTOQUE.btnSalvarClick(Sender: TObject);    
var
  errors: integer;
begin

  // Seta o usu�rio que est� logado no sistema
  editUsuario.Text := IntToStr(dm.id_usuario_ativo);

  // Errors
  errors:= 0;

  if (editEntradas.Text <> '') AND (editProduto.Text <> '') AND (editUsuario.Text <> '') then begin

  end else begin
    errors:=errors+1; ShowMessage('Voc� precisa inserir valores em todos os campos para prosseguir.');
  end;

  if errors = 0 then begin
    inherited;
  end;

end;

procedure TF_ENTRADA_ESTOQUE.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  // Seta o usu�rio que est� logado no sistema
  editUsuario.Text := IntToStr(dm.id_usuario_ativo);

end;

procedure TF_ENTRADA_ESTOQUE.btnDeletarClick(Sender: TObject);
begin
  //inherited;
  ShowMessage('N�o � poss�vel deletar registros');
end;

procedure TF_ENTRADA_ESTOQUE.btnEditarClick(Sender: TObject);
begin
  //inherited;
  ShowMessage('N�o � poss�vel alterar registros!');
end;

procedure TF_ENTRADA_ESTOQUE.editUsuarioExit(Sender: TObject);
begin
  inherited;
  editUsuario.Text := IntToStr(dm.id_usuario_ativo);
end;

end.
