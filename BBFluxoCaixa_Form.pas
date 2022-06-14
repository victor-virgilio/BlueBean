unit BBFluxoCaixa_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DB, ADODB,
  Menus, ImgList;

type
  TfrmFluxoCaixa = class(TForm)
    grdFluxoCaixa: TDBGrid;
    Label1: TLabel;
    Shape3: TShape;
    btnacaocaixa: TBitBtn;
    Shape2: TShape;
    Shape1: TShape;
    lblStatus: TLabel;
    lblUsu: TLabel;
    lbldthr: TLabel;
    pnlVisuCaixa: TPanel;
    dtpDtIni: TDateTimePicker;
    dtpHrIni: TDateTimePicker;
    Label2: TLabel;
    dtpDtFin: TDateTimePicker;
    dtpHrFin: TDateTimePicker;
    Label3: TLabel;
    pnloprcaixa: TPanel;
    lblVlOpr: TLabel;
    edtVlOpr: TEdit;
    edtPessoa: TEdit;
    lblPessoa: TLabel;
    btnCadPessoa: TBitBtn;
    Shape5: TShape;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    stpCaixa: TADOStoredProc;
    stpMovtoCaixa: TADOStoredProc;
    DataSource1: TDataSource;
    stpCaixaSit: TStringField;
    stpCaixaVlr: TBCDField;
    stpCaixaDtHr: TDateTimeField;
    stpCaixaUsu: TStringField;
    dtsMovtoCaixa: TDataSource;
    stpMovtoCaixaOperao: TStringField;
    stpMovtoCaixaValor: TBCDField;
    stpMovtoCaixaDtHr: TDateTimeField;
    stpMovtoCaixaUsurio: TStringField;
    edtVlEntrada: TEdit;
    Label4: TLabel;
    edtVlSaida: TEdit;
    edtVlSaldo: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    btnCancel: TButton;
    btnAcao: TBitBtn;
    Shape4: TShape;
    Shape6: TShape;
    btnOpc: TButton;
    pop: TPopupMenu;
    Registrarreforodecaixa1: TMenuItem;
    Registrarquebradecaixa1: TMenuItem;
    Registrarretiradadocaixa1: TMenuItem;
    Visulalizarmovimentoemumperodo1: TMenuItem;
    imgPesq: TImage;
    imgSalva: TImage;
    stpTotais: TADOStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure grdFluxoCaixaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnAcaoClick(Sender: TObject);
    procedure btnOpcClick(Sender: TObject);
    procedure Visulalizarmovimentoemumperodo1Click(Sender: TObject);
    procedure Registrarreforodecaixa1Click(Sender: TObject);
    procedure Registrarquebradecaixa1Click(Sender: TObject);
    procedure Registrarretiradadocaixa1Click(Sender: TObject);
    procedure edtVlOprKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadPessoaClick(Sender: TObject);
    procedure btnacaocaixaClick(Sender: TObject);
    procedure edtVlOprExit(Sender: TObject);
    procedure edtVlSaldoChange(Sender: TObject);
  private
    { Private declarations }
  public
    sOpr : string;
  end;

var
  frmFluxoCaixa: TfrmFluxoCaixa;

implementation

uses Alert_Form, AlertMsg_Form, BBMain_Form, Login_Form, LoginMsg_Form,
  MsgMain, SICK013, BBPessoa_Form;

{$R *.dfm}

procedure TfrmFluxoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmFluxoCaixa.FormDestroy(Sender: TObject);
begin
  frmFluxoCaixa := Nil;
end;



procedure TfrmFluxoCaixa.grdFluxoCaixaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Valor').asfloat >= 0 then
   begin
    (Sender as TDBGrid).Canvas.Font.Color := clgreen;
  end else begin
    (Sender as TDBGrid).Canvas.Font.Color := clred;
  end;

  (Sender as TDBGrid).Canvas.FillRect(Rect);
  (Sender as TDBGrid).DefaultDrawDataCell(Rect, (Sender as   TDBGrid).columns[datacol].field, State);
end;



