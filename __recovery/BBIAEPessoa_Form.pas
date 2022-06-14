unit BBIAEPessoa_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, ADODB, ImgList,
  System.ImageList;

type
  TfrmIAEPessoa = class(TForm)
    Label1: TLabel;
    edtCodPes: TEdit;
    pnlPesFis: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtNomePes: TEdit;
    cbbSexoPes: TComboBox;
    dtpDtNasc: TDateTimePicker;
    edtCPFPes: TEdit;
    edtRGPes: TEdit;
    edtDtNasc: TEdit;
    pnlPesJur: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    edtRazSocPes: TEdit;
    edtNomFanPes: TEdit;
    edtCNPJPes: TEdit;
    edtInscEstPes: TEdit;
    cbbUFIEs: TComboBox;
    rbtPesFis: TRadioButton;
    rbtPesJur: TRadioButton;
    btnAcao: TBitBtn;
    cbbClassePes: TComboBox;
    Label11: TLabel;
    stpIAEPes: TADOStoredProc;
    stpPsqClasse: TADOStoredProc;
    imlBtn: TImageList;
    lblImg: TLabel;
    Shape2: TShape;
    ImgPro: TImage;
    OpnImg: TOpenDialog;
    ImgInc: TImage;
    ImgAlt: TImage;
    ImgExc: TImage;
    stpFotoPessoa: TADOStoredProc;
    stpFotoPessoaNomeFoto: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure rbtPesFisClick(Sender: TObject);
    procedure rbtPesJurClick(Sender: TObject);
    procedure dtpDtNascChange(Sender: TObject);
    procedure btnAcaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCPFPesKeyPress(Sender: TObject; var Key: Char);
    procedure edtCNPJPesKeyPress(Sender: TObject; var Key: Char);
    procedure edtInscEstPesKeyPress(Sender: TObject; var Key: Char);
    procedure lblImgClick(Sender: TObject);
  private
    { Private declarations }
  public
    sOpr : string;  sAlerta: String;

    Procedure SelTipoPes;
    Procedure PreencheCampos;
    Procedure ValidaCadastro;
    Procedure BuscarClasses;
  end;

var
  frmIAEPessoa: TfrmIAEPessoa;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, BBPessoa_Form, SICK013;

{$R *.dfm}

Procedure TfrmIAEPessoa.BuscarClasses;
begin
  stpPsqClasse.Close;
  stpPsqClasse.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpPsqClasse.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpPsqClasse.Open;

  cbbClassePes.Clear;
  cbbClassePes.Items.Add('Selecione a classe do cadastro de pessoa.');
  stpPsqClasse.First;
  While not stpPsqClasse.Eof do begin
    cbbClassePes.Items.Add(stpPsqClasse.Fields.FieldByName('Classe').AsString);
    stpPsqClasse.Next;
  end;

  cbbClassePes.ItemIndex := 0;
end;

Procedure TfrmIAEPessoa.SelTipoPes;
begin
  if rbtPesFis.Checked then begin
    pnlPesFis.Enabled := True;
    pnlPesJur.Enabled := False;

    edtNomePes.Color := clWhite;
    cbbSexoPes.Color := clWhite;
    dtpDtNasc.Color  := clWhite;
    edtDtNasc.Color  := clWhite;
    edtCPFPes.Color  := clWhite;
    edtRGPes.Color   := clWhite;

    edtRazSocPes.Color  := $00FFE6CE;
    edtNomFanPes.Color  := $00FFE6CE;
    edtCNPJPes.Color    := $00FFE6CE;
    edtInscEstPes.Color := $00FFE6CE;
  end else begin
    pnlPesFis.Enabled := False;
    pnlPesJur.Enabled := True;

    edtNomePes.Color := $00FFE6CE;
    cbbSexoPes.Color := $00FFE6CE;
    dtpDtNasc.Color  := $00FFE6CE;
    edtDtNasc.Color  := $00FFE6CE;
    edtCPFPes.Color  := $00FFE6CE;
    edtRGPes.Color   := $00FFE6CE;

    edtRazSocPes.Color  := clWhite;
    edtNomFanPes.Color  := clWhite;
    edtCNPJPes.Color    := clWhite;
    edtInscEstPes.Color := clWhite;
  end;
end;



