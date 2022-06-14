unit BBIAEDepartamento_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ImgList, StdCtrls, Buttons, ExtCtrls, DB, ADODB,
  Menus;

type
  TfrmIAEDepto = class(TForm)
    Label1: TLabel;
    edtCodDep: TEdit;
    edtDescDep: TEdit;
    Label2: TLabel;
    edtSiglaDep: TEdit;
    Label3: TLabel;
    Label10: TLabel;
    cbbGenDep: TComboBox;
    Shape3: TShape;
    mmObsDep: TMemo;
    Label4: TLabel;
    Label6: TLabel;
    lblNumReg: TLabel;
    btnInc: TBitBtn;
    btnAlt: TBitBtn;
    btnExc: TBitBtn;
    btnAcao: TBitBtn;
    grdPsqDepto: TDBGrid;
    stpIAEDepto: TADOStoredProc;
    dtsPsqDepto: TDataSource;
    stpPsqDepto: TADOStoredProc;
    Label5: TLabel;
    Shape2: TShape;
    Shape4: TShape;
    pop1: TPopupMenu;
    PopIncPes: TMenuItem;
    PopAltPes: TMenuItem;
    PopExcPes: TMenuItem;
    btnCancel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stpPsqDeptoAfterScroll(DataSet: TDataSet);
    procedure btnIncClick(Sender: TObject);
    procedure btnAltClick(Sender: TObject);
    procedure btnExcClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAcaoClick(Sender: TObject);
    procedure grdPsqDeptoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
  frmIAEDepto: TfrmIAEDepto;

implementation

uses Alert_Form, AlertMsg_Form, BBIAEProduto_Form, BBMain_Form,
  BBProduto_Form, Login_Form, LoginMsg_Form, SICK013;

{$R *.dfm}

procedure TfrmIAEDepto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmIAEDepto.FormDestroy(Sender: TObject);
begin
  frmIAEDepto := Nil;
end;



procedure TfrmIAEDepto.FormShow(Sender: TObject);
begin
  stpPsqDepto.Close;
  stpPsqDepto.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpPsqDepto.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpPsqDepto.Parameters.ParamByName('@id_Codigo_Dep').Value := Null;
  stpPsqDepto.Open;

  TravaTela(True);
  bPreencheTela := True;
  PreencheTela;
end;



procedure TfrmIAEDepto.stpPsqDeptoAfterScroll(DataSet: TDataSet);
begin
  lblNumReg.Caption := inttostr(stpPsqDepto.RecordCount);
  label6.Left := lblNumReg.Left - label6.width - 4;
  PreencheTela;
end;



Procedure TfrmIAEDepto.PreencheTela;
begin
  if bPreencheTela then begin
    edtCodDep.Text   := stpPsqDepto.Fields.FieldByName('id_Codigo_Dep').AsString;
    edtDescDep.Text  := stpPsqDepto.Fields.FieldByName('ds_Descricao_Dep').AsString;
    edtSiglaDep.Text := stpPsqDepto.Fields.FieldByName('ds_Sigla_Dep').AsString;
    mmObsDep.Text    := stpPsqDepto.Fields.FieldByName('ds_Obs_Dep').AsString;

    if stpPsqDepto.RecordCount > 0 then begin
      cbbGenDep.ItemIndex := 0;
      while not(Copy(cbbGenDep.Text,1,1) = stpPsqDepto.Fields.FieldByName('cd_Genero_Dep').AsString) do
        cbbGenDep.ItemIndex := cbbGenDep.ItemIndex + 1;
    end;
  end;
end;



Procedure TfrmIAEDepto.TravaTela(bTrava:boolean);
begin
  if bTrava then begin
    edtDescDep.Color  := $00FFE6CE;
    edtSiglaDep.Color := $00FFE6CE;
    cbbGenDep.Color   := $00FFE6CE;
    mmObsDep.Color    := $00FFE6CE;
    btnAcao.Caption   := '';

    edtDescDep.ReadOnly  := True;
    edtSiglaDep.ReadOnly := True;
    cbbGenDep.Enabled    := False;
    mmObsDep.ReadOnly    := True;
    btnAcao.Enabled      := False;
  end else begin
    edtDescDep.Color  := clWhite;
    edtSiglaDep.Color := clWhite;
    cbbGenDep.Color   := clWhite;
    mmObsDep.Color    := clWhite;

    edtDescDep.ReadOnly  := False;
    edtSiglaDep.ReadOnly := False;
    cbbGenDep.Enabled    := True;
    mmObsDep.ReadOnly    := False;
    btnAcao.Enabled      := True;
  end;
end;