procedure TfrmFluxoCaixa.btnAcaoClick(Sender: TObject);
begin
  if sOpr = 'SMC' then begin
    dtpDtIni.DateTime := trunc(dtpDtIni.Date) + frac(dtpHrIni.Time);
    dtpDtFin.DateTime := trunc(dtpDtFin.Date) + frac(dtpHrFin.Time);

    stpTotais.Close;
    stpTotais.Parameters.ParamByName('@sOpr').Value          := 'STP';
    stpTotais.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
    stpTotais.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
    stpTotais.Parameters.ParamByName('@cd_AF_StC').Value     := Null;
    stpTotais.Parameters.ParamByName('@vl_Caixa_StC').Value  := Null;
    stpTotais.Parameters.ParamByName('@id_Codigo_Pes').Value := Null;
    stpTotais.Parameters.ParamByName('@id_Codigo_Usu').Value := frmMain.iUsu;
    stpTotais.Parameters.ParamByName('@dtIni').Value         := dtpDtIni.Datetime;
    stpTotais.Parameters.ParamByName('@dtFin').Value         := dtpDtFin.Datetime;
    stpTotais.Open;

    stpTotais.First;
    edtVlEntrada.Text := Formatfloat('0.00',stpTotais.Fields.FieldByName('Valor').asFloat);
    stpTotais.Next;
    edtVlSaida.Text := Formatfloat('0.00',stpTotais.Fields.FieldByName('Valor').asFloat);
    edtVlSaldo.Text := FormatFloat('0.00',(StrToFloat(edtVlEntrada.Text) + StrToFloat(edtVlSaida.Text)));
    stpTotais.Close;

    stpCaixa.Close;
    stpCaixa.Parameters.ParamByName('@sOpr').Value          := 'SDC';
    stpCaixa.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
    stpCaixa.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
    stpCaixa.Parameters.ParamByName('@cd_AF_StC').Value     := Null;
    stpCaixa.Parameters.ParamByName('@vl_Caixa_StC').Value  := Null;
    stpCaixa.Parameters.ParamByName('@id_Codigo_Pes').Value := Null;
    stpCaixa.Parameters.ParamByName('@id_Codigo_Usu').Value := frmMain.iUsu;
    stpCaixa.Parameters.ParamByName('@dtIni').Value         := dtpDtIni.Datetime;
    stpCaixa.Parameters.ParamByName('@dtFin').Value         := dtpDtFin.Datetime;
    stpCaixa.Open;

    stpMovtoCaixa.Close;
    stpMovtoCaixa.Parameters.ParamByName('@sOpr').Value          := 'SMC';
    stpMovtoCaixa.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
    stpMovtoCaixa.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
    stpMovtoCaixa.Parameters.ParamByName('@cd_AF_StC').Value     := Null;
    stpMovtoCaixa.Parameters.ParamByName('@vl_Caixa_StC').Value  := Null;
    stpCaixa.Parameters.ParamByName('@id_Codigo_Pes').Value := Null;
    stpMovtoCaixa.Parameters.ParamByName('@id_Codigo_Usu').Value := frmMain.iUsu;
    stpMovtoCaixa.Parameters.ParamByName('@dtIni').Value         := dtpDtIni.Datetime;
    stpMovtoCaixa.Parameters.ParamByName('@dtFin').Value         := dtpDtFin.Datetime;
    stpMovtoCaixa.Open;
  end else begin

    if sOpr = 'RFC' then begin
      if StrToFloat(edtVlOpr.Text) <= 0 then begin
        ALERTMSG('Erro','Favor digitar o valor do reforço de caixa',false);
        edtVlOpr.SetFocus;
        exit;
      end;

      stpCaixa.Close;
      stpCaixa.Parameters.ParamByName('@sOpr').Value          := 'RFC';
      stpCaixa.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
      stpCaixa.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
      stpCaixa.Parameters.ParamByName('@cd_AF_StC').Value     := Null;
      stpCaixa.Parameters.ParamByName('@vl_Caixa_StC').Value  := StrToFloat(edtVlOpr.Text);
      stpCaixa.Parameters.ParamByName('@id_Codigo_Pes').Value := Null;
      stpCaixa.Parameters.ParamByName('@id_Codigo_Usu').Value := frmMain.iUsu;
      stpCaixa.Parameters.ParamByName('@dtIni').Value         := Null;
      stpCaixa.Parameters.ParamByName('@dtFin').Value         := null;
      stpCaixa.ExecProc;
    end;

    if sOpr = 'QBC' then begin
      if strToFloat(edtVlOpr.Text) <= 0 then begin
        ALERTMSG('Erro','Favor digitar o valor da quebra de caixa',false);
        edtVlOpr.SetFocus;
        exit;
      end;

      stpCaixa.Close;
      stpCaixa.Parameters.ParamByName('@sOpr').Value          := 'QBC';
      stpCaixa.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
      stpCaixa.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
      stpCaixa.Parameters.ParamByName('@cd_AF_StC').Value     := Null;
      stpCaixa.Parameters.ParamByName('@vl_Caixa_StC').Value  := StrToFloat(edtVlOpr.Text);
      stpCaixa.Parameters.ParamByName('@id_Codigo_Pes').Value := Null;
      stpCaixa.Parameters.ParamByName('@id_Codigo_Usu').Value := frmMain.iUsu;
      stpCaixa.Parameters.ParamByName('@dtIni').Value         := Null;
      stpCaixa.Parameters.ParamByName('@dtFin').Value         := null;
      stpCaixa.ExecProc;
    end;

    if sOpr = 'RRC' then begin
      if StrToFloat(edtVlOpr.Text) <= 0 then begin
        ALERTMSG('Erro','Favor digitar o valor da retirada do caixa',false);
        edtVlOpr.SetFocus;
        exit;
      end;

      if copy(edtPessoa.Text,1,1) = ' ' then begin
        ALERTMSG('Erro','Favor selecionar a pessoa responsável pela retirada',false);
        edtVlOpr.SetFocus;
        exit;
      end;

      stpCaixa.Close;
      stpCaixa.Parameters.ParamByName('@sOpr').Value          := 'RRC';
      stpCaixa.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
      stpCaixa.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
      stpCaixa.Parameters.ParamByName('@cd_AF_StC').Value     := Null;
      stpCaixa.Parameters.ParamByName('@vl_Caixa_StC').Value  := StrToFloat(edtVlOpr.Text);
      stpCaixa.Parameters.ParamByName('@id_Codigo_Pes').Value := frmMain.iPessoa;
      stpCaixa.Parameters.ParamByName('@id_Codigo_Usu').Value := frmMain.iUsu;
      stpCaixa.Parameters.ParamByName('@dtIni').Value         := Null;
      stpCaixa.Parameters.ParamByName('@dtFin').Value         := null;
      stpCaixa.ExecProc;
      frmMain.iPessoa := 0;
      frmMain.sPessoa := '';
    end;

    if sOpr = 'AFC' then begin
      if UpperCase(frmMain.stpSitCaixa.Fields.FieldByName('cd_AF_StC').AsString) = 'F' then begin

        if not(ALERTMSG('Atençao!','Confirma a abertura do caixa pelo usuário ' + frmMain.sUsu + ' na data atual(' + DateTimetoStr(now) + ')?',true)) then
          exit;

        stpCaixa.Close;
        stpCaixa.Parameters.ParamByName('@sOpr').Value          := 'AFC';
        stpCaixa.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
        stpCaixa.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
        stpCaixa.Parameters.ParamByName('@cd_AF_StC').Value     := 'A';
        stpCaixa.Parameters.ParamByName('@vl_Caixa_StC').Value  := StrToFloat(edtVlOpr.Text);
        stpCaixa.Parameters.ParamByName('@id_Codigo_Pes').Value := frmMain.iPessoa;
        stpCaixa.Parameters.ParamByName('@id_Codigo_Usu').Value := frmMain.iUsu;
        stpCaixa.Parameters.ParamByName('@dtIni').Value         := Null;
        stpCaixa.Parameters.ParamByName('@dtFin').Value         := null;
        stpCaixa.ExecProc;
        lblStatus.Caption    := ' CAIXA ABERTO ';
        lblStatus.Font.Color := $0046ECAA;
        lblUsu.Caption       := 'Usuário ' + frmMain.sUsu;
        lbldthr.Caption      := FormatDateTime('dd/mm/yyyy hh:nn',now);
        btnacaocaixa.Caption := 'Fechar o caixa';
        btnacaocaixa.Enabled := true;
      end;

      if UpperCase(frmMain.stpSitCaixa.Fields.FieldByName('cd_AF_StC').AsString) = 'A' then begin

        if not(ALERTMSG('Atençao!','Confirma o fechamento do caixa pelo usuário ' + frmMain.sUsu + ' na data atual(' + DateTimetoStr(now) + ')?',true)) then
          exit;

        stpCaixa.Close;
        stpCaixa.Parameters.ParamByName('@sOpr').Value          := 'AFC';
        stpCaixa.Parameters.ParamByName('@id_Codigo_Org').Value := frmMain.iOrg;
        stpCaixa.Parameters.ParamByName('@id_Codigo_Fil').Value := frmMain.iFil;
        stpCaixa.Parameters.ParamByName('@cd_AF_StC').Value     := 'F';
        stpCaixa.Parameters.ParamByName('@vl_Caixa_StC').Value  := StrToFloat(edtVlOpr.Text);
        stpCaixa.Parameters.ParamByName('@id_Codigo_Pes').Value := frmMain.iPessoa;
        stpCaixa.Parameters.ParamByName('@id_Codigo_Usu').Value := frmMain.iUsu;
        stpCaixa.Parameters.ParamByName('@dtIni').Value         := Null;
        stpCaixa.Parameters.ParamByName('@dtFin').Value         := null;
        stpCaixa.ExecProc;
        lblStatus.Caption    := ' CAIXA FECHADO ';
        lblStatus.Font.Color := $00783EFF;
        lblUsu.Caption       := '';
        lbldthr.Caption      := '';
        btnacaocaixa.Caption := 'ABRIR O CAIXA';
        btnacaocaixa.Enabled := true;
      end;
    end;

    edtVlOpr.Text := '0,00';
    sOpr := 'SMC';
    Visulalizarmovimentoemumperodo1Click(Self);
    btnAcaoClick(Self);
  end;
