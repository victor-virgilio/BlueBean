unit Login_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmLogin = class(TForm)
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    sTitulo : String;

    Procedure FecharForm;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses LoginMsg_Form;

{$R *.dfm}

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  if frmLoginMsg = nil then
    frmLoginMsg := TfrmLoginMsg.Create(Self);

  frmLoginMsg.ShowModal;

  FecharForm;
end;

procedure TfrmLogin.FecharForm;
begin
  frmLogin.Close;
end;

end.
