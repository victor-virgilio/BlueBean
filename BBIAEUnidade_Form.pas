unit BBIAEUnidade_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmIAEUnidade = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape3: TShape;
    Label4: TLabel;
    Label6: TLabel;
    lblNumReg: TLabel;
    Label5: TLabel;
    Shape2: TShape;
    Shape4: TShape;
    edtCodUni: TEdit;
    edtDescUni: TEdit;
    edtSiglaUni: TEdit;
    mmObsUni: TMemo;
    btnInc: TBitBtn;
    btnAlt: TBitBtn;
    btnExc: TBitBtn;
    btnAcao: TBitBtn;
    grdPsqUni: TDBGrid;
    stpIAEUni: TADOStoredProc;
    dtsPsqUni: TDataSource;
    stpPsqUni: TADOStoredProc;
    pop1: TPopupMenu;
    PopIncPes: TMenuItem;
    PopAltPes: TMenuItem;
    PopExcPes: TMenuItem;
    btnCancel: TBitBtn;
    rbtInt: TCheckBox;
    rbtDec: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stpPsqUniAfterScroll(DataSet: TDataSet);
    procedure btnIncClick(Sender: TObject);
    procedure btnAltClick(Sender: TObject);
    procedure btnExcClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAcaoClick(Sender: TObject);
    procedure grdPsqUniDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rbtIntClick(Sender: TObject);
    procedure rbtDecClick(Sender: TObject);
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
  frmIAEUnidade: TfrmIAEUnidade;

implementation

uses Alert_Form, AlertMsg_Form, BBIAEProduto_Form, BBMain_Form,
  BBProduto_Form, Login_Form, LoginMsg_Form, SICK013;

{$R *.dfm}

procedure TfrmIAEUnidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmIAEUnidade.FormDestroy(Sender: TObject);
begin
  frmIAEUnidade := Nil;
end;



procedure TfrmIAEUnidade.FormShow(Sender: TObject);
begin
  stpPsqUni.Close;
  stpPsqUni.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpPsqUni.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpPsqUni.Parameters.ParamByName('@id_Codigo_UnP').Value := Null;
  stpPsqUni.Open;

  TravaTela(True);
  bPreencheTela := True;
  PreencheTela;
end;



procedure TfrmIAEUnidade.stpPsqUniAfterScroll(DataSet: TDataSet);
begin
  lblNumReg.Caption := inttostr(stpPsqUni.RecordCount);
  label6.Left := lblNumReg.Left - label6.width - 4;
  PreencheTela;
end;



Procedure TfrmIAEUnidade.PreencheTela;
begin
  rbtint.Checked := False;
  rbtDec.Checked := False;

  if bPreencheTela then begin
    edtCodUni.Text   := stpPsqUni.Fields.FieldByName('id_Codigo_UnP').AsString;
    edtDescUni.Text  := stpPsqUni.Fields.FieldByName('ds_Descricao_UnP').AsString;
    edtSiglaUni.Text := stpPsqUni.Fields.FieldByName('ds_Sigla_UnP').AsString;
    mmObsUni.Text    := stpPsqUni.Fields.FieldByName('ds_Obs_UnP').AsString;

    if stpPsqUni.Fields.FieldByName('fl_VLInteiro_UnP').AsBoolean then begin
      rbtint.Checked := True;
      rbtDec.Checked := False;
    end;

    if stpPsqUni.Fields.FieldByName('fl_VLDecimal_UnP').AsBoolean then begin
      rbtint.Checked := False;
      rbtDec.Checked := True;
    end;
  end;
end;



Procedure TfrmIAEUnidade.TravaTela(bTrava:boolean);
begin
  if bTrava then begin
    edtDescUni.Color  := $00FFE6CE;
    edtSiglaUni.Color := $00FFE6CE;
    mmObsUni.Color    := $00FFE6CE;
    btnAcao.Caption   := '';

    edtDescUni.ReadOnly  := True;
    edtSiglaUni.ReadOnly := True;
    mmObsUni.ReadOnly    := True;
    btnAcao.Enabled      := False;
    rbtint.Enabled       := False;
    rbtdec.Enabled       := False;
  end else begin
    edtDescUni.Color  := clWhite;
    edtSiglaUni.Color := clWhite;
    mmObsUni.Color    := clWhite;

    edtDescUni.ReadOnly  := False;
    edtSiglaUni.ReadOnly := False;
    mmObsUni.ReadOnly    := False;
    btnAcao.Enabled      := True;
    rbtint.Enabled       := True;
    rbtdec.Enabled       := True;
  end;
end;



procedure TfrmIAEUnidade.btnIncClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Incluir unidades').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    exit;
  end;
  sOpr := 'INU';
  bPreencheTela := False;
  TravaTela(False);

  edtCodUni.Text      := '';
  edtDescUni.Text     := '';
  edtSiglaUni.Text    := '';
  mmObsUni.Text       := '';
  rbtint.Checked      := true;
  rbtdec.Checked      := False;

  btnAcao.Glyph := frmMain.ImgInc16.Picture.Bitmap;
  btnInc.Enabled      := True;
  btnAlt.Enabled      := False;
  btnExc.Enabled      := False;
  btnAcao.Enabled     := True;
  btnCancel.Enabled   := True;
  btnAcao.Caption := ' &Incluir';
end;

procedure TfrmIAEUnidade.btnAltClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Alterar unidades').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    exit;
  end;
  sOpr := 'ACU';
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

procedure TfrmIAEUnidade.btnExcClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Excluir unidades').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    exit;
  end;
  sOpr := 'ECU';
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



procedure TfrmIAEUnidade.btnCancelClick(Sender: TObject);
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



