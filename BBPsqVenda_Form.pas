unit BBPsqVenda_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB, ADODB, Menus, Buttons, Grids,
  DBGrids;

type
  TfrmPsqVenda = class(TForm)
    Label5: TLabel;
    lblNumReg: TLabel;
    grdPsqVen: TDBGrid;
    BitBtn1: TBitBtn;
    pop1: TPopupMenu;
    Selecionarcadastrodepessoa1: TMenuItem;
    dtsPsqVen: TDataSource;
    stpPsqVen: TADOStoredProc;
    Shape1: TShape;
    cbbStatus: TComboBox;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    imgPsq: TImage;
    Label3: TLabel;
    edtCliente: TEdit;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    stpPsqVenCupom: TIntegerField;
    stpPsqVenData: TDateTimeField;
    stpPsqVenStatus: TStringField;
    stpPsqVenCdCliente: TIntegerField;
    stpPsqVenCliente: TStringField;
    stpPsqVenVol: TBCDField;
    stpPsqVenValor: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure imgPsqClick(Sender: TObject);
    procedure Selecionarcadastrodepessoa1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stpPsqVenValorGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure grdPsqVenDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPsqVenda: TfrmPsqVenda;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, BBVenda_Form, Login_Form,
  LoginMsg_Form, SICK013, BBPessoa_Form;

{$R *.dfm}

procedure TfrmPsqVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmPsqVenda.FormDestroy(Sender: TObject);
begin
  frmPsqVenda := Nil;
end;



procedure TfrmPsqVenda.imgPsqClick(Sender: TObject);
begin
  stpPsqVen.Close;
  stpPsqVen.Parameters.ParamByName('@id_Codigo_Org').Value  := frmMain.iOrg;
  stpPsqVen.Parameters.ParamByName('@id_Codigo_Fil').Value  := frmMain.iFil;

  if frmMain.iPessoa <> 0 then
    stpPsqVen.Parameters.ParamByName('@id_Cliente_Pes').Value := frmMain.iPessoa
  else
    stpPsqVen.Parameters.ParamByName('@id_Cliente_Pes').Value := Null;

  if cbbStatus.ItemIndex <> 0 then
    stpPsqVen.Parameters.ParamByName('@cd_Status_Ven').Value  := copy(cbbStatus.Text,1,3)
  else
    stpPsqVen.Parameters.ParamByName('@cd_Status_Ven').Value  := Null;

  stpPsqVen.Parameters.ParamByName('@dtInicial').Value := dtpInicial.Date;
  stpPsqVen.Parameters.ParamByName('@dtFinal').Value   := dtpFinal.Date;
  stpPsqVen.Open;
end;



procedure TfrmPsqVenda.Selecionarcadastrodepessoa1Click(Sender: TObject);
begin
  frmMain.iVenda  := stpPsqVen.Fields.FieldByName('Cupom').AsInteger;
  frmMain.iPessoa := stpPsqVen.Fields.FieldByName('Cód Cliente').AsInteger;
  frmMain.sPessoa := stpPsqVen.Fields.FieldByName('Cliente').AsString;
  Close;
end;



procedure TfrmPsqVenda.FormShow(Sender: TObject);
begin
  dtpInicial.Date := Now - 30;
  dtpFinal.Date   := Now;
  imgPsqClick(Self);
end;



procedure TfrmPsqVenda.stpPsqVenValorGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := FormatFloat('0.00',sender.AsFloat);
end;



procedure TfrmPsqVenda.BitBtn2Click(Sender: TObject);
begin
  frmMain.iPessoa := 0;
  frmMain.sPessoa := '0';

  if frmPessoa = Nil then
    frmPessoa := TfrmPessoa.Create(Self);

  frmPessoa.ShowModal;

  if frmMain.iPessoa <> 0 then begin
    edtCliente.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;
  end else begin
    edtCliente.Text := '';
  end;
end;



procedure TfrmPsqVenda.BitBtn4Click(Sender: TObject);
begin
  Close;
end;



procedure TfrmPsqVenda.grdPsqVenDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
begin
  if grdPsqVen.DataSource = dtsPsqVen then begin
    if not odd(stpPsqVen.RecNo) then begin
      if not (gdSelected in State) then begin
        grdPsqVen.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdPsqVen.Canvas.FillRect(Rect);
        grdPsqVen.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;
end;

end.
