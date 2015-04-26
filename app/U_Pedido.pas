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
    GroupBox1: TGroupBox;
    Label7: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DS_Produto: TDataSource;
    editProdutoID: TDBEdit;
    btnAddProduto: TButton;
    Label8: TLabel;
    editProdutoQtd: TEdit;
    gridProdutos: TDBGrid;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnAddProdutoClick(Sender: TObject);
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

procedure TF_PEDIDO.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  DS_Produto.DataSet.Close;
  DS_Produto.DataSet.Open;
  
end;

procedure TF_PEDIDO.btnAddProdutoClick(Sender: TObject);
begin
  inherited;

  //DM.Q_Aux.SQL.Text := 'INSERT INTO Produto_Pedido_Item (idProduto, idPedido, qtd) VALUES (:idProduto, :idPedido, :qtd);';
  //DM.Q_Aux.ParamByName('idProduto').AsString := editProdutoID.Text;
  //DM.Q_Aux.ParamByName('idPedido').AsString := editPedidoID.Text;
  //DM.Q_Aux.ParamByName('qtd').AsString := editProdutoQtd.Text;
  //DM.Q_Aux.ExecSQL;

  DM.Q_Aux.SQL.Clear;
  DM.Q_Aux.SQL.Text := 'select * from Produto_Pedido_Item where idPedido = 14;';
  //DM.Q_Aux.ParamByName('usuarioID').AsString := IntToStr( usuario );
  DM.Q_Aux.Open;
  DM.Q_Aux.First;

    ShowMessage( DM.Q_Aux.FieldByName('qtd').AsString );

    DS_Produto := DM.Q_Aux.DataSource;

end;

end.
