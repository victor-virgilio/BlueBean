program BlueBean;

uses
  Forms,
  BBMain_Form in 'BBMain_Form.pas' {frmMain},
  Alert_Form in 'Alert_Form.pas' {frmAlert},
  AlertMsg_Form in 'AlertMsg_Form.pas' {frmAlertMsg},
  SICK013 in 'SICK013.pas',
  Login_Form in 'Login_Form.pas' {frmLogin},
  LoginMsg_Form in 'LoginMsg_Form.pas' {frmLoginMsg},
  BBPessoa_Form in 'BBPessoa_Form.pas' {frmPessoa},
  BBIAEPessoa_Form in 'BBIAEPessoa_Form.pas' {frmIAEPessoa},
  BBIAEEndereco_Form in 'BBIAEEndereco_Form.pas' {frmIAEEndereco},
  BBIAEContato_Form in 'BBIAEContato_Form.pas' {frmIAEContato},
  BBIAEProduto_Form in 'BBIAEProduto_Form.pas' {frmIAEProduto},
  BBProduto_Form in 'BBProduto_Form.pas' {frmProduto},
  BBIAEDepartamento_Form in 'BBIAEDepartamento_Form.pas' {frmIAEDepto},
  BBIAEUnidade_Form in 'BBIAEUnidade_Form.pas' {frmIAEUnidade},
  bbIAEEstoque in 'bbIAEEstoque.pas' {frmIAEEstoque},
  BBIAEFormaPagto_Form in 'BBIAEFormaPagto_Form.pas' {frmIAEFormaPagto},
  BBVenda_Form in 'BBVenda_Form.pas' {frmVenda},
  BBPsqVenda_Form in 'BBPsqVenda_Form.pas' {frmPsqVenda},
  BBCompra_Form in 'BBCompra_Form.pas' {frmCompra},
  MsgMain in 'MsgMain.pas' {frmMsgMain},
  BBPsqCompra_Form in 'BBPsqCompra_Form.pas' {frmPsqCompra},
  BBEstoqueProduto_Form in 'BBEstoqueProduto_Form.pas' {frmEstoqueProduto},
  BBRelVendas_Form in 'BBRelVendas_Form.pas' {frmRelVendas},
  BBIAEUsuario_Form in 'BBIAEUsuario_Form.pas' {frmIAEUsuario},
  BBBackup_Form in 'BBBackup_Form.pas' {frmBackup},
  BBRelCompras_Form in 'BBRelCompras_Form.pas' {frmRelCompras},
  BBFluxoCaixa_Form in 'BBFluxoCaixa_Form.pas' {frmFluxoCaixa},
  BBListaCompra_Form in 'BBListaCompra_Form.pas' {frmListaCompra},
  BBVendaPagto_Form in 'BBVendaPagto_Form.pas' {frmVendaPagto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAlert, frmAlert);
  Application.CreateForm(TfrmAlertMsg, frmAlertMsg);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmLoginMsg, frmLoginMsg);
  Application.CreateForm(TfrmMsgMain, frmMsgMain);
  Application.CreateForm(TfrmListaCompra, frmListaCompra);
  Application.CreateForm(TfrmVendaPagto, frmVendaPagto);
  Application.Run;
end.
