unit BBMain_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, XPMan, ExtCtrls, Buttons, jpeg, Grids,
  DBGrids, Menus;

type
  TfrmMain = class(TForm)
    ADOConnection1: TADOConnection;
    XPManifest1: TXPManifest;
    btnSecao: TButton;
    ImgAlt16: TImage;
    ImgExc16: TImage;
    ImgInc16: TImage;
    Shape1: TShape;
    imgUsuario: TImage;
    Shape2: TShape;
    lblUsuario: TLabel;
    Image2: TImage;
    Shape3: TShape;
    pnlControle: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    pnlTampa: TPanel;
    stpPsqUsuario: TADOStoredProc;
    stpPsqUsuarioCd: TIntegerField;
    stpPsqUsuarioUsurio: TStringField;
    stpPsqUsuarioMaster: TBooleanField;
    stpPsqUsuariods_Senha_Usu: TStringField;
    stpPsqUsuariods_Lembrete_Usu: TStringField;
    stpPsqUsuarioPessoa: TStringField;
    stpPsqUsuariods_Imagem_Pes: TStringField;
    BitBtn8: TBitBtn;
    stpPermissao: TADOStoredProc;
    popRelatorio: TPopupMenu;
    Relatriodevendas1: TMenuItem;
    Relatriodecompras1: TMenuItem;
    stpAutentica: TADOStoredProc;
    stpAutenticadt_UltimaOperacao_Aut: TDateTimeField;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    BitBtn10: TBitBtn;
    stpSitCaixa: TADOStoredProc;
    stpAutenticadt_Validacao_Aut: TDateTimeField;
    stpAutenticaqt_Periodo_Aut: TIntegerField;
    Sugestodecompra1: TMenuItem;
    procedure btnSecaoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Relatriodevendas1Click(Sender: TObject);
    procedure Relatriodecompras1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Sugestodecompra1Click(Sender: TObject);
  private
    { Private declarations }
  public
    iOrg, iFil, iUsu   : Integer;
    iPessoa  : integer;
    iVenda, iCompra     : integer;

    sPessoa, sUsu, sCaixa : String;
  end;

var
  frmMain: TfrmMain;

implementation

uses SICK013, Alert_Form, AlertMsg_Form, BBIAEPessoa_Form, BBPessoa_Form,
  Login_Form, LoginMsg_Form, BBIAEEndereco_Form, BBIAEContato_Form,
  BBIAEProduto_Form, BBProduto_Form, BBIAEFormaPagto_Form, BBVenda_Form,
  BBCompra_Form, MsgMain, BBEstoqueProduto_Form, BBRelVendas_Form,
  BBIAEUsuario_Form, BBBackup_Form, BBRelCompras_Form, BBFluxoCaixa_Form,
  BBListaCompra_Form;

{$R *.dfm}

