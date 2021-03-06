unit BBPessoa_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB, Menus;

type
  TfrmPessoa = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblNumReg: TLabel;
    lblPsq: TLabel;
    grdPesqPes: TDBGrid;
    edtDescPes: TEdit;
    edtDocPes: TEdit;
    BitBtn1: TBitBtn;
    pop1: TPopupMenu;
    PopIncPes: TMenuItem;
    PopAltPes: TMenuItem;
    PopExcPes: TMenuItem;
    dtsPesqPes: TDataSource;
    stpPsqPes: TADOStoredProc;
    Shape2: TShape;
    Shape3: TShape;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    btnPesq: TImage;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    grdEndereco: TDBGrid;
    Label6: TLabel;
    grdContato: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    stpPsqEndereco: TADOStoredProc;
    dtsPsqEndereco: TDataSource;
    PopEnd: TPopupMenu;
    IncEnd: TMenuItem;
    AltEnd: TMenuItem;
    ExcEnd: TMenuItem;
    dtsPsqContato: TDataSource;
    stpPsqContato: TADOStoredProc;
    popCon: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Selecionarcadastrodepessoa1: TMenuItem;
    stpPsqPesCod: TIntegerField;
    stpPsqPesTipo: TStringField;
    stpPsqPesClasse: TStringField;
    stpPsqPesDescrio: TStringField;
    stpPsqPesCPFCNPJ: TStringField;
    stpPsqPesRGIE: TStringField;
    stpPsqPesid_Codigo_Pes: TIntegerField;
    stpPsqPescd_Tipo_Pes: TStringField;
    stpPsqPesid_Codigo_CPe: TIntegerField;
    stpPsqPesds_Nome_Pes: TStringField;
    stpPsqPesds_RG_Pes: TStringField;
    stpPsqPesds_CPF_Pes: TStringField;
    stpPsqPescd_Sexo_Pes: TStringField;
    stpPsqPesdt_Nasc_Pes: TDateTimeField;
    stpPsqPesds_RazSoc_Pes: TStringField;
    stpPsqPesds_Fantasia_Pes: TStringField;
    stpPsqPesds_CNPJ_Pes: TStringField;
    stpPsqPesds_InscEst_Pes: TStringField;
    stpPsqPesds_UFIE_Pes: TStringField;
    stpPsqPesds_Obs_Pes: TStringField;
    stpPsqPesds_Imagem_Pes: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopAltPesClick(Sender: TObject);
    procedure PopExcPesClick(Sender: TObject);
    procedure PopIncPesClick(Sender: TObject);
    procedure BtnPesqClick(Sender: TObject);
    procedure lblPsqClick(Sender: TObject);
    procedure stpPsqPesAfterScroll(DataSet: TDataSet);
    procedure grdPesqPesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure stpPsqPesCPFCNPJGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure IncEndClick(Sender: TObject);
    procedure AltEndClick(Sender: TObject);
    procedure ExcEndClick(Sender: TObject);
    procedure PopEndPopup(Sender: TObject);
    procedure pop1Popup(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure stpPsqPesAfterOpen(DataSet: TDataSet);
    procedure Label9Click(Sender: TObject);
    procedure popConPopup(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure grdEnderecoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdContatoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Selecionarcadastrodepessoa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    sOpr : String;

    iCodPes : integer;
  end;

var
  frmPessoa: TfrmPessoa;

implementation

uses Alert_Form, AlertMsg_Form, BBIAEPessoa_Form, BBMain_Form, Login_Form,
  LoginMsg_Form, SICK013, MaskUtils, BBIAEEndereco_Form, BBIAEContato_Form;

{$R *.dfm}

procedure TfrmPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmPessoa.FormDestroy(Sender: TObject);
begin
  frmPessoa := Nil;
end;



procedure TfrmPessoa.BitBtn1Click(Sender: TObject);
begin
  pop1.Popup(frmPessoa.Left + BitBtn1.Left + BitBtn1.Width + 4,frmPessoa.Top + BitBtn1.Top + BitBtn1.Height + 4);
end;




procedure TfrmPessoa.PopAltPesClick(Sender: TObject);
begin
  if ((stpPsqPes.Active = false) or (stpPsqPes.RecordCount = 0)) then begin
    ALERTMSG('A??o inv?lida','Nenhum cadastro de pessoa foi selecionado para a altera??o.',false);
    Exit;
  end;

  if frmIAEPessoa = Nil then
    frmIAEPessoa := TfrmIAEPessoa.Create(Self);
  frmIAEPessoa.sOpr := 'ACP';
  frmPessoa.Visible := False;
  frmIAEPessoa.ShowModal;
  frmPessoa.Visible := True;
  stpPsqPes.Close;
  stpPsqPes.Open;
end;

procedure TfrmPessoa.PopExcPesClick(Sender: TObject);
begin
  if ((stpPsqPes.Active = false) or (stpPsqPes.RecordCount = 0)) then begin
    ALERTMSG('A??o inv?lida','Nenhum cadastro de pessoa foi selecionado para a exclus?o.',false);
    Exit;
  end;

  if frmIAEPessoa = Nil then
    frmIAEPessoa := TfrmIAEPessoa.Create(Self);
  frmIAEPessoa.sOpr := 'ECP';
  frmPessoa.Visible := False;
  frmIAEPessoa.ShowModal;
  frmPessoa.Visible := True;
  stpPsqPes.Close;
  stpPsqPes.Open;
end;

procedure TfrmPessoa.PopIncPesClick(Sender: TObject);
begin
  if frmIAEPessoa = Nil then
    frmIAEPessoa := TfrmIAEPessoa.Create(Self);
  frmIAEPessoa.sOpr := 'INP';
  frmPessoa.Visible := False;
  frmIAEPessoa.ShowModal;
  frmPessoa.Visible := True;
  stpPsqPes.Close;
  stpPsqPes.Open;
end;



procedure TfrmPessoa.BtnPesqClick(Sender: TObject);
begin
  stpPsqPes.Close;
  stpPsqPes.Parameters.ParamByName('@id_Codigo_Pes').Value    := Null;

  if Length(edtDescPes.Text) < 1 then
    stpPsqPes.Parameters.ParamByName('@ds_Descricao_Pes').Value := Null
  else
    stpPsqPes.Parameters.ParamByName('@ds_Descricao_Pes').Value := edtDescPes.Text;

  if Length(edtDocPes.Text) < 1 then
    stpPsqPes.Parameters.ParamByName('@ds_Documento_Pes').Value := Null
  else
    stpPsqPes.Parameters.ParamByName('@ds_Documento_Pes').Value := edtDocPes.Text;

  stpPsqPes.Open;
end;



procedure TfrmPessoa.lblPsqClick(Sender: TObject);
begin
  edtDescPes.Text := '';
  edtDocPes.Text  := '';

  stpPsqPes.Close;
  stpPsqPes.Parameters.ParamByName('@id_Codigo_Pes').Value    := Null;
  stpPsqPes.Parameters.ParamByName('@ds_Descricao_Pes').Value := '';
  stpPsqPes.Parameters.ParamByName('@ds_Documento_Pes').Value := '';
  stpPsqPes.Open;
end;



procedure TfrmPessoa.stpPsqPesAfterScroll(DataSet: TDataSet);
begin
  lblNumReg.Caption := inttostr(stpPsqPes.RecordCount);
  label5.Left := lblNumReg.Left - label5.width - 4;

  stpPsqEndereco.Close;
  stpPsqEndereco.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iOrg;
  stpPsqEndereco.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iFil;
  stpPsqEndereco.Parameters.ParamByName('@id_Codigo_Pes').Value := stpPsqPesid_Codigo_Pes.AsInteger;
  stpPsqEndereco.Open;

  stpPsqContato.Close;
  stpPsqContato.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iOrg;
  stpPsqContato.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iFil;
  stpPsqContato.Parameters.ParamByName('@id_Codigo_Pes').Value := stpPsqPesid_Codigo_Pes.AsInteger;
  stpPsqContato.Open;
end;



procedure TfrmPessoa.grdPesqPesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
begin
  if grdPesqPes.DataSource = dtsPesqPes then begin
    if not odd(stpPsqPes.RecNo) then begin
      if not (gdSelected in State) then begin
        grdPesqPes.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdPesqPes.Canvas.FillRect(Rect);
        grdPesqPes.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;
end;



procedure TfrmPessoa.FormShow(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Cadastro de pessoas').AsBoolean) then begin
    ALERTMSG('Erro de Permiss?o','O seu usu?rio n?o possui permiss?o para acessar esse m?dulo do sistema.',false);
    PostMessage(frmPessoa.Handle, WM_CLOSE, 0, 0)
  end;

  iCodPes := 0;
end;



procedure TfrmPessoa.stpPsqPesCPFCNPJGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Length(sender.AsString) = 11 then
    text := FormatMaskText('000\.000\.000\-00;0;_',Sender.AsString);

  if Length(sender.AsString) = 14 then
    text := FormatMaskText('00\.000\.000\/0000\-00;0;_',Sender.AsString);
end;



procedure TfrmPessoa.IncEndClick(Sender: TObject);
begin
  if frmIAEEndereco = Nil then
    frmIAEEndereco := TfrmIAEEndereco.Create(Self);

  frmIAEEndereco.sOpr := 'INE';
  frmIAEEndereco.ShowModal;
  stpPsqEndereco.Close;
  stpPsqEndereco.Open;
end;



procedure TfrmPessoa.AltEndClick(Sender: TObject);
begin
  if frmIAEEndereco = Nil then
    frmIAEEndereco := TfrmIAEEndereco.Create(Self);

  frmIAEEndereco.sOpr := 'ACE';
  frmIAEEndereco.ShowModal;
  stpPsqEndereco.Close;
  stpPsqEndereco.Open;
end;



procedure TfrmPessoa.ExcEndClick(Sender: TObject);
begin
  if frmIAEEndereco = Nil then
    frmIAEEndereco := TfrmIAEEndereco.Create(Self);

  frmIAEEndereco.sOpr := 'ECE';
  frmIAEEndereco.ShowModal;
  stpPsqEndereco.Close;
  stpPsqEndereco.Open;
end;



procedure TfrmPessoa.PopEndPopup(Sender: TObject);
begin
  if ((stpPsqPes.Active = false) or (stpPsqPes.RecordCount = 0)) then begin
    PopEnd.Items.Items[0].Enabled := False;
  end else begin
    PopEnd.Items.Items[0].Enabled := True;
  end;

  if ((stpPsqEndereco.Active = false) or (stpPsqEndereco.RecordCount = 0)) then begin
    PopEnd.Items.Items[1].Enabled := False;
    PopEnd.Items.Items[2].Enabled := False;
  end else begin
    PopEnd.Items.Items[1].Enabled := True;
    PopEnd.Items.Items[2].Enabled := True;
  end;
end;



procedure TfrmPessoa.pop1Popup(Sender: TObject);
begin
  if ((stpPsqPes.Active = false) or (stpPsqPes.RecordCount = 0)) then begin
    pop1.Items.Items[1].Enabled := False;
    pop1.Items.Items[2].Enabled := False;
  end else begin
    pop1.Items.Items[1].Enabled := True;
    pop1.Items.Items[2].Enabled := True;
  end;
end;



procedure TfrmPessoa.Label8Click(Sender: TObject);
begin
  PopEnd.Popup(frmPessoa.Left + Label8.Left - label8.Width - 150,frmPessoa.Top + label8.Top + label8.Height + 15);
end;



procedure TfrmPessoa.stpPsqPesAfterOpen(DataSet: TDataSet);
begin
  stpPsqEndereco.Close;
  stpPsqEndereco.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iOrg;
  stpPsqEndereco.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iFil;
  stpPsqEndereco.Parameters.ParamByName('@id_Codigo_Pes').Value := stpPsqPesid_Codigo_Pes.AsInteger;
  stpPsqEndereco.Open;

  stpPsqContato.Close;
  stpPsqContato.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iOrg;
  stpPsqContato.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iFil;
  stpPsqContato.Parameters.ParamByName('@id_Codigo_Pes').Value := stpPsqPesid_Codigo_Pes.AsInteger;
  stpPsqContato.Open;
end;



procedure TfrmPessoa.Label9Click(Sender: TObject);
begin
    PopCon.Popup(frmPessoa.Left + Label9.Left - label9.Width - 150,frmPessoa.Top + label9.Top + label9.Height + 15);
end;



procedure TfrmPessoa.popConPopup(Sender: TObject);
begin
  if ((stpPsqPes.Active = false) or (stpPsqPes.RecordCount = 0)) then begin
    PopCon.Items.Items[0].Enabled := False;
  end else begin
    PopCon.Items.Items[0].Enabled := True;
  end;

  if ((stpPsqContato.Active = false) or (stpPsqContato.RecordCount = 0)) then begin
    PopCon.Items.Items[1].Enabled := False;
    PopCon.Items.Items[2].Enabled := False;
  end else begin
    PopCon.Items.Items[1].Enabled := True;
    PopCon.Items.Items[2].Enabled := True;
  end;
end;



procedure TfrmPessoa.MenuItem1Click(Sender: TObject);
begin
  if frmIAEContato = Nil then
    frmIAEContato := TfrmIAEContato.Create(Self);

  frmIAEContato.sOpr := 'INC';
  frmIAEContato.ShowModal;
  stpPsqContato.Close;
  stpPsqContato.Open;
end;

procedure TfrmPessoa.MenuItem2Click(Sender: TObject);
begin
  if frmIAEContato = Nil then
    frmIAEContato := TfrmIAEContato.Create(Self);

  frmIAEContato.sOpr := 'ACC';
  frmIAEContato.ShowModal;
  stpPsqContato.Close;
  stpPsqContato.Open;
end;


procedure TfrmPessoa.MenuItem3Click(Sender: TObject);
begin
  if frmIAEContato = Nil then
    frmIAEContato := TfrmIAEContato.Create(Self);

  frmIAEContato.sOpr := 'ECC';
  frmIAEContato.ShowModal;
  stpPsqContato.Close;
  stpPsqContato.Open;
end;

procedure TfrmPessoa.grdEnderecoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
begin
  if grdEndereco.DataSource = dtsPsqEndereco then begin
    if not odd(stpPsqEndereco.RecNo) then begin
      if not (gdSelected in State) then begin
        grdEndereco.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdEndereco.Canvas.FillRect(Rect);
        grdEndereco.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;

end;



procedure TfrmPessoa.grdContatoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
begin
  if grdContato.DataSource = dtsPsqContato then begin
    if not odd(stpPsqContato.RecNo) then begin
      if not (gdSelected in State) then begin
        grdContato.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdContato.Canvas.FillRect(Rect);
        grdContato.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;
end;

procedure TfrmPessoa.Selecionarcadastrodepessoa1Click(Sender: TObject);
begin
  frmMain.iPessoa := stpPsqPesid_Codigo_Pes.AsInteger;
  frmMain.sPessoa := stpPsqPes.Fields.fieldByName('descri??o').AsString;
  close;
end;

end.
