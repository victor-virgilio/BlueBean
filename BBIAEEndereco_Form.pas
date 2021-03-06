unit BBIAEEndereco_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB, ImgList;

type
  TfrmIAEEndereco = class(TForm)
    edtLogEnd: TEdit;
    edtNumEnd: TEdit;
    edtComEnd: TEdit;
    edtCEPEnd: TEdit;
    cbbUFEnd: TComboBox;
    cbbCidEnd: TComboBox;
    edtBaiEnd: TEdit;
    edtTitEnd: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Shape1: TShape;
    btnAcao: TBitBtn;
    Image1: TImage;
    stpPsqCidade: TADOStoredProc;
    stpIAEEndereco: TADOStoredProc;
    imlBtn: TImageList;
    edtUFEnd: TEdit;
    edtCidEnd: TEdit;
    Shape2: TShape;
    edtCodPes: TEdit;
    edtDescPes: TEdit;
    edtDocPes: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtCEPEndKeyPress(Sender: TObject; var Key: Char);
    procedure btnAcaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbUFEndChange(Sender: TObject);
    procedure cbbCidEndChange(Sender: TObject);
    procedure cbbUFEndKeyPress(Sender: TObject; var Key: Char);
    procedure cbbCidEndKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    sOpr : String;
    iCodCid : Integer;
    iCodEst : Integer;

    Procedure BuscaCidade;
    Procedure BuscaCodCidEst;
    Procedure PreencheTela;
    Procedure TravaTela(bTrava:Boolean);
    Function ValidaDados:Boolean;
  end;

var
  frmIAEEndereco: TfrmIAEEndereco;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, BBPessoa_Form, Login_Form,
  LoginMsg_Form, SICK013, MaskUtils;

{$R *.dfm}

procedure TfrmIAEEndereco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmIAEEndereco.FormDestroy(Sender: TObject);
begin
  frmIAEEndereco := Nil;
end;



procedure TfrmIAEEndereco.edtCEPEndKeyPress(Sender: TObject; var Key: Char);
begin
  if not(EDITCOD(key)) then
    key := #0;
end;



Function TfrmIAEEndereco.ValidaDados;
begin
  Result := True;

  if Length(edtTitEnd.Text) < 4 then begin
    ALERTMSG('Erro','O t?tulo de endere?o informado n?o ? v?lido.',false);
    edtTitEnd.SetFocus;
    Result := False;
    exit;
  end;

  if Length(edtLogEnd.Text) < 4 then begin
    ALERTMSG('Erro','O logradouro do endere?o informado n?o ? v?lido.',false);
    edtLogEnd.SetFocus;
    Result := False;
    exit;
  end;

  if Length(edtNumEnd.Text) < 1 then begin
    ALERTMSG('Erro','O n?mero do endere?o informado n?o ? v?lido. (Caso n?o haja n?mero no endere?o, digitar "s/n")',false);
    edtNumEnd.SetFocus;
    Result := False;
    exit;
  end;

  if Length(edtBaiEnd.Text) < 4 then begin
    ALERTMSG('Erro','O bairro do endere?o informado n?o ? v?lido.',false);
    edtBaiEnd.SetFocus;
    Result := False;
    exit;
  end;

  if Length(edtUFEnd.Text) < 2 then begin
    ALERTMSG('Erro','? necess?rio informar o Estado do endere?o.',false);
    cbbUFEnd.SetFocus;
    Result := False;
    exit;
  end;

  if Length(edtCidEnd.Text) < 2 then begin
    ALERTMSG('Erro','? necess?rio informar a Cidade do endere?o.',false);
    cbbCidEnd.SetFocus;
    Result := False;
    exit;
  end;

  if Length(edtCEPEnd.Text) < 4 then begin
    ALERTMSG('Erro','O CEP do endere?o informado n?o ? v?lido. (Caso n?o tenha certeza do CEP, preencher com zeros: "00000-000"',false);
    edtLogEnd.SetFocus;
    Result := False;
    exit;
  end;
end;



Procedure TfrmIAEEndereco.TravaTela;
begin
  if bTrava then begin
    edtTitEnd.ReadOnly := True;
    edtLogEnd.ReadOnly := True;
    edtNumEnd.ReadOnly := True;
    edtComEnd.ReadOnly := True;
    edtBaiEnd.ReadOnly := True;
    cbbUFEnd.Enabled   := False;
    cbbCidEnd.Enabled  := False;
    edtCEPEnd.ReadOnly := True;

    edtTitEnd.Color := $00FFE6CE;
    edtLogEnd.Color := $00FFE6CE;
    edtNumEnd.Color := $00FFE6CE;
    edtComEnd.Color := $00FFE6CE;
    edtBaiEnd.Color := $00FFE6CE;
    cbbUFEnd.Color  := $00FFE6CE;
    edtUFEnd.Color  := $00FFE6CE;
    cbbCidEnd.Color := $00FFE6CE;
    edtCidEnd.Color := $00FFE6CE;
    edtCEPEnd.Color := $00FFE6CE;
  end else begin
    edtTitEnd.ReadOnly := False;
    edtLogEnd.ReadOnly := False;
    edtNumEnd.ReadOnly := False;
    edtComEnd.ReadOnly := False;
    edtBaiEnd.ReadOnly := False;
    cbbUFEnd.Enabled   := True;
    cbbCidEnd.Enabled  := True;
    edtCEPEnd.ReadOnly := False;

    edtTitEnd.Color := clWhite;
    edtLogEnd.Color := clWhite;
    edtNumEnd.Color := clWhite;
    edtComEnd.Color := clWhite;
    edtBaiEnd.Color := clWhite;
    cbbUFEnd.Color  := clWhite;
    edtUFEnd.Color  := clWhite;
    cbbCidEnd.Color := clWhite;
    edtCidEnd.Color := clWhite;
    edtCEPEnd.Color := clWhite;
  end;
