unit BBProduto_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, CheckLst, Menus, Buttons,
  DB, ADODB;

type
  TfrmProduto = class(TForm)
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Shape1: TShape;
    Label1: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    grdPsqProduto: TDBGrid;
    imgPsq: TImage;
    edtPsqCodPro: TEdit;
    Label5: TLabel;
    lblNumReg: TLabel;
    Label4: TLabel;
    lblPsq: TLabel;
    BitBtn1: TBitBtn;
    pop1: TPopupMenu;
    PopIncPes: TMenuItem;
    PopAltPes: TMenuItem;
    PopExcPes: TMenuItem;
    dtsPesqProduto: TDataSource;
    stpPsqProduto: TADOStoredProc;
    Label3: TLabel;
    edtPsqCodBarPro: TEdit;
    Label6: TLabel;
    edtPsqDescPro: TEdit;
    stpPsqProdutoid_Codigo_Org: TIntegerField;
    stpPsqProdutoid_Codigo_Fil: TIntegerField;
    stpPsqProdutoCd: TIntegerField;
    stpPsqProdutoid_Codigo_UnP: TIntegerField;
    stpPsqProdutods_Descricao_UnP: TStringField;
    stpPsqProdutoUnidade: TStringField;
    stpPsqProdutoid_Codigo_Dep: TIntegerField;
    stpPsqProdutods_Descricao_Dep: TStringField;
    stpPsqProdutoDepartamento: TStringField;
    stpPsqProdutoDescrio: TStringField;
    stpPsqProdutoVlCompra: TBCDField;
    stpPsqProdutoVlVenda: TBCDField;
    stpPsqProdutods_Peso_Pro: TBCDField;
    stpPsqProdutods_AlturaCm_Pro: TIntegerField;
    stpPsqProdutods_LarguraCm_Pro: TIntegerField;
    stpPsqProdutods_ComprimentoCm_Pro: TIntegerField;
    stpPsqProdutofl_Estoque_Pro: TBooleanField;
    stpPsqProdutoqt_EstMinimo_Pro: TIntegerField;
    stpPsqProdutocd_Genero_Pro: TStringField;
    stpPsqProdutods_CodBarra_Pro: TStringField;
    stpPsqProdutofl_Garantia_Pro: TBooleanField;
    stpPsqProdutoqt_DiasGarantia_Pro: TIntegerField;
    stpPsqProdutods_Imagem_Pro: TStringField;
    stpPsqProdutods_Obs_Pro: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopAltPesClick(Sender: TObject);
    procedure PopExcPesClick(Sender: TObject);
    procedure PopIncPesClick(Sender: TObject);
    procedure imgPsqClick(Sender: TObject);
    procedure lblPsqClick(Sender: TObject);
    procedure stpPsqProdutoAfterScroll(DataSet: TDataSet);
    procedure grdPsqProdutoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure edtPsqCodProKeyPress(Sender: TObject; var Key: Char);
    procedure stpPsqProdutoVlCompraGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure stpPsqProdutoVlVendaGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    iProduto : integer;
  end;

var
  frmProduto: TfrmProduto;

implementation

uses Alert_Form, AlertMsg_Form, BBIAEProduto_Form, BBMain_Form, Login_Form,
  LoginMsg_Form, SICK013;

{$R *.dfm}

procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmProduto.FormDestroy(Sender: TObject);
begin
  frmProduto := Nil;
end;



procedure TfrmProduto.BitBtn1Click(Sender: TObject);
begin
  pop1.Popup(frmProduto.Left + BitBtn1.Left + BitBtn1.Width + 4,frmProduto.Top + BitBtn1.Top + BitBtn1.Height + 4);
end;



procedure TfrmProduto.PopAltPesClick(Sender: TObject);
begin
  if ((stpPsqProduto.Active = false) or (stpPsqProduto.RecordCount = 0)) then begin
    ALERTMSG('Ação inválida','Nenhum cadastro de produto foi selecionado para a alteração.',false);
    Exit;
  end;

  if frmIAEProduto = Nil then
    frmIAEProduto := TfrmIAEProduto.Create(Self);
  frmIAEProduto.sOpr := 'ACP';
  frmProduto.Visible := False;
  frmIAEProduto.ShowModal;
  frmProduto.Visible := True;
  stpPsqProduto.Close;
  stpPsqProduto.Open;