end;



procedure TfrmFluxoCaixa.btnOpcClick(Sender: TObject);
begin
 Pop.Popup(frmFluxoCaixa.Left + btnOpc.Left - btnOpc.Width - 180,frmFluxoCaixa.Top + btnOpc.Top + btnOpc.Height);
end;



procedure TfrmFluxoCaixa.Visulalizarmovimentoemumperodo1Click(Sender: TObject);
begin
  sOpr := 'SMC';
  pnlVisuCaixa.Visible := True;
  pnlOprCaixa.Visible  := False;
  btnAcao.Caption      := 'Pesquisar ';
  btnAcao.Glyph        := imgPesq.Picture.Bitmap;
  btnCancel.Enabled    := false;
  btnopc.Enabled       := true;
end;

procedure TfrmFluxoCaixa.Registrarreforodecaixa1Click(Sender: TObject);
begin
  sOpr := 'RFC';
  pnlVisuCaixa.Visible := False;
  pnlOprCaixa.Visible  := True;
  lblVlOpr.Caption     := 'Valor reforço';
  lblPessoa.Caption    := 'Motivo';
  lblPessoa.Visible    := True;
  edtPessoa.Visible    := True;
  edtPessoa.Text       := '';
  edtPessoa.Color      := clWhite;
  edtPessoa.Font.Color := clNavy;
  edtPessoa.Font.Style := [];
  btnCadPessoa.Visible := false;
  btnAcao.Caption      := 'Salvar   ';
  btnAcao.Glyph        := imgSalva.Picture.Bitmap;
  btnCancel.Enabled    := True;
  btnopc.Enabled       := False;
