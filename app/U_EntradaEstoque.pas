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
    DBLookupComboBox2: TDBLookupComboBox;
    editUsuario: TDBEdit;
    editProduto: TDBEdit;
    DBEdit3: TDBEdit;
    editEntradas: TDBEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
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
begin

  // Seta o usu�rio que est� logado no sistema
  editUsuario.Text := IntToStr(dm.id_usuario_ativo);

  inherited;

  // Ativa a procedure para incrementar estoque
  // ---------------------------------------------------------------------------
  DM.Q_Aux.SQL.Text := 'exec UP_ESTOQUE @idProduto = :idProduto, @qtd_up = :qtdEntradas';
  DM.Q_Aux.ParamByName('idProduto').AsString := editProduto.Text;
  DM.Q_Aux.ParamByName('qtdEntradas').AsString := editEntradas.Text;
  DM.Q_Aux.ExecSQL;

end;

procedure TF_ENTRADA_ESTOQUE.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  // Seta o usu�rio que est� logado no sistema
  editUsuario.Text := IntToStr(dm.id_usuario_ativo);

end;

end.
