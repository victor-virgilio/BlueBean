unit BBEstoqueProduto_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB, ADODB, Menus;

type
  TfrmEstoqueProduto = class(TForm)
    grdEstoqueProduto: TDBGrid;
    Label4: TLabel;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    btnOpc: TBitBtn;
    btnPesq: TBitBtn;
    Shape2: TShape;
    Shape5: TShape;
    grdEstoque: TDBGrid;
    stpEstoqueOrigem: TADOStoredProc;
    dtsEstoque: TDataSource;
    pop: TPopupMenu;
    Alteraroestoquedoprodutoselecionado1: TMenuItem;
    ransferirdeumestoqueparaoutro1: TMenuItem;
    pnlTransferir: TPanel;
    grdEstoque2: TDBGrid;
    Label3: TLabel;
    btnTransf: TBitBtn;
    edtQtdTransf: TEdit;
    lblQdtTransf: TLabel;
    pnlAlterar: TPanel;
    Label6: TLabel;
    lblQtdAcao: TLabel;
    btnExecutar: TBitBtn;
    edtQtdAcao: TEdit;
    cbbAcao: TComboBox;
    edtDescProduto: TEdit;
    edtQtdAtual: TEdit;
    Label8: TLabel;
    edtQtdResultado: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Cadastrodeestoques1: TMenuItem;
    pnlPesquisa: TPanel;
    cbbDepto: TComboBox;
    stpEstoque: TADOStoredProc;
    DataSource1: TDataSource;
    edtCodProduto: TEdit;
    cbbPesquisa: TComboBox;
    DataSource2: TDataSource;
    stpPsqDepto: TADOStoredProc;
    btnCancel: TBitBtn;
    Label1: TLabel;
    DataSource3: TDataSource;
    stpEstoqueDest: TADOStoredProc;
    rbtEspecifico: TRadioButton;
    rbtGeral: TRadioButton;
    stpPsqEstoque: TADOStoredProc;
    dtsPsqEstoque: TDataSource;
    rbtIDProd: TRadioButton;
    rbtCodBarra: TRadioButton;
    stpEstoqueOrigemid_Codigo_Org: TIntegerField;
    stpEstoqueOrigemid_Codigo_Fil: TIntegerField;
    stpEstoqueOrigemCd: TIntegerField;
    stpEstoqueOrigemDescrio: TStringField;
    stpEstoqueOrigemPCompra: TBooleanField;
    stpEstoqueOrigemPVenda: TBooleanField;
    stpEstoqueOrigemds_Obs_Est: TStringField;
    stpPsqEstoqueEstoque: TStringField;
    stpPsqEstoqueCd: TIntegerField;
    stpPsqEstoqueProduto: TStringField;
    stpPsqEstoqueUnid: TStringField;
    stpPsqEstoqueDepto: TStringField;
    stpPsqEstoqueQtEstoque: TBCDField;
    stpPsqEstoqueVlEstoque: TBCDField;
    stpPsqEstoquefl_VlDecimal_UnP: TBooleanField;
    stpPsqEstoquefl_VlInteiro_UnP: TBooleanField;
    stpPsqEstoqueid_Codigo_Est: TIntegerField;
    stpEstoqueDestid_Codigo_Org: TIntegerField;
    stpEstoqueDestid_Codigo_Fil: TIntegerField;
    stpEstoqueDestCd: TIntegerField;
    stpEstoqueDestDescrio: TStringField;
    stpEstoqueDestPCompra: TBooleanField;
    stpEstoqueDestPVenda: TBooleanField;
    stpEstoqueDestds_Obs_Est: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Alteraroestoquedoprodutoselecionado1Click(Sender: TObject);
    procedure ransferirdeumestoqueparaoutro1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOpcClick(Sender: TObject);
    procedure rbtEspecificoClick(Sender: TObject);
    procedure rbtGeralClick(Sender: TObject);
    procedure cbbPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure Cadastrodeestoques1Click(Sender: TObject);
    procedure cbbPesquisaChange(Sender: TObject);
    procedure cbbDeptoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdAcaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdTransfKeyPress(Sender: TObject; var Key: Char);
    procedure cbbAcaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnExecutarClick(Sender: TObject);
    procedure edtQtdAcaoExit(Sender: TObject);
    procedure cbbAcaoChange(Sender: TObject);
    procedure btnTransfClick(Sender: TObject);
    procedure edtQtdTransfExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstoqueProduto: TfrmEstoqueProduto;

