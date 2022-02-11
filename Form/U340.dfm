object frmU340: TfrmU340
  Left = 2026
  Top = 265
  Caption = '340. '#52636#44256#50836#52397' '#51221#48372
  ClientHeight = 592
  ClientWidth = 1659
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
    Top = 591
    Width = 1659
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
    Height = 590
    Align = alLeft
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitLeft = 213
    ExplicitTop = 20
    ExplicitHeight = 22
  end
  object shpR: TShape
    Left = 1658
    Top = 1
    Width = 1
    Height = 590
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
    Width = 1659
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
    Width = 1657
    Height = 590
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Color = 15198183
    ParentBackground = False
    TabOrder = 0
    object Pnl_Main: TPanel
      Left = 5
      Top = 69
      Width = 1647
      Height = 452
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 1
      object dgInfo: TDBGridEh
        Left = 1
        Top = 1
        Width = 1645
        Height = 450
        Align = alClient
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
        TabOrder = 0
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
        OnCellClick = dgInfoCellClick
        OnDrawColumnCell = dgInfoDrawColumnCell
        OnKeyPress = dgInfoKeyPress
        OnSelectionChanged = dgInfoSelectionChanged
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'RECV_DT'
            Footers = <>
            Title.Caption = #49688#49888#51068#49884
            Width = 175
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_04'
            Footers = <>
            Title.Caption = #50836#52397#51068#49884
            Width = 175
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_01'
            Footers = <>
            Title.Caption = #50836#52397#44396#48516
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_02'
            Footers = <>
            Title.Caption = #52712#49548#44396#48516
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROC_STAT'
            Footers = <>
            Title.Caption = #52376#47532#49345#53468
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_03'
            Footers = <>
            Title.Caption = #51228#54408#48264#54840
            Width = 210
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_05'
            Footers = <>
            Title.Caption = #51228#54408#53076#46300
            Width = 130
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_06'
            Footers = <>
            Title.Caption = #51228#54408#47749
            Width = 300
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            Color = clWhite
            DisplayFormat = '##,##0.000'
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_07'
            Footer.Alignment = taRightJustify
            Footer.DisplayFormat = '##,##0.000'
            Footer.FieldName = 'BODY_07'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #51473#47049
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_22'
            Footers = <>
            Title.Caption = #47017#54609#50668#48512
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'STOCK_EXIST'
            Footers = <>
            Title.Caption = #51116#44256#50976#47924
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'STOCK_TYPE'
            Footers = <>
            Title.Caption = #51228#54408#50668#48512
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'STOCK_POS'
            Footers = <>
            Title.Caption = #52636#44256#50948#52824
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'OUT_USED'
            Footers = <>
            Title.Caption = #52636#44256#44032#45733
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_09'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindow
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = []
            Footers = <>
            Title.Caption = '('#48320')'#51228#54408#53076#46300
            Width = 130
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_10'
            Footer.Alignment = taRightJustify
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindow
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = []
            Footers = <>
            Title.Caption = '('#48320')'#51228#54408#47749
            Width = 150
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_08'
            Footers = <>
            Title.Caption = '('#48320')'#52636#44256#50668#48512
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_11'
            Footer.Alignment = taCenter
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #44256#44061#53076#46300
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_12'
            Footer.Alignment = taRightJustify
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindow
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = []
            Footers = <>
            Title.Caption = #44256#44061#47749
            Width = 140
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_13'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindow
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = []
            Footers = <>
            Title.Caption = #51452#47928#48264#54840
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_14'
            Footers = <>
            Title.Caption = #48520#52636#50836#52397#51068#51088
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_15'
            Footers = <>
            Title.Caption = #48520#52636#50836#52397#49692#48264
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_16'
            Footers = <>
            Title.Caption = #52636#54616#51648#49884#48264#54840
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_17'
            Footers = <>
            Title.Caption = #52636#54616#54408#47785#49692#48264
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_18'
            Footers = <>
            Title.Caption = #51116#51089#50629#51648#49884#48264#54840
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_19'
            Footers = <>
            Title.Caption = #51116#51089#50629#54408#47785#49692#48264
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_20'
            Footers = <>
            Title.Caption = #44592#53440#51077#52636#48264#54840
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_21'
            Footers = <>
            Title.Caption = #44592#53440#54408#47785#49692#48264
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROC_MANUAL'
            Footer.Alignment = taCenter
            Footers = <>
            Title.Caption = #49688#46041#52376#47532
            Visible = False
            Width = 100
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 65
      Width = 1647
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
      Width = 1647
      Height = 60
      Align = alTop
      ParentBackground = False
      TabOrder = 0
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
        TabOrder = 12
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
            ExplicitLeft = -5
            ExplicitTop = -1
            ExplicitHeight = 51
          end
        end
      end
      object Panel1: TPanel
        Left = 213
        Top = 5
        Width = 244
        Height = 23
        BevelOuter = bvNone
        TabOrder = 0
        object DatePicker1: TDateTimePicker
          Left = 0
          Top = 0
          Width = 150
          Height = 23
          Cursor = crHandPoint
          Align = alLeft
          Date = 43201.594927025500000000
          Time = 43201.594927025500000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          ParentFont = False
          TabOrder = 0
          OnChange = DatePickerChange
        end
        object TimePicker1: TDateTimePicker
          Left = 154
          Top = 0
          Width = 90
          Height = 23
          Cursor = crHandPoint
          Align = alLeft
          Date = 38799.291666666660000000
          Format = 'HH:mm:ss'
          Time = 38799.291666666660000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          Kind = dtkTime
          ParentFont = False
          TabOrder = 1
          OnChange = DatePickerChange
        end
        object Panel4: TPanel
          Left = 150
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
        end
      end
      object Panel15: TPanel
        Left = 129
        Top = 5
        Width = 80
        Height = 50
        BevelOuter = bvNone
        Caption = #49688#49888#51068#49884
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
      object Panel5: TPanel
        Left = 213
        Top = 32
        Width = 244
        Height = 23
        BevelOuter = bvNone
        TabOrder = 1
        object Panel18: TPanel
          Left = 150
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
        end
        object DatePicker2: TDateTimePicker
          Left = 0
          Top = 0
          Width = 150
          Height = 23
          Cursor = crHandPoint
          Align = alLeft
          Date = 43201.594982314800000000
          Time = 43201.594982314800000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          ParentFont = False
          TabOrder = 0
          OnChange = DatePickerChange
        end
        object TimePicker2: TDateTimePicker
          Left = 154
          Top = 0
          Width = 90
          Height = 23
          Cursor = crHandPoint
          Align = alLeft
          Date = 38799.999988425930000000
          Format = 'HH:mm:ss'
          Time = 38799.999988425930000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          Kind = dtkTime
          ParentFont = False
          TabOrder = 1
          OnChange = DatePickerChange
        end
      end
      object edtCode: TEdit
        Tag = 2
        Left = 777
        Top = 32
        Width = 140
        Height = 23
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = edtChange
        OnKeyPress = KeyPress
      end
      object Panel7: TPanel
        Left = 693
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
        TabOrder = 14
      end
      object edtLOT: TEdit
        Tag = 1
        Left = 777
        Top = 5
        Width = 140
        Height = 23
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnChange = edtChange
        OnKeyPress = KeyPress
      end
      object Panel14: TPanel
        Left = 886
        Top = 33
        Width = 30
        Height = 21
        BevelOuter = bvNone
        TabOrder = 15
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
          ExplicitLeft = 2
          ExplicitTop = 2
          ExplicitWidth = 28
          ExplicitHeight = 22
        end
      end
      object Panel24: TPanel
        Left = 693
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
        TabOrder = 16
      end
      object Panel12: TPanel
        Left = 923
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #51116#44256#49345#53468
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 17
      end
      object Panel10: TPanel
        Left = 923
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #47017#54609#50668#48512
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
      object cbSTOCK_EXIST: TComboBox
        Tag = 1
        Left = 1007
        Top = 5
        Width = 140
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 6
        Text = #51204#52404
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #51204#52404
          #51116#44256#51080#51020
          #51116#44256#50630#51020
          #51089#50629#51473
          #50640#47084)
      end
      object cbBODY_22: TComboBox
        Tag = 1
        Left = 1007
        Top = 32
        Width = 140
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 7
        Text = #51204#52404
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #51204#52404
          'Y'
          'N')
      end
      object Panel13: TPanel
        Left = 1153
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #51452#47928#48264#54840
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 19
      end
      object Panel16: TPanel
        Left = 1153
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #44256#44061#53076#46300
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 20
      end
      object edtITEM_INFO_06: TEdit
        Tag = 2
        Left = 1237
        Top = 32
        Width = 140
        Height = 23
        Hint = #44256#44061#53076#46300' '#46608#45716' '#44256#44061#47749
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnChange = edtChange
        OnKeyPress = KeyPress
      end
      object edtITEM_INFO_08: TEdit
        Tag = 1
        Left = 1237
        Top = 5
        Width = 140
        Height = 23
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnChange = edtChange
        OnKeyPress = KeyPress
      end
      object Panel6: TPanel
        Left = 1383
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
        TabOrder = 21
      end
      object Panel19: TPanel
        Left = 1383
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
        TabOrder = 22
      end
      object udRowHeight: TUpDown
        Left = 1528
        Top = 5
        Width = 26
        Height = 23
        Associate = edtRowHeight
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 23
      end
      object edtRowHeight: TEdit
        Left = 1467
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
        TabOrder = 10
        Text = '1'
        OnChange = edtRowHeightChange
      end
      object udFontSize: TUpDown
        Left = 1528
        Top = 32
        Width = 26
        Height = 23
        Associate = edtFontSize
        Min = 8
        Max = 20
        Position = 11
        TabOrder = 24
      end
      object edtFontSize: TEdit
        Left = 1467
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
        TabOrder = 11
        Text = '11'
        OnChange = edtFontSizeChange
      end
      object Panel17: TPanel
        Left = 463
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #50836#52397#44396#48516
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 25
      end
      object Panel20: TPanel
        Left = 463
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #52376#47532#49345#53468
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 26
      end
      object cbBODY_01: TComboBox
        Tag = 1
        Left = 547
        Top = 5
        Width = 140
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = #51204#52404
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #51204#52404
          #49373#49328#48520#52636
          #51228#54408#52636#54616
          #51116#51089#50629
          #44592#53440#52636#44256)
      end
      object cbPROC_STAT: TComboBox
        Tag = 1
        Left = 547
        Top = 32
        Width = 140
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
          #52636#44256#45824#44592
          #52636#44256#51652#54665)
      end
      object Panel33: TPanel
        Left = 1560
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
        TabOrder = 27
        Visible = False
      end
      object cbOUT_USED: TComboBox
        Tag = 1
        Left = 1560
        Top = 32
        Width = 80
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 28
        Text = #51204#52404
        Visible = False
        OnChange = cbChange
        Items.Strings = (
          #51204#52404
          'Y'
          'N')
      end
    end
    object Panel21: TPanel
      Left = 5
      Top = 525
      Width = 1647
      Height = 60
      Align = alBottom
      ParentBackground = False
      TabOrder = 3
      object Panel22: TPanel
        Left = 6
        Top = 5
        Width = 120
        Height = 50
        BevelOuter = bvNone
        Color = 14803425
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        object Panel23: TPanel
          Left = 30
          Top = 0
          Width = 90
          Height = 50
          Align = alClient
          BevelOuter = bvNone
          Caption = #52636#44256#51648#49884
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel25: TPanel
          Left = 0
          Top = 0
          Width = 30
          Height = 50
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object sbtClear2: TSpeedButton
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
            OnClick = sbtClear2Click
            ExplicitLeft = -5
            ExplicitTop = -1
            ExplicitHeight = 51
          end
        end
      end
      object Panel40: TPanel
        Left = 129
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #52636#44256#48169#49885
        Color = 14803425
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
      object Panel41: TPanel
        Left = 129
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #51089#50629#54840#44592
        Color = 14803425
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
      object cbOUT_MODE: TComboBox
        Tag = 1
        Left = 213
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
        TabOrder = 0
        Text = #49688#46041#49440#53469
        OnChange = cbOUT_MODEChange
        Items.Strings = (
          #49688#46041#49440#53469
          #49688#47049#51077#47141)
      end
      object cbHogi: TComboBox
        Tag = 1
        Left = 213
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
        TabOrder = 1
        Text = #51204#52404
        OnChange = cbHogiChange
        Items.Strings = (
          #51204#52404
          #49828#53468#52964#53356#47112#51064' 1'#54840#44592
          #49828#53468#52964#53356#47112#51064' 2'#54840#44592
          #49828#53468#52964#53356#47112#51064' 3'#54840#44592)
      end
      object Panel30: TPanel
        Left = 389
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #52636#44256#53440#51077
        Color = 14803425
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
      end
      object cbID_TYPE: TComboBox
        Tag = 1
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
        TabOrder = 6
        Text = #52285#44256#52636#44256
        OnChange = cbID_TYPEChange
        Items.Strings = (
          #52285#44256#52636#44256
          #48708#49345#52636#44256)
      end
      object Panel31: TPanel
        Left = 389
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #52636#44256#49688#47049
        Color = 14803425
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 7
      end
      object edtOUT_COUNT: TEdit
        Tag = 1
        Left = 473
        Top = 5
        Width = 170
        Height = 23
        Hint = #49440#53469#48169#49885#51032' '#49688#47049#51077#47141' '#49440#53469' '#49884' '#54876#49457#54868
        Alignment = taCenter
        CharCase = ecUpperCase
        Color = 16119285
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnKeyPress = KeyPress
      end
      object Panel32: TPanel
        Left = 1438
        Top = 1
        Width = 208
        Height = 58
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 9
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
      object Panel26: TPanel
        Left = 840
        Top = 5
        Width = 450
        Height = 50
        BevelOuter = bvNone
        TabOrder = 10
        object lblOrderCommand: TLabel
          Left = 124
          Top = 0
          Width = 130
          Height = 50
          Align = alLeft
          AutoSize = False
          Caption = '[ 0 ]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = #46027#50880
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 124
          Height = 50
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #51648#49884' '#44148#49688' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = #46027#50880
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object Label3: TLabel
          Left = 254
          Top = 0
          Width = 124
          Height = 50
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = #49892#54665' '#44148#49688' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = #46027#50880
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitLeft = 204
        end
        object lblOrderComplete: TLabel
          Left = 378
          Top = 0
          Width = 80
          Height = 50
          Align = alLeft
          AutoSize = False
          Caption = '[ 0 ]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = #46027#50880
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitLeft = 280
        end
      end
    end
    object Panel42: TPanel
      Left = 5
      Top = 521
      Width = 1647
      Height = 4
      ParentCustomHint = False
      Align = alBottom
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
      TabOrder = 4
      object Panel43: TPanel
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
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 56
    Top = 190
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 24
    Top = 190
  end
  object qryTemp: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 88
    Top = 190
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
    Left = 120
    Top = 190
  end
  object pmControl: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    OnPopup = pmControlPopup
    Left = 152
    Top = 190
    object mnJobCancel: TMenuItem
      Tag = 1
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #50836#52397#52712#49548
      ImageIndex = 0
      ShortCut = 46
      Visible = False
      OnClick = mnProcClick
    end
    object mnJobStackComplete: TMenuItem
      Tag = 2
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #52636#44256#50756#47308
      ShortCut = 45
      Visible = False
      OnClick = mnProcClick
    end
  end
  object qryStat: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 88
    Top = 230
  end
  object qryOrder: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 56
    Top = 230
  end
  object tmrQuery: TTimer
    Enabled = False
    OnTimer = tmrQueryTimer
    Left = 184
    Top = 190
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
    Left = 121
    Top = 230
  end
end
