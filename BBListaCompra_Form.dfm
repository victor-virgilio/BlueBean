object frmListaCompra: TfrmListaCompra
  Left = 357
  Top = 118
  BorderStyle = bsToolWindow
  Caption = 'Lista de compras'
  ClientHeight = 425
  ClientWidth = 705
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
  object Shape3: TShape
    Left = -9
    Top = 0
    Width = 717
    Height = 48
    Brush.Color = 16625455
    Pen.Color = clGray
  end
  object Label1: TLabel
    Left = 11
    Top = 59
    Width = 325
    Height = 13
    Caption = 'Lista de produtos com o estoque abaixo do valor m'#237'nimo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 441
    Top = 57
    Width = 236
    Height = 38
    Brush.Color = 16635790
    Pen.Color = clGray
  end
  object Label2: TLabel
    Left = 489
    Top = 59
    Width = 140
    Height = 13
    Caption = 'Dados da '#250'ltima compra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object btnGeraLista: TButton
    Left = 7
    Top = 9
    Width = 119
    Height = 31
    Caption = 'Gerar lista'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnGeraListaClick
  end
  object btnImprime: TButton
    Left = 601
    Top = 17
    Width = 97
    Height = 23
    Caption = 'Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnImprimeClick
  end
  object grdListaCompra: TDBGrid
    Left = 9
    Top = 73
    Width = 687
    Height = 343
    DataSource = dtsListaCompra
    FixedColor = 16635790
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'C'#243'd'
        Title.Alignment = taRightJustify
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        Width = 5
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Produto'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Est. M'#237'n'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Est. Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unidade'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Title.Alignment = taRightJustify
        Width = 83
        Visible = True
      end>
  end
  object stpListaCompra: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'spListaCompra;1'
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
      end>
    Left = 416
    Top = 184
    object stpListaCompraCd: TIntegerField
      FieldName = 'C'#243'd'
    end
    object stpListaCompraProduto: TStringField
      FieldName = 'Produto'
      Size = 50
    end
    object stpListaCompraEstMn: TIntegerField
      FieldName = 'Est. M'#237'n'
      DisplayFormat = '0.000'
    end
    object stpListaCompraEstAtual: TBCDField
      FieldName = 'Est. Atual'
      DisplayFormat = '0.000'
      Precision = 9
      Size = 3
    end
    object stpListaCompraUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object stpListaCompraData: TDateTimeField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object stpListaCompraComprador: TStringField
      FieldName = 'Comprador'
      Size = 50
    end
    object stpListaCompraQtd: TBCDField
      FieldName = 'Qtd'
      DisplayFormat = '0.000'
      Precision = 9
      Size = 3
    end
    object stpListaCompraValor: TBCDField
      FieldName = 'Valor'
      DisplayFormat = '0.00'
      Precision = 9
      Size = 3
    end
    object stpListaCompraFornecedor: TStringField
      FieldName = 'Fornecedor'
      Size = 50
    end
  end
  object dtsListaCompra: TDataSource
    DataSet = stpListaCompra
    Left = 416
    Top = 216
  end
  object RvListaCompra: TRvProject
    ProjectFile = 'C:\Program Files (x86)\Blue Bean\Relatorio RV.rav'
    Left = 272
    Top = 200
  end
  object RVDTSListaCompra: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = stpListaCompra
    Left = 272
    Top = 256
  end
end
