unit BBIAEFormaPagto_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls;

type
  TfrmIAEFormaPagto = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Shape3: TShape;
    Label4: TLabel;
    Label6: TLabel;
    lblNumReg: TLabel;
    Label5: TLabel;
    Shape2: TShape;
    Shape4: TShape;
    edtCod: TEdit;
    edtDesc: TEdit;
    mmObs: TMemo;
    btnInc: TBitBtn;
    btnAlt: TBitBtn;
    btnExc: TBitBtn;
    btnAcao: TBitBtn;
    grdPsq: TDBGrid;
    btnCancel: TBitBtn;
    stpPsqFormaPagto: TADOStoredProc;
    dtsPsqFormaPagto: TDataSource;
    stpIAEFormaPagto: TADOStoredProc;
    pop1: TPopupMenu;
    PopIncPes: TMenuItem;
    PopAltPes: TMenuItem;
    PopExcPes: TMenuItem;
    Label3: TLabel;
    edtSigla: TEdit;
    stpPsqFormaPagtoFormaPagto: TStringField;
    stpPsqFormaPagtoCd: TIntegerField;
    stpPsqFormaPagtoDescrio: TStringField;
    stpPsqFormaPagtoSigla: TStringField;
    stpPsqFormaPagtods_Obs_FPg: TStringField;
    Label7: TLabel;
    edtPercDesconto: TEdit;
    stpPsqFormaPagtoDesconto: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stpPsqFormaPagtoAfterScroll(DataSet: TDataSet);
    procedure btnIncClick(Sender: TObject);
    procedure btnAltClick(Sender: TObject);
    procedure btnExcClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAcaoClick(Sender: TObject);
    procedure grdPsqDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtPercDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPercDescontoExit(Sender: TObject);
  private
    { Private declarations }
  public
    sOpr : String;
    bPreencheTela : boolean;

    Procedure PreencheTela;
    Procedure TravaTela(bTrava:boolean);
    Function  ValidaCampos:Boolean;
  end;

var
  frmIAEFormaPagto: TfrmIAEFormaPagto;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, Login_Form, LoginMsg_Form,
  SICK013;

{$R *.dfm}

procedure TfrmIAEFormaPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmIAEFormaPagto.FormDestroy(Sender: TObject);
begin
  frmIAEFormaPagto := Nil;
end;



procedure TfrmIAEFormaPagto.FormShow(Sender: TObject);
begin
  stpPsqFormaPagto.Close;
  stpPsqFormaPagto.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpPsqFormaPagto.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpPsqFormaPagto.Parameters.ParamByName('@id_Codigo_Fpg').Value := Null;
  stpPsqFormaPagto.Open;

  TravaTela(True);
  bPreencheTela := True;
  PreencheTela;
end;



procedure TfrmIAEFormaPagto.stpPsqFormaPagtoAfterScroll(DataSet: TDataSet);
begin
  lblNumReg.Caption := inttostr(stpPsqFormaPagto.RecordCount);
  label6.Left := lblNumReg.Left - label6.width - 4;
  PreencheTela;
end;



Procedure TfrmIAEFormaPagto.PreencheTela;
begin
  if bPreencheTela then begin
    edtCod.Text          := stpPsqFormaPagto.Fields.FieldByName('Cód').AsString;
    edtDesc.Text         := stpPsqFormaPagto.Fields.FieldByName('Descrição').AsString;
    edtSigla.Text        := stpPsqFormaPagto.Fields.FieldByName('Sigla').AsString;
    edtPercDesconto.Text := FormatFloat('###,##0.00',stpPsqFormaPagto.Fields.FieldByName('Desconto').AsFloat);
    mmObs.Text           := stpPsqFormaPagto.Fields.FieldByName('ds_Obs_Fpg').AsString;
  end;
end;




Procedure TfrmIAEFormaPagto.TravaTela(bTrava:boolean);
begin
  if bTrava then begin
    edtDesc.Color         := $00FFE6CE;
    edtSigla.Color        := $00FFE6CE;
    edtPercDesconto.Color := $00FFE6CE;
    mmObs.Color           := $00FFE6CE;

    edtDesc.ReadOnly         := True;
    edtSigla.ReadOnly        := True;
    edtPercDesconto.ReadOnly := True;
    mmObs.ReadOnly           := True;
    btnAcao.Enabled          := False;

    btnAcao.Caption   := '';
  end else begin
    edtDesc.Color         := clWhite;
    edtSigla.Color        := clWhite;
    edtPercDesconto.Color := clWhite;
    mmObs.Color           := clWhite;

    edtDesc.ReadOnly         := False;
    edtSigla.ReadOnly        := False;
    edtPercDesconto.ReadOnly := False;
    mmObs.ReadOnly           := False;
    btnAcao.Enabled          := True;
  end;
