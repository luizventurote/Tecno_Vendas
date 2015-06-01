unit U_Base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Grids, DBGrids, DBCtrls,
  ComCtrls, ToolWin, U_DM, ExcelXP, Excel97, Excel2000, DBGridBeleza;

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
    grDados: TGroupBox;
    btnExportExcel: TBitBtn;
    DBGrid1: TDBGridBeleza;
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
    procedure ExportToCSV(const aGrid : TDBGrid; const FileName : String);
    procedure btnExportExcelClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    function Cnpj(xCNPJ: String):Boolean;
  end;

var
  F_BASE: TF_BASE;

implementation

{$R *.dfm}

// -----------------------------------------------------------------------------
// Altera status dos bot�es
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

  // Verifica se a tabela est� ativa
  if DS.DataSet.Active then
    begin
        if not DS.DataSet.IsEmpty then
        begin
            DS.DataSet.Edit;
            PageControl1.ActivePageIndex := 0;
        end else
            ShowMessage('N�o h� registros para altera��o.');
    end;

end;


// -----------------------------------------------------------------------------
// BTN SALVAR
// -----------------------------------------------------------------------------
procedure TF_BASE.btnSalvarClick(Sender: TObject);
begin

  // Salva os dados
  DS.DataSet.Post;

  DM.addLog('Os dados do registro foram salvos');

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
        DM.addLog('Registro deletado');
      end;

    end
    else
      ShowMessage('N�o h� registros');
  end;

end;
  

// -----------------------------------------------------------------------------
// BTN INFORMA��ES
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
    // Verifica se � do tipo TDBEdit
    if Components[index] is TDBEdit then
    begin
      // Faz um type-casting (Convers�o de tipos) pata o tipo TDBEdit
      edit_db := Components[index] as TDBEdit;

      // Verifica se o Edit est� com foco
      if edit_db.Focused then
        edit_db.Color := $DCF8FF
      else
        edit_db.Color := clWindow;
  end;

  // TEdit
  for index := 0 to ComponentCount - 1 do
    // Verifica se � do tipo TEdit
    if Components[index] is TEdit then
    begin
      // Faz um type-casting (Convers�o de tipos) pata o tipo TEdit
      edit := Components[index] as TEdit;

      // Verifica se o Edit est� com foco
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

  // Verifica se a tabela est� ativa
  if not DS.DataSet.Active then
        DS.DataSet.Open;

  // Insere dados no final da tabela
  DS.DataSet.Append;

  // Altera a tap
  PageControl1.ActivePageIndex := 0;

  DM.addLog('Adicionar registro');
  
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
// BRN �LTIMO
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
// BTN PR�XIMO
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

  // Faz refer�ncia de uma procedure em um evento
  for index := 0 to ComponentCount - 1 do
  begin
    if Components[index] is TEdit then
      begin
      (Components[index] as TEdit).OnEnter := ChangeFocus;
      end;
  end;

  // Faz refer�ncia de uma procedure em um evento
  for index := 0 to ComponentCount - 1 do
  begin
    if Components[index] is TDBEdit then
      begin
      (Components[index] as TDBEdit).OnEnter := ChangeFocus;
      end;
  end;

end;


// -----------------------------------------------------------------------------
// EXPORTA DADOS PARA CSV
// -----------------------------------------------------------------------------
procedure TF_BASE.ExportToCSV(const aGrid : TDBGrid; const FileName : String);
var
  I, J : Integer;
  SavePlace : TBookmark;
  Table : TStrings;
  HeadTable : String;
  LineTable : String;
  First : Boolean;
Begin

  HeadTable := '';
  LineTable := '';
  Table := TStringList.Create;
  First := True;

  Try
    For I := 0 To Pred(aGrid.Columns.Count) Do
      If aGrid.Columns[I].Visible Then
        If First Then
        Begin
          // Use the text from the grid, in case it has been set programatically
          // E.g., we prefer to show "Date/time" than "from_unixtime(activity.time_stamp, "%D %b %Y  %l:%i:%S")"
          HeadTable := HeadTable + aGrid.Columns[I].FieldName;
          //HeadTable := HeadTable + ActivityReportStringGrid.Columns[i].Title.Caption + ','; // Previous separated wth semi-colon, not comma! (global)
          First := False;
        End
        Else
        begin
          HeadTable := HeadTable + ';' + aGrid.Columns[I].FieldName;
          //HeadTable := HeadTable + ActivityReportStringGrid.Columns[i].Title.Caption + ',';
        end;

    Delete(HeadTable, Length(HeadTable), 1);  // Remove the superfluous trailing comma
    Table.Add(HeadTable);
    First := True;

    // with selection of rows
    If aGrid.SelectedRows.Count > 0 Then
    Begin
      For i := 0 To aGrid.SelectedRows.Count - 1 Do
      Begin
        aGrid.DataSource.Dataset.GotoBookmark(pointer(aGrid.SelectedRows.Items[i]));
        For j := 0 To aGrid.Columns.Count - 1 Do
          If aGrid.Columns[J].Visible Then
            If First Then
            Begin
              lineTable := lineTable + aGrid.Fields[J].AsString;
              First := False;
            End
            Else
              lineTable := lineTable + ',' + aGrid.Fields[J].AsString;

        Delete(LineTable, Length(LineTable), 1);  // Remove the superfluous trailing comma
        Table.Add(LineTable);
        LineTable := '';
        First := True;
      End;
    End
    Else
      //no selection
    Begin
      SavePlace := aGrid.DataSource.Dataset.GetBookmark;
      aGrid.DataSource.Dataset.First;

      Try
        While Not aGrid.DataSource.Dataset.Eof Do
        Begin
          For I := 0 To aGrid.Columns.Count - 1 Do
            If aGrid.Columns[I].Visible Then
              If First Then
              Begin
                lineTable := lineTable + aGrid.Fields[I].AsString;
                First := False;
              End
              Else
                lineTable := lineTable + ';' + aGrid.Fields[I].AsString;


          Delete(LineTable, Length(LineTable), 1);  // Remove the superfluous trailing comma
          Table.Add(LineTable);
          LineTable := '';
          aGrid.DataSource.Dataset.Next;
          First := True;
        End;

        aGrid.DataSource.Dataset.GotoBookmark(SavePlace);
      Finally
        aGrid.DataSource.Dataset.FreeBookmark(SavePlace);
      End;
    End;
    Table.SaveToFile(FileName);
  Finally
    Table.Free;
  End;
