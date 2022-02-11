unit U410;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, Grids, StdCtrls, Buttons,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Data.Win.ADODB, Data.DB, Vcl.ComCtrls,
  Vcl.Menus, Math, StrUtils, DateUtils ;

type
  TfrmU410 = class(TForm)
    Pnl_Main: TPanel;
    qryCell: TADOQuery;
    qryInfo: TADOQuery;
    tmrQry: TTimer;
    dsCell: TDataSource;
    Pnl_Info: TPanel;
    Panel274: TPanel;
    Panel275: TPanel;
    Panel67: TPanel;
    CellStatus1: TPanel;
    CellStatus2: TPanel;
    CellStatus4: TPanel;
    CellStatus6: TPanel;
    CellStatus8: TPanel;
    CellStatus5: TPanel;
    CellStatus7: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    QrySearch: TADOQuery;
    shpB: TShape;
    shpR: TShape;
    Panel22: TPanel;
    Panel24: TPanel;
    dgCell: TDBGridEh;
    CellStatus9: TPanel;
    Panel25: TPanel;
    shpStatus9: TShape;
    CellStatus3: TPanel;
    Panel20: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel23: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    cbBank: TComboBox;
    cbBay: TComboBox;
    cbLevel: TComboBox;
    cbSTATUS: TComboBox;
    dITEM_LOT: TEdit;
    cbIn_USE: TCheckBox;
    cbOT_USE: TCheckBox;
    btnSave: TButton;
    dtNOW_IN_DATE: TDateTimePicker;
    dtNOW_IN_TIME: TDateTimePicker;
    Panel3: TPanel;
    dITEM_INFO_01: TEdit;
    Panel4: TPanel;
    dITEM_INFO_03: TEdit;
    Panel28: TPanel;
    Panel29: TPanel;
    dITEM_INFO_02: TEdit;
    Panel33: TPanel;
    Panel8: TPanel;
    sbt_ITEM: TSpeedButton;
    qryUpdate: TADOQuery;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    cbFrBank: TComboBox;
    cbFrBay: TComboBox;
    cbFrLevel: TComboBox;
    Panel21: TPanel;
    cbToBank: TComboBox;
    cbToBay: TComboBox;
    cbToLevel: TComboBox;
    btnMove: TButton;
    chkMove: TCheckBox;
    qryRackMove: TADOQuery;
    qryTemp: TADOQuery;
    dITEM_QTY: TEdit;
    dITEM_INFO_04: TEdit;
    Panel34: TPanel;
    dITEM_WEIGHT: TEdit;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PnlRackBase: TPanel;
    PnlSCLine: TPanel;
    PnlSCBase: TPanel;
    Shape1: TShape;
    ShpSCLine: TShape;
    Panel2: TPanel;
    dtPRDCT_DATE: TDateTimePicker;
    dtPRDCT_TIME: TDateTimePicker;
    Panel38: TPanel;
    Panel40: TPanel;
    dITEM_INFO_06: TEdit;
    Panel42: TPanel;
    dITEM_INFO_08: TEdit;
    Panel32: TPanel;
    SpeedButton1: TSpeedButton;
    dITEM_INFO_07: TEdit;
    cbITEM_TYPE: TComboBox;
    cbITEM_INFO_10: TComboBox;
    Panel39: TPanel;
    cbWRAP_YN: TComboBox;
    SP_AUTO_INDEX: TADOStoredProc;
    CellStatus10: TPanel;
    Panel43: TPanel;
    CellStatus11: TPanel;
    Panel44: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrQryTimer(Sender: TObject);
    procedure CellPanelDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure chkMoveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fnCommandStart;
    procedure fnCommandAdd  ;
    procedure fnCommandExcel;
    procedure fnCommandDelete;
    procedure fnCommandPrint;
    procedure fnCommandQuery;
    procedure fnCommandClose;
    procedure fnWmMsgRecv (var MSG : TMessage) ; message WM_USER ;
    function  fnCellCreate : Boolean ;
    procedure SetColorStatus(ID_CODE, STATUS, ITEM_LOT, ITEM_TYPE, ITEM_CODE, IN_USE, OT_USE, ResultType : String );
    function  fnOrderDataInsert(OrderData: TTORDER): Boolean;
    procedure SCPositionDisplay;
    procedure ItemInfoClear;
  end;
  procedure U410Create();

const
  FormNo = '410' ;

  vHogi  = 3;
  vBank  = 2;
  vBay   = 12;
  vLevel = 8;
var
  frmU410: TfrmU410;
  SrtFlag : integer = 0 ;

  BankPanel  : array [1..vBank] of TPanel;
  CellPanel  : array [1..vBank, 0..vBay, 0..vLevel] of TPanel;
  CellShape  : array [1..vBank, 0..vBay, 0..vLevel] of TShape;
  CellLabel  : array [1..vBank, 0..vBay, 0..vLevel] of TLabel;
  CellLabel2 : array [1..vBank, 0..vBay, 0..vLevel] of TLabel;
  CellLabel3 : array [1..vBank, 0..vBay, 0..vLevel] of TLabel;

  SelectHogi : integer;
  SelectCell : String;
  MoveSet : Integer;
implementation

uses Main, ItemSearch;

{$R *.dfm}

//==============================================================================
// U410Create
//==============================================================================
procedure U410Create();
begin
  if not Assigned( frmU410 ) then
  begin
    frmU410 := TfrmU410.Create(Application);
    with frmU410 do
    begin
      fnCommandStart;
    end;
  end;
  frmU410.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU410.fnWmMsgRecv(var MSG: TMessage);
begin
  case MSG.WParam of
    MSG_MDI_WIN_ADD     : begin fnCommandAdd     ; end;
    MSG_MDI_WIN_EXCEL   : begin fnCommandExcel   ; end;
    MSG_MDI_WIN_DELETE  : begin fnCommandDelete  ; end;
    MSG_MDI_WIN_PRINT   : begin fnCommandPrint   ; end;
    MSG_MDI_WIN_QUERY   : begin fnCommandQuery   ; end;
    MSG_MDI_WIN_CLOSE   : begin fnCommandClose   ; Close; end;
  end;
end;

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmU410.FormCreate(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
  SelectHogi := 1;
  SelectCell := '';
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU410.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU410.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  fnWmMsgSend( 22221, 111 );
  fnCommandQuery;
  if not tmrQry.Enabled then tmrQry.Enabled := True;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU410.FormDeactivate(Sender: TObject);
var
  i : integer ;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i] is TTimer) then
       (Self.Components[i] as TTimer).Enabled := False ;
    if (Self.Components[i] is TADOQuery) then
       (Self.Components[i] as TADOQuery).Active := False ;
  end;
end;

//==============================================================================
// FormKeyPress
//==============================================================================
procedure TfrmU410.FormKeyPress(Sender: TObject; var Key: Char);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU410.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer ;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i] is TTimer) then
       (Self.Components[i] as TTimer).Enabled := False ;
    if (Self.Components[i] is TADOQuery) then
       (Self.Components[i] as TADOQuery).Active := False ;
  end;

  Action := Cafree;
  try frmU410 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU410.fnCommandStart;
begin
  fnCellCreate;
  dtPRDCT_DATE.Date  := Now;   // 생산일자
  dtPRDCT_TIME.Time  := Now;   // 생산일시
  dtNOW_IN_DATE.Date := Now;   // 입고일자
  dtNOW_IN_TIME.Time := Now;   // 입고일시
  fnCommandQuery;
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU410.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU410.fnCommandExcel;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU410.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU410.fnCommandPrint;
begin
//
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU410.fnCommandQuery;
var
  StrSQL, WhereSQL : String;
