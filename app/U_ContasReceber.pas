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
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    editDataBaixa: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure btnSalvarClick(Sender: TObject);
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

  except
    showmessage('data invalida');
  end;

end;

end.
