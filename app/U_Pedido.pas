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
    editCliente: TDBEdit;
    Label3: TLabel;
    editDataPedido: TDBEdit;
    Label4: TLabel;
    editPrazo: TDBEdit;
    Label5: TLabel;
    editTotalValor: TDBEdit;
    Label6: TLabel;
    editTotalQtd: TDBEdit;
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
    TabSheet1: TTabSheet;
    gridMaisVendidos: TDBGrid;
    btnRsultadoMiasVendos: TBitBtn;
    editDataInicial: TEdit;
    editDataFinal: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    DS_Aux: TDataSource;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    editClientesDataInicial: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    editClientesDataFinal: TEdit;
    btnClientesSemVendas: TBitBtn;
    btnRemoverItem: TBitBtn;
    procedure btnAddProdutoClick(Sender: TObject);
    procedure editPedidoIDChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure atualizarGridDeprodutos();
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnRsultadoMiasVendosClick(Sender: TObject);
    procedure btnClientesSemVendasClick(Sender: TObject);
    procedure btnRemoverItemClick(Sender: TObject);
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

  try

    if (editProdutoQtd.Text <> '') then begin

      DM.Q_Aux.SQL.Text := 'INSERT INTO Produto_Pedido_Item (idProduto, idPedido, qtd) VALUES (:idProduto, :idPedido, :qtd);';
      DM.Q_Aux.ParamByName('idProduto').AsString := editProdutoID.Text;
      DM.Q_Aux.ParamByName('idPedido').AsString := editPedidoID.Text;
      DM.Q_Aux.ParamByName('qtd').AsString := editProdutoQtd.Text;
      DM.Q_Aux.ExecSQL;
      DM.Q_Aux.Close;

      atualizarGridDeprodutos();

      editTotalQtd.Text := IntToStr( StrToInt(editTotalQtd.Text) + StrToInt(editProdutoQtd.Text) );

      editProdutoQtd.Text := '0';

      // Valor
      DM.Q_Aux.Close;
      DM.Q_Aux.SQL.Text := 'SELECT SUM((valor * qtd)) AS valor FROM Produto_Pedido_Item as item, Produto as prod WHERE item.idProduto = prod.idProduto AND idPedido = :idpedido';
      DM.Q_Aux.ParamByName('idpedido').AsString := editPedidoID.Text;
      DM.Q_Aux.Open;
      DM.Q_Aux.First;
      editTotalValor.Text := DM.Q_Aux.FieldByName('valor').AsString;

      // Quantidade
      DM.Q_Aux.Close;
      DM.Q_Aux.SQL.Text := 'SELECT SUM(qtd) AS qtd FROM Produto_Pedido_Item as item, Produto as prod WHERE item.idProduto = prod.idProduto AND idPedido = :idpedido';
      DM.Q_Aux.ParamByName('idpedido').AsString := editPedidoID.Text;
      DM.Q_Aux.Open;
      DM.Q_Aux.First;
      editTotalQtd.Text := DM.Q_Aux.FieldByName('qtd').AsString;

    end else begin
      ShowMessage('Adicione a quantidade.');
    end;

  except on E: Exception do
    begin
      ShowMessage('O produto já foi adicionado!');
    end;
  end;


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

  editDataPedido.Text := DateToStr(Date);

  editPrazo.Text := '0';
  editTotalQtd.Text := '0';
  editProdutoQtd.Text := '0';
  editTotalValor.Text := '0';

end;

procedure TF_PEDIDO.btnDeletarClick(Sender: TObject);
var
  error: integer;
begin

  // Errors
  error := 0;

  // Verifica Pedido
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT * FROM Faturamento WHERE idPedido = :idPedido';
  DM.Q_Aux.ParamByName('idPedido').AsString := editPedidoID.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;

  if DM.Q_Aux.FieldByName('idPedido').AsString <> '' then begin
    ShowMessage('Não é possível deletar um pedido com registro de faturamento.');
    error:=1;
  end;

   // Verifica se não possui nenhum tipo de erro
  if error = 0 then begin

    // Desabilita goup box de produtos
    gbProdutos.Enabled := false;

    inherited;
  end;

