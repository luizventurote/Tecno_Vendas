unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, U_DM, DB, U_SISTEMA;

type
  TF_LOGIN = class(TForm)
    editUsuario: TEdit;
    Label1: TLabel;
    editSenha: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    BitBtn2: TBitBtn;
    DS: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ChangeFocus(Sender: TObject);
  end;

var
  F_LOGIN: TF_LOGIN;

implementation

{$R *.dfm}

procedure TF_LOGIN.BitBtn2Click(Sender: TObject);
begin
  F_Login.Close;
end;

procedure TF_LOGIN.BitBtn1Click(Sender: TObject);
begin

    if DM.M_Usuario.Locate('login', editUsuario.Text, [lopartialkey, locaseinsensitive]) then
    begin

      if DM.M_Usuario.Locate('senha', editSenha.Text, [lopartialkey, locaseinsensitive]) then
      begin

        Application.CreateForm(TF_SISTEMA, F_SISTEMA);
        F_SISTEMA.show;
        F_LOGIN.Hide;

      end
      else
        ShowMessage('Senha errada!');

    end
    else
      ShowMessage('Usuário não encontrado no sistema!');

end;

procedure TF_LOGIN.FormCreate(Sender: TObject);
var
  index: integer;
begin
  DS.DataSet.Open;

  // Faz referência de uma procedure em um evento
  for index := 0 to ComponentCount - 1 do
    if Components[index] is TEdit then
      begin
      (Components[index] as TEdit).OnEnter := ChangeFocus;
      end;

end;

// Altera a cor do foco do edit
procedure TF_LOGIN.ChangeFocus(Sender: TObject);
var
  index: integer;
  edit: TEdit;
begin
  for index := 0 to ComponentCount - 1 do
    // Verifica se é do tipo TEdit
    if Components[index] is TEdit then
    begin
      // Faz um type-casting (Conversão de tipos) pata o tipo TEdit
      edit := Components[index] as TEdit;

      // Verifica se o Edit está com foco
      if edit.Focused then
        edit.Color := $DCF8FF
      else
        edit.Color := clWindow;
    end;
end;

end.
