unit BBIAEUsuario_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  Mask, DBClient;

type
  TfrmIAEUsuario = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Shape3: TShape;
    Label6: TLabel;
    lblNumReg: TLabel;
    Label5: TLabel;
    Shape2: TShape;
    Shape4: TShape;
    edtCodUsu: TEdit;
    edtLoginUsu: TEdit;
    btnInc: TBitBtn;
    btnAlt: TBitBtn;
    btnExc: TBitBtn;
    btnAcao: TBitBtn;
    grdPsqUsuario: TDBGrid;
    btnCancel: TBitBtn;
    stpIAEUsuario: TADOStoredProc;
    dtsPsqUsuario: TDataSource;
    stpPsqUsuario: TADOStoredProc;
    pop1: TPopupMenu;
    PopIncPes: TMenuItem;
    PopAltPes: TMenuItem;
    PopExcPes: TMenuItem;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtLembrete: TEdit;
    chbMaster: TCheckBox;
    Label8: TLabel;
    edtPessoa: TEdit;
    btnPessoa: TBitBtn;
    Shape1: TShape;
    Shape5: TShape;
    edtSenha1: TMaskEdit;
    edtSenha2: TMaskEdit;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    stpPsqUsuarioCd: TIntegerField;
    stpPsqUsuarioUsurio: TStringField;
    stpPsqUsuarioMaster: TBooleanField;
    stpPsqUsuariods_Senha_Usu: TStringField;
    stpPsqUsuariods_Lembrete_Usu: TStringField;
    stpPsqUsuarioPessoa: TStringField;
    stpIAEUsuarioid_Codigo_Usu: TIntegerField;
    stpIAEUsuariods_Login_Usu: TStringField;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    grdPermissao: TDBGrid;
    Label9: TLabel;
    cdsPermissao: TClientDataSet;
    cdsPermissaoDescricao: TStringField;
    cdsPermissaoPermite: TBooleanField;
    dtsPermissao: TDataSource;
    stpPermissao: TADOStoredProc;
    btnPermissao: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure grdPsqUsuarioDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure stpPsqUsuarioAfterScroll(DataSet: TDataSet);
    procedure btnIncClick(Sender: TObject);
    procedure btnAltClick(Sender: TObject);
    procedure btnExcClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAcaoClick(Sender: TObject);
    procedure btnPessoaClick(Sender: TObject);
    procedure grdPermissaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdPermissaoCellClick(Column: TColumn);
    procedure btnPermissaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    sOpr : String;
    bPreencheTela : boolean;
    bReiniciaTela: boolean;

    Procedure PreencheTela;
    Procedure TravaTela(bTrava:boolean);
    Function  ValidaCampos:Boolean;
    Procedure PreencherPermissoes;
  end;

var
  frmIAEUsuario: TfrmIAEUsuario;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, BBPessoa_Form, Login_Form,
  LoginMsg_Form, MsgMain, SICK013;

{$R *.dfm}

procedure TfrmIAEUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmIAEUsuario.FormDestroy(Sender: TObject);
begin
  frmIAEUsuario := NIl;
end;

