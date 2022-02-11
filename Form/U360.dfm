object frmU360: TfrmU360
  Left = 2026
  Top = 265
  Caption = '360. '#51060#46041#49892#51201' '#51312#54924
  ClientHeight = 592
  ClientWidth = 1704
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
    Width = 1704
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
    Left = 1703
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
    Width = 1704
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
    Width = 1702
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
      Width = 1692
      Height = 516
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 1
      object dgInfo: TDBGridEh
        Left = 1
        Top = 1
        Width = 1690
        Height = 514
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
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'OR_DT'
            Footers = <>
            Title.Caption = #51089#50629#51068#49884
            Width = 175
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_01'
            Footers = <>
            Title.Caption = #49892#51201#44396#48516
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROC_MANUAL'
            Footers = <>
            Title.Caption = #50756#47308#49345#53468
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
            FieldName = 'BODY_06'
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
            FieldName = 'BODY_07'
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
            FieldName = 'BODY_08'
            Footer.Alignment = taRightJustify
            Footer.DisplayFormat = '##,##0.000'
            Footer.FieldName = 'BODY_08'
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
            FieldName = 'BODY_12'
            Footers = <>
            Title.Caption = #51228#54408#50668#48512
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_02'
            Footers = <>
            Title.Caption = #51060#46041#51068#49884
            Width = 175
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOGI'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindow
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = []
            Footers = <>
            Title.Caption = #51201#52824#54840#44592
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_04'
            Footers = <>
            Title.Caption = '('#51204')'#51201#52824#50948#52824
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_05'
            Footers = <>
            Title.Caption = #51201#52824#50948#52824
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BODY_09'
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
            FieldName = 'BODY_10'
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
            FieldName = 'BODY_11'
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
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'SEND_YN'
            Footers = <>
            Title.Caption = #51204#49569#50668#48512
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'SEND_DT'
            Footers = <>
            Title.Caption = #51204#49569#51068#49884
            Width = 175
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
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 480
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 200
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 80
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Pnl_Top: TPanel
      Left = 5
      Top = 5
      Width = 1692
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
        TabOrder = 10
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
        Caption = #51089#50629#51068#49884
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
        Left = 547
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
        TabOrder = 3
        OnChange = edtChange
        OnKeyPress = KeyPress
      end
      object Panel7: TPanel
        Left = 463
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
        TabOrder = 12
      end
      object edtLOT: TEdit
        Tag = 1
        Left = 547
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
        TabOrder = 2
        OnChange = edtChange
        OnKeyPress = KeyPress
      end
      object Panel14: TPanel
        Left = 656
        Top = 33
        Width = 30
        Height = 21
        BevelOuter = bvNone
        TabOrder = 13
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
          ExplicitLeft = 1
          ExplicitTop = 1
        end
      end
      object Panel24: TPanel
        Left = 463
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
        TabOrder = 14
      end
      object Panel12: TPanel
        Left = 693
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
        TabOrder = 15
      end
      object cbITEM_TYPE: TComboBox
        Tag = 1
        Left = 777
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
        TabOrder = 4
        Text = #51204#52404
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #51204#52404
          #48152#51228#54408
          #51228#54408)
      end
      object Panel13: TPanel
        Left = 923
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
        TabOrder = 16
      end
      object Panel16: TPanel
        Left = 923
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
        TabOrder = 17
      end
      object edtITEM_INFO_06: TEdit
        Tag = 2
        Left = 1007
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
        TabOrder = 6
        OnChange = edtChange
        OnKeyPress = KeyPress
      end
      object edtITEM_INFO_08: TEdit
        Tag = 1
        Left = 1007
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
        TabOrder = 5
        OnChange = edtChange
        OnKeyPress = KeyPress
      end
      object PnlIpgoPos: TPanel
        Left = 1153
        Top = 0
        Width = 254
        Height = 60
        BevelOuter = bvNone
        TabOrder = 7
        object Panel6: TPanel
          Left = 0
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
          TabOrder = 2
        end
        object Panel17: TPanel
          Left = 0
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
          TabOrder = 3
        end
        object cbHogi: TComboBox
          Left = 84
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
          Text = #51204#52404
          OnChange = cbChange
          OnKeyPress = cbKeyPress
          Items.Strings = (
            #51204#52404
            #49828#53468#52964#53356#47112#51064' 1'#54840#44592
            #49828#53468#52964#53356#47112#51064' 2'#54840#44592
            #49828#53468#52964#53356#47112#51064' 3'#54840#44592)
        end
        object Panel20: TPanel
          Left = 84
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
          TabOrder = 1
          object cbCBank: TComboBox
            Tag = 1
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
            TabOrder = 0
            Text = #51204#52404
            OnChange = cbChange
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
            Tag = 1
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
            TabOrder = 1
            Text = #51204#52404
            OnChange = cbChange
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
          object Panel21: TPanel
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
            Tag = 1
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
            TabOrder = 2
            Text = #51204#52404
            OnChange = cbChange
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
          object Panel22: TPanel
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
      end
      object Panel2: TPanel
        Left = 1412
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
        TabOrder = 18
      end
      object Panel19: TPanel
        Left = 1412
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
        TabOrder = 19
      end
      object udRowHeight: TUpDown
        Left = 1557
        Top = 5
        Width = 26
        Height = 23
        Associate = edtRowHeight
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 20
      end
      object edtRowHeight: TEdit
        Left = 1496
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
        TabOrder = 8
        Text = '1'
        OnChange = edtRowHeightChange
      end
      object udFontSize: TUpDown
        Left = 1557
        Top = 32
        Width = 26
        Height = 23
        Associate = edtFontSize
        Min = 8
        Max = 20
        Position = 11
        TabOrder = 21
      end
      object edtFontSize: TEdit
        Left = 1496
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
        TabOrder = 9
        Text = '11'
        OnChange = edtFontSizeChange
      end
      object Panel10: TPanel
        Left = 693
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
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
      object cbIN_SITE: TComboBox
        Tag = 1
        Left = 777
        Top = 32
        Width = 140
        Height = 23
        Color = 16119285
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 23
        OnChange = cbChange
        OnKeyPress = cbKeyPress
      end
    end
    object Panel26: TPanel
      Left = 5
      Top = 65
      Width = 1692
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
      object Panel27: TPanel
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
end