procedure TfrmMain.btnSecaoClick(Sender: TObject);
begin
   stpAutentica.Close;
   stpAutentica.Open;

   if stpAutenticadt_UltimaOperacao_Aut.AsDateTime > now then begin
     ALERTMSG('FALHA NO SISTEMA','A data do computador está incorreta, favor acertar o horário no relógio do windows e depois tentar iniciar a seção novamente.',false);
     exit;
     frmMain.Close;
   end;

   if stpAutenticadt_Validacao_Aut.Value + stpAutenticaqt_Periodo_Aut.Value < now then begin
     ALERTMSG('FALHA NO SISTEMA','Houve um problema com a autenticação, FAVOR ENTRAR EM CONTATO COM O ADMINISTRADOR DO SISTEMA.',false);
     exit;
     frmMain.Close;
   end;

  if pnlControle.Enabled then begin
    pnlControle.Enabled := False;
    pnlTampa.Left := pnlControle.Left;
    pnlTampa.Top  := pnlControle.Top;
    btnSecao.Caption := '&Iniciar seção';
    lblUsuario.Caption := 'Usuário';
    lblUsuario.Width := 145;
    iUsu := 0;
    imgUsuario.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\PicPes\FotoDefault.bmp');

    stpPermissao.Close;
    stpPermissao.Parameters.ParamByName('@sOpr').Value                 := 'SPR';
    stpPermissao.Parameters.ParamByName('@id_Codigo_Org').Value        := frmMain.iOrg;
    stpPermissao.Parameters.ParamByName('@id_Codigo_Fil').Value        := frmMain.iFil;
    stpPermissao.Parameters.ParamByName('@id_Codigo_Usu').Value        := stpPsqUsuario.Fields.FieldByName('Cód').AsInteger;
    stpPermissao.Parameters.ParamByName('@fl_IncProduto_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltProduto_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcProduto_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncDepto_UPr').Value      := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltDepto_UPr').Value      := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcDepto_UPr').Value      := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncUnid_UPr').Value       := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltUnid_UPr').Value       := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcUnid_UPr').Value       := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncPessoa_UPr').Value     := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltPessoa_UPr').Value     := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcPessoa_UPr').Value     := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncEndereco_UPr').Value   := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltEndereco_UPr').Value   := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcEndereco_UPr').Value   := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncContato_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltContato_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcContato_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncEstqoue_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltEstoque_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcEstoque_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncUsuario_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltUsuario_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcUsuario_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_Venda_UPr').Value         := Null;
    stpPermissao.Parameters.ParamByName('@fl_Compra_UPr').Value        := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncFormaPagto_UPr').Value := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltFormaPagto_UPr').Value := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcFormaPagto_UPr').Value := Null;
    stpPermissao.Parameters.ParamByName('@fl_Relatorio_UPr').Value     := Null;
    stpPermissao.Parameters.ParamByName('@fl_Estoque_UPr').Value       := Null;
    stpPermissao.Parameters.ParamByName('@fl_Pessoa_UPr').Value        := Null;
    stpPermissao.Parameters.ParamByName('@fl_Produto_UPr').Value       := Null;
    stpPermissao.Parameters.ParamByName('@fl_Usuario_UPr').Value       := Null;
    stpPermissao.Parameters.ParamByName('@fl_VisuValor_UPr').Value     := Null;
    stpPermissao.Parameters.ParamByName('@id_Alteracao_Usu').Value     := Null;
    stpPermissao.Open;
    exit;
  end;

  if PopLogin('Login para iniciar o sistema') then begin
    pnlControle.Enabled := True;
    pnlTampa.Left := 10000;
    pnlTampa.Top  := 10000;
    btnSecao.Caption := '&Encerrar seção';
    lblUsuario.Caption := sUsu;
    lblUsuario.Width := 145;
    stpPsqUsuario.Close;
    stpPsqUsuario.Parameters.ParamByName('@id_Codigo_Usu').Value := iUsu;
    stpPsqUsuario.Open;

    if FileExists(ExtractFilePath(Application.ExeName) + '\PicPes\' + stpPsqUsuario.FieldByName('ds_Imagem_Pes').AsString) then
      imgUsuario.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\PicPes\' + stpPsqUsuario.FieldByName('ds_Imagem_Pes').AsString);

    stpPermissao.Close;
    stpPermissao.Parameters.ParamByName('@sOpr').Value                 := 'SPR';
    stpPermissao.Parameters.ParamByName('@id_Codigo_Org').Value        := frmMain.iOrg;
    stpPermissao.Parameters.ParamByName('@id_Codigo_Fil').Value        := frmMain.iFil;
    stpPermissao.Parameters.ParamByName('@id_Codigo_Usu').Value        := stpPsqUsuario.Fields.FieldByName('Cód').AsInteger;
    stpPermissao.Parameters.ParamByName('@fl_IncProduto_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltProduto_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcProduto_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncDepto_UPr').Value      := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltDepto_UPr').Value      := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcDepto_UPr').Value      := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncUnid_UPr').Value       := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltUnid_UPr').Value       := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcUnid_UPr').Value       := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncPessoa_UPr').Value     := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltPessoa_UPr').Value     := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcPessoa_UPr').Value     := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncEndereco_UPr').Value   := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltEndereco_UPr').Value   := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcEndereco_UPr').Value   := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncContato_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltContato_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcContato_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncEstqoue_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltEstoque_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcEstoque_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncUsuario_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltUsuario_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcUsuario_UPr').Value    := Null;
    stpPermissao.Parameters.ParamByName('@fl_Venda_UPr').Value         := Null;
    stpPermissao.Parameters.ParamByName('@fl_Compra_UPr').Value        := Null;
    stpPermissao.Parameters.ParamByName('@fl_IncFormaPagto_UPr').Value := Null;
    stpPermissao.Parameters.ParamByName('@fl_AltFormaPagto_UPr').Value := Null;
    stpPermissao.Parameters.ParamByName('@fl_ExcFormaPagto_UPr').Value := Null;
    stpPermissao.Parameters.ParamByName('@fl_Relatorio_UPr').Value     := Null;
    stpPermissao.Parameters.ParamByName('@fl_VisuValor_UPr').Value     := Null;
    stpPermissao.Parameters.ParamByName('@fl_RotinaCaixa_UPr').Value   := Null;
    stpPermissao.Parameters.ParamByName('@fl_Estoque_UPr').Value       := Null;
    stpPermissao.Parameters.ParamByName('@id_Alteracao_Usu').Value     := Null;
    stpPermissao.Open;

    stpSitCaixa.Close;
    stpSitCaixa.Parameters.ParamByName('@sOpr').Value          := 'VSC';
    stpSitCaixa.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
    stpSitCaixa.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
    stpSitCaixa.Parameters.ParamByName('@cd_AF_StC').Value     := Null;
    stpSitCaixa.Parameters.ParamByName('@vl_Caixa_StC').Value  := Null;
    stpSitCaixa.Parameters.ParamByName('@id_Codigo_Pes').Value := Null;
    stpSitCaixa.Parameters.ParamByName('@id_Codigo_Usu').Value := Null;
    stpSitCaixa.Parameters.ParamByName('@dtIni').Value         := Null;
    stpSitCaixa.Parameters.ParamByName('@dtFin').Value         := null;
    stpSitCaixa.open;
  end else begin
    pnlControle.Enabled := False;
    pnlTampa.Left := pnlControle.Left;
    pnlTampa.Top  := pnlControle.Top;
    btnSecao.Caption := '&Iniciar seção';
    lblUsuario.Caption := 'Usuário';
    lblUsuario.Width := 145;
    iUsu := 0;
    imgUsuario.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\PicPes\FotoDefault.bmp');
  end;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  if frmProduto = nil then
    frmProduto := TfrmProduto.Create(Self);

  frmProduto.ShowModal;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin

  if frmPessoa = Nil then
    frmPessoa := TfrmPessoa.Create(Self);

  frmPessoa.ShowModal;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  iOrg := 101;
  iFil := 101;
  iUsu := 0;
  lblUsuario.Width := 145;
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
  if frmIAEUsuario = nil then
    frmIAEUsuario := TfrmIAEUsuario.Create(Self);

  frmIAEUsuario.bReiniciaTela := True;
  frmIAEUsuario.ShowModal;
