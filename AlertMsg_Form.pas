unit AlertMsg_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmAlertMsg = class(TForm)
    btnS: TBitBtn;
    btnN: TBitBtn;
    mmMsg: TMemo;
    mmtit: TMemo;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnSClick(Sender: TObject);
    procedure btnNClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlertMsg: TfrmAlertMsg;

implementation

uses BBMain_Form, Alert_Form, SICK013;

{$R *.dfm}

procedure TfrmAlertMsg.FormShow(Sender: TObject);
begin
  if frmAlert.bbtnS then begin
    btnN.Caption := '&Não';
    btnS.Visible := True;
  end else begin
    btnN.Caption := 'OK';
    btnS.Visible := False;
  end;

  mmTit.Text     := frmAlert.sTitulo;
  mmMsg.Text     := frmAlert.sMsg;
end;

procedure TfrmAlertMsg.btnSClick(Sender: TObject);
begin
  bAlertReturn := True;
  Close;
end;

procedure TfrmAlertMsg.btnNClick(Sender: TObject);
begin
  bAlertReturn := False;
  Close;
end;



procedure TfrmAlertMsg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
  frmAlert.Close;
end;

procedure TfrmAlertMsg.FormDestroy(Sender: TObject);
begin
  frmAlertMsg := nil;
  frmAlert.Close;
end;

end.
