unit BBIAEProduto_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, Buttons, DB, ADODB, JPEG;

type
  TfrmIAEProduto = class(TForm)
    ImgInc: TImage;
    ImgAlt: TImage;
    ImgExc: TImage;
    edtCodPro: TEdit;
    cbbTipoPro: TComboBox;
    Label1: TLabel;
    Label11: TLabel;
    edtCodBarPro: TEdit;
    Label2: TLabel;
    cbbUniPro: TComboBox;
    Label3: TLabel;
    edtDescPro: TEdit;
    Label4: TLabel;
    edtPesoPro: TEdit;
    Label5: TLabel;
    edtCompPro: TEdit;
    lblImg: TLabel;
    edtLargPro: TEdit;
    Label7: TLabel;
    edtAltPro: TEdit;
    Label8: TLabel;
    ImgPro: TImage;
    Label9: TLabel;
    Shape1: TShape;
    cbbGenPro: TComboBox;
    Label10: TLabel;
    edtQtGarPro: TEdit;
    Label12: TLabel;
    edtQtEstPro: TEdit;
    Label13: TLabel;
    edtEstMinPro: TEdit;
    Label14: TLabel;
    edtVlComPro: TEdit;
    Label15: TLabel;
    edtVlVenPro: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    btnAcao: TBitBtn;
    imlBtn: TImageList;
    mmObsPro: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    stpPsqDep: TADOStoredProc;
    stpPsqUni: TADOStoredProc;
    OpnImg: TOpenDialog;
    stpIAEProduto: TADOStoredProc;
    stpFotoProduto: TADOStoredProc;
    Shape3: TShape;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure lblImgClick(Sender: TObject);
    procedure edtPesoProKeyPress(Sender: TObject; var Key: Char);
    procedure edtCompProKeyPress(Sender: TObject; var Key: Char);
    procedure edtLargProKeyPress(Sender: TObject; var Key: Char);
    procedure edtAltProKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtGarProKeyPress(Sender: TObject; var Key: Char);
    procedure edtEstMinProKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlComProKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlVenProKeyPress(Sender: TObject; var Key: Char);
    procedure cbbTipoProKeyPress(Sender: TObject; var Key: Char);
    procedure cbbUniProKeyPress(Sender: TObject; var Key: Char);
    procedure cbbGenProKeyPress(Sender: TObject; var Key: Char);
    procedure btnAcaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtPesoProExit(Sender: TObject);
    procedure edtCompProExit(Sender: TObject);
    procedure edtLargProExit(Sender: TObject);
    procedure edtAltProExit(Sender: TObject);
  private
    { Private declarations }
  public
    sOpr : String;
    bAlerta : boolean;

    Procedure BuscarDepartamentos;
    Procedure BuscarUnidades;
    Procedure PreencheCampos;
    Procedure ValidaCadastro;
  end;

var
  frmIAEProduto: TfrmIAEProduto;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, Login_Form, LoginMsg_Form,
  SICK013, BBProduto_Form, BBIAEDepartamento_Form, BBIAEUnidade_Form,
  bbIAEEstoque;

{$R *.dfm}

procedure TfrmIAEProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmIAEProduto.FormDestroy(Sender: TObject);
begin
  frmIAEProduto := Nil;
end;



Procedure TfrmIAEProduto.BuscarDepartamentos;
begin
  stpPsqDep.Close;
  stpPsqDep.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpPsqDep.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpPsqDep.Parameters.ParamByName('@id_Codigo_Dep').Value := Null;
  stpPsqDep.Open;

  cbbTipoPro.Items.Clear;
  cbbTipoPro.Items.Add('Selecione');
  stpPsqDep.First;

  While not stpPsqDep.Eof do begin
    cbbTipoPro.Items.Add(stpPsqDep.Fields.FieldByName('Depto').AsString);
    stpPsqDep.Next;
  end;

  cbbTipoPro.ItemIndex := 0;
end;



Procedure TfrmIAEProduto.BuscarUnidades;
begin
  stpPsqUni.Close;
  stpPsqUni.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpPsqUni.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpPsqUni.Parameters.ParamByName('@id_Codigo_UnP').Value := Null;
  stpPsqUni.Open;

  cbbUniPro.Items.Clear;
  cbbUniPro.Items.Add('Selecione');
  stpPsqUni.First;

  While not stpPsqUni.Eof do begin
    cbbUniPro.Items.Add(stpPsqUni.Fields.FieldByName('Unidade').AsString);
    stpPsqUni.Next;
  end;

  cbbUniPro.ItemIndex := 0;
