unit U_ContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, DBCtrls, Mask;

type
  TF_CONTAS_RECEBER = class(TF_BASE)
    Label1: TLabel;
    editIdContasReceber: TDBEdit;
    Label2: TLabel;
    editCliente: TDBEdit;
    Label3: TLabel;
    editDuplicata: TDBEdit;
    Label4: TLabel;
    editNota: TDBEdit;
    Label5: TLabel;
    editVencimento: TDBEdit;
    lookCliente: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    TabSheet1: TTabSheet;
    DBGrid2: TDBGrid;
    DS_ContasAtrasadas: TDataSource;
    gpBaixa: TGroupBox;
    Label7: TLabel;
    editDataBaixa: TDBEdit;
    btnDarBaixar: TBitBtn;
    btnCAncelarBaixa: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure editVencimentoChange(Sender: TObject);
    procedure editVencimentoExit(Sender: TObject);
    procedure btnAtualizarContasClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure editDuplicataChange(Sender: TObject);
    procedure editNotaExit(Sender: TObject);
    procedure editIdContasReceberChange(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnDarBaixarClick(Sender: TObject);
    procedure btnCAncelarBaixaClick(Sender: TObject);
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
var
  errors: integer;
begin 

  // Oculta grupo de baixa
  gpBaixa.Visible := false;

  // Errors
  errors:= 0;

  // Verifica campos vazios
  if (editCliente.Text = '') AND (editDuplicata.Text = '') AND (editNota.Text = '') then begin
    errors:=1; ShowMessage('Voc� precisa inserir valores em todos os campos para prosseguir.');
  end;

  // Verifica data antes de salvar
  try

    if not (editDataBaixa.Text = '') then
    begin
      strtodate(editDataBaixa.text);
    end;

    if errors = 0 then
      inherited;

    // Libera a altera��o do cliente
    editCliente.ReadOnly := false;
    lookCliente.Visible := true;

    // Libera a altera��o do vencimento
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

  // Atualizar n�mero da nota fical
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT num_nota_fiscal as nota, data FROM Faturamento WHERE idFaturamento = :idFaturamento';
  DM.Q_Aux.ParamByName('idFaturamento').AsString := editDuplicata.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  editNota.Text := DM.Q_Aux.FieldByName('nota').AsString;
  editVencimento.Text := DM.Q_Aux.FieldByName('data').AsString;

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

  // Oculta grupo de baixa
  gpBaixa.Visible := false;
  
end;

procedure TF_CONTAS_RECEBER.btnEditarClick(Sender: TObject);
begin

  // Bloqueia a altera��o do cliente
  editCliente.ReadOnly := true;
  lookCliente.Visible := false;

  // Bloqueia a altera��o do vencimento
  editVencimento.ReadOnly := true;

  // Exibe grupo de baixa
  gpBaixa.Visible := true;

  // Salva os dados
  inherited;

end;

procedure TF_CONTAS_RECEBER.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  // Oculta grupo de baixa
  gpBaixa.Visible := false;

  // Libera a altera��o do cliente
  editCliente.ReadOnly := false;
  lookCliente.Visible := true;

  // Libera a altera��o do vencimento
  editVencimento.ReadOnly := false;

end;

procedure TF_CONTAS_RECEBER.btnCancelarClick(Sender: TObject);
begin
  inherited;

  // Oculta grupo de baixa
  gpBaixa.Visible := false;

    // Libera a altera��o do cliente
    editCliente.ReadOnly := false;
    lookCliente.Visible := true;

    // Libera a altera��o do vencimento
    editVencimento.ReadOnly := false;

end;

procedure TF_CONTAS_RECEBER.editDuplicataChange(Sender: TObject);
begin
  inherited;

  // Atualizar n�mero da nota fical
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT num_nota_fiscal as nota, data FROM Faturamento WHERE idFaturamento = :idFaturamento';
  DM.Q_Aux.ParamByName('idFaturamento').AsString := editDuplicata.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  editNota.Text := DM.Q_Aux.FieldByName('nota').AsString;
  editVencimento.Text := DM.Q_Aux.FieldByName('data').AsString;

end;

procedure TF_CONTAS_RECEBER.editNotaExit(Sender: TObject);
begin
  inherited;

  // Atualizar n�mero da nota fical
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT num_nota_fiscal as nota, data FROM Faturamento WHERE idFaturamento = :idFaturamento';
  DM.Q_Aux.ParamByName('idFaturamento').AsString := editDuplicata.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  editNota.Text := DM.Q_Aux.FieldByName('nota').AsString;
  editVencimento.Text := DM.Q_Aux.FieldByName('data').AsString;

end;

procedure TF_CONTAS_RECEBER.editIdContasReceberChange(Sender: TObject);
begin
  inherited;

  // Data baixa
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT data_baixa as data FROM Contas_Receber WHERE idContasReceber = :idContasReceber';
  DM.Q_Aux.ParamByName('idContasReceber').AsString := editIdContasReceber.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  editDataBaixa.text := DM.Q_Aux.FieldByName('data').AsString;

end;

procedure TF_CONTAS_RECEBER.btnDeletarClick(Sender: TObject);
begin
  inherited;

  // Oculta grupo de baixa
  gpBaixa.Visible := false;
  
end;

procedure TF_CONTAS_RECEBER.btnDarBaixarClick(Sender: TObject);
begin
  inherited;

  DM.Q_Aux.SQL.Text := 'UPDATE Contas_Receber SET data_baixa = :data WHERE idContasReceber = :idContasReceber';
  DM.Q_Aux.ParamByName('idContasReceber').AsString := editIdContasReceber.Text;
  DM.Q_Aux.ParamByName('data').AsString := DateToStr(Date);
  DM.Q_Aux.ExecSQL;

  // Data baixa
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT data_baixa as data FROM Contas_Receber WHERE idContasReceber = :idContasReceber';
  DM.Q_Aux.ParamByName('idContasReceber').AsString := editIdContasReceber.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  editDataBaixa.text := DM.Q_Aux.FieldByName('data').AsString;

end;

procedure TF_CONTAS_RECEBER.btnCAncelarBaixaClick(Sender: TObject);
begin
  inherited;

  DM.Q_Aux.SQL.Text := 'UPDATE Contas_Receber SET data_baixa = null WHERE idContasReceber = :idContasReceber';
  DM.Q_Aux.ParamByName('idContasReceber').AsString := editIdContasReceber.Text;
  DM.Q_Aux.ExecSQL;

  // Data baixa
  DM.Q_Aux.Close;
  DM.Q_Aux.SQL.Text := 'SELECT data_baixa as data FROM Contas_Receber WHERE idContasReceber = :idContasReceber';
  DM.Q_Aux.ParamByName('idContasReceber').AsString := editIdContasReceber.Text;
  DM.Q_Aux.Open;
  DM.Q_Aux.First;
  editDataBaixa.text := DM.Q_Aux.FieldByName('data').AsString;

end;

end.
