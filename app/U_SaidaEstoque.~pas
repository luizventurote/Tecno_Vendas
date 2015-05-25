unit U_SaidaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, DBCtrls, Mask;

type
  TF_SAIDA_ESTOQUE = class(TF_BASE)
    Label1: TLabel;
    editIdSaida: TDBEdit;
    Label2: TLabel;
    editUsuario: TDBEdit;
    Label3: TLabel;
    editProduto: TDBEdit;
    Label4: TLabel;
    editQtd: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure editUsuarioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_SAIDA_ESTOQUE: TF_SAIDA_ESTOQUE;

implementation

uses U_DM;

{$R *.dfm}

procedure TF_SAIDA_ESTOQUE.btnSalvarClick(Sender: TObject);
var
  errors: integer;
begin

  errors:= 0;

  if (editQtd.Text <> '') AND (editProduto.Text <> '') AND (editUsuario.Text <> '') then begin

    //if StrToInt(editQtd.Text) <= 0 then
      //errors:=errors+1; ShowMessage('Insira a quantidade.');

  end else begin
    errors:=errors+1; ShowMessage('Você precisa inserir valores em todos os campos para prosseguir.');
  end;

  if errors = 0 then begin
    // Seta o usuário que está logado no sistema
    editUsuario.Text := IntToStr(dm.id_usuario_ativo);
    inherited;
  end;

end;

procedure TF_SAIDA_ESTOQUE.btnDeletarClick(Sender: TObject);
begin
  //inherited;
  ShowMessage('Não é possível deletar registros');
end;

procedure TF_SAIDA_ESTOQUE.btnEditarClick(Sender: TObject);
begin
  //inherited;
  ShowMessage('Não é possível deletar registros');
end;

procedure TF_SAIDA_ESTOQUE.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  // Seta o usuário que está logado no sistema
  editUsuario.Text := IntToStr(dm.id_usuario_ativo);

end;

procedure TF_SAIDA_ESTOQUE.editUsuarioExit(Sender: TObject);
begin
  inherited;
  editUsuario.Text := IntToStr(dm.id_usuario_ativo);
end;

end.
