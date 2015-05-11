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
    btnDuplicata: TBitBtn;
    gbDuplicata: TGroupBox;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DS_Duplicata: TDataSource;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnDuplicataClick(Sender: TObject);
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

  // Exibe o form da duplicata
  gbDuplicata.Visible := true;

end;

end.