end;



Procedure TfrmIAEEndereco.BuscaCidade;
begin
  stpPsqCidade.Close;
  stpPsqCidade.Parameters.ParamByName('@ds_Sigla_Est').Value := cbbUFEnd.Text;
  stpPsqCidade.Open;

  cbbCidEnd.Items.Clear;
  stpPsqCidade.First;
  while not stpPsqCidade.Eof do begin
    cbbCidEnd.Items.Add(stpPsqCidade.Fields.FieldByName('ds_Nome_Cid').AsString);
    stpPsqCidade.Next;
  end;

  cbbCidEnd.ItemIndex := 0;
  stpPsqCidade.First;
end;



Procedure TfrmIAEEndereco.BuscaCodCidEst;
begin
  stpPsqCidade.First;
  while not(stpPsqCidade.FieldByName('ds_Nome_Cid').AsString = cbbCidEnd.Text) do
    stpPsqCidade.Next;

  iCodCid := stpPsqCidade.FieldByName('id_Codigo_Cid').AsInteger;
  iCodEst := stpPsqCidade.FieldByName('id_Codigo_Est').AsInteger;
end;



Procedure TfrmIAEEndereco.PreencheTela;
begin
  edtTitEnd.Text := frmPessoa.stpPsqEndereco.Fields.FieldByName('ds_Titulo_End').AsString;
  edtLogEnd.Text := frmPessoa.stpPsqEndereco.Fields.FieldByName('ds_Endereco_End').AsString;
  edtNumEnd.Text := frmPessoa.stpPsqEndereco.Fields.FieldByName('ds_Numero_End').AsString;
  edtComEnd.Text := frmPessoa.stpPsqEndereco.Fields.FieldByName('ds_Compl_End').AsString;
  edtBaiEnd.Text := frmPessoa.stpPsqEndereco.Fields.FieldByName('ds_Bairro_End').AsString;
  cbbUFEnd.Text  := frmPessoa.stpPsqEndereco.Fields.FieldByName('ds_Sigla_Est').AsString;
  edtUFEnd.Text  := cbbUFEnd.Text;
  BuscaCidade;
  cbbCidEnd.Text := frmPessoa.stpPsqEndereco.Fields.FieldByName('ds_Nome_Cid').AsString;
  edtCidEnd.Text := cbbCidEnd.Text;
  edtCEPEnd.Text := frmPessoa.stpPsqEndereco.Fields.FieldByName('ds_CEP_End').AsString;
end;