Procedure TfrmIAEPessoa.PreencheCampos;
begin
  with frmPessoa.stpPsqPes do begin
    cbbClassePes.ItemIndex := 0;

    edtCodPes.Text := FieldByName('id_Codigo_Pes').AsString;

    while cbbClassePes.ItemIndex <= cbbClassePes.Items.Count do begin
      if Copy(cbbClassePes.Text,1,(pos(' ',cbbClassePes.Text)-1)) = FieldByName('id_Codigo_CPe').AsString then
        break
      else
        cbbClassePes.ItemIndex := cbbClassePes.ItemIndex + 1;
    end;

    if FieldByName('cd_Tipo_Pes').AsString = 'F' then begin
      rbtPesFis.Checked := True;
      edtNomePes.Text   := FieldByName('ds_Nome_Pes').AsString;

      if FieldByName('cd_Sexo_Pes').AsString = 'M' then
        cbbSexoPes.Text := 'Masculino'
      else
        cbbSexoPes.Text := 'Feminino';

      edtDtNasc.Text := FieldByName('dt_Nasc_Pes').AsString;
      edtCPFPes.Text := FieldByName('ds_CPF_Pes').AsString;
      edtRGPes.Text  := FieldByName('ds_RG_Pes').AsString;

      rbtPesJur.Checked  := False;
      edtRazSocPes.Text  := '';
      edtNomFanPes.Text  := '';
      edtCNPJPes.Text    := '';
      edtInscEstPes.Text := '';
      cbbUFIEs.Text      := '';
    end;

    if FieldByName('cd_Tipo_Pes').AsString = 'J' then begin
      rbtPesFis.Checked := False;
      edtNomePes.Text   := '';
      cbbSexoPes.Text   := 'Selecione';
      edtDtNasc.Text    := '';
      edtCPFPes.Text    := '';
      edtRGPes.Text     := '';

      rbtPesJur.Checked  := True;
      edtRazSocPes.Text  := FieldByName('ds_RazSoc_Pes').AsString;
      edtNomFanPes.Text  := FieldByName('ds_Fantasia_Pes').AsString;
      edtCNPJPes.Text    := FieldByName('ds_CNPJ_Pes').AsString;
      edtInscEstPes.Text := FieldByName('ds_InscEst_Pes').AsString;
      cbbUFIEs.Text      := FieldByName('ds_UFIE_Pes').AsString;
    end;
    SelTipoPes;

    if Length(frmPessoa.stpPsqPes.FieldByName('ds_Imagem_Pes').AsString) > 0 then
      ImgPro.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\PicPes\' + frmPessoa.stpPsqPes.FieldByName('ds_Imagem_Pes').AsString)
    else
      ImgPro.Picture.LoadFromFile('PicPes\FotoDefault.bmp');
  end;
end;



Procedure TfrmIAEPessoa.ValidaCadastro;
begin
  if (sOpr = 'INP') or (sOpr = 'ACP') then begin
    if cbbClassePes.ItemIndex = 0 then begin
      ALERTMSG('Erro','É necessário selecionar a classe do cadastro de pessoa.',False);
      sAlerta := 'T';
      cbbClassePes.SetFocus;
      exit;
    end;

    if rbtPesFis.Checked then begin
      if Length(edtNomePes.Text) < 5 then begin
        ALERTMSG('Erro','É necessário preencher o nome do cadastro de pessoa com um mínimo de 5 caracteres.',False);
        sAlerta := 'T';
        edtNomePes.SetFocus;
        exit;
      end;

      if cbbSexoPes.Text = 'Selecione' then begin
        ALERTMSG('Erro','É necessário selecionar o sexo do cadastro de pessoa.',False);
        sAlerta := 'T';
        cbbSexoPes.SetFocus;
        exit;
      end;

      if edtDtNasc.Text = 'Selecione data' then begin
        ALERTMSG('Erro','É necessário selecionara data de nascimento do cadastro de pessoa.',False);
        sAlerta := 'T';
        edtDtNasc.SetFocus;
        exit;
      end;

      if not VALIDACPF(edtCPFPes.Text) then begin
        ALERTMSG('Erro','O número de CPF digitado não é válido.',False);
        sAlerta := 'T';
        edtCPFPes.SetFocus;
        exit;
      end;

      if length(edtRGPes.Text) < 7 then begin
        ALERTMSG('Erro','O número de RG deve ter no mínimo 7 caracteres.',False);
        sAlerta := 'T';
        edtRGPes.SetFocus;
        exit;
      end;
    end;

    if rbtPesJur.Checked then begin
      if ((length(edtRazSocPes.Text) < 5) and (length(edtNomFanPes.Text) < 5)) then begin
        ALERTMSG('Erro','A razão social ou o nome fantasia do cadastro deve ter no mínimo 5 caracteres.',False);
        sAlerta := 'T';
        edtRazSocPes.SetFocus;
        exit;
      end;

      if not VALIDACNPJ(edtCNPJPes.Text) then begin
        ALERTMSG('Erro','O número do CNPJ informado não é válido.',False);
        sAlerta := 'T';
        edtCNPJPes.SetFocus;
        exit;
      end;

      if edtInscEstPes.Text <> '' then begin
        if not VALIDAIES(edtInscEstPes.Text,cbbUFIEs.Text) then begin
          ALERTMSG('Erro','O número de Inscrição Estadual informado não é válido.',False);
          sAlerta := 'T';
          edtInscEstPes.SetFocus;
          exit;
        end;
      end;
    end;
  end;