Procedure TfrmIAEUsuario.PreencherPermissoes;
Var iCount : integer;
begin
  stpPermissao.Close;
  stpPermissao.Parameters.ParamByName('@sOpr').Value                 := 'SPR';
  stpPermissao.Parameters.ParamByName('@id_Codigo_Org').Value        := frmMain.iOrg;
  stpPermissao.Parameters.ParamByName('@id_Codigo_Fil').Value        := frmMain.iFil;
  stpPermissao.Parameters.ParamByName('@id_Codigo_Usu').Value        := stpPsqUsuario.Fields.FieldByName('Cód').AsInteger;
  stpPermissao.Parameters.ParamByName('@fl_IncProduto_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_AltProduto_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_ExcProduto_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_IncDepto_UPr').Value      := Null;
  stpPermissao.Parameters.ParamByName('@fl_AltDepto_UPr').Value      := Null;
  stpPermissao.Parameters.ParamByName('@fl_ExcDepto_UPr').Value      := Null;
  stpPermissao.Parameters.ParamByName('@fl_IncUnid_UPr').Value       := Null;
  stpPermissao.Parameters.ParamByName('@fl_AltUnid_UPr').Value       := Null;
  stpPermissao.Parameters.ParamByName('@fl_ExcUnid_UPr').Value       := Null;
  stpPermissao.Parameters.ParamByName('@fl_IncPessoa_UPr').Value     := Null;
  stpPermissao.Parameters.ParamByName('@fl_AltPessoa_UPr').Value     := Null;
  stpPermissao.Parameters.ParamByName('@fl_ExcPessoa_UPr').Value     := Null;
  stpPermissao.Parameters.ParamByName('@fl_IncEndereco_UPr').Value   := Null;
  stpPermissao.Parameters.ParamByName('@fl_AltEndereco_UPr').Value   := Null;
  stpPermissao.Parameters.ParamByName('@fl_ExcEndereco_UPr').Value   := Null;
  stpPermissao.Parameters.ParamByName('@fl_IncContato_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_AltContato_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_ExcContato_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_IncEstqoue_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_AltEstoque_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_ExcEstoque_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_IncUsuario_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_AltUsuario_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_ExcUsuario_UPr').Value    := Null;
  stpPermissao.Parameters.ParamByName('@fl_Venda_UPr').Value         := Null;
  stpPermissao.Parameters.ParamByName('@fl_Compra_UPr').Value        := Null;
  stpPermissao.Parameters.ParamByName('@fl_IncFormaPagto_UPr').Value := Null;
  stpPermissao.Parameters.ParamByName('@fl_AltFormaPagto_UPr').Value := Null;
  stpPermissao.Parameters.ParamByName('@fl_ExcFormaPagto_UPr').Value := Null;
  stpPermissao.Parameters.ParamByName('@fl_Relatorio_UPr').Value     := Null;
  stpPermissao.Parameters.ParamByName('@fl_Estoque_UPr').Value       := Null;
  stpPermissao.Parameters.ParamByName('@fl_Pessoa_UPr').Value        := Null;
  stpPermissao.Parameters.ParamByName('@fl_Produto_UPr').Value       := Null;
  stpPermissao.Parameters.ParamByName('@fl_Usuario_UPr').Value       := Null;
  stpPermissao.Parameters.ParamByName('@fl_VisuValor_UPr').Value     := Null;
  stpPermissao.Parameters.ParamByName('@fl_RotinaCaixa_UPr').Value   := Null;
  stpPermissao.Parameters.ParamByName('@id_Alteracao_Usu').Value     := Null;
  stpPermissao.Open;
  stpPermissao.FieldList.Update;

  iCount := 3;

  cdsPermissao.Close;
  cdsPermissao.CreateDataSet;
  While iCount < (stpPermissao.FieldCount) do begin
    cdsPermissao.Append;
    cdsPermissao.FieldByName('Descricao').Value := stpPermissao.Fields[iCount].FieldName;
    cdsPermissao.FieldByName('Permite').Value   := stpPermissao.Fields[iCount].AsBoolean;
    cdsPermissao.Post;
    Inc(iCount);
  end;

  cdsPermissao.Active := True;
  cdsPermissao.First;
end;



