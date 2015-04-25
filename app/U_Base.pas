unit U_Base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB;

type
  TF_BASE = class(TForm)
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnSalvar: TBitBtn;
    btnDeletar: TBitBtn;
    btnEditar: TBitBtn;
    btnInfo: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    DataSource1: TDataSource;
    btnCancelar: TBitBtn;
    btnUltimo: TBitBtn;
    btnPrimeiro: TBitBtn;
    btnAdicionar: TBitBtn;
    btnPesquisar: TBitBtn;
    Image4: TImage;
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure ChangeFocus(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_BASE: TF_BASE;

implementation

{$R *.dfm}

procedure TF_BASE.btnEditarClick(Sender: TObject);
begin

  // Ativando/Desativando botões
  btnAdicionar.Enabled:= false;
  btnSalvar.Enabled   := true;
  btnDeletar.Enabled  := false;
  btnCancelar.Enabled := true;
  btnEditar.Enabled   := false;

end;

procedure TF_BASE.btnSalvarClick(Sender: TObject);
begin

  // Ativando/Desativando botões
  btnSalvar.Enabled    := false;
  btnDeletar.Enabled   := false;
  btnEditar.Enabled    := true;
  btnAdicionar.Enabled := true;
  btnCancelar.Enabled  := false;

end;

procedure TF_BASE.btnDeletarClick(Sender: TObject);
var
  confirmarcao_opt: Integer;
begin

  // Ativando/Desativando botões
  btnSalvar.Enabled    := false;
  btnDeletar.Enabled   := false;
  btnEditar.Enabled    := true;
  btnAdicionar.Enabled := true;

  // Exibe caixa de diálogo de confirmação
  confirmarcao_opt := MessageDlg('Você realmente eseja excluir?',mtCustom, [mbYes,mbCancel], 0);

  // Show the button type selected
  if confirmarcao_opt = mrOK     then ShowMessage('OK pressed');
  if confirmarcao_opt = mrCancel then ShowMessage('Cancel pressed');

end;

procedure TF_BASE.btnInfoClick(Sender: TObject);
begin
  ShowMessage('IFES 2015 - TecnoVendas by Thallys and Luiz.');
end;

procedure TF_BASE.btnCancelarClick(Sender: TObject);
begin

  // Ativando/Desativando botões
  btnSalvar.Enabled    := false;
  btnDeletar.Enabled   := false;
  btnEditar.Enabled    := true;
  btnCancelar.Enabled  := false;
  btnAdicionar.Enabled := true;
  
end;

// Altera a cor do foco do edit
procedure TF_BASE.ChangeFocus(Sender: TObject);
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

procedure TF_BASE.FormCreate(Sender: TObject);
var
  index: integer;
begin
  // Faz referência de uma procedure em um evento
  for index := 0 to ComponentCount - 1 do
    if Components[index] is TEdit then
      begin
      (Components[index] as TEdit).OnEnter := ChangeFocus;
      end;
end;

end.
