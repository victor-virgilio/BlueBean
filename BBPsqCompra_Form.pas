unit BBPsqCompra_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Menus, StdCtrls, ComCtrls, Buttons, Grids, DBGrids,
  ExtCtrls;

type
  TfrmPsqCompra = class(TForm)
    Label5: TLabel;
    lblNumReg: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    imgPsq: TImage;
    Label3: TLabel;
    Label4: TLabel;
    grdPsqCom: TDBGrid;
    BitBtn1: TBitBtn;
    cbbStatus: TComboBox;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    edtFornecedor: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    pop1: TPopupMenu;
    Selecionarcadastrodepessoa1: TMenuItem;
    dtsPsqCom: TDataSource;
    stpPsqCom: TADOStoredProc;
    Label7: TLabel;
    edtComprador: TEdit;
    BitBtn5: TBitBtn;
    Label6: TLabel;
    stpPsqComCupom: TIntegerField;
    stpPsqComData: TDateTimeField;
    stpPsqComStatus: TStringField;
    stpPsqComCdForn: TIntegerField;
    stpPsqComFormaPagto: TStringField;
    stpPsqComFornecedor: TStringField;
    stpPsqComCdComprador: TIntegerField;
    stpPsqComComprador: TStringField;
    stpPsqComVol: TBCDField;
    stpPsqComValor: TBCDField;
    stpPsqComDesconto: TBCDField;
    stpPsqComTotal: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure imgPsqClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Selecionarcadastrodepessoa1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure grdPsqComDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPsqCompra: TfrmPsqCompra;

implementation

uses Alert_Form, AlertMsg_Form, BBCompra_Form, BBMain_Form, BBPessoa_Form,
  Login_Form, LoginMsg_Form, MsgMain, SICK013;

{$R *.dfm}

procedure TfrmPsqCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmPsqCompra.FormDestroy(Sender: TObject);
begin
  frmPsqCompra := Nil;
end;



procedure TfrmPsqCompra.imgPsqClick(Sender: TObject);
begin
  stpPsqCom.Close;
  stpPsqCom.Parameters.ParamByName('@id_Codigo_Org').Value  := frmMain.iOrg;
  stpPsqCom.Parameters.ParamByName('@id_Codigo_Fil').Value  := frmMain.iFil;
  stpPsqCom.Parameters.ParamByName('@id_Codigo_Com').Value  := Null;


  if edtFornecedor.Text <> '' then
    stpPsqCom.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Copy(edtFornecedor.Text,1,pos(edtFornecedor.Text,' -')-1)
  else
    stpPsqCom.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Null;


  if edtComprador.Text <> '' then
    stpPsqCom.Parameters.ParamByName('@id_Comprador_Pes').Value := Copy(edtComprador.Text,1,pos(edtComprador.Text,' -')-1)
  else
    stpPsqCom.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Null;


  if cbbStatus.ItemIndex <> 0 then
    stpPsqCom.Parameters.ParamByName('@cd_Status_Com').Value  := copy(cbbStatus.Text,1,3)
  else
    stpPsqCom.Parameters.ParamByName('@cd_Status_Com').Value  := Null;

  stpPsqCom.Parameters.ParamByName('@dtInicial').Value := dtpInicial.Date;
  stpPsqCom.Parameters.ParamByName('@dtFinal').Value   := dtpFinal.Date;
  stpPsqCom.Open;
end;



procedure TfrmPsqCompra.FormShow(Sender: TObject);
begin
  dtpInicial.Date := Now - 30;
  dtpFinal.Date   := Now;
  imgPsqClick(Self);
end;



procedure TfrmPsqCompra.Selecionarcadastrodepessoa1Click(Sender: TObject);
begin
  frmMain.iCompra := stpPsqCom.Fields.FieldByName('Cupom').AsInteger;
  Close;
end;



procedure TfrmPsqCompra.BitBtn2Click(Sender: TObject);
begin
  frmMain.iPessoa := 0;
  frmMain.sPessoa := '0';

  if frmPessoa = Nil then
    frmPessoa := TfrmPessoa.Create(Self);

  frmPessoa.ShowModal;

  if frmMain.iPessoa <> 0 then begin
    edtFornecedor.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;
  end else begin
    edtFornecedor.Text := '';
  end;
end;



procedure TfrmPsqCompra.BitBtn5Click(Sender: TObject);
begin
  frmMain.iPessoa := 0;
  frmMain.sPessoa := '0';

  if frmPessoa = Nil then
    frmPessoa := TfrmPessoa.Create(Self);

  frmPessoa.ShowModal;

  if frmMain.iPessoa <> 0 then begin
    edtComprador.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;
  end else begin
    edtComprador.Text := '';
  end;
end;



procedure TfrmPsqCompra.BitBtn4Click(Sender: TObject);
begin
 frmMain.iCompra := 0;
 Close;
end;



procedure TfrmPsqCompra.grdPsqComDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
begin
  if grdPsqCom.DataSource = dtsPsqCom then begin
    if not odd(stpPsqCom.RecNo) then begin
      if not (gdSelected in State) then begin
        grdPsqCom.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdPsqCom.Canvas.FillRect(Rect);
        grdPsqCom.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;
end;
end.
