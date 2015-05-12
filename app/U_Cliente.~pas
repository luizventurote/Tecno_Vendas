unit U_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, U_DM, Mask, DBCtrls;

type
  TF_CLIENTE = class(TF_BASE)
    Label1: TLabel;
    editId: TDBEdit;
    Label2: TLabel;
    editnome: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    editCNPJ: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    procedure editCNPJExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CLIENTE: TF_CLIENTE;

implementation

{$R *.dfm}

procedure TF_CLIENTE.editCNPJExit(Sender: TObject);
begin
  inherited;

  If editCNPJ.Text<>'' Then
    If F_BASE.Cnpj(editCNPJ.Text)=False Then
    Begin
      MessageDlg('CNPJ informado é incorreto!',mtError, [mbOk],0);
      editCNPJ.SetFocus;
    End;

end;

procedure TF_CLIENTE.btnCancelarClick(Sender: TObject);
begin
  inherited;

  DM.addLog('Cliente '+ editnome.Text +' deletado.');

end;

procedure TF_CLIENTE.btnEditarClick(Sender: TObject);
begin
  inherited;

  DM.addLog('Cliente '+ editId.Text +' alterado');

end;

procedure TF_CLIENTE.btnDeletarClick(Sender: TObject);
var
  error: integer;
begin

  // Errors
  error := 0;

  // Verifica Pedido
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT * FROM Pedido WHERE idCliente = :idCliente';
  DM.Q_Aux.ParamByName('idCliente').AsString := editId.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;

  if DM.Q_Aux.FieldByName('idCliente').AsString <> '' then begin
    ShowMessage('Não é possível deletar um cliente com registro de pedidos.');
    error:=1;
  end;

  // Verifica Contas a Receber
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT * FROM Contas_Receber WHERE idCliente = :idCliente';
  DM.Q_Aux.ParamByName('idCliente').AsString := editId.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;

  if DM.Q_Aux.FieldByName('idCliente').AsString <> '' then begin
    ShowMessage('Não é possível deletar um cliente com registro de contas a receber.');
    error:=1;
  end;

  // Verifica se não possui nenhum tipo de erro
  if error = 0 then begin
    inherited;
  end;

end;

end.
