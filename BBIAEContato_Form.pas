unit BBIAEContato_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, Buttons, ExtCtrls, DB, ADODB, MaskUtils;

type
  TfrmIAEContato = class(TForm)
    Shape2: TShape;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtCodPes: TEdit;
    edtDescPes: TEdit;
    edtDocPes: TEdit;
    Shape1: TShape;
    btnAcao: TBitBtn;
    imlBtn: TImageList;
    cbbTipoCon: TComboBox;
    Label1: TLabel;
    edtTitCon: TEdit;
    Label2: TLabel;
    edtDescCon: TEdit;
    Label3: TLabel;
    edtObsCon: TEdit;
    Label4: TLabel;
    Image1: TImage;
    Label5: TLabel;
    edtCodCon: TEdit;
    stpIAEContato: TADOStoredProc;
    stpPsqTipoContato: TADOStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAcaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    sOpr : String;

    Procedure TravaTela(bTrava:Boolean);
    Procedure PreencheTela;
    Procedure BuscarTipoContato;
    Function  ValidaDados : Boolean;
  end;

var
  frmIAEContato: TfrmIAEContato;
  sOPr: String;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, BBPessoa_Form, Login_Form,
  LoginMsg_Form, SICK013;

{$R *.dfm}

procedure TfrmIAEContato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmIAEContato.FormDestroy(Sender: TObject);
begin
  frmIAEContato := Nil;
end;



Function TfrmIAEContato.ValidaDados;
begin
  Result := True;

  if cbbTipoCon.ItemIndex = 0 then begin
    ALERTMSG('Erro','Selecione o tipo de contato.',false);
    cbbTipoCon.SetFocus;
    Result := False;
    exit;
  end;

  if Length(edtDescCon.Text) < stpPsqTipoContato.Fields.FieldByName('qt_TamanhoMin_TpC').AsInteger then begin
    ALERTMSG('Erro','O formato do contato digitado não é valido. Esse campo deve possuir ao menos ' + stpPsqTipoContato.Fields.FieldByName('qt_TamanhoMin_TpC').AsString + ' caracteres.',false);
    edtDescCon.SetFocus;
    Result := False;
    exit;
  end;
end;



Procedure TfrmIAEContato.BuscarTipoContato;
begin
  stpPsqTipoContato.Close;
  stpPsqTipoContato.Parameters.ParamByName('@id_Codigo_TpC').Value := Null;
  stpPsqTipoContato.Open;

  cbbTipoCon.Clear;
  cbbTipoCon.Items.Add('Selecione o tipo de contato.');
  stpPsqTipoContato.First;
  While not stpPsqTipoContato.Eof do begin
    cbbTipoCon.Items.Add(stpPsqTipoContato.Fields.FieldByName('Tipo').AsString);
    stpPsqTipoContato.Next;
  end;

  cbbTipoCon.ItemIndex := 0;
end;



Procedure TfrmIAEContato.PreencheTela;
begin
  cbbTipoCon.ItemIndex := 0;

  while cbbTipoCon.ItemIndex <= cbbTipoCon.Items.Count do begin
    if Copy(cbbTipoCon.Text,1,(pos(' ',cbbTipoCon.Text)-1)) = frmPessoa.stpPsqContato.FieldByName('id_Codigo_TpC').AsString then
      break
    else
      cbbTipoCon.ItemIndex := cbbTipoCon.ItemIndex + 1;
  end;

  edtCodCon.Text  := frmPessoa.stpPsqContato.Fields.FieldByName('id_Codigo_Con').AsString;
  edtDescCon.Text := frmPessoa.stpPsqContato.Fields.FieldByName('ds_DescFormatada_Con').AsString;
  edtTitCon.Text  := frmPessoa.stpPsqContato.Fields.FieldByName('ds_Titulo_Con').AsString;
  edtObsCon.Text  := frmPessoa.stpPsqContato.Fields.FieldByName('ds_Obs_Con').AsString;
end;



Procedure TfrmIAEContato.TravaTela(bTrava:Boolean);
begin
  if bTrava then begin
    cbbTipoCon.Color := $00FFE6CE;
    edtDescCon.Color := $00FFE6CE;
    edtTitCon.Color  := $00FFE6CE;
    edtObsCon.Color  := $00FFE6CE;

    cbbTipoCon.Enabled  := False;
    edtDescCon.ReadOnly := True;
    edtTitCon.ReadOnly  := True;
    edtObsCon.ReadOnly  := True;
  end else begin
    cbbTipoCon.Color := clWhite;
    edtDescCon.Color := clWhite;
    edtTitCon.Color  := clWhite;
    edtObsCon.Color  := clWhite;

    cbbTipoCon.Enabled  := True;
    edtDescCon.ReadOnly := False;
    edtTitCon.ReadOnly  := False;
    edtObsCon.ReadOnly  := False;
  end;
end;



