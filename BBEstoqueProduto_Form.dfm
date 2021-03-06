object frmEstoqueProduto: TfrmEstoqueProduto
  Left = 325
  Top = 109
  BorderStyle = bsToolWindow
  Caption = 'Controle de Estoque'
  ClientHeight = 465
  ClientWidth = 737
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
  object Label4: TLabel
    Left = 10
    Top = 116
    Width = 130
    Height = 12
    Caption = 'Situa'#231#227'o atual do estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = -4
    Top = 89
    Width = 744
    Height = 15
    Brush.Color = 16625455
    Pen.Color = clGray
  end
  object Shape3: TShape
    Left = 249
    Top = -12
    Width = 15
    Height = 102
    Brush.Color = 16625455
    Pen.Color = clGray
  end
  object Shape4: TShape
    Left = 250
    Top = 79
    Width = 13
    Height = 18
    Brush.Color = 16625455
    Pen.Color = 16625455
  end
  object Shape2: TShape
    Left = 601
    Top = -10
    Width = 15
    Height = 99
    Brush.Color = 16625455
    Pen.Color = clGray
  end
  object Shape5: TShape
    Left = 602
    Top = 79
    Width = 13
    Height = 18
    Brush.Color = 16625455
    Pen.Color = 16625455
  end
  object grdEstoqueProduto: TDBGrid
    Left = 9
    Top = 129
    Width = 719
    Height = 327
    DataSource = dtsPsqEstoque
    FixedColor = 16635790
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Estoque'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C'#243'd'
        Title.Alignment = taRightJustify
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        Width = 8
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Produto'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unid.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Depto'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qt. Estoque'
        Title.Alignment = taRightJustify
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vl. Estoque'
        Title.Alignment = taRightJustify
        Width = 100
        Visible = True
      end>
  end
  object pnlTransferir: TPanel
    Left = 264
    Top = 0
    Width = 337
    Height = 89
    BevelOuter = bvNone
    TabOrder = 4
    object Label3: TLabel
      Left = 12
      Top = 6
      Width = 139
      Height = 12
      Caption = 'Selecione o estoque destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQdtTransf: TLabel
      Left = 251
      Top = 6
      Width = 53
      Height = 12
      Caption = 'Qtd (UND)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grdEstoque2: TDBGrid
      Left = 10
      Top = 18
      Width = 228
      Height = 63
      DataSource = DataSource3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'C'#243'd'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          Width = 15
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descri'#231#227'o'
          Width = 119
          Visible = True
        end>
    end
    object btnTransf: TBitBtn
      Left = 248
      Top = 57
      Width = 80
      Height = 23
      Caption = '&Transferir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnTransfClick
    end
    object edtQtdTransf: TEdit
      Left = 249
      Top = 18
      Width = 79
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 2
      Text = '0,00'
      OnExit = edtQtdTransfExit
      OnKeyPress = edtQtdTransfKeyPress
    end
  end
  object pnlAlterar: TPanel
    Left = 264
    Top = 0
    Width = 337
    Height = 89
    BevelOuter = bvNone
    TabOrder = 5
    object Label6: TLabel
      Left = 11
      Top = 47
      Width = 82
      Height = 12
      Caption = 'Selecione a a'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtdAcao: TLabel
      Left = 122
      Top = 47
      Width = 53
      Height = 12
      Caption = 'Qtd (UND)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 195
      Top = 47
      Width = 48
      Height = 12
      Caption = 'Qtd atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 266
      Top = 47
      Width = 50
      Height = 12
      Caption = 'Resultado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 10
      Top = 5
      Width = 182
      Height = 12
      Caption = 'Produto que ter'#225' o estoque alterado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnExecutar: TBitBtn
      Left = 247
      Top = 15
      Width = 81
      Height = 23
      Caption = '&Executar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnExecutarClick
    end
    object edtQtdAcao: TEdit
      Left = 120
      Top = 59
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0,00'
      OnExit = edtQtdAcaoExit
      OnKeyPress = edtQtdAcaoKeyPress
    end
    object cbbAcao: TComboBox
      Left = 10
      Top = 59
      Width = 103
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      Text = 'Adicionar'
      OnChange = cbbAcaoChange
      OnKeyPress = cbbAcaoKeyPress
      Items.Strings = (
        'Adicionar'
        'Retirar'
        'Informar valor')
    end
    object edtDescProduto: TEdit
      Left = 10
      Top = 17
      Width = 230
      Height = 21
      Color = 16630946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      MaxLength = 50
      ParentFont = False
      TabOrder = 3
    end
    object edtQtdAtual: TEdit
      Left = 193
      Top = 59
      Width = 65
      Height = 21
      Color = 16630946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '0,00'
    end
    object edtQtdResultado: TEdit
      Left = 266
      Top = 59
      Width = 62
      Height = 21
      Color = 16630946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = '0,00'
    end
  end
  object pnlPesquisa: TPanel
    Left = 264
    Top = 0
    Width = 337
    Height = 88
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object Label1: TLabel
      Left = 10
      Top = 5
      Width = 95
      Height = 12
      Caption = 'Op'#231#245'es de exibi'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbbDepto: TComboBox
      Left = 10
      Top = 59
      Width = 278
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = 'Selecione o Departamento'
      Visible = False
      OnKeyPress = cbbDeptoKeyPress
      Items.Strings = (
        'Selecione o Departamento')
    end
    object edtCodProduto: TEdit
      Left = 10
      Top = 59
      Width = 318
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnKeyPress = edtCodProdutoKeyPress
    end
    object cbbPesquisa: TComboBox
      Left = 10
      Top = 18
      Width = 318
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      Text = 'Exibir todos os produtos no(s) estoque(s)'
      OnChange = cbbPesquisaChange
      OnKeyPress = cbbPesquisaKeyPress
      Items.Strings = (
        'Todos os produtos no(s) estoque(s)'
        'Produto espec'#237'fico'
        'Produtos de um determinado departamento')
    end
    object rbtIDProd: TRadioButton
      Left = 10
      Top = 46
      Width = 113
      Height = 12
      Caption = 'ID Produto'
      Checked = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = True
      Visible = False
    end
    object rbtCodBarra: TRadioButton
      Left = 130
      Top = 46
      Width = 113
      Height = 12
      Caption = 'C'#243'digo de Barras'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
  end
  object btnOpc: TBitBtn
    Left = 617
    Top = 40
    Width = 119
    Height = 27
    Caption = '&Op'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnOpcClick
  end
  object btnPesq: TBitBtn
    Left = 617
    Top = 1
    Width = 119
    Height = 39
    Caption = '&Pesquisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnPesqClick
    Glyph.Data = {
      86070000424D86070000000000003600000028000000170000001A0000000100
      1800000000005007000000000000000000000000000000000000F5F5F5DADADA
      C8C8C8E2E2E2FDFDFDEEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000
      0000C3C3C36868686C6C6CB2B2B2EAEAEAF4F4F4EFEFEFF0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0000000817F80B4B3B37C7C7C737373CDCDCDF0F0F0F1F1F1F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000999395D5CED1AFAEAF7576767D7C
      7CE0E0E0EFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000EFEEEF938C8E
      D7D2D5A3A2A26B6B6B939393E4E4E4F1F1F1F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000
      0000F5F5F5CFCDCEA0999CD2CED1949494676766ACACACE7E7E7F1F1F1F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0000000F0F0F0F3F4F3BAB7B9AAA1A4CECACC7E7D7D747474C2
      C2C2EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000F0F0F0F1F1F1F2F2F2ADAAABACA2
      A5C1BFBF6D6C6C858585D7D7D7F7F7F7EFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000F0F0F0F0F0F0
      F1F1F1F7F7F79F9C9DB0A7A9ABAAAB5E5E5EA4A4A4EAEAEAFCFCFCF2F2F2F9F9
      F9F5F5F5F1F1F1F7F7F7F5F5F5F1F1F1F1F1F1F0F0F0F0F0F0F0F0F0F0F0F000
      0000F0F0F0F0F0F0F0F0F0F1F1F1F9FAFAA19C9FAFA9AA8F8D8D5C5C5CB8B8B8
      D1D1D1B9B9B99E9E9E9898989E9E9FA7A7A7BAB9B9D8D8D8ECECECF1F1F1F0F0
      F0F0F0F0F0F0F0000000F0F0F0F0F0F0F0F0F0F0F0F0F2F2F2EDEDEDAFA9ABAC
      A7A78787877B7B7B9D9D9EACACACC5C5C6D4D3D4C6C5C3ADADAC9F9F9FA1A0A1
      C5C5C4E6E6E7F0F0F0F0F0F0F0F0F0000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F3F3F3E6E6E6A3A2A2B8B8BBC8C6C5EBE8E4FBF9F6FFFFFEFFFFFFFFFCF8FA
      F4EFE9E4DDBCBAB8979898C1C0C1E6E6E6F0F0F0F0F0F0000000F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F3F3F3E5E6E5A0A1A2D3D2CEFFF9F1FFFBF5FFFBF8FFFB
      F9FFFBF8FFFAF5FFF8F2FFF6EDFFF4E6CFCCC8939494C9C9C8EBEBEBF1F1F100
      0000F0F0F0F0F0F0F0F0F0F0F0F0F1F1F1EBEBEBA6A7A9C2C0BDFFF3E7FFF3E9
      FFF5EDFFF7F1FFFAF4FFF9F7FFF9F5FFF8F1FFF5ECFFF2E5FFF0DEC4C2BD9F9E
      9EDAD9D8F0F0F0000000F0F0F0F0F0F0F0F0F0F0F0F0F2F2F2D4D4D6A4A5A4EF
      E4D8FFEFDFFFF0E4FFF3E8FFF6EFFFF8F3FFF8F2FFF8F2FFF6EEFFF4EBFFF3E8
      FFEEDCF2E2D1A6A6A6BCBBBBF0F0F1000000F0F0F0F0F0F0F0F0F0F0F0F0F2F2
      F2B7B6B8B6B3AFFCEAD8FFECD9FFEDDFFFF1E6FFF6EFFFF7F0FFF6EFFFF5EFFF
      F5ECFFF3E9FFF1E6FFEFE0FEE7D3BBB5B0AEAFB1EFF0F0000000F0F0F0F0F0F0
      F0F0F0F0F0F0F1F1F1A8A9AAD0C9C0FFE8D2FFE9D5FFEBD9FFF1E5FFF7EFFFF6
      EDFFF5EDFFF5ECFFF4EAFFF2E8FFF1E5FFEFE2FFE9D5D4C8BCA2A5A7E8E8E800
      0000F0F0F0F0F0F0F0F0F0F0F0F0F1F1F1A1A3A4DDD0C5FFE6CCFFE5CEFFE7D3
      FFEBDAFFF3E7FFF4EBFFF4EBFFF4EAFFF3E9FFF0E5FFF1E4FFEFE2FFEAD6E2CF
      BF9FA1A3E9E9E9000000F0F0F0F0F0F0F0F0F0F0F0F0F1F1F1A9AAABCFC6BBFF
      E4C9FFE3C9FFE5CEFFECDCFFE8D5FFEBD9FFF0E3FFF1E7FFF2E9FFF1E7FFF0E6
      FFF0E3FFECDBD5C8BAA5A6A8EBEBEB000000F0F0F0F0F0F0F0F0F0F0F0F0F2F2
      F2B8B8BBB8B1AAFBE0C7FFE1C4FFE2C8FFF5ECFFF1E4FFEAD8FFE8D3FFE7D3FF
      E8D5FFEADAFFECDCFFEDDFFEE9D6BFB8B1B9BABBF0F0F0000000F0F0F0F0F0F0
      F0F0F0F0F0F0F2F2F2D4D4D6A6A4A1EED9C3FFDFC1FFE0C4FFF3E8FFF4EAFFF2
      E8FFF1E4FFEEDFFFE8D5FFE6D0FFE3CBFFE2C9F5E0CBA9A8A7CBCCCCF3F3F300
      0000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFB8B8BABFB7ADFFDEBFFFDEBE
      FFEFE2FFF3EBFFF3E9FFF3E8FFF3E8FFF2E7FFF1E5FFF3E7FFEEDACFC6BCADAE
      B1ECECECF1F1F1000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F3F3F3DCDEDEA3
      A1A0CDC2B5FFDEC1FFECD8FFF6ECFFF3E9FFF3E9FFF3E9FFF4E9FFF5EAFFF1E1
      E0D4C9A09FA2D2D3D4F4F4F4F0F0F0000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F5F5F5D9D9DAA19E9CC6BBAFEFDECCFCEFE4FFF5ECFFF8EFFFF5EBFD
      F2E7F4E8DBCBC4B9A09FA1CBCBCCF8F8F7F0F0F0F0F0F0000000F0F0F0F0F0F0
      F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF7F7F7DDDDDE9B9A999D9994BFB5ACD5CA
      C1DFD7CFD4CBC3BDB6AF9E9B97AEADAED6D6D7F7F7F7F0F0F0F0F0F0F0F0F000
      0000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF4F4F4EBEBEC
      DEDEDEADADAC9C9B999795949F9F9EB8B8B8DEDFDFEEEEEEF3F3F3F0F0F0F0F0
      F0F0F0F0F0F0F0000000}
    Layout = blGlyphRight
  end
  object grdEstoque: TDBGrid
    Left = 9
    Top = 19
    Width = 231
    Height = 61
    DataSource = dtsEstoque
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'C'#243'd'
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
        FieldName = 'Descri'#231#227'o'
        Width = 165
        Visible = True
      end>
  end
  object btnCancel: TBitBtn
    Left = 617
    Top = 67
    Width = 119
    Height = 21
    Caption = '&Cancelar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object rbtEspecifico: TRadioButton
    Left = 8
    Top = 3
    Width = 114
    Height = 15
    Caption = 'Selecionar estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = rbtEspecificoClick
  end
  object rbtGeral: TRadioButton
    Left = 143
    Top = 3
    Width = 99
    Height = 15
    Caption = 'Todos estoques'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    TabStop = True
    OnClick = rbtGeralClick
  end
  object stpEstoqueOrigem: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'spPsqEstoque;1'
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
        Name = '@id_Codigo_Est'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 16
    Top = 48
    object stpEstoqueOrigemid_Codigo_Org: TIntegerField
      FieldName = 'id_Codigo_Org'
    end
    object stpEstoqueOrigemid_Codigo_Fil: TIntegerField
      FieldName = 'id_Codigo_Fil'
    end
    object stpEstoqueOrigemCd: TIntegerField
      FieldName = 'C'#243'd'
    end
    object stpEstoqueOrigemDescrio: TStringField
      FieldName = 'Descri'#231#227'o'
      Size = 30
    end
    object stpEstoqueOrigemPCompra: TBooleanField
      FieldName = 'P. Compra'
    end
    object stpEstoqueOrigemPVenda: TBooleanField
      FieldName = 'P. Venda'
    end
    object stpEstoqueOrigemds_Obs_Est: TStringField
      FieldName = 'ds_Obs_Est'
      Size = 300
    end
  end
  object dtsEstoque: TDataSource
    DataSet = stpEstoqueOrigem
    Left = 44
    Top = 48
  end
  object pop: TPopupMenu
    Left = 632
    Top = 64
    object Alteraroestoquedoprodutoselecionado1: TMenuItem
      Caption = 'Alterar o estoque do produto selecionado'
      OnClick = Alteraroestoquedoprodutoselecionado1Click
    end
    object ransferirdeumestoqueparaoutro1: TMenuItem
      Caption = 'Transferir produto selecionado para outro estoque'
      OnClick = ransferirdeumestoqueparaoutro1Click
    end
    object Cadastrodeestoques1: TMenuItem
      Caption = 'Ir para o cadastro de estoques'
      OnClick = Cadastrodeestoques1Click
    end
  end
  object stpEstoque: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'spEstoque;1'
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
        Name = '@id_Codigo_Pro'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ds_CodBarra_Pro'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Codigo_Est1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Codigo_Est2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@qt_Estoque_EsP'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 3
        Precision = 9
        Value = Null
      end
      item
        Name = '@id_Codigo_Dep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Codigo_Usu'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 224
    Top = 90
  end
  object DataSource1: TDataSource
    DataSet = stpEstoque
    Left = 252
    Top = 90
  end
  object DataSource2: TDataSource
    DataSet = stpPsqDepto
    Left = 372
    Top = 90
  end
  object stpPsqDepto: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'spPsqDepartamento;1'
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
        Name = '@id_Codigo_Dep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 344
    Top = 90
  end
  object DataSource3: TDataSource
    DataSet = stpEstoqueDest
    Left = 494
    Top = 90
  end
  object stpEstoqueDest: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'spPsqEstoque;1'
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
        Name = '@id_Codigo_Est'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 466
    Top = 90
    object stpEstoqueDestid_Codigo_Org: TIntegerField
      FieldName = 'id_Codigo_Org'
    end
    object stpEstoqueDestid_Codigo_Fil: TIntegerField
      FieldName = 'id_Codigo_Fil'
    end
    object stpEstoqueDestCd: TIntegerField
      FieldName = 'C'#243'd'
    end
    object stpEstoqueDestDescrio: TStringField
      FieldName = 'Descri'#231#227'o'
      Size = 30
    end
    object stpEstoqueDestPCompra: TBooleanField
      FieldName = 'P. Compra'
    end
    object stpEstoqueDestPVenda: TBooleanField
      FieldName = 'P. Venda'
    end
    object stpEstoqueDestds_Obs_Est: TStringField
      FieldName = 'ds_Obs_Est'
      Size = 300
    end
  end
  object stpPsqEstoque: TADOStoredProc
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'spEstoque;1'
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
        Name = '@id_Codigo_Pro'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ds_CodBarra_Pro'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Codigo_Est1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Codigo_Est2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@qt_Estoque_EsP'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 3
        Precision = 9
        Value = Null
      end
      item
        Name = '@id_Codigo_Dep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Codigo_Usu'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 184
    Top = 216
    object stpPsqEstoqueEstoque: TStringField
      FieldName = 'Estoque'
      Size = 30
    end
    object stpPsqEstoqueCd: TIntegerField
      FieldName = 'C'#243'd'
    end
    object stpPsqEstoqueProduto: TStringField
      FieldName = 'Produto'
      Size = 50
    end
    object stpPsqEstoqueUnid: TStringField
      FieldName = 'Unid.'
      Size = 3
    end
    object stpPsqEstoqueDepto: TStringField
      FieldName = 'Depto'
      Size = 3
    end
    object stpPsqEstoqueQtEstoque: TBCDField
      FieldName = 'Qt. Estoque'
      DisplayFormat = '0.000'
      Precision = 9
      Size = 3
    end
    object stpPsqEstoqueVlEstoque: TBCDField
      FieldName = 'Vl. Estoque'
      DisplayFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object stpPsqEstoquefl_VlDecimal_UnP: TBooleanField
      FieldName = 'fl_VlDecimal_UnP'
    end
    object stpPsqEstoquefl_VlInteiro_UnP: TBooleanField
      FieldName = 'fl_VlInteiro_UnP'
    end
    object stpPsqEstoqueid_Codigo_Est: TIntegerField
      FieldName = 'id_Codigo_Est'
    end
  end
  object dtsPsqEstoque: TDataSource
    DataSet = stpPsqEstoque
    Left = 216
    Top = 216
  end
end