end;



procedure TfrmProduto.PopExcPesClick(Sender: TObject);
begin
  if ((stpPsqProduto.Active = false) or (stpPsqProduto.RecordCount = 0)) then begin
    ALERTMSG('Ação inválida','Nenhum cadastro de produto foi selecionado para a exclusão.',false);
    Exit;
  end;

  if frmIAEProduto = Nil then
    frmIAEProduto := TfrmIAEProduto.Create(Self);
  frmIAEProduto.sOpr := 'ECP';
  frmProduto.Visible := False;
  frmIAEProduto.ShowModal;
  frmProduto.Visible := True;
  stpPsqProduto.Close;
  stpPsqProduto.Open;
end;



procedure TfrmProduto.PopIncPesClick(Sender: TObject);
begin
  if frmIAEProduto = Nil then
    frmIAEProduto := TfrmIAEProduto.Create(Self);
  frmIAEProduto.sOpr := 'INP';
  frmProduto.Visible := False;
  frmIAEProduto.ShowModal;
  frmProduto.Visible := True;
  stpPsqProduto.Close;
  stpPsqProduto.Open;
end;



procedure TfrmProduto.imgPsqClick(Sender: TObject);
begin
  stpPsqProduto.Close;
  stpPsqProduto.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
  stpPsqProduto.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;

  if edtPsqCodPro.Text <> '' then
    stpPsqProduto.Parameters.ParamByName('@id_Codigo_Pro').Value    := StrToInt(edtPsqCodPro.Text)
  else
    stpPsqProduto.Parameters.ParamByName('@id_Codigo_Pro').Value    := Null;

  if edtPsqDescPro.Text <> '' then
    stpPsqProduto.Parameters.ParamByName('@ds_Descricao_Pro').Value := edtPsqDescPro.Text
  else
    stpPsqProduto.Parameters.ParamByName('@ds_Descricao_Pro').Value := Null;

  if edtPsqCodBarPro.Text <> '' then
    stpPsqProduto.Parameters.ParamByName('@ds_CodBarra_Pro').Value  := edtPsqCodBarPro.Text
  else
    stpPsqProduto.Parameters.ParamByName('@ds_CodBarra_Pro').Value  := Null;

  stpPsqProduto.Open;  
end;



procedure TfrmProduto.lblPsqClick(Sender: TObject);
begin
  edtPsqCodPro.Text    := '';
  edtPsqCodBarPro.Text := '';
  edtPsqDescPro.Text   := '';
  imgPsqClick(self);
end;



procedure TfrmProduto.stpPsqProdutoAfterScroll(DataSet: TDataSet);
begin
  lblNumReg.Caption := inttostr(stpPsqProduto.RecordCount);
  label5.Left := lblNumReg.Left - label5.width - 4;
end;



procedure TfrmProduto.grdPsqProdutoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
begin
  if grdPsqProduto.DataSource = dtsPesqProduto then begin
    if not odd(stpPsqProduto.RecNo) then begin
      if not (gdSelected in State) then begin
        grdPsqProduto.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdPsqProduto.Canvas.FillRect(Rect);
        grdPsqProduto.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;
end;



procedure TfrmProduto.FormShow(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Cadastro de produtos').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    PostMessage(frmProduto.Handle, WM_CLOSE, 0, 0)
  end;

  if not(frmMain.stpPermissao.FieldByName('Visualizar valores').AsBoolean) then begin
    grdPsqProduto.Columns.Items[5].Visible := False;
  end else begin
    grdPsqProduto.Columns.Items[5].Visible := True;
  end;

  iProduto := 0;
end;

procedure TfrmProduto.edtPsqCodProKeyPress(Sender: TObject; var Key: Char);
begin
  if not EDITCOD(Key) then
    key := #0;
end;

procedure TfrmProduto.stpPsqProdutoVlCompraGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := FormatFloat('0.00',sender.AsFloat);
end;

procedure TfrmProduto.stpPsqProdutoVlVendaGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := FormatFloat('0.00',sender.AsFloat);
end;

end.
