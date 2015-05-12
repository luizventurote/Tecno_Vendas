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
    DBEdit3: TDBEdit;
    Label4: TLabel;
    editData: TDBEdit;
    lookPedido: TDBLookupComboBox;
    DS_Duplicata: TDataSource;
    editPrazo: TEdit;
    Label5: TLabel;
    labelAlert: TLabel;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
begin

  lookPedido.Visible  := true;

  // Insere a data
  editData.Text := DateToStr(Date);

  // Gera a duplicata
  DM.Q_Aux.SQL.Text := 'INSERT INTO Duplicata (idDuplicata, idFaturamento, data) VALUES (:idFaturamento, :idFaturamento, :data)';
  DM.Q_Aux.ParamByName('idFaturamento').AsString := editIdFaturamento.Text;
  DM.Q_Aux.ParamByName('data').AsString := DateToStr(Date + StrToInt( editPrazo.text ));
  DM.Q_Aux.ExecSQL;
  DM.Q_Aux.Close;

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
  DM.Q_Aux.Close;
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
  end;
  
end;

procedure TF_FATURAMENTO.BitBtn1Click(Sender: TObject);
begin
  inherited;

  DS_Duplicata.DataSet.Post;
  DM.M_Duplicata.ApplyUpdates(-1);

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

end;

procedure TF_FATURAMENTO.btnDeletarClick(Sender: TObject);
begin
  //inherited;

  ShowMessage('Não é possível deletar faturamentos!');

end;

end.
