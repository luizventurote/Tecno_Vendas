unit U_Base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Grids, DBGrids, DBCtrls,
  ComCtrls, ToolWin, U_DM;

type
  TF_BASE = class(TForm)
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnSalvar: TBitBtn;
    btnDeletar: TBitBtn;
    btnEditar: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    DS: TDataSource;
    btnCancelar: TBitBtn;
    btnUltimo: TBitBtn;
    btnPrimeiro: TBitBtn;
    btnAdicionar: TBitBtn;
    btnPesquisar: TBitBtn;
    Image4: TImage;
    PageControl1: TPageControl;
    tbDados: TTabSheet;
    tbFiltros: TTabSheet;
    grFiltros: TGroupBox;
    DBGrid1: TDBGrid;
    grDados: TGroupBox;
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure ChangeFocus(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSStateChange(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure StatusBotoes(e: integer);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_BASE: TF_BASE;

implementation

{$R *.dfm}

// -----------------------------------------------------------------------------
// Altera status dos botões
// -----------------------------------------------------------------------------
procedure TF_BASE.StatusBotoes(e: integer);
begin
  btnSalvar.Enabled   := e=1;
  btnCancelar.Enabled := e=1;

  btnAnterior.Enabled := (e=2) and not (DS.DataSet.IsEmpty);
  btnProximo.Enabled  := (e=2) and not (DS.DataSet.IsEmpty);
  btnPrimeiro.Enabled := (e=2) and not (DS.DataSet.IsEmpty);
  btnUltimo.Enabled   := (e=2) and not (DS.DataSet.IsEmpty);

  btnAdicionar.Enabled  := e=2;
  btnDeletar.Enabled    := (e=2) and not (DS.DataSet.IsEmpty);
  btnEditar.Enabled     := (e=2) and not (DS.DataSet.IsEmpty);
  btnPesquisar.Enabled  := e=2;

end;


// -----------------------------------------------------------------------------
// BTN EDITAR
// -----------------------------------------------------------------------------
procedure TF_BASE.btnEditarClick(Sender: TObject);
begin

  // Verifica se a tabela está ativa
  if DS.DataSet.Active then
    begin
        if not DS.DataSet.IsEmpty then
        begin
            DS.DataSet.Edit;
            PageControl1.ActivePageIndex := 0;
        end else
            ShowMessage('Não há registros para alteração.');
    end;

end;


// -----------------------------------------------------------------------------
// BTN SALVAR
// -----------------------------------------------------------------------------
procedure TF_BASE.btnSalvarClick(Sender: TObject);
begin

  // Salva os dados
  DS.DataSet.Post;

end;
 

// -----------------------------------------------------------------------------
// BTN DELETAR
// -----------------------------------------------------------------------------
procedure TF_BASE.btnDeletarClick(Sender: TObject);
begin

  // Deleta o registro
  if DS.DataSet.Active then
  begin
    if not DS.DataSet.IsEmpty then
    begin

      if (Application.MessageBox('Deseja Deletar ', 'Deletar', MB_YESNO + MB_ICONQUESTION) = id_yes) then
      begin
        DS.DataSet.Delete;
      end;

    end
    else
      ShowMessage('Não há registros');
  end;

end;
  

// -----------------------------------------------------------------------------
// BTN INFORMAÇÕES
// -----------------------------------------------------------------------------
procedure TF_BASE.btnInfoClick(Sender: TObject);
begin
  ShowMessage('IFES 2015 - TecnoVendas by Thallys and Luiz.');
end;

procedure TF_BASE.btnCancelarClick(Sender: TObject);
begin

  if (Application.MessageBox('Deseja Cancelar ', 'Cancelar', MB_YESNO + MB_ICONQUESTION )= id_yes) then
  begin
    ds.DataSet.Cancel;
  end;
  
end;


// -----------------------------------------------------------------------------
// ALTERAR COR DO FOCO DO EDIT
// -----------------------------------------------------------------------------
procedure TF_BASE.ChangeFocus(Sender: TObject);
var
  index: integer;
  edit: TEdit;
  edit_db: TDBEdit;
begin

  // TDBEdit
  for index := 0 to ComponentCount - 1 do
    // Verifica se é do tipo TDBEdit
    if Components[index] is TDBEdit then
    begin
      // Faz um type-casting (Conversão de tipos) pata o tipo TDBEdit
      edit_db := Components[index] as TDBEdit;

      // Verifica se o Edit está com foco
      if edit_db.Focused then
        edit_db.Color := $DCF8FF
      else
        edit_db.Color := clWindow;
  end;

  // TEdit
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
     

// -----------------------------------------------------------------------------
// FORM CREATE
// -----------------------------------------------------------------------------
procedure TF_BASE.FormCreate(Sender: TObject);
begin

  StatusBotoes(2);
  
  // Habilita a tecla Enter
  KeyPreview := true;

end;


// -----------------------------------------------------------------------------
// FORM KEY DOWN
// -----------------------------------------------------------------------------
procedure TF_BASE.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if( key = vk_return)
      and not (ActiveControl is tmemo)
      and not (ActiveControl is TDBMemo)
      and not (ActiveControl is TDBGrid) then
      Perform( WM_NEXTDLGCTL,0,0);
end;


// -----------------------------------------------------------------------------
// FORM KEY PRESS
// -----------------------------------------------------------------------------
procedure TF_BASE.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
    SelectNext(ActiveControl as TWinControl,True,True);
    key:=#0;
  end;
end;


// -----------------------------------------------------------------------------
// FORM CLOSE
// -----------------------------------------------------------------------------
procedure TF_BASE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ds.DataSet.Close;
end;
  

// -----------------------------------------------------------------------------
// DS STATE CHANGE
// -----------------------------------------------------------------------------
procedure TF_BASE.DSStateChange(Sender: TObject);
begin

    tbFiltros.TabVisible := DS.DataSet.State in [dsBrowse, dsInactive];
    grDados.Enabled      := DS.DataSet.State in dsEditModes;

    if DS.DataSet.State in dsEditModes then
      StatusBotoes(1)
    else
      StatusBotoes(2);

end;


// -----------------------------------------------------------------------------
// BTN ADICIONAR
// -----------------------------------------------------------------------------
procedure TF_BASE.btnAdicionarClick(Sender: TObject);
begin

  // Verifica se a tabela está ativa
  if not DS.DataSet.Active then
        DS.DataSet.Open;

  // Insere dados no final da tabela
  DS.DataSet.Append;

  // Altera a tap
  PageControl1.ActivePageIndex := 0;
  
end;
   

// -----------------------------------------------------------------------------
// BTN PESQUISAR
// -----------------------------------------------------------------------------
procedure TF_BASE.btnPesquisarClick(Sender: TObject);
begin
  DS.DataSet.Close;
  DS.DataSet.Open;
end;
    

// -----------------------------------------------------------------------------
// BTN PRIMEIRO
// -----------------------------------------------------------------------------
procedure TF_BASE.btnPrimeiroClick(Sender: TObject);
begin
  DS.DataSet.First;
end;
  

// -----------------------------------------------------------------------------
// BRN ÚLTIMO
// -----------------------------------------------------------------------------
procedure TF_BASE.btnUltimoClick(Sender: TObject);
begin
  DS.DataSet.Last;
end;
 

// -----------------------------------------------------------------------------
// BTN ANTERIOR
// -----------------------------------------------------------------------------
procedure TF_BASE.btnAnteriorClick(Sender: TObject);
begin
  DS.DataSet.Prior;
end;
 

// -----------------------------------------------------------------------------
// BTN PRÓXIMO
// -----------------------------------------------------------------------------
procedure TF_BASE.btnProximoClick(Sender: TObject);
begin
  DS.DataSet.Next;
end;


// -----------------------------------------------------------------------------
// FORM SHOW
// -----------------------------------------------------------------------------
procedure TF_BASE.FormShow(Sender: TObject);
var
  index: integer;
begin

  StatusBotoes(2);

  // Faz referência de uma procedure em um evento
  for index := 0 to ComponentCount - 1 do
  begin
    if Components[index] is TEdit then
      begin
      (Components[index] as TEdit).OnEnter := ChangeFocus;
      end;
  end;

  // Faz referência de uma procedure em um evento
  for index := 0 to ComponentCount - 1 do
  begin
    if Components[index] is TDBEdit then
      begin
      (Components[index] as TDBEdit).OnEnter := ChangeFocus;
      end;
  end;

end;

end.