begin
  //============================
  // 셀 상태 표시 쿼리
  //============================
  try
    if      SelectHogi = 1 then WhereSQL := ' WHERE R.RACK_BANK in (''01'', ''02'') '
    else if SelectHogi = 2 then WhereSQL := ' WHERE R.RACK_BANK in (''03'', ''04'') '
    else if SelectHogi = 3 then WhereSQL := ' WHERE R.RACK_BANK in (''05'', ''06'') ' ;


    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT R.RACK_HOGI, R.RACK_LOC, R.IN_USED, R.OT_USED, S.ITEM_LOT, S.ITEM_TYPE, ' +
                '        S.ITEM_INFO_01, S.ITEM_INFO_02, S.ITEM_INFO_03, S.ITEM_INFO_04, S.ITEM_INFO_10, ' +
                '        (CASE WHEN R.ERR_STAT = ''이중입고'' THEN ''이중입고'' ' +
                '              WHEN R.ERR_STAT = ''공출고''   THEN ''공출고''   ' +
                '              ELSE (CASE WHEN R.IN_USED <> ''Y'' OR R.OT_USED <> ''Y'' THEN ''금지'' ' +
                '                         ELSE (CASE WHEN R.ORDER_STAT = ''입고중'' THEN ''입고중'' ' +
                '                                    WHEN R.ORDER_STAT = ''출고중'' THEN ''출고중'' ' +
                '                                    ELSE (CASE WHEN R.RACK_STAT = ''빈랙''   THEN ''빈랙'' ' +
                '                                               WHEN R.RACK_STAT = ''재고''   THEN ''재고'' ' +
                '                                               WHEN R.RACK_STAT = ''파레트'' THEN ''파레트'' END) END) END) END) as RACK_STATUS ' +
                '   FROM TT_RACK R WITH (NOLOCK)' +
                '   LEFT OUTER JOIN TT_RACK_STOCK S WITH (NOLOCK) ' +
                '    ON R.RACK_LOC = S.RACK_LOC ' + WhereSQL +
                ' ORDER BY R.RACK_BANK ';
      SQL.Text := StrSql ;
      Open;
      First;

      while not(Eof) do
      begin
        if FieldByName('RACK_HOGI').AsString = '0' then Next;
        SetColorStatus ( FieldByName('RACK_LOC'    ).AsString,   // 랙 위치
                         FieldByName('RACK_STATUS' ).AsString,   // 랙 상태
                         FieldByName('ITEM_LOT'    ).AsString,   // 제품번호
                         FieldByName('ITEM_TYPE'   ).AsString,   // 제품여부(제품, 반제품)
                         FieldByName('ITEM_INFO_01').AsString,   // 제품코드
                         FieldByName('IN_USED'     ).AsString,   // 입고가능여부
                         FieldByName('OT_USED'     ).AsString,   // 출고가능여부
                         FieldByName('ITEM_INFO_10').AsString ); // 판정결과
        Next ;
      end;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[410] 랙 상태 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;

  //============================
  // 셀 사용 현황 쿼리
  //============================
  try
    with qryCell do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT 1 AS SC_HOGI, SUM(TOTAL) AS TOTAL, SUM(CNT1) AS CNT1, SUM(CNT2) AS CNT2, SUM(CNT3) AS CNT3, SUM(CNT4) AS CNT4, SUM(CNT5) AS CNT5 ' +
                '   FROM ' +
                '   (SELECT 1 AS TOTAL, ' +
                '           (CASE WHEN RACK_STAT = ''빈랙'' THEN 1 ELSE 0 END) AS CNT1, ' +
                '           (CASE WHEN RACK_STAT = ''재고'' THEN 1 ELSE 0 END) AS CNT2, ' +
                '           (CASE WHEN RACK_STAT = ''파레트'' THEN 1 ELSE 0 END) AS CNT3, ' +
                '           (CASE WHEN IN_USED = ''N'' THEN 1 ELSE 0 END) AS CNT4, ' +
                '           (CASE WHEN OT_USED = ''N'' THEN 1 ELSE 0 END) AS CNT5  ' +
                '      FROM TT_RACK WITH (NOLOCK) ' +
                '     WHERE RACK_HOGI = ''1'') AS TABLE1 ' +
                ' UNION ' +
                ' SELECT 2 AS SC_HOGI, SUM(TOTAL) AS TOTAL, SUM(CNT1) AS CNT1, SUM(CNT2) AS CNT2, SUM(CNT3) AS CNT3, SUM(CNT4) AS CNT4, SUM(CNT5) AS CNT5 ' +
                '   FROM ' +
                '   (SELECT 1 AS TOTAL, ' +
                '           (CASE WHEN RACK_STAT = ''빈랙'' THEN 1 ELSE 0 END) AS CNT1, ' +
                '           (CASE WHEN RACK_STAT = ''재고'' THEN 1 ELSE 0 END) AS CNT2, ' +
                '           (CASE WHEN RACK_STAT = ''파레트'' THEN 1 ELSE 0 END) AS CNT3, ' +
                '           (CASE WHEN IN_USED = ''N'' THEN 1 ELSE 0 END) AS CNT4, ' +
                '           (CASE WHEN OT_USED = ''N'' THEN 1 ELSE 0 END) AS CNT5  ' +
                '      FROM TT_RACK WITH (NOLOCK) ' +
                '     WHERE RACK_HOGI = ''2'') AS TABLE2 ' +
                '  UNION ' +
                ' SELECT 3 AS SC_HOGI, SUM(TOTAL) AS TOTAL, SUM(CNT1) AS CNT1, SUM(CNT2) AS CNT2, SUM(CNT3) AS CNT3, SUM(CNT4) AS CNT4, SUM(CNT5) AS CNT5 ' +
                '   FROM ' +
                '   (SELECT 1 AS TOTAL, ' +
                '           (CASE WHEN RACK_STAT = ''빈랙'' THEN 1 ELSE 0 END) AS CNT1, ' +
                '           (CASE WHEN RACK_STAT = ''재고'' THEN 1 ELSE 0 END) AS CNT2, ' +
                '           (CASE WHEN RACK_STAT = ''파레트'' THEN 1 ELSE 0 END) AS CNT3, ' +
                '           (CASE WHEN IN_USED = ''N'' THEN 1 ELSE 0 END) AS CNT4, ' +
                '           (CASE WHEN OT_USED = ''N'' THEN 1 ELSE 0 END) AS CNT5  ' +
                '      FROM TT_RACK WITH (NOLOCK) ' +
                '     WHERE RACK_HOGI = ''3'') AS TABLE3 ';
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryCell.Close;
      TraceLogWrite('[410] 랙 현황 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose
//==============================================================================
procedure TfrmU410.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// fnCellCreate
//==============================================================================
function TfrmU410.fnCellCreate : Boolean ;
  //----------------------------------------------------------------------------
  function fnCreateBank(Bank: integer) : Boolean;
    //--------------------------------------------------------------------------
    function fnCreateCell(Bank: integer) : Boolean;
    var
      i, j, k : integer ;
      aBank, bBank, TmpWidth : Integer;
    begin
      for i := 0 to vBay do
      begin
        for j := 0 to vLevel do
        begin
          CellPanel[Bank][i][j] := TPanel.Create(Self);
          with CellPanel[Bank][i][j] do
          begin
            Parent      := TPanel(Self.FindComponent('BankPnl'+IntToStr(Bank))) ;
            Align       := alNone ;
            AutoSize    := False ;
            BevelInner  := bvNone;
            BevelOuter  := bvRaised;

            ShowHint := True ;
            ParentBackground := False;
            ParentColor      := False;
            ParentFont       := False;
            ParentShowHint   := False;
            ParentCustomHint := False;

            Name    := 'Cell'+FormatFloat('00', Bank)+FormatFloat('00',i)+FormatFloat('00',j);
            Caption := '';
            Hint    := 'Cell'+FormatFloat('00', Bank)+FormatFloat('00',i)+FormatFloat('00',j);

            if i = 0 then
            begin
              if Bank = 1 then
              begin
                if frmMain.MdiChildCount = 1 then
                begin
                  Width := ((BankPanel[1].Width Div (vBay+1)) + ((BankPanel[1].Width - ((BankPanel[1].Width Div (vBay+1)) * (vBay+1)))))-4;
                end else
                begin
                  Width := ((BankPanel[1].Width Div (vBay+1)) + ((BankPanel[1].Width - ((BankPanel[1].Width Div (vBay+1)) * (vBay+1)))))-8;
                end;
              end else
                Width := ((BankPanel[1].Width Div (vBay+1)) + ((BankPanel[1].Width - ((BankPanel[1].Width Div (vBay+1)) * (vBay+1)))))-8;
              Left := 4;
            end else
            begin
              Width := (BankPanel[1].Width Div (vBay+1));
              Left := CellPanel[Bank][i-1][j].Left + CellPanel[Bank][i-1][j].Width ;
            end;

            Height := (BankPanel[1].Height - 6) Div (vLevel+1);
            Top := ((BankPanel[1].Height) - ((BankPanel[1].Height - 6) Div (vLevel+1)) * (j+1)) - ((BankPanel[1].Height - (Height * (vLevel+1))) Div 2);

            Font.Charset := DEFAULT_CHARSET ;
            Font.Name := '나눔고딕';

            if (i=0) or (j=0) then
            begin
              Color := $00CECECE;
              Font.Size  := 10 ;
              Font.Color := $004D4D4D ;
              Font.Style := [] ;
              if i=0 then Caption := IntToStr(j);
              if j=0 then Caption := IntToStr(i);

              if (i=0) and (j=0) then
              begin
                Caption := IntToStr(Bank)+' 열'
              end;
            end else
            begin
              Color := $00E8E8E8 ;
              Font.Size  := 10 ;
              Font.Color := $004D4D4D ;
              Font.Style := [] ;
              OnClick := CellPanelDblClick;
            end;
          end;

          CellShape[Bank][i][j] := TShape.Create(Self);
          with CellShape[Bank][i][j] do
          begin
            Parent := CellPanel[Bank][i][j];
            Align       := alClient;
            AutoSize    := False ;
            Brush.Style := bsClear;
            Pen.Width := 2;
            Shape := stRectangle;

            ShowHint := True;
            ParentBackground := False;
            ParentColor      := False;
            ParentFont       := False;
            ParentShowHint   := False;
            ParentCustomHint := False;
            Name        := 'CellShape'+FormatFloat('00',Bank)+FormatFloat('00',i)+FormatFloat('00',j);
            Hint        := 'Cell'+FormatFloat('00',Bank)+FormatFloat('00',i)+FormatFloat('00',j);
            Visible := False;

            CellLabel[Bank][i][j] := TLabel.Create(Self);
            with CellLabel[Bank][i][j] do
            begin
              Parent      := CellPanel[Bank][i][j] ;
              Name        := 'CellLabel'+FormatFloat('00',Bank)+FormatFloat('00',i)+FormatFloat('00',j);
              Hint        := 'Cell'+FormatFloat('00',Bank)+FormatFloat('00',i)+FormatFloat('00',j);
              Align       := alClient;
              AutoSize    := False;
              WordWrap    := True;
              Caption     := '';
              Alignment   := taCenter;
              LayOut      := tlCenter;
              Transparent := True;
              OnClick     := CellPanelDblClick;
              Font.Size   := 9;
              Font.Name   := '돋움';
              Font.Color  := clBlack;
//              Font.Style  := [fsBold];
              BringToFront;
            end;

            if (i <> 0) and (j <> 0) then
            begin
              CellLabel2[Bank][i][j] := TLabel.Create(Self);
              with CellLabel2[Bank][i][j] do
              begin
                Parent      := CellPanel[Bank][i][j] ;
                Name        := 'CellLabe2'+FormatFloat('00',Bank)+FormatFloat('00',i)+FormatFloat('00',j);
                Hint        := 'Cell'+FormatFloat('00',Bank)+FormatFloat('00',i)+FormatFloat('00',j);
                Align       := alNone;
                AutoSize    := False;
                WordWrap    := True;
                Caption     := '';
                Alignment   := taCenter;
                LayOut      := tlCenter;
                Transparent := True;
                Width       := 15;
                Height      := 15;
                Top         := 0;
                Font.Size   := 7;
                Font.Name   := '돋움';
                Font.Color  := clWhite;
                Left        := CellPanel[Bank][i][j].Width - 15;
                OnClick     := CellPanelDblClick;
                BringToFront;
              end;
            end;

            CellLabel3[Bank][i][j] := TLabel.Create(Self);
            with CellLabel3[Bank][i][j] do
            begin
              Parent      := CellPanel[Bank][i][j] ;
              Name        := 'CellLabe3'+FormatFloat('00',Bank)+FormatFloat('00',i)+FormatFloat('00',j);
              Hint        := 'Cell'+FormatFloat('00',Bank)+FormatFloat('00',i)+FormatFloat('00',j);
              Align       := alClient;
              AutoSize    := False;
              WordWrap    := True;
              Caption     := '';
              Alignment   := taCenter;
              LayOut      := tlCenter;
              Transparent := False;
              Visible     := False;
            end;
          end;
        end;
      end;
    end;
  var
    i : integer ;
  begin
    BankPanel[Bank] := TPanel.Create(Self);
    with BankPanel[Bank] do
    begin
      Parent           := PnlRackBase;
      ParentBackground := False;
      ParentColor      := False;
      ParentFont       := False;
      ParentShowHint   := False;
      ParentCustomHint := False;

      Name := 'BankPnl'+IntToStr(Bank) ;
      if Bank = 1 then
      begin
        Height := (PnlRackBase.Height div 2) - 16 ;
        Align  := alTop;
        Color  := $00E1E1E1;
      end else
      begin
        Height := BankPanel[1].Height ;
        Align  := alBottom;
        Color  := $00E1E1E1;
      end;
      Caption    := 'BankPnl'+IntToStr(Bank) + ' ' + IntToStr(Height) ;
      AutoSize   := False ;
      BevelInner := bvNone;
      BevelOuter := bvLowered;

      Visible := False ; Application.ProcessMessages;
      fnCreateCell(Bank) ;
      Visible := True  ; Application.ProcessMessages;
      if Bank = 2 then
      begin
        PnlSCLine.Visible := True;

        PnlSCBase.Align  := alNone;
        PnlSCBase.Width  := CellPanel[1][0][0].Width + 2;
        PnlSCBase.Left   := 3;
        PnlSCBase.Height := PnlSCLine.Height ;
        PnlSCBase.Top    := 0;

        ShpSCLine.Align  := alNone;
        ShpSCLine.Width  := PnlSCLine.Width - 10;
        ShpSCLine.Left   := (PnlSCLine.Width - ShpSCLine.Width) div 2;
        ShpSCLine.Height := 5;
        ShpSCLine.Top    := (PnlSCLine.Height - ShpSCLine.Height) div 2;
      end;
    end;
  end;
var
  i : integer ;
begin
  try
    PnlSCLine.Visible := False;
    for i := 1 to vBank do
    begin
      fnCreateBank(i) ;
      Application.ProcessMessages;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[410] 랙 생성 - 에러['+E.Message+'], 순번['+IntToStr(i)+']');
    end;
  end;
end;

//==============================================================================
// tmrQryTimer
//==============================================================================
procedure TfrmU410.tmrQryTimer(Sender: TObject);
begin
  try
    tmrQry.Enabled := False ;
    fnCommandQuery ;
    SCPositionDisplay;
  finally
    tmrQry.Enabled := True ;
  end;
end;

//==============================================================================
// SetColorStatus
//==============================================================================
procedure TfrmU410.SetColorStatus(ID_CODE, STATUS, ITEM_LOT, ITEM_TYPE, ITEM_CODE, IN_USE, OT_USE, ResultType : String );
var
  IdHogi,  IdBnk , IdBay , IdLvl : Integer;
  TmpCell : TPanel;
  TmpLabel, TmpLabel2, TmpLabel3 : TLabel;
begin
  try
    IdBnk := StrToInt(Copy(Id_Code, 1, 2)) - (PageControl.ActivePageIndex * 2)  ;
    IdBay := StrToInt(Copy(Id_Code, 3, 2)) ;
    IdLvl := StrToInt(Copy(Id_Code, 5, 2)) ;
    TmpCell  := TPanel(Self.FindComponent('Cell'+FormatFloat('00',IdBnk)+FormatFloat('00',IdBay)+FormatFloat('00',IdLvl))) ;
    TmpLabel := TLabel(Self.FindComponent('CellLabel'+FormatFloat('00',IdBnk)+FormatFloat('00',IdBay)+FormatFloat('00',IdLvl))) ;
    TmpLabel2:= TLabel(Self.FindComponent('CellLabe2'+FormatFloat('00',IdBnk)+FormatFloat('00',IdBay)+FormatFloat('00',IdLvl))) ;
    TmpLabel3:= TLabel(Self.FindComponent('CellLabe3'+FormatFloat('00',IdBnk)+FormatFloat('00',IdBay)+FormatFloat('00',IdLvl))) ;
    TmpCell.Caption   := '';
    TmpLabel3.Caption := ITEM_CODE;

    if Length(ITEM_LOT) > 21 then
    begin
      TmpLabel.Caption := Copy(ITEM_LOT, 1, 10) + ' ' + Copy(ITEM_LOT, 11, 11) + ' ' + Copy(ITEM_LOT, 22, Length(ITEM_LOT) - 21)  ;
    end else
    if Length(ITEM_LOT) > 10 then
    begin
      TmpLabel.Caption := Copy(ITEM_LOT, 1, 10) + ' ' + Copy(ITEM_LOT, 11, Length(ITEM_LOT) - 10)  ;
    end else
    begin
      TmpLabel.Caption := ITEM_LOT;
    end;

    if ResultType = 'A' then
    begin
      TmpLabel2.Caption := 'A'
    end else
    if ResultType = 'F' then
    begin
      TmpLabel2.Caption := 'F'
    end else
    begin
      TmpLabel2.Caption := '';
    end;                              // and (STATUS <> '입고중')

    if      (TmpLabel.Caption <> '' ) and (STATUS = '입고중' ) then TmpLabel.Font.Color := clBlack
    else if (TmpLabel.Caption <> '' ) and (STATUS = '재고'   ) and (ResultType = '') then TmpLabel.Font.Color := clBlack
    else if (TmpLabel.Caption <> '' ) then TmpLabel.Font.Color := clWhite;

    if      (TmpLabel2.Caption <> '' ) and (STATUS = '입고중' ) then TmpLabel2.Font.Color := clBlack
    else if (TmpLabel2.Caption <> '' ) and (STATUS = '재고'   ) and (ResultType = '') then TmpLabel2.Font.Color := clBlack
    else if (TmpLabel2.Caption <> '' ) then TmpLabel2.Font.Color := clWhite;

    if ( TmpCell <> nil ) then
    begin
      if      (STATUS = '금지'    ) then TmpCell.Color := CellStatus8.Color  // 금지셀
      else if (STATUS = '빈랙'    ) then TmpCell.Color := CellStatus1.Color  // 빈랙
      else if (STATUS = '재고'    ) then
      begin
        if      (ResultType = 'A') and (ITEM_TYPE = '제품') then
                                        TmpCell.Color := CellStatus2.Color   // 합격-제품
        else if (ResultType = 'A') then TmpCell.Color := CellStatus3.Color   // 합격-반제품
        else if (ResultType = 'F') then TmpCell.Color := CellStatus10.Color  // 불합격
        else                            TmpCell.Color := CellStatus11.Color; // 검사중
      end
      else if (STATUS = '입고중'  ) then TmpCell.Color := CellStatus4.Color  // 입고중
      else if (STATUS = '출고중'  ) then TmpCell.Color := CellStatus5.Color  // 출고중
      else if (STATUS = '이중입고') then TmpCell.Color := CellStatus6.Color  // 이중입고
      else if (STATUS = '공출고'  ) then TmpCell.Color := CellStatus7.Color; // 공출고

      if      (STATUS = '입고중') then TmpCell.Font.Color := clBlack
      else if (STATUS = '재고'  ) and
              (ResultType = ''  ) then TmpCell.Font.Color := clBlack  // 검사중 재고
      else                             TmpCell.Font.Color := clWhite;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[410] 랙 표시 - 에러['+E.Message+'], 위치['+ID_CODE+'], 제품번호['+ITEM_LOT+']');
    end;
  end;
end;

//==============================================================================
// CellPanelDblClick
//==============================================================================
procedure TfrmU410.CellPanelDblClick(Sender: TObject);
var
  ID_CODE, ID_BANK, ID_BAY, ID_LEVEL, CELL_CODE, StrSQL : String ;
  i, j, k, TMP_BANK, TMP_BAY, TMP_LEVEL, iBank, iBay, iLevel : Integer;
  tmpPanel : TPanel;
  tmpLabel : TLabel;
begin
  if ( Sender is TPanel ) then
  begin
    TMP_BANK  := StrToInt(Copy((Sender as TPanel).Name, 5, 2)) + (PageControl.ActivePageIndex * 2);
    ID_CODE   := FormatFloat('00', TMP_BANK) + Copy((Sender as TPanel).Name, 7, 4);
    CELL_CODE := Copy((Sender as TPanel).Name,  5, 6);
  end else
  if ( Sender is TLabel ) then
  begin
    TMP_BANK  := StrToInt(Copy((Sender as TLabel).Name, 10, 2)) + (PageControl.ActivePageIndex * 2);
    ID_CODE   := FormatFloat('00', TMP_BANK) + Copy((Sender as TLabel).Name, 12, 4);
    CELL_CODE := Copy((Sender as TLabel).Name, 10, 6);
  end;

  if (Copy(ID_CODE, 3, 2) = '00') or (Copy(ID_CODE, 5, 2) = '00') then Exit;

  if (SelectCell <> '') and
     (SelectCell <> CELL_CODE) then
  begin
    TPanel(Self.FindComponent('CELL'+SelectCell)).BevelOuter := bvRaised;
    TPanel(Self.FindComponent('CELL'+SelectCell)).BevelWidth := 1;
  end;

  if SelectCell <> CELL_CODE then SelectCell := CELL_CODE;

  if TPanel(Self.FindComponent('CELL'+CELL_CODE)).BevelOuter = bvLowered then
  begin
    TPanel(Self.FindComponent('CELL'+CELL_CODE)).BevelOuter := bvRaised;
    TPanel(Self.FindComponent('CELL'+CELL_CODE)).BevelWidth := 1;
  end else
  begin
    TPanel(Self.FindComponent('CELL'+CELL_CODE)).BevelOuter := bvLowered;
    TPanel(Self.FindComponent('CELL'+CELL_CODE)).BevelWidth := 3;
  end;

  ID_BANK  := Copy(ID_CODE, 1, 2) ;
  ID_BAY   := Copy(ID_CODE, 3, 2) ;
  ID_LEVEL := Copy(ID_CODE, 5, 2) ;

  //==========================
  // 디스플레이 데이터 초기화
  //==========================
  ItemInfoClear;

  //===========================
  // 품목정보 표시
  //===========================
  try
    with qrySearch do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT R.ERR_STAT, R.ORDER_STAT, R.RACK_STAT, R.IN_USED, R.OT_USED, S.*, ' +
                '        CASE WHEN S.ITEM_WEIGHT = '''' or S.ITEM_WEIGHT = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '             ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(S.ITEM_WEIGHT))) END as tITEM_WEIGHT ' +
                '   FROM TT_RACK R WITH (NOLOCK) ' +
                '   LEFT OUTER JOIN TT_RACK_STOCK S WITH (NOLOCK)' +
                '     ON R.RACK_LOC = S. RACK_LOC ' +
                '  WHERE R.RACK_LOC = ' + QuotedStr(ID_CODE);
      SQL.Text := StrSQL;
      Open;

      //===========================================
      // 랙 위치
      //===========================================
      cbBank.Text  := ID_BANK;
      cbBay.Text   := ID_BAY;
      cbLevel.Text := ID_LEVEL;

      //===========================================
      // 랙 상태 ( 에러 -> 작업 -> 상태 )
      //===========================================
      if FieldByName('ERR_STAT').AsString <> '없음' then
      begin // 이중입고 or 공출고
        cbSTATUS.Text := FieldByName('ERR_STAT').AsString;
      end else
      if FieldByName('ORDER_STAT').AsString <> '없음' then
      begin // 입고중 or 출고중
        cbSTATUS.Text := FieldByName('ORDER_STAT').AsString;
      end else
      begin // 빈랙 or 재고
        cbSTATUS.Text := FieldByName('RACK_STAT').AsString;
      end;

      //===========================================
      // 입출고 금지상태
      //===========================================
      if (FieldByName('IN_USED').AsString <> 'Y') then
           cbIn_USE.Checked := True
      else cbIn_USE.Checked := False;

      if (FieldByName('OT_USED').AsString <> 'Y') then
           cbOt_USE.Checked := True
      else cbOt_USE.Checked := False;

      //======================
      // 품목정보
      //======================
      dITEM_LOT.Text      := FieldByName('ITEM_LOT'    ).AsString;     // 제품번호
      dITEM_INFO_01.Text  := FieldByName('ITEM_INFO_01').AsString;     // 반제품코드
      dITEM_INFO_02.Text  := FieldByName('ITEM_INFO_02').AsString;     // 반제품명
      dITEM_INFO_03.Text  := FieldByName('ITEM_INFO_03').AsString;     // 제품코드
      dITEM_INFO_04.Text  := FieldByName('ITEM_INFO_04').AsString;     // 제품명
      dITEM_QTY.Text      := FieldByName('ITEM_QTY'    ).AsString;     // 수량
      dITEM_WEIGHT.Text   := FieldByName('tITEM_WEIGHT').AsString;     // 중량
      cbITEM_TYPE.Text    := FieldByName('ITEM_TYPE'   ).AsString;     // 제품여부
      dITEM_INFO_06.Text  := FieldByName('ITEM_INFO_06').AsString;     // 고객코드
      dITEM_INFO_07.Text  := FieldByName('ITEM_INFO_07').AsString;     // 고객명
      dITEM_INFO_08.Text  := FieldByName('ITEM_INFO_08').AsString;     // 주문번호

      // 판정결과
      if      FieldByName('ITEM_INFO_10').AsString = 'A' then cbITEM_INFO_10.Text := '합격[A]'
      else if FieldByName('ITEM_INFO_10').AsString = 'F' then cbITEM_INFO_10.Text := '불합격[F]'
      else
      begin
        if cbSTATUS.Text = '빈랙' then
             cbITEM_INFO_10.Text := ''
        else cbITEM_INFO_10.Text := '검사중';
      end;

      cbWRAP_YN.Text      := FieldByName('WRAP_YN'     ).AsString;     // 랩핑여부

      if (Trim(FieldByName('ITEM_INFO_05').AsString) <> '') and
         (Length(Trim(FieldByName('ITEM_INFO_05').AsString)) = 14 ) then
      begin
        dtPRDCT_DATE.Date  := StrToDate(Copy(FieldByName('ITEM_INFO_05').AsString,  1, 4) + '-' +
                                        Copy(FieldByName('ITEM_INFO_05').AsString,  5, 2) + '-' +
                                        Copy(FieldByName('ITEM_INFO_05').AsString,  7, 2)); // 생산일자

        dtPRDCT_TIME.Time  := StrToTime(Copy(FieldByName('ITEM_INFO_05').AsString,  9, 2) + ':' +
                                        Copy(FieldByName('ITEM_INFO_05').AsString, 11, 2) + ':' +
                                        Copy(FieldByName('ITEM_INFO_05').AsString, 13, 2)); // 생산일시
      end;

      if Trim(FieldByName('IN_DATE').AsString) <> '' then
      begin
        dtNOW_IN_DATE.Date := FieldByName('IN_DATE').AsDateTime;      // 입고일자
        dtNOW_IN_TIME.Time := FieldByName('IN_DATE').AsDateTime;      // 입고일시
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qrySearch.Close;
      TraceLogWrite('[410] 랙 클릭 - 에러['+E.Message+'], 위치['+ID_CODE+'], 쿼리['+StrSQL+']');
    end;
  end;

  //===========================
  // 동일품목의 랙 표시
  //===========================
  try
    iBank  := StrToInt(ID_BANK) - (PageControl.ActivePageIndex * 2);
    iBay   := StrToInt(ID_BAY);
    iLEVEL := StrToInt(ID_LEVEL);
    for i := 1 to vBank do
    begin
      for j := 1 to vBay do
      begin
        for k := 1 to vLevel do
        begin
          tmpPanel := TPanel(Self.FindComponent('Cell'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k)));
          tmpLabel := TLabel(Self.FindComponent('CellLabe3'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k)));
          if ((i=iBank) and (j=iBay) and (k=iLevel)) then // 클릭한 패널인 경우
          begin
            TShape(Self.FindComponent('CellShape'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k))).Pen.Color := tmpPanel.Color;
            TShape(Self.FindComponent('CellShape'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k))).Visible := False;
          end else
          if (TPanel(Self.FindComponent('CELL'+FormatFloat('00',iBank)+FormatFloat('00',iBay)+FormatFloat('00',iLEVEL))).BevelOuter = bvLowered) and
             (tmpLabel.Caption = dITEM_INFO_01.Text) and (tmpLabel.Caption <> '') then // 빈랙이 동일 제품으로 표시되지 않도록
          begin
            TShape(Self.FindComponent('CellShape'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k))).Pen.Color := shpStatus9.Pen.Color;
            TShape(Self.FindComponent('CellShape'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k))).Visible := True;
          end else
          begin
            TShape(Self.FindComponent('CellShape'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k))).Pen.Color := tmpPanel.Color;
            TShape(Self.FindComponent('CellShape'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k))).Visible := False;
          end;
        end;
      end;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[410] 랙 클릭(동일품목) - 에러['+E.Message+'], 위치['+ID_BANK+ID_BAY+ID_LEVEL+']');
    end;
  end;

  //===============================================
  // 이동지시 관련(선택시 이동위치 표시)
  //===============================================
  if (chkMove.Checked) and (MoveSet = 0) then
  begin
    cbFrBank.Text  := ID_BANK;
    cbFrBay.Text   := ID_BAY;
    cbFrLevel.Text := ID_LEVEL;
    Inc(MoveSet);
  end else
  if (chkMove.Checked) and (MoveSet <> 0) then
  begin
    cbToBank.Text  := ID_BANK;
    cbToBay.Text   := ID_BAY;
    cbToLevel.Text := ID_LEVEL;
    MoveSet := 0;
  end;
end;

//==============================================================================
// btnSaveClick
//==============================================================================
procedure TfrmU410.btnMoveClick(Sender: TObject);
var
  StrSQL, StrRc, SC_HOGI : String;
  OrderData : TTORDER;
  FrRackLoc, ToRackLoc, CheckBank : String;
  FrRackLocDesc, ToRackLocDesc : String;
begin
  try
    FrRackLoc := cbFrBank.Text + cbFrBay.Text + cbFrLevel.Text;
    ToRackLoc := cbToBank.Text + cbToBay.Text + cbToLevel.Text;
    FrRackLocDesc := cbFrBank.Text + '-' + cbFrBay.Text + '-' + cbFrLevel.Text;
    ToRackLocDesc := cbToBank.Text + '-' + cbToBay.Text + '-' + cbToLevel.Text;
    SC_HOGI := IntToStr(PageControl.ActivePageIndex + 1);

    //======================================
    // 이동위치 값 체크
    //======================================
    if (Length(FrRackLoc) <> 6) or
       (Length(ToRackLoc) <> 6) then
    begin
      MessageDlg(' 이동작업 할 위치를 확인해 주십시오', mtConfirmation, [mbOk], 0);
      cbFrBank.SetFocus;
      Exit;
    end;

    //======================================
    // 출고위치 체크
    //======================================
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT R.RACK_STAT, R.ORDER_STAT, R.ERR_STAT, R.OT_USED, ' +
                '        M.OPTION1 ' +
                '   FROM TT_RACK R WITH (NOLOCK), ' +
                '       (SELECT CURRENT_ID, OPTION1 ' +
                '          FROM TC_CURRENT WITH (NOLOCK) ' +
                '         WHERE CURRENT_NAME = ''SC_OT_USE'') M ' +
                '  WHERE R.RACK_HOGI = M.CURRENT_ID ' +
                '    AND R.RACK_LOC  = ''' + FrRackLoc + ''' ' +
                '    AND R.RACK_HOGI = ''' + SC_HOGI   + ''' ' ;
      SQL.Text := StrSQL;
      Open;

      if not (Bof and Eof) then
      begin
        if (FieldByName('RACK_STAT').AsString <> '재고') then
        begin
          MessageDlg(' 이동 출고위치 ['+FrRackLocDesc+']가 재고상태가 아닙니다.', mtConfirmation, [mbOk], 0);
          Close;
          Exit;
        end;

        if (FieldByName('ORDER_STAT').AsString <> '없음') then
        begin
          MessageDlg(' 이동 출고위치 ['+FrRackLocDesc+']가 작업 진행 중입니다.', mtConfirmation, [mbOk], 0);
          Close;
          Exit;
        end;

        if (FieldByName('ERR_STAT').AsString <> '없음') then
        begin
          MessageDlg(' 이동 출고위치 ['+FrRackLocDesc+']가 에러 상태 입니다.', mtConfirmation, [mbOk], 0);
          Close;
          Exit;
        end;

        if (FieldByName('OT_USED').AsString <> 'Y') then
        begin
          MessageDlg(' 이동 출고위치 ['+FrRackLocDesc+']가 출고금지 상태 입니다.', mtConfirmation, [mbOk], 0);
          Close;
          Exit;
        end;

        if (FieldByName('OPTION1').AsBoolean <> True) then
        begin
          MessageDlg(' 스테커크레인 '+SC_HOGI+' 호기는 출고금지 상태 입니다.', mtConfirmation, [mbOk], 0);
          Close;
          Exit;
        end;
      end;
      Close;
    end;

    //======================================
    // 입고위치 체크
    //======================================
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT R.RACK_STAT, R.ORDER_STAT, R.ERR_STAT, R.IN_USED, ' +
                '        M.OPTION1 ' +
                '   FROM TT_RACK R WITH (NOLOCK), ' +
                '       (SELECT CURRENT_ID, OPTION1 ' +
                '          FROM TC_CURRENT WITH (NOLOCK) ' +
                '         WHERE CURRENT_NAME = ''SC_IN_USE'') M ' +
                '  WHERE R.RACK_HOGI = M.CURRENT_ID ' +
                '    AND R.RACK_LOC  = ''' + ToRackLoc + ''' ' +
                '    AND R.RACK_HOGI = ''' + SC_HOGI   + ''' ' ;
      SQL.Text := StrSQL;
      Open;

      if not (Bof and Eof) then
      begin
        if (FieldByName('RACK_STAT').AsString <> '빈랙') then
        begin
          MessageDlg(' 이동 입고위치 ['+ToRackLocDesc+']가 빈랙상태가 아닙니다.', mtConfirmation, [mbOk], 0);
          Close;
          Exit;
        end;

        if (FieldByName('ORDER_STAT').AsString <> '없음') then
        begin
          MessageDlg(' 이동 입고위치 ['+ToRackLocDesc+']가 작업 진행 중입니다.', mtConfirmation, [mbOk], 0);
          Close;
          Exit;
        end;

        if (FieldByName('ERR_STAT').AsString <> '없음') then
        begin
          MessageDlg(' 이동 입고위치 ['+ToRackLocDesc+']가 에러 상태 입니다.', mtConfirmation, [mbOk], 0);
          Close;
          Exit;
        end;

        if (FieldByName('IN_USED').AsString <> 'Y') then
        begin
          MessageDlg(' 이동 입고위치 ['+ToRackLocDesc+']가 입고금지 상태 입니다.', mtConfirmation, [mbOk], 0);
          Close;
          Exit;
        end;

        if (FieldByName('OPTION1').AsBoolean <> True) then
        begin
          MessageDlg(' 스테커크레인 '+SC_HOGI+' 호기는 입고금지 상태 입니다.', mtConfirmation, [mbOk], 0);
          Close;
          Exit;
        end;
      end;
      Close;
    end;


    //===============================================
    // 이동지시 정보 [TT_ORDER]
    //===============================================
    OrderData.ID_DATE   := ' CONVERT(VARCHAR(MAX), GETDATE(), 112) ';
    OrderData.ID_TIME   := ' REPLACE(CONVERT(VARCHAR(MAX), GETDATE(), 108), '':'', '''') ';
    OrderData.ID_TYPE   := '창고이동';
    with SP_AUTO_INDEX do
    begin
      Parameters.ParamByName('@Index').Value := '2';
      ExecProc;
      OrderData.ID_INDEX  := Integer(Parameters.ParamValues['@RETURN_VALUE']);
      OrderData.ID_SUBIDX := 1;
    end;
    OrderData.ID_EMG       := 0 ;
    OrderData.ID_SC        := SC_HOGI;
    OrderData.ID_CODE      := ToRackLoc;
    OrderData.LOAD_BANK    := Copy(FrRackLoc, 1, 2);
    OrderData.LOAD_BAY     := Copy(FrRackLoc, 3, 2);
    OrderData.LOAD_LEVEL   := Copy(FrRackLoc, 5, 2);
    OrderData.UNLOAD_BANK  := Copy(ToRackLoc, 1, 2);
    OrderData.UNLOAD_BAY   := Copy(ToRackLoc, 3, 2);
    OrderData.UNLOAD_LEVEL := Copy(ToRackLoc, 5, 2);

    OrderData.KIND_1       := '';
    OrderData.KIND_2       := '';
    OrderData.KIND_3       := '';
    OrderData.KIND_4       := '';
    OrderData.KIND_5       := '';
    OrderData.NOW_SITE     := '';
    OrderData.NOW_MACH     := 'SC';
    OrderData.BCR_CHK      := 0;
    OrderData.STATUS       := '작업대기';
    OrderData.PROCESS      := '';


    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT * FROM TT_RACK_STOCK WITH (NOLOCK) ' +
                '  WHERE RACK_LOC = ' + QuotedStr(FrRackLoc);
      SQL.Text := StrSQL;
      Open;

      OrderData.IN_SITE      := qryTemp.FieldByName('IN_SITE'    ).AsString;
      OrderData.IN_DATE      := '';
      OrderData.OT_SITE      := '';
      OrderData.OT_DATE      := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';

      OrderData.ITEM_LOT     := qryTemp.FieldByName('ITEM_LOT'    ).AsString;
      OrderData.ITEM_TYPE    := qryTemp.FieldByName('ITEM_TYPE'   ).AsString;
      OrderData.ITEM_WEIGHT  := qryTemp.FieldByName('ITEM_WEIGHT' ).AsString;
      OrderData.ITEM_QTY     := qryTemp.FieldByName('ITEM_QTY'    ).AsString;
      OrderData.ITEM_INFO_01 := qryTemp.FieldByName('ITEM_INFO_01').AsString;
      OrderData.ITEM_INFO_02 := qryTemp.FieldByName('ITEM_INFO_02').AsString;
      OrderData.ITEM_INFO_03 := qryTemp.FieldByName('ITEM_INFO_03').AsString;
      OrderData.ITEM_INFO_04 := qryTemp.FieldByName('ITEM_INFO_04').AsString;
      OrderData.ITEM_INFO_05 := qryTemp.FieldByName('ITEM_INFO_05').AsString;
      OrderData.ITEM_INFO_06 := qryTemp.FieldByName('ITEM_INFO_06').AsString;
      OrderData.ITEM_INFO_07 := qryTemp.FieldByName('ITEM_INFO_07').AsString;
      OrderData.ITEM_INFO_08 := qryTemp.FieldByName('ITEM_INFO_08').AsString;
      OrderData.ITEM_INFO_09 := qryTemp.FieldByName('ITEM_INFO_09').AsString;
      OrderData.ITEM_INFO_10 := qryTemp.FieldByName('ITEM_INFO_10').AsString;
      OrderData.ITEM_INFO_11 := qryTemp.FieldByName('ITEM_INFO_11').AsString;
      OrderData.ITEM_INFO_12 := qryTemp.FieldByName('ITEM_INFO_12').AsString;
      OrderData.ITEM_INFO_13 := qryTemp.FieldByName('ITEM_INFO_13').AsString;
      OrderData.ITEM_INFO_14 := qryTemp.FieldByName('ITEM_INFO_14').AsString;
      OrderData.ITEM_INFO_15 := qryTemp.FieldByName('ITEM_INFO_15').AsString;
      OrderData.ITEM_INFO_16 := qryTemp.FieldByName('ITEM_INFO_16').AsString;
      OrderData.ITEM_INFO_17 := qryTemp.FieldByName('ITEM_INFO_17').AsString;
      OrderData.ITEM_INFO_18 := qryTemp.FieldByName('ITEM_INFO_18').AsString;
      OrderData.ITEM_INFO_19 := qryTemp.FieldByName('ITEM_INFO_19').AsString;
      OrderData.ITEM_INFO_20 := qryTemp.FieldByName('ITEM_INFO_20').AsString;
      OrderData.PLT_CODE     := qryTemp.FieldByName('PLT_CODE'    ).AsString;
      OrderData.WRAP_YN      := qryTemp.FieldByName('WRAP_YN'     ).AsString;
      OrderData.MEMO_1       := qryTemp.FieldByName('MEMO_1'      ).AsString;
      OrderData.MEMO_2       := qryTemp.FieldByName('MEMO_2'      ).AsString;
      OrderData.MEMO_3       := qryTemp.FieldByName('MEMO_3'      ).AsString;
      OrderData.MEMO_4       := qryTemp.FieldByName('MEMO_4'      ).AsString;
      OrderData.MEMO_5       := qryTemp.FieldByName('MEMO_5'      ).AsString;
      OrderData.ID_USER      := MainDM.M_Info.UserCode;
      OrderData.END_YN       := 'N';
      OrderData.SEND_YN      := 'N';
      OrderData.OR_DT        := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';
      OrderData.UP_DT        := '';
      OrderData.CR_DT        := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';

      //오더 삽입
      fnOrderDataInsert(OrderData);
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      SP_AUTO_INDEX.Close;
    end;
  end;
end;

//==============================================================================
// fnOrderDataInsert [입고지시 데이터 Insert]
//==============================================================================
function TfrmU410.fnOrderDataInsert(OrderData: TTORDER): Boolean;
var
  ExecNo : integer;
  StrSQL : String;
begin
  Result := False;

  try
    StrSQL := ' INSERT INTO TT_ORDER( ID_DATE , ID_TIME, ID_TYPE, ' +
              '  ID_INDEX, ID_SUBIDX, ID_EMG, ID_SC, ID_CODE, ' +
              '  LOAD_BANK, LOAD_BAY, LOAD_LEVEL, UNLOAD_BANK, ' +
              '  UNLOAD_BAY, UNLOAD_LEVEL, KIND_1, KIND_2, KIND_3, ' +
              '  KIND_4, KIND_5, NOW_SITE, NOW_MACH, IN_SITE, ' +
              '  IN_DATE, OT_SITE, OT_DATE, BCR_CHK, STATUS, ' +
              '  PROCESS, ITEM_LOT, ITEM_TYPE, ITEM_WEIGHT, ITEM_QTY, ' +
              '  ITEM_INFO_01, ITEM_INFO_02, ITEM_INFO_03, ITEM_INFO_04, ITEM_INFO_05, ' +
              '  ITEM_INFO_06, ITEM_INFO_07, ITEM_INFO_08, ITEM_INFO_09, ITEM_INFO_10, ' +
              '  ITEM_INFO_11, ITEM_INFO_12, ITEM_INFO_13, ITEM_INFO_14, ITEM_INFO_15, ' +
              '  ITEM_INFO_16, ITEM_INFO_17, ITEM_INFO_18, ITEM_INFO_19, ITEM_INFO_20, ' +
              '  PLT_CODE, WRAP_YN, MEMO_1, MEMO_2, MEMO_3, ' +
              '  MEMO_4, MEMO_5, ID_USER, END_YN, SEND_YN, ' +
              '  OR_DT, UP_DT, CR_DT ) ' +
              ' VALUES( ' +
              OrderData.ID_DATE                 + ', ' +  // ID_DATE
              OrderData.ID_TIME                 + ', ' +  // ID_TIME
              QuotedStr(OrderData.ID_TYPE)      + ', ' +  // ID_TYPE
              IntToStr(OrderData.ID_INDEX)      + ', ' +  // ID_INDEX
              IntToStr(OrderData.ID_SUBIDX)     + ', ' +  // ID_SUBIDX
              IntToStr(OrderData.ID_EMG)        + ', ' +  // ID_EMG
              QuotedStr(OrderData.ID_SC)        + ', ' +  // ID_SC
              QuotedStr(OrderData.ID_CODE)      + ', ' +  // ID_CODE
              QuotedStr(OrderData.LOAD_BANK)    + ', ' +  // LOAD_BANK
              QuotedStr(OrderData.LOAD_BAY)     + ', ' +  // LOAD_BAY
              QuotedStr(OrderData.LOAD_LEVEL)   + ', ' +  // LOAD_LEVEL   입고대 단 위치
              QuotedStr(OrderData.UNLOAD_BANK)  + ', ' +  // UNLOAD_BANK
              QuotedStr(OrderData.UNLOAD_BAY)   + ', ' +  // UNLOAD_BAY
              QuotedStr(OrderData.UNLOAD_LEVEL) + ', ' +  // UNLOAD_LEVEL
              QuotedStr(OrderData.KIND_1)       + ', ' +  // KIND_1
              QuotedStr(OrderData.KIND_2)       + ', ' +  // KIND_2
              QuotedStr(OrderData.KIND_3)       + ', ' +  // KIND_3
              QuotedStr(OrderData.KIND_4)       + ', ' +  // KIND_4
              QuotedStr(OrderData.KIND_5)       + ', ' +  // KIND_5
              QuotedStr(OrderData.NOW_SITE)     + ', ' +  // NOW_SITE
              QuotedStr(OrderData.NOW_MACH)     + ', ' +  // NOW_MACH
              QuotedStr(OrderData.IN_SITE)      + ', ' +  // IN_SITE    입고지시 위치
              QuotedStr(OrderData.IN_DATE)      + ', ' +  // IN_DATE    입고완료 시간
              QuotedStr(OrderData.OT_SITE)      + ', ' +  // OT_SITE    출고지시 위치
              OrderData.OT_DATE                 + ', ' +  // OT_DATE    출고완료 시간
              IntToStr(OrderData.BCR_CHK)       + ', ' +  // BCR_CHK
              QuotedStr(OrderData.STATUS)       + ', ' +  // STATUS
              QuotedStr(OrderData.PROCESS)      + ', ' +  // PROCESS
              QuotedStr(OrderData.ITEM_LOT)     + ', ' +  // ITEM_LOT
              QuotedStr(OrderData.ITEM_TYPE)    + ', ' +  // ITEM_TYPE
              QuotedStr(OrderData.ITEM_WEIGHT)  + ', ' +  // ITEM_WEIGHT
              QuotedStr(OrderData.ITEM_QTY)     + ', ' +  // ITEM_QTY
              QuotedStr(OrderData.ITEM_INFO_01) + ', ' +  // ITEM_INFO_01
              QuotedStr(OrderData.ITEM_INFO_02) + ', ' +  // ITEM_INFO_02
              QuotedStr(OrderData.ITEM_INFO_03) + ', ' +  // ITEM_INFO_03
              QuotedStr(OrderData.ITEM_INFO_04) + ', ' +  // ITEM_INFO_04
              QuotedStr(OrderData.ITEM_INFO_05) + ', ' +  // ITEM_INFO_05
              QuotedStr(OrderData.ITEM_INFO_06) + ', ' +  // ITEM_INFO_06
              QuotedStr(OrderData.ITEM_INFO_07) + ', ' +  // ITEM_INFO_07
              QuotedStr(OrderData.ITEM_INFO_08) + ', ' +  // ITEM_INFO_08
              QuotedStr(OrderData.ITEM_INFO_09) + ', ' +  // ITEM_INFO_09
              QuotedStr(OrderData.ITEM_INFO_10) + ', ' +  // ITEM_INFO_10
              QuotedStr(OrderData.ITEM_INFO_11) + ', ' +  // ITEM_INFO_11
              QuotedStr(OrderData.ITEM_INFO_12) + ', ' +  // ITEM_INFO_12
              QuotedStr(OrderData.ITEM_INFO_13) + ', ' +  // ITEM_INFO_13
              QuotedStr(OrderData.ITEM_INFO_14) + ', ' +  // ITEM_INFO_14
              QuotedStr(OrderData.ITEM_INFO_15) + ', ' +  // ITEM_INFO_15
              QuotedStr(OrderData.ITEM_INFO_16) + ', ' +  // ITEM_INFO_16
              QuotedStr(OrderData.ITEM_INFO_17) + ', ' +  // ITEM_INFO_17
              QuotedStr(OrderData.ITEM_INFO_18) + ', ' +  // ITEM_INFO_18
              QuotedStr(OrderData.ITEM_INFO_19) + ', ' +  // ITEM_INFO_19
              QuotedStr(OrderData.ITEM_INFO_20) + ', ' +  // ITEM_INFO_20
              QuotedStr(OrderData.PLT_CODE)     + ', ' +  // PLT_CODE
              QuotedStr(OrderData.WRAP_YN)      + ', ' +  // WRAP_YN
              QuotedStr(OrderData.MEMO_1)       + ', ' +  // MEMO_1
              QuotedStr(OrderData.MEMO_2)       + ', ' +  // MEMO_2
              QuotedStr(OrderData.MEMO_3)       + ', ' +  // MEMO_3
              QuotedStr(OrderData.MEMO_4)       + ', ' +  // MEMO_4
              QuotedStr(OrderData.MEMO_5)       + ', ' +  // MEMO_5
              QuotedStr(OrderData.ID_USER)      + ', ' +  // ID_USER
              QuotedStr(OrderData.END_YN)       + ', ' +  // END_YN
              QuotedStr(OrderData.SEND_YN)      + ', ' +  // SEND_YN
              OrderData.OR_DT                   + ', ' +  // OR_DT      출고지시 시간(핸드바코드)
              QuotedStr(OrderData.UP_DT)        + ', ' +  // UP_DT
              OrderData.CR_DT                   + ') ' ;  // CR_DT      오더생성 시간

    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
      begin
        Result := True;
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
        TraceLogWrite('[410] 이동지시 - 타입['+OrderData.ITEM_TYPE+'], 번호['+OrderData.ITEM_LOT+'], 작업['+OrderData.ID_TYPE+'], 위치['+OrderData.ID_CODE+']');
      end else
      begin
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
        TraceLogWrite('[410] 이동지시 - 에러[데이터 생성오류], 타입['+OrderData.ITEM_TYPE+'], 번호['+OrderData.ITEM_LOT+'], 작업['+OrderData.ID_TYPE+'], 위치['+OrderData.ID_CODE+']');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[410] 이동지시 - 에러['+E.Message+'], 타입['+OrderData.ITEM_TYPE+'], 번호['+OrderData.ITEM_LOT+'], 작업['+OrderData.ID_TYPE+'], 위치['+OrderData.ID_CODE+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// btnSaveClick
//==============================================================================
procedure TfrmU410.btnSaveClick(Sender: TObject);
var
  RackLoc, StrSQL, LogStr, StrResult : String;
  TmpPrDate, TmpPrTime, TmpInDate, TmpInTime, TmpHogi, TmpWeight, TmpEM_Result : String;
begin
  try
    StrSQL  := '';
    RackLoc := cbBank.Text + cbBay.Text + cbLevel.Text;
    TmpPrDate := FormatDateTime('YYYYMMDD', dtPRDCT_DATE.Date );
    TmpPrTime := FormatDateTime('HHNNSS'  , dtPRDCT_TIME.Time );
    TmpInDate := FormatDateTime('YYYY-MM-DD'   , dtNOW_IN_DATE.Date);
    TmpInTime := FormatDateTime(' HH:NN:SS.ZZZ', dtNOW_IN_TIME.Time);
    TmpWeight := FormatFloat('####0.000', StrToFloatDef(Trim(dITEM_WEIGHT.Text), 0));

    if (cbBank.Text = '') or (cbBay.Text = '') or (cbLevel.Text = '') then
    begin
      MessageDlg('셀을 선택해 주십시오.', mtConfirmation, [mbOk], 0);
      Exit;
    end;

    if (cbSTATUS.Text = '') then
    begin
      MessageDlg('렉 상태를 선택해주십시오.', mtConfirmation, [mbOk], 0);
      Exit;
    end;

    //===============================================
    // 동일LOT 체크(창고재고)(TT_RACK_STOCK)
    //===============================================
    StrResult := frmMain.fnStockCheck(dITEM_LOT.Text);
    if RackLoc <> Copy(StrResult,2,2) + Copy(StrResult,5,2) + Copy(StrResult,8,2) then
    begin
      if StrResult <> '' then
      begin
        MessageDlg('  창고 재고에 동일한 제품번호가 존재합니다.' + #13#10 +
                   '  제품번호는 중복될 수 없습니다.' + #13#10 +
                   '  재고를 확인해 주십시오.' + #13#10 + #13#10 +
                   '  제품번호 - [ '+dITEM_LOT.Text+' ]' + #13#10 +
                   '  적재호기 - [ '+Copy(StrResult,1,1)+ '호기 ]' + #13#10 +
                   '  적재위치 - [ '+Copy(StrResult,2,8) + ' ]', mtWarning, [mbYes], 0);
        Exit;
      end;
    end;

    {
    //===============================================
    // 동일LOT 체크(컨베어라인)(TT_TRACK)
    //===============================================
    StrResult := frmMain.fnCVLineCheck(dITEM_LOT.Text);
    if StrResult <> '' then
    begin
      MessageDlg('  컨베이어 라인에 동일한 제품번호가 존재합니다.' + #13#10 +
                 '  제품번호는 중복될 수 없습니다.' + #13#10 +
                 '  라인을 확인해 주십시오.' + #13#10 + #13#10 +
                 '  제품번호 - [ '+dITEM_LOT.Text +' ]' + #13#10 +
                 '  버퍼위치 - [ '+Copy(StrResult,1,3)+' ]', mtWarning, [mbYes], 0);
      Exit;
    end;
    }

    with qryUpdate do
    begin
      Close;
      SQL.Clear;
      if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

      // 랙 상태 변경 (TT_RACK) 상태 변경
      LogStr := 'MONITORING UPDATE ' + cbStatus.Text;
      if (cbStatus.Text = '빈랙') or
         (cbStatus.Text = '재고') then
      begin
        StrSQL := ' UPDATE TT_RACK ' +
                  '    SET RACK_STAT  = ' + QuotedStr(cbStatus.Text) +
                  '      , ORDER_STAT = ''없음'' ' +
                  '      , ERR_STAT   = ''없음'' ' +
                  '      , IN_USED    = ' + QuotedStr(IfThen(cbIn_USE.Checked,'N','Y')) +  // 체크 되어있으면 N(사용불가), 체크되어있지 않으면 Y (사용가능)
                  '      , OT_USED    = ' + QuotedStr(IfThen(cbOt_USE.Checked,'N','Y')) +
                  '      , MEMO_1     = ' + QuotedStr(LogStr) +
                  '      , UP_DT      = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE RACK_LOC  = ' + QuotedStr(RackLoc);
      end else
      if (cbStatus.Text = '입고중') or
         (cbStatus.Text = '출고중') then
      begin
        StrSQL := ' UPDATE TT_RACK ' +
                  '    SET ORDER_STAT = ' + QuotedStr(cbStatus.Text) +
                  '      , ERR_STAT   = ''없음'' ' +
                  '      , IN_USED    = ' + QuotedStr(IfThen(cbIn_USE.Checked,'N','Y')) +  // 체크 되어있으면 N(사용불가), 체크되어있지 않으면 Y (사용가능)
                  '      , OT_USED    = ' + QuotedStr(IfThen(cbOt_USE.Checked,'N','Y')) +
                  '      , MEMO_1     = ' + QuotedStr(LogStr) +
                  '      , UP_DT      = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE RACK_LOC   = ' + QuotedStr(RackLoc);
      end else
      if (cbStatus.Text = '이중입고') or
         (cbStatus.Text = '공출고') then
      begin
        StrSQL := ' UPDATE TT_RACK ' +
                  '    SET ERR_STAT   = ' + QuotedStr(cbStatus.Text) +
                  '      , ORDER_STAT = ''없음'' ' +
                  '      , IN_USED    = ' + QuotedStr(IfThen(cbIn_USE.Checked,'N','Y')) +  // 체크 되어있으면 N(사용불가), 체크되어있지 않으면 Y (사용가능)
                  '      , OT_USED    = ' + QuotedStr(IfThen(cbOt_USE.Checked,'N','Y')) +
                  '      , MEMO_1     = ' + QuotedStr(LogStr) +
                  '      , UP_DT      = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE RACK_LOC   = ' + QuotedStr(RackLoc);
      end;

      if StrSQL <> '' then
      begin
        SQL.Text := StrSQL;
        ExecSQL;
        TraceLogWrite('[410] 재고수정 - 위치['+RackLoc+'], 상태['+cbStatus.Text+
                      '], 입고가능['+IfThen(cbIn_USE.Checked,'N','Y')+'], 출고가능['+IfThen(cbOt_USE.Checked,'N','Y')+']');
      end;

      if cbStatus.Text <> '빈랙' then
      begin
        if      cbITEM_INFO_10.Text = '합격[A]'   then TmpEM_Result := 'A'
        else if cbITEM_INFO_10.Text = '불합격[F]' then TmpEM_Result := 'F'
        else TmpEM_Result := '';

        Close;
        SQL.Clear;
        StrSQL := ' SELECT * ' +
                  '   FROM TT_RACK_STOCK WITH (NOLOCK) '+
                  '  WHERE RACK_LOC = ' + QuotedStr(RackLoc);
        SQL.Text := StrSQL;
        Open;

        if (RecordCount = 0) and
           (dITEM_LOT.Text <> '') then
        begin
          if Trim(m.Popup_ItemInfo.DATA08) = '' then m.Popup_ItemInfo.DATA08 := 'N';

          if (cbBank.Text = '01') or
             (cbBank.Text = '02') then
          begin
            TmpHogi := '1';
          end else
          if (cbBank.Text = '03') or
             (cbBank.Text = '04') then
          begin
            TmpHogi := '2';
          end else
          if (cbBank.Text = '05') or
             (cbBank.Text = '06') then
          begin
            TmpHogi := '3';
          end;

          // 재고정보 추가
          Close;
          SQL.Clear;
          StrSQL := ' INSERT INTO TT_RACK_STOCK ' +
                    '        (RACK_HOGI, RACK_LOC, RACK_BANK, RACK_BAY, RACK_LEVEL, ' +
                    '         ITEM_LOT, ITEM_INFO_01, ITEM_INFO_02, ITEM_INFO_03, ' +
                    '         ITEM_INFO_04, ITEM_QTY, ITEM_WEIGHT, ITEM_TYPE, ' +
                    '         ITEM_INFO_06, ITEM_INFO_07, ITEM_INFO_08, ITEM_INFO_10, ' +
                    '         WRAP_YN, ITEM_INFO_05, IN_DATE, UP_DT, CR_DT ) ' +
                    ' VALUES ( ' + QuotedStr(TmpHogi)  + ', '
                                 + QuotedStr(RackLoc)               + ', '
                                 + QuotedStr(cbBank.Text)           + ', '
                                 + QuotedStr(cbBay.Text)            + ', '
                                 + QuotedStr(cbLevel.Text)          + ', '
                                 + QuotedStr(dITEM_LOT.Text)        + ', '        // 제품번호
                                 + QuotedStr(dITEM_INFO_01.Text)    + ', '        // 제품코드
                                 + QuotedStr(dITEM_INFO_02.Text)    + ', '        // 제품명
                                 + QuotedStr(dITEM_INFO_03.Text)    + ', '        // (전)제품코드
                                 + QuotedStr(dITEM_INFO_04.Text)    + ', '        // (전)제품명
                                 + QuotedStr('1'           )        + ', '        // 수량
                                 + QuotedStr(TmpWeight)             + ', '        // 중량
                                 + QuotedStr(cbITEM_TYPE.Text)      + ', '        // 제품여부
                                 + QuotedStr(dITEM_INFO_06.Text)    + ', '        // 고객코드
                                 + QuotedStr(dITEM_INFO_07.Text)    + ', '        // 고객명
                                 + QuotedStr(dITEM_INFO_08.Text)    + ', '        // 주문번호
                                 + QuotedStr(TmpEM_Result)          + ', '        // 판정결과
                                 + QuotedStr(cbWRAP_YN.Text)        + ', '        // 랩핑여부
                                 + QuotedStr(TmpPrDate + TmpPrTime) + ', '        // 생산일자/생산일시
                                 + QuotedStr(TmpInDate + TmpInTime) + ', '        // 입고일자/입고일시
                                 + ' CONVERT(VARCHAR(MAX), GETDATE(), 21) , '
                                 + ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ) ' ;
          SQL.Text := StrSQL;
          ExecSQL;
          TraceLogWrite('[410] 재고등록 - 위치['+RackLoc+'], 제품번호['+dITEM_LOT.Text+']');
        end else
        if (RecordCount <> 0) and
           (dITEM_LOT.Text <> '') then
        begin
          // 재고정보 업데이트
          Close;
          SQL.Clear;
          StrSQL := ' UPDATE TT_RACK_STOCK ' +
                    '    SET ITEM_LOT     = ' + QuotedStr(dITEM_LOT.Text    )  +  // 제품번호
                    '      , ITEM_INFO_01 = ' + QuotedStr(dITEM_INFO_01.Text)  +  // 제품코드
                    '      , ITEM_INFO_02 = ' + QuotedStr(dITEM_INFO_02.Text)  +  // 제품명
                    '      , ITEM_INFO_03 = ' + QuotedStr(dITEM_INFO_03.Text)  +  // (전)제품코드
                    '      , ITEM_INFO_04 = ' + QuotedStr(dITEM_INFO_04.Text)  +  // (전)제품명
                    '      , ITEM_QTY     = ' + QuotedStr('1'               )  +  // 수량
                    '      , ITEM_WEIGHT  = ' + QuotedStr(TmpWeight         )  +  // 중량
                    '      , ITEM_TYPE    = ' + QuotedStr(cbITEM_TYPE.Text  )  +  // 제품여부
                    '      , ITEM_INFO_06 = ' + QuotedStr(dITEM_INFO_06.Text)  +  // 고객코드
                    '      , ITEM_INFO_07 = ' + QuotedStr(dITEM_INFO_07.Text)  +  // 고객명
                    '      , ITEM_INFO_08 = ' + QuotedStr(dITEM_INFO_08.Text)  +  // 주문번호
                    '      , ITEM_INFO_10 = ' + QuotedStr(TmpEM_Result)        +  // 판정결과
                    '      , WRAP_YN      = ' + QuotedStr(cbWRAP_YN.Text)      +  // 랩핑여부
                    '      , ITEM_INFO_05 = ' + QuotedStr(TmpPrDate+TmpPrTime) +  // 생산일자/생산일시
                    '      , IN_DATE      = ' + QuotedStr(TmpInDate+TmpInTime) +  // 입고일자/입고일시
                    '      , UP_DT        = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                    '  WHERE RACK_LOC = ' + QuotedStr(RackLoc);
          SQL.Text := StrSQL;
          ExecSQL;
          TraceLogWrite('[410] 재고수정 - 위치['+RackLoc+'], 제품번호['+dITEM_LOT.Text+']');
        end;
      end else
      begin
        // 빈랙 재고정보 삭제
        Close;
        SQL.Clear;
        StrSQL := ' DELETE FROM TT_RACK_STOCK ' +
                  '  WHERE RACK_LOC = ' + QuotedStr(RackLoc);
        SQL.Text := StrSQL;
        ExecSQL;
        TraceLogWrite('[410] 재고삭제 - 위치['+RackLoc+'], 제품번호['+dITEM_LOT.Text+']');
        ItemInfoClear;
      end;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
      Close;
    end;
    fnCommandQuery;
  except
    on E : Exception do
    begin
      qryUpdate.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[410] 재고수정 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// sbt_ITEMClick
//==============================================================================
procedure TfrmU410.sbt_ITEMClick(Sender: TObject);
begin
{
  frmItemSearch := TfrmItemSearch.Create(Application);
  frmItemSearch.PnlFormName.Caption := '품목 코드 찾기';
  frmItemSearch.Caption := '코드찾기';
  // 품목코드
  frmItemSearch.edtCode.Text := edtITEM_CODE.Text;
  frmItemSearch.ShowModal ;

  if m.Popup_ItemInfo.ResultCd = 'OK' then
  begin
    SeachFalg := True;
    edtLOT_NO.Text     := FormatDateTime('YYYYMMDD',Now);

    edtITEM_CODE.Text  := m.Popup_ItemInfo.DATA01;
    edtITEM_NM.Text    := m.Popup_ItemInfo.DATA02;
    edtSpec.Text       := m.Popup_ItemInfo.DATA03;
    edtEXPIRY_DAY.Text := m.Popup_ItemInfo.DATA04;
    edtBOX_QTY.Text    := '1';

    dtNOW_IN_DT.DateTime   := Now;
    dtNOW_IN_TIME.DateTime := Now;
  end;
  }
end;

//==============================================================================
// PageControlChange
//==============================================================================
procedure TfrmU410.PageControlChange(Sender: TObject);
var
  i, j, k, SInt, EInt : Integer;
  tmpPanel : TPanel;
begin
  SelectHogi      := PageControl.ActivePageIndex + 1;
  chkMove.Checked := False;
  btnMove.Enabled := False;
  cbFrBank.Text   := '';
  cbFrBay.Text    := '';
  cbFrLevel.Text  := '';
  cbToBank.Text   := '';
  cbToBay.Text    := '';
  cbToLevel.Text  := '';
  MoveSet         := 0;

  if PageControl.ActivePageIndex = 0 then
  begin
    SInt := 1; EInt := 2;
    CellPanel[1][0][0].Caption := '1 열';
    CellPanel[2][0][0].Caption := '2 열';
  end else
  if PageControl.ActivePageIndex = 1 then
  begin
    SInt := 3; EInt := 4;
    CellPanel[1][0][0].Caption := '3 열';
    CellPanel[2][0][0].Caption := '4 열';
  end else
  if PageControl.ActivePageIndex = 2 then
  begin
    SInt := 5; EInt := 6;
    CellPanel[1][0][0].Caption := '5 열';
    CellPanel[2][0][0].Caption := '6 열';
  end;

  cbFrBank.Items.Clear;
  cbToBank.Items.Clear;
  cbFrBank.Items.Add('');
  cbToBank.Items.Add('');


  for i := SInt to EInt do
  begin
    cbFrBank.Items.Add(FormatFloat('00',i));
    cbToBank.Items.Add(FormatFloat('00',i));
  end;

  if (SelectCell <> '') then
  begin
    TPanel(Self.FindComponent('CELL'+SelectCell)).BevelOuter := bvRaised;
    TPanel(Self.FindComponent('CELL'+SelectCell)).BevelWidth := 1;
  end;

  fnCommandQuery;
  SCPositionDisplay;
  ItemInfoClear;

  for i := 1 to vBank do
  begin
    for j := 1 to vBay do
    begin
      for k := 1 to vLevel do
      begin
        if TShape(Self.FindComponent('CellShape'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k))).Visible then
        begin
          TShape(Self.FindComponent('CellShape'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k))).Pen.Color :=
          TPanel(Self.FindComponent('Cell'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k))).Color;
          TShape(Self.FindComponent('CellShape'+FormatFloat('00',i)+FormatFloat('00',j)+FormatFloat('00',k))).Visible := False;
        end;
      end;
    end;
  end;