end;



procedure TfrmIAEFormaPagto.btnIncClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Incluir formas pagamento').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    exit;
  end;
  sOpr := 'INF';
  bPreencheTela := False;
  TravaTela(False);

  edtCod.Text          := '';
  edtDesc.Text         := '';
  edtSigla.Text        := '';
  edtPercDesconto.Text := '0,00';
  mmObs.Text           := '';

  btnAcao.Glyph := frmMain.ImgInc16.Picture.Bitmap;
  btnInc.Enabled    := True;
  btnAlt.Enabled    := False;
  btnExc.Enabled    := False;
  btnAcao.Enabled   := True;
  btnCancel.Enabled := True;
  btnAcao.Caption := ' &Incluir';
end;

procedure TfrmIAEFormaPagto.btnAltClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Alterar formas pagamento').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    exit;
  end;

  sOpr := 'ACF';
  bPreencheTela := False;
  TravaTela(False);

  btnAcao.Glyph := frmMain.ImgAlt16.Picture.Bitmap;
  btnInc.Enabled      := False;
  btnAlt.Enabled      := True;
  btnExc.Enabled      := False;
  btnAcao.Enabled     := True;
  btnCancel.Enabled   := True;
  btnAcao.Caption := ' &Alterar';
end;

procedure TfrmIAEFormaPagto.btnExcClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Excluir formas pagamento').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    exit;
  end;
  sOpr := 'ECF';
  bPreencheTela := False;
  TravaTela(True);

  btnAcao.Glyph := frmMain.ImgExc16.Picture.Bitmap;
  btnInc.Enabled      := False;
  btnAlt.Enabled      := False;
  btnExc.Enabled      := True;
  btnAcao.Enabled     := True;
  btnCancel.Enabled   := True;
  btnAcao.Caption := ' &Excluir';
end;



procedure TfrmIAEFormaPagto.btnCancelClick(Sender: TObject);
begin
  sOpr := '';
  bPreencheTela     := True;
  PreencheTela;
  TravaTela(True);
  btnInc.Enabled    := True;
  btnAlt.Enabled    := True;
  btnExc.Enabled    := True;
  btnAcao.Enabled   := False;
  btnCancel.Enabled := False;
end;



Function TfrmIAEFormaPagto.ValidaCampos : boolean;
begin
  if Length(edtDesc.Text) < 3 then begin
    result := False;
    ALERTMSG('Erro','O nome/descrição da forma de pagamento deve conter ao menos 3 caracteres.',false);
    edtDesc.SetFocus;
    Exit;
  end;

  if Length(edtSigla.Text) <> 3 then begin
    result := False;
    ALERTMSG('Erro','A sigla da forma de pagamento deve conter exatamente 3 caracteres.',false);
    edtSigla.SetFocus;
    Exit;
  end;

  if ((StrToFloat(edtPercDesconto.Text) < 0) or (StrToFloat(edtPercDesconto.Text) > 100)) then begin
    result := False;
    ALERTMSG('Erro','O percentual de desconto deve ser um valor entre 0 e 100.',false);
    edtPercDesconto.SetFocus;
    Exit;
  end;

  result := true;
end;



