object frmBackup: TfrmBackup
  Left = 463
  Top = 128
  BorderStyle = bsToolWindow
  Caption = 'Backup do Sistema'
  ClientHeight = 145
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 14
    Width = 88
    Height = 13
    Caption = 'Tipo de Backup'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 62
    Width = 183
    Height = 13
    Caption = 'Pasta onde o Backup ser'#225' salvo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object edtLocalBackup: TEdit
    Left = 9
    Top = 75
    Width = 367
    Height = 20
    Color = 16770766
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = 'c:\Arquivos de Programas\Blue Bean\Backup\'
  end
  object cbbTipoBackup: TComboBox
    Left = 9
    Top = 27
    Width = 391
    Height = 21
    Color = 16770766
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ItemHeight = 13
    ItemIndex = 0
    ParentFont = False
    TabOrder = 1
    Text = 'Backup Full'
    OnKeyPress = cbbTipoBackupKeyPress
    Items.Strings = (
      'Backup Full'
      'Backup Diferencial'
      'Backup de Log')
  end
  object btnAcao: TBitBtn
    Left = 265
    Top = 113
    Width = 135
    Height = 23
    Caption = '&Executar Backup'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnAcaoClick
  end
  object btnLocal: TBitBtn
    Left = 378
    Top = 73
    Width = 22
    Height = 24
    Hint = 'Controles de unidades.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = False
    OnClick = btnLocalClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFAF9FBF6F1F8E7E4E5D3D6CCD3D5CCE5E2E1F5EFF5FAF9FAFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F1F9BFC9B1658F3A3A790032
      78002F7A00498A1C76A154C2CBB3F4EDF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F4EEF681A05E2368002F7B003B900037990538A11151B2394DAA35429A208EB4
      74F1E8F0FFFFFFFFFFFFFFFFFFF6F0F97D9D571D63003F8300408E0444940F62
      A44063AC4B5CB7495CBF4D5AC04E43AB2A8AB470F3ECF4FFFFFFFBFAFBB7C4A5
      1E5E003C7C004186033688005E9A35FFFFFFFFFFFF76B96851B93F5DBC4D5CC1
      4F419D21B8C6A7FBFAFBF5F1F65781292C68003C7E003883002D8600529525FF
      FFFFFFFFFF6BB4594AB73655BB445ABE4C50B0396B9D48F2EDF2DDDFDA2F6500
      3673003E7E024D871A3E850961983DFFFFFFFFFFFF77B36854AD4466B65963BB
      5763BF54589A33DDDCD6C6CDBC265E002D6E006B9441FFFBFFF7F1F9F5F2F7FA
      F9FBFFFEFFFFFBFFFFFDFFFFFFFF8EC4865BBC4B529B2FCACFBFC4CCB8255F00
      2D6E006E9747FFFFFFFFFBFFFFF7FFF6F6F6FFFEFFFFFFFFFFFFFFFFFFFF90C4
      8959BC4A529B2DC9CEBDD7DBD32C6300357300498310759F5165993E83A968FF
      FCFFFFFFFF9BC39083BE7990C4896FBE6361BF52569B32DADAD3F2EFF34C7A1B
      306C003A7D002F7D002A840058992DFFFDFFFFFEFF6DB45C4EB73B59BB4963C2
      575EB84B6FA44CF0EBF0FBFAFCA4B68D1E5E003C7D00478B0D46940C6BA145FF
      FEFFFFFFFF7FBC705DBE4D68C05A67C55C50AA35B1C49DFBFAFBFFFFFFF4EEF5
      628B36296C005090184B9414589C2B95BB8298C3886AB95964C25767C25B53B4
      3F81B265F0E9F0FFFFFFFFFFFFFFFFFFEBE6EB6E9444337400448A094B971340
      9C1040A21A57B44160B54B4FA23080B063E9E3E7FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF2EDF4A6B88F5888243D7D013B81013A8407468B1A6D9F4AADC199F0EA
      EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFBF0EDF1D5D7CFBE
      C9B1BEC8B0D6D7CEF0ECEFFAF9FBFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object stpBackup: TADOStoredProc
    Connection = frmMain.ADOConnection1
    ProcedureName = 'spBackup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@sOpr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@BaseLocation'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1024
        Value = Null
      end
      item
        Name = '@BackupType'
        Attributes = [paNullable]
        DataType = ftString
        Size = 32
        Value = Null
      end>
    Left = 208
  end
  object OpnBkp: TOpenDialog
    FilterIndex = 5
    InitialDir = 'desktop'
    Title = 'Selecione o arquivo de imagem para o produto'
    Left = 344
    Top = 64
  end
end