End;  // ExportToCSV()


// -----------------------------------------------------------------------------
// BTN EXPORTA DADOS PARA CSV
// -----------------------------------------------------------------------------
procedure TF_BASE.btnExportExcelClick(Sender: TObject);
var
S: string;
begin
  S := 'grid';
  ExportToCSV(DBGrid1, S+'-dados.csv');
  ShowMessage('Dados exportados com sucesso para o arquivo '+S+'-dados.csv.');

  DM.addLog('Dados exportados para CSV');

end;


// -----------------------------------------------------------------------------
// TESTA CPF
// -----------------------------------------------------------------------------
Function testacpf(cpf:string):boolean;
var i:integer;
    Want:char;
    Wvalid:boolean;
    Wdigit1,Wdigit2:integer;
begin
    Wdigit1:=0;
    Wdigit2:=0;
    Want:=cpf[1];//variavel para testar se o cpf � repetido como 111.111.111-11
    Delete(cpf,ansipos('.',cpf),1);  //retira as mascaras se houver
    Delete(cpf,ansipos('.',cpf),1);
    Delete(cpf,ansipos('-',cpf),1);

   //testar se o cpf � repetido como 111.111.111-11
   for i:=1 to length(cpf) do
     begin
       if cpf[i] <> Want then
         begin
            Wvalid:=true;  // se o cpf possui um digito diferente ele passou no primeiro teste
            break
         end;
     end;
       // se o cpf � composto por numeros repetido retorna falso
     if not Wvalid then
       begin
          result:=false;
          exit;
       end;

     //executa o calculo para o primeiro verificador
     for i:=1 to 9 do
       begin
          wdigit1:=Wdigit1+(strtoint(cpf[10-i])*(I+1));
       end;
        Wdigit1:= ((11 - (Wdigit1 mod 11))mod 11) mod 10;
        {formula do primeiro verificador
            soma=1�*2+2�*3+3�*4.. at� 9�*10
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

         //verifica se o 1� digito confere
        if IntToStr(Wdigit1) <> cpf[10] then
          begin
             result:=false;
             exit;
          end;


         for i:=1 to 10 do
       begin
          wdigit2:=Wdigit2+(strtoint(cpf[11-i])*(I+1));
       end;
       Wdigit2:= ((11 - (Wdigit2 mod 11))mod 11) mod 10;
         {formula do segundo verificador
            soma=1�*2+2�*3+3�*4.. at� 10�*11
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

       // confere o 2� digito verificador
       if IntToStr(Wdigit2) <> cpf[11] then
          begin
             result:=false;
             exit;
          end;

   //se chegar at� aqui o cpf � valido
   result:=true;
end;


// -----------------------------------------------------------------------------
// TESTA CNPJ
// -----------------------------------------------------------------------------
function TF_BASE.Cnpj(xCNPJ: String):Boolean;
Var
  d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
   Check : String;
begin
d1 := 0;
d4 := 0;
xx := 1;
for nCount := 1 to Length( xCNPJ )-2 do
    begin
    if Pos( Copy( xCNPJ, nCount, 1 ), '/-.' ) = 0 then
    begin
    if xx < 5 then
    begin
    fator := 6 - xx;
    end
    else
   begin
   fator := 14 - xx;
   end;
   d1 := d1 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
   if xx < 6 then
    begin
    fator := 7 - xx;
   end
   else
   begin
   fator := 15 - xx;    end;
   d4 := d4 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
   xx := xx+1;
   end;
   end;
   resto := (d1 mod 11);
   if resto < 2 then
   begin
   digito1 := 0;
   end
   else
   begin
   digito1 := 11 - resto;
   end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
    begin
    digito2 := 0;
   end
   else
    begin
    digito2 := 11 - resto;
   end;
    Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(xCNPJ,succ(length(xCNPJ)-2),2) then
    begin
    Result := False;
   end
   else
    begin
    Result := True;
   end;
end;


// -----------------------------------------------------------------------------
// Renderiza valor do memo na grid
// -----------------------------------------------------------------------------
procedure TF_BASE.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
t: String;
begin

end;


end.