procedure TfrmIAEEndereco.btnAcaoClick(Sender: TObject);
begin
  if sOpr = 'INE' then begin
    If not(ValidaDados) then
      exit;

    BuscaCodCidEst;

    stpIAEEndereco.Close;
    stpIAEEndereco.Parameters.ParamByName('@Opr').Value             := sOpr;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Org').Value   := frmMain.iOrg;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Fil').Value   := frmMain.iFil;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_End').Value   := Null;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Pes').Value   := frmPessoa.stpPsqPesCod.AsInteger;
    stpIAEEndereco.Parameters.ParamByName('@fl_Padrao_End').Value   := 0; // Alterar quando houver atributos para os endere?os
    stpIAEEndereco.Parameters.ParamByName('@ds_Titulo_End').Value   := edtTitEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@ds_Endereco_End').Value := edtLogEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@ds_Numero_End').Value   := edtNumEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@ds_Bairro_End').Value   := edtBaiEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Cid').Value   := iCodCid;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Est').Value   := iCodEst;
    stpIAEEndereco.Parameters.ParamByName('@ds_CEP_End').Value      := edtCEPEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@ds_Compl_End').Value    := edtComEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Usu').Value   := frmMain.iUsu;
    stpIAEEndereco.ExecProc;
  end;

  if sOpr = 'ACE' then begin
    If not(ValidaDados) then
      exit;

    BuscaCodCidEst;

    stpIAEEndereco.Close;
    stpIAEEndereco.Parameters.ParamByName('@Opr').Value             := sOpr;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Org').Value   := frmMain.iOrg;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Fil').Value   := frmMain.iFil;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_End').Value   := frmPessoa.stpPsqEndereco.Fields.FieldByName('id_COdigo_End').AsInteger;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Pes').Value   := frmPessoa.stpPsqPesCod.AsInteger;
    stpIAEEndereco.Parameters.ParamByName('@fl_Padrao_End').Value   := 0; // Alterar quando houver atributos para os endere?os
    stpIAEEndereco.Parameters.ParamByName('@ds_Titulo_End').Value   := edtTitEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@ds_Endereco_End').Value := edtLogEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@ds_Numero_End').Value   := edtNumEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@ds_Bairro_End').Value   := edtBaiEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Cid').Value   := iCodCid;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Est').Value   := iCodEst;
    stpIAEEndereco.Parameters.ParamByName('@ds_CEP_End').Value      := edtCEPEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@ds_Compl_End').Value    := edtComEnd.Text;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Usu').Value   := frmMain.iUsu;
    stpIAEEndereco.ExecProc;
  end;

  if sOpr = 'ECE' then begin
    if not PopLogin('? necess?rio digitar seu usu?rio e senha para EXCLUIR cadastros do sistema.') then
      exit;

    stpIAEEndereco.Close;
    stpIAEEndereco.Parameters.ParamByName('@Opr').Value             := sOpr;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Org').Value   := frmMain.iOrg;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Fil').Value   := frmMain.iFil;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_End').Value   := frmPessoa.stpPsqEndereco.Fields.FieldByName('id_Codigo_End').AsInteger;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Pes').Value   := Null;
    stpIAEEndereco.Parameters.ParamByName('@fl_Padrao_End').Value   := Null;
    stpIAEEndereco.Parameters.ParamByName('@ds_Titulo_End').Value   := Null;
    stpIAEEndereco.Parameters.ParamByName('@ds_Endereco_End').Value := Null;
    stpIAEEndereco.Parameters.ParamByName('@ds_Numero_End').Value   := Null;
    stpIAEEndereco.Parameters.ParamByName('@ds_Bairro_End').Value   := Null;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Cid').Value   := Null;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Est').Value   := Null;
    stpIAEEndereco.Parameters.ParamByName('@ds_CEP_End').Value      := Null;
    stpIAEEndereco.Parameters.ParamByName('@ds_Compl_End').Value    := Null;
    stpIAEEndereco.Parameters.ParamByName('@id_Codigo_Usu').Value   := frmMain.iUsu;
    stpIAEEndereco.ExecProc;
  end;

  Close;
end;



procedure TfrmIAEEndereco.FormShow(Sender: TObject);
begin
  if sOpr = 'INE' then begin
    if not(frmMain.stpPermissao.FieldByName('Incluir endere?os').AsBoolean) then begin
      ALERTMSG('Erro de Permiss?o','O seu usu?rio n?o possui permiss?o para acessar esse m?dulo do sistema.',false);
      PostMessage(frmIAEEndereco.Handle, WM_CLOSE, 0, 0)
    end;
    frmIAEEndereco.Caption := 'Incluir endere?o';
    btnAcao.Caption := '   &Incluir';
    TravaTela(False);
    ImlBtn.GetBitmap(0,btnAcao.Glyph);
  end else begin
    if sOpr = 'ACE' then begin
      if not(frmMain.stpPermissao.FieldByName('Alterar endere?os').AsBoolean) then begin
        ALERTMSG('Erro de Permiss?o','O seu usu?rio n?o possui permiss?o para acessar esse m?dulo do sistema.',false);
        PostMessage(frmIAEEndereco.Handle, WM_CLOSE, 0, 0)
      end;
      frmIAEEndereco.Caption := 'Alterar endere?o';
      btnAcao.Caption := '   &Alterar';
      PreencheTela;
      TravaTela(False);
      ImlBtn.GetBitmap(1,btnAcao.Glyph);
    end else begin
      if not(frmMain.stpPermissao.FieldByName('Excluir endere?os').AsBoolean) then begin
        ALERTMSG('Erro de Permiss?o','O seu usu?rio n?o possui permiss?o para acessar esse m?dulo do sistema.',false);
        PostMessage(frmIAEEndereco.Handle, WM_CLOSE, 0, 0)
      end;
      frmIAEEndereco.Caption := 'Excluir endere?o';
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



procedure TfrmIAEEndereco.cbbUFEndChange(Sender: TObject);
begin
  BuscaCidade;
  edtUFEnd.Text  := cbbUFEnd.Text;
  cbbCidEnd.Text := '';
  edtCidEnd.Text := '';
end;

procedure TfrmIAEEndereco.cbbCidEndChange(Sender: TObject);
begin
  edtCidEnd.Text := cbbCidEnd.Text;
end;

procedure TfrmIAEEndereco.cbbUFEndKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure TfrmIAEEndereco.cbbCidEndKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := #0;
end;

end.
















