unit U_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, StdCtrls, DBCtrls, Mask, DB, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TF_PRODUTO = class(TF_BASE)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    editEstoque: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    editCodBarras: TDBEdit;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PRODUTO: TF_PRODUTO;

implementation

uses
  U_DM;

{$R *.dfm}

procedure TF_PRODUTO.btnSalvarClick(Sender: TObject);
begin

  editEstoque.Text := '0';
  inherited;

end;

end.
