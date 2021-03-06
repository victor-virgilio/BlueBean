object frmRelCompras: TfrmRelCompras
  Left = 307
  Top = 93
  BorderStyle = bsToolWindow
  Caption = 'Relat'#243'rios de compras.'
  ClientHeight = 442
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = -30
    Top = -2
    Width = 805
    Height = 74
    Brush.Color = 16703439
    Pen.Color = 11447982
  end
  object Label1: TLabel
    Left = 11
    Top = 19
    Width = 114
    Height = 16
    Caption = 'Tipo de relat'#243'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 273
    Top = 19
    Width = 78
    Height = 16
    Caption = 'Data inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 409
    Top = 19
    Width = 69
    Height = 16
    Caption = 'Data final:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object grdCompraProduto: TDBGrid
    Left = 9
    Top = 81
    Width = 719
    Height = 351
    DataSource = dtsRelCompra2
    FixedColor = 16635790
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold]
    Visible = False
    OnDrawColumnCell = grdCompraProdutoDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Compra'
        Title.Alignment = taRightJustify
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
        FieldName = 'Status'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prod'
        Title.Alignment = taRightJustify
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        Width = 5
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descri'#231#227'o'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taRightJustify
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vl. Unit.'
        Title.Alignment = taRightJustify
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vl. Tot.'
        Title.Alignment = taRightJustify
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dt/Hr'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Usu'#225'rio'
        Width = 50
        Visible = True
      end>
  end
  object grdCompra: TDBGrid
    Left = 9
    Top = 81
    Width = 719
    Height = 351
    DataSource = dtsRelCompra
    FixedColor = 16635790
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = grdCompraDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Desc'
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N'#186' Compras'
        Title.Alignment = taRightJustify
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Volumes'
        Title.Alignment = taRightJustify
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vl Compras'
        Title.Alignment = taRightJustify
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vl Desconto'
        Title.Alignment = taRightJustify
        Width = 110
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 638
    Top = 4
    Width = 95
    Height = 37
    Caption = '&Visualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object dtpIni: TDateTimePicker
    Left = 272
    Top = 35
    Width = 120
    Height = 24
    Date = 40722.446437164360000000
    Time = 40722.446437164360000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = dtpIniChange
  end
  object cbbTipoRel: TComboBox
    Left = 9
    Top = 35
    Width = 248
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 3
    Text = 'Relat'#243'rio por usu'#225'rio'
    OnChange = cbbTipoRelChange
    Items.Strings = (
      'Relat'#243'rio por usu'#225'rio'
      'Relat'#243'rio por setor'
      'Formas de pagamento'
      'Relat'#243'rio por comprador'
      'Relat'#243'rio por fornecedor'
      'Relat'#243'rio detalhado de itens')
  end
  object dtpFin: TDateTimePicker
    Left = 407
    Top = 35
    Width = 122
    Height = 24
    Date = 40722.446437164360000000
    Time = 40722.446437164360000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnChange = dtpIniChange
  end
  object Button2: TButton
    Left = 638
    Top = 42
    Width = 95
    Height = 26
    Caption = '&Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object stpRelCompra: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'spRelCompra;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@OPR'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = 'CPC'
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
        Name = '@dtIni'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 42129d
      end
      item
        Name = '@dtFin'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 42129d
      end>
    Left = 96
    Top = 200
    object stpRelCompraDesc: TStringField
      DisplayWidth = 150
      FieldName = 'Desc'
      ReadOnly = True
      Size = 150
    end
    object stpRelCompraNCompras: TIntegerField
      FieldName = 'N'#186' Compras'
      ReadOnly = True
    end
    object stpRelCompraVolumes: TBCDField
      FieldName = 'Volumes'
      ReadOnly = True
      DisplayFormat = '0.000'
      Precision = 38
      Size = 3
    end
    object stpRelCompraVlCompras: TBCDField
      FieldName = 'Vl Compras'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 38
      Size = 2
    end
    object stpRelCompraVlDesconto: TBCDField
      FieldName = 'Vl Desconto'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 38
      Size = 2
    end
  end
  object dtsRelCompra: TDataSource
    DataSet = stpRelCompra
    Left = 16
    Top = 216
  end
  object stpRelCompra2: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'spRelCompra;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@OPR'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = 'CPR'
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
        Name = '@dtIni'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 42129d
      end
      item
        Name = '@dtFin'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 42129d
      end>
    Left = 88
    Top = 256
    object stpRelCompra2Compra: TIntegerField
      FieldName = 'Compra'
    end
    object stpRelCompra2Status: TStringField
      FieldName = 'Status'
      Size = 3
    end
    object stpRelCompra2Prod: TIntegerField
      FieldName = 'Prod'
    end
    object stpRelCompra2Descrio: TStringField
      FieldName = 'Descri'#231#227'o'
      Size = 50
    end
    object stpRelCompra2Qtd: TBCDField
      FieldName = 'Qtd'
      DisplayFormat = '0.000'
      Precision = 9
      Size = 3
    end
    object stpRelCompra2VlUnit: TBCDField
      FieldName = 'Vl. Unit.'
      DisplayFormat = '0.00'
      Precision = 8
      Size = 2
    end
    object stpRelCompra2VlTot: TBCDField
      FieldName = 'Vl. Tot.'
      DisplayFormat = '0.00'
      Precision = 8
      Size = 2
    end
    object stpRelCompra2DtHr: TDateTimeField
      FieldName = 'Dt/Hr'
      DisplayFormat = 'dd/mm/yy hh:mm'
    end
    object stpRelCompra2Usurio: TStringField
      FieldName = 'Usu'#225'rio'
      Size = 10
    end
  end
  object dtsRelCompra2: TDataSource
    DataSet = stpRelCompra2
    Left = 144
    Top = 216
  end
end
