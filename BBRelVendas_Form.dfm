object frmRelVendas: TfrmRelVendas
  Left = 345
  Top = 99
  BorderStyle = bsToolWindow
  Caption = 'Relat'#243'rio de vendas'
  ClientHeight = 442
  ClientWidth = 657
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
  object Shape1: TShape
    Left = -52
    Top = -7
    Width = 722
    Height = 79
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
    Left = 271
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
    Left = 410
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
  object grdVenda: TDBGrid
    Left = 9
    Top = 81
    Width = 639
    Height = 351
    DataSource = dtsRelVenda
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
    OnDrawColumnCell = grdVendaDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Desc'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N'#186' Vendas'
        Title.Alignment = taRightJustify
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Volumes'
        Title.Alignment = taRightJustify
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vl Venda'
        Title.Alignment = taRightJustify
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vl Custo'
        Title.Alignment = taRightJustify
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vl Lucro'
        Title.Alignment = taRightJustify
        Width = 100
        Visible = True
      end>
  end
  object grdVendaProduto: TDBGrid
    Left = 9
    Top = 121
    Width = 639
    Height = 351
    DataSource = dtsRelVenda2
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
    OnDrawColumnCell = grdVendaProdutoDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Venda'
        Title.Alignment = taRightJustify
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 40
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Prod'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descri'#231#227'o'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taRightJustify
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vl. Unit.'
        Title.Alignment = taRightJustify
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vl. Tot.'
        Title.Alignment = taRightJustify
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        Width = 5
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dt/Hr'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Usu'#225'rio'
        Width = 60
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 559
    Top = 3
    Width = 95
    Height = 38
    Caption = '&Visualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object dtpIni: TDateTimePicker
    Left = 270
    Top = 35
    Width = 122
    Height = 24
    Date = 40722.446437164360000000
    Time = 40722.446437164360000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = dtpFinChange
  end
  object cbbTipoRel: TComboBox
    Left = 9
    Top = 35
    Width = 246
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
      'Formas de Pagamento'
      'Relat'#243'rio detalhado')
  end
  object dtpFin: TDateTimePicker
    Left = 407
    Top = 35
    Width = 120
    Height = 24
    Date = 40722.446437164360000000
    Time = 40722.446437164360000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnChange = dtpFinChange
  end
  object Button2: TButton
    Left = 559
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
  object stpRelVenda: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'spRelVenda;1'
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
        Value = 'VPU'
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
        Value = 41640d
      end
      item
        Name = '@dtFin'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 42369d
      end>
    Left = 96
    Top = 176
    object stpRelVendaDesc: TStringField
      FieldName = 'Desc'
      ReadOnly = True
      Size = 10
    end
    object stpRelVendaNVendas: TIntegerField
      FieldName = 'N'#186' Vendas'
      ReadOnly = True
    end
    object stpRelVendaVolumes: TBCDField
      FieldName = 'Volumes'
      ReadOnly = True
      DisplayFormat = '0.000'
      Precision = 32
      Size = 2
    end
    object stpRelVendaVlVenda: TBCDField
      FieldName = 'Vl Venda'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 32
      Size = 2
    end
    object stpRelVendaVlCusto: TBCDField
      FieldName = 'Vl Custo'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 32
      Size = 2
    end
    object stpRelVendaVlLucro: TBCDField
      FieldName = 'Vl Lucro'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 32
      Size = 2
    end
  end
  object dtsRelVenda: TDataSource
    DataSet = stpRelVenda
    Left = 144
    Top = 184
  end
  object stpRelVenda2: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'spRelVenda;1'
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
        Value = 'VPR'
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
        Value = 41640d
      end
      item
        Name = '@dtFin'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 42369d
      end>
    Left = 88
    Top = 248
    object stpRelVenda2Venda: TIntegerField
      FieldName = 'Venda'
    end
    object stpRelVenda2Status: TStringField
      FieldName = 'Status'
      Size = 3
    end
    object stpRelVenda2Prod: TIntegerField
      FieldName = 'Prod'
    end
    object stpRelVenda2Descrio: TStringField
      FieldName = 'Descri'#231#227'o'
      Size = 50
    end
    object stpRelVenda2Qtd: TBCDField
      FieldName = 'Qtd'
      DisplayFormat = '0.000'
      Precision = 8
      Size = 2
    end
    object stpRelVenda2VlUnit: TBCDField
      FieldName = 'Vl. Unit.'
      DisplayFormat = '0.00'
      Precision = 6
      Size = 2
    end
    object stpRelVenda2VlTot: TBCDField
      FieldName = 'Vl. Tot.'
      DisplayFormat = '0.00'
      Precision = 6
      Size = 2
    end
    object stpRelVenda2DtHr: TDateTimeField
      FieldName = 'Dt/Hr'
      DisplayFormat = 'DD/MM/YY hh:mm'
    end
    object stpRelVenda2Usurio: TStringField
      FieldName = 'Usu'#225'rio'
      Size = 10
    end
  end
  object dtsRelVenda2: TDataSource
    DataSet = stpRelVenda2
    Left = 136
    Top = 240
  end
end