implementation

uses Alert_Form, AlertMsg_Form, bbIAEEstoque, BBProduto_Form, Login_Form,
  LoginMsg_Form, MsgMain, SICK013, BBMain_Form;

{$R *.dfm}

procedure TfrmEstoqueProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmEstoqueProduto.FormDestroy(Sender: TObject);
begin
  frmEstoqueProduto := Nil;
end;






procedure TfrmEstoqueProduto.Alteraroestoquedoprodutoselecionado1Click(
  Sender: TObject);
begin
  if (not(stpPsqEstoque.Active)) or (stpPsqEstoque.RecordCount = 0) then begin
    ALERTMSG('Erro','Você deve primeiro selecionar um produto para poder fazer a alteração no estoque',false);
    btnPesq.SetFocus;
    exit;
  end;


  pnlAlterar.Visible        := True;
  pnlTransferir.Visible     := false;
  pnlPesquisa.Visible       := False;
  btnCancel.Enabled         := True;
  btnPesq.Enabled           := False;
  grdEstoqueProduto.Enabled := False;

  edtQtdAtual.Text    := stpPsqEstoque.Fields.FieldByName('Qt. Estoque').AsString;
  edtDescProduto.Text := stpPsqEstoque.Fields.FieldByName('Cód').AsString + ' - ' + stpPsqEstoque.Fields.FieldByName('Produto').AsString;
end;

procedure TfrmEstoqueProduto.ransferirdeumestoqueparaoutro1Click(Sender: TObject);
begin
  if (not(stpPsqEstoque.Active)) or (stpPsqEstoque.RecordCount = 0) then begin
    ALERTMSG('Erro','Você deve primeiro selecionar um produto para poder fazer a transferência do estoque',false);
    btnPesq.SetFocus;
    exit;
  end;

  pnlAlterar.Visible        := False;
  pnlTransferir.Visible     := True;
  pnlPesquisa.Visible       := False;
  btnCancel.Enabled         := True;
  btnPesq.Enabled           := False;
  grdEstoqueProduto.Enabled := False;

  stpEstoqueDest.Close;
  stpEstoqueDest.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpEstoqueDest.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpEstoqueDest.Parameters.ParamByName('@id_Codigo_Est').Value := Null;
  stpEstoqueDest.Open;
end;

procedure TfrmEstoqueProduto.btnCancelClick(Sender: TObject);
begin
  pnlAlterar.Visible        := False;
  pnlTransferir.Visible     := False;
  pnlPesquisa.Visible       := True;
  btnCancel.Enabled         := False;
  btnPesq.Enabled           := True;
  grdEstoqueProduto.Enabled := True;
end;

procedure TfrmEstoqueProduto.btnOpcClick(Sender: TObject);
begin
  Pop.Popup(frmEstoqueProduto.Left + btnOpc.Left - btnOpc.Width - 240,frmEstoqueProduto.Top + btnOpc.Top + btnOpc.Height);
end;

procedure TfrmEstoqueProduto.rbtEspecificoClick(Sender: TObject);
begin
  stpEstoqueOrigem.Active  := True;
  grdEstoque.Enabled := True;
end;

procedure TfrmEstoqueProduto.rbtGeralClick(Sender: TObject);
begin
  stpEstoqueOrigem.Active  := False;
  grdEstoque.Enabled := False;
end;

procedure TfrmEstoqueProduto.Cadastrodeestoques1Click(Sender: TObject);
begin
  if frmIAEEstoque = Nil then
    frmIAEEstoque := TfrmIAEEstoque.Create(Self);

  frmEstoqueProduto.Visible := False;
  frmIAEEstoque.ShowModal;
  frmEstoqueProduto.Visible := True;
end;


procedure TfrmEstoqueProduto.cbbPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := #0;
end;

procedure TfrmEstoqueProduto.cbbDeptoKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := #0;
end;