Function TfrmIAEUnidade.ValidaCampos : boolean;
begin
  if Length(edtDescUni.Text) < 3 then begin
    result := False;
    ALERTMSG('Erro','O nome/descrição da unidade deve conter ao menos 3 caracteres.',false);
    edtDescUni.SetFocus;
    Exit;
  end;

  if Length(edtSiglaUni.Text) <> 3 then begin
    result := False;
    ALERTMSG('Erro','A sigla da unidade deve conter exatamente 3 caracteres.',false);
    edtSiglaUni.SetFocus;
    Exit;
  end;
end;



procedure TfrmIAEUnidade.btnAcaoClick(Sender: TObject);
begin
  if ((sOpr = 'INU') or (sOpr = 'ACU')) then begin
    if not ValidaCampos then
      exit
    else begin
      stpIAEUni.Close;
      stpIAEUni.Parameters.ParamByName('@sOpr').Value             := sOpr;
      stpIAEUni.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
      stpIAEUni.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;

      if sOpr = 'INU' then
        stpIAEUni.Parameters.ParamByName('@id_Codigo_UnP').Value    := Null
      else
        stpIAEUni.Parameters.ParamByName('@id_Codigo_UnP').Value    := StrToInt(edtCodUni.Text);

      stpIAEUni.Parameters.ParamByName('@ds_Descricao_UnP').Value := edtDescUni.Text;
      stpIAEUni.Parameters.ParamByName('@ds_Sigla_UnP').Value     := edtSiglaUni.Text;

      if rbtint.Checked then begin
        stpIAEUni.Parameters.ParamByName('@fl_VLInteiro_UnP').Value := True;
        stpIAEUni.Parameters.ParamByName('@fl_VLDecimal_UnP').Value := False;
      end;

      if rbtDec.Checked then begin
        stpIAEUni.Parameters.ParamByName('@fl_VLInteiro_UnP').Value := False;
        stpIAEUni.Parameters.ParamByName('@fl_VLDecimal_UnP').Value := True;
      end;

      stpIAEUni.Parameters.ParamByName('@ds_Obs_UnP').Value       := mmObsUni.Text;
      stpIAEUni.Parameters.ParamByName('@id_Codigo_Usu').Value    := frmMain.iUsu;
      stpIAEUni.ExecProc;
    end;
    btnCancelClick(Self);
    stpPsqUni.Close;
    stpPsqUni.Open;
  end;

  if sOpr = 'ECU' then begin

    stpIAEUni.Close;
    stpIAEUni.Parameters.ParamByName('@sOpr').Value             := 'VEU';
    stpIAEUni.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
    stpIAEUni.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;
    stpIAEUni.Parameters.ParamByName('@id_Codigo_UnP').Value    := StrToInt(edtCodUni.Text);
    stpIAEUni.Parameters.ParamByName('@ds_Descricao_UnP').Value := Null;
    stpIAEUni.Parameters.ParamByName('@ds_Sigla_UnP').Value     := Null;
    stpIAEUni.Parameters.ParamByName('@fl_VLInteiro_UnP').Value := Null;
    stpIAEUni.Parameters.ParamByName('@fl_VLDecimal_UnP').Value := Null;
    stpIAEUni.Parameters.ParamByName('@ds_Obs_UnP').Value       := Null;
    stpIAEUni.Parameters.ParamByName('@id_Codigo_Usu').Value    := frmMain.iUsu;
    stpIAEUni.Open;

    if stpIAEUni.Fields.FieldByName('Valida').AsInteger > 0 then begin
      ALERTMSG('Erro','Existe(m) ' + stpIAEUni.Fields.FieldByName('Valida').AsString + ' produto(s) que no momento está(ão) usando a Unidade de Produto que você deseja excluir. Antes de excluir é necessário alterar/excluir o(s) cadastro(s) de produto(s) que utiliza(m) essa unidade.',False);
      Exit;
    end;

    if not PopLogin('É necessário digitar seu usuário e senha para EXCLUIR cadastros do sistema.') then
      exit;

    stpIAEUni.Close;
    stpIAEUni.Parameters.ParamByName('@sOpr').Value             := sOpr;
    stpIAEUni.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
    stpIAEUni.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;
    stpIAEUni.Parameters.ParamByName('@id_Codigo_UnP').Value    := StrToInt(edtCodUni.Text);
    stpIAEUni.Parameters.ParamByName('@ds_Descricao_UnP').Value := Null;
    stpIAEUni.Parameters.ParamByName('@ds_Sigla_UnP').Value     := Null;
    stpIAEUni.Parameters.ParamByName('@fl_VLInteiro_UnP').Value := Null;
    stpIAEUni.Parameters.ParamByName('@fl_VLDecimal_UnP').Value := Null;
    stpIAEUni.Parameters.ParamByName('@ds_Obs_UnP').Value       := Null;
    stpIAEUni.Parameters.ParamByName('@id_Codigo_Usu').Value    := frmMain.iUsu;
    stpIAEUni.ExecProc;
    btnCancelClick(Self);
    stpPsqUni.Close;
    stpPsqUni.Open;
  end;
end;

procedure TfrmIAEUnidade.grdPsqUniDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
begin
  if grdPsqUni.DataSource = dtsPsqUni then begin
    if not odd(stpPsqUni.RecNo) then begin
      if not (gdSelected in State) then begin
        grdPsqUni.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdPsqUni.Canvas.FillRect(Rect);
        grdPsqUni.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;

end;

procedure TfrmIAEUnidade.rbtIntClick(Sender: TObject);
begin
  rbtDec.Checked := Not(rbtInt.Checked);
end;

procedure TfrmIAEUnidade.rbtDecClick(Sender: TObject);
begin
  rbtInt.Checked := not(rbtDec.Checked);
end;

end.
