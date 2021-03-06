unit LoginMsg_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB;

type
  TfrmLoginMsg = class(TForm)
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnLogin: TButton;
    Label3: TLabel;
    mmtit: TMemo;
    btnCancel: TButton;
    Image1: TImage;
    stpLogin: TADOStoredProc;
    procedure btnLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoginMsg: TfrmLoginMsg;

implementation

uses BBMain_Form, SICK013, Login_Form;

{$R *.dfm}

procedure TfrmLoginMsg.btnLoginClick(Sender: TObject);
begin
  if Length(edtLogin.Text) < 3 then begin
    ALERTMSG('Login Inv?lido','Favor digitar um login v?lido.',false);
    edtLogin.SetFocus;
    exit;
  end;

  if Length(edtSenha.Text) < 3 then begin
    ALERTMSG('Senha Inv?lida','Favor digitar a senha novamente.',false);
    edtSenha.Text := '';
    edtSenha.SetFocus;
    exit;
  end;

  stpLogin.Close;
  stpLogin.Parameters.ParamByName('@Opr').Value := 'ELG';
  stpLogin.Parameters.ParamByName('@ds_Login_Usu').Value :=  edtLogin.Text;
  stpLogin.Parameters.ParamByName('@ds_Senha_Usu').Value :=  edtSenha.Text;
  stpLogin.Open;

  if stpLogin.RecordCount = 0 then begin
    bLoginReturn := False;
    ALERTMSG('Login/Senha Inv?lidos','O Login ou Senha informados s?o inv?lidos, favor verificar as informa??es.',false);
    edtSenha.Text := '';
    edtLogin.SetFocus;
    exit;
  end else begin
    if stpLogin.Fields.FieldByName('id_Codigo_Usu').AsInteger = 13 then begin
      bLoginReturn := False;
      ALERTMSG('FALHA DE AUTENTICA??O','Houve um problema na autentica??o do sistema e ele n?o p?de ser iniciado, favor entrar em contato com o administrador do sistema.',false);
      edtSenha.Text := '';
      edtLogin.SetFocus;
      exit;
    end;

    bLoginReturn := True;
    frmMain.iUsu := stpLogin.Fields.FieldByName('id_Codigo_Usu').AsInteger;
    frmMain.sUsu := stpLogin.Fields.FieldByName('ds_Login_Usu').AsString;
  end;

  Close;
end;

procedure TfrmLoginMsg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
  frmLogin.Close;
end;

procedure TfrmLoginMsg.FormDestroy(Sender: TObject);
begin
  frmLoginMsg := Nil;
  frmLogin.Close;
end;

procedure TfrmLoginMsg.FormShow(Sender: TObject);
begin
  mmtit.Text := frmLogin.sTitulo;
end;

procedure TfrmLoginMsg.btnCancelClick(Sender: TObject);
begin
  bLoginReturn := False;
  Close;
end;

procedure TfrmLoginMsg.Label3Click(Sender: TObject);
begin
  if Length(edtLogin.Text) < 3 then begin
    ALERTMSG('Login Inv?lido','Para receber seu lembrete de senha ? necess?rio digitar um Login v?lido..',false);
    edtLogin.SetFocus;
    exit;
  end;

  stpLogin.Close;
  stpLogin.Parameters.ParamByName('@Opr').Value := 'LBT';
  stpLogin.Parameters.ParamByName('@ds_Login_Usu').Value :=  edtLogin.Text;
  stpLogin.Parameters.ParamByName('@ds_Senha_Usu').Value :=  Null;
  stpLogin.Open;

  if stpLogin.RecordCount = 0 then begin
    ALERTMSG('Lembrete de senha','O Login digitado ? inexistente, digite um Login v?lido para receber seu lembrete de senha.',False);
    edtLogin.SetFocus;
    exit;
  end else begin
    ALERTMSG('Lembrete de senha','Seu lembrete ?: ' + stpLogin.Fields.FieldByName('ds_Lembrete_Usu').AsString,False);
  end;
end;

end.
