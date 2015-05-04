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
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    gridEntradas: TDBGrid;
    gridSaidas: TDBGrid;
    gridPedidos: TDBGrid;
    Label7: TLabel;
    DS_Entradas: TDataSource;
    DS_Saidas: TDataSource;
    DS_Pedidos: TDataSource;
    editprodutoIDhistorico: TDBEdit;
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

  DM.Q_Aux.SQL.Text := 'SELECT qtd_entradas AS entrada_estoque FROM Entrada_Estoque WHERE idProduto = ' + editprodutoIDhistorico.Text;

  DS_Entradas.DataSet.Close;
  DS_Entradas.DataSet.Open;

  DM.Q_Aux_2.SQL.Text := 'SELECT qtd_saida AS saida_estoque FROM Saida_Estoque WHERE idProduto = '+ editprodutoIDhistorico.Text;

  DS_Saidas.DataSet.Close;
  DS_Saidas.DataSet.Open;

  DM.Q_Aux_3.SQL.Text := 'SELECT qtd AS pedidos FROM Produto_Pedido_Item WHERE idProduto = '+ editprodutoIDhistorico.Text;

  DS_Pedidos.DataSet.Close;
  DS_Pedidos.DataSet.Open;

end;

procedure TF_PRODUTO.btnUltimoClick(Sender: TObject);
begin
  inherited;
  DS_Entradas.DataSet.Close;
  DS_Saidas.DataSet.Close;
  DS_Pedidos.DataSet.Close;
end;

procedure TF_PRODUTO.btnProximoClick(Sender: TObject);
begin
  inherited;
  DS_Entradas.DataSet.Close;
  DS_Saidas.DataSet.Close;
  DS_Pedidos.DataSet.Close;
end;

procedure TF_PRODUTO.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  DS_Entradas.DataSet.Close;
  DS_Saidas.DataSet.Close;
  DS_Pedidos.DataSet.Close;
end;

procedure TF_PRODUTO.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  DS_Entradas.DataSet.Close;
  DS_Saidas.DataSet.Close;
  DS_Pedidos.DataSet.Close;
end;

end.