end;

//==============================================================================
// PageControlChange
//==============================================================================
procedure TfrmU410.chkMoveClick(Sender: TObject);
begin
  cbFrBank.Text  := '';
  cbFrBay.Text   := '';
  cbFrLevel.Text := '';
  cbToBank.Text  := '';
  cbToBay.Text   := '';
  cbToLevel.Text := '';
  MoveSet := 0;

  if chkMove.Checked then
  begin
    btnMove.Enabled   := True;
    cbFrBank.Enabled  := True;
    cbFrBay.Enabled   := True;
    cbFrLevel.Enabled := True;
    cbToBank.Enabled  := True;
    cbToBay.Enabled   := True;
    cbToLevel.Enabled := True;
    cbFrBank.Color    := clWhite;
    cbFrBay.Color     := clWhite;
    cbFrLevel.Color   := clWhite;
    cbToBank.Color    := clWhite;
    cbToBay.Color     := clWhite;
    cbToLevel.Color   := clWhite;
  end else
  begin
    btnMove.Enabled   := False;
    cbFrBank.Enabled  := False;
    cbFrBay.Enabled   := False;
    cbFrLevel.Enabled := False;
    cbToBank.Enabled  := False;
    cbToBay.Enabled   := False;
    cbToLevel.Enabled := False;
    cbFrBank.Color    := $00F2F2F2;
    cbFrBay.Color     := $00F2F2F2;
    cbFrLevel.Color   := $00F2F2F2;
    cbToBank.Color    := $00F2F2F2;
    cbToBay.Color     := $00F2F2F2;
    cbToLevel.Color   := $00F2F2F2;
  end;