end;

procedure TfrmMain.BitBtn4Click(Sender: TObject);
begin
  if frmVenda = Nil then
    frmVenda := TfrmVenda.Create(Self);

  frmVenda.ShowModal;
end;


procedure TfrmMain.BitBtn5Click(Sender: TObject);
begin
  if frmCompra = Nil then
    frmCompra := TfrmCompra.Create(Self);

  frmCompra.ShowModal;
end;

procedure TfrmMain.BitBtn6Click(Sender: TObject);
begin
  if frmEstoqueProduto = NIl then
    frmEstoqueProduto := TfrmEstoqueProduto.Create(Self);

  frmEstoqueProduto.ShowModal;
end;

procedure TfrmMain.BitBtn7Click(Sender: TObject);
begin
  popRelatorio.Popup(frmMain.Left + BitBtn7.Left - BitBtn7.Width + 270,frmMain.Top + BitBtn7.Top + BitBtn7.Height + 220);
end;

procedure TfrmMain.BitBtn8Click(Sender: TObject);
begin
  if frmBackup = NIl then
    frmBackup := TfrmBackup.Create(Self);

  frmBackup.ShowModal;
end;

procedure TfrmMain.Relatriodevendas1Click(Sender: TObject);
begin
  if frmRelVendas = Nil then
    frmRelVendas := TfrmRelVendas.Create(Self);

  frmRelVendas.ShowModal;
end;

procedure TfrmMain.Relatriodecompras1Click(Sender: TObject);
begin
  if frmRelCompras = Nil then
    frmRelCompras := TfrmRelCompras.Create(Self);

  frmRelCompras.ShowModal;
end;

procedure TfrmMain.BitBtn9Click(Sender: TObject);
begin
  if frmFluxoCaixa = nil then
    frmFluxoCaixa := TfrmFluxoCaixa.Create(Self);

  frmFluxoCaixa.ShowModal;
end;

procedure TfrmMain.Sugestodecompra1Click(Sender: TObject);
begin
  if frmListaCompra = Nil then
    frmListaCompra := TfrmListaCompra.Create(Self);

  frmListaCompra.ShowModal;
end;

end.
