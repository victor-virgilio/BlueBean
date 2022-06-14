unit BBVenda_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, MaskUtils;

type
  TfrmVenda = class(TForm)
    Shape13: TShape;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Shape7: TShape;
    Shape1: TShape;
    Shape6: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label2: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    lblDesconto: TLabel;
    Label9: TLabel;
    Image2: TImage;
    imgPro: TImage;
    edtDescUsu: TEdit;
    edtData: TEdit;
    edtHora: TEdit;
    DBGrid1: TDBGrid;
    edtQtdItens: TEdit;
    edtVlPago: TEdit;
    edtVlTroco: TEdit;
    ckbDesconto: TCheckBox;
    btnFinalizar: TBitBtn;
    edtCodVen: TEdit;
    edtCodPro: TEdit;
    edtQtdPro: TEdit;
    edtDescPro: TEdit;
    edtVlTotal: TEdit;
    edtVlPro: TEdit;
    cbbFormaPagto: TComboBox;
    edtTotPro: TEdit;
    btnOpc: TBitBtn;
    rbtCodPro: TRadioButton;
    rbtCodBarra: TRadioButton;
    edtVlDesc: TEdit;
    cbbCodFPg: TComboBox;
    edtTotPagar: TEdit;
    ckbCongela: TCheckBox;
    tmrClock: TTimer;
    stpVenda: TADOStoredProc;
    DataSource1: TDataSource;
    stpProduto: TADOStoredProc;
    stpTotais: TADOStoredProc;
    PopupMenu1: TPopupMenu;
    ExcluirItem1: TMenuItem;
    stpFormaPagto: TADOStoredProc;
    PopOpc: TPopupMenu;
    SelecionarCliente1: TMenuItem;
    Abrirvendacongelada1: TMenuItem;
    N2: TMenuItem;
    Aplicardesconto1: TMenuItem;
    Resetardesconto1: TMenuItem;
    Shape5: TShape;
    Label11: TLabel;
    edtPessoa: TEdit;
    stpVendaItem: TADOStoredProc;
    Abrirvendapendente1: TMenuItem;
    Salvarvendacomopendente1: TMenuItem;
    stpVendaItemCd: TIntegerField;
    stpVendaItemQtd: TBCDField;
    stpVendaItemDescrio: TStringField;
    stpVendaItemVlUnit: TBCDField;
    stpVendaItemCdBarra: TStringField;
    stpVendaItemVlTot: TBCDField;
    stpVendaItemUnidade: TStringField;
    CadastrodeFormasdePagto1: TMenuItem;
    Reimprimircupom1: TMenuItem;
    Inc1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrClockTimer(Sender: TObject);
    procedure edtCodProExit(Sender: TObject);
    procedure edtQtdProKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlPagoKeyPress(Sender: TObject; var Key: Char);
    procedure cbbFormaPagtoKeyPress(Sender: TObject; var Key: Char);
    procedure btnFinalizarClick(Sender: TObject);
    procedure edtVlPagoExit(Sender: TObject);
    procedure ckbDescontoClick(Sender: TObject);
    procedure cbbFormaPagtoChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn3Click(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure edtCodProKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdProExit(Sender: TObject);
    procedure btnOpcClick(Sender: TObject);
    procedure Aplicardesconto1Click(Sender: TObject);
    procedure Resetardesconto1Click(Sender: TObject);
    procedure edtVlTotalKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlTrocoKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlDescKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescProKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlProKeyPress(Sender: TObject; var Key: Char);
    procedure edtTotProKeyPress(Sender: TObject; var Key: Char);
    procedure SelecionarCliente1Click(Sender: TObject);
    procedure edtCodProChange(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Abrirvendacongelada1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Salvarvendacomopendente1Click(Sender: TObject);
    procedure Abrirvendapendente1Click(Sender: TObject);
    procedure CadastrodeFormasdePagto1Click(Sender: TObject);
    procedure Reimprimircupom1Click(Sender: TObject);
  private
    { Private declarations }
  public
    bDesconto, bQtdVlInteiro, bQtdVlDecimal, bCongela, bPendente : Boolean;


    Procedure AbreVenda;
    Procedure SelecionaItens;
    Procedure BuscaProduto;
    Procedure TotalizarVenda;
    Procedure CalculaTroco;
    Procedure IncluirProduto;
    Procedure ExcluirProduto;
    Procedure BuscaFormaPagto;
    procedure Imprimir;
  end;

var
  frmVenda: TfrmVenda;

implementation

uses Alert_Form, AlertMsg_Form, BBIAEFormaPagto_Form, BBMain_Form,
  BBPessoa_Form, BBProduto_Form, Login_Form, LoginMsg_Form, SICK013,
  BBPsqVenda_Form;

{$R *.dfm}

procedure TfrmVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.iVenda := 0;

  Action := Cafree;
end;

procedure TfrmVenda.FormDestroy(Sender: TObject);
begin
  frmVenda := Nil;
end;



Procedure TfrmVenda.BuscaFormaPagto;
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



Procedure TfrmVenda.CalculaTroco;
Var Texto : String;
begin
  if StrToFloat(edtVlPago.Text) > 0 then
    edtVlTroco.Text := FloatToStr(StrToFloat(edtVlPago.Text) - STrToFloat(edtTotPagar.Text));

  Texto := edtVlPago.Text;
  edtVlPago.Text := PreencheZero(Texto,2,1);

  Texto := edtVlTroco.Text;
  edtVlTroco.Text := PreencheZero(Texto,2,1);
end;



procedure TfrmVenda.FormShow(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Cadastrar vendas').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    PostMessage(frmVenda.Handle, WM_CLOSE, 0, 0)
  end;

  edtDescUsu.Text := frmMain.sUsu;
  edtData.Text    := FormatDateTime('DD/MM/YY',Now);
  edtHora.Text    := FormatDateTime('HH:mm',Now);

  if frmMain.iVenda = 0 then begin
    BuscaFormaPagto;
    AbreVenda;
    TotalizarVenda;
  end;
end;



procedure TfrmVenda.tmrClockTimer(Sender: TObject);
begin
  edtData.Text := FormatDateTime('DD/MM/YY',Now);
  edtHora.Text := FormatDateTime('HH:mm',Now);
end;



Procedure TfrmVenda.AbreVenda;
begin
  stpVenda.Close;
  stpVenda.Parameters.ParamByName('@sOpr').Value              := 'SVA';
  stpVenda.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpVenda.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpVenda.Parameters.ParamByName('@id_Codigo_Ven').Value     := Null;
  stpVenda.Parameters.ParamByName('@id_Cliente_Pes').Value    := frmMain.iPessoa;
  stpVenda.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;
  stpVenda.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
  stpVenda.Parameters.ParamByName('@id_Codigo_Est').Value     := Null;
  stpVenda.Parameters.ParamByName('@qt_Quantidade_VeI').Value := Null;
  stpVenda.Parameters.ParamByName('@fl_Desconto_Ven').Value   := Null;
  stpVenda.Parameters.ParamByName('@fl_Congelar_Ven').Value   := Null;
  stpVenda.Parameters.ParamByName('@fl_Pendente_Ven').Value   := Null;
  stpVenda.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpVenda.Open;

  edtCodVen.Text := stpVenda.Fields.FieldByName('id_Codigo_Ven').AsString;
  
  SelecionaItens;
end;



Procedure TfrmVenda.SelecionaItens;
begin
  stpVendaItem.Close;
  stpVendaItem.Parameters.ParamByName('@sOpr').Value              := 'SIV';
  stpVendaItem.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpVendaItem.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpVendaItem.Parameters.ParamByName('@id_Codigo_Ven').Value     := StrToInt(edtCodVen.Text);
  stpVendaItem.Parameters.ParamByName('@id_Cliente_Pes').Value    := frmMain.iPessoa;
  stpVendaItem.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;
  stpVendaItem.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
  stpVendaItem.Parameters.ParamByName('@id_Codigo_Est').Value     := Null;
  stpVendaItem.Parameters.ParamByName('@qt_Quantidade_VeI').Value := Null;
  stpVendaItem.Parameters.ParamByName('@fl_Desconto_Ven').Value   := Null;
  stpVendaItem.Parameters.ParamByName('@fl_Congelar_Ven').Value   := Null;
  stpVendaItem.Parameters.ParamByName('@fl_Pendente_Ven').Value   := Null;
  stpVendaItem.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpVendaItem.Open;
end;



Procedure TfrmVenda.BuscaProduto;
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
  edtVlPro.Text   := stpProduto.Fields.FieldByName('Vl. Venda').AsString;

{  if Length(stpProduto.FieldByName('ds_Imagem_Pro').AsString) > 0 then
    ImgPro.Picture.LoadFromFile('C:\Arquivos de programas\Blue Bean\PicPro\' + stpProduto.FieldByName('ds_Imagem_Pro').AsString)
  else
    ImgPro.Picture.LoadFromFile('picpro\FotoDefault.bmp');}

  bQtdVlInteiro := stpProduto.Fields.FieldByName('fl_VlInteiro_UnP').AsBoolean;
  bQtdVlDecimal := stpProduto.Fields.FieldByName('fl_VlDecimal_UnP').AsBoolean;
end;



procedure TfrmVenda.edtCodProExit(Sender: TObject);
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



procedure TfrmVenda.IncluirProduto;
begin
  if edtDescPro.Text = '' then begin
    ALERTMSG('Erro','Não há itens na venda.',False);
    edtCodPro.SetFocus;
    exit;
  end;

  if StrToFloat(edtQtdPro.Text) < 0.001 then begin
    ALERTMSG('Erro','Favor informar a quantidade do item.',False);
    edtQtdPro.SetFocus;
    exit;
  end;

  stpVenda.Close;
  stpVenda.Parameters.ParamByName('@sOpr').Value              := 'IPV';
  stpVenda.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpVenda.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpVenda.Parameters.ParamByName('@id_Codigo_Ven').Value     := StrToInt(edtCodVen.Text);
  stpVenda.Parameters.ParamByName('@id_Cliente_Pes').Value    := frmMain.iPessoa;
  stpVenda.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;
  stpVenda.Parameters.ParamByName('@id_Codigo_Pro').Value     := stpProduto.Fields.FieldByName('Cód').AsInteger;
  stpVenda.Parameters.ParamByName('@id_Codigo_Est').Value     := Null;
  stpVenda.Parameters.ParamByName('@qt_Quantidade_VeI').Value := StrToFloat(edtQtdPro.Text);
  stpVenda.Parameters.ParamByName('@fl_Desconto_Ven').Value   := Null;
  stpVenda.Parameters.ParamByName('@fl_Congelar_Ven').Value   := Null;
  stpVenda.Parameters.ParamByName('@fl_Pendente_Ven').Value   := Null;
  stpVenda.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpVenda.ExecProc;

  SelecionaItens;
  TotalizarVenda;
  CalculaTroco;

  edtCodPro.Text  := '';
  edtQtdPro.Text  := '1';
  edtDescPro.Text := '';
  edtVlPro.Text   := '0,00';
  edtTotPro.Text  := '0,00';
  edtCodPro.SetFocus;
  bQtdVlInteiro := True;
  bQtdVlDecimal := False;
//  ImgPro.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\PicPro\FotoDefault.bmp');
end;



procedure tfrmVenda.imprimir;
var  impressora : textfile;
     sCod, sDesc, sQtd, sUN, sVlUni, sVlTot : string;
     sLinSub, sLinDesc, sLinTot, sLinVlPg, sLinTroco : string;
begin
{  AssignFile(impressora,'\\127.0.0.1\xp-58c');
  TRY
    rewrite(Impressora);
    writeln(Impressora);
    writeln(Impressora,'********************************');
    writeln(Impressora,'****** SELFIE1 CELULARES *******');
    writeln(Impressora,'********************************');
    writeln(Impressora,'Av. 7 de Setembro, 39 - Centro -');
    writeln(Impressora,'Franco da Rocha - SP - 07851-120');
    writeln(Impressora,'Tel: (11)4811-4271              ');
//    writeln(Impressora,'CNPJ: 07.539.280/0001-50        ');
//    writeln(Impressora,'IE: 312.008.013.110             ');
    writeln(Impressora,'Cupom Numero: ' + edtCodVen.Text );
    writeln(Impressora,'--------------------------------');
    writeln(Impressora,'COD    DESCRICAO                ');
    writeln(Impressora,'QTD     UN      Vl Uni    Vl Tot');
    writeln(Impressora,'--------------------------------');

    stpVendaItem.First;
    while not stpVendaItem.Eof do begin

      sCod := stpVendaItem.Fields.FieldByName('Cód').asString;
      while Length(sCod) < 6 do
        sCod := '0' + sCod;

      sDesc := Copy(stpVendaItem.Fields.FieldByName('Descrição').asString,1,25);
      while length(sDesc) < 25 do
        sDesc := sDesc + ' ';

      sQtd := formatfloat('0.000',stpVendaItem.Fields.FieldByName('Qtd').AsFloat);
      while length(sQtd) < 7 do
        sQtd := ' ' + sQtd;

      sUN := stpVendaItem.Fields.FieldByName('Unidade').asString;
      while Length(sUN) < 3 do
        sUN := sUN + ' ';

      sVlUni := FormatFloat('0.00',stpVendaItem.Fields.FieldByName('Vl. Unit').asFloat);
      while length(sVlUni) < 7 do
        sVlUni := ' ' + sVlUni;

      sVlTot := FormatFloat('0.00',stpVendaItem.Fields.FieldByName('Vl. Tot').asFloat);
      while length(sVlTot) < 8 do
        sVlTot := ' ' + sVlTot;

      writeln(Impressora,sCod + ' ' + sDesc);
      writeln(Impressora,sQtd + ' ' + sUN + ' x ' + sVlUni + ' = ' + sVlTot);
      stpVendaItem.Next;
    end;

    writeln(Impressora,'--------------------------------');
    writeln(Impressora,'Forma Pagto: ' + cbbFormaPagto.text);

    sLinSub := edtVlTotal.Text;
    while Length(sLinSub) < 17 do
      sLinSub := '.' + sLinSub;
    writeln(Impressora,'   SubTotal(R$)' + sLinSub);

    sLinDesc := edtVlDesc.Text;
    while Length(sLinDesc) < 17 do
      sLinDesc := '.' + sLinDesc;
    writeln(Impressora,'   Desconto(R$)' + sLinDesc);

    sLinTot := edtTotPagar.Text;
    while Length(sLinTot) < 20 do
      sLinTot := '.' + sLinTot;
    writeln(Impressora,'   TOTAL(R$)' + sLinTot);

    sLinVlPg := edtVlPago.Text;
    while Length(sLinVlPg) < 15 do
      sLinVlPg := '.' + sLinVlPg;
    writeln(Impressora,'   Valor Pago(R$)' + sLinVlPg);

    sLinTroco := edtVlTroco.Text;
    while Length(sLinTroco) < 20 do
      sLinTroco := '.' + sLinTroco;
    writeln(Impressora,'   Troco(R$)' + sLinTroco);

    writeln(Impressora);
    writeln(Impressora,'Cliente:                        ');
    writeln(Impressora,Copy(edtPessoa.Text,1,32));
    writeln(Impressora,'Data/Hora: ' + formatDateTime('dd/mm/yyyy HH:nn',Now));
    writeln(Impressora);
    writeln(Impressora,'*** NAO POSSUI VALOR FISCAL ****');
    writeln(Impressora);
    writeln(Impressora); //Linha em branco
    writeln(Impressora); //Linha em branco
    writeln(Impressora); //Linha em branco
  FINALLY
    CloseFile(Impressora);
  END;  }
end;




procedure TfrmVenda.edtQtdProKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    IncluirProduto;

  if bQtdVlInteiro then
    if not EDITCOD(Key) then
      key := #0;

  if bQtdVlDecimal then
    if not EDITMONEY(key,edtQtdPro,4,2) then
      key := #0;
end;



procedure TfrmVenda.edtVlPagoKeyPress(Sender: TObject; var Key: Char);
begin
  if not EDITMONEY(key,edtVlPago,4,2) then
    key := #0;
end;



procedure TfrmVenda.ExcluirProduto;
begin
  if stpVendaItem.RecordCount = 0 then
    exit;

  stpVenda.Close;
  stpVenda.Parameters.ParamByName('@sOpr').Value              := 'EPV';
  stpVenda.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpVenda.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpVenda.Parameters.ParamByName('@id_Codigo_Ven').Value     := StrToInt(edtCodVen.Text);
  stpVenda.Parameters.ParamByName('@id_Cliente_Pes').Value    := frmMain.iPessoa;
  stpVenda.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;
  stpVenda.Parameters.ParamByName('@id_Codigo_Pro').Value     := stpVendaItem.Fields.FieldByName('Cód').AsInteger;
  stpVenda.Parameters.ParamByName('@id_Codigo_Est').Value     := Null;
  stpVenda.Parameters.ParamByName('@qt_Quantidade_VeI').Value := Null;
  stpVenda.Parameters.ParamByName('@fl_Desconto_Ven').Value   := Null;
  stpVenda.Parameters.ParamByName('@fl_Congelar_Ven').Value   := Null;
  stpVenda.Parameters.ParamByName('@fl_Pendente_Ven').Value   := Null;
  stpVenda.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpVenda.ExecProc;

  SelecionaItens;
  TotalizarVenda;
end;




Procedure TfrmVenda.TotalizarVenda;
Var
Texto : String;
begin
  stpTotais.Close;
  stpTotais.Parameters.ParamByName('@sOpr').Value              := 'TTV';
  stpTotais.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpTotais.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpTotais.Parameters.ParamByName('@id_Codigo_Ven').Value     := StrToInt(edtCodVen.Text);
  stpTotais.Parameters.ParamByName('@id_Cliente_Pes').Value     := frmMain.iPessoa;

  if cbbFormaPagto.ItemIndex > 0 then
    stpTotais.Parameters.ParamByName('@id_Codigo_FPg').Value     := StrToInt(cbbCodFPg.Text)
  else
    stpTotais.Parameters.ParamByName('@id_Codigo_FPg').Value     := Null;

  stpTotais.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
  stpTotais.Parameters.ParamByName('@id_Codigo_Est').Value     := Null;
  stpTotais.Parameters.ParamByName('@qt_Quantidade_VeI').Value := Null;
  stpTotais.Parameters.ParamByName('@fl_Desconto_Ven').Value   := bDesconto;
  stpTotais.Parameters.ParamByName('@fl_Congelar_Ven').Value   := Null;
  stpTotais.Parameters.ParamByName('@fl_Pendente_Ven').Value   := Null;
  stpTotais.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpTotais.Open;

  if stpTotais.Fields.FieldByName('vl_Venda_Ven').AsString <> '' then begin
    edtQtdItens.Text := stpTotais.Fields.FieldByName('qt_Volumes_Ven').asString;
    edtVlTotal.Text  := FloatToStr(stpTotais.Fields.FieldByName('vl_Venda_Ven').AsFloat + stpTotais.Fields.FieldByName('vl_Desconto_Ven').asFloat);
    edtVlDesc.Text   := stpTotais.Fields.FieldByName('vl_Desconto_Ven').AsString;
    edtTotPagar.Text := stpTotais.Fields.FieldByName('vl_Venda_Ven').AsString;
  end else begin
    edtQtdItens.Text := '0';
    edtVlTotal.Text  := '0,00';
    edtVlDesc.Text   := '0,00';
    edtTotPagar.Text := '0,00';
  end;

  if edtVlTotal.Text <> '' then begin
    Texto := edtVlTotal.Text;
    edtVlTotal.Text := PreencheZero(Texto,2,1);

    Texto := edtTotPagar.Text;
    edtTotPagar.Text := PreencheZero(Texto,2,1);

    Texto := edtVlPago.Text;
    edtVlPago.Text := PreencheZero(Texto,2,1);

    Texto := edtVlTroco.Text;
    edtVlTroco.Text := PreencheZero(Texto,2,1);

    Texto := edtVlDesc.Text;
    edtVlDesc.Text := PreencheZero(Texto,2,1);
  end;    
end;



procedure TfrmVenda.cbbFormaPagtoKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;



procedure TfrmVenda.btnFinalizarClick(Sender: TObject);
var iFormaPagto : integer;
    bDesconto   : Boolean;
begin
  if (Not(ckbCongela.Checked)) then
    if cbbFormaPagto.ItemIndex = 0 then begin
      ALERTMSG('Erro','Favor selecionar a forma de pagamento.',False);
      cbbFormaPagto.SetFocus;
      exit;
    end;
  ;

  if (Not(ckbCongela.Checked) and not(bPendente)) then begin
    if StrToFloat(edtVlPago.Text) < strToFloat(edtTotPagar.Text) then begin
      ALERTMSG('Erro','Favor informar o valor pago.',False);
      edtVlPago.SetFocus;
      exit;
    end;
  end;

  if stpVendaItem.RecordCount < 1 then begin
    ALERTMSG('Erro','Não há itens na venda.',False);
    edtCodPro.SetFocus;
    exit;
  end;

  iFormaPagto := cbbFormaPagto.ItemIndex + 100;
  bCongela    := ckbCongela.Checked;

  stpVenda.Close;
  stpVenda.Parameters.ParamByName('@sOpr').Value              := 'FZV';
  stpVenda.Parameters.ParamByName('@id_Codigo_Org').Value     := frmMain.iOrg;
  stpVenda.Parameters.ParamByName('@id_Codigo_Fil').Value     := frmMain.iFil;
  stpVenda.Parameters.ParamByName('@id_Codigo_Ven').Value     := StrToInt(edtCodVen.Text);
  stpVenda.Parameters.ParamByName('@id_Cliente_Pes').Value    := frmMain.iPessoa;
  stpVenda.Parameters.ParamByName('@id_Codigo_FPg').Value     := iFormaPagto;
  stpVenda.Parameters.ParamByName('@id_Codigo_Pro').Value     := Null;
  stpVenda.Parameters.ParamByName('@id_Codigo_Est').Value     := Null;
  stpVenda.Parameters.ParamByName('@qt_Quantidade_VeI').Value := Null;
  stpVenda.Parameters.ParamByName('@fl_Desconto_Ven').Value   := bDesconto;
  stpVenda.Parameters.ParamByName('@fl_Congelar_Ven').Value   := bCongela;
  stpVenda.Parameters.ParamByName('@fl_Pendente_Ven').Value   := bPendente;
  stpVenda.Parameters.ParamByName('@id_Codigo_Usu').Value     := frmMain.iUsu;
  stpVenda.ExecProc;

  Imprimir;

  AbreVenda;
  cbbFormaPagto.Text  := 'Selecione';
  cbbFormaPagto.ItemIndex := 0;
  bDesconto           := False;
  edtQtdItens.Text    := '0';
  edtVlTotal.Text     := '0,00';
  edtVlPago.Text      := '0,00';
  edtVlTroco.Text     := '0,00';
  edtVlDesc.Text      := '0,00';
  lblDesconto.Caption := '0,00';
  edtTotPagar.Text    := '0,00';
  ckbCongela.Checked  := False;

  frmMain.iPessoa := 0;
  frmMain.sPessoa := 'Cliente casual';
  edtPessoa.Text  := 'Cliente casual';
end;



procedure TfrmVenda.edtVlPagoExit(Sender: TObject);
Var Texto : String;
begin
  CalculaTroco;

  Texto := edtVlPago.Text;
  edtVlPago.Text := PreencheZero(Texto,2,1);

  Texto := edtVlTroco.Text;
  edtVlTroco.Text := PreencheZero(Texto,2,1);
end;



procedure TfrmVenda.ckbDescontoClick(Sender: TObject);
begin
  if cbbFormaPagto.ItemIndex > 0 then begin
    TotalizarVenda;
    CalculaTroco;

    if ckbDesconto.Checked then
      lblDesconto.Caption := 'Desconto ' + stpFormaPagto.Fields.FieldByName('Desconto').AsString + '%'
    else
      lblDesconto.Caption := 'Desconto';
  end;
end;



procedure TfrmVenda.cbbFormaPagtoChange(Sender: TObject);
begin
  bDesconto := False;
  lblDesconto.Caption := 'Desconto';

  cbbCodFPg.ItemIndex := cbbFormaPagto.ItemIndex;

  if cbbFormaPagto.ItemIndex = 0 then begin
    bDesconto := False;
    exit;
  end;

  stpFormaPagto.Close;
  stpFormaPagto.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpFormaPagto.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpFormaPagto.Parameters.ParamByName('@id_Codigo_FPg').Value := cbbCodFPg.Text;
  stpFormaPagto.Open;

  TotalizarVenda;
end;



procedure TfrmVenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  R: TRect;
begin
  IF DBGrid1.DATASOURCE = DataSource1 THEN BEGIN
    IF NOT odd(stpVendaItem.RecNo) THEN BEGIN
      IF NOT (gdSelected in State) THEN BEGIN
        DBGrid1.Canvas.Brush.Color := windows.RGB(230,230,255);
        DBGrid1.Canvas.FillRect(Rect);
        DBGrid1.DefaultDrawDataCell(rect,Column.Field,state);
      END;
      R := Rect;
      Dec(R.Bottom,2);
    END;
  END;

end;



procedure TfrmVenda.BitBtn3Click(Sender: TObject);
begin
  frmVenda.Visible := False;

  if frmProduto = Nil then
    frmProduto := TfrmProduto.Create(Self);

  frmProduto.ShowModal;

  frmVenda.Visible := True;
end;



procedure TfrmVenda.ExcluirItem1Click(Sender: TObject);
begin
  ExcluirProduto;
end;

procedure TfrmVenda.edtCodProKeyPress(Sender: TObject; var Key: Char);
begin
  if not EDITCOD(Key) then
    key := #0;
end;

procedure TfrmVenda.edtQtdProExit(Sender: TObject);
begin
  if edtQtdPro.Text = '' then
    edtQtdPro.Text := '1';
end;

procedure TfrmVenda.btnOpcClick(Sender: TObject);
begin
  PopOpc.Popup(frmVenda.Left + btnOpc.Left - btnOpc.Width - 100,frmVenda.Top + btnOpc.Top + btnOpc.Height);
end;

procedure TfrmVenda.Aplicardesconto1Click(Sender: TObject);
begin
  if cbbFormaPagto.ItemIndex = 0 then begin
    ALERTMSG('Erro','Você deve selecionar a forma de pagamento antes de aplicar o desconto.',false);
    cbbFormaPagto.SetFocus;
    exit;
  end;


  bDesconto := True;
  TotalizarVenda;
  CalculaTroco;
  lblDesconto.Caption := 'Desconto ' + stpFormaPagto.Fields.FieldByName('Desconto').AsString + '%';
end;

procedure TfrmVenda.Resetardesconto1Click(Sender: TObject);
begin
  bDesconto := False;
  TotalizarVenda;
  CalculaTroco;
  lblDesconto.Caption := 'Desconto ';
end;

procedure TfrmVenda.edtVlTotalKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure TfrmVenda.edtVlTrocoKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure TfrmVenda.edtVlDescKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure TfrmVenda.edtDescProKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmVenda.edtVlProKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmVenda.edtTotProKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmVenda.SelecionarCliente1Click(Sender: TObject);
begin
  frmVenda.Visible := False;

  frmMain.iPessoa := 0;
  frmMain.sPessoa := '0';

  if frmPessoa = Nil then
    frmPessoa := TfrmPessoa.Create(Self);

  frmPessoa.ShowModal;

  if frmMain.iPessoa <> 0 then begin
    edtPessoa.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;
  end else begin
    edtPessoa.Text := 'Cliente casual';
  end;

  frmVenda.Visible := True;
end;

procedure TfrmVenda.edtCodProChange(Sender: TObject);
begin
  edtQtdPro.Text := '1';
end;

procedure TfrmVenda.Label14Click(Sender: TObject);
begin
  IncluirProduto;
end;



procedure TfrmVenda.Abrirvendacongelada1Click(Sender: TObject);
begin
  frmVenda.Visible := False;

 if frmPsqVenda = Nil then
  frmPsqVenda := TfrmPsqVenda.Create(Self);

  frmPsqVenda.cbbStatus.ItemIndex := 2;
  frmPsqVenda.cbbStatus.Enabled := False;
  frmPsqVenda.imgPsqClick(frmPsqVenda.imgPsq);
  frmPsqVenda.ShowModal;

  if frmMain.iPessoa <> 0 then begin
    edtPessoa.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;
  end else begin
    edtPessoa.Text := 'Cliente casual';
  end;

  edtCodVen.Text := IntToStr(frmMain.iVenda);
  SelecionaItens;
  TotalizarVenda;

  frmVenda.Visible := True;
end;



procedure TfrmVenda.N2Click(Sender: TObject);
begin
  if stpVendaItem.RecordCount = 0 then begin
    ALERTMSG('Erro','Não é possível congelar uma venda que não contém itens.',False);
    exit;
  end;

  if not(ALERTMSG('Congelar venda','Deseja mesmo congelar a venda ' + edtCodVen.Text + '?',True)) then
    exit;


  bCongela := True;
  ckbCongela.Checked := True;
  btnFinalizar.Click;
end;



procedure TfrmVenda.Salvarvendacomopendente1Click(Sender: TObject);
begin
  if not(ALERTMSG('Tornar venda pendente','Deseja mesmo salvar a venda ' + edtCodVen.Text + ' como pendente?',True)) then
    exit;

  if stpVendaItem.RecordCount = 0 then begin
    ALERTMSG('Erro','Não é possível tornar pendente uma venda que não contém itens.',False);
    exit;
  end;

  if edtPessoa.Text = 'Cliente casual' then begin
    ALERTMSG('Erro','Você deve primeiro selecionar um cliente para depois tornar a venda pendente.',False);
    exit;
  end;

  bPendente := True;
  btnFinalizar.Click;
end;



procedure TfrmVenda.Abrirvendapendente1Click(Sender: TObject);
begin
  frmVenda.Visible := False;

 if frmPsqVenda = Nil then
  frmPsqVenda := TfrmPsqVenda.Create(Self);

 frmPsqVenda.cbbStatus.ItemIndex := 4;
 frmPsqVenda.cbbStatus.Enabled := False;
 frmPsqVenda.imgPsqClick(frmPsqVenda.imgPsq);
 frmPsqVenda.ShowModal;

  if frmMain.iPessoa <> 0 then begin
    edtPessoa.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;
  end else begin
    edtPessoa.Text := 'Cliente casual';
  end;

 edtCodVen.Text := IntToStr(frmMain.iVenda);
 SelecionaItens;
 TotalizarVenda;

 frmVenda.Visible := True;
end;

procedure TfrmVenda.CadastrodeFormasdePagto1Click(Sender: TObject);
begin
  if frmIAEFormaPagto = Nil then
    frmIAEFormaPagto := TfrmIAEFormaPagto.Create(Self);

  frmVenda.Visible := False;
  frmIAEFormaPagto.ShowModal;
  frmVenda.Visible := True;

  stpFormaPagto.Close;
  stpFormaPagto.Open;
end;

procedure TfrmVenda.Reimprimircupom1Click(Sender: TObject);
begin
  frmVenda.Visible := False;

 if frmPsqVenda = Nil then
  frmPsqVenda := TfrmPsqVenda.Create(Self);

  frmPsqVenda.cbbStatus.ItemIndex := 5;
  frmPsqVenda.cbbStatus.Enabled := False;
  frmPsqVenda.imgPsqClick(frmPsqVenda.imgPsq);
  frmPsqVenda.ShowModal;

  if frmMain.iPessoa <> 0 then begin
    edtPessoa.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;
  end else begin
    edtPessoa.Text := 'Cliente casual';
  end;

  edtCodVen.Text := IntToStr(frmMain.iVenda);
  SelecionaItens;
  TotalizarVenda;

  frmVenda.Visible := True;

  Imprimir;

  AbreVenda;
  cbbFormaPagto.Text  := 'Selecione';
  cbbFormaPagto.ItemIndex := 0;
  bDesconto           := False;
  edtQtdItens.Text    := '0';
  edtVlTotal.Text     := '0,00';
  edtVlPago.Text      := '0,00';
  edtVlTroco.Text     := '0,00';
  edtVlDesc.Text      := '0,00';
  lblDesconto.Caption := '0,00';
  edtTotPagar.Text    := '0,00';
  ckbCongela.Checked  := False;

  frmMain.iPessoa := 0;
  frmMain.sPessoa := 'Cliente casual';
  edtPessoa.Text  := 'Cliente casual';
    
end;

end.
