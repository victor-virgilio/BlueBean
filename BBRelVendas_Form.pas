unit BBRelVendas_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls;

type
  TfrmRelVendas = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    grdVenda: TDBGrid;
    Button1: TButton;
    dtpIni: TDateTimePicker;
    cbbTipoRel: TComboBox;
    dtpFin: TDateTimePicker;
    stpRelVenda: TADOStoredProc;
    dtsRelVenda: TDataSource;
    stpRelVenda2: TADOStoredProc;
    stpRelVenda2Venda: TIntegerField;
    stpRelVenda2Status: TStringField;
    stpRelVenda2Prod: TIntegerField;
    stpRelVenda2Descrio: TStringField;
    stpRelVenda2Qtd: TBCDField;
    stpRelVenda2VlUnit: TBCDField;
    stpRelVenda2VlTot: TBCDField;
    stpRelVenda2DtHr: TDateTimeField;
    stpRelVenda2Usurio: TStringField;
    dtsRelVenda2: TDataSource;
    grdVendaProduto: TDBGrid;
    Button2: TButton;
    stpRelVendaDesc: TStringField;
    stpRelVendaNVendas: TIntegerField;
    stpRelVendaVolumes: TBCDField;
    stpRelVendaVlVenda: TBCDField;
    stpRelVendaVlCusto: TBCDField;
    stpRelVendaVlLucro: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdVendaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure cbbTipoRelChange(Sender: TObject);
    procedure grdVendaProdutoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dtpFinChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, Login_Form, LoginMsg_Form,
  MsgMain, SICK013;

{$R *.dfm}

procedure TfrmRelVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmRelVendas.FormDestroy(Sender: TObject);
begin
  frmRelVendas := NIl;
end;

procedure TfrmRelVendas.FormShow(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Controle de relatórios').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    PostMessage(frmRelVendas.Handle, WM_CLOSE, 0, 0)
  end;


  if not(frmMain.stpPermissao.FieldByName('Visualizar valores').AsBoolean) then begin
    grdVenda.Columns.Items[4].Visible := False;
    grdVenda.Columns.Items[5].Visible := False;
  end else begin
    grdVenda.Columns.Items[4].Visible := True;
    grdVenda.Columns.Items[5].Visible := True;
  end;

  cbbTipoRel.ItemIndex := 0;
  dtpIni.Date := Now;
  dtpFin.Date := Now;
end;

procedure TfrmRelVendas.grdVendaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  R: TRect;
begin
  IF grdVenda.DATASOURCE = dtsRelVenda THEN BEGIN
    IF NOT odd(stpRelVenda.RecNo) THEN BEGIN
      IF NOT (gdSelected in State) THEN BEGIN
        grdVenda.Canvas.Brush.Color := windows.RGB(230,230,255);
        grdVenda.Canvas.FillRect(Rect);
        grdVenda.DefaultDrawDataCell(rect,Column.Field,state);
      END;
      R := Rect;
      Dec(R.Bottom,2);
    END;
  END;
end;

procedure TfrmRelVendas.Button1Click(Sender: TObject);
begin
  if cbbTipoRel.ItemIndex < 3 then begin
    stpRelVenda.Close;
    if cbbTipoRel.ItemIndex = 0 then
      stpRelVenda.Parameters.ParamByName('@OPR').Value := 'VPU';

    if cbbTipoRel.ItemIndex = 1 then
      stpRelVenda.Parameters.ParamByName('@OPR').Value := 'VPS';

    if cbbTipoRel.ItemIndex = 2 then
      stpRelVenda.Parameters.ParamByName('@OPR').Value := 'VFP';

    stpRelVenda.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
    stpRelVenda.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;

    stpRelVenda.Parameters.ParamByName('@dtIni').Value := dtpIni.Date;
    stpRelVenda.Parameters.ParamByName('@dtFin').Value := dtpFin.Date;
    stpRelVenda.Open;
  end else begin
    stpRelVenda2.Close;
    stpRelVenda2.Parameters.ParamByName('@OPR').Value           := 'VPR';
    stpRelVenda2.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
    stpRelVenda2.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;

    stpRelVenda2.Parameters.ParamByName('@dtIni').Value := dtpIni.Date;
    stpRelVenda2.Parameters.ParamByName('@dtFin').Value := dtpFin.Date;
    stpRelVenda2.Open;
  end;
end;

procedure TfrmRelVendas.cbbTipoRelChange(Sender: TObject);
begin
  stpRelVenda.Active  := False;
  stpRelVenda2.Active := False;

  if cbbTipoRel.ItemIndex < 3 then begin
    grdVenda.Visible        := True;
    grdVendaProduto.Visible := False;
  end else begin
    grdVenda.Visible        := False;
    grdVendaProduto.Visible := True;
  end;
end;

procedure TfrmRelVendas.grdVendaProdutoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  R: TRect;
begin
  IF grdVendaProduto.DATASOURCE = dtsRelVenda2 THEN BEGIN
    IF NOT odd(stpRelVenda2.RecNo) THEN BEGIN
      IF NOT (gdSelected in State) THEN BEGIN
        grdVendaProduto.Canvas.Brush.Color := windows.RGB(230,230,255);
        grdVendaProduto.Canvas.FillRect(Rect);
        grdVendaProduto.DefaultDrawDataCell(rect,Column.Field,state);
      END;
      R := Rect;
      Dec(R.Bottom,2);
    END;
  END;
end;

procedure TfrmRelVendas.dtpFinChange(Sender: TObject);
begin
  stpRelVenda.Active  := False;
  stpRelVenda2.Active := False;
end;

end.
