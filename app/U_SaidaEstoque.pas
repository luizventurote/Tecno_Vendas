unit U_SaidaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, DBCtrls, Mask;

type
  TF_SAIDA_ESTOQUE = class(TF_BASE)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    editUsuario: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
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
begin

  // Seta o usu�rio que est� logado no sistema
  editUsuario.Text := IntToStr(dm.id_usuario_ativo);

  inherited;

end;

procedure TF_SAIDA_ESTOQUE.btnDeletarClick(Sender: TObject);
begin
  //inherited;
  ShowMessage('N�o � poss�vel deletar registros');
end;

end.