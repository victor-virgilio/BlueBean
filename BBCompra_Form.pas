unit BBCompra_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, ComCtrls,
  Menus;

type
  TfrmCompra = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Label8: TLabel;
    edtDescUsu: TEdit;
    edtCodCom: TEdit;
    edtSubTotal: TEdit;
    edtDesconto: TEdit;
    edtTotPago: TEdit;
    cbbFormaPagto: TComboBox;
    edtComprador: TEdit;
    edtFornecedor: TEdit;
    edtQtdItens: TEdit;
    Shape4: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    grdCompra: TDBGrid;
    edtCodPro: TEdit;
    edtQtdPro: TEdit;
    btnFinalizar: TBitBtn;
    btnOpc: TBitBtn;
    rbtCodBarra: TRadioButton;
    rbtCodPro: TRadioButton;
    Label10: TLabel;
    edtVlPro: TEdit;
    Label11: TLabel;
    edtTotPro: TEdit;
    Label12: TLabel;
    btnIncItem: TBitBtn;
    stpFormaPagto: TADOStoredProc;
    cbbCodFPg: TComboBox;
    stpCompra: TADOStoredProc;
    Label13: TLabel;
    dtpCompra: TDateTimePicker;
    stpProduto: TADOStoredProc;
    edtDescPro: TEdit;
    PopOpc: TPopupMenu;
    SelecionarFornecedor1: TMenuItem;
    Abrirvendacongelada1: TMenuItem;
    N2: TMenuItem;
    SelecionarComprador1: TMenuItem;
    dtsItens: TDataSource;
    stpCompraItem: TADOStoredProc;
    stpTotais: TADOStoredProc;
    stpCompraItemCdPro: TIntegerField;
    stpCompraItemDescrio: TStringField;
    stpCompraItemQtd: TBCDField;
    stpCompraItemUnidade: TStringField;
    stpCompraItemVlUnit: TBCDField;
    stpCompraItemVlTotal: TBCDField;
    Label14: TLabel;
    edtEstoque: TEdit;
    PopupMenu1: TPopupMenu;
    ExcluirItem1: TMenuItem;
    Cancelarcompra1: TMenuItem;
    CadastrodeFormasdePagto1: TMenuItem;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodProExit(Sender: TObject);
    procedure btnOpcClick(Sender: TObject);
    procedure edtQtdProKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlProKeyPress(Sender: TObject; var Key: Char);
    procedure edtSubTotalChange(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure SelecionarFornecedor1Click(Sender: TObject);
    procedure SelecionarComprador1Click(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure cbbFormaPagtoChange(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Cancelarcompra1Click(Sender: TObject);
    procedure Abrirvendacongelada1Click(Sender: TObject);
    procedure grdCompraDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CadastrodeFormasdePagto1Click(Sender: TObject);
    procedure btnIncItemClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    bQtdVlInteiro, bQtdVlDecimal, bCongela : Boolean;

    Procedure BuscaFormaPagto;
    Procedure AbreCompra;
    Procedure BuscaProduto;
    procedure IncluirProduto;
    Procedure SelecionaItens;
    Procedure Permissao;
  end;

var
  frmCompra: TfrmCompra;

implementation

uses Alert_Form, AlertMsg_Form, bbIAEEstoque, BBMain_Form, BBPessoa_Form,
  BBProduto_Form, Login_Form, LoginMsg_Form, SICK013, BBPsqCompra_Form,
  BBIAEFormaPagto_Form, BBBackup_Form, BBIAEProduto_Form;

{$R *.dfm}

procedure TfrmCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCompra.FormDestroy(Sender: TObject);
begin
  frmCompra := Nil;
end;

Procedure TfrmCompra.Permissao;
begin

end;



Procedure TfrmCompra.BuscaFormaPagto;
begin
  stpFormaPagto.Close;
  stpFormaPagto.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpFormaPagto.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpFormaPagto.Parameters.ParamByName('@id_Codigo_FPg').Value := Null;
  stpFormaPagto.Open;

  cbbFormaPagto.Items.Clear;
  cbbFormaPagto.Items.Add('Selecione');

  cbbCodFPg.Items.Clear;
  cbbCodFPg.Items.Add('Selecione');

  stpFormaPagto.First;
  While not(stpFormaPagto.Eof) do begin
    cbbFormaPagto.Items.Add(stpFormaPagto.Fields.FieldByName('Descrição').AsString);
    cbbCodFPg.Items.Add(stpFormaPagto.Fields.FieldByName('Cód').AsString);
    stpFormaPagto.Next;
  end;

  cbbFormaPagto.ItemIndex := 0;
  cbbCodFPg.ItemIndex := 0;
end;



procedure TfrmCompra.FormShow(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Cadastrar compras').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    PostMessage(frmCompra.Handle, WM_CLOSE, 0, 0)
  end;

  edtDescUsu.Text   := frmMain.sUsu;
  edtComprador.Text := '2 - Funcionário casual';
  dtpCompra.Date    := StrToDate('01/01/1900');

  BuscaFormaPagto;
  AbreCompra;
//    TotalizarVenda;

end;



Procedure TfrmCompra.AbreCompra;
begin
  stpCompra.Close;
  stpCompra.Parameters.ParamByName('@sOpr').Value              := 'SCA';
  stpCompra.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpCompra.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpCompra.Parameters.ParamByName('@id_Codigo_Com').Value     := Null;
  stpCompra.Parameters.ParamByName('@id_Comprador_Pes').Value  := Null;
  stpCompra.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Null;
  stpCompra.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;
  stpCompra.Parameters.ParamByName('@qt_Volumes_Com').Value    := Null;
  stpCompra.Parameters.ParamByName('@vl_Compra_Com').Value     := Null;
  stpCompra.Parameters.ParamByName('@vl_Desconto_Com').Value   := Null;
  stpCompra.Parameters.ParamByName('@dt_Compra_Com').Value     := Null;
  stpCompra.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
  stpCompra.Parameters.ParamByName('@qt_Quantidade_CoI').Value := Null;
  stpCompra.Parameters.ParamByName('@vl_CompraUni_CoI').Value  := Null;
  stpCompra.Parameters.ParamByName('@vl_CompraTot_CoI').Value  := Null;
  stpCompra.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpCompra.open;

  if stpCompra.RecordCount = 0 then begin
    stpCompra.Close;
    stpCompra.Parameters.ParamByName('@sOpr').Value              := 'ANC';
    stpCompra.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
    stpCompra.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
    stpCompra.Parameters.ParamByName('@id_Codigo_Com').Value     := Null;
    stpCompra.Parameters.ParamByName('@id_Comprador_Pes').Value  := Null;
    stpCompra.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Null;
    stpCompra.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;
    stpCompra.Parameters.ParamByName('@qt_Volumes_Com').Value    := Null;
    stpCompra.Parameters.ParamByName('@vl_Compra_Com').Value     := Null;
    stpCompra.Parameters.ParamByName('@vl_Desconto_Com').Value   := Null;
    stpCompra.Parameters.ParamByName('@dt_Compra_Com').Value     := Null;
    stpCompra.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
    stpCompra.Parameters.ParamByName('@qt_Quantidade_CoI').Value := Null;
    stpCompra.Parameters.ParamByName('@vl_CompraUni_CoI').Value  := Null;
    stpCompra.Parameters.ParamByName('@vl_CompraTot_CoI').Value  := Null;
    stpCompra.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
    stpCompra.ExecProc;

    AbreCompra;
  end;

  edtCodCom.Text   := stpCompra.Fields.FieldByName('id_Codigo_Com').AsString;
  edtSubTotal.Text := FormatFloat('0.00',stpCompra.Fields.FieldByName('SubTotal').AsFloat);
  edtDesconto.Text := FormatFloat('0.00',stpCompra.Fields.FieldByName('Desconto').asFloat);
  edtQtdItens.Text := FormatFloat('0.000',stpCompra.Fields.FieldByName('Volumes').asFloat);

  SelecionaItens;
end;



Procedure TfrmCompra.BuscaProduto;
begin
  stpProduto.Close;
  stpProduto.Parameters.ParamByName('@id_Codigo_Org').Value    := frmMain.iOrg;
  stpProduto.Parameters.ParamByName('@id_Codigo_Fil').Value    := frmMain.iFil;

  if rbtCodPro.Checked then
    stpProduto.Parameters.ParamByName('@id_Codigo_Pro').Value    := StrToInt(edtCodPro.Text)
  else
    stpProduto.Parameters.ParamByName('@id_Codigo_Pro').Value    := Null;

  if rbtCodBarra.Checked then
    stpProduto.Parameters.ParamByName('@ds_CodBarra_Pro').Value  := edtCodPro.Text
  else
    stpProduto.Parameters.ParamByName('@ds_CodBarra_Pro').Value  := Null;

  stpProduto.Parameters.ParamByName('@ds_Descricao_Pro').Value := Null;
  stpProduto.Open;

  edtDescPro.Text := stpProduto.Fields.FieldByName('Descrição').AsString;
  edtVlPro.Text   := stpProduto.Fields.FieldByName('Vl. Compra').AsString;

  bQtdVlInteiro := stpProduto.Fields.FieldByName('fl_VlInteiro_UnP').AsBoolean;
  bQtdVlDecimal := stpProduto.Fields.FieldByName('fl_VlDecimal_UnP').AsBoolean;
end;



procedure TfrmCompra.edtCodProExit(Sender: TObject);
Var Texto : String;
begin
  if edtCodPro.Text <> '' then begin
    BuscaProduto;
    if edtDescPro.Text = '' then begin
      ALERTMSG('Erro','Código inexistente no cadastro de produtos.',false);
      edtCodPro.Text := '';
      edtCodPro.SetFocus;
      exit;
    end;
  end else begin
    edtDescPro.Text := '';
    edtVlPro.Text   := '0,00';
  end;

  Texto := edtVlPro.Text;
  edtVlPro.Text  := PreencheZero(Texto,2,1);

  edtTotPro.Text := FloatToStr(StrToFloat(edtVlPro.Text) * StrToFloat(edtQtdPro.Text));
  Texto := edtTotPro.Text;
  edtTotPro.Text := PreencheZero(Texto,2,1);
end;



procedure TfrmCompra.btnOpcClick(Sender: TObject);
begin
  PopOpc.Popup(frmCompra.Left + btnOpc.Left - btnOpc.Width - 100,frmCompra.Top + btnOpc.Top + btnOpc.Height);
end;


procedure TfrmCompra.edtQtdProKeyPress(Sender: TObject; var Key: Char);
begin
  if bQtdVlInteiro then
    if not EDITCOD(Key) then
      key := #0;

  if bQtdVlDecimal then
    if not EDITMONEY(key,edtQtdPro,4,3) then
      key := #0;
end;



procedure TfrmCompra.edtVlProKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    IncluirProduto;
    edtCodPro.SetFocus;
  end;

  if not EDITMONEY(Key,edtVlPro,7,2) then
    key := #0;
end;



procedure TfrmCompra.IncluirProduto;
begin
  if edtDescPro.Text = '' then begin
    ALERTMSG('Erro','Não há itens na compra.',False);
    edtCodPro.SetFocus;
    exit;
  end;

  if StrToFloat(edtQtdPro.Text) < 0.001 then begin
    ALERTMSG('Erro','Favor informar a quantidade do item.',False);
    edtQtdPro.SetFocus;
    exit;
  end;

  if StrToFloat(edtVlPro.Text) < 0.01 then begin
    ALERTMSG('Erro','Favor informar o valor do item.',False);
    edtVlPro.SetFocus;
    exit;
  end;

  stpCompraItem.Close;
  stpCompraItem.Parameters.ParamByName('@sOpr').Value              := 'IIC';
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Com').Value     := edtCodCom.Text;
  stpCompraItem.Parameters.ParamByName('@id_Comprador_Pes').Value  := Null;
  stpCompraItem.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Null;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;
  stpCompraItem.Parameters.ParamByName('@qt_Volumes_Com').Value    := Null;
  stpCompraItem.Parameters.ParamByName('@vl_Compra_Com').Value     := Null;
  stpCompraItem.Parameters.ParamByName('@vl_Desconto_Com').Value   := Null;
  stpCompraItem.Parameters.ParamByName('@dt_Compra_Com').Value     := Null;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Pro').Value     := stpProduto.Fields.FieldByName('Cód').AsInteger;
  stpCompraItem.Parameters.ParamByName('@qt_Quantidade_CoI').Value := strToFloat(edtQtdPro.Text);
  stpCompraItem.Parameters.ParamByName('@vl_CompraUni_CoI').Value  := STrToFloat(edtVlPro.Text);
  stpCompraItem.Parameters.ParamByName('@vl_CompraTot_CoI').Value  := Null;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpCompraItem.Open;

  SelecionaItens;
  AbreCompra;
  edtCodPro.Text  := '';
  edtQtdPro.Text  := '1';
  edtDescPro.Text := '';
  edtVlPro.Text   := '0,00';
  edtTotPro.Text  := '0,00';
  edtCodPro.SetFocus;
  bQtdVlInteiro := True;
  bQtdVlDecimal := False;
end;



Procedure TfrmCompra.SelecionaItens;
begin
  stpCompraItem.Close;
  stpCompraItem.Parameters.ParamByName('@sOpr').Value              := 'VIC';
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Com').Value     := edtCodCom.Text;
  stpCompraItem.Parameters.ParamByName('@id_Comprador_Pes').Value  := Null;
  stpCompraItem.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Null;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;
  stpCompraItem.Parameters.ParamByName('@qt_Volumes_Com').Value    := Null;
  stpCompraItem.Parameters.ParamByName('@vl_Compra_Com').Value     := Null;
  stpCompraItem.Parameters.ParamByName('@vl_Desconto_Com').Value   := Null;
  stpCompraItem.Parameters.ParamByName('@dt_Compra_Com').Value     := Null;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
  stpCompraItem.Parameters.ParamByName('@qt_Quantidade_CoI').Value := Null;
  stpCompraItem.Parameters.ParamByName('@vl_CompraUni_CoI').Value  := Null;
  stpCompraItem.Parameters.ParamByName('@vl_CompraTot_CoI').Value  := Null;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpCompraItem.Open;
end;



procedure TfrmCompra.edtSubTotalChange(Sender: TObject);
begin
  edtTotPago.Text := FormatFloat('###,##0.00',STrToFloat(edtSubTotal.Text) - strTOFloat(edtDesconto.Text));
end;



procedure TfrmCompra.edtDescontoExit(Sender: TObject);
begin
  if edtDesconto.Text = '' then
    edtDesconto.Text := '0,00';

  if Copy(edtDesconto.Text,1,1) = ',' then
    edtDesconto.Text := '0' + edtdesconto.Text;

  edtDesconto.Text := FormatFloat('0.00',StrToFloat(edtDesconto.Text));
  edtTotPago.Text  := FormatFloat('0.00',STrToFloat(edtSubTotal.Text) - strTOFloat(edtDesconto.Text));
end;



procedure TfrmCompra.ExcluirItem1Click(Sender: TObject);
var
  iProd : integer;
begin
  if stpCompraItem.RecordCount = 0 then
    exit;

  iProd := stpCompraItem.Fields.fieldByName('Cód Pro').AsInteger;

  stpCompraItem.Close;
  stpCompraItem.Parameters.ParamByName('@sOpr').Value              := 'EIC';
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Com').Value     := edtCodCom.Text;
  stpCompraItem.Parameters.ParamByName('@id_Comprador_Pes').Value  := Null;
  stpCompraItem.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Null;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;
  stpCompraItem.Parameters.ParamByName('@qt_Volumes_Com').Value    := Null;
  stpCompraItem.Parameters.ParamByName('@vl_Compra_Com').Value     := Null;
  stpCompraItem.Parameters.ParamByName('@vl_Desconto_Com').Value   := Null;
  stpCompraItem.Parameters.ParamByName('@dt_Compra_Com').Value     := Null;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Pro').Value     := iProd;
  stpCompraItem.Parameters.ParamByName('@qt_Quantidade_CoI').Value := Null;
  stpCompraItem.Parameters.ParamByName('@vl_CompraUni_CoI').Value  := Null;
  stpCompraItem.Parameters.ParamByName('@vl_CompraTot_CoI').Value  := Null;
  stpCompraItem.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpCompraItem.Open;
end;



procedure TfrmCompra.SelecionarFornecedor1Click(Sender: TObject);
begin
  frmCompra.Visible := False;

  frmMain.iPessoa := 1;
  frmMain.sPessoa := '1 - Fornecedor Casual';

  if frmPessoa = Nil then
    frmPessoa := TfrmPessoa.Create(Self);

  frmPessoa.ShowModal;

  if frmMain.iPessoa <> 0 then begin
    edtFornecedor.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;

  end else begin
    edtFornecedor.Text := '1 - Fornecedor casual';
  end;

  frmCompra.Visible := True;
end;



procedure TfrmCompra.SelecionarComprador1Click(Sender: TObject);
begin
  frmCompra.Visible := False;

  frmMain.iPessoa := -1;
  frmMain.sPessoa := '';

  if frmPessoa = Nil then
    frmPessoa := TfrmPessoa.Create(Self);

  frmPessoa.ShowModal;

  if frmMain.iPessoa <> Null then begin
    edtComprador.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;


  end else begin
    edtComprador.Text := '';

  end;

  frmCompra.Visible := True;
end;



procedure TfrmCompra.btnFinalizarClick(Sender: TObject);
begin
  if cbbFormaPagto.ItemIndex = 0 then begin
    ALERTMSG('Erro','Favor selecionar a forma de pagamento.',False);
    cbbFormaPagto.SetFocus;
    exit;
  end;

  if stpCompraItem.RecordCount < 1 then begin
    ALERTMSG('Erro','Não há itens na compra.',False);
    edtCodPro.SetFocus;
    exit;
  end;

  if Trunc(dtpCompra.Date) = StrToDate('01/01/1900') then begin
    ALERTMSG('Erro','Você deve informar a data da compra.',False);
    dtpCompra.SetFocus;
    exit;
  end;

  if not ALERTMSG('Finalizar compra','Você confirma a finalização da compra nº ' + edtCodCom.Text + '?',true) then
    exit;

  stpCompra.Close;
  stpCompra.Parameters.ParamByName('@sOpr').Value              := 'FNZ';
  stpCompra.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpCompra.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpCompra.Parameters.ParamByName('@id_Codigo_Com').Value     := StrToInt(edtCodCom.Text);
  stpCompra.Parameters.ParamByName('@id_Comprador_Pes').Value  := Copy(edtComprador.Text,1,pos(' -',edtComprador.Text)-1);
  stpCompra.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Copy(edtFornecedor.Text,1,pos(' -',edtFornecedor.Text)-1);
  stpCompra.Parameters.ParamByName('@id_Codigo_FPg').Value     := stpFormaPagto.Fields.FieldByName('Cód').AsInteger;
  stpCompra.Parameters.ParamByName('@qt_Volumes_Com').Value    := Null;
  stpCompra.Parameters.ParamByName('@vl_Compra_Com').Value     := Null;
  stpCompra.Parameters.ParamByName('@vl_Desconto_Com').Value   := StrToFloat(edtDesconto.Text);
  stpCompra.Parameters.ParamByName('@dt_Compra_Com').Value     := dtpCompra.Date;
  stpCompra.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
  stpCompra.Parameters.ParamByName('@qt_Quantidade_CoI').Value := Null;
  stpCompra.Parameters.ParamByName('@vl_CompraUni_CoI').Value  := Null;
  stpCompra.Parameters.ParamByName('@vl_CompraTot_CoI').Value  := Null;
  stpCompra.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpCompra.ExecProc;

  AbreCompra;
  cbbFormaPagto.Text      := 'Selecione';
  cbbFormaPagto.ItemIndex := 0;
  edtQtdItens.Text        := '0,000';
  edtSubTotal.Text        := '0,00';
  edtDesconto.Text        := '0,00';
  edtTotPago.Text         := '0,00';
end;



procedure TfrmCompra.cbbFormaPagtoChange(Sender: TObject);
begin
  cbbCodFPg.ItemIndex := cbbFormaPagto.ItemIndex;

  stpFormaPagto.Close;
  stpFormaPagto.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpFormaPagto.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpFormaPagto.Parameters.ParamByName('@id_Codigo_FPg').Value := cbbCodFPg.Text;
  stpFormaPagto.Open;
end;



procedure TfrmCompra.N2Click(Sender: TObject);
begin
  if stpCompraItem.RecordCount < 1 then begin
    ALERTMSG('Erro','Não é possível congelar uma compra que não possui itens.',False);
    edtCodPro.SetFocus;
    exit;
  end;

  if Trunc(dtpCompra.Date) = StrToDate('01/01/1900') then begin
    ALERTMSG('Erro','Você deve informar a data da compra.',False);
    dtpCompra.SetFocus;
    exit;
  end;

  if not ALERTMSG('Congelar compra','Você deseja mesmo congelar a compra nº ' + edtCodCom.Text + '?',true) then
    exit;

  stpCompra.Close;
  stpCompra.Parameters.ParamByName('@sOpr').Value              := 'CGL';
  stpCompra.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpCompra.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpCompra.Parameters.ParamByName('@id_Codigo_Com').Value     := StrToInt(edtCodCom.Text);
  stpCompra.Parameters.ParamByName('@id_Comprador_Pes').Value  := Copy(edtComprador.Text,1,pos(' -',edtComprador.Text)-1);
  stpCompra.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Copy(edtFornecedor.Text,1,pos(' -',edtFornecedor.Text)-1);

  if cbbFormaPagto.ItemIndex > 0 then
    stpCompra.Parameters.ParamByName('@id_Codigo_FPg').Value := stpFormaPagto.Fields.FieldByName('Cód').AsInteger
  else
    stpCompra.Parameters.ParamByName('@id_Codigo_FPg').Value := Null;

  stpCompra.Parameters.ParamByName('@qt_Volumes_Com').Value    := Null;
  stpCompra.Parameters.ParamByName('@vl_Compra_Com').Value     := Null;
  stpCompra.Parameters.ParamByName('@vl_Desconto_Com').Value   := Null;
  stpCompra.Parameters.ParamByName('@dt_Compra_Com').Value     := dtpCompra.Date;
  stpCompra.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
  stpCompra.Parameters.ParamByName('@qt_Quantidade_CoI').Value := Null;
  stpCompra.Parameters.ParamByName('@vl_CompraUni_CoI').Value  := Null;
  stpCompra.Parameters.ParamByName('@vl_CompraTot_CoI').Value  := Null;
  stpCompra.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpCompra.ExecProc;

  AbreCompra;
  cbbFormaPagto.Text      := 'Selecione';
  cbbFormaPagto.ItemIndex := 0;
  edtQtdItens.Text        := '0,000';
  edtSubTotal.Text        := '0,00';
  edtDesconto.Text        := '0,00';
  edtTotPago.Text         := '0,00';
end;



procedure TfrmCompra.Cancelarcompra1Click(Sender: TObject);
begin
  if stpCompraItem.RecordCount < 1 then begin
    ALERTMSG('Erro','Não é possível cancelar uma compra que não possui itens.',False);
    edtCodPro.SetFocus;
    exit;
  end;

  if not ALERTMSG('Cancelar compra','Você deseja mesmo cancelar a compra nº ' + edtCodCom.Text + '?',true) then
    exit;

  stpCompra.Close;
  stpCompra.Parameters.ParamByName('@sOpr').Value              := 'CAN';
  stpCompra.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpCompra.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpCompra.Parameters.ParamByName('@id_Codigo_Com').Value     := StrToInt(edtCodCom.Text);
  stpCompra.Parameters.ParamByName('@id_Comprador_Pes').Value  := Copy(edtComprador.Text,1,pos(' -',edtComprador.Text)-1);
  stpCompra.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Copy(edtFornecedor.Text,1,pos(' -',edtFornecedor.Text)-1);

  if cbbFormaPagto.ItemIndex > 0 then
    stpCompra.Parameters.ParamByName('@id_Codigo_FPg').Value := stpFormaPagto.Fields.FieldByName('Cód').AsInteger
  else
    stpCompra.Parameters.ParamByName('@id_Codigo_FPg').Value := Null;

  stpCompra.Parameters.ParamByName('@qt_Volumes_Com').Value    := Null;
  stpCompra.Parameters.ParamByName('@vl_Compra_Com').Value     := Null;
  stpCompra.Parameters.ParamByName('@vl_Desconto_Com').Value   := Null;
  stpCompra.Parameters.ParamByName('@dt_Compra_Com').Value     := Null;
  stpCompra.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
  stpCompra.Parameters.ParamByName('@qt_Quantidade_CoI').Value := Null;
  stpCompra.Parameters.ParamByName('@vl_CompraUni_CoI').Value  := Null;
  stpCompra.Parameters.ParamByName('@vl_CompraTot_CoI').Value  := Null;
  stpCompra.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpCompra.ExecProc;

  AbreCompra;
  cbbFormaPagto.Text      := 'Selecione';
  cbbFormaPagto.ItemIndex := 0;
  edtQtdItens.Text        := '0,000';
  edtSubTotal.Text        := '0,00';
  edtDesconto.Text        := '0,00';
  edtTotPago.Text         := '0,00';
end;



procedure TfrmCompra.Abrirvendacongelada1Click(Sender: TObject);
begin
  frmMain.iCompra := 0;
  frmCompra.Visible := False;

  if frmPsqCompra = Nil then
    frmPsqCompra := TfrmPsqCompra.Create(Self);

  frmPsqCompra.cbbStatus.ItemIndex := 2;
  frmPsqCompra.cbbStatus.Enabled   := False;

  frmPsqCompra.ShowModal;
  frmCompra.Visible := True;

  if frmMain.iCompra <> 0 then begin
    edtCodCom.Text := IntToStr(frmMain.iCompra);
    SelecionaItens;

    stpCompra.Close;
    stpCompra.Parameters.ParamByName('@sOpr').Value              := 'SCC';
    stpCompra.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
    stpCompra.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
    stpCompra.Parameters.ParamByName('@id_Codigo_Com').Value     := StrToInt(edtCodCom.Text);
    stpCompra.Parameters.ParamByName('@id_Comprador_Pes').Value  := Null;
    stpCompra.Parameters.ParamByName('@id_Fornecedor_Pes').Value := Null;
    stpCompra.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;
    stpCompra.Parameters.ParamByName('@qt_Volumes_Com').Value    := Null;
    stpCompra.Parameters.ParamByName('@vl_Compra_Com').Value     := Null;
    stpCompra.Parameters.ParamByName('@vl_Desconto_Com').Value   := Null;
    stpCompra.Parameters.ParamByName('@dt_Compra_Com').Value     := Null;
    stpCompra.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
    stpCompra.Parameters.ParamByName('@qt_Quantidade_CoI').Value := Null;
    stpCompra.Parameters.ParamByName('@vl_CompraUni_CoI').Value  := Null;
    stpCompra.Parameters.ParamByName('@vl_CompraTot_CoI').Value  := Null;
    stpCompra.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
    stpCompra.Open;

    edtComprador.Text  := stpCompra.Fields.FieldByName('id_Comprador_Pes').AsString;
    edtFornecedor.Text := stpCompra.Fields.FieldByName('id_Fornecedor_Pes').AsString;
    dtpCompra.Date     := stpCompra.Fields.FieldByName('dt_Compra_Com').AsDateTime;
    edtSubTotal.Text   := stpCompra.Fields.FieldByName('SubTotal').AsString;
    edtDesconto.Text   := stpCompra.Fields.FieldByName('Desconto').AsString;
    edtTotPago.Text    := FloatToStr(stpCompra.Fields.FieldByName('SubTotal').AsFloat - stpCompra.Fields.FieldByName('Desconto').AsFloat);
    edtQtdItens.Text   := FormatFloat('0.000',stpCompra.Fields.FieldByName('Volumes').AsFloat);

    edtSubTotal.Text := FormatFloat('0.00',strToFloat(StringReplace(edtSubTotal.Text,'.','',[rfReplaceAll])));
    edtDesconto.Text := FormatFloat('0.00',strToFloat(StringReplace(edtDesconto.Text,'.','',[rfReplaceAll])));
    edtTotPago.Text  := FormatFloat('0.00',strToFloat(StringReplace(edtTotPAgo.Text,'.','',[rfReplaceAll])));

    cbbCodFPg.ItemIndex := 0;
    if stpCompra.Fields.FieldByName('id_Codigo_FPg').AsString <> '' then begin
      while cbbCodFPg.text <> stpCompra.Fields.FieldByName('id_Codigo_FPg').AsString do
        cbbCodFPg.ItemIndex := cbbCodFPg.ItemIndex + 1;
    end;
  end;
end;



procedure TfrmCompra.grdCompraDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var  R: TRect;
begin
  if grdCompra.DataSource = dtsItens then begin
    if not odd(stpCompraItem.RecNo) then begin
      if not (gdSelected in State) then begin
        grdCompra.Canvas.Brush.Color := windows.RGB(220,245,255);
        grdCompra.Canvas.FillRect(Rect);
        grdCompra.DefaultDrawDataCell(rect,Column.Field,state);
      end;
      R := Rect;
      Dec(R.Bottom,2);
    end;
  end;
end;



procedure TfrmCompra.CadastrodeFormasdePagto1Click(Sender: TObject);
begin
  if frmIAEFormaPagto = Nil then
    frmIAEFormaPagto := TfrmIAEFormaPagto.Create(Self);

  frmCompra.Visible := False;
  frmIAEFormaPagto.ShowModal;
  frmCompra.Visible := True;

  stpFormaPagto.Close;
  stpFormaPagto.Open;
end;



procedure TfrmCompra.btnIncItemClick(Sender: TObject);
begin
  IncluirProduto;
  edtCodPro.SetFocus;
end;

procedure TfrmCompra.BitBtn1Click(Sender: TObject);
begin
  if frmProduto = Nil then
    frmProduto := TfrmProduto.Create(Self);

  if rbtCodBarra.Checked then
    frmProduto.edtPsqCodBarPro.Text := edtCodPro.Text
  else
    frmProduto.edtPsqCodPro.Text := edtCodPro.Text;

  frmProduto.imgPsqClick(self);
  frmProduto.PopAltPesClick(self);
end;

procedure TfrmCompra.edtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  if not EDITMONEY(Key,edtDesconto,7,2) then
    key := #0;
end;

end.
