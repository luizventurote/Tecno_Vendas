unit U_ContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, DBCtrls, Mask;

type
  TF_CONTAS_RECEBER = class(TF_BASE)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    editCliente: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    editVencimento: TDBEdit;
    Label6: TLabel;
    editDataBaixa: TDBEdit;
    lookCliente: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    TabSheet1: TTabSheet;
    DBGrid2: TDBGrid;
    DS_ContasAtrasadas: TDataSource;
    procedure btnSalvarClick(Sender: TObject);
    procedure editVencimentoChange(Sender: TObject);
    procedure editVencimentoExit(Sender: TObject);
    procedure btnAtualizarContasClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CONTAS_RECEBER: TF_CONTAS_RECEBER;

implementation

uses U_DM;

{$R *.dfm}

procedure TF_CONTAS_RECEBER.btnSalvarClick(Sender: TObject);
begin

  // Verifica data antes de salvar
  try

    if not (editDataBaixa.Text = '') then
    begin
      strtodate(editDataBaixa.text);
    end;

    inherited;

    // Libera a alteração do cliente
    editCliente.ReadOnly := false;
    lookCliente.Visible := true;

    // Libera a alteração do vencimento
    editVencimento.ReadOnly := false;

  except
    showmessage('data invalida');
  end;

end;

procedure TF_CONTAS_RECEBER.editVencimentoChange(Sender: TObject);
begin
  inherited;

  // Verifica data antes de salvar
  try

    if not (editDataBaixa.Text = '') then
    begin
      strtodate(editDataBaixa.text);
    end;

    inherited;

  except
    showmessage('data invalida');
  end;

end;

procedure TF_CONTAS_RECEBER.editVencimentoExit(Sender: TObject);
begin
  inherited;

  // Verifica data antes de salvar
  try

    if not (editVencimento.Text = '') then
    begin
      strtodate(editVencimento.text);
    end;

  except
    MessageDlg('Data invalida!',mtError, [mbOk],0);
    editVencimento.SetFocus;
  end;

end;

procedure TF_CONTAS_RECEBER.btnAtualizarContasClick(Sender: TObject);
begin
  inherited;


  DM.Q_Aux.SQL.Text := 'SELECT nome, vencimento, DATEDIFF ( DAY , GETDATE() , convert(datetime,vencimento,103) ) atraso from Contas_Receber con, Cliente cli WHERE con.idCliente = cli.idCliente AND DATEDIFF ( DAY , GETDATE() , convert(datetime,vencimento,103) ) < 0';

  DS_ContasAtrasadas.DataSet.Close;
  DS_ContasAtrasadas.DataSet.Open;

end;

procedure TF_CONTAS_RECEBER.btnPesquisarClick(Sender: TObject);
begin
  inherited;

  // Contas em atraso
  DM.Q_Aux.SQL.Text := 'SELECT nome, vencimento, DATEDIFF ( DAY , GETDATE() , convert(datetime,vencimento,103) ) atraso from Contas_Receber con, Cliente cli WHERE con.idCliente = cli.idCliente AND DATEDIFF ( DAY , GETDATE() , convert(datetime,vencimento,103) ) < 0';
  DS_ContasAtrasadas.DataSet.Close;
  DS_ContasAtrasadas.DataSet.Open;
end;

procedure TF_CONTAS_RECEBER.btnEditarClick(Sender: TObject);
begin

  // Bloqueia a alteração do cliente
  editCliente.ReadOnly := true;
  lookCliente.Visible := false;

  // Bloqueia a alteração do vencimento
  editVencimento.ReadOnly := true;

  // Salva os dados
  inherited;

end;

procedure TF_CONTAS_RECEBER.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  // Libera a alteração do cliente
  editCliente.ReadOnly := false;
  lookCliente.Visible := true;

  // Libera a alteração do vencimento
  editVencimento.ReadOnly := false;

end;

procedure TF_CONTAS_RECEBER.btnCancelarClick(Sender: TObject);
begin
  inherited;
               
    // Libera a alteração do cliente
    editCliente.ReadOnly := false;
    lookCliente.Visible := true;

    // Libera a alteração do vencimento
    editVencimento.ReadOnly := false;

end;

end.
