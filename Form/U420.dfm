object frmU420: TfrmU420
  Left = 0
  Top = 0
  Caption = '420. '#53076#46300#48324' '#51116#44256#54788#54889
  ClientHeight = 586
  ClientWidth = 1484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = #46027#50880
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 11
  object shpB: TShape
    Left = 0
    Top = 585
    Width = 1484
    Height = 1
    Align = alBottom
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitLeft = -849
    ExplicitTop = 298
  end
  object shpL: TShape
    Left = 0
    Top = 1
    Width = 1
    Height = 584
    Align = alLeft
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitTop = -291
    ExplicitHeight = 590
  end
  object shpR: TShape
    Left = 1483
    Top = 1
    Width = 1
    Height = 584
    Align = alRight
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitLeft = 634
    ExplicitTop = -291
    ExplicitHeight = 590
  end
  object shpT: TShape
    Left = 0
    Top = 0
    Width = 1484
    Height = 1
    Align = alTop
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitLeft = -849
  end
  object Pnl_Base: TPanel
    Left = 1
    Top = 1
    Width = 1482
    Height = 584
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Color = 15198183
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #46027#50880
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Pnl_Main: TPanel
      Left = 5
      Top = 69
      Width = 1472
      Height = 510
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #46027#50880
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnResize = Pnl_MainResize
      object Splitter1: TSplitter
        Left = 678
        Top = 1
        Width = 8
        Height = 508
        Beveled = True
        OnMoved = Splitter1Moved
        ExplicitLeft = 625
        ExplicitHeight = 514
      end
      object dgInfo: TDBGridEh
        Left = 1
        Top = 1
        Width = 677
        Height = 508
        Align = alLeft
        BorderStyle = bsNone
        ColumnDefValues.Layout = tlCenter
        ColumnDefValues.Title.Alignment = taCenter
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
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
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
        OnCellClick = dgInfoCellClick
        OnKeyPress = dgInfoKeyPress
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_INFO_01'
            Footers = <>
            Title.Caption = #51228#54408#53076#46300
            Width = 130
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
            Alignment = taRightJustify
            AutoFitColWidth = False
            Color = clWhite
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'COUNT_ITEM'
            Footer.Alignment = taRightJustify
            Footer.DisplayFormat = '###,###,##0'
            Footer.FieldName = 'COUNT_ITEM'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #51116#44256
            Width = 90
          end
          item
            AutoFitColWidth = False
            Color = 16710378
            DisplayFormat = '##,##0.000'
            DynProps = <>
            EditButtons = <>
            FieldName = 'SUM_ITEM_WEIGHT'
            Footer.Alignment = taRightJustify
            Footer.DisplayFormat = '##,##0.000'
            Footer.FieldName = 'SUM_ITEM_WEIGHT'
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
            Footers = <>
            Title.Caption = #44508#44201
            Visible = False
            Width = 85
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Title.Caption = #46321#47197#51068#51088
            Visible = False
            Width = 87
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Title.Caption = #54028#47112#53944'/'#48149#49828
            Visible = False
            Width = 87
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Title.Caption = #48149#49828'/'#49688#47049
            Visible = False
            Width = 87
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Title.Caption = #51116#44256#44288#47532
            Visible = False
            Width = 87
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Title.Caption = #49464#53944#50668#48512
            Visible = False
            Width = 87
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Title.Caption = #45257#51109#48516#47448
            Visible = False
            Width = 87
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Title.Caption = #46321#47197#51068#49884
            Visible = False
            Width = 200
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dgInfoSub: TDBGridEh
        Left = 686
        Top = 1
        Width = 785
        Height = 508
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
        DataSource = dsInfoSub
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
        TitleParams.ParentFont = False
        TitleParams.RowHeight = 23
        TitleParams.VertLineColor = 11053224
        OnKeyPress = dgInfoKeyPress
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_LOT'
            Footer.Alignment = taRightJustify
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
            Footer.Alignment = taRightJustify
            Footers = <>
            Title.Caption = #51228#54408#50668#48512
            Width = 90
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            Color = 16710378
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
            FieldName = 'tITEM_INFO_05'
            Footer.Alignment = taRightJustify
            Footers = <>
            Title.Caption = #49373#49328#51068#49884
            Width = 175
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_INFO_06'
            Footer.Alignment = taRightJustify
            Footers = <>
            Title.Caption = #44256#44061#53076#46300
            Width = 130
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_INFO_07'
            Footer.Alignment = taRightJustify
            Footers = <>
            Title.Caption = #44256#44061#47749
            Width = 130
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM_INFO_08'
            Footer.Alignment = taRightJustify
            Footers = <>
            Title.Caption = #51452#47928#48264#54840
            Width = 130
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'tITEM_INFO_10'
            Footer.Alignment = taRightJustify
            Footers = <>
            Title.Caption = #54032#51221#44208#44284
            Width = 90
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'WRAP_YN'
            Footer.Alignment = taRightJustify
            Footers = <>
            Title.Caption = #47017#54609#50668#48512
            Width = 90
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'iRACK_LOC'
            Footer.Alignment = taRightJustify
            Footers = <>
            Title.Caption = #51201#52824#50948#52824
            Width = 90
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'IN_DATE'
            Footer.Alignment = taRightJustify
            Footers = <>
            Title.Caption = #51077#44256#51068#49884
            Visible = False
            Width = 210
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'RACK_STATUS'
            Footer.Alignment = taRightJustify
            Footers = <>
            Title.Caption = #52636#44256#44032#45733
            Width = 90
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
            Width = 100
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            Footer.Alignment = taRightJustify
            Footers = <>
            Visible = False
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object chkGridSub: TCheckBox
        Left = 690
        Top = 6
        Width = 14
        Height = 16
        Cursor = crHandPoint
        Hint = #51064#49604' '#46608#45716' '#50641#49472#48320#54872' '#54624' '#44536#47532#46300#47484' '#49440#53469' '#54624' '#49688' '#51080#49845#45768#45796'.'
        Color = 15987699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = chkGridSubClick
      end
      object chkGridMain: TCheckBox
        Left = 6
        Top = 6
        Width = 14
        Height = 16
        Cursor = crHandPoint
        Hint = #51064#49604' '#46608#45716' '#50641#49472#48320#54872' '#54624' '#44536#47532#46300#47484' '#49440#53469' '#54624' '#49688' '#51080#49845#45768#45796'.'
        Checked = True
        Color = 15987699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 3
        OnClick = chkGridMainClick
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 65
      Width = 1472
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
      TabOrder = 2
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
      Width = 1472
      Height = 60
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      object Panel1: TPanel
        Left = 129
        Top = 5
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
        TabOrder = 6
      end
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
        TabOrder = 7
        object Panel9: TPanel
          Left = 30
          Top = 0
          Width = 90
          Height = 50
          Align = alClient
          BevelOuter = bvNone
          Caption = #44160#49353#51312#44148
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
            Caption = '(0'#44148')'
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
            ExplicitLeft = 88
            ExplicitTop = -1
          end
        end
      end
      object edtCode: TEdit
        Left = 213
        Top = 5
        Width = 170
        Height = 23
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edtChange
        OnKeyPress = edtKeyPress
      end
      object Panel4: TPanel
        Left = 129
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
        TabOrder = 8
      end
      object edtName: TEdit
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
        TabOrder = 1
        OnChange = edtChange
        OnKeyPress = edtKeyPress
      end
      object Panel14: TPanel
        Left = 352
        Top = 6
        Width = 30
        Height = 21
        BevelOuter = bvNone
        TabOrder = 9
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
          ExplicitTop = -5
        end
      end
      object Panel15: TPanel
        Left = 389
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #52636#44256#44032#45733
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
      object cbRACK_STAT: TComboBox
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
        TabOrder = 2
        Text = #51204#52404
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #51204#52404
          #44032#45733
          #51077#44256#51473
          #52636#44256#51473
          #44552#51648
          #50640#47084)
      end
      object Panel10: TPanel
        Left = 649
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #54665#45458#51060
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
      object edtRowHeight: TEdit
        Left = 733
        Top = 5
        Width = 61
        Height = 23
        Alignment = taCenter
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '1'
        OnChange = edtRowHeightChange
      end
      object Panel12: TPanel
        Left = 649
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #44544#51088#53356#44592
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
      object edtFontSize: TEdit
        Left = 733
        Top = 32
        Width = 61
        Height = 23
        Alignment = taCenter
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '11'
        OnChange = edtFontSizeChange
      end
      object udRowHeight: TUpDown
        Left = 794
        Top = 5
        Width = 26
        Height = 23
        Associate = edtRowHeight
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 13
      end
      object udFontSize: TUpDown
        Left = 794
        Top = 32
        Width = 26
        Height = 23
        Associate = edtFontSize
        Min = 8
        Max = 20
        Position = 11
        TabOrder = 14
      end
      object Panel5: TPanel
        Left = 389
        Top = 32
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
        TabOrder = 15
      end
      object cbITEM_TYPE: TComboBox
        Left = 473
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
        TabOrder = 3
        Text = #51204#52404
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #51204#52404
          #48152#51228#54408
          #51228#54408)
      end
    end
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 584
    Top = 502
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    CursorType = ctStatic
    Parameters = <>
    Left = 616
    Top = 502
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
    Left = 536
    Top = 502
  end
  object qryInfoSub: TADOQuery
    Connection = MainDm.MainDatabase
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 1439
    Top = 502
  end
  object dsInfoSub: TDataSource
    DataSet = qryInfoSub
    Left = 1407
    Top = 502
  end
end