procedure TfrmIAEUsuario.grdPsqUsuarioDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
Check: Integer;
begin
  if grdPsqUsuario.DataSource = dtsPsqUsuario then begin
    if not odd(stpPsqUsuario.RecNo) then begin
      if not (gdSelected in State) then begin
        grdPsqUsuario.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdPsqUsuario.Canvas.FillRect(Rect);
        grdPsqUsuario.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;

  if Column.FieldName = 'Master' then begin
    grdPsqUsuario.Canvas.FillRect(Rect);
    Check := 0;

    if stpPsqUsuario.FieldByName('Master').AsBoolean then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R:=Rect;
    InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
    DrawFrameControl(grdPsqUsuario.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;



procedure TfrmIAEUsuario.FormShow(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Cadastro de usuário').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    PostMessage(frmIAEUsuario.Handle, WM_CLOSE, 0, 0)
  end;

  if bReiniciaTela then begin
    stpPsqUsuario.Close;
    stpPsqUsuario.Parameters.ParamByName('@id_Codigo_Usu').Value := Null;
    stpPsqUsuario.Open;

    TravaTela(True);
    bPreencheTela := True;
    PreencheTela;
    bReiniciaTela := True;
  end;
end;



procedure TfrmIAEUsuario.stpPsqUsuarioAfterScroll(DataSet: TDataSet);
begin
  lblNumReg.Caption := inttostr(stpPsqUsuario.RecordCount);
  label6.Left := lblNumReg.Left - label6.width - 4;
  PreencheTela;
  PreencherPermissoes;
end;



Procedure TfrmIAEUsuario.PreencheTela;
begin
  if bPreencheTela then begin
    edtCodUsu.Text    := stpPsqUsuario.Fields.FieldByName('Cód').AsString;
    edtLoginUsu.Text  := stpPsqUsuario.Fields.FieldByName('Usuário').AsString;
    edtSenha1.Text    := stpPsqUsuario.Fields.FieldByName('ds_Senha_Usu').AsString;
    edtSenha2.Text    := stpPsqUsuario.Fields.FieldByName('ds_Senha_Usu').AsString;
    edtLembrete.Text  := stpPsqUsuario.Fields.FieldByName('ds_Lembrete_usu').AsString;
    edtPessoa.Text    := stpPsqUsuario.Fields.FieldByName('Pessoa').AsString;
    chbMaster.Checked := stpPsqUsuario.Fields.FieldByName('Master').AsBoolean;
  end;
end;



Procedure TfrmIAEUsuario.TravaTela(bTrava:boolean);
begin
  if bTrava then begin
    edtLoginUsu.Color := $00FFE6CE;
    edtSenha1.Color   := $00FFE6CE;
    edtSenha2.Color   := $00FFE6CE;
    edtLembrete.Color := $00FFE6CE;
    btnAcao.Caption   := '';

    edtLoginUsu.ReadOnly := True;
    edtSenha1.ReadOnly   := True;
    edtSenha2.ReadOnly   := True;
    edtLembrete.ReadOnly := True;

    chbMaster.Enabled    := False;
    btnPessoa.Enabled    := False;
    btnAcao.Enabled      := False;
    grdPermissao.Enabled := False;
    btnPermissao.Enabled := False;
  end else begin
    edtLoginUsu.Color := clWhite;
    edtSenha1.Color   := clWhite;
    edtSenha2.Color   := clWhite;
    edtLembrete.Color := clWhite;
    btnAcao.Caption   := '';

    edtLoginUsu.ReadOnly := False;
    edtSenha1.ReadOnly   := False;
    edtSenha2.ReadOnly   := False;
    edtLembrete.ReadOnly := False;

    chbMaster.Enabled    := True;
    btnPessoa.Enabled    := True;
    btnAcao.Enabled      := True;
    grdPermissao.Enabled := True;
    btnPermissao.Enabled := True;
  end;
end;



procedure TfrmIAEUsuario.btnIncClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Incluir usuários').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    exit;
  end;
  sOpr := 'INU';
  bPreencheTela := False;
  TravaTela(False);

  edtCodUsu.Text    := '';
  edtLoginUsu.Text  := '';
  edtSenha1.Text    := '';
  edtSenha2.Text    := '';
  edtLembrete.Text  := '';
  edtPessoa.Text    := '';
  chbMaster.Checked := False;

  btnAcao.Glyph := frmMain.ImgInc16.Picture.Bitmap;
  btnInc.Enabled      := True;
  btnAlt.Enabled      := False;
  btnExc.Enabled      := False;
  btnAcao.Enabled     := True;
  btnCancel.Enabled   := True;
  btnAcao.Caption := ' &Incluir';
end;



procedure TfrmIAEUsuario.btnAltClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Alterar usuários').AsBoolean) then begin
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



procedure TfrmIAEUsuario.btnExcClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Excluir usuários').AsBoolean) then begin
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



procedure TfrmIAEUsuario.btnCancelClick(Sender: TObject);
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



Function TfrmIAEUsuario.ValidaCampos : boolean;
begin
  if Length(edtLoginUsu.Text) < 4 then begin
    result := False;
    ALERTMSG('Erro','O login deve ter ao menos 4 caracteres.',false);
    edtLoginUsu.SetFocus;
    Exit;
  end;

  if Length(edtSenha1.Text) < 6 then begin
    result := False;
    ALERTMSG('Erro','A senha deve ter ao menos 6 caracteres.',false);
    edtSenha1.SetFocus;
    Exit;
  end;

  if edtSenha1.Text <> edtSenha2.Text then begin
    result := False;
    ALERTMSG('Erro','A senha e a confirmação de senha devem ser iguais.',false);
    edtSenha1.text := '';
    edtSenha2.text := '';
    edtSenha1.SetFocus;
    Exit;
  end;
end;





procedure TfrmIAEUsuario.btnAcaoClick(Sender: TObject);
begin
  if ((sOpr = 'INU') or (sOpr = 'ACU')) then begin
    if not ValidaCampos then
      exit
    else begin
      stpIAEUsuario.Close;
      stpIAEUsuario.Parameters.ParamByName('@opr').Value             := 'VCU';
      stpIAEUsuario.Parameters.ParamByName('@id_Codigo_Usu').Value   := Null;
      stpIAEUsuario.Parameters.ParamByName('@ds_Login_Usu').Value    := edtLoginUsu.Text;
      stpIAEUsuario.Parameters.ParamByName('@ds_Senha_Usu').Value    := Null;
      stpIAEUsuario.Parameters.ParamByName('@ds_Lembrete_Usu').Value := Null;
      stpIAEUsuario.Parameters.ParamByName('@id_Pessoa_Org').Value   := Null;
      stpIAEUsuario.Parameters.ParamByName('@id_Pessoa_Fil').Value   := Null;
      stpIAEUsuario.Parameters.ParamByName('@id_Codigo_Pes').Value   := Null;
      stpIAEUsuario.Parameters.ParamByName('@fl_Master_Usu').Value   := Null;
      stpIAEUsuario.Open;

      if ((sOpr = 'INU') and (stpIAEUsuario.RecordCount > 0)) then begin
        ALERTMSG('Erro','O LOGIN digitado já existe no cadastro de usuários, digite um novo login.',false);
        edtLoginUsu.SetFocus;
        exit;
      end;

      if ((sOpr = 'ACU') and (stpIAEUsuario.FieldByName('id_Codigo_Usu').AsString <> edtCodUsu.Text)) then begin
        ALERTMSG('Erro','O LOGIN digitado já existe no cadastro de usuários, digite um novo login.',false);
        edtLoginUsu.SetFocus;
        exit;
      end;

      stpIAEUsuario.Close;
      stpIAEUsuario.Parameters.ParamByName('@opr').Value             := sOpr;
      if sOpr = 'INU' then
        stpIAEUsuario.Parameters.ParamByName('@id_Codigo_Usu').Value := Null
      else
        stpIAEUsuario.Parameters.ParamByName('@id_Codigo_Usu').Value := StrToInt(edtCodUsu.Text);

      stpIAEUsuario.Parameters.ParamByName('@ds_Login_Usu').Value    := edtLoginUsu.Text;
      stpIAEUsuario.Parameters.ParamByName('@ds_Senha_Usu').Value    := edtSenha1.Text;
      stpIAEUsuario.Parameters.ParamByName('@ds_Lembrete_Usu').Value := edtLembrete.Text;
      stpIAEUsuario.Parameters.ParamByName('@id_Pessoa_Org').Value   := frmMain.iOrg;
      stpIAEUsuario.Parameters.ParamByName('@id_Pessoa_Fil').Value   := frmMain.iFil;

      if edtPessoa.Text <> '' then
        stpIAEUsuario.Parameters.ParamByName('@id_Codigo_Pes').Value := StrToInt(Copy(edtPessoa.Text,1,pos(' -',edtPessoa.Text)-1))
      else
        stpIAEUsuario.Parameters.ParamByName('@id_Codigo_Pes').Value := Null;

      stpIAEUsuario.Parameters.ParamByName('@fl_Master_Usu').Value   := chbMaster.Checked;
      stpIAEUsuario.ExecProc;
    end;
    btnCancelClick(Self);
    stpPsqUsuario.Close;
    stpPsqUsuario.Open;
  end;

  if sOpr = 'ECU' then begin
    if not PopLogin('É necessário digitar seu usuário e senha para EXCLUIR cadastros do sistema.') then
      exit;

      stpIAEUsuario.Close;
      stpIAEUsuario.Parameters.ParamByName('@opr').Value             := sOpr;
      stpIAEUsuario.Parameters.ParamByName('@id_Codigo_Usu').Value   := StrToInt(edtCodUsu.Text);
      stpIAEUsuario.Parameters.ParamByName('@ds_Login_Usu').Value    := Null;
      stpIAEUsuario.Parameters.ParamByName('@ds_Senha_Usu').Value    := Null;
      stpIAEUsuario.Parameters.ParamByName('@ds_Lembrete_Usu').Value := Null;
      stpIAEUsuario.Parameters.ParamByName('@id_Pessoa_Org').Value   := Null;
      stpIAEUsuario.Parameters.ParamByName('@id_Pessoa_Fil').Value   := Null;
      stpIAEUsuario.Parameters.ParamByName('@id_Codigo_Pes').Value   := Null;
      stpIAEUsuario.Parameters.ParamByName('@fl_Master_Usu').Value   := Null;
      stpIAEUsuario.ExecProc;

    btnCancelClick(Self);
    stpPsqUsuario.Close;
    stpPsqUsuario.Open;
  end;
end;



procedure TfrmIAEUsuario.btnPessoaClick(Sender: TObject);
begin
  frmIAEUsuario.Visible := False;

  frmMain.iPessoa := 0;
  frmMain.sPessoa := '';

  if frmPessoa = Nil then
    frmPessoa := TfrmPessoa.Create(Self);

  frmPessoa.ShowModal;

  if frmMain.iPessoa <> 0 then begin
    edtPessoa.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;
  end else begin
    edtPessoa.Text := '';
  end;
  bReiniciaTela := False;
  frmIAEUsuario.Visible := True;
end;



procedure TfrmIAEUsuario.grdPermissaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
Check: Integer;
begin
  if Column.FieldName = 'Permite' then begin
    grdPermissao.Canvas.FillRect(Rect);
      Check := 0;

    if cdsPermissao.FieldByName('Permite').AsBoolean then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R:=Rect;
    InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
    DrawFrameControl(grdPermissao.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

end;



procedure TfrmIAEUsuario.grdPermissaoCellClick(Column: TColumn);
begin
  cdsPermissao.Edit;
  cdsPermissaoPermite.AsBoolean := not(cdsPermissaoPermite.AsBoolean); //muda para 1
  cdsPermissao.Post;
end;



procedure TfrmIAEUsuario.btnPermissaoClick(Sender: TObject);
begin
  stpPermissao.Close;
  stpPermissao.Parameters.ParamByName('@sOpr').Value                 := 'IPR';
  stpPermissao.Parameters.ParamByName('@id_Codigo_Org').Value        := frmMain.iOrg;
  stpPermissao.Parameters.ParamByName('@id_Codigo_Fil').Value        := frmMain.iFil;
  stpPermissao.Parameters.ParamByName('@id_Codigo_Usu').Value        := stpPsqUsuario.Fields.FieldByName('Cód').AsInteger;
  stpPermissao.Parameters.ParamByName('@id_Alteracao_Usu').Value     := frmMain.iUsu;

  cdsPermissao.First;
  while not cdsPermissao.Eof do begin
    stpPermissao.Parameters.Items[cdsPermissao.RecNo + 4].Value := cdsPermissao.Fields.FieldByName('Permite').AsBoolean;
    cdsPermissao.Next;
  end;

  stpPermissao.ExecProc;
  frmMain.stpPermissao.Close;
  frmMain.stpPermissao.Open;
end;



end.