end;



Procedure TfrmIAEProduto.PreencheCampos;
begin
  with frmProduto.stpPsqProduto do begin
    cbbTipoPro.ItemIndex := 0;
    cbbUniPro.ItemIndex  := 0;

    edtCodPro.Text    := Fields.FieldByName('C?d').AsString;
    edtCodBarPro.Text := Fields.FieldByName('ds_CodBarra_Pro').AsString;
    edtDescPro.Text   := Fields.FieldByName('Descri??o').AsString;
    edtPesoPro.Text   := Fields.FieldByName('ds_Peso_Pro').AsString;
    edtCompPro.Text   := Fields.FieldByName('ds_ComprimentoCm_Pro').AsString;
    edtLargPro.Text   := Fields.FieldByName('ds_LarguraCm_Pro').AsString;
    edtAltPro.Text    := Fields.FieldByName('ds_AlturaCm_Pro').AsString;
    edtQtGarPro.Text  := Fields.FieldByName('qt_DiasGarantia_Pro').AsString;
    edtEstMinPro.Text := Fields.FieldByName('qt_EstMinimo_Pro').AsString;
    edtVlComPro.Text  := FormatFloat('0.00',Fields.FieldByName('Vl. Compra').AsFloat);
    edtVlVenPro.Text  := FormatFloat('0.00',Fields.FieldByName('Vl. Venda').AsFloat);
    mmObsPro.Text     := Fields.FieldByName('ds_Obs_Pro').AsString;

    // Selecionar a foto do produto
    if Length(FieldByName('ds_Imagem_Pro').AsString) > 0 then
      ImgPro.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\PicPro\' + FieldByName('ds_Imagem_Pro').AsString)
    else
      ImgPro.Picture.LoadFromFile('picpro\FotoDefault.bmp');

    // Selecionar o departamento do produto
    while cbbTipoPro.ItemIndex <= cbbTipoPro.Items.Count do begin
      if Copy(cbbTipoPro.Text,1,(pos(' ',cbbTipoPro.Text)-1)) = FieldByName('Departamento').AsString then
        break
      else
        cbbTipoPro.ItemIndex := cbbTipoPro.ItemIndex + 1;
    end;

    // Selecionar a unidade do produto
    while cbbUniPro.ItemIndex <= cbbUniPro.Items.Count do begin
      if Copy(cbbUniPro.Text,1,(pos(' ',cbbUniPro.Text)-1)) = FieldByName('Unidade').AsString then
        break
      else
        cbbUniPro.ItemIndex := cbbUniPro.ItemIndex + 1;
    end;

    //Selecionar o g?nero do produto.
    While cbbGenPro.ItemIndex <= cbbGenPro.Items.Count do begin
      if Copy(cbbGenPro.Text,1,1) = FieldByName('cd_Genero_Pro').AsString then
        break
      else
        cbbGenPro.ItemIndex := cbbGenPro.ItemIndex + 1;
    end;
  end;
end;



