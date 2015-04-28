unit U_Faturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, DBCtrls, Mask;

type
  TF_FATURAMENTO = class(TF_BASE)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    editData: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
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

  // Insere a data
  editData.Text := DateToStr(Date);

end;

procedure TF_FATURAMENTO.btnSalvarClick(Sender: TObject);
begin
  inherited;

  // Insere a data
  editData.Text := DateToStr(Date);
  
end;

end.
