unit U_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_Base, StdCtrls, Mask, DBCtrls, DB, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TF_USUARIO = class(TF_BASE)
    Label1: TLabel;
    editID: TDBEdit;
    Label2: TLabel;
    editNome: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_USUARIO: TF_USUARIO;

implementation

uses
  U_DM, U_PermissoesDeTela;

{$R *.dfm}

procedure TF_USUARIO.BitBtn1Click(Sender: TObject);
begin
  inherited;

  // Abre From
  Application.CreateForm(TF_PERMISSOES, F_PERMISSOES);
  F_PERMISSOES.usuario := StrToInt( editID.Text );
  F_PERMISSOES.show;

end;

end.
