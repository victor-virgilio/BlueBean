object frmIAEFormaPagto: TfrmIAEFormaPagto
  Left = 360
  Top = 182
  BorderStyle = bsToolWindow
  Caption = 'Blue Bean - Formas de pagamento'
  ClientHeight = 257
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 330
    Top = 54
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 402
    Top = 54
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Shape3: TShape
    Left = 313
    Top = -9
    Width = 7
    Height = 295
    Brush.Color = 16702885
    Pen.Color = clBlue
  end
  object Label4: TLabel
    Left = 330
    Top = 150
    Width = 63
    Height = 13
    Caption = 'Observa'#231#245'es'
  end
  object Label6: TLabel
    Left = 165
    Top = 13
    Width = 97
    Height = 13
    Caption = 'N'#250'mero de registros:'
  end
  object lblNumReg: TLabel
    Left = 266
    Top = 14
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = '00000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 9
    Top = 14
    Width = 125
    Height = 13
    Caption = 'Formas de pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape2: TShape
    Left = 320
    Top = 37
    Width = 477
    Height = 7
    Brush.Color = 16702885
    Pen.Color = clBlue
  end
  object Shape4: TShape
    Left = 317
    Top = 38
    Width = 23
    Height = 5
    Brush.Color = 16702885
    Pen.Color = 16702885
  end
  object Label3: TLabel
    Left = 330
    Top = 102
    Width = 23
    Height = 13
    Caption = 'Sigla'
  end
  object Label7: TLabel
    Left = 490
    Top = 102
    Width = 57
    Height = 13
    Caption = 'Desconto %'
  end
  object edtCod: TEdit
    Left = 329
    Top = 67
    Width = 55
    Height = 21
    Hint = 'Este c'#243'digo '#233' autom'#225'tico e n'#227'o pode ser alterado.'
    TabStop = False
    Color = 16770766
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 8
  end
  object edtDesc: TEdit
    Left = 401
    Top = 67
    Width = 215
    Height = 21
    Hint = 'Digite aqui um nome para  a forma de pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object mmObs: TMemo
    Left = 329
    Top = 163
    Width = 287
    Height = 53
    Hint = 'Digite aqui informa'#231#245'es relevantes '#224' forma de pagamento.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 300
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 7
  end
  object btnInc: TBitBtn
    Left = 524
    Top = 9
    Width = 28
    Height = 23
    Hint = 'Incluir novo cadastro de forma de pagamento.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnIncClick
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
  object btnAlt: TBitBtn
    Left = 556
    Top = 9
    Width = 28
    Height = 23
    Hint = 'Alterar cadastro de forma de pagamento.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnAltClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000918C8BC3C7CB
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0AFB1B43A4D626486A8B5C5D4FEFEFEF0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0293645
      445B745982A87BBFECF5FAFEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F09194992A36445DA5DF63C2FF8DD2FEF5FAFEF0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      1942792787D769B3EC83CAFD87D0FCF5FAFEF0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F015509A217FCB7CBDEF8CCEFE85
      CFFCF5FAFEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0154F96207ECD8FC6F28ACDFE85CFFCF5FAFEF0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0114D962B83CF9F
      CFF586CBFE85CFFCF5FAFEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F00F4B963D8FD1A3D2F684CAFD86CFFBF5FAFEF0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00F
      4B96529AD799C9EC7BC0F373CDFFF8FAFCF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0124E975CA0D890C9F7A0D2F5E2E1
      DEFAF9F9F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F012509C8DBADEF1E4D9FAF6F4F2E6DBF9FAFBF0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0979492DBD6D0FAF5
      F0FEF5EF6AB2E6F5FAFCF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0807973EBE5E14E9BCE41B7F962C3F7F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F04F6F
      892388C950C6FFB6DCF1F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0347AAA83C0E8F0F0F0}
  end
  object btnExc: TBitBtn
    Left = 588
    Top = 9
    Width = 28
    Height = 23
    Hint = 'Excluir cadastro de forma de pagamento.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnExcClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F4F4ECD8D7DEC0BCD5BFBBD4D8D7DCF4F3EAF0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F5F6EB9F9ACE3C2FB21608AE0E
      00B20900B72318C05047C5A7A3D2F5F4E7F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      EEEFE5584DB70700A61607BA281AC92B1ED4271ADF352CEA2920E81D13DB6860
      D2EEEDE1F0F0F0F0F0F0F0F0F0F5F5EA574CB60700A41A0AB42A1EB31C0CC42A
      1DD8281CE32C23E83C35E02821F11C15EC6861D3F5F4E7F0F0F0F0F0F09E98CB
      04009B1303A95047ADF6F7E45850B70C00CE0B00DB6B65D3FCFCEE625DD6231C
      EF1D13DBA7A2D3F0F0F0F4F4EC392DAA0C00A13F34A8FFFFEDFFFFF7FFFFED42
      39B84139BEFFFFF7FFFFFFFFFFF8504ADD241BEA5249C8F3F2E9D6D6DF13039C
      1F11A91E10A7A39FC6FFFFF4FFFFF7F3F2EBF4F5ECFFFFFFFFFFFFBBB9E33C36
      E4433CF13C34CCDAD8DDBEBCD60A00992717AA2312B40B00A88E88C1F8F9EDF9
      F9F7FFFFFFFFFFFFA9A6E12C24E0423BF34940F1332ACEC7C4D8BEBAD60A0099
      2617AA2A1AB40700B1473DAAFCFDF2FBFBFBFEFEFFFFFFFC6561D0261EEB4740
      F34740F1332ACEC6C2D8D6D4DF12039C2315AA1404AB544AAEFFFFF2FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFB716DD7352CEB453EF03A31CCDBD8DDF4F4EC392DAA
      0D00A24034A8FFFFF0FFFFFDFFFFFF9A96CF9C97D2FFFFFFFFFFFFFFFFFB5F5A
      DF322AEC5B52CCF2F2E9F0F0F09E98CD02009C190AA5A09BC7FFFFFFABA8D116
      0AC51408CFB5B1E0FFFFFFB2B1E33B35E92A22DFADA9D5F0F0F0F0F0F0F5F5EA
      564CB60900A6281AB07871C32C1FC03527DA3024E5362CE08683E0362FE5281F
      EA736DD5F3F2E7F0F0F0F0F0F0F0F0F0EDEEE5655ABC1506AC1B0CB73526CA39
      2ED4342ADD3930E72F27E22B21D7756DD1EDECE1F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F4F4EAA49FCE483DB72619B01F10B41C0FB82B20BF5E55C7ADA8D3F3F2
      E7F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F3F3EBD9D7DFC3
      BFD7C2BFD5D8D7DEF3F3EAF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0}
  end
  object btnAcao: TBitBtn
    Left = 529
    Top = 225
    Width = 87
    Height = 23
    Caption = '&Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = btnAcaoClick
  end
  object grdPsq: TDBGrid
    Left = 9
    Top = 27
    Width = 295
    Height = 221
    DataSource = dtsPsqFormaPagto
    FixedColor = 16635790
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pop1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = grdPsqDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'C'#243'd'
        Title.Alignment = taRightJustify
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descri'#231#227'o'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sigla'
        Width = 50
        Visible = True
      end>
  end
  object btnCancel: TBitBtn
    Left = 329
    Top = 230
    Width = 56
    Height = 18
    Caption = '&Cancelar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnCancelClick
  end
  object edtSigla: TEdit
    Left = 329
    Top = 115
    Width = 143
    Height = 21
    Hint = 'Digite aqui uma sigla para a forma de pagamento.'
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object edtPercDesconto: TEdit
    Left = 489
    Top = 115
    Width = 127
    Height = 21
    Hint = 
      'Digite aqui um percentual (0 a 100) de desconto que ser'#225' ofereci' +
      'do ao cliente que utilizar essa forma de pagamento.'
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Text = '0,00'
    OnExit = edtPercDescontoExit
    OnKeyPress = edtPercDescontoKeyPress
  end
  object stpPsqFormaPagto: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    AfterScroll = stpPsqFormaPagtoAfterScroll
    ProcedureName = 'spPsqFormaPagto;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Codigo_Org'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Codigo_Fil'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Codigo_FPg'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 184
    Top = 116
    object stpPsqFormaPagtoFormaPagto: TStringField
      FieldName = 'Forma Pagto'
      ReadOnly = True
      Size = 36
    end
    object stpPsqFormaPagtoCd: TIntegerField
      FieldName = 'C'#243'd'
    end
    object stpPsqFormaPagtoDescrio: TStringField
      FieldName = 'Descri'#231#227'o'
      Size = 30
    end
    object stpPsqFormaPagtoSigla: TStringField
      FieldName = 'Sigla'
      Size = 3
    end
    object stpPsqFormaPagtods_Obs_FPg: TStringField
      FieldName = 'ds_Obs_FPg'
      Size = 300
    end
    object stpPsqFormaPagtoDesconto: TBCDField
      FieldName = 'Desconto'
      DisplayFormat = '###,##0.00'
      Precision = 5
      Size = 2
    end
  end
  object dtsPsqFormaPagto: TDataSource
    DataSet = stpPsqFormaPagto
    Left = 152
    Top = 120
  end
  object stpIAEFormaPagto: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'spIAEFormaPagto;1'
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
        Name = '@id_Codigo_Org'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Codigo_Fil'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Codigo_FPg'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ds_Descricao_FPg'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@ds_Sigla_FPg'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@qt_PercDesconto_FPg'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 5
        Value = Null
      end
      item
        Name = '@ds_Obs_Fpg'
        Attributes = [paNullable]
        DataType = ftString
        Size = 300
        Value = Null
      end
      item
        Name = '@id_Codigo_Usu'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 424
    Top = 224
  end
  object pop1: TPopupMenu
    Left = 80
    Top = 88
    object PopIncPes: TMenuItem
      Bitmap.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F1F0E9E8
        E8EAE7ECF0EAF1F2ECF5F3ECF5F0EAF1ECE7ECE9E8E8F1F1F0FEFEFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8E6E3E4F2EDF6FFFAFFF6F2
        F8DCE0D6C4CFB5B6C4A3B3C39FC2CDB3D9DED2F5F1F5FFF8FFF2EBF4E6E5E5F9
        F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E5E5F6EFFAFFFAFFC4CFB774964F4074
        0B2D68002565002668002769002569002F6D0054862880A05EC4CFB7FCF6FEF4
        EDF8E7E6E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF9F9F9E4E1E3FFFEFFC5D0B7507D23216000296B00377C
        003F850342890C428D1144901641921849952153982D448A183C7D0C608E36C4
        D0B5FFF8FFE4E2E4FAFAF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF7F7F6EBE6EDFFF9FF7D9D5B205E002E6E003F8201428805448D
        0744930D449813469C1B46A02045A12251AA355CB0445BAD4159A93F4C9B2A3D
        830F85A664F8F2F8ECE6ECF7F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFAFAFAEBE6EDF7F4F75681291F60003C7B00418404418805428D074392
        0A44980F479E1648A51D49AA2348AC2857B63F5EB94A5CB94A5CB84A5DB7485A
        B34542961E64953DF0ECEEECE7EEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE5E2E5FBF7FE527D242362003E7B003F8102408604418B06428F084493
        0B3C9305308F0031940432990A319C0F50B2385FBC4C5CBC4B5CBC4C5CBD4C5C
        BC4D5DBF4E46A12B619339F6EFF5E6E2E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E7E5E5FFFDFF72954B1F5D003D7A013E7E013F8302408704418B06428F083B8D
        0057972E85AD7180AD6B82B06F8CB77C6EB15B55B5405CBC4B5CBC4C5CBC4C5C
        BC4C5CBE4C5EBE4F449B237BA157FFF6FFE7E6E5FFFFFFFFFFFFFFFFFFF9F9F9
        F8F2FEB5C4A21D59003A74003D7A013E7F01408402418805428C0744910A2F86
        0085AA6EFFFFFFFFFFFFFFFFFFFFFFFF9CC19345AB305DBD4C5CBC4C5CBC4C5C
        BC4C5CBC4C5CBD4D5BB6483D8912B4C4A0F7F0FBF9F9F9FFFFFFFFFFFFE7E5E5
        F8F4F941700B2F68003C76023D7B013E8001408402418805428C0744910A2E84
        007CA560FFFBFFF8F9F7F9F9F9FFFFFF92BC8845AB305DBD4C5CBC4C5CBC4C5C
        BC4C5CBC4C5CBC4C5CB84A51A333538926F2EDF1E8E5E7FFFFFFFEFEFEF6EFFB
        ACBE951E57003B72023C77023E7B013F8001408403418805428C074491092E85
        007CA661FFFFFFFCFCFCFEFEFDFFFFFF92BC8745AB305DBD4C5CBC4C5CBC4C5C
        BC4C5CBC4C5CBC4C5CBA4A5AAF443D840EAABD93F5EDF9FEFEFEF1F0F0FEF7FF
        59822C2A62003B73033D78023E7C013F8101408503428905438C074591092F86
        007DA662FFFFFFFEFFFEFFFEFFFFFFFF94BC8746AB315EBE4D5CBC4D5CBC4D5C
        BC4C5CBC4A5ABC4A5BBB4A5DB3484F992A6A9443F8F3FAF1F1F0EBE9EBE4E5DF
        2E6200366D003C74033D78023E7D00387D00337B00348100358400378A00217D
        0074A056FFFFFFFDFDFCFEFEFEFFFFFF8DB88039A42152B83F50B73F50B63E51
        B63F59BB4964C05667C05867BB5565AB48538A27DFE1D9EBE9EBF0EAF0BDCAAD
        225A003A70033C75033D7B023879004A801856872B528425528828548A294281
        198AA875FFFCFFFBFCFBFDFDFDFFFFFF9DBC94559C4567AC5A66AB5B69AC5E73
        B06970B56462BD5467C15A67BB5466AE4B4C881FBFCAAFEEE9F0F4EEF89DB382
        2159003C70033C75023E7B00266A00ABBB99FFFFFFFCF4FFFDF5FFFEF6FFFEF5
        FFFAF5FCF5F5F5FAFAFAFCFCFBFFFEFEFFFDFFFFFEFFFFFEFFFFFDFFFFFEFFFF
        FFFFC8D7C450AE4168C35A67BB5566B04E4D8C22A5BA8DF1ECF4F5EFFB8BA76E
        215B003C71033C76023E7B00246800A1B38DFFFAFFEDECECF2F1F1F4F3F3F5F4
        F5F5F5F5F6F6F6FAFAFAFBFBFBFDFDFDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFBFD3BC4DAB3E68C35A67BD5566B14F50902698B07CF1EBF4F6EFFA87A367
        235B003C71033C76023E7B00256800A0B38BFDF6FFEAEBE9EDECECEEEDEDEEED
        EDEFEEEEF1F1F1F9F8F8FBFAFAFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFCFDFBFF
        FFFFBDD1BA4EAB3E68C35A67BD5566B14F50902796B079F2EBF4F5EEF892AC75
        215A003C71033C76023E7B00246800AABB9AFFFFFFFBF4FFFDF6FFFDF5FFFEF5
        FFF5F0F6EFEFEEF9FAF8FBFBFAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC8D7C54EAB3F68C35A67BD5566B14F4E8E23A0B687F1EBF4F1ECF3AFBF9A
        215A003C70033C75023D7B012E720080A160BBC7AFAEBE9DAEBF9FAFC2A0A6BB
        97C4CDBBFBF6FBFAFAF9FCFCFBFFFFFFD4DED2B9D0B3C1D5BCBFD4BCBFD4BBC9
        D9C69EC79858B54A68C15A67BC5566AF4D4C8A21B7C6A4F0E9F1EEEAEED5DBCC
        285E00386E003C75023D7A023D7E00317600266E00267300287600287C001672
        00749F59FFFEFFFAFAF9FCFCFBFFFFFF8AB37E379A224FAC3F4DAC3E4DAC3F4E
        AC3E58B54A67C15867C15967BB5464AD49508A23D7DACDECEAECF2F1F1F5F1F7
        4675153067003C74033D79023E7E013F8300418704428A05418C0548970E3E91
        0586AC6DFFFDFFF9F8F7FAF9F8FFFFFF97BF8C53B23E69C45968C25A68C25A68
        C25A67C25967C05967BF5866B9545CA53D66953EF1ECF0F2F1F1FEFEFEF9F1FE
        8FA970215C003D73033D78023E7D013F81024085033E870246900D549B1D3C8E
        0484AA6BFFFCFFF5F5F4F7F7F6FFFEFF97BD8C52B03D68C15867C05967C05967
        C05967C05967C05967C05867B8535095289CB581F4ECF8FEFEFEFFFFFFE9E7EB
        E3E5DE2E6400356E003D77023E7C013F80013D8300468C0B50941C51991B3C8E
        0384AA6BFFFAFFF0F0EFF5F5F4FFFDFF96BE8C52B03E68C15967C05967C05967
        C05967C05967C05967BF5863B24A54902AE1E2DBE9E6E9FFFFFFFFFFFFF9F9F9
        FBF3FF8CA66D1E5A003C76013E7B013C7E004587084F901A4F941951991B3C8E
        0388AD71FFFDFFF6F0F7FDF8FEFFFFFF9AC09052AF3E68C15967C05967C05967
        C05967C05967C05968BE584E9B2B9CB781F6EEFAF9F9F9FFFFFFFFFFFFFFFFFF
        E9E7E9F7F1F74877162A67003D79004280064E8D174E90174F931851991B4191
        0980AB64E7E4E8D5DAD3DDE1DAEFEBEE8FBD8458B54468C15967C05967C05967
        C05967C05968C35B59AD416A9B42F2ECF0EAE7E9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEDE7EFDCE0D42D6400326E004E85164D8C154D8F174E931850971A509A
        1A4A9719429017419419429820439C2650AE3A68BF5667BF5767BF5867BF5867
        BF5768BF585DB14757952FDCDED2EAE5EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFAFAFAF3EDF9CCD5C13C70043C76024E86144D8C164E90174F95195099
        19519E1F51A32352A92853AD2E52AF3156B43D67BD5467BD5466BC5466BA5467
        B85259A93D55942DCFD6C3F0E9F3FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF7F6F6F3ECF8DADED4527F22316D0049830E4D8C174E90174F94
        1951981D519D2353A12853A52E54A93254AA3664B34D67B35165B14F62AA464E
        962766993FD9DDD1F1E9F3F7F7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF9F9F9EBE7EEF1EFF38BA76D3A700036720046810A4D8C
        144E911A51951F519823529A28529C2C509C2D5FA43E5FA13C4E9025518B2696
        B37BEFEBEFEBE5EDF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAE7E9FAF1FEDDE0D789A76A4D7C193770
        003573003979003B7D033C7E063A7D06347801427F1363923A95B079DCDFD5F6
        EDF9EAE7E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8EBE8EBF7EFFDEDEBEEC9D2
        BEA3B88C89A6697C9C567A9C5789A669A3B78AC9D2BEEDE9ECF5EDF7EBE7EBF8
        F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F1F2EEEB
        EFF2ECF4F3ECF6F3ECF7F3ECF7F3ECF6F2ECF4EEECEFF2F1F2FEFEFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = '&Incluir nova forma de pagamento'
    end
    object PopAltPes: TMenuItem
      Bitmap.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000000000000000000000000000000000008E8D8DBFBEBE
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0B1B1B2413F3E
        5F5854ACB9C6F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0332D2D
        39465548688855789999B1C7EAEFF3F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F099A1A9
        2535463B536B4D6C8A5A80A26087AB87A4BED7E2EBF0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        212D3C2B3D503F59735273935D85A96283A37199BEB0DBFCF0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        737A83212E3D34475F445F7C5775974A80B367B9EB99E0FFAFD7F9F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        E7E8EA19232F2B3B4E35465C658CAE5CB7FE239CFF8AD6FF93D9FEAFD8F8F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F04C535D2127322E41554D9CDC83C1ED57AAEE49A8FA91D9FF91D9FEAFD8
        F9F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0CACCD0151B2819528C1883DA4C9FE180BAE663B1EF67B7FB8AD5FF91D9
        FEAFD8F9F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F087A0C5104D9F1062B0197DCF4C9FE17AB9E57FBEF16AB8FC89D5
        FF91D9FEAFD8F9F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F08AA0C2104A941062AF197DCF4A9DE181BBE693C8F567B7
        FA89D5FF91D9FEAFD8F9F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F08A9FC1104A941062AF197DCF479AE192C5E996CB
        F664B5FA88D5FF91D9FEAFD8F9F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08A9FC1104A941062AF197DCE479CE0A5CE
        ED94C9F465B5FA89D5FF91D9FEAFD8F9F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08A9FC1104A941062B0157ACD53A3
        E3B0D5EF90C6F465B6FA89D5FF91D9FEAFD8F9F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08A9FC1104A941062B01279
        CD67ADE6B2D6F08FC6F465B6FA89D5FF91D9FEAFD8F9F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08A9FC1104A940E60
        AF157ACE7BB8EAAFD5F08FC6F465B6FA89D5FF91D9FEAFD8F8F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0899FC1124A
        940A5EAF2181CF88C0ECABD3EE8EC6F465B6FA8AD5FF91D9FEAFD8F9F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08A9F
        C1114A94075CAF338BD48DC2EDA9D1EE8FC6F466B7FB8BD6FF91D9FEAFD8F8F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F08A9FC1104A94075CAE4798D88CC3EDACD4F07CB7E55AA8E88BD6FF91D9FEAD
        D8FAF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F08A9FC10E48920D5FAF59A2DD81B9E59CC8E977B1E065B6FA8AD5FF86
        D6FFABD6F7F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F08A9FC10A46921866B35EA3DA7CB6E4ABD3F18FC7F45BB3FE92
        DAFFD2E0E5E7E4E2F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0899FC10844902871B869ABE285BDEB9DCEF29BC9EDDE
        DDDEFEF5EEDBDAD9D7D5D5F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0899FC1064391367ABD5EA8E292C1E7DED4CBD2
        CCC7EFEEEFFEFFFFE0DEDED1D1D0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0899FC10040924986C2DAD8D5DCD7D2EC
        EBEBD9D8D7F6F6F7FFFFFFDBDBDAF9EEE6F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08399BE7D8696EBE1D8C7C4C5E1
        E1E0F0F1F0E4E5E4F4F4F4FFFFF8F4EFEC9AC5E8F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0BBB7B387827EBAB7B6C4
        C2C1E8E7E8EEEDECF2E5DBD2DCE53294DC299FF099CAEBF0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A09E9C797573B3
        B1AFD6D5D5FCF0E8BECAD52085CA35A2E559BFF85BC6FFA7CFE8F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F09E9C9B71
        6E6CF4EBE6CDD4D91A72AF339BDB59BEF465C9FC67D0FF50BEFEF0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0AC
        AAA8B9B4B1205D891C76B249AAE45AC1F664CBFD4BBFFEB7DCF4F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F09DA9B3003D6A2D7AAE48A8E456BBF44EBDFA67B3E4F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0839CB02064913B99D340ABEF56A6DCF0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F096AFC32978B091BFE1F0F0F0F0F0F0F0F0F0}
      Caption = '&Alterar forma de pagamento'
    end
    object PopExcPes: TMenuItem
      Bitmap.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F2F1EFEE
        E9F3F3E6F7F8E8F9F9E7F9F9E7F8F8E8F3F3E7EEEDE7F2F1F1FEFEFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8EBEAE4FDFDE8F8FAECD3D1
        E1A9A5D48881C87871C2776FC2877EC7A7A2D2D8D6E3F6F7EBF9FAE7EAE9E5F9
        F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAE9E6FEFFEBE6E6E9857EC73529AB0F01
        A00800A20A00A50C00A90C00AB0800AB0C00AB291DB2483DB8918BCDE6E5E7FC
        FDE9EAE9E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F9EDEDE2FBFCEF877FC7190AA10700A11A0BAE2618
        B72A1CBE291CC3291DC7281CCB251ACD2E24D13C32D22E24CB2014BD2F24B692
        8CCEFBF9ECECEBE0FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF7F6F6F6F6E5E2E0E83A2EAB05009C1F11AE2A1CB82B1DBC2B1C
        C22B1DC72A1DCD291DD3281CD62419DC3329E23D36E33A32E33B33E1342BDA1D
        12C74E45C0E3E2E5F3F4E3F7F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFAFAFAF6F7E5D4D1E41B0FA01000A0291BB1291BB82A1CBE2B1DC32B1D
        C72B1DCC2B1DD22A1DD7291DDC251AE1372EE93D35EB3A33ED3932ED3A32EB3A
        32EB261CDB3328BFD8D6E2F3F4E3FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEEEDE1E2E0E81A0D9F1305A2291BB1291BB52A1CBB2315BD2315C12D1E
        C92B1DCC2A1DD2291DD7291DDC261AE13B30E93E35ED3129EC322BEF3933F139
        32EF3B34F12A21E23329BFE4E2E6ECEBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        EAE8E5FCFCF0392DAA0E009E281AAE281AB22B1DB91A0CB12E23A7362CAB1709
        BB2D1FCF2A1DD22A1DD7291DDC271BE13D33EC2A21E14740D3403AD22922E63B
        34F13932EF3934F1261DDB4E45C1FBFBECEAE8E5FFFFFFFFFFFFFFFFFFF9F9F9
        FFFFEB8780C70200952518A82719AD2A1CB51809AE190D91DBDADAEDECE2251A
        991707BF2C1FD52A1DD7291BDC2A1EE4291FDE3932BEF8F8ECE7E7E82C27BF29
        21E63B34F23932EF3A32E91E13C6938DCFFDFDE7F9F9F9FFFFFFFFFFFFEAEAE4
        E5E5E917089C1C0EA12518AA281AB01809A91A0E8ECFCED5FFFFF4FFFFF4E0DF
        DD251A9E1507C52C1FDB291DE0160AD73A32BBECEBEAFFFFFDFFFFFFDFDFE82C
        27C02920E63A33F13A32EB342BDB3025B8E6E5E6EAE9E4FFFFFFFEFEFEFCFCE9
        857EC60500952418A62618AB1F10AA281E96D0CED4FFFFF4EAE9EAECEBECFFFF
        F7E0E0DC241AA11608CD1408D4241CAFE8E9E5FFFFFFFCFBFCFBFBFBFFFFFFE2
        E2E93C36C93029EB3932EF3A32E31D13BF908ACCF9F9E8FEFEFEF2F1F0F7F8ED
        3327A516099C2417A72618AD1203A09B96C2FFFFFDEAE9E9EAEAEAEEEDEDF0EF
        EFFFFFF8E1E0DF170D9C170DA1E0DFDFFFFFFFFFFFFFFEFEFEFDFDFDFEFEFCFF
        FFFFACABDF241BE23A33EF3F37E6372ECF5147BCF7F7EBF2F1F0EEEEE8D4D1E3
        0D00972113A12517A82618AC2214AE170A93B1B0C6FFFFF5EBEBEAEEEDEDF0EF
        EFF2F1F2FFFFF9D1D0D8CECCD5FFFFFAFEFEFDFEFEFEFFFFFFFFFFFEFFFFFFC7
        C7E1322BCA4039EE4842F04A42E94840DA372EBAD9D7E3EDECE7F3F2E7A7A3D3
        0600942417A32517A82718AD281AB21E0EB00D0090B3AFC7FFFFF6ECEBEBEDEC
        EEF2F1F1F3F3F3FCFCF6FDFDF8F9F9F9FEFEFEFEFEFEFFFFFFFFFFFFCAC8E22F
        28C73E38ED4942F14740EF4840EB4841DD3127BDB6B1D8F0F0E5F7F7E7867FC6
        0600952517A42517A92718AD281AB12B1AB81E10B40D0093B3AFC8FFFFF6ECEB
        EBEFEDEEF3F2F2F5F6F6F9F9F9FBFBFBFEFEFEFFFFFFFFFFFFCAC9E22E29C73D
        36EE4740F14740EF4740EF4840EB4941DF3127C19994D0F4F4E6F8F8E8766EC1
        0900972517A52517A92718AD2819B1291AB52B1BBC2011BA0E0299A9A4C5F8F9
        EFEDECEBF1F0F0F9FAFAFAFAFAFCFCFBFEFEFEFFFFFFC1BFDF302BC83E36EE47
        40F14740EF4740EF4740EF4840EC4941E0342AC28C87CCF5F4E5F8F8E8756DC0
        0900972517A52517A92718AD2819B1291AB52A1BB92D1FC30A00AD1F1586F2F1
        E9F5F3F2F7F7F6F9F9F9FAFAFAFCFCFCFFFFFFFDFDF8423DAE2B22E04942F547
        40EF4740EF4740EF4740EF4840EC4941E0342AC28C85CCF5F4E5F7F7E7867EC6
        0600952517A52517A92718AD2819B1291AB52C1DBC1505B0251A98DEDDE2FFFF
        F9F8F7F7FAFAFAFAFAFAFCFCFBFEFEFEFFFFFFFFFFFFEBEAF14743C3342CE549
        42F24740EF4740EF4740EF4840EB4941DF3127BF9994D0F4F4E6F3F2E5A6A2D3
        0700942317A42517A92718AD2819B12B1CB81404AC231994E3E2E0FFFFFBF7F7
        F6FBFBFCFCFCFBFCFCFCFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFF0F0F04540C234
        2CE44942F24740EF4740EF4840EB4941DD3127BDB4AFD8F0F0E5EEEDE8D2D0E2
        0D00972113A32517A82718AD291AB21404A7231891E2E1E0FFFFFAF3F3F4FAFA
        F9FBFBFAFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFF0F0F045
        40C2332CE44841F24740EF4840EA463EDB372CBBD8D6E3EDECE7F2F1F0F7F8ED
        3325A617099D2517A82718AC1E0FA9362A9BE2E1E0FFFFF9EFEDEEF7F6F6F9F8
        F8FAFAFAFFFFFFB0ADCCB0ADCDFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFF1
        F2F05550CD3E37EB4740F04840E83E35D3554BBFF5F5EAF1F1F0FEFEFEFCFCE9
        857EC60600952618A72619AD1303A19791BFFFFFFEEBEAEAF1F0F1F7F8F8F8F6
        F6FFFFFFC0BED6150AAA140AAFC0BFD9FFFFFFFFFFFEFEFEFEFEFEFEFFFFFDFF
        FFFFAFADE1352DE44741F04840E63026C59993D1F8F8E6FEFEFEFFFFFFEAEAE4
        E5E5E816089C1C0EA22719AC2415AD0F00919D9ABCFFFFF8F6F5F5F5F5F4FFFF
        FFBEBED41D13AB2F24DA2F24DE1A11B8C6C3DFFFFFFFFEFEFCFFFFFDFFFFFFB7
        B7DB312CCE443DEF4840EF423ADF3E34BFE7E6E8EAE9E3FFFFFFFFFFFFF9F9F9
        FFFFEA877FC70200952717A92719AF1F10B0100392ABA8C8FFFFFFFFFFFFBEBD
        D31E12A63022D23B2DDC3A2EE22A1FE0271EBFCCCBE2FFFFFFFFFFFFB7B6DB2B
        24CA4139EF4740F24840ED2E23CB9C95D3FAFBE7F9F9F9FFFFFFFFFFFFFFFFFF
        E9E8E5FCFBEF3B2FAA0E009C2517AC3223B63425BA1A0D9BBAB8D3CDCBDB1E14
        A32F22CD392DD8392DDA382DDF352AE5342AE7332DC7D6D5E7C5C4E32B24CB40
        3AEF4740F24840F0362CD95D54C4F9F8ECE9E8E5FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEDECE0E1E0E81B0D9F190CA2392CB5392CBB3124BC2C20B03023B43024
        C73C2FD3392DD4392DDA382DDE352AE23A32EB423AEA3F39DA3D36DB4039EE49
        40EE4842EE3A30DD4339C1E5E4E6EAEADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFAFAFAF5F6E4D5D1E42C1FA62112A63729B7392CBC3728C13829C53A2D
        CA3A2DCE392DD2382DD7382CDC352BE0362CE64B42EB463EEC463DEA4840E848
        40E4362CD54239C0DAD7E3F2F1E1FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF7F6F6F4F4E4E3E2E9493CB11607A12F21B2392CBA392CC0392C
        C3392CC8392CCC382CD1372CD5362BD83329DB483FE04A42E04841DD4239D52D
        23C35C53C2E4E3E6F2F1E1F7F7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF9F9F9EBEBE1F9FBEE8F88CA281BA6190BA5291CB13428
        B9372ABE382CC3382CC6372CC9362CCC3128CD4138CE3F35CA2F25BE3E33B99B
        95D1F8F8ECEBEADFFAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E4FCFCE8E7E7E98E88CA4338B02114
        A61A0CA71A0EA91D0FAC1D0FAE1B0CAF1609AC2C20B1584EBD9993D1E8E6E7FA
        F9E7E9E7E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8EAE9E4FAF9E7F7F7ECD5D3
        E2AFABD68F89CB827BC68078C68F88CBADA8D5D5D3E3F5F5EBF7F7E6E9E9E4F8
        F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F1F1EEED
        E7F1F1E6F6F6E6F6F7E7F6F7E6F6F5E6F1F2E6EEEDE7F2F1F1FEFEFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = '&Excluir forma de pagamento'
    end
  end
end
