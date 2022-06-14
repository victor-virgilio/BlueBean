unit BBVendaPagto_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids;

type
  TfrmVendaPagto = class(TForm)
    DBGrid1: TDBGrid;
    btnInc: TBitBtn;
    btnAlt: TBitBtn;
    btnExc: TBitBtn;
    Shape3: TShape;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendaPagto: TfrmVendaPagto;

implementation

{$R *.dfm}

procedure TfrmVendaPagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