procedure TfrmIAEDepto.btnIncClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Incluir departamentos').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    exit;
  end;
  sOpr := 'IND';
  bPreencheTela := False;
  TravaTela(False);

  edtCodDep.Text      := '';
  edtDescDep.Text     := '';
  edtSiglaDep.Text    := '';
  cbbGenDep.ItemIndex := 0;
  mmObsDep.Text       := '';

  btnAcao.Glyph := frmMain.ImgInc16.Picture.Bitmap;
  btnInc.Enabled      := True;
  btnAlt.Enabled      := False;
  btnExc.Enabled      := False;
  btnAcao.Enabled     := True;
  btnCancel.Enabled   := True;
  btnAcao.Caption := ' &Incluir';
end;

procedure TfrmIAEDepto.btnAltClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Alterar departamentos').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    exit;
  end;
  sOpr := 'ACD';
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

procedure TfrmIAEDepto.btnExcClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Excluir departamentos').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    exit;
  end;
  sOpr := 'ECD';
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



procedure TfrmIAEDepto.btnCancelClick(Sender: TObject);
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



Function TfrmIAEDepto.ValidaCampos : boolean;
begin
  if Length(edtDescDep.Text) < 3 then begin
    result := False;
    ALERTMSG('Erro','O nome/descrição do departamento deve conter ao menos 3 caracteres.',false);
    edtDescDep.SetFocus;
    Exit;
  end;

  if Length(edtSiglaDep.Text) <> 3 then begin
    result := False;
    ALERTMSG('Erro','A sigla do departamento deve conter exatamente 3 caracteres.',false);
    edtSiglaDep.SetFocus;
    Exit;
  end;

  if cbbGenDep.ItemIndex = 0 then begin
    result := False;
    ALERTMSG('Erro','Selecione o gênero do departamento.',false);
    cbbGenDep.SetFocus;
    Exit;
  end;
end;



procedure TfrmIAEDepto.btnAcaoClick(Sender: TObject);
begin
  if ((sOpr = 'IND') or (sOpr = 'ACD')) then begin
    if not ValidaCampos then
      exit
    else begin
      stpIAEDepto.Close;
      stpIAEDepto.Parameters.ParamByName('@sOpr').Value             := sOpr;
      stpIAEDepto.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
      stpIAEDepto.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;

      if sOpr = 'IND' then
        stpIAEDepto.Parameters.ParamByName('@id_Codigo_Dep').Value    := Null
      else
        stpIAEDepto.Parameters.ParamByName('@id_Codigo_Dep').Value    := StrToInt(edtCodDep.Text);

      stpIAEDepto.Parameters.ParamByName('@ds_Descricao_Dep').Value := edtDescDep.Text;
      stpIAEDepto.Parameters.ParamByName('@ds_Sigla_Dep').Value     := edtSiglaDep.Text;
      stpIAEDepto.Parameters.ParamByName('@cd_Genero_Dep').Value    := Copy(cbbGenDep.Text,1,1);
      stpIAEDepto.Parameters.ParamByName('@ds_Obs_Dep').Value       := mmObsDep.Text;
      stpIAEDepto.Parameters.ParamByName('@id_Codigo_Usu').Value    := frmMain.iUsu;
      stpIAEDepto.ExecProc;
    end;
    btnCancelClick(Self);
    stpPsqDepto.Close;
    stpPsqDepto.Open;
  end;

  if sOpr = 'ECD' then begin

    stpIAEDepto.Close;
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
    end;

    if not PopLogin('É necessário digitar seu usuário e senha para EXCLUIR cadastros do sistema.') then
      exit;

    stpIAEDepto.Close;
    stpIAEDepto.Parameters.ParamByName('@sOpr').Value             := sOpr;
    stpIAEDepto.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
    stpIAEDepto.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;
    stpIAEDepto.Parameters.ParamByName('@id_Codigo_Dep').Value    := StrToInt(edtCodDep.Text);
    stpIAEDepto.Parameters.ParamByName('@ds_Descricao_Dep').Value := Null;
    stpIAEDepto.Parameters.ParamByName('@ds_Sigla_Dep').Value     := Null;
    stpIAEDepto.Parameters.ParamByName('@cd_Genero_Dep').Value    := Null;
    stpIAEDepto.Parameters.ParamByName('@ds_Obs_Dep').Value       := Null;
    stpIAEDepto.Parameters.ParamByName('@id_Codigo_Usu').Value    := frmMain.iUsu;
    stpIAEDepto.ExecProc;
    btnCancelClick(Self);
    stpPsqDepto.Close;
    stpPsqDepto.Open;
  end;


end;



procedure TfrmIAEDepto.grdPsqDeptoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
begin
  if grdPsqDepto.DataSource = dtsPsqDepto then begin
    if not odd(stpPsqDepto.RecNo) then begin
      if not (gdSelected in State) then begin
        grdPsqDepto.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdPsqDepto.Canvas.FillRect(Rect);
        grdPsqDepto.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;
end;

end.
