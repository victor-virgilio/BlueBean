unit BBBackup_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, FileCtrl;

type
  TfrmBackup = class(TForm)
    edtLocalBackup: TEdit;
    cbbTipoBackup: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btnAcao: TBitBtn;
    btnLocal: TBitBtn;
    stpBackup: TADOStoredProc;
    OpnBkp: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cbbTipoBackupKeyPress(Sender: TObject; var Key: Char);
    procedure btnLocalClick(Sender: TObject);
    procedure btnAcaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, Login_Form, LoginMsg_Form,
  MsgMain, SICK013;

{$R *.dfm}

procedure TfrmBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=  Cafree;
end;

procedure TfrmBackup.FormDestroy(Sender: TObject);
begin
  frmBackup := NIl;
end;



procedure TfrmBackup.cbbTipoBackupKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;



procedure TfrmBackup.btnLocalClick(Sender: TObject);
var
  selDir : string;
begin
  SelectDirectory('Selecione uma pasta','Meu computador', selDir);
  edtLocalBackup.Text := selDir;
end;



procedure TfrmBackup.btnAcaoClick(Sender: TObject);
begin
  stpBackup.Close;
  stpBackup.Parameters.ParamByName('@sOpr').Value         := 'ENB';
  stpBackup.Parameters.ParamByName('@BaseLocation').Value := edtLocalBackup.Text;

  if cbbTipoBackup.ItemIndex = 0 then
    stpBackup.Parameters.ParamByName('@BackupType').Value := 'FULL';

  if cbbTipoBackup.ItemIndex = 1 then
    stpBackup.Parameters.ParamByName('@BackupType').Value := 'DIFFERENTIAL';

  if cbbTipoBackup.ItemIndex = 2 then
    stpBackup.Parameters.ParamByName('@BackupType').Value := 'LOG';

  Cursor := crHourGlass;
  stpBackup.ExecProc;
  Cursor := crDefault;
end;

end.