Procedure TfrmIAEProduto.ValidaCadastro;
begin
  if cbbTipoPro.ItemIndex = 0 then begin
    ALERTMSG('Erro','Selecione um departamento para o cadastro do produto.',false);
    bAlerta := True;
    cbbTipoPro.SetFocus;
    exit;
  end;

  if cbbUniPro.ItemIndex = 0 then begin
    ALERTMSG('Erro','Selecione uma unidade de compra/venda para o cadastro do produto.',false);
    bAlerta := True;
    cbbUniPro.SetFocus;
    exit;
  end;

  if Length(edtDescPro.Text) < 4 then begin
    ALERTMSG('Erro','A descri??o do cadastro de produto deve conter ao m?nimo 4 caracteres.',false);
    bAlerta := True;
    edtDescPro.SetFocus;
    exit;
  end;

  if cbbGenPro.ItemIndex = 0 then begin
    ALERTMSG('Erro','Selecione o g?nero do produto a ser cadastrado.',false);
    bAlerta := True;
    cbbGenPro.SetFocus;
    exit;
  end;

  if length(edtQtGarPro.Text) <= 0 then begin
    ALERTMSG('Erro','O per?odo de garantia do produto deve ser informado. Caso o produto n?o tenha garantia, preencher o campo com zero.',false);
    bAlerta := True;
    edtQtGarPro.SetFocus;
    exit;
  end;

  if length(edtEstMinPro.Text) <= 0 then begin
    ALERTMSG('Erro','O estoque m?nimo do produto deve ser informado. Caso o produto n?o tenha controle de estoque m?nimo, preencher o campo com zero.',false);
    bAlerta := True;
    edtQtGarPro.SetFocus;
    exit;
  end;

  if length(edtVlComPro.Text) <= 0 then begin
    ALERTMSG('Erro','O valor de compra do produto deve ser informado.',false);
    bAlerta := True;
    edtVlComPro.SetFocus;
    exit;
  end;

  if StrToFloat(edtVlComPro.Text) <= 0 then begin
    ALERTMSG('Erro','O valor de compra do produto deve ser maior que zero.',false);
    bAlerta := True;
    edtVlComPro.SetFocus;
    exit;
  end;

  if length(edtVlVenPro.Text) <= 0 then begin
    ALERTMSG('Erro','O valor de venda do produto deve ser informado.',false);
    bAlerta := True;
    edtVlVenPro.SetFocus;
    exit;
  end;

  if StrToFloat(edtVlVenPro.Text) <= 0 then begin
    ALERTMSG('Erro','O valor de venda do produto deve ser maior que zero.',false);
    bAlerta := True;
    edtVlVenPro.SetFocus;
    exit;
  end;
end;



procedure TfrmIAEProduto.lblImgClick(Sender: TObject);
begin
  if sOpr <> 'ECP' then
    OpnImg.Execute;

  if Length(PChar(OpnImg.FileName)) > 1 then
    ImgPro.Picture.LoadFromFile(OpnImg.FileName);
end;



procedure TfrmIAEProduto.edtPesoProKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not EDITMONEY(key,edtPesoPro,4,3) then
    key := #0;
end;

procedure TfrmIAEProduto.edtCompProKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not EDITCOD(key) then
    KEY := #0;
end;

procedure TfrmIAEProduto.edtLargProKeyPress(Sender: TObject;
  var Key: Char);
begin
if not EDITCOD(key) then
    KEY := #0;
end;

procedure TfrmIAEProduto.edtAltProKeyPress(Sender: TObject; var Key: Char);
begin
  if not EDITCOD(key) then
    KEY := #0;
end;

procedure TfrmIAEProduto.edtQtGarProKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not EDITCOD(key) then
    KEY := #0;
end;

procedure TfrmIAEProduto.edtEstMinProKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not EDITCOD(key) then
    KEY := #0;
end;

procedure TfrmIAEProduto.edtVlComProKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not EDITMONEY(Key,edtVlComPro,4,2) then
    key := #0;
end;

procedure TfrmIAEProduto.edtVlVenProKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not EDITMONEY(Key,edtVlVenPro,4,2) then
    key := #0;
end;

procedure TfrmIAEProduto.cbbTipoProKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := #0;
end;

procedure TfrmIAEProduto.cbbUniProKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure TfrmIAEProduto.cbbGenProKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;



