unit BBRelCompras_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls;

type
  TfrmRelCompras = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    grdCompra: TDBGrid;
    Button1: TButton;
    dtpIni: TDateTimePicker;
    cbbTipoRel: TComboBox;
    dtpFin: TDateTimePicker;
    grdCompraProduto: TDBGrid;
    stpRelCompra: TADOStoredProc;
    dtsRelCompra: TDataSource;
    stpRelCompra2: TADOStoredProc;
    dtsRelCompra2: TDataSource;
    Button2: TButton;
    Shape1: TShape;
    stpRelCompraDesc: TStringField;
    stpRelCompraNCompras: TIntegerField;
    stpRelCompraVolumes: TBCDField;
    stpRelCompraVlCompras: TBCDField;
    stpRelCompraVlDesconto: TBCDField;
    stpRelCompra2Compra: TIntegerField;
    stpRelCompra2Status: TStringField;
    stpRelCompra2Prod: TIntegerField;
    stpRelCompra2Descrio: TStringField;
    stpRelCompra2Qtd: TBCDField;
    stpRelCompra2VlUnit: TBCDField;
    stpRelCompra2VlTot: TBCDField;
    stpRelCompra2DtHr: TDateTimeField;
    stpRelCompra2Usurio: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdCompraDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure cbbTipoRelChange(Sender: TObject);
    procedure grdCompraProdutoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dtpIniChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCompras: TfrmRelCompras;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, Login_Form, LoginMsg_Form,
  MsgMain, SICK013;

{$R *.dfm}

procedure TfrmRelCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmRelCompras.FormDestroy(Sender: TObject);
begin
  frmRelCompras := Nil;
end;



procedure TfrmRelCompras.FormShow(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Controle de relatórios').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    PostMessage(frmRelCompras.Handle, WM_CLOSE, 0, 0)
  end;

  cbbTipoRel.ItemIndex := 0;
  dtpIni.Date := Now;
  dtpFin.Date := Now;
end;



procedure TfrmRelCompras.grdCompraDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  R: TRect;
begin
  IF grdCompra.DATASOURCE = dtsRelCompra THEN BEGIN
    IF NOT odd(stpRelCompra.RecNo) THEN BEGIN
      IF NOT (gdSelected in State) THEN BEGIN
        grdCompra.Canvas.Brush.Color := windows.RGB(230,230,255);
        grdCompra.Canvas.FillRect(Rect);
        grdCompra.DefaultDrawDataCell(rect,Column.Field,state);
      END;
      R := Rect;
      Dec(R.Bottom,2);
    END;
  END;
end;

procedure TfrmRelCompras.Button1Click(Sender: TObject);
begin
  if cbbTipoRel.ItemIndex < 5 then begin
    stpRelCompra.Close;
    if cbbTipoRel.ItemIndex = 0 then
      stpRelCompra.Parameters.ParamByName('@OPR').Value := 'CPU';

    if cbbTipoRel.ItemIndex = 1 then
      stpRelCompra.Parameters.ParamByName('@OPR').Value := 'CPS';

    if cbbTipoRel.ItemIndex = 2 then
      stpRelCompra.Parameters.ParamByName('@OPR').Value := 'CFP';

    if cbbTipoRel.ItemIndex = 3 then
      stpRelCompra.Parameters.ParamByName('@OPR').Value := 'CPC';

    if cbbTipoRel.ItemIndex = 4 then
      stpRelCompra.Parameters.ParamByName('@OPR').Value := 'CPF';



    stpRelCompra.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
    stpRelCompra.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;

    stpRelCompra.Parameters.ParamByName('@dtIni').Value := dtpIni.Date;
    stpRelCompra.Parameters.ParamByName('@dtFin').Value := dtpFin.Date;
    stpRelCompra.Open;
  end else begin
    stpRelCompra2.Close;
    stpRelCompra2.Parameters.ParamByName('@OPR').Value           := 'CPR';
    stpRelCompra2.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
    stpRelCompra2.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;

    stpRelCompra2.Parameters.ParamByName('@dtIni').Value := dtpIni.Date;
    stpRelCompra2.Parameters.ParamByName('@dtFin').Value := dtpFin.Date;
    stpRelCompra2.Open;
  end;
end;



procedure TfrmRelCompras.cbbTipoRelChange(Sender: TObject);
begin
  stpRelCompra.Active  := False;
  stpRelCompra2.Active := False;

  if cbbTipoRel.ItemIndex < 5 then begin
    grdCompra.Visible        := True;
    grdCompraProduto.Visible := False;
  end else begin
    grdCompra.Visible        := False;
    grdCompraProduto.Visible := True;
  end;

  if cbbTipoRel.ItemIndex = 1 then begin
    grdCompra.Columns[4].Visible := False
  end else begin
    grdCompra.Columns[4].Visible := True
  end;
end;



procedure TfrmRelCompras.grdCompraProdutoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  R: TRect;
begin
  IF grdCompraProduto.DATASOURCE = dtsRelCompra2 THEN BEGIN
    IF NOT odd(stpRelCompra2.RecNo) THEN BEGIN
      IF NOT (gdSelected in State) THEN BEGIN
        grdCompraProduto.Canvas.Brush.Color := windows.RGB(230,230,255);
        grdCompraProduto.Canvas.FillRect(Rect);
        grdCompraProduto.DefaultDrawDataCell(rect,Column.Field,state);
      END;
      R := Rect;
      Dec(R.Bottom,2);
    END;
  END;
end;

procedure TfrmRelCompras.dtpIniChange(Sender: TObject);
begin
  stpRelCompra.Active  := False;
  stpRelCompra2.Active := False;
end;

end.