procedure TfrmEstoqueProduto.cbbPesquisaChange(Sender: TObject);
begin
  if cbbPesquisa.ItemIndex = 0 then begin
    rbtIDProd.Visible     := False;
    rbtCodBarra.Visible   := False;
    edtCodProduto.Visible := False;
    cbbDepto.Visible      := False;

    rbtIDProd.Enabled     := false;
    rbtCodBarra.Enabled   := false;
    edtCodProduto.Enabled := false;
    cbbDepto.Enabled      := False;
  end else begin
    if cbbPesquisa.ItemIndex = 1 then begin
      rbtIDProd.Visible     := True;
      rbtCodBarra.Visible   := True;
      edtCodProduto.Visible := True;
      cbbDepto.Visible      := False;

      rbtIDProd.Enabled     := True;
      rbtCodBarra.Enabled   := True;
      edtCodProduto.Enabled := True;
      cbbDepto.Enabled      := False;
    end else begin
      if cbbPesquisa.ItemIndex = 2 then begin
        rbtIDProd.Visible     := False;
        rbtCodBarra.Visible   := False;
        edtCodProduto.Visible := False;
        cbbDepto.Visible      := True;

        rbtIDProd.Enabled     := False;
        rbtCodBarra.Enabled   := False;
        edtCodProduto.Enabled := False;
        cbbDepto.Enabled      := True;
      end;
    end;
  end;
end;