procedure TfrmIAEProduto.btnAcaoClick(Sender: TObject);
begin
  ValidaCadastro;
  if bAlerta then begin
    bAlerta := False;
    Exit;
  end;

  stpIAEProduto.Close;
  stpIAEProduto.Parameters.ParamByName('@sOpr').Value := sOpr;

  if ((sOpr = 'INP') or (sOpr = 'ACP')) then begin
    stpIAEProduto.Parameters.ParamByName('@id_Codigo_Org').Value        := frmMain.iOrg;
    stpIAEProduto.Parameters.ParamByName('@id_Codigo_Fil').Value        := frmMain.iFil;

    if sOpr = 'INP' then
      stpIAEProduto.Parameters.ParamByName('@id_Codigo_Pro').Value := Null
    else
      stpIAEProduto.Parameters.ParamByName('@id_Codigo_Pro').Value := StrToInt(edtCodPro.Text);

    stpPsqUni.First;
    While not(stpPsqUni.FieldByName('Unidade').AsString = cbbUniPro.Text) do
      stpPsqUni.Next;
    stpIAEProduto.Parameters.ParamByName('@id_Codigo_UnP').Value        := stpPsqUni.Fields.FieldByName('id_Codigo_UnP').AsInteger;

    stpPsqDep.First;
    While not(stpPsqDep.FieldByName('Depto').AsString = cbbTipoPro.Text) do
      stpPsqDep.Next;
    stpIAEProduto.Parameters.ParamByName('@id_Codigo_Dep').Value        := stpPsqDep.Fields.FieldByName('id_Codigo_Dep').AsInteger;

    stpIAEProduto.Parameters.ParamByName('@ds_Descricao_Pro').Value     := edtDescPro.Text;
    stpIAEProduto.Parameters.ParamByName('@vl_Compra_Pro').Value        := StrToFloat(edtVlComPro.Text);
    stpIAEProduto.Parameters.ParamByName('@vl_Venda_Pro').Value         := StrToFloat(edtVlVenPro.Text);
    stpIAEProduto.Parameters.ParamByName('@ds_Peso_Pro').Value          := StrToFloat(edtPesoPro.Text);
    stpIAEProduto.Parameters.ParamByName('@ds_AlturaCm_Pro').Value      := StrToInt(edtAltPro.Text);
    stpIAEProduto.Parameters.ParamByName('@ds_LarguraCm_Pro').Value     := StrToInt(edtLargPro.Text);
    stpIAEProduto.Parameters.ParamByName('@ds_ComprimentoCm_Pro').Value := StrToInt(edtCompPro.Text);
    stpIAEProduto.Parameters.ParamByName('@fl_Estoque_Pro').Value       := True;
    stpIAEProduto.Parameters.ParamByName('@qt_EstMinimo_Pro').Value     := StrToint(edtEstMinPro.Text);
    stpIAEProduto.Parameters.ParamByName('@cd_Genero_Pro').Value        := Copy(cbbGenPro.Text,1,1);
    stpIAEProduto.Parameters.ParamByName('@ds_CodBarra_Pro').Value      := edtCodBarPro.Text;
    stpIAEProduto.Parameters.ParamByName('@fl_Garantia_Pro').Value      := True;
    stpIAEProduto.Parameters.ParamByName('@qt_DiasGarantia_Pro').Value  := StrToInt(edtQtGarPro.Text);

    if sOpr = 'INP'  then begin
      if OpnImg.FileName <> '' then begin
        stpFotoProduto.Close;
        stpFotoProduto.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
        stpFotoProduto.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
        stpFotoProduto.Open;

        CopyFile(PChar(OpnImg.FileName),PChar(ExtractFilePath(Application.ExeName) + '\PicPro\' + stpFotoProduto.FieldByName('NomeFoto').AsString + ExtractFileExt(OpnImg.FileName)),False);
        stpIAEProduto.Parameters.ParamByName('@ds_Imagem_Pro').Value := stpFotoProduto.FieldByName('NomeFoto').AsString + ExtractFileExt(OpnImg.FileName)
      end else
        stpIAEProduto.Parameters.ParamByName('@ds_Imagem_Pro').Value := Null;
    end;

    if sOpr = 'ACP'  then begin
      if not(ALERTMSG('Confirma??o','Deseja mesmo alterar o cadastro do produto?',True)) then
        exit;

      if OpnImg.FileName <> '' then begin
        stpFotoProduto.Close;
        stpFotoProduto.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
        stpFotoProduto.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
        stpFotoProduto.Open;

        CopyFile(PChar(OpnImg.FileName),PChar(ExtractFilePath(Application.ExeName) + '\PicPro\' + frmProduto.stpPsqProduto.Fields.FieldByName('C?d').AsString + ExtractFileExt(OpnImg.FileName)),False);
        stpIAEProduto.Parameters.ParamByName('@ds_Imagem_Pro').Value := frmProduto.stpPsqProduto.Fields.FieldByName('C?d').AsString + ExtractFileExt(OpnImg.FileName);
      end else
        stpIAEProduto.Parameters.ParamByName('@ds_Imagem_Pro').Value := frmProduto.stpPsqProduto.Fields.FieldByName('ds_Imagem_Pro').AsString;
    end;

    stpIAEProduto.Parameters.ParamByName('@ds_Obs_Pro').Value           := mmObsPro.Text;
    stpIAEProduto.Parameters.ParamByName('@id_Codigo_Usu').Value        := frmMain.iUsu;
  end;

  if sOpr = 'ECP' then begin
    if not PopLogin('? necess?rio digitar seu usu?rio e senha para EXCLUIR cadastros do sistema.') then
      exit;

    stpIAEProduto.Parameters.ParamByName('@id_Codigo_Org').Value        := frmMain.iOrg;
    stpIAEProduto.Parameters.ParamByName('@id_Codigo_Fil').Value        := frmMain.iFil;
    stpIAEProduto.Parameters.ParamByName('@id_Codigo_Pro').Value        := StrToInt(edtCodPro.Text);
    stpIAEProduto.Parameters.ParamByName('@id_Codigo_UnP').Value        := Null;
    stpIAEProduto.Parameters.ParamByName('@id_Codigo_Dep').Value        := Null;
    stpIAEProduto.Parameters.ParamByName('@ds_Descricao_Pro').Value     := Null;
    stpIAEProduto.Parameters.ParamByName('@vl_Compra_Pro').Value        := Null;
    stpIAEProduto.Parameters.ParamByName('@vl_Venda_Pro').Value         := Null;
    stpIAEProduto.Parameters.ParamByName('@ds_Peso_Pro').Value          := Null;
    stpIAEProduto.Parameters.ParamByName('@ds_AlturaCm_Pro').Value      := Null;
    stpIAEProduto.Parameters.ParamByName('@ds_LarguraCm_Pro').Value     := Null;
    stpIAEProduto.Parameters.ParamByName('@ds_ComprimentoCm_Pro').Value := Null;
    stpIAEProduto.Parameters.ParamByName('@fl_Estoque_Pro').Value       := Null;
    stpIAEProduto.Parameters.ParamByName('@qt_EstMinimo_Pro').Value     := Null;
    stpIAEProduto.Parameters.ParamByName('@cd_Genero_Pro').Value        := Null;
    stpIAEProduto.Parameters.ParamByName('@ds_CodBarra_Pro').Value      := Null;
    stpIAEProduto.Parameters.ParamByName('@fl_Garantia_Pro').Value      := Null;
    stpIAEProduto.Parameters.ParamByName('@qt_DiasGarantia_Pro').Value  := Null;
    stpIAEProduto.Parameters.ParamByName('@ds_Imagem_Pro').Value        := Null;
    stpIAEProduto.Parameters.ParamByName('@ds_Obs_Pro').Value           := Null;
    stpIAEProduto.Parameters.ParamByName('@id_Codigo_Usu').Value        := frmMain.iUsu;
  end;

  stpIAEProduto.ExecProc;
  Close;
end;



procedure TfrmIAEProduto.FormShow(Sender: TObject);
begin
  lblImg.Cursor := crHandPoint;
  BuscarDepartamentos;
  BuscarUnidades;

  if (sOpr = 'INP') then begin
    if not(frmMain.stpPermissao.FieldByName('Incluir produtos').AsBoolean) then begin
      ALERTMSG('Erro de Permiss?o','O seu usu?rio n?o possui permiss?o para acessar esse m?dulo do sistema.',false);
      PostMessage(frmIAEProduto.Handle, WM_CLOSE, 0, 0)
    end;
    frmIAEProduto.Caption := 'Incluir novo cadastro de produto';
    btnAcao.Caption := '  &Incluir';
    ImgInc.Visible := True;
    ImgALt.Visible := False;
    ImgExc.Visible := False;
    ImlBtn.GetBitmap(0,btnAcao.Glyph);
  end;

  if (sOpr = 'ACP') then begin
    if not(frmMain.stpPermissao.FieldByName('Alterar produtos').AsBoolean) then begin
      ALERTMSG('Erro de Permiss?o','O seu usu?rio n?o possui permiss?o para acessar esse m?dulo do sistema.',false);
      PostMessage(frmIAEProduto.Handle, WM_CLOSE, 0, 0)
    end;
    frmIAEProduto.Caption := 'Alterar cadastro de produto';
    btnAcao.Caption := '  &Alterar';
    PreencheCampos;
    ImgInc.Visible := False;
    ImgALt.Visible := True;
    ImgExc.Visible := False;
    ImlBtn.GetBitmap(1,btnAcao.Glyph);
  end;

  if (sOpr = 'ECP') then begin
    if not(frmMain.stpPermissao.FieldByName('Excluir produtos').AsBoolean) then begin
      ALERTMSG('Erro de Permiss?o','O seu usu?rio n?o possui permiss?o para acessar esse m?dulo do sistema.',false);
      PostMessage(frmIAEProduto.Handle, WM_CLOSE, 0, 0)
    end;
    lblImg.Cursor := crDefault;
    frmIAEProduto.Caption := 'Excluir cadastro de produto';
    btnAcao.Caption := '  &Excluir';
    PreencheCampos;
    ImgInc.Visible := False;
    ImgALt.Visible := False;
    ImgExc.Visible := True;
    ImlBtn.GetBitmap(2,btnAcao.Glyph);

    cbbTipoPro.Color   := $00FFE6CE;
    cbbUniPro.Color    := $00FFE6CE;
    edtCodBarPro.Color := $00FFE6CE;
    edtDescPro.Color   := $00FFE6CE;
    edtPesoPro.Color   := $00FFE6CE;
    edtCompPro.Color   := $00FFE6CE;
    edtLargPro.Color   := $00FFE6CE;
    edtAltPro.Color    := $00FFE6CE;
    cbbGenPro.Color    := $00FFE6CE;
    edtQtGarPro.Color  := $00FFE6CE;
    edtEstMinPro.Color := $00FFE6CE;
    edtVlComPro.Color  := $00FFE6CE;
    edtVlVenPro.Color  := $00FFE6CE;
    mmObsPro.Color     := $00FFE6CE;

    cbbTipoPro.Enabled    := False;
    cbbUniPro.Enabled     := False;
    edtCodBarPro.ReadOnly := True;
    edtDescPro.ReadOnly   := True;
    edtPesoPro.ReadOnly   := True;
    edtCompPro.ReadOnly   := True;
    edtLargPro.ReadOnly   := True;
    edtAltPro.ReadOnly    := True;
    cbbGenPro.Enabled     := False;
    edtQtGarPro.ReadOnly  := True;
    edtEstMinPro.ReadOnly := True;
    edtVlComPro.ReadOnly  := True;
    edtVlVenPro.ReadOnly  := True;
    mmObsPro.ReadOnly     := True;
  end;
end;

procedure TfrmIAEProduto.BitBtn1Click(Sender: TObject);
begin
  if frmIAEDepto = Nil then
    frmIAEDepto := TfrmIAEDepto.Create(Self);

  frmIAEProduto.Visible := false;
  frmIAEDepto.ShowModal;
  frmIAEProduto.Visible := true;

  BuscarDepartamentos;
  frmProduto.stpPsqProduto.Close;
  frmProduto.stpPsqProduto.Open;
  if sOpr <> 'INP' then
    PreencheCampos;
end;

procedure TfrmIAEProduto.BitBtn2Click(Sender: TObject);
begin
  if frmIAEUnidade = Nil then
    frmIAEUnidade := TfrmIAEUnidade.Create(Self);

  frmIAEProduto.Visible := false;
  frmIAEUnidade.ShowModal;
  frmIAEProduto.Visible := true;
  BuscarUnidades;
  frmProduto.stpPsqProduto.Close;
  frmProduto.stpPsqProduto.Open;
  if sOpr <> 'INP' then
    PreencheCampos;
end;

procedure TfrmIAEProduto.BitBtn3Click(Sender: TObject);
begin
  if frmIAEEstoque = Nil then
    frmIAEEstoque := TfrmIAEEstoque.Create(Self);

  frmIAEProduto.Visible := false;
  frmIAEEstoque.ShowModal;
  frmIAEProduto.Visible := true;
end;



procedure TfrmIAEProduto.edtPesoProExit(Sender: TObject);
begin
  if edtPesoPro.Text = '' then
    edtPesoPro.Text := '0,000';
end;

procedure TfrmIAEProduto.edtCompProExit(Sender: TObject);
begin
  if edtCompPro.Text = '' then
    edtCompPro.Text := '0';
end;

procedure TfrmIAEProduto.edtLargProExit(Sender: TObject);
begin
  if edtLargPro.Text = '' then
    edtLargPro.Text := '0';
end;

procedure TfrmIAEProduto.edtAltProExit(Sender: TObject);
begin
  if edtAltPro.Text = '' then
    edtAltPro.Text := '0';
end;



end.