procedure TfrmIAEContato.FormShow(Sender: TObject);
begin
  BuscarTipoContato;

  if sOpr = 'INC' then begin
    if not(frmMain.stpPermissao.FieldByName('Incluir contatos').AsBoolean) then begin
      ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
      PostMessage(frmIAEContato.Handle, WM_CLOSE, 0, 0)
    end;
    frmIAEContato.Caption := 'Incluir contato';
    btnAcao.Caption := '   &Incluir';
    TravaTela(False);
    ImlBtn.GetBitmap(0,btnAcao.Glyph);
  end else begin
    if sOpr = 'ACC' then begin
      if not(frmMain.stpPermissao.FieldByName('Alterar contatos').AsBoolean) then begin
        ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
        PostMessage(frmIAEContato.Handle, WM_CLOSE, 0, 0)
      end;
      frmIAEContato.Caption := 'Alterar contato';
      btnAcao.Caption := '   &Alterar';
      PreencheTela;
      TravaTela(False);
      ImlBtn.GetBitmap(1,btnAcao.Glyph);
    end else begin
      if not(frmMain.stpPermissao.FieldByName('Excluir contatos').AsBoolean) then begin
        ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
        PostMessage(frmIAEContato.Handle, WM_CLOSE, 0, 0)
      end;
      frmIAEContato.Caption := 'Excluir contato';
      btnAcao.Caption := '   &Excluir';
      PreencheTela;
      TravaTela(True);
      ImlBtn.GetBitmap(2,btnAcao.Glyph);
    end;
  end;

  edtCodPes.Text  := frmPessoa.stpPsqPesCod.AsString;
  edtDescPes.Text := frmPessoa.stpPsqPesDescrio.AsString;

  if Length(frmPessoa.stpPsqPesCPFCNPJ.AsString) = 11 then
    edtDocPes.Text  := FormatMaskText('000\.000\.000\-00;0;_',frmPessoa.stpPsqPesCPFCNPJ.AsString);

  if Length(frmPessoa.stpPsqPesCPFCNPJ.AsString) = 14 then
    edtDocPes.Text  := FormatMaskText('00\.000\.000\/0000\-00;0;_',frmPessoa.stpPsqPesCPFCNPJ.AsString);
end;



procedure TfrmIAEContato.btnAcaoClick(Sender: TObject);
begin
  if sOpr = 'INC' then begin
    if not ValidaDados then
      exit;

    stpIAEContato.Close;
    stpIAEContato.Parameters.ParamByName('@sOpr').Value                 := sOpr;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Org').Value        := frmMain.iOrg;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Fil').Value        := frmMain.iFil;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Con').Value        := Null;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Pes').Value        := frmPessoa.stpPsqPes.Fields.FieldByName('Cod').AsInteger;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Tpc').Value        := strtoint(Copy(cbbTipoCon.Text,1,(pos(' ',cbbTipoCon.Text)-1)));
    stpIAEContato.Parameters.ParamByName('@ds_Titulo_Con').Value        := edtTitCon.Text;
    stpIAEContato.Parameters.ParamByName('@ds_DescSimples_Con').Value   := edtDescCon.Text;
    stpIAEContato.Parameters.ParamByName('@ds_DescFormatada_Con').Value := edtDescCon.Text;
    stpIAEContato.Parameters.ParamByName('@ds_Obs_Con').Value           := edtObsCon.Text;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Usu').Value        := frmMain.iUsu;
    stpIAEContato.ExecProc;
  end;

  if sOpr = 'ACC' then begin
    if not ValidaDados then
      exit;

    stpIAEContato.Close;
    stpIAEContato.Parameters.ParamByName('@sOpr').Value                 := sOpr;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Org').Value        := frmMain.iOrg;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Fil').Value        := frmMain.iFil;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Con').Value        := frmPessoa.stpPsqContato.Fields.FieldByName('id_Codigo_Con').AsInteger;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Pes').Value        := frmPessoa.stpPsqPes.Fields.FieldByName('Cod').AsInteger;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Tpc').Value        := strtoint(Copy(cbbTipoCon.Text,1,(pos(' ',cbbTipoCon.Text)-1)));
    stpIAEContato.Parameters.ParamByName('@ds_Titulo_Con').Value        := edtTitCon.Text;
    stpIAEContato.Parameters.ParamByName('@ds_DescSimples_Con').Value   := edtDescCon.Text;
    stpIAEContato.Parameters.ParamByName('@ds_DescFormatada_Con').Value := edtDescCon.Text;
    stpIAEContato.Parameters.ParamByName('@ds_Obs_Con').Value           := edtObsCon.Text;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Usu').Value        := frmMain.iUsu;
    stpIAEContato.ExecProc;
  end;

  if sOpr = 'ECC' then begin
    stpIAEContato.Close;
    stpIAEContato.Parameters.ParamByName('@sOpr').Value                 := sOpr;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Org').Value        := frmMain.iOrg;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Fil').Value        := frmMain.iFil;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Con').Value        := frmPessoa.stpPsqContato.Fields.FieldByName('id_Codigo_Con').AsInteger;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Pes').Value        := Null;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Tpc').Value        := Null;
    stpIAEContato.Parameters.ParamByName('@ds_Titulo_Con').Value        := null;
    stpIAEContato.Parameters.ParamByName('@ds_DescSimples_Con').Value   := Null;
    stpIAEContato.Parameters.ParamByName('@ds_DescFormatada_Con').Value := Null;
    stpIAEContato.Parameters.ParamByName('@ds_Obs_Con').Value           := Null;
    stpIAEContato.Parameters.ParamByName('@id_Codigo_Usu').Value        := frmMain.iUsu;
    stpIAEContato.ExecProc;

    if not PopLogin('É necessário digitar seu usuário e senha para EXCLUIR cadastros do sistema.') then
      exit;
  end;

  Close;
end;

end.