end;



procedure TfrmIAEPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;



procedure TfrmIAEPessoa.FormDestroy(Sender: TObject);
begin
  frmIAEPessoa := Nil;
end;



procedure TfrmIAEPessoa.rbtPesFisClick(Sender: TObject);
begin
  if sAlerta = 'T' then
    exit;

  if not ALERTMSG('ATENÇÃO','Ao alternar entre PF/PJ os dados digitados serão perdidos. Deseja continuar?',True) then begin
    sAlerta := 'T';
    rbtPesJur.Checked := True;
    sAlerta := 'F';
    exit;
  end;
  SelTipoPes;
end;



procedure TfrmIAEPessoa.rbtPesJurClick(Sender: TObject);
begin
  if sAlerta = 'T' then
    exit;

  if not ALERTMSG('ATENÇÃO','Ao alternar entre PF/PJ os dados digitados serão perdidos. Deseja continuar?',True) then begin
    sAlerta := 'T';
    rbtPesFis.Checked := True;
    sAlerta := 'F';
    exit;
  end;
  SelTipoPes;
end;



procedure TfrmIAEPessoa.dtpDtNascChange(Sender: TObject);
begin
  edtDtNasc.Text := datetostr(dtpDtNasc.Date);
end;



procedure TfrmIAEPessoa.btnAcaoClick(Sender: TObject);
begin
  ValidaCadastro;

  if sAlerta = 'T' then begin
    sAlerta := 'F';
    exit;
  end;

  if (sOpr = 'INP') or (sOpr = 'ACP') then begin
    if sOpr = 'ACP' then begin
      If not(ALERTMSG('Confirmação','Deseja mesmo alterar o cadastro de pessoa?',True)) then
        exit;
    end;

    stpIAEPes.Close;
    stpIAEPes.Parameters.ParamByName('@sOpr').Value              := sOpr;
    stpIAEPes.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
    stpIAEPes.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;

    if sOpr = 'INP' then
      stpIAEPes.Parameters.ParamByName('@id_Codigo_Pes').Value    := Null
    else
      stpIAEPes.Parameters.ParamByName('@id_Codigo_Pes').Value    := strtoint(edtCodPes.Text);

    stpIAEPes.Parameters.ParamByName('@id_Codigo_CPe').Value    := strtoint(Copy(cbbClassePes.Text,1,(pos(' ',cbbClassePes.Text)-1)));

    if rbtPesFis.Checked then
      stpIAEPes.Parameters.ParamByName('@cd_Tipo_Pes').Value      := 'F'
    else
      stpIAEPes.Parameters.ParamByName('@cd_Tipo_Pes').Value      := 'J';

    if rbtPesFis.Checked then begin
      stpIAEPes.Parameters.ParamByName('@ds_Nome_Pes').Value      := edtNomePes.Text;
      stpIAEPes.Parameters.ParamByName('@ds_RG_Pes').Value        := edtRGPes.Text;
      stpIAEPes.Parameters.ParamByName('@ds_CPF_Pes').Value       := edtCPFPes.Text;
      stpIAEPes.Parameters.ParamByName('@cd_Sexo_Pes').Value      := copy(cbbSexoPes.Text,1,1);
      stpIAEPes.Parameters.ParamByName('@dt_Nasc_Pes').Value      := edtDtNasc.Text;

      stpIAEPes.Parameters.ParamByName('@ds_RazSoc_Pes').Value    := Null;
      stpIAEPes.Parameters.ParamByName('@ds_Fantasia_Pes').Value  := Null;
      stpIAEPes.Parameters.ParamByName('@ds_CNPJ_Pes').Value      := Null;
      stpIAEPes.Parameters.ParamByName('@ds_InscEst_Pes').Value   := Null;
      stpIAEPes.Parameters.ParamByName('@ds_UFIE_Pes').Value      := Null;
    end else begin
      stpIAEPes.Parameters.ParamByName('@ds_Nome_Pes').Value      := Null;
      stpIAEPes.Parameters.ParamByName('@ds_RG_Pes').Value        := Null;
      stpIAEPes.Parameters.ParamByName('@ds_CPF_Pes').Value       := Null;
      stpIAEPes.Parameters.ParamByName('@cd_Sexo_Pes').Value      := Null;
      stpIAEPes.Parameters.ParamByName('@dt_Nasc_Pes').Value      := Null;

      stpIAEPes.Parameters.ParamByName('@ds_RazSoc_Pes').Value    := edtRazSocPes.Text;
      stpIAEPes.Parameters.ParamByName('@ds_Fantasia_Pes').Value  := edtNomFanPes.Text;
      stpIAEPes.Parameters.ParamByName('@ds_CNPJ_Pes').Value      := edtCNPJPes.Text;
      stpIAEPes.Parameters.ParamByName('@ds_InscEst_Pes').Value   := edtInscEstPes.Text;
      stpIAEPes.Parameters.ParamByName('@ds_UFIE_Pes').Value      := cbbUFIEs.Text;
    end;
    stpIAEPes.Parameters.ParamByName('@ds_Obs_Pes').Value       := Null;

    if sOpr = 'INP' then begin
      if OpnImg.FileName <> '' then begin
          stpFotoPessoa.Close;
          stpFotoPessoa.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
          stpFotoPessoa.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
          stpFotoPessoa.Open;

          CopyFile(PChar(OpnImg.FileName),PChar(ExtractFilePath(Application.ExeName) + '\PicPes\' + stpFotoPessoa.FieldByName('NomeFoto').AsString + ExtractFileExt(OpnImg.FileName)),False);
          stpIAEPes.Parameters.ParamByName('@ds_Imagem_Pes').Value := stpFotoPessoa.FieldByName('NomeFoto').AsString + ExtractFileExt(OpnImg.FileName);
      end else begin
        stpIAEPes.Parameters.ParamByName('@ds_Imagem_Pes').Value := Null;
      end;
    end else begin
      if OpnImg.FileName <> '' then begin
          CopyFile(PChar(OpnImg.FileName),PChar(ExtractFilePath(Application.ExeName) + '\PicPes\' + edtCodPes.Text + ExtractFileExt(OpnImg.FileName)),False);
          stpIAEPes.Parameters.ParamByName('@ds_Imagem_Pes').Value := edtCodPes.Text + ExtractFileExt(OpnImg.FileName);
      end else
        stpIAEPes.Parameters.ParamByName('@ds_Imagem_Pes').Value := Null;
    end;


    stpIAEPes.Parameters.ParamByName('@id_Codigo_Usu').Value    := frmMain.iUsu;
    stpIAEPes.ExecProc;

    close;
  end;

  if sOpr = 'ECP' then begin
    if not PopLogin('É necessário digitar seu usuário e senha para EXCLUIR cadastros do sistema.') then
      exit;

    stpIAEPes.Close;
    stpIAEPes.Parameters.ParamByName('@sOpr').Value             := sOpr;
    stpIAEPes.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
    stpIAEPes.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;
    stpIAEPes.Parameters.ParamByName('@id_Codigo_Pes').Value    := edtCodPes.Text;
    stpIAEPes.Parameters.ParamByName('@id_Codigo_CPe').Value    := Null;
    stpIAEPes.Parameters.ParamByName('@ds_Nome_Pes').Value      := Null;
    stpIAEPes.Parameters.ParamByName('@ds_RG_Pes').Value        := Null;
    stpIAEPes.Parameters.ParamByName('@ds_CPF_Pes').Value       := Null;
    stpIAEPes.Parameters.ParamByName('@cd_Sexo_Pes').Value      := Null;
    stpIAEPes.Parameters.ParamByName('@dt_Nasc_Pes').Value      := Null;
    stpIAEPes.Parameters.ParamByName('@ds_RazSoc_Pes').Value    := Null;
    stpIAEPes.Parameters.ParamByName('@ds_Fantasia_Pes').Value  := Null;
    stpIAEPes.Parameters.ParamByName('@ds_CNPJ_Pes').Value      := Null;
    stpIAEPes.Parameters.ParamByName('@ds_InscEst_Pes').Value   := Null;
    stpIAEPes.Parameters.ParamByName('@ds_UFIE_Pes').Value      := Null;
    stpIAEPes.Parameters.ParamByName('@id_Codigo_Usu').Value    := frmMain.iUsu;
    stpIAEPes.ExecProc;

    Close;
  end;
end;



procedure TfrmIAEPessoa.FormShow(Sender: TObject);
begin
  BuscarClasses;

  if (sOpr = 'INP') then begin
    if not(frmMain.stpPermissao.FieldByName('Incluir pessoas').AsBoolean) then begin
      ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
      PostMessage(frmIAEPessoa.Handle, WM_CLOSE, 0, 0)
    end;
    frmIAEPessoa.Caption := 'Inclusão de cadastro de pessoas';
    btnAcao.Caption := '  &Incluir';
    SelTipoPes;
    ImgInc.Visible := True;
    ImgALt.Visible := False;
    ImgExc.Visible := False;
    ImlBtn.GetBitmap(0,btnAcao.Glyph);
  end;

  if (sOpr = 'ACP') then begin
    if not(frmMain.stpPermissao.FieldByName('Alterar pessoas').AsBoolean) then begin
      ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
      PostMessage(frmIAEPessoa.Handle, WM_CLOSE, 0, 0)
    end;
    frmIAEPessoa.Caption := 'Alteração de cadastro de pessoas';
    btnAcao.Caption := '  &Alterar';
    PreencheCampos;
    ImgInc.Visible := False;
    ImgALt.Visible := True;
    ImgExc.Visible := False;
    ImlBtn.GetBitmap(1,btnAcao.Glyph);
  end;

  if (sOpr = 'ECP') then begin
    if not(frmMain.stpPermissao.FieldByName('Excluir pessoas').AsBoolean) then begin
      ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
      PostMessage(frmIAEPessoa.Handle, WM_CLOSE, 0, 0)
    end;
    frmIAEPessoa.Caption := 'Exclusão de cadastro de pessoas';
    btnAcao.Caption := '  &Excluir';
    PreencheCampos;
    ImgInc.Visible := False;
    ImgALt.Visible := False;
    ImgExc.Visible := True;
    ImlBtn.GetBitmap(2,btnAcao.Glyph);

    cbbClassePes.Color  := $00FFE6CE;
    edtRazSocPes.Color  := $00FFE6CE;
    edtNomFanPes.Color  := $00FFE6CE;
    edtCNPJPes.Color    := $00FFE6CE;
    edtInscEstPes.Color := $00FFE6CE;
    edtNomePes.Color    := $00FFE6CE;
    cbbSexoPes.Color    := $00FFE6CE;
    dtpDtNasc.Color     := $00FFE6CE;
    edtDtNasc.Color     := $00FFE6CE;
    edtCPFPes.Color     := $00FFE6CE;
    edtRGPes.Color      := $00FFE6CE;
    cbbUFIEs.Color      := $00FFE6CE;

    rbtPesFis.Enabled      := False;
    rbtPesJur.Enabled      := False;
    cbbClassePes.Enabled   := False;
    edtRazSocPes.ReadOnly  := True;
    edtNomFanPes.ReadOnly  := True;
    edtCNPJPes.ReadOnly    := True;
    edtInscEstPes.ReadOnly := True;
    edtNomePes.ReadOnly    := True;
    cbbSexoPes.Enabled     := False;
    dtpDtNasc.Enabled      := False;
    edtDtNasc.ReadOnly     := True;
    edtCPFPes.ReadOnly     := True;
    edtRGPes.ReadOnly      := True;
    cbbUFIEs.Enabled       := False;
  end;
end;



procedure TfrmIAEPessoa.edtCPFPesKeyPress(Sender: TObject; var Key: Char);
begin
  if not EDITCOD(key) then
    key := #0;
end;

procedure TfrmIAEPessoa.edtCNPJPesKeyPress(Sender: TObject; var Key: Char);
begin
  if not EDITCOD(key) then
    key := #0;
end;

procedure TfrmIAEPessoa.edtInscEstPesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not EDITCOD(key) then
    key := #0;
end;



procedure TfrmIAEPessoa.lblImgClick(Sender: TObject);
begin
  if sOpr <> 'ECP' then
    OpnImg.Execute;

  if Length(PChar(OpnImg.FileName)) > 1 then
    ImgPro.Picture.LoadFromFile(OpnImg.FileName);
end;

end.
