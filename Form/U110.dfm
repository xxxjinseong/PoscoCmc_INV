object frmU110: TfrmU110
  Left = 2026
  Top = 265
  Caption = '110. '#49324#50857#51088#53076#46300
  ClientHeight = 592
  ClientWidth = 1484
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
    Width = 1484
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
    Left = 1483
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
    Width = 1484
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
    Width = 1482
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
      Width = 1472
      Height = 516
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 1
      OnResize = Pnl_MainResize
      object Splitter1: TSplitter
        Left = 783
        Top = 1
        Width = 7
        Height = 514
        Beveled = True
        OnMoved = Splitter1Moved
        ExplicitLeft = 793
      end
      object dgInfo: TDBGridEh
        Left = 1
        Top = 1
        Width = 782
        Height = 514
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
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        PopupMenu = pmControl
        RowHeight = 5
        RowLines = 1
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
        OnDblClick = dgInfoDblClick
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'USER_ID'
            Footers = <>
            Title.Caption = #49324#50857#51088#53076#46300
            Width = 136
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'USER_NM'
            Footers = <>
            Title.Caption = #49324#50857#51088#47749
            Width = 136
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'USER_INFO_1'
            Footers = <>
            Title.Caption = #51221#48372
            Width = 200
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADMIN_YN'
            Footers = <>
            Title.Caption = #44288#47532#51088#44428#54620
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'tCR_DT'
            Footers = <>
            Title.Caption = #46321#47197#51068#51088
            Width = 175
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
        Left = 790
        Top = 1
        Width = 681
        Height = 514
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
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh, gioShowRowselCheckboxesEh]
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
        OnCellClick = dgInfoSubCellClick
        OnDrawColumnCell = dgInfoSubDrawColumnCell
        OnSelectionChanged = dgInfoSubSelectionChanged
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16710378
            DynProps = <>
            EditButtons = <>
            FieldName = 'MENU_ID'
            Footers = <>
            Title.Caption = #47700#45684#48264#54840
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'GP_NM'
            Footers = <>
            Title.Caption = #47700#45684#44536#47353
            Width = 120
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'MENU_NM'
            Footers = <>
            Title.Caption = #47700#45684#47749
            Width = 300
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'USED_YN'
            Footers = <>
            Title.Caption = #49324#50857#50668#48512
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
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
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
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
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
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
            Width = 100
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object CheckBoxAll: TCheckBox
        Left = 802
        Top = 6
        Width = 14
        Height = 16
        Color = 15987699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBoxAllClick
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
        Caption = #49324#50857#51088#53076#46300
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
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
        TabOrder = 5
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
        Width = 150
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edtChange
        OnKeyPress = KeyPress
      end
      object Panel4: TPanel
        Left = 129
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #49324#50857#51088#47749
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
      object edtName: TEdit
        Left = 213
        Top = 32
        Width = 150
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = edtChange
        OnKeyPress = KeyPress
      end
      object Panel5: TPanel
        Left = 369
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #44288#47532#51088#44428#54620
        Color = 15132364
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 7
      end
      object cbAdmin_YN: TComboBox
        Left = 453
        Top = 5
        Width = 150
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
        OnChange = ComboChange
        OnKeyPress = KeyPress
        Items.Strings = (
          #51204#52404
          'Y'
          'N')
      end
      object Panel6: TPanel
        Left = 1218
        Top = 1
        Width = 253
        Height = 58
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 3
        object Panel7: TPanel
          Left = 6
          Top = 4
          Width = 242
          Height = 51
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
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 122
            Height = 51
            Align = alClient
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = '  '#49440#53469#44148#49688
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #46027#50880
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object SlectCnt: TLabel
              Left = 74
              Top = 14
              Width = 40
              Height = 23
              Alignment = taCenter
              AutoSize = False
              Caption = '0'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -19
              Font.Name = #46027#50880
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
              Layout = tlCenter
            end
          end
          object Panel12: TPanel
            Left = 122
            Top = 0
            Width = 60
            Height = 51
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbtUsed: TSpeedButton
              Tag = 1
              Left = 0
              Top = 0
              Width = 60
              Height = 51
              Cursor = crHandPoint
              Hint = 'Y'
              Align = alClient
              Caption = #49324#50857
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = #46027#50880
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              OnClick = sbtUsedClick
              ExplicitLeft = -2
              ExplicitTop = -2
            end
          end
          object Panel13: TPanel
            Left = 182
            Top = 0
            Width = 60
            Height = 51
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object sbtNone: TSpeedButton
              Tag = 2
              Left = 0
              Top = 0
              Width = 60
              Height = 51
              Cursor = crHandPoint
              Hint = 'N'
              Align = alClient
              Caption = #44552#51648
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = #46027#50880
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              OnClick = sbtUsedClick
              ExplicitLeft = 5
              ExplicitTop = -2
            end
          end
        end
      end
    end
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 56
    Top = 94
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 24
    Top = 94
  end
  object qryTemp: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 88
    Top = 94
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
    Top = 94
  end
  object pmControl: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    OnPopup = pmControlPopup
    Left = 152
    Top = 94
    object mnCodeDel: TMenuItem
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #49324#50857#51088#49325#51228
      ImageIndex = 0
      ShortCut = 46
      OnClick = mnCodeDelClick
    end
  end
  object qryInfoSub: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 816
    Top = 94
  end
  object dsInfoSub: TDataSource
    DataSet = qryInfoSub
    Left = 848
    Top = 94
  end
  object qryTempSub: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 880
    Top = 94
  end
end
