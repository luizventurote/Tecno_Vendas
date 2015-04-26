unit U_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, U_DM, Mask, DBCtrls;

type
  TF_CLIENTE = class(TF_BASE)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
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
      MessageDlg('CNPJ informado � incorreto!',mtError, [mbOk],0);
      editCNPJ.SetFocus;
    End;

end;

end.
