unit U_Faturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, DBCtrls, Mask;

type
  TF_FATURAMENTO = class(TF_BASE)
    Label1: TLabel;
    editIdFaturamento: TDBEdit;
    Label2: TLabel;
    editPedido: TDBEdit;
    Label3: TLabel;
    editnotaFiscal: TDBEdit;
    Label4: TLabel;
    editData: TDBEdit;
    lookPedido: TDBLookupComboBox;
    DS_Duplicata: TDataSource;
    editPrazo: TEdit;
    Label5: TLabel;
    labelAlert: TLabel;
    editCliente: TEdit;
    Label6: TLabel;
    editClienteId: TEdit;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDuplicataClick(Sender: TObject);
    procedure editPedidoChange(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_FATURAMENTO: TF_FATURAMENTO;

implementation

uses U_DM;

{$R *.dfm}

procedure TF_FATURAMENTO.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  lookPedido.Visible  := true;

  // Insere a data
  editData.Text := DateToStr(Date);

end;

procedure TF_FATURAMENTO.btnSalvarClick(Sender: TObject);
var
  error: integer;
begin

  lookPedido.Visible  := true;

  // Errors
  error := 0;

  // Verifica se possui um registro na tabea de contas a receber
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT * FROM Contas_Receber WHERE idDuplicata = :idFaturamento';
  DM.Q_Aux.ParamByName('idFaturamento').AsString := editIdFaturamento.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;

  if DM.Q_Aux.FieldByName('idContasReceber').AsString <> '' then begin
    error:=1;
  end;

  // Verifica se não possui nenhum tipo de erro
  if error = 0 then begin

    // Insere a data
    editData.Text := DateToStr(Date);

    // Gera a duplicata
    DM.Q_Aux.SQL.Text := 'INSERT INTO Contas_Receber (idContasReceber, idCliente, idDuplicata, num_nota_fiscal, vencimento) VALUES (:idContasReceber, :idCliente, :idContasReceber, :num_nota_fiscal, :vencimento)';
    DM.Q_Aux.ParamByName('idContasReceber').AsString := editIdFaturamento.Text;
    DM.Q_Aux.ParamByName('idCliente').AsString := editClienteId.Text;
    DM.Q_Aux.ParamByName('idContasReceber').AsString := editIdFaturamento.Text;
    DM.Q_Aux.ParamByName('num_nota_fiscal').AsString := editnotaFiscal.Text;
    DM.Q_Aux.ParamByName('vencimento').AsString := DateToStr( StrToDate(editData.Text) + StrToInt(editPrazo.Text) );
    DM.Q_Aux.ExecSQL;
    DM.Q_Aux.Close;

  end;

  inherited;

end;

procedure TF_FATURAMENTO.btnEditarClick(Sender: TObject);
var
  error: integer;
begin
  inherited;

  editPedido.ReadOnly := true;
  lookPedido.Visible  := false;

  // Errors
  error := 0;

  // Verifica duplicata
  {DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT * FROM Duplicata WHERE idFaturamento = :idFaturamento';
  DM.Q_Aux.ParamByName('idFaturamento').AsString := editIdFaturamento.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;

  if DM.Q_Aux.FieldByName('idFaturamento').AsString <> '' then begin
    error:=1;
  end;

   // Verifica se não possui nenhum tipo de erro
  if error = 0 then begin

    //btnDuplicata.Visible := true;

    inherited;
  end;  }

  inherited;

end;

procedure TF_FATURAMENTO.btnDuplicataClick(Sender: TObject);
begin
  inherited;

  // Verifica se a tabela está ativa
  if not DS_Duplicata.DataSet.Active then
        DS_Duplicata.DataSet.Open;

  // Insere dados no final da tabela
  DS_Duplicata.DataSet.Append;

end;

procedure TF_FATURAMENTO.editPedidoChange(Sender: TObject);
begin
  inherited;

  // Prazo
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT prazo_pagamento as prazo FROM Pedido WHERE idPedido = :idpedido';
  DM.Q_Aux.ParamByName('idpedido').AsString := editPedido.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  editPrazo.Text := DM.Q_Aux.FieldByName('prazo').AsString;

  // Pedido já faturado
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT TOP(1) idPedido as pedido FROM Faturamento WHERE idPedido = :idpedido';
  DM.Q_Aux.ParamByName('idpedido').AsString := editPedido.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  //editPrazo.Text := DM.Q_Aux.FieldByName('prazo').AsString;

  if DM.Q_Aux.FieldByName('pedido').AsString <> '' then begin
    //ShowMessage('Já faturado');
    btnSalvar.Enabled := false;
    labelAlert.Visible := true;
  end else begin
    btnSalvar.Enabled := true;
    labelAlert.Visible := false;
  end;

  // Atualizar cliente
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT * FROM Pedido p, Cliente c WHERE p.idCliente = c.idCliente AND p.idPedido = :idPedido';
  DM.Q_Aux.ParamByName('idPedido').AsString := editPedido.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  editClienteId.Text := DM.Q_Aux.FieldByName('idCliente').AsString;
  editCliente.Text := DM.Q_Aux.FieldByName('nome').AsString;


end;

procedure TF_FATURAMENTO.btnDeletarClick(Sender: TObject);
var
  error: integer;
begin

  // Errors
  error := 0;

  // Verifica Pedido
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT * FROM Contas_Receber WHERE idDuplicata = :idFaturamento';
  DM.Q_Aux.ParamByName('idFaturamento').AsString := editIdFaturamento.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;

  if DM.Q_Aux.FieldByName('idContasReceber').AsString <> '' then begin
    ShowMessage('Não é possível deletar um faturamento com registro em contas a receber.');
    error:=1;
  end;

  // Verifica se não possui nenhum tipo de erro
  if error = 0 then begin
    inherited;
  end;

end;

end.
