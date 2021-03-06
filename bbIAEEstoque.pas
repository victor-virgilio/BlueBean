unit bbIAEEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, DB, ADODB, Grids, DBGrids, Buttons, ExtCtrls,
  DBCtrls;

type
  TfrmIAEEstoque = class(TForm)
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
    grdPsqEstoque: TDBGrid;
    btnCancel: TBitBtn;
    stpIAEEstoque: TADOStoredProc;
    dtsPsqEstoque: TDataSource;
    stpPsqEstoque: TADOStoredProc;
    pop1: TPopupMenu;
    PopIncPes: TMenuItem;
    PopAltPes: TMenuItem;
    PopExcPes: TMenuItem;
    chbPadraoCompra: TCheckBox;
    N1: TMenuItem;
    chbPadraoVenda: TCheckBox;
    DBCheckBox1: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stpPsqEstoqueAfterScroll(DataSet: TDataSet);
    procedure btnIncClick(Sender: TObject);
    procedure btnAltClick(Sender: TObject);
    procedure btnExcClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAcaoClick(Sender: TObject);
    procedure grdPsqEstoqueDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
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
  frmIAEEstoque: TfrmIAEEstoque;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, Login_Form, LoginMsg_Form,
  SICK013;

{$R *.dfm}

procedure TfrmIAEEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmIAEEstoque.FormDestroy(Sender: TObject);
begin
  frmIAEEstoque := Nil;
end;



procedure TfrmIAEEstoque.FormShow(Sender: TObject);
begin
  stpPsqEstoque.Close;
  stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Est').Value := Null;
  stpPsqEstoque.Open;

  TravaTela(True);
  bPreencheTela := True;
  PreencheTela;
end;



procedure TfrmIAEEstoque.stpPsqEstoqueAfterScroll(DataSet: TDataSet);
begin
  lblNumReg.Caption := inttostr(stpPsqEstoque.RecordCount);
  label6.Left := lblNumReg.Left - label6.width - 4;
  PreencheTela;
end;



Procedure TfrmIAEEstoque.PreencheTela;
begin
  if bPreencheTela then begin
    edtCod.Text             := stpPsqEstoque.Fields.FieldByName('C?d').AsString;
    edtDesc.Text            := stpPsqEstoque.Fields.FieldByName('Descri??o').AsString;
    chbPadraoCompra.Checked := stpPsqEstoque.Fields.FieldByName('P. Compra').AsBoolean;
    chbPadraoVenda.Checked  := stpPsqEstoque.Fields.FieldByName('P. Venda').AsBoolean;
    mmObs.Text              := stpPsqEstoque.Fields.FieldByName('ds_Obs_Est').AsString;
  end;
end;



Procedure TfrmIAEEstoque.TravaTela(bTrava:boolean);
begin
  if bTrava then begin
    edtDesc.Color  := $00FFE6CE;
    mmObs.Color    := $00FFE6CE;

    edtDesc.ReadOnly  := True;
    chbPadraoCompra.Enabled := False;
    chbPadraoVenda.Enabled  := False;
    mmObs.ReadOnly    := True;
    btnAcao.Enabled   := False;

    btnAcao.Caption   := '';
  end else begin
    edtDesc.Color  := clWhite;
    mmObs.Color    := clWhite;

    edtDesc.ReadOnly  := False;
    chbPadraoCompra.Enabled := True;
    chbPadraoVenda.Enabled  := True;
    mmObs.ReadOnly    := False;
    btnAcao.Enabled   := True;
  end;
end;



procedure TfrmIAEEstoque.btnIncClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Incluir estoques').AsBoolean) then begin
    ALERTMSG('Erro de Permiss?o','O seu usu?rio n?o possui permiss?o para acessar esse m?dulo do sistema.',false);
    exit;
  end;
  sOpr := 'INE';
  bPreencheTela := False;
  TravaTela(False);

  edtCod.Text  := '';
  edtDesc.Text := '';
  mmObs.Text   := '';
  chbPadraoCompra.Checked := False;
  chbPadraoVenda.Checked  := False;

  btnAcao.Glyph := frmMain.ImgInc16.Picture.Bitmap;
  btnInc.Enabled    := True;
  btnAlt.Enabled    := False;
  btnExc.Enabled    := False;
  btnAcao.Enabled   := True;
  btnCancel.Enabled := True;
  btnAcao.Caption := ' &Incluir';
end;

procedure TfrmIAEEstoque.btnAltClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Alterar estoques').AsBoolean) then begin
    ALERTMSG('Erro de Permiss?o','O seu usu?rio n?o possui permiss?o para acessar esse m?dulo do sistema.',false);
    exit;
  end;
  sOpr := 'ACE';
  bPreencheTela := False;
  TravaTela(False);

  btnAcao.Glyph := frmMain.ImgAlt16.Picture.Bitmap;
  btnInc.Enabled      := False;
  btnAlt.Enabled      := True;
  btnExc.Enabled      := False;
  btnAcao.Enabled     := True;
  btnCancel.Enabled   := True;
  btnAcao.Caption := ' &Alterar';

  if chbPadraoCompra.Checked then
    chbPadraoCompra.Enabled := False;

  if chbPadraoVenda.Checked then
    chbPadraoVenda.Enabled := False;