end;

procedure TF_PEDIDO.btnCancelarClick(Sender: TObject);
var
  error: integer;
begin

  // Errors
  error := 0;

  // Verifica Pedido
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT * FROM Pedido WHERE idPedido = :idPedido';
  DM.Q_Aux.ParamByName('idPedido').AsString := editPedidoID.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;

  if DM.Q_Aux.FieldByName('idPedido').AsString = '' then begin
    error:=1;

    // APAGA OS REGISTROS NO BANCO
    DM.Q_Aux.SQL.Text := 'DELETE FROM Produto_Pedido_Item WHERE idPedido = :idPedido';
    DM.Q_Aux.ParamByName('idPedido').AsString := editPedidoID.Text;
    DM.Q_Aux.ExecSQL;

  end;

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

  if StrToInt( editPrazo.Text ) > 0 then begin

    if StrToInt( editTotalValor.Text ) > 0 then begin

      if editCliente.Text <> '' then begin

        inherited;

        // Desabilita goup box de produtos
        gbProdutos.Enabled := false;

        end else begin
          ShowMessage('Selecione um cliente.');
        end;

    end else begin
      ShowMessage('Adicione produtos ao pedido.');
    end;

  end else begin
    ShowMessage('Defina o prazo de pagamento antes de salvar.');
  end;

end;

procedure TF_PEDIDO.btnRsultadoMiasVendosClick(Sender: TObject);
begin
  inherited;

  DM.Q_Aux.SQL.Text := 'select a.idproduto, b.descricao, SUM(a.qtd) quantidade from Produto_Pedido_Item a, Produto b, Pedido c where a.idproduto = b.idProduto AND data_pedido BETWEEN '+Chr(39) + editDataInicial.Text + Chr(39)+' AND '+Chr(39)+ editDataFinal.Text +Chr(39)+' group by a.idproduto, b.descricao order by SUM(a.qtd) desc';

  DS_Aux.DataSet.Close;
  DS_Aux.DataSet.Open;

end;

procedure TF_PEDIDO.btnClientesSemVendasClick(Sender: TObject);
begin
  inherited;

  DM.Q_Aux.SQL.Text := 'SELECT * FROM Cliente WHERE idCliente not in ( SELECT idCliente FROM Pedido WHERE data_pedido  between '+Chr(39) + editClientesDataInicial.Text + Chr(39)+' and '+Chr(39) + editClientesDataFinal.Text + Chr(39)+' );';

  DS_Aux.DataSet.Close;
  DS_Aux.DataSet.Open;

end;

procedure TF_PEDIDO.btnRemoverItemClick(Sender: TObject);
begin
  inherited;

  editTotalQtd.Text := IntToStr( StrToInt(editTotalQtd.Text) - StrToInt(gridProdutos.Fields[3].AsString) );

  DS_ProdutoItem.DataSet.Delete;

  DM.M_PedidoProduto.ApplyUpdates(-1);

  // Valor
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT SUM((valor * qtd)) AS valor FROM Produto_Pedido_Item as item, Produto as prod WHERE item.idProduto = prod.idProduto AND idPedido = :idpedido';
  DM.Q_Aux.ParamByName('idpedido').AsString := editPedidoID.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  editTotalValor.Text := DM.Q_Aux.FieldByName('valor').AsString;

  // Quantidade
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT SUM(qtd) AS qtd FROM Produto_Pedido_Item as item, Produto as prod WHERE item.idProduto = prod.idProduto AND idPedido = :idpedido';
  DM.Q_Aux.ParamByName('idpedido').AsString := editPedidoID.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  editTotalQtd.Text := DM.Q_Aux.FieldByName('qtd').AsString;

end;

end.