end;

//==============================================================================
// SCPositionDisplay
//==============================================================================
procedure TfrmU410.SCPositionDisplay;
var
  StrSQL : String;
  TMP_BAY, TMP_LEVEL : integer;
  TmpCell : TPanel;
begin
  try
    TmpCell := TPanel(Self.FindComponent('Cell'+FormatFloat('00', 2)+FormatFloat('00', 12)+FormatFloat('00', 8))) ;
    if TmpCell = nil then Exit;
    with QrySearch do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT * FROM TC_SCCR WITH (NOLOCK) ' +
                '   WHERE IDX = ''1'' ';
      SQL.Text := StrSQL;
      Open;

      if SelectHogi = 1 then
      begin
        TMP_BAY   := StrToInt('$'+Copy(FieldByName('CH04').AsString, 3, 2));
        TMP_LEVEL := StrToInt('$'+Copy(FieldByName('CH05').AsString, 3, 2));
      end else
      if SelectHogi = 2 then
      begin
        TMP_BAY   := StrToInt('$'+Copy(FieldByName('CH07').AsString, 3, 2));
        TMP_LEVEL := StrToInt('$'+Copy(FieldByName('CH08').AsString, 3, 2));
      end else
      if SelectHogi = 3 then
      begin
        TMP_BAY   := StrToInt('$'+Copy(FieldByName('CH10').AsString, 3, 2));
        TMP_LEVEL := StrToInt('$'+Copy(FieldByName('CH11').AsString, 3, 2));
      end;
      PnlSCBase.Width   := CellPanel[1][TMP_BAY][1].Width + 2;
      PnlSCBase.Left    := CellPanel[1][TMP_BAY][1].Left -1;
      PnlSCBase.Caption := IntToStr(SelectHogi)+'호기 / ' + FormatFloat('00', TMP_BAY) + '-' + FormatFloat('00', TMP_Level) + '';
      PnlSCBase.Hint    := '스태커크레인 ' + IntToStr(SelectHogi)+'호기 현재위치 열, 단 ' ;
      Close;
    end;
  except
    on E : Exception do
    begin
      qrySearch.Close;
      TraceLogWrite('[410] 스태커크레인 위치 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// ItemInfoClear
//==============================================================================
procedure TfrmU410.ItemInfoClear;
begin
  cbSTATUS.Text       := '';    // 랙상태
  dITEM_LOT.Text      := '';    // 제품번호
  dITEM_INFO_01.Text  := '';    // 반제품코드
  dITEM_INFO_02.Text  := '';    // 반제품명
  dITEM_INFO_03.Text  := '';    // 제품코드
  dITEM_INFO_04.Text  := '';    // 제품명
  dITEM_QTY.Text      := '';    // 수량
  dITEM_WEIGHT.Text   := '';    // 중량
  cbITEM_TYPE.Text    := '';    // 제품여부
  dITEM_INFO_06.Text  := '';    // 고객코드
  dITEM_INFO_07.Text  := '';    // 고객명
  dITEM_INFO_08.Text  := '';    // 주문번호
  cbITEM_INFO_10.Text := '';    // 판정결과
  cbWRAP_YN.Text      := '';    // 랩핑여부
  dtPRDCT_DATE.Date   := Now;
  dtPRDCT_TIME.Time   := Now;
  dtNOW_IN_DATE.Date  := Now;
  dtNOW_IN_TIME.Time  := Now;
  cbIn_USE.Checked    := False; // 입고금지
  cbOt_USE.Checked    := False; // 출고금지
end;

procedure TfrmU410.Button1Click(Sender: TObject);
var
  StrSQL : String;
  TmpBank, TmpLoc : String;
  i,j,k,L : integer;
begin

  for i := 1 to 3 do
  begin
    for j := 1 to 2 do
    begin
      for K := 1 to 12 do
      begin

        for L := 1 to 8 do
        begin
          if      i=1 then TmpBank := FormatFloat('00',j)
          else if i=2 then TmpBank := FormatFloat('00',j+2)
          else if i=3 then TmpBank := FormatFloat('00',j+4) ;

          TmpLoc := TmpBank + FormatFloat('00',K) + FormatFloat('00',L) ;



          with qryTemp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'INSERT INTO TT_RACK(RACK_HOGI, RACK_LOC, RACK_BANK, RACK_BAY, RACK_LEVEL) VALUES('+
                        IntToStr(i) + ',' +
                        QuotedStr(TmpLoc) + ',' +
                        QuotedStr(TmpBank) + ',' +
                        QuotedStr(FormatFloat('00',K)) + ','+
                        QuotedStr(FormatFloat('00',L)) + ')';
            EXECSQL;
          end;
        end;
      end;

    end;
  end;




end;

end.