procedure TfrmIAEFormaPagto.btnAcaoClick(Sender: TObject);
begin
  if ((sOpr = 'INF') or (sOpr = 'ACF')) then begin
    if not ValidaCampos then
      exit
    else begin
      stpIAEFormaPagto.Close;
      stpIAEFormaPagto.Parameters.ParamByName('@sOpr').Value             := sOpr;
      stpIAEFormaPagto.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
      stpIAEFormaPagto.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;

      if sOpr = 'INF' then
        stpIAEFormaPagto.Parameters.ParamByName('@id_Codigo_FPg').Value    := Null
      else
        stpIAEFormaPagto.Parameters.ParamByName('@id_Codigo_FPg').Value    := StrToInt(edtCod.Text);

      stpIAEFormaPagto.Parameters.ParamByName('@ds_Descricao_FPg').Value    := edtDesc.Text;
      stpIAEFormaPagto.Parameters.ParamByName('@ds_Sigla_FPg').Value        := edtSigla.Text;
      stpIAEFormaPagto.Parameters.ParamByName('@qt_PercDesconto_FPg').Value := StrToFloat(edtPercDesconto.Text);
      stpIAEFormaPagto.Parameters.ParamByName('@ds_Obs_Fpg').Value          := mmObs.Text;
      stpIAEFormaPagto.Parameters.ParamByName('@id_Codigo_Usu').Value       := frmMain.iUsu;
      stpIAEFormaPagto.ExecProc;
    end;
    btnCancelClick(Self);
    stpPsqFormaPagto.Close;
    stpPsqFormaPagto.Open;
  end;

  if sOpr = 'ECF' then begin

{   stpIAEDepto.Close;
    stpIAEDepto.Parameters.ParamByName('@sOpr').Value             := 'VED';
    stpIAEDepto.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
    stpIAEDepto.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;
    stpIAEDepto.Parameters.ParamByName('@id_Codigo_Dep').Value    := StrToInt(edtCodDep.Text);
    stpIAEDepto.Parameters.ParamByName('@ds_Descricao_Dep').Value := Null;
    stpIAEDepto.Parameters.ParamByName('@ds_Sigla_Dep').Value     := Null;
    stpIAEDepto.Parameters.ParamByName('@cd_Genero_Dep').Value    := Null;
    stpIAEDepto.Parameters.ParamByName('@ds_Obs_Dep').Value       := Null;
    stpIAEDepto.Parameters.ParamByName('@id_Codigo_Usu').Value    := frmMain.iUsu;
    stpIAEDepto.Open;

    if stpIAEDepto.Fields.FieldByName('Valida').AsInteger > 0 then begin
      ALERTMSG('Erro','Existe(m) ' + stpIAEDepto.Fields.FieldByName('Valida').AsString + ' produto(s) que no momento está(ão) usando o departamento que você deseja excluir. Antes de excluir é necessário alterar/excluir o(s) cadastro(s) de produto(s) que utiliza(m) esse departamento.',False);
      Exit;
    end;  }

    if not PopLogin('É necessário digitar seu usuário e senha para EXCLUIR cadastros do sistema.') then
      exit;

    stpIAEFormaPagto.Close;
    stpIAEFormaPagto.Parameters.ParamByName('@sOpr').Value                  := sOpr;
    stpIAEFormaPagto.Parameters.ParamByName('@id_Codigo_Org').Value         := frmMain.iOrg;
    stpIAEFormaPagto.Parameters.ParamByName('@id_Codigo_Fil').Value         := frmMain.iFil;
    stpIAEFormaPagto.Parameters.ParamByName('@id_Codigo_FPg').Value         := StrToInt(edtCod.Text);
    stpIAEFormaPagto.Parameters.ParamByName('@ds_Descricao_FPg').Value      := Null;
    stpIAEFormaPagto.Parameters.ParamByName('@ds_Sigla_FPg').Value          := Null;
      stpIAEFormaPagto.Parameters.ParamByName('@qt_PercDesconto_FPg').Value := Null;
    stpIAEFormaPagto.Parameters.ParamByName('@ds_Obs_FPg').Value            := Null;
    stpIAEFormaPagto.Parameters.ParamByName('@id_Codigo_Usu').Value         := frmMain.iUsu;
    stpIAEFormaPagto.ExecProc;
    btnCancelClick(Self);
    stpPsqFormaPagto.Close;
    stpPsqFormaPagto.Open;
  end;
end;



procedure TfrmIAEFormaPagto.grdPsqDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
begin
  if grdPsq.DataSource = dtsPsqFormaPagto then begin
    if not odd(stpPsqFormaPagto.RecNo) then begin
      if not (gdSelected in State) then begin
        grdPsq.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdPsq.Canvas.FillRect(Rect);
        grdPsq.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;
end;

procedure TfrmIAEFormaPagto.edtPercDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not EDITMONEY(key,edtPercDesconto,3,2) then
    key := #0;
end;

procedure TfrmIAEFormaPagto.edtPercDescontoExit(Sender: TObject);
begin
  if edtPercDesconto.Text = '' then
    edtPercDesconto.Text := '0,00';
end;

end.
