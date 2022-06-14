unit Alert_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmAlert = class(TForm)
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    sTitulo : string;
    sMsg    : string;
    bBtnS   : boolean;
    bResult : boolean;

    procedure fecharForm;
  end;

var
  frmAlert: TfrmAlert;

implementation

uses AlertMsg_Form;

{$R *.dfm}

procedure TfrmAlert.FormActivate(Sender: TObject);
begin
  if frmAlertMsg = Nil then
    frmAlertMsg := TfrmAlertMsg.Create(Self);

  frmAlertMsg.ShowModal;

  fecharForm;
end;

procedure TfrmAlert.fecharForm;
begin
  frmAlert.Close;
end;

end.
