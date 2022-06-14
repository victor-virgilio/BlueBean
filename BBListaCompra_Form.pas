unit BBListaCompra_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ExtCtrls, RpCon, RpConDS,
  RpDefine, RpRave;

type
  TfrmListaCompra = class(TForm)
    Shape3: TShape;
    btnGeraLista: TButton;
    btnImprime: TButton;
    grdListaCompra: TDBGrid;
    Label1: TLabel;
    stpListaCompra: TADOStoredProc;
    dtsListaCompra: TDataSource;
    stpListaCompraCd: TIntegerField;
    stpListaCompraProduto: TStringField;
    stpListaCompraEstAtual: TBCDField;
    stpListaCompraUnidade: TStringField;
    stpListaCompraData: TDateTimeField;
    stpListaCompraComprador: TStringField;
    stpListaCompraFornecedor: TStringField;
    stpListaCompraValor: TBCDField;
    stpListaCompraEstMn: TIntegerField;
    stpListaCompraQtd: TBCDField;
    Shape1: TShape;
    Label2: TLabel;
    RvListaCompra: TRvProject;
    RVDTSListaCompra: TRvDataSetConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnGeraListaClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaCompra: TfrmListaCompra;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, SICK013;

{$R *.dfm}

procedure TfrmListaCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmListaCompra.FormDestroy(Sender: TObject);
begin
  frmListaCompra := Nil;
end;

procedure TfrmListaCompra.btnGeraListaClick(Sender: TObject);
begin
  stpListaCompra.Close;
  stpListaCompra.Parameters.ParamByName('@id_COdigo_Org').Value := frmMain.iOrg;
  stpListaCompra.Parameters.ParamByName('@id_COdigo_Fil').Value := frmMain.iFil;
  stpListaCompra.Open;
end;

procedure TfrmListaCompra.btnImprimeClick(Sender: TObject);
begin
  if stpListaCompra.Active = False then begin
    ALERTMSG('Erro','É necessário gerar a lista antes de imprimí-la.',false);
    btnGeraLista.SetFocus;
    exit;
  end;

  RvListaCompra.Execute;
end;

end.
