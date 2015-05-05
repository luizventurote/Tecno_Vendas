unit U_Log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, U_DM;

type
  TF_LOG = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_LOG: TF_LOG;

implementation

{$R *.dfm}

procedure TF_LOG.FormShow(Sender: TObject);
begin

  Memo1.Lines := DM.getSystemLog();

end;

end.