end;

procedure TfrmFluxoCaixa.Registrarquebradecaixa1Click(Sender: TObject);
begin
  sOpr := 'QBC';
  pnlVisuCaixa.Visible := False;
  pnlOprCaixa.Visible  := True;
  lblVlOpr.Caption     := 'Valor quebra';
  lblPessoa.Caption    := 'Motivo';
  edtPessoa.Text       := '';
  edtPessoa.Color      := clWhite;
  edtPessoa.Font.Color := clNavy;
  edtPessoa.Font.Style := [];
  lblPessoa.Visible    := True;
  edtPessoa.Visible    := True;
  btnCadPessoa.Visible := false;
  btnAcao.Caption      := 'Salvar   ';
  btnAcao.Glyph        := imgSalva.Picture.Bitmap;
  btnCancel.Enabled    := True;
  btnopc.Enabled       := False;
end;

procedure TfrmFluxoCaixa.Registrarretiradadocaixa1Click(Sender: TObject);
begin
  sOpr := 'RRC';
  pnlVisuCaixa.Visible := False;
  pnlOprCaixa.Visible  := True;
  lblVlOpr.Caption     := 'Valor retirada';
  lblPessoa.Caption    := 'Pessoa';
  edtPessoa.Text       := '                   Clique aqui para selecionar ----->';
  edtPessoa.Color      := $00FFE6CE;
  edtPessoa.Font.Color := clGray;
  edtPessoa.Font.Style := [fsItalic];
  lblPessoa.Visible    := True;
  edtPessoa.Visible    := True;
  btnCadPessoa.Visible := True;
  btnAcao.Caption      := 'Salvar   ';
  btnAcao.Glyph        := imgSalva.Picture.Bitmap;
  btnCancel.Enabled    := True;
  btnopc.Enabled       := False;
end;



procedure TfrmFluxoCaixa.edtVlOprKeyPress(Sender: TObject; var Key: Char);
begin
  if not(EDITMONEY(key,edtVlOpr,6,2)) then
    key := #0;
