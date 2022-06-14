object frmPsqVenda: TfrmPsqVenda
  Left = 422
  Top = 75
  BorderStyle = bsToolWindow
  Caption = 'Pesquisa do cadastro de vendas'
  ClientHeight = 481
  ClientWidth = 506
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
  object Label5: TLabel
    Left = 328
    Top = 135
    Width = 122
    Height = 13
    Caption = 'N'#250'mero de registros:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblNumReg: TLabel
    Left = 455
    Top = 136
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = '00000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = -25
    Top = 105
    Width = 765
    Height = 7
    Brush.Color = 16702885
    Pen.Color = clBlue
  end
  object Label1: TLabel
    Left = 258
    Top = 14
    Width = 65
    Height = 13
    Caption = 'Data Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 380
    Top = 14
    Width = 57
    Height = 13
    Caption = 'Data Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object imgPsq: TImage
    Left = 472
    Top = 70
    Width = 23
    Height = 26
    Cursor = crHandPoint
    Hint = 'Pesquisar cadastro de pessoas.'
    AutoSize = True
    ParentShowHint = False
    Picture.Data = {
      07544269746D617086070000424D860700000000000036000000280000001700
      00001A0000000100180000000000500700000000000000000000000000000000
      0000F5F5F5DADADAC8C8C8E2E2E2FDFDFDEEEEEEF0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0000000C3C3C36868686C6C6CB2B2B2EAEAEAF4F4F4EFEFEFF0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000817F80B4B3B37C7C7C737373CDCD
      CDF0F0F0F1F1F1F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000999395D5CED1
      AFAEAF7576767D7C7CE0E0E0EFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000
      0000EFEEEF938C8ED7D2D5A3A2A26B6B6B939393E4E4E4F1F1F1F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0000000F5F5F5CFCDCEA0999CD2CED1949494676766ACACACE7
      E7E7F1F1F1F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000F0F0F0F3F4F3BAB7B9AAA1A4CECA
      CC7E7D7D747474C2C2C2EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000F0F0F0F1F1F1
      F2F2F2ADAAABACA2A5C1BFBF6D6C6C858585D7D7D7F7F7F7EFEFEFF0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000
      0000F0F0F0F0F0F0F1F1F1F7F7F79F9C9DB0A7A9ABAAAB5E5E5EA4A4A4EAEAEA
      FCFCFCF2F2F2F9F9F9F5F5F5F1F1F1F7F7F7F5F5F5F1F1F1F1F1F1F0F0F0F0F0
      F0F0F0F0F0F0F0000000F0F0F0F0F0F0F0F0F0F1F1F1F9FAFAA19C9FAFA9AA8F
      8D8D5C5C5CB8B8B8D1D1D1B9B9B99E9E9E9898989E9E9FA7A7A7BAB9B9D8D8D8
      ECECECF1F1F1F0F0F0F0F0F0F0F0F0000000F0F0F0F0F0F0F0F0F0F0F0F0F2F2
      F2EDEDEDAFA9ABACA7A78787877B7B7B9D9D9EACACACC5C5C6D4D3D4C6C5C3AD
      ADAC9F9F9FA1A0A1C5C5C4E6E6E7F0F0F0F0F0F0F0F0F0000000F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F3F3F3E6E6E6A3A2A2B8B8BBC8C6C5EBE8E4FBF9F6FFFF
      FEFFFFFFFFFCF8FAF4EFE9E4DDBCBAB8979898C1C0C1E6E6E6F0F0F0F0F0F000
      0000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F3F3F3E5E6E5A0A1A2D3D2CEFFF9F1
      FFFBF5FFFBF8FFFBF9FFFBF8FFFAF5FFF8F2FFF6EDFFF4E6CFCCC8939494C9C9
      C8EBEBEBF1F1F1000000F0F0F0F0F0F0F0F0F0F0F0F0F1F1F1EBEBEBA6A7A9C2
      C0BDFFF3E7FFF3E9FFF5EDFFF7F1FFFAF4FFF9F7FFF9F5FFF8F1FFF5ECFFF2E5
      FFF0DEC4C2BD9F9E9EDAD9D8F0F0F0000000F0F0F0F0F0F0F0F0F0F0F0F0F2F2
      F2D4D4D6A4A5A4EFE4D8FFEFDFFFF0E4FFF3E8FFF6EFFFF8F3FFF8F2FFF8F2FF
      F6EEFFF4EBFFF3E8FFEEDCF2E2D1A6A6A6BCBBBBF0F0F1000000F0F0F0F0F0F0
      F0F0F0F0F0F0F2F2F2B7B6B8B6B3AFFCEAD8FFECD9FFEDDFFFF1E6FFF6EFFFF7
      F0FFF6EFFFF5EFFFF5ECFFF3E9FFF1E6FFEFE0FEE7D3BBB5B0AEAFB1EFF0F000
      0000F0F0F0F0F0F0F0F0F0F0F0F0F1F1F1A8A9AAD0C9C0FFE8D2FFE9D5FFEBD9
      FFF1E5FFF7EFFFF6EDFFF5EDFFF5ECFFF4EAFFF2E8FFF1E5FFEFE2FFE9D5D4C8
      BCA2A5A7E8E8E8000000F0F0F0F0F0F0F0F0F0F0F0F0F1F1F1A1A3A4DDD0C5FF
      E6CCFFE5CEFFE7D3FFEBDAFFF3E7FFF4EBFFF4EBFFF4EAFFF3E9FFF0E5FFF1E4
      FFEFE2FFEAD6E2CFBF9FA1A3E9E9E9000000F0F0F0F0F0F0F0F0F0F0F0F0F1F1
      F1A9AAABCFC6BBFFE4C9FFE3C9FFE5CEFFECDCFFE8D5FFEBD9FFF0E3FFF1E7FF
      F2E9FFF1E7FFF0E6FFF0E3FFECDBD5C8BAA5A6A8EBEBEB000000F0F0F0F0F0F0
      F0F0F0F0F0F0F2F2F2B8B8BBB8B1AAFBE0C7FFE1C4FFE2C8FFF5ECFFF1E4FFEA
      D8FFE8D3FFE7D3FFE8D5FFEADAFFECDCFFEDDFFEE9D6BFB8B1B9BABBF0F0F000
      0000F0F0F0F0F0F0F0F0F0F0F0F0F2F2F2D4D4D6A6A4A1EED9C3FFDFC1FFE0C4
      FFF3E8FFF4EAFFF2E8FFF1E4FFEEDFFFE8D5FFE6D0FFE3CBFFE2C9F5E0CBA9A8
      A7CBCCCCF3F3F3000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFB8B8BABF
      B7ADFFDEBFFFDEBEFFEFE2FFF3EBFFF3E9FFF3E8FFF3E8FFF2E7FFF1E5FFF3E7
      FFEEDACFC6BCADAEB1ECECECF1F1F1000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F3F3F3DCDEDEA3A1A0CDC2B5FFDEC1FFECD8FFF6ECFFF3E9FFF3E9FFF3E9FF
      F4E9FFF5EAFFF1E1E0D4C9A09FA2D2D3D4F4F4F4F0F0F0000000F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F5F5F5D9D9DAA19E9CC6BBAFEFDECCFCEFE4FFF5
      ECFFF8EFFFF5EBFDF2E7F4E8DBCBC4B9A09FA1CBCBCCF8F8F7F0F0F0F0F0F000
      0000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF7F7F7DDDDDE9B9A99
      9D9994BFB5ACD5CAC1DFD7CFD4CBC3BDB6AF9E9B97AEADAED6D6D7F7F7F7F0F0
      F0F0F0F0F0F0F0000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EF
      EFEFF4F4F4EBEBECDEDEDEADADAC9C9B999795949F9F9EB8B8B8DEDFDFEEEEEE
      F3F3F3F0F0F0F0F0F0F0F0F0F0F0F0000000}
    ShowHint = True
    Transparent = True
    OnClick = imgPsqClick
  end
  object Label3: TLabel
    Left = 9
    Top = 14
    Width = 93
    Height = 13
    Caption = 'Status da venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 62
    Width = 40
    Height = 13
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 386
    Top = 74
    Width = 86
    Height = 18
    Cursor = crHandPoint
    Caption = 'Pesquisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = imgPsqClick
  end
  object grdPsqVen: TDBGrid
    Left = 9
    Top = 153
    Width = 487
    Height = 287
    DataSource = dtsPsqVen
    FixedColor = 16635790
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pop1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = grdPsqVenDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Cupom'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        Width = 5
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cliente'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vol'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Title.Alignment = taRightJustify
        Width = 80
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 9
    Top = 121
    Width = 87
    Height = 23
    Caption = 'Op'#231#245'es >>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object cbbStatus: TComboBox
    Left = 9
    Top = 27
    Width = 232
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 2
    Text = 'Todas as vendas'
    Items.Strings = (
      'Todas as vendas'
      'ABT - Vendas em aberto'
      'CGL - Vendas congeladas'
      'CAN - Vendas canceladas'
      'PDT - Vendas pendentes'
      'FNZ - Vendas finalizadas')
  end
  object dtpInicial: TDateTimePicker
    Left = 257
    Top = 27
    Width = 111
    Height = 21
    Date = 41987.806795208340000000
    Time = 41987.806795208340000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object dtpFinal: TDateTimePicker
    Left = 377
    Top = 27
    Width = 111
    Height = 21
    Date = 41987.806795208340000000
    Time = 41987.806795208340000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edtCliente: TEdit
    Left = 9
    Top = 75
    Width = 335
    Height = 21
    Color = 16630946
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object BitBtn2: TBitBtn
    Left = 345
    Top = 75
    Width = 23
    Height = 21
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 307
    Top = 449
    Width = 189
    Height = 23
    Caption = '&Selecionar item e fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Selecionarcadastrodepessoa1Click
  end
  object BitBtn4: TBitBtn
    Left = 241
    Top = 449
    Width = 63
    Height = 23
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn4Click
  end
  object pop1: TPopupMenu
    Left = 104
    Top = 112
    object Selecionarcadastrodepessoa1: TMenuItem
      Caption = '&Selecionar cadastro de venda'
      OnClick = Selecionarcadastrodepessoa1Click
    end
  end
  object dtsPsqVen: TDataSource
    DataSet = stpPsqVen
    Left = 232
    Top = 344
  end
  object stpPsqVen: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'spPsqVenda;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Codigo_Org'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 101
      end
      item
        Name = '@id_Codigo_Fil'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 101
      end
      item
        Name = '@id_Cliente_Pes'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@cd_Status_Ven'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = 'PDT'
      end
      item
        Name = '@dtInicial'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 41934d
      end
      item
        Name = '@dtFinal'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 41995d
      end>
    Left = 200
    Top = 344
    object stpPsqVenCupom: TIntegerField
      FieldName = 'Cupom'
    end
    object stpPsqVenData: TDateTimeField
      FieldName = 'Data'
    end
    object stpPsqVenStatus: TStringField
      FieldName = 'Status'
      Size = 3
    end
    object stpPsqVenCdCliente: TIntegerField
      FieldName = 'C'#243'd Cliente'
    end
    object stpPsqVenCliente: TStringField
      FieldName = 'Cliente'
      ReadOnly = True
      Size = 150
    end
    object stpPsqVenVol: TBCDField
      FieldName = 'Vol'
      Precision = 8
      Size = 2
    end
    object stpPsqVenValor: TBCDField
      FieldName = 'Valor'
      DisplayFormat = '###,##0.00'
      Precision = 6
      Size = 2
    end
  end
end