procedure TfrmEstoqueProduto.FormShow(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Controles de estoque').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    PostMessage(frmEstoqueProduto.Handle, WM_CLOSE, 0, 0);
  end;

  stpPsqDepto.Close;
  stpPsqDepto.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
  stpPsqDepto.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
  stpPsqDepto.Parameters.ParamByName('@id_Codigo_Dep').Value := Null;
  stpPsqDepto.Open;

  cbbDepto.Items.Clear;
  cbbDepto.Items.Add('Selecione o departamento');

  stpPsqDepto.First;
  while not stpPsqDepto.Eof do begin
    cbbDepto.Items.Add(stpPsqDepto.Fields.FieldByName('id_Codigo_Dep').AsString + ' - ' + stpPsqDepto.Fields.FieldByName('Depto').AsString);
    stpPsqDepto.Next;
  end;

  cbbPesquisa.ItemIndex := 0;
  cbbDepto.ItemIndex    := 0;
  cbbAcao.ItemIndex     := 0;
end;



procedure TfrmEstoqueProduto.btnPesqClick(Sender: TObject);
begin
  if cbbPesquisa.ItemIndex = 0 then begin
    stpPsqEstoque.Close;
    stpPsqEstoque.Parameters.ParamByName('@sOpr').Value            := 'SPE';
    stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Org').Value   := frmMain.iOrg;
    stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Fil').Value   := frmMain.iFil;
    stpPsqEstoque.Parameters.ParamByName('@id_COdigo_Pro').Value   := Null;
    stpPsqEstoque.Parameters.ParamByName('@ds_CodBarra_Pro').Value := Null;

    if rbtGeral.Checked then
      stpPsqEstoque.Parameters.ParamByName('@id_COdigo_Est1').Value  := Null
    else
      stpPsqEstoque.Parameters.ParamByName('@id_COdigo_Est1').Value  := stpEstoqueOrigem.Fields.FieldByName('Cód').AsInteger;

    stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Est2').Value  := Null;
    stpPsqEstoque.Parameters.ParamByName('@qt_Estoque_EsP').Value  := Null;
    stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Dep').Value   := Null;
    stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Usu').Value   := frmMain.iUsu;
    stpPsqEstoque.Open;
  end else begin
    if cbbPesquisa.ItemIndex = 1 then begin
      if edtCodProduto.Text = '' then begin
        ALERTMSG('Erro','Digite á ID do Produto ou o Código de Barras para fazer a busca no estoque.',false);
        edtCodProduto.SetFocus;
        exit;
      end;

      stpPsqEstoque.Close;
      stpPsqEstoque.Parameters.ParamByName('@sOpr').Value            := 'SPE';
      stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Org').Value   := frmMain.iOrg;
      stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Fil').Value   := frmMain.iFil;

      if rbtIDProd.Checked then begin
        stpPsqEstoque.Parameters.ParamByName('@id_COdigo_Pro').Value   := StrToInt(edtCodProduto.Text);
        stpPsqEstoque.Parameters.ParamByName('@ds_CodBarra_Pro').Value := Null;
      end else begin
        stpPsqEstoque.Parameters.ParamByName('@id_COdigo_Pro').Value   := Null;
        stpPsqEstoque.Parameters.ParamByName('@ds_CodBarra_Pro').Value := edtCodProduto.Text;
      end;

      if rbtGeral.Checked then
        stpPsqEstoque.Parameters.ParamByName('@id_COdigo_Est1').Value  := Null
      else
        stpPsqEstoque.Parameters.ParamByName('@id_COdigo_Est1').Value  := stpEstoqueOrigem.Fields.FieldByName('Cód').AsInteger;

      stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Est2').Value  := Null;
      stpPsqEstoque.Parameters.ParamByName('@qt_Estoque_EsP').Value  := Null;
      stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Dep').Value   := Null;
      stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Usu').Value   := frmMain.iUsu;
      stpPsqEstoque.Open;
    end else begin
      if cbbPesquisa.ItemIndex = 2 then begin
        if cbbDepto.ItemIndex = 0 then begin
          ALERTMSG('Erro','Selecione um departamento para fazer a busca no estoque.',false);
          cbbDepto.SetFocus;
          exit;
        end;

        stpPsqEstoque.Close;
        stpPsqEstoque.Parameters.ParamByName('@sOpr').Value            := 'SPE';
        stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Org').Value   := frmMain.iOrg;
        stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Fil').Value   := frmMain.iFil;
        stpPsqEstoque.Parameters.ParamByName('@id_COdigo_Pro').Value   := Null;
        stpPsqEstoque.Parameters.ParamByName('@ds_CodBarra_Pro').Value := Null;

        if rbtGeral.Checked then
          stpPsqEstoque.Parameters.ParamByName('@id_COdigo_Est1').Value  := Null
        else
          stpPsqEstoque.Parameters.ParamByName('@id_COdigo_Est1').Value  := stpEstoqueOrigem.Fields.FieldByName('Cód').AsInteger;

        stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Est2').Value  := Null;
        stpPsqEstoque.Parameters.ParamByName('@qt_Estoque_EsP').Value  := Null;
        stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Dep').Value   := StrToInt(Copy(cbbDepto.Text,1,pos(' -',cbbDepto.Text)-1));
        stpPsqEstoque.Parameters.ParamByName('@id_Codigo_Usu').Value   := frmMain.iUsu;
        stpPsqEstoque.Open;
      end
    end;
  end;
end;



procedure TfrmEstoqueProduto.edtCodProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not EDITCOD(key) then
    key := #0;
end;



procedure TfrmEstoqueProduto.edtQtdAcaoKeyPress(Sender: TObject; var Key: Char);
begin
  if stpPsqEstoque.FieldByName('fl_VlDecimal_UnP').AsBoolean then begin
    if not EDITMONEY(key,edtQtdAcao,6,3) then
      key := #0;
  end;

  if stpPsqEstoque.FieldByName('fl_VlInteiro_UnP').AsBoolean then begin
    if not EDITCOD(key) then
      key := #0;
  end;
end;

procedure TfrmEstoqueProduto.edtQtdTransfKeyPress(Sender: TObject;
  var Key: Char);
begin
  if stpPsqEstoque.FieldByName('fl_VlDecimal_UnP').AsBoolean then begin
    if not EDITMONEY(key,edtQtdTransf,6,3) then
      key := #0;
  end;

  if stpPsqEstoque.FieldByName('fl_VlInteiro_UnP').AsBoolean then begin
    if not EDITCOD(key) then
      key := #0;
  end;
end;

procedure TfrmEstoqueProduto.cbbAcaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := #0;
end;



procedure TfrmEstoqueProduto.btnExecutarClick(Sender: TObject);
begin
  if StrToFloat(edtQtdAcao.Text) = 0 then begin
    ALERTMSG('Erro','É necessário informar o valor.',false);
    edtQtdAcao.SetFocus;
    exit;
  end;

  if ALERTMSG('Confirmação','Você confirma a ação que vai alterar a quantidade de estoque do produto ' + stpPsqEstoque.Fields.FieldByName('Produto').AsString
                           + ' para ' + edtQtdResultado.Text + ' ' + stpPsqEstoque.Fields.FieldByName('Unid.').AsString,True)
  then begin
    stpEstoque.Close;
    if cbbAcao.ItemIndex = 0 then
      stpEstoque.Parameters.ParamByName('@sOpr').Value := 'APE'
    else
      if cbbAcao.ItemIndex = 1 then
        stpEstoque.Parameters.ParamByName('@sOpr').Value := 'SPE'
      else
        if cbbAcao.ItemIndex = 2 then
          stpEstoque.Parameters.ParamByName('@sOpr').Value := 'IEP'
        ;
      ;
    ;

    stpEstoque.Parameters.ParamByName('@id_Codigo_Org').Value   := frmMain.iOrg;
    stpEstoque.Parameters.ParamByName('@id_Codigo_Fil').Value   := frmMain.iFil;
    stpEstoque.Parameters.ParamByName('@id_Codigo_Pro').Value   := stpPsqEstoque.Fields.FieldByName('Cód').AsInteger;
    stpEstoque.Parameters.ParamByName('@ds_CodBarra_Pro').Value := Null;
    stpEstoque.Parameters.ParamByName('@id_Codigo_Est1').Value  := stpPsqEstoque.Fields.FieldByName('id_Codigo_Est').AsInteger;
    stpEstoque.Parameters.ParamByName('@id_Codigo_Est2').Value  := Null;
    stpEstoque.Parameters.ParamByName('@qt_Estoque_EsP').Value  := StrToFloat(edtQtdAcao.Text);
    stpEstoque.Parameters.ParamByName('@id_Codigo_Dep').Value   := Null;
    stpEstoque.Parameters.ParamByName('@id_Codigo_Usu').Value   := frmMain.iUsu;
    stpEstoque.ExecProc;
  end;

  edtQtdAcao.Text := '0,00';
  btnCancel.Click;
  btnPesq.Click;
end;



procedure TfrmEstoqueProduto.edtQtdAcaoExit(Sender: TObject);
begin
  if stpPsqEstoque.FieldByName('fl_VlDecimal_UnP').AsBoolean then begin
    if ((edtQtdAcao.Text = '') or (edtQtdAcao.Text = ',')) then
      edtQtdAcao.Text := '0,000';

    if pos(',',edtQtdAcao.Text) = 1 then
      edtQtdAcao.Text := '0' + edtQtdAcao.Text;

    if pos(',',edtQtdAcao.Text) = length(edtQtdAcao.Text) then
      edtQtdAcao.Text := edtQtdAcao.Text + '000';

    if cbbAcao.ItemIndex = 0 then
      edtQtdResultado.Text := FormatFloat('0.000',strToFloat(edtQtdAcao.Text) + strToFloat(edtQtdAtual.Text))
    else
      if cbbAcao.ItemIndex = 1 then
        edtQtdResultado.Text := FormatFloat('0.000',strToFloat(edtQtdAtual.Text) - strToFloat(edtQtdAcao.Text))
      else
        if cbbAcao.ItemIndex = 2 then
          edtQtdResultado.Text := FormatFloat('0.000',StrToFloat(edtQtdAcao.Text))
        ;
      ;
    ;
  end;

  if stpPsqEstoque.FieldByName('fl_VlInteiro_UnP').AsBoolean then begin
    if edtQtdAcao.Text = '' then
      edtQtdAcao.Text := '0';

    if cbbAcao.ItemIndex = 0 then
      edtQtdResultado.Text := FormatFloat('0.000',(StrToFloat(edtQtdAcao.Text) + strToFloat(edtQtdAtual.Text)))
    else
      if cbbAcao.ItemIndex = 1 then
        edtQtdResultado.Text := FormatFloat('0.000',strToFloat(edtQtdAtual.Text) - strToFloat(edtQtdAcao.Text))
      else
        if cbbAcao.ItemIndex = 2 then
          edtQtdResultado.Text := edtQtdAcao.Text
        ;
      ;
    ;
  end;
end;



procedure TfrmEstoqueProduto.cbbAcaoChange(Sender: TObject);
begin
  if stpPsqEstoque.FieldByName('fl_VlDecimal_UnP').AsBoolean then begin
    if cbbAcao.ItemIndex = 0 then
      edtQtdResultado.Text := FormatFloat('0.000',strToFloat(edtQtdAcao.Text) + strToFloat(edtQtdAtual.Text))
    else
      if cbbAcao.ItemIndex = 1 then
        edtQtdResultado.Text := FormatFloat('0.000',strToFloat(edtQtdAtual.Text) - strToFloat(edtQtdAcao.Text))
      else
        if cbbAcao.ItemIndex = 2 then
          edtQtdResultado.Text := FormatFloat('0.000',StrToFloat(edtQtdAcao.Text))
        ;
      ;
    ;
  end;

  if stpPsqEstoque.FieldByName('fl_VlInteiro_UnP').AsBoolean then begin
    if cbbAcao.ItemIndex = 0 then
      edtQtdResultado.Text := IntToStr(strToint(edtQtdAcao.Text) + strToInt(edtQtdAtual.Text))
    else
      if cbbAcao.ItemIndex = 1 then
        edtQtdResultado.Text := IntToStr(strToInt(edtQtdAtual.Text) - strToInt(edtQtdAcao.Text))
      else
        if cbbAcao.ItemIndex = 2 then
          edtQtdResultado.Text := edtQtdAcao.Text
        ;
      ;
    ;
  end;
end;



procedure TfrmEstoqueProduto.btnTransfClick(Sender: TObject);
begin
  if StrToFloat(edtQtdTransf.Text) <= 0 then begin
    ALERTMSG('Erro','O valor informado para a transferência não é válido.',False);
    edtQtdTransf.SetFocus;
    exit;
  end;

  if stpPsqEstoque.Fields.FieldByName('id_Codigo_Est').AsInteger = stpEstoqueDest.Fields.FieldByName('Cód').AsInteger then begin
    ALERTMSG('Erro','O estoque de origem e de destino é o mesmo, favor selecionar o estoque de destino correto.',False);
    grdEstoque2.SetFocus;
    exit;
  end;

  if StrToFloat(edtQtdTransf.Text) >  stpPsqEstoque.Fields.FieldByName('Qt. Estoque').AsFloat then begin
    ALERTMSG('Erro','Você não pode transferir uma quantia maior do que a quantia atual do estoque de origem.',False);
    edtQtdTransf.SetFocus;
    exit;
  end;

  if ALERTMSG('Confirmação','Você confirma a ação que vai transferir ' + edtQtdTransf.Text + ' ' + stpPsqEstoque.Fields.FieldByName('Unid.').AsString +
                            ' do produto ' + stpPsqEstoque.Fields.FieldByName('Produto').AsString + ' do estoque '
                                           + stpPsqEstoque.Fields.FieldByName('id_Codigo_Est').AsString + ' para o estoque '
                                           + stpEstoqueDest.Fields.FieldByName('Cód').AsString + '?',True)
  then begin
    stpEstoque.Close;
    stpEstoque.Parameters.ParamByName('@sOpr').Value := 'TPE';
    stpEstoque.Parameters.ParamByName('@id_Codigo_Org').Value   := frmMain.iOrg;
    stpEstoque.Parameters.ParamByName('@id_Codigo_Fil').Value   := frmMain.iFil;
    stpEstoque.Parameters.ParamByName('@id_Codigo_Pro').Value   := stpPsqEstoque.Fields.FieldByName('Cód').AsInteger;
    stpEstoque.Parameters.ParamByName('@ds_CodBarra_Pro').Value := Null;
    stpEstoque.Parameters.ParamByName('@id_Codigo_Est1').Value  := stpPsqEstoque.Fields.FieldByName('id_Codigo_Est').AsInteger;
    stpEstoque.Parameters.ParamByName('@id_Codigo_Est2').Value  := stpEstoqueDest.Fields.FieldByName('Cód').AsInteger;
    stpEstoque.Parameters.ParamByName('@qt_Estoque_EsP').Value  := StrToFloat(edtQtdTransf.Text);
    stpEstoque.Parameters.ParamByName('@id_Codigo_Dep').Value   := Null;
    stpEstoque.Parameters.ParamByName('@id_Codigo_Usu').Value   := frmMain.iUsu;
    stpEstoque.ExecProc;

   edtQtdTransf.Text := '0,00'; 
   btnCancel.Click;
   btnPesq.Click;
  end;
end;



procedure TfrmEstoqueProduto.edtQtdTransfExit(Sender: TObject);
begin
  if stpPsqEstoque.FieldByName('fl_VlDecimal_UnP').AsBoolean then begin
    if ((edtQtdTransf.Text = '') or (edtQtdTransf.Text = ',')) then
      edtQtdTransf.Text := '0,000';

    if pos(',',edtQtdTransf.Text) = 1 then
      edtQtdTransf.Text := '0' + edtQtdAcao.Text;

    if pos(',',edtQtdTransf.Text) = length(edtQtdTransf.Text) then
      edtQtdTransf.Text := edtQtdTransf.Text + '000';
  end;

  if stpPsqEstoque.FieldByName('fl_VlInteiro_UnP').AsBoolean then begin
    if edtQtdAcao.Text = '' then
      edtQtdAcao.Text := '0';
  end;
end;

end.
