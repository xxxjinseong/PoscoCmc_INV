object frmU250: TfrmU250
  Left = 2026
  Top = 265
  Caption = '250. '#49688#46041' '#52636#44256#51648#49884
  ClientHeight = 761
  ClientWidth = 1634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object shpB: TShape
    Left = 0
    Top = 760
    Width = 1634
    Height = 1
    Align = alBottom
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitTop = 12
    ExplicitWidth = 1184
  end
  object shpL: TShape
    Left = 0
    Top = 1
    Width = 1
    Height = 759
    Align = alLeft
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitLeft = 213
    ExplicitTop = 20
    ExplicitHeight = 22
  end
  object shpR: TShape
    Left = 1633
    Top = 1
    Width = 1
    Height = 759
    Align = alRight
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitLeft = 213
    ExplicitTop = 20
    ExplicitHeight = 22
  end
  object shpT: TShape
    Left = 0
    Top = 0
    Width = 1634
    Height = 1
    Align = alTop
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitTop = 4
    ExplicitWidth = 1184
  end
  object Pnl_Base: TPanel
    Left = 1
    Top = 1
    Width = 1632
    Height = 759
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Color = 15198183
    ParentBackground = False
    TabOrder = 0
    object Pnl_Main: TPanel
      Left = 5
      Top = 69
      Width = 1622
      Height = 685
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 0
      OnResize = Pnl_MainResize
      object Splitter2: TSplitter
        Left = 1
        Top = 376
        Width = 1620
        Height = 8
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
        ExplicitLeft = -39
        ExplicitTop = 362
      end
      object dgStock: TDBGridEh
        Left = 1
        Top = 1
        Width = 1620
        Height = 375
        Align = alClient
        BorderStyle = bsNone
        ColumnDefValues.Layout = tlCenter
        ColumnDefValues.Title.Alignment = taCenter
        DataGrouping.Font.Charset = GB2312_CHARSET
        DataGrouping.Font.Color = clWindowText
        DataGrouping.Font.Height = -11
        DataGrouping.Font.Name = 'Tahoma'
        DataGrouping.Font.Style = []
        DataGrouping.ParentFont = False
        DataSource = dsStock
        DrawGraphicData = True
        DynProps = <>
        EditActions = [geaCopyEh]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        FooterRowCount = 1
        FooterParams.FillStyle = cfstGradientEh
        FooterParams.HorzLineColor = 11053224
        FooterParams.VertLineColor = 11053224
        ImeName = 'Microsoft Office IME 2007'
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
        IndicatorParams.FillStyle = cfstGradientEh
        IndicatorParams.HorzLineColor = 11053224
        IndicatorParams.VertLineColor = 11053224
        IndicatorTitle.TitleButton = True
        IndicatorTitle.UseGlobalMenu = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        PopupMenu = pmControl
        RowHeight = 5
        RowLines = 1
        SumList.Active = True
        TabOrder = 0
        TitleParams.FillStyle = cfstGradientEh
        TitleParams.Font.Charset = DEFAULT_CHARSET
        TitleParams.Font.Color = clWindowText
        TitleParams.Font.Height = -15
        TitleParams.Font.Name = #46027#50880
        TitleParams.Font.Style = []
        TitleParams.HorzLineColor = 11053224
        TitleParams.ParentFont = False
        TitleParams.RowHeight = 23
        TitleParams.VertLineColor = 11053224
        OnDrawColumnCell = dgStockDrawColumnCell
        OnSelectionChanged = dgStockSelectionChanged
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_TYPE'
            Footers = <>
            Title.Caption = #51228#54408#50668#48512
            Width = 95
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_LOT'
            Footers = <>
            Title.Caption = #51228#54408#48264#54840
            Width = 210
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_INFO_01'
            Footers = <>
            Title.Caption = #51228#54408#53076#46300
            Width = 134
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_INFO_02'
            Footers = <>
            Title.Caption = #51228#54408#47749
            Width = 300
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_INFO_03'
            Footer.Alignment = taRightJustify
            Footer.FieldName = 'COUNT_ITEM'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = '('#51204')'#51228#54408#53076#46300
            Visible = False
            Width = 134
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_INFO_04'
            Footer.Alignment = taRightJustify
            Footer.FieldName = 'SUM_BOX_QTY'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = '('#51204')'#51228#54408#47749
            Visible = False
            Width = 134
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DisplayFormat = '##,##0.000'
            DynProps = <>
            EditButtons = <>
            FieldName = 'tITEM_WEIGHT'
            Footer.Alignment = taRightJustify
            Footer.DisplayFormat = '##,##0.000'
            Footer.FieldName = 'tITEM_WEIGHT'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #51473#47049
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'SC_USED'
            Footers = <>
            Title.Caption = #49444#48708#44032#45733
            Width = 105
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'OT_USED'
            Footers = <>
            Title.Caption = #52636#44256#44032#45733
            Width = 105
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'RACK_LOC_DESC'
            Footers = <>
            Title.Caption = #51201#52824#50948#52824
            Width = 105
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'tITEM_INFO_05'
            Footers = <>
            Title.Caption = #49373#49328#51068#51088
            Width = 175
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'tIN_DATE'
            Footers = <>
            Title.Caption = #51077#44256#51068#51088
            Width = 175
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_QTY'
            Footer.Alignment = taCenter
            Footer.DisplayFormat = '###,###,##0'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51228#54408#49688#47049
            Visible = False
            Width = 95
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dgInfo: TDBGridEh
        Left = 1
        Top = 384
        Width = 1620
        Height = 300
        Align = alBottom
        BorderStyle = bsNone
        ColumnDefValues.Layout = tlCenter
        DataGrouping.Font.Charset = GB2312_CHARSET
        DataGrouping.Font.Color = clWindowText
        DataGrouping.Font.Height = -11
        DataGrouping.Font.Name = 'Tahoma'
        DataGrouping.Font.Style = []
        DataGrouping.ParentFont = False
        DataSource = dsInfo
        DrawGraphicData = True
        DynProps = <>
        EditActions = [geaCopyEh]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        FooterRowCount = 1
        FooterParams.FillStyle = cfstGradientEh
        FooterParams.HorzLineColor = 11053224
        FooterParams.VertLineColor = 11053224
        ImeName = 'Microsoft Office IME 2007'
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
        IndicatorParams.FillStyle = cfstGradientEh
        IndicatorParams.HorzLineColor = 11053224
        IndicatorParams.VertLineColor = 11053224
        IndicatorTitle.TitleButton = True
        IndicatorTitle.UseGlobalMenu = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        PopupMenu = pmControl
        RowHeight = 5
        RowLines = 1
        SumList.Active = True
        TabOrder = 1
        TitleParams.FillStyle = cfstGradientEh
        TitleParams.Font.Charset = DEFAULT_CHARSET
        TitleParams.Font.Color = clWindowText
        TitleParams.Font.Height = -15
        TitleParams.Font.Name = #46027#50880
        TitleParams.Font.Style = []
        TitleParams.HorzLineColor = 11053224
        TitleParams.MultiTitle = True
        TitleParams.ParentFont = False
        TitleParams.RowHeight = 23
        TitleParams.VertLineColor = 11053224
        OnDrawColumnCell = dgInfoDrawColumnCell
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ID_TYPE'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51089#50629#44396#48516
            Width = 102
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'ID_INDEX'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51089#50629#48264#54840
            Width = 102
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'OR_DT'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51089#50629#51068#49884
            Width = 175
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'ID_SC'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51201#52824#54840#44592
            Width = 102
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'SRC_POS'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51201#52824#50948#52824
            Width = 102
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'DST_POS'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #52636#44256#50948#52824
            Width = 102
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOW_POS'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #54788#51116#50948#52824
            Width = 102
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOW_MACH'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #49444#48708#44396#48516
            Width = 102
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_LOT'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51228#54408#48264#54840
            Width = 210
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_TYPE'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51228#54408#50668#48512
            Width = 102
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DisplayFormat = '##,##0.000'
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_WEIGHT'
            Footer.Alignment = taRightJustify
            Footer.DisplayFormat = '##,##0.000'
            Footer.FieldName = 'ITEM_WEIGHT'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #51473#47049
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'WRAP_YN'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #47017#54609#50668#48512
            Width = 102
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ID_USER'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51089#50629#51088
            Width = 102
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'STATUS'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51089#50629#49345#53468
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.FieldName = 'PROCESS'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #52376#47532#49345#53468
            Visible = False
            Width = 90
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #50640#47084'|'#49345#53468
            Visible = False
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #50640#47084'|'#53076#46300
            Visible = False
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #50640#47084'|'#45236#50857
            Visible = False
            Width = 200
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51064#53552#54168#51060#49828'|'#51452#47928#48264#54840
            Visible = False
            Width = 150
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51064#53552#54168#51060#49828'|'#49692#48264
            Visible = False
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51064#53552#54168#51060#49828'|'#51648#49884#48264#54840
            Visible = False
            Width = 150
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #51064#53552#54168#51060#49828'|'#51648#49884#44396#48516
            Visible = False
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #54408#47785#51221#48372'|'#49692#48264
            Visible = False
            Width = 80
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #54408#47785#51221#48372'|'#54408#47785#47749
            Visible = False
            Width = 480
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #54408#47785#51221#48372'|LOT NO'
            Visible = False
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #54408#47785#51221#48372'|'#50976#53685#44592#54620
            Visible = False
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #48708#44256
            Visible = False
            Width = 200
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Visible = False
            Width = 80
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 65
      Width = 1622
      Height = 4
      ParentCustomHint = False
      Align = alTop
      BevelEdges = []
      BiDiMode = bdLeftToRight
      Color = 15198183
      Ctl3D = True
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentBackground = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 18
        Height = 2
        Align = alLeft
        BevelOuter = bvNone
        Color = 14258944
        TabOrder = 0
      end
    end
    object Pnl_Top: TPanel
      Left = 5
      Top = 5
      Width = 1622
      Height = 60
      Align = alTop
      ParentBackground = False
      TabOrder = 2
      object Panel11: TPanel
        Left = 6
        Top = 5
        Width = 120
        Height = 50
        BevelOuter = bvNone
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 9
        object Panel9: TPanel
          Left = 30
          Top = 0
          Width = 90
          Height = 50
          Align = alClient
          BevelOuter = bvNone
          Caption = #52636#44256#51221#48372
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblCnt: TLabel
            Left = 0
            Top = 35
            Width = 90
            Height = 15
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = '('#49440#53469' 0'#44148')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = #46027#50880
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = -3
            ExplicitTop = 34
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 30
          Height = 50
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object sbtClear: TSpeedButton
            Tag = 11
            Left = 0
            Top = 0
            Width = 30
            Height = 50
            Cursor = crHandPoint
            Hint = #44160#49353#51312#44148' '#52488#44592#54868
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = #46027#50880
            Font.Style = []
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFF84FFFF84
              FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF
              84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF8400FFFFFFFFFFFF
              FF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84
              FFFF84FFFF84FFFF84FFFF84000000000000000000FFFF84FFFF84FFFF84FFFF
              84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84000000FFFFFF00
              FFFFFFFFFF000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84
              FFFF84FFFF84000000FFFFFF848484FFFFFF00FFFFFFFFFF000000FFFF84FFFF
              84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84000000FFFFFF848484FFFFFFC6
              C6C684848400FFFFFFFFFF000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84
              000000FFFFFF848484FFFFFFC6C6C684848400FFFFFFFFFF00FFFF8484840000
              00FFFF84FFFF84FFFF84FFFF84000000FFFFFF848484FFFFFFC6C6C684848400
              FFFFFFFFFF00FFFF848484C6C6C6C6C6C6000000FFFF84FFFF84FFFF84000000
              000000FFFFFFC6C6C684848400FFFFFFFFFF00FFFF848484C6C6C6C6C6C6C6C6
              C6000000FFFF84FFFF84FFFF84FFFF84FFFF8400000000000000FFFFFFFFFF00
              FFFF848484C6C6C6C6C6C6C6C6C6000000FFFF84FFFF84FFFF84FFFF84FFFF84
              FFFF84FFFF84FFFF8400000000FFFF848484C6C6C6C6C6C6C6C6C68484848400
              00000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84000000C6
              C6C6C6C6C6C6C6C6000000840000840000840000000000FFFF84FFFF84FFFF84
              FFFF84FFFF84FFFF84FFFF84FFFF84000000000000000000FFFF840000008400
              00840000840000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FF
              FF84FFFF84FFFF84FFFF84FFFF84000000840000840000FFFF84FFFF84FFFF84
              FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF
              84000000000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FF
              FF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84}
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtClearClick
            ExplicitLeft = -5
            ExplicitTop = -1
          end
        end
      end
      object Panel4: TPanel
        Left = 389
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #51228#54408#47749
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 10
      end
      object Panel6: TPanel
        Left = 1413
        Top = 1
        Width = 208
        Height = 58
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 8
        object Pnl_Order: TPanel
          Tag = 2
          Left = 4
          Top = 4
          Width = 200
          Height = 50
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Color = 15132364
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object sbt_Order: TSpeedButton
            Tag = 2
            Left = 0
            Top = 0
            Width = 200
            Height = 50
            Cursor = crHandPoint
            Align = alClient
            Caption = #52636#44256#51648#49884
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -32
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbt_OrderClick
            ExplicitLeft = 4
            ExplicitTop = -1
          end
        end
      end
      object Panel7: TPanel
        Left = 129
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #51228#54408#53076#46300
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 11
      end
      object Panel31: TPanel
        Left = 389
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #51228#54408#50668#48512
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 12
      end
      object Panel23: TPanel
        Left = 129
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #51228#54408#48264#54840
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 13
      end
      object Panel1: TPanel
        Left = 649
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #51201#52824#54840#44592
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 14
      end
      object Panel5: TPanel
        Left = 909
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #52636#44256#47785#51201
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 15
      end
      object cbDEST: TComboBox
        Left = 993
        Top = 32
        Width = 170
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 7
        Text = #51068#48152'('#54056#49828')'
        OnChange = cbDESTChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #51068#48152'('#54056#49828')'
          #45225#54408'('#47017#54609')')
      end
      object Panel10: TPanel
        Left = 909
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #52636#44256#53440#51077
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 16
      end
      object cbID_TYPE: TComboBox
        Left = 993
        Top = 5
        Width = 170
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 6
        Text = #52285#44256#52636#44256
        OnChange = cbID_TYPEChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #52285#44256#52636#44256
          #48708#49345#52636#44256)
      end
      object edtITEM_INFO_01: TEdit
        Left = 213
        Top = 32
        Width = 170
        Height = 23
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = qryChange
        OnKeyPress = edtITEM_INFOKeyPress
      end
      object Panel14: TPanel
        Left = 352
        Top = 33
        Width = 30
        Height = 21
        BevelOuter = bvNone
        TabOrder = 17
        Visible = False
        object sbt_ITEM: TSpeedButton
          Tag = 11
          Left = 0
          Top = 0
          Width = 30
          Height = 21
          Cursor = crHandPoint
          Hint = #54408#47785' '#52286#44592
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #46027#50880
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000012170000121700000000000000000000E3C8868D720D
            8D720DE3C886E1E1E1E1E1E1E5E5E5E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E1E0E0E0E0E0E0B08A21EBC636E0B22F8D720DE3C886E1E1E1E1E1E1E3
            E3E3E1E1E1E1E1E1E1E1E1E0E0E0E1E1E1E0E0E0E1E1E1E0E0E0CFA132FEF9CF
            EBC636E0B22F8D720DE3C886E1E1E1E1E1E1E5E5E5E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1E1E3C886CFA132FEF9CFEBC636E0B22F8D720DE3C886E1
            E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E0E0E0E1E1E1E3C886
            CFA132FEF9CFEBC636E0B22F8D720DE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E3C886CFA132FEF9CFEBC636E0B22F8B
            7212BEBEBE8F8F8F747474919191C1C1C1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E3C886CFA132FEF9CF8271307B7B7BADADADD6D6D6EDEDEDD5D5D5ACAC
            AC797979D1D1D1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E18B7215787772BA
            BABADADADAE8E8E8ECECECEDEDEDECECECCECECE7D7D7DE1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1C1C1C1A6A6A6CBCBCBD8D8D8E6E6E6EBEBEBEBEBEBE9E9
            E9E1E1E1ABABABC4C4C4E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1949494C6C6C6D6
            D6D6E5E5E5EEEEEEF0F0F0EFEFEFEBEBEBE0E0E0CDCDCD969696E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E18E8E8ED8D8D8E4E4E4F1F1F1F8F8F8F9F9F9F8F8F8F2F2
            F2E9E9E9DADADA909090E1E1E1E1E1E1E1E1E1E1E1E1E1E1E19D9D9DDADADAF0
            F0F0FEFEFEFFFFFFFFFFFFFFFFFFFDFDFDF1F1F1DBDBDBA0A0A0E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1CBCBCBC2C2C2F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF5F5F5C0C0C0CECECEE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E19E9E9EE6
            E6E6FEFEFEFFFFFFFFFFFFFFFFFFFDFDFDDFDFDF9D9D9DE1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1E1E1E1DCDCDCA2A2A2CDCDCDF2F2F2FCFCFCEEEEEEC8C8
            C8A2A2A2DFDFDFE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1D2D2D2B3B3B3A4A4A4B5B5B5D6D6D6E1E1E1E1E1E1E1E1E1}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbt_ITEMClick
          ExplicitLeft = 4
          ExplicitTop = -3
          ExplicitWidth = 28
          ExplicitHeight = 22
        end
      end
      object edtITEM_INFO_02: TEdit
        Left = 473
        Top = 32
        Width = 170
        Height = 23
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnChange = qryChange
        OnKeyPress = edtITEM_INFOKeyPress
      end
      object edtITEM_LOT: TEdit
        Left = 213
        Top = 5
        Width = 170
        Height = 23
        Hint = 'LOT'#48264#54840'('#44256#50976#48264#54840')'
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = qryChange
        OnKeyPress = edtITEM_LOTKeyPress
      end
      object cbITEM_TYPE: TComboBox
        Left = 473
        Top = 5
        Width = 170
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = #51204#52404
        OnChange = cbITEM_TYPEChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #51204#52404
          #48152#51228#54408
          #51228#54408)
      end
      object Panel12: TPanel
        Left = 649
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #51201#52824#50948#52824
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 18
      end
      object Panel33: TPanel
        Left = 733
        Top = 32
        Width = 170
        Height = 23
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
        object cbCBank: TComboBox
          Left = 0
          Top = 0
          Width = 54
          Height = 23
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = #51204#52404
          OnChange = qryChange
          OnKeyPress = cbKeyPress
          Items.Strings = (
            #51204#52404
            '01'
            '02'
            '03'
            '04'
            '05'
            '06')
        end
        object cbCBay: TComboBox
          Left = 58
          Top = 0
          Width = 54
          Height = 23
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = #51204#52404
          OnChange = qryChange
          OnKeyPress = cbKeyPress
          Items.Strings = (
            #51204#52404
            '01'
            '02'
            '03'
            '04'
            '05'
            '06'
            '07'
            '08'
            '09'
            '10'
            '11'
            '12')
        end
        object Panel17: TPanel
          Left = 112
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object cbCLevel: TComboBox
          Left = 116
          Top = 0
          Width = 54
          Height = 23
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = #51204#52404
          OnChange = qryChange
          OnKeyPress = cbKeyPress
          Items.Strings = (
            #51204#52404
            '01'
            '02'
            '03'
            '04'
            '05'
            '06'
            '07'
            '08')
        end
        object Panel30: TPanel
          Left = 54
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
      end
      object cbCHogi: TComboBox
        Left = 733
        Top = 5
        Width = 170
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = #51204#52404
        OnChange = cbCHogiChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #51204#52404
          #49828#53468#52964#53356#47112#51064' 1'#54840#44592
          #49828#53468#52964#53356#47112#51064' 2'#54840#44592
          #49828#53468#52964#53356#47112#51064' 3'#54840#44592)
      end
    end
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 72
    Top = 526
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 40
    Top = 526
  end
  object qryTemp: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 64
    Top = 310
  end
  object EhPrint: TPrintDBGridEh
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'Tahoma'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'Tahoma'
    PageHeader.Font.Style = []
    Units = MM
    Left = 96
    Top = 310
  end
  object pmControl: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    OnPopup = pmControlPopup
    Left = 128
    Top = 310
  end
  object tmrQuery: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = tmrQueryTimer
    Left = 160
    Top = 310
  end
  object qryStat: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 32
    Top = 310
  end
  object qryStock: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 32
    Top = 278
  end
  object dsStock: TDataSource
    DataSet = qryStock
    Left = 64
    Top = 278
  end
  object SP_AUTO_INDEX: TADOStoredProc
    Connection = MainDm.MainDatabase
    ProcedureName = 'fn_auto_index;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@index'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end>
    Left = 97
    Top = 278
  end
end
