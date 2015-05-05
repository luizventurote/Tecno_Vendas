unit U_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, StdCtrls, DBCtrls, Mask, DB, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TF_PRODUTO = class(TF_BASE)
    Label1: TLabel;
    editProdutoiD: TDBEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    editEstoque: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    editCodBarras: TDBEdit;
    TabSheet1: TTabSheet;
    btnExibirHistorico: TBitBtn;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    DS_Movimentacao: TDataSource;
    editprodutoIDhistorico: TDBEdit;
    gridMovimentacao: TDBGrid;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExibirHistoricoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
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

procedure TF_PRODUTO.btnExibirHistoricoClick(Sender: TObject);
begin
  inherited;

  DM.Q_Aux.SQL.Text := 'SELECT '+Chr(39)+'Estoque'+Chr(39)+' ,qtd_estoque as qtd FROM Produto WHERE idProduto = '+ editprodutoIDhistorico.Text +' UNION ALL SELECT '+Chr(39)+'Entrada'+Chr(39)+', qtd_entradas as qtd FROM Entrada_Estoque WHERE idProduto = '+ editprodutoIDhistorico.Text +' UNION ALL SELECT '+Chr(39)+'Saida'+Chr(39)+', qtd_saida as qtd FROM Saida_Estoque WHERE idProduto = '+ editprodutoIDhistorico.Text +' UNION ALL SELECT '+Chr(39)+'Pedido'+Chr(39)+', qtd FROM Produto_Pedido_Item WHERE idProduto = '+ editprodutoIDhistorico.Text +'';

  DS_Movimentacao.DataSet.Close;
  DS_Movimentacao.DataSet.Open;

end;

procedure TF_PRODUTO.btnUltimoClick(Sender: TObject);
begin
  inherited;
  DS_Movimentacao.DataSet.Close;
end;

procedure TF_PRODUTO.btnProximoClick(Sender: TObject);
begin
  inherited;
  DS_Movimentacao.DataSet.Close;
end;

procedure TF_PRODUTO.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  DS_Movimentacao.DataSet.Close;
end;

procedure TF_PRODUTO.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  DS_Movimentacao.DataSet.Close;
end;

end.