end;

procedure TfrmIAEEstoque.btnExcClick(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Excluir estoques').AsBoolean) then begin
    ALERTMSG('Erro de Permiss?o','O seu usu?rio n?o possui permiss?o para acessar esse m?dulo do sistema.',false);
    exit;
  end;
  sOpr := 'ECE';
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



procedure TfrmIAEEstoque.btnCancelClick(Sender: TObject);
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



Function TfrmIAEEstoque.ValidaCampos : boolean;
begin
  if Length(edtDesc.Text) < 3 then begin
    result := False;
    ALERTMSG('Erro','O nome/descri??o do estoque deve conter ao menos 3 caracteres.',false);
    edtDesc.SetFocus;
    Exit;
  end;
  result := true;
end;




procedure TfrmIAEEstoque.btnAcaoClick(Sender: TObject);
begin
  if ((sOpr = 'INE') or (sOpr = 'ACE')) then begin
    if not ValidaCampos then
      exit
    else begin
      stpIAEEstoque.Close;
      stpIAEEstoque.Parameters.ParamByName('@sOpr').Value             := sOpr;
      stpIAEEstoque.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
      stpIAEEstoque.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;

      if sOpr = 'INE' then
        stpIAEEstoque.Parameters.ParamByName('@id_Codigo_Est').Value     := Null
      else
        stpIAEEstoque.Parameters.ParamByName('@id_Codigo_Est').Value     := StrToInt(edtCod.Text);

      stpIAEEstoque.Parameters.ParamByName('@ds_Descricao_Est').Value    := edtDesc.Text;
      stpIAEEstoque.Parameters.ParamByName('@fl_PadraoCompra_Est').Value := chbPadraoCompra.Checked;
      stpIAEEstoque.Parameters.ParamByName('@fl_PadraoVenda_Est').Value  := chbPadraoVenda.Checked;
      stpIAEEstoque.Parameters.ParamByName('@ds_Obs_Est').Value          := mmObs.Text;
      stpIAEEstoque.Parameters.ParamByName('@id_Codigo_Usu').Value       := frmMain.iUsu;
      stpIAEEstoque.ExecProc;
    end;
    btnCancelClick(Self);
    stpPsqEstoque.Close;
    stpPsqEstoque.Open;
  end;

  if sOpr = 'ECE' then begin

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
      ALERTMSG('Erro','Existe(m) ' + stpIAEDepto.Fields.FieldByName('Valida').AsString + ' produto(s) que no momento est?(?o) usando o departamento que voc? deseja excluir. Antes de excluir ? necess?rio alterar/excluir o(s) cadastro(s) de produto(s) que utiliza(m) esse departamento.',False);
      Exit;
    end;  }

    if not PopLogin('? necess?rio digitar seu usu?rio e senha para EXCLUIR cadastros do sistema.') then
      exit;

    stpIAEEstoque.Close;
    stpIAEEstoque.Parameters.ParamByName('@sOpr').Value                := sOpr;
    stpIAEEstoque.Parameters.ParamByName('@id_Codigo_Org').Value       := frmMain.iOrg;
    stpIAEEstoque.Parameters.ParamByName('@id_Codigo_Fil').Value       := frmMain.iFil;
    stpIAEEstoque.Parameters.ParamByName('@id_Codigo_Est').Value       := StrToInt(edtCod.Text);
    stpIAEEstoque.Parameters.ParamByName('@ds_Descricao_Est').Value    := Null;
    stpIAEEstoque.Parameters.ParamByName('@fl_PadraoCompra_Est').Value := Null;
    stpIAEEstoque.Parameters.ParamByName('@fl_PadraoVenda_Est').Value  := Null;
    stpIAEEstoque.Parameters.ParamByName('@ds_Obs_Est').Value          := Null;
    stpIAEEstoque.Parameters.ParamByName('@id_Codigo_Usu').Value       := frmMain.iUsu;
    stpIAEEstoque.ExecProc;
    btnCancelClick(Self);
    stpPsqEstoque.Close;
    stpPsqEstoque.Open;
  end;
end;

procedure TfrmIAEEstoque.grdPsqEstoqueDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
Check: Integer;
begin
  if grdPsqEstoque.DataSource = dtsPsqEstoque then begin
    if not odd(stpPsqEstoque.RecNo) then begin
      if not (gdSelected in State) then begin
        grdPsqEstoque.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdPsqEstoque.Canvas.FillRect(Rect);
        grdPsqEstoque.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;

  if Column.FieldName = 'P. Compra' then begin
    grdPsqEstoque.Canvas.FillRect(Rect);
    Check := 0;

    if stpPsqEstoque.FieldByName('P. Compra').AsBoolean then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R:=Rect;
    InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
    DrawFrameControl(grdPsqEstoque.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

  if Column.FieldName = 'P. Venda' then begin
    grdPsqEstoque.Canvas.FillRect(Rect);
    Check := 0;

    if stpPsqEstoque.FieldByName('P. Venda').AsBoolean then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R:=Rect;
    InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
    DrawFrameControl(grdPsqEstoque.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

end.
