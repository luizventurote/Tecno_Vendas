unit U_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, DBCtrls, Mask, DBClient, Provider;

type
  TF_PEDIDO = class(TF_BASE)
    Label1: TLabel;
    editPedidoID: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    gbProdutos: TGroupBox;
    DS_ProdutoItem: TDataSource;
    gridProdutos: TDBGrid;
    Label7: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DS_Produto: TDataSource;
    editProdutoQtd: TEdit;
    btnAddProduto: TButton;
    editProdutoID: TDBEdit;
    Label8: TLabel;
    procedure btnAddProdutoClick(Sender: TObject);
    procedure editPedidoIDChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure atualizarGridDeprodutos();
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PEDIDO: TF_PEDIDO;

implementation

uses U_DM;

{$R *.dfm}

procedure TF_PEDIDO.btnAddProdutoClick(Sender: TObject);
begin
  inherited;

  DM.Q_Aux.SQL.Text := 'INSERT INTO Produto_Pedido_Item (idProduto, idPedido, qtd) VALUES (:idProduto, :idPedido, :qtd);';
  DM.Q_Aux.ParamByName('idProduto').AsString := editProdutoID.Text;
  DM.Q_Aux.ParamByName('idPedido').AsString := editPedidoID.Text;
  DM.Q_Aux.ParamByName('qtd').AsString := editProdutoQtd.Text;
  DM.Q_Aux.ExecSQL;
  DM.Q_Aux.Close;

  atualizarGridDeprodutos();

  editProdutoQtd.Text := '0';

end;

procedure TF_PEDIDO.editPedidoIDChange(Sender: TObject);
begin
  inherited;

  atualizarGridDeprodutos();

end;

procedure TF_PEDIDO.FormCreate(Sender: TObject);
begin
  inherited;

  DS_Produto.DataSet.Close;
  DS_Produto.DataSet.Open;
  
end;

procedure TF_PEDIDO.atualizarGridDeprodutos();
begin

  DM.Q_PedidoProduto.SQL.Text := 'select * from Produto_Pedido_Item where idPedido = :usuarioID';
  DM.Q_PedidoProduto.ParamByName('usuarioID').AsString := editPedidoID.Text;

  DS_ProdutoItem.DataSet.Close;
  DS_ProdutoItem.DataSet.Open;

end;

procedure TF_PEDIDO.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  // Habilita goup box de produtos
  gbProdutos.Enabled := true;

end;

procedure TF_PEDIDO.btnDeletarClick(Sender: TObject);
begin
  inherited;

  // Desabilita goup box de produtos
  gbProdutos.Enabled := false;

end;

procedure TF_PEDIDO.btnCancelarClick(Sender: TObject);
begin
  inherited;

  // Desabilita goup box de produtos
  gbProdutos.Enabled := false;

end;

procedure TF_PEDIDO.btnEditarClick(Sender: TObject);
begin
  inherited;

  // Habilita goup box de produtos
  gbProdutos.Enabled := true;

end;

procedure TF_PEDIDO.btnSalvarClick(Sender: TObject);
begin
  inherited;

  // Desabilita goup box de produtos
  gbProdutos.Enabled := false;

end;

end.