end;



procedure TfrmFluxoCaixa.btnCancelClick(Sender: TObject);
begin
  Visulalizarmovimentoemumperodo1Click(Self);
  edtVlOpr.Text  := '0,00';
  edtPessoa.Text := '                   Clique aqui para selecionar ----->';
  btnacaocaixa.Enabled := True;
end;



procedure TfrmFluxoCaixa.FormShow(Sender: TObject);
begin
  if not(frmMain.stpPermissao.FieldByName('Rotinas de caixa').AsBoolean) then begin
    ALERTMSG('Erro de Permissão','O seu usuário não possui permissão para acessar esse módulo do sistema.',false);
    PostMessage(frmFluxoCaixa.Handle, WM_CLOSE, 0, 0)
  end;

  dtpDtIni.DateTime := Now;
  dtpDtFin.DateTime := Now;

  sOpr := 'SMC';

  if UpperCase(frmMain.stpSitCaixa.Fields.FieldByName('cd_AF_StC').AsString) = 'A' then begin
    lblStatus.Caption    := ' CAIXA ABERTO ';
    lblStatus.Font.Color := $0046ECAA;
    lblUsu.Caption       := 'Usuário ' + frmMain.stpSitCaixa.Fields.fieldbyName('ds_login_usu').AsString;
    lbldthr.Caption      := FormatDateTime('dd/mm/yyyy hh:nn',frmMain.stpSitCaixa.Fields.fieldbyName('dt_Alteracao_StC').AsDateTime);
    btnacaocaixa.Caption := 'Fechar o caixa';
  end else begin
    lblStatus.Caption    := ' CAIXA FECHADO ';
    lblStatus.Font.Color := $00783EFF;
    lblUsu.Caption       := '';
    lbldthr.Caption      := '';
    btnacaocaixa.Caption := 'Abrir o caixa';
  end;
end;



procedure TfrmFluxoCaixa.btnCadPessoaClick(Sender: TObject);
begin
  if frmPessoa = nil then
    frmPessoa := TfrmPessoa.Create(Self);

  frmPessoa.ShowModal;

  if frmMain.iPessoa <> 0 then
    edtPessoa.Text := IntToStr(frmMain.iPessoa) + ' - ' + frmMain.sPessoa;
end;



procedure TfrmFluxoCaixa.btnacaocaixaClick(Sender: TObject);
begin
  frmMain.stpSitCaixa.Close;
  frmMain.stpSitCaixa.open;

  if UpperCase(frmMain.stpSitCaixa.Fields.FieldByName('cd_AF_StC').AsString) = 'F' then begin
    pnloprcaixa.Visible  := true;
    pnlVisuCaixa.Visible := false;
    lblVlOpr.Caption     := 'Vlr abertura';
    edtPessoa.Visible    := False;
    lblPessoa.Visible    := false;
    btnCadPessoa.Visible := false;
    btnAcao.Caption      := 'Salvar';
    btnAcao.Glyph        := imgSalva.Picture.Bitmap;
    btnOpc.Enabled       := False;
    btnCancel.Enabled    := true;
    sOpr := 'AFC';
    btnacaocaixa.Enabled := False;
  end;

  if UpperCase(frmMain.stpSitCaixa.Fields.FieldByName('cd_AF_StC').AsString) = 'A' then begin
    pnloprcaixa.Visible  := true;
    pnlVisuCaixa.Visible := false;
    lblVlOpr.Caption     := 'Valor fechamento';
    edtPessoa.Visible    := False;
    lblPessoa.Visible    := false;
    btnCadPessoa.Visible := false;
    btnAcao.Caption      := 'Salvar';
    btnAcao.Glyph        := imgSalva.Picture.Bitmap;
    btnOpc.Enabled       := False;
    btnCancel.Enabled    := true;
    sOpr := 'AFC';
    btnacaocaixa.Enabled := False;
  end;
end;



procedure TfrmFluxoCaixa.edtVlOprExit(Sender: TObject);
begin
  if ((edtVlOpr.Text = '') or (edtVlOpr.Text = ',')) then
    edtVlOpr.Text := '0,00';
end;

procedure TfrmFluxoCaixa.edtVlSaldoChange(Sender: TObject);
begin
  if StrToFloat(edtVlSaldo.Text) >= 0 then
    edtVlSaldo.Color := $0082F2C6
  else
    edtVlSaldo.Color := $00BC9FFF;
end;

end.
