unit U340;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus, System.DateUtils,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU340 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    qryTemp: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    pmControl: TPopupMenu;
    mnJobCancel: TMenuItem;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dgInfo: TDBGridEh;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    qryStat: TADOQuery;
    qryOrder: TADOQuery;
    Panel1: TPanel;
    DatePicker1: TDateTimePicker;
    TimePicker1: TDateTimePicker;
    Panel4: TPanel;
    Panel15: TPanel;
    Panel5: TPanel;
    Panel18: TPanel;
    DatePicker2: TDateTimePicker;
    TimePicker2: TDateTimePicker;
    edtCode: TEdit;
    Panel7: TPanel;
    edtLOT: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    Panel24: TPanel;
    Panel12: TPanel;
    Panel10: TPanel;
    cbSTOCK_EXIST: TComboBox;
    cbBODY_22: TComboBox;
    Panel13: TPanel;
    Panel16: TPanel;
    edtITEM_INFO_06: TEdit;
    edtITEM_INFO_08: TEdit;
    mnJobStackComplete: TMenuItem;
    Panel6: TPanel;
    Panel19: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    lblCnt: TLabel;
    tmrQuery: TTimer;
    Panel17: TPanel;
    Panel20: TPanel;
    cbBODY_01: TComboBox;
    cbPROC_STAT: TComboBox;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel25: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    cbOUT_MODE: TComboBox;
    cbHogi: TComboBox;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel30: TPanel;
    cbID_TYPE: TComboBox;
    Panel31: TPanel;
    edtOUT_COUNT: TEdit;
    sbtClear2: TSpeedButton;
    Panel32: TPanel;
    Pnl_Order: TPanel;
    sbt_Order: TSpeedButton;
    Panel33: TPanel;
    cbOUT_USED: TComboBox;
    SP_AUTO_INDEX: TADOStoredProc;
    Panel26: TPanel;
    lblOrderCommand: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblOrderComplete: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure mnProcClick(Sender: TObject);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure pmControlPopup(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure DatePickerChange(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure tmrQueryTimer(Sender: TObject);
    procedure dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dgInfoSelectionChanged(Sender: TObject);
    procedure cbOUT_MODEChange(Sender: TObject);
    procedure cbID_TYPEChange(Sender: TObject);
    procedure cbHogiChange(Sender: TObject);
    procedure sbtClear2Click(Sender: TObject);
    procedure sbt_OrderClick(Sender: TObject);
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
    procedure OrderProcess(Mode: Integer);
    procedure OrderCreate(Mode: Integer);
    function  fnValidCheck : Boolean;
    function  fnOrderDataInsert(OrderData: TTORDER): Boolean;
    function  fnInterfaceUpdate(Mode, IntType, RequestDate, ItemLot, Recv_DT: String): Boolean;
  end;
  procedure U340Create();

const
  FormNo ='340';

var
  frmU340: TfrmU340;
  SrtFlag : integer = 0 ;

  AutoOutFlag1,           // 처리상태
  AutoOutFlag2,           // 재고상태
  AutoOutFlag3 : integer; // 출고가능

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U340Create
//==============================================================================
procedure U340Create();
begin
  if not Assigned( frmU340 ) then
  begin
    frmU340 := TfrmU340.Create(Application);
    with frmU340 do
    begin
      fnCommandStart;
    end;
  end;
  frmU340.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU340.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU340.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU340.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU340.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    fnWmMsgSend( 21211, 111 );
  end else
  begin
    fnWmMsgSend( 22221, 111 );
  end;

  cbOUT_MODE.ItemIndex := StrToInt(IniRead( INI_PATH, 'IO_Info', 'INT_OUT_MODE'  ,'0' ));
  if cbOUT_MODE.ItemIndex = 0 then
  begin // 수동선택(수량입력 창 비활성화)
    cbOUT_MODE.Color     := clYellow;
    edtOUT_COUNT.Text    := '';
    edtOUT_COUNT.Color   := $00F5F5F5;
    edtOUT_COUNT.Enabled := False;
  end else
  begin // 수량입력(수량입력 창 활성화)
    cbOUT_MODE.Color     := clLime;
    edtOUT_COUNT.Text    := IniRead( INI_PATH, 'IO_Info', 'INT_OUT_COUNT'  ,'' );
    edtOUT_COUNT.Color   := clWhite;
    edtOUT_COUNT.Enabled := True;
  end;
  dgInfo.SelectedRows.Clear;
  if not tmrQuery.Enabled then tmrQuery.Enabled := True;

  if MainDM.M_Info.UserAdmin = 'Y' then
       Pnl_Order.Visible := True
  else Pnl_Order.Visible := False;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU340.FormDeactivate(Sender: TObject);
var
  i : integer ;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i] is TTimer) then
       (Self.Components[i] as TTimer).Enabled := False ;
  end;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU340.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU340 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU340.fnCommandStart;
begin
  DatePicker1.Date := Now -7;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU340.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU340.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel(dgInfo, '출고요청 정보' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  엑셀 저장을 완료하였습니다.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU340.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU340.fnCommandPrint;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  fnCommandQuery;
  EhPrint.DBGridEh := dgInfo;
  EhPrint.PageFooter.RightText.Clear;
  EhPrint.PageFooter.RightText.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS',Now()) + '   ' +
                                   MainDM.M_Info.UserCode+' / '+MainDM.M_Info.UserName);
  EhPrint.PageFooter.Font.Name := '돋움';
  EhPrint.PageFooter.Font.Size := 11;
  EhPrint.Preview;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU340.fnCommandQuery;
var
  WhereStr, StockStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;
  StockStr := '' ;


  // 요청구분
  if (Trim(cbBODY_01.Text) <> '전체') then
  begin
    if      cbBODY_01.ItemIndex = 1 then
      WhereStr := WhereStr + ' AND R.BODY_01 = ''1'' '  // 생산불출
    else if cbBODY_01.ItemIndex = 2 then
      WhereStr := WhereStr + ' AND R.BODY_01 = ''3'' '  // 제품출하
    else if cbBODY_01.ItemIndex = 3 then
      WhereStr := WhereStr + ' AND R.BODY_01 = ''5'' '  // 재작업
    else if cbBODY_01.ItemIndex = 4 then
      WhereStr := WhereStr + ' AND R.BODY_01 = ''9'' '; // 기타출고
  end;

  // 처리상태
  if (Trim(cbPROC_STAT.Text) <> '전체') then
    WhereStr := WhereStr + ' AND R.PROC_STAT = ' + QuotedStr(IntToStr(cbPROC_STAT.ItemIndex-1)) ;

  // 제품번호
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_03)) LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // 제품코드 or 제품명
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_05)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_06)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')' ;

  // 재고상태
  if (Trim(cbSTOCK_EXIST.Text) <> '전체') then
  begin
    if      Trim(cbSTOCK_EXIST.Text) = '재고있음' then
      StockStr := StockStr + ' AND RTRIM(LTRIM(TMP.STOCK_EXIST)) = ''재고있음'' '
    else if Trim(cbSTOCK_EXIST.Text) = '재고없음' then
      StockStr := StockStr + ' AND RTRIM(LTRIM(TMP.STOCK_EXIST)) = ''재고없음'' '
    else if Trim(cbSTOCK_EXIST.Text) = '작업중' then
      StockStr := StockStr + ' AND (RTRIM(LTRIM(TMP.STOCK_EXIST)) = ''입고중'' or RTRIM(LTRIM(TMP.STOCK_EXIST)) = ''출고중'') '
    else if Trim(cbSTOCK_EXIST.Text) = '에러' then
      StockStr := StockStr + ' AND (RTRIM(LTRIM(TMP.STOCK_EXIST)) = ''이중입고'' or RTRIM(LTRIM(TMP.STOCK_EXIST)) = ''공출고'') ';
  end;

  // 랩핑여부
  if (Trim(cbBODY_22.Text) <> '전체') then
  begin
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_22)) = ' + QuotedStr(Trim(cbBODY_22.Text));
  end;

  // 주문번호
  if (Trim(edtITEM_INFO_08.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_13)) LIKE ' + QuotedStr('%'+edtITEM_INFO_08.Text+'%') ;

  // 고객코드
  if (Trim(edtITEM_INFO_06.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_11)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_12)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ')' ;

  // 출고가능
  if (Trim(cbOUT_USED.Text) <> '전체') then
  begin
    StockStr := StockStr + ' AND RTRIM(LTRIM(TMP.OUT_USED)) = ' + QuotedStr(Trim(cbOUT_USED.Text));
  end;

  // 수신일시
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.RECV_DT)) BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                         '                                 AND ''' + TmpDate2 + TmpTime2 + ''' ' ;
  // 출고호기
  if (Trim(cbHogi.Text) <> '전체') then
  begin
    if      cbHogi.ItemIndex = 1 then
      StockStr := StockStr + ' AND (SUBSTRING(TMP.RACK_LOC, 1, 2) = ''01'' or SUBSTRING(TMP.RACK_LOC, 1, 2) = ''02'') '
    else if cbHogi.ItemIndex = 2 then
      StockStr := StockStr + ' AND (SUBSTRING(TMP.RACK_LOC, 1, 2) = ''03'' or SUBSTRING(TMP.RACK_LOC, 1, 2) = ''04'') '
    else if cbHogi.ItemIndex = 3 then
      StockStr := StockStr + ' AND (SUBSTRING(TMP.RACK_LOC, 1, 2) = ''05'' or SUBSTRING(TMP.RACK_LOC, 1, 2) = ''06'') ';
  end;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;

      StrSQL := ' SELECT TMP.* FROM ( ' +
                ' SELECT ' +
                ' R.RECV_DT as PROC_INFO1, ' + // 수신일시
                ' R.BODY_03 as PROC_INFO2, ' + // 제품번호
                ' R.BODY_04 as PROC_INFO3, ' + // 요청일시
                ' R.BODY_01 as PROC_INFO4, ' + // 출고요청구분
                ' R.BODY_02 as PROC_INFO5, ' + // 요청취소구분
                // 수신일시
                ' SUBSTRING(R.RECV_DT, 1, 19) as RECV_DT, ' +
                // 출고요청구분
                ' CASE WHEN RTRIM(LTRIM(R.BODY_01)) = ''1'' THEN ''생산불출'' ' +
                '      WHEN RTRIM(LTRIM(R.BODY_01)) = ''3'' THEN ''제품출하'' ' +
                '      WHEN RTRIM(LTRIM(R.BODY_01)) = ''5'' THEN ''재작업'' ' +
                '      WHEN RTRIM(LTRIM(R.BODY_01)) = ''9'' THEN ''기타출고'' ' +
                '      ELSE ''확인불가'' END as BODY_01, ' +
                // 요청취소구분
                ' CASE WHEN RTRIM(LTRIM(R.BODY_02)) = ''R'' THEN ''출고요청'' ' +
                '      WHEN RTRIM(LTRIM(R.BODY_02)) = ''C'' THEN ''요청취소'' ' +
                '      ELSE ''확인불가'' END as BODY_02, ' +
                // 제품번호
                ' RTRIM(LTRIM(R.BODY_03)) as BODY_03, ' +
                // 요청일시
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(R.BODY_04)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(R.BODY_04)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_04, ' +
                // 제품코드
                ' RTRIM(LTRIM(R.BODY_05)) as BODY_05, ' +
                // 제품명
                ' RTRIM(LTRIM(R.BODY_06)) as BODY_06, ' +
                // 중량
                ' CASE WHEN RTRIM(LTRIM(R.BODY_07)) = '''' or RTRIM(LTRIM(R.BODY_07)) = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(R.BODY_07))) END as BODY_07, ' +
                // 코드전환 후 출고여부
                ' RTRIM(LTRIM(R.BODY_08)) as BODY_08, ' +
                // 코드전환 제품코드
                ' RTRIM(LTRIM(R.BODY_09)) as BODY_09, ' +
                // 코드전환 제품명
                ' RTRIM(LTRIM(R.BODY_10)) as BODY_10, ' +
                // 고객코드
                ' RTRIM(LTRIM(R.BODY_11)) as BODY_11, ' +
                // 고객명
                ' RTRIM(LTRIM(R.BODY_12)) as BODY_12, ' +
                // 주문번호
                ' RTRIM(LTRIM(R.BODY_13)) as BODY_13, ' +
                // 불출요청 일자
                ' RTRIM(LTRIM(R.BODY_14)) as BODY_14, ' +
                // 불출요청 순번
                ' RTRIM(LTRIM(R.BODY_15)) as BODY_15, ' +
                // 출하지시 번호
                ' RTRIM(LTRIM(R.BODY_16)) as BODY_16, ' +
                // 출하품목 순번
                ' RTRIM(LTRIM(R.BODY_17)) as BODY_17, ' +
                // 재작업지시 번호
                ' RTRIM(LTRIM(R.BODY_18)) as BODY_18, ' +
                // 재작업품목 순번
                ' RTRIM(LTRIM(R.BODY_19)) as BODY_19, ' +
                // 기타입출 번호
                ' RTRIM(LTRIM(R.BODY_20)) as BODY_20, ' +
                // 기타품목 순번
                ' RTRIM(LTRIM(R.BODY_21)) as BODY_21, ' +
                // 랩핑여부
                ' RTRIM(LTRIM(R.BODY_22)) as BODY_22, ' +
                // 처리상태
                ' CASE WHEN R.PROC_STAT = ''0'' THEN ''출고대기'' ' +
                ' WHEN R.PROC_STAT = ''1'' THEN ''출고진행'' ' +
                ' WHEN R.PROC_STAT = ''2'' THEN ''출고완료'' ' +
                ' ELSE '''' END PROC_STAT, ' +
                // 수동처리상태
                ' CASE WHEN R.PROC_MANUAL = ''0'' THEN '''' ' +
                ' WHEN R.PROC_MANUAL = ''1'' THEN ''취소'' ' +
                ' WHEN R.PROC_MANUAL = ''2'' THEN ''출고진행'' ' +
                ' WHEN R.PROC_MANUAL = ''3'' THEN ''출고완료'' ' +
                ' ELSE '''' END PROC_MANUAL, ' +
                // 재고상태
                ' CASE WHEN S.ITEM_LOT is NULL THEN ''재고없음'' ' +
                ' ELSE CASE WHEN K.RACK_STAT = ''재고'' THEN ' +
                ' CASE WHEN K.ORDER_STAT = ''없음'' THEN ' +
                ' CASE WHEN K.ERR_STAT = ''없음'' THEN ''재고있음'' ' +
                ' ELSE K.ERR_STAT END ' +
                ' ELSE K.ORDER_STAT END ' +
				        ' ELSE CASE WHEN K.ORDER_STAT = ''없음'' THEN ' +
				        ' CASE WHEN K.ERR_STAT = ''없음'' THEN ''재고없음'' ' +
				        ' ELSE K.ERR_STAT END ' +
				        ' ELSE K.ORDER_STAT END ' +
				        ' END END as STOCK_EXIST, ' +
                // 제품여부
                ' CASE WHEN S.ITEM_TYPE is NULL THEN '''' ELSE S.ITEM_TYPE END as STOCK_TYPE, ' +
                // 출고위치
                ' CASE WHEN S.RACK_LOC is NULL THEN '''' ELSE S.RACK_BANK + ''-'' + S.RACK_BAY + ''-'' + S.RACK_LEVEL END as STOCK_POS, ' +
                ' CASE WHEN S.RACK_LOC is NULL THEN '''' ELSE S.RACK_LOC  END as RACK_LOC, ' +
                ' CASE WHEN S.RACK_LOC is NULL THEN '''' ELSE S.RACK_HOGI END as RACK_HOGI, ' +
                // 출고가능
                ' CASE WHEN K.OT_USED is NULL THEN '''' ELSE K.OT_USED END as OUT_USED, ' +
                // 입고정보/제품정보
                ' S.IN_SITE, S.IN_DATE, ' +
                ' S.ITEM_LOT, S.ITEM_TYPE, S.ITEM_WEIGHT, S.ITEM_QTY, ' +
                ' S.ITEM_INFO_01, S.ITEM_INFO_02, S.ITEM_INFO_03, S.ITEM_INFO_04, S.ITEM_INFO_05, ' +
                ' S.ITEM_INFO_06, S.ITEM_INFO_07, S.ITEM_INFO_08, S.ITEM_INFO_09, S.ITEM_INFO_10, ' +
                ' S.ITEM_INFO_11, S.ITEM_INFO_12, S.ITEM_INFO_13, S.ITEM_INFO_14, S.ITEM_INFO_15, ' +
                ' S.ITEM_INFO_16, S.ITEM_INFO_17, S.ITEM_INFO_18, S.ITEM_INFO_19, S.ITEM_INFO_20, ' +
                ' S.PLT_CODE, S.MEMO_1, S.MEMO_2, S.MEMO_3, S.MEMO_4, S.MEMO_5 ' +
                '   FROM IF_RECEIVE R WITH (NOLOCK)' +
                '   LEFT JOIN TT_RACK_STOCK S WITH (NOLOCK) ' +
                '     ON RTRIM(LTRIM(R.BODY_03)) = RTRIM(LTRIM(S.ITEM_LOT)) ' +
                '   LEFT JOIN TT_RACK K WITH (NOLOCK) ' +
                '     ON K.RACK_LOC = S.RACK_LOC ' +
                '  WHERE RTRIM(LTRIM(R.TC_CD)) = ''MW001100'' ' + WhereStr +
                '    AND R.PROC_STAT IN (''0'',''1'', ''2'') ) TMP ' +
                ' WHERE 1 = 1 ' + StockStr +
                ' ORDER BY TMP.RECV_DT ';
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'건)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[340] 출고요청 정보 조회 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU340.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU340.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// sbt_OrderClick
//==============================================================================
procedure TfrmU340.sbt_OrderClick(Sender: TObject);
begin
  OrderCreate(0);
  fnCommandQuery ;
end;

//==============================================================================
// OrderCreate
//==============================================================================
procedure TfrmU340.OrderCreate(Mode: Integer);
var
  StrSQL : String;
  StrMsg1, StrMsg2, StrMsg3, StrMsg4, ItemCode, ItemType, TmpHogi, TmpLoc : String;
  OrderData : TTORDER;
  i, RowCnt, JobCnt, OrdCnt : integer;
begin
  // 필드 입력 정보 체크
  if not fnValidCheck then Exit;

  if cbOUT_MODE.ItemIndex = 0 then
  begin // 선택 출고
    RowCnt := dgInfo.SelectedRows.Count ;
    JobCnt := RowCnt - 1;
  end else
  begin // 입력 출고
    AutoOutFlag1 := cbPROC_STAT.ItemIndex;   // 처리상태(출고대기)
    cbPROC_STAT.ItemIndex := 1;
    AutoOutFlag2 := cbSTOCK_EXIST.ItemIndex; // 재고상태(재고있음)
    cbSTOCK_EXIST.ItemIndex := 1;
    AutoOutFlag3 := cbOUT_USED.ItemIndex;    // 출고가능(Y)
    cbOUT_USED.ItemIndex := 1;
    fnCommandQuery;
    dgInfo.SelectedRows.SelectAll;

    RowCnt := StrToIntDef(edtOUT_COUNT.Text, 0);
    if qryInfo.RecordCount < RowCnt then
         JobCnt := qryInfo.RecordCount - 1
    else JobCnt := RowCnt - 1;
  end;

  StrMsg1 := '출고방식 - ' + cbOUT_MODE.Text ;
  StrMsg2 := '출고수량 - ' + IntToStr(RowCnt) + ' / ' + IntToStr(qryInfo.RecordCount) ;
  StrMsg3 := '출고타입 - ' + cbID_TYPE.Text ;
  StrMsg4 := '작업호기 - ' + cbHogi.Text ;

  if MessageDlg('  출고지시를 진행하시겠습니까? ' + #13#10 +
                '  ' + StrMsg1 + #13#10 +
                '  ' + StrMsg2 + #13#10 +
                '  ' + StrMsg3 + #13#10 +
                '  ' + StrMsg4, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  OrdCnt := 0;
  for i := 0 to JobCnt do
  begin
    with dgInfo.DataSource.DataSet do
    begin
      GotoBookmark(Pointer(dgInfo.SelectedRows.Items[i]));
      // 요청구분 체크
      if qryInfo.FieldByName('BODY_02'    ).AsString  = '요청취소' then Continue;
      // 처리상태 체크
      if qryInfo.FieldByName('PROC_STAT'  ).AsString <> '출고대기' then Continue;
      // 재고상태 체크
      if qryInfo.FieldByName('STOCK_EXIST').AsString <> '재고있음' then Continue;
      // 출하가능 체크
      if qryInfo.FieldByName('OUT_USED'   ).AsString <> 'Y'        then Continue;


      OrderData.ID_DATE   := ' CONVERT(VARCHAR(MAX), GETDATE(), 112) ';
      OrderData.ID_TIME   := ' REPLACE(CONVERT(VARCHAR(MAX), GETDATE(), 108), '':'', '''') ';
      OrderData.ID_TYPE   := cbID_TYPE.Text;
      with SP_AUTO_INDEX do
      begin
        Parameters.ParamByName('@Index').Value := '2';
        ExecProc;
        OrderData.ID_INDEX  := Integer(Parameters.ParamValues['@RETURN_VALUE']);
        OrderData.ID_SUBIDX := 1;
      end;
      if cbID_TYPE.Text = '비상출고' then
           OrderData.ID_EMG := 1
      else OrderData.ID_EMG := 0 ;

      tmpHogi := qryInfo.FieldByName('RACK_HOGI').AsString;
      TmpLoc  := qryInfo.FieldByName('RACK_LOC').AsString;

      OrderData.ID_SC        := tmpHogi;
      OrderData.ID_CODE      := TmpLoc;
      OrderData.LOAD_BANK    := Copy(OrderData.ID_CODE, 1, 2) ;
      OrderData.LOAD_BAY     := Copy(OrderData.ID_CODE, 3, 2) ;
      OrderData.LOAD_LEVEL   := Copy(OrderData.ID_CODE, 5, 2) ;
      OrderData.UNLOAD_BANK  := '00';
      OrderData.UNLOAD_BAY   := '00';
      OrderData.UNLOAD_LEVEL := '01'; // 출고 1단, 입고 2단
      OrderData.KIND_1       := '';
      OrderData.KIND_2       := '';
      OrderData.KIND_3       := '';
      OrderData.KIND_4       := '';
      OrderData.KIND_5       := '';
      OrderData.NOW_SITE     := IntToStr(SC_OT_BUFF[StrToInt(OrderData.ID_SC)]);
      OrderData.NOW_MACH     := 'SC';
      OrderData.IN_SITE      := qryInfo.FieldByName('IN_SITE').AsString;
      OrderData.IN_DATE      := qryInfo.FieldByName('IN_DATE').AsString;
      OrderData.OT_SITE      := '194';
      OrderData.OT_DATE      := '';
      OrderData.BCR_CHK      := 0;
      OrderData.STATUS       := '작업대기';
      OrderData.PROCESS      := '';

      //===============================================
      // 제품정보
      //===============================================
      OrderData.ITEM_LOT     := qryInfo.FieldByName('ITEM_LOT'    ).AsString;
      OrderData.ITEM_TYPE    := qryInfo.FieldByName('ITEM_TYPE'   ).AsString;   // 제품여부(반제품, 제품)
      OrderData.ITEM_WEIGHT  := qryInfo.FieldByName('ITEM_WEIGHT' ).AsString;   // 중량
      OrderData.ITEM_QTY     := qryInfo.FieldByName('ITEM_QTY'    ).AsString;   // 수량
      OrderData.ITEM_INFO_01 := qryInfo.FieldByName('ITEM_INFO_01').AsString;   // 제품코드 (검사 완료후 코드 변경 시 이전코드정보를 ITEM_INFO_03, ITEM_INFO_04로 업데이트 후 ITEM_INFO_01, ITEM_INFO_02 변경)
      OrderData.ITEM_INFO_02 := qryInfo.FieldByName('ITEM_INFO_02').AsString;   // 제품명
      OrderData.ITEM_INFO_03 := qryInfo.FieldByName('ITEM_INFO_03').AsString;   // 제품코드(변경전)
      OrderData.ITEM_INFO_04 := qryInfo.FieldByName('ITEM_INFO_04').AsString;   // 제품명(변경전)
      OrderData.ITEM_INFO_05 := qryInfo.FieldByName('ITEM_INFO_05').AsString;   // 생산일시
      OrderData.ITEM_INFO_06 := qryInfo.FieldByName('ITEM_INFO_06').AsString;   // 고객코드
      OrderData.ITEM_INFO_07 := qryInfo.FieldByName('ITEM_INFO_07').AsString;   // 고객명
      OrderData.ITEM_INFO_08 := qryInfo.FieldByName('ITEM_INFO_08').AsString;   // 주문번호
      OrderData.ITEM_INFO_09 := qryInfo.FieldByName('ITEM_INFO_09').AsString;   // 공정라인
      OrderData.ITEM_INFO_10 := qryInfo.FieldByName('ITEM_INFO_10').AsString;   // 판정결과
      OrderData.ITEM_INFO_11 := qryInfo.FieldByName('ITEM_INFO_11').AsString;   // 변경일시(BAG정보 수신)
      OrderData.ITEM_INFO_12 := qryInfo.FieldByName('ITEM_INFO_12').AsString;   // 기타입출번호(판정결과 수신)
      OrderData.ITEM_INFO_13 := qryInfo.FieldByName('ITEM_INFO_13').AsString;   // 검사의뢰일자(판정결과 수신)
      OrderData.ITEM_INFO_14 := qryInfo.FieldByName('ITEM_INFO_14').AsString;   // 검사의뢰순번(판정결과 수신)
      OrderData.ITEM_INFO_15 := qryInfo.FieldByName('ITEM_INFO_15').AsString;   // 검사판정일시(판정결과 수신)
      OrderData.ITEM_INFO_16 := qryInfo.FieldByName('ITEM_INFO_16').AsString;   // 검사LOT(판정결과 수신)
      OrderData.ITEM_INFO_17 := qryInfo.FieldByName('PROC_INFO5'  ).AsString;   // 출고취소구분(R:요청, C:취소)
      OrderData.ITEM_INFO_18 := qryInfo.FieldByName('PROC_INFO4'  ).AsString;   // 출고요청구분(1:생산불출, 3:제품출하, 5:재작업, 9:기타출고)
      OrderData.ITEM_INFO_19 := qryInfo.FieldByName('PROC_INFO3'  ).AsString;   // 출고요청정보(요청일시)
      OrderData.ITEM_INFO_20 := qryInfo.FieldByName('ITEM_INFO_20').AsString;   // 입고예정정보(요청일시)
      OrderData.PLT_CODE     := qryInfo.FieldByName('PLT_CODE'    ).AsString;
      OrderData.WRAP_YN      := qryInfo.FieldByName('BODY_22'     ).AsString;
      OrderData.MEMO_1       := qryInfo.FieldByName('MEMO_1'      ).AsString;
      OrderData.MEMO_2       := qryInfo.FieldByName('MEMO_2'      ).AsString;
      OrderData.MEMO_3       := qryInfo.FieldByName('MEMO_3'      ).AsString;
      OrderData.MEMO_4       := qryInfo.FieldByName('MEMO_4'      ).AsString;
      OrderData.MEMO_5       := qryInfo.FieldByName('MEMO_5'      ).AsString;
      OrderData.ID_USER      := MainDM.M_Info.UserCode;
      OrderData.END_YN       := 'N';
      OrderData.SEND_YN      := 'N';
      OrderData.OR_DT        := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';
      OrderData.UP_DT        := '';
      OrderData.CR_DT        := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';

      if fnOrderDataInsert(OrderData) then
      begin
        inc(OrdCnt);
        // [인터페이스] 출고요청정보 업데이트 (출고진행 상태로 업데이트)
        fnInterfaceUpdate('1', qryInfo.FieldByName('PROC_INFO4').AsString, OrderData.ITEM_INFO_19, OrderData.ITEM_LOT, qryInfo.FieldByName('PROC_INFO1').AsString);
      end;
    end;
  end;
  lblOrderCommand.Caption  := '[ ' + IntToStr(RowCnt) + ' ]';
  lblOrderComplete.Caption := '[ ' + IntToStr(OrdCnt) + ' ]';

  // 수량입력 방식으로 출고 한경우 개수 저장
  if cbOUT_MODE.ItemIndex = 1 then
  begin
    cbPROC_STAT.ItemIndex   := AutoOutFlag1;
    cbSTOCK_EXIST.ItemIndex := AutoOutFlag2;
    cbOUT_USED.ItemIndex    := AutoOutFlag3;

    IniWrite( INI_PATH, 'IO_Info', 'INT_OUT_COUNT', IntToStr(StrToIntDef(edtOUT_COUNT.Text, 0)) );
  end;
end;

//==============================================================================
// fnOrderDataInsert [출고지시 데이터 Insert]
//==============================================================================
function TfrmU340.fnOrderDataInsert(OrderData: TTORDER): Boolean;
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
              QuotedStr(OrderData.OT_DATE)      + ', ' +  // OT_DATE    출고완료 시간
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
        TraceLogWrite('[340] 출고지시 - 타입['+OrderData.ITEM_TYPE+'], 번호['+OrderData.ITEM_LOT+'], 작업['+OrderData.ID_TYPE+'], 위치['+OrderData.ID_CODE+']');
      end else
      begin
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
        TraceLogWrite('[340] 출고지시 - 에러[데이터 생성오류], 타입['+OrderData.ITEM_TYPE+'], 번호['+OrderData.ITEM_LOT+'], 작업['+OrderData.ID_TYPE+'], 위치['+OrderData.ID_CODE+']');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[340] 출고지시 - 에러['+E.Message+'], 타입['+OrderData.ITEM_TYPE+'], 번호['+OrderData.ITEM_LOT+'], 작업['+OrderData.ID_TYPE+'], 위치['+OrderData.ID_CODE+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnInterfaceUpdate
//==============================================================================
function TfrmU340.fnInterfaceUpdate(Mode, IntType, RequestDate, ItemLot, Recv_DT: String): Boolean;
var
  ExecNo : integer;
  StrSQL : String;
begin
  Result := False;
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE IF_RECEIVE ' +
                '    SET PROC_STAT = ' + QuotedStr(Mode) +
                '      , MEMO_01   = ' + QuotedStr(IntType) +
                '      , MEMO_05   = ' + QuotedStr(Recv_DT) +
                '      , UP_DT     = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                '  WHERE RTRIM(LTRIM(TC_CD  )) = ''MW001100'' ' +             // 출고요청정보
                '    AND RTRIM(LTRIM(BODY_02)) <> ''C'' ' +                   // 출고요청구분
                '    AND RTRIM(LTRIM(BODY_03)) = ' + QuotedStr(ItemLot    ) + // 제품번호
                '    AND RTRIM(LTRIM(BODY_04)) = ' + QuotedStr(RequestDate) ; // 요청일시
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then Result := True;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[340] 인터페이스 업데이트 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnValidCheck [입력정보 체크]
//==============================================================================
function TfrmU340.fnValidCheck : Boolean;
begin
  Result := False;
  try
    if (not qryInfo.Active) or
       (qryInfo.RecordCount < 1) or
       ((cbOUT_MODE.ItemIndex = 0) and (dgInfo.SelectedRows.Count < 1)) or
       ((cbOUT_MODE.ItemIndex = 1) and (StrToIntDef(edtOUT_COUNT.Text, 0) < 1)) then
    begin
      MessageDlg('  출고 제품을 선택하지 않았습니다.' + #13#10 +
                 '  제품을 선택 후 진행해 주십시오.', mtConfirmation, [mbYes], 0);
      dgInfo.SetFocus;
      Exit;
    end;
    Result := True;
  except
    on E : Exception do
    begin
      TraceLogWrite('[340] 출고지시 체크 - 에러['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// pmControlPopup
//==============================================================================
procedure TfrmU340.pmControlPopup(Sender: TObject);
begin
  mnJobCancel.Visible := False;// 취소
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;
  if dgInfo.SelectedRows.Count < 1 then Exit ;

  if (MainDM.M_Info.UserAdmin = 'Y') then  // 관리자 권한
  begin
    mnJobCancel.Visible        := True; // 취소
    mnJobStackComplete.Visible := False;// 출고완료
  end else
  begin
    mnJobCancel.Visible        := False;// 취소
    mnJobStackComplete.Visible := False;// 출고완료
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU340.sbtClearClick(Sender: TObject);
begin
  cbBODY_01.ItemIndex   := 0;
  cbPROC_STAT.ItemIndex := 0;
  edtLOT.Text           := ''; // 제품번호
  edtCODE.Text          := ''; // 제품코드
  cbSTOCK_EXIST.ItemIndex := 0;// 재고상태
  cbBODY_22.ItemIndex   := 0;  // 랩핑여부
  edtITEM_INFO_08.Text  := ''; // 주문번호
  edtITEM_INFO_06.Text  := ''; // 고객코드
  cbOUT_USED.ItemIndex  := 0;
  DatePicker1.Date := Now -7;
  TimePicker1.Time := StrToTime('00:00:00');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbtClear2Click
//==============================================================================
procedure TfrmU340.sbtClear2Click(Sender: TObject);
begin
  cbHogi.ItemIndex := 0;
  cbID_TYPE.ItemIndex := 0;
  cbID_TYPE.Color := clWhite;
  cbID_TYPE.Font.Color := clBlack;
  dgInfo.SelectedRows.Clear;
  if cbOUT_MODE.ItemIndex = 0 then
  begin
    edtOUT_COUNT.Text := '선택 0건';
    dgInfo.SetFocus;
  end else
  begin
    edtOUT_COUNT.Text := '';
    edtOUT_COUNT.SetFocus;
  end;
  fnCommandQuery;
end;

//==============================================================================
// tmrQueryTimer
//==============================================================================
procedure TfrmU340.tmrQueryTimer(Sender: TObject);
begin
  try
    tmrQuery.Enabled := False;
    fnCommandQuery;
  finally
    tmrQuery.Enabled := False;
  end;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmU340.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    DatePicker1.SetFocus;
  end;
end;

//==============================================================================
// mnProcClick [취소, 출고완료]
//==============================================================================
procedure TfrmU340.mnProcClick(Sender: TObject);
begin
  // 1 : 취소,  2 : 출고완료
  OrderProcess((Sender as TMenuItem).Tag);
end;

//==============================================================================
// OrderProcess [수동처리]
//==============================================================================
procedure TfrmU340.OrderProcess(Mode: Integer);
var
  SelectInfo_1, SelectInfo_2, SelectInfo_3, SelectInfo_4, SelectInfo_5, SelectInfo_6, TmpType, StrSQL, RowCnt, AddSQL : String;
  ExecNo, i : integer;
begin
  if (not qryInfo.Active) or
     (qryInfo.RecordCount < 1) or
     (dgInfo.SelectedRows.Count < 1) then
  begin
    MessageDlg('  출고요청 정보를 선택하지 않았습니다.' + #13#10 +
               '  수동처리 할 정보를 선택 후 진행해 주십시오.', mtConfirmation, [mbYes], 0);
    dgInfo.SetFocus;
    Exit;
  end;

  RowCnt := IntToStr(dgInfo.SelectedRows.Count) ;

  if      Mode = 1 then TmpType := '취소'
  else if Mode = 2 then TmpType := '출고완료';

  SelectInfo_1 := qryInfo.FieldByName('BODY_04').AsString; // 요청일시(가공 데이터)
  SelectInfo_2 := qryInfo.FieldByName('BODY_03').AsString; // 제품번호(가공 데이터)

  if RowCnt = '1' then
  begin
    if MessageDlg('  요청일시 - [ '+SelectInfo_1 + ' ]' + #13#10 +
                  '  제품번호 - [ '+SelectInfo_2 + ' ]' + #13#10 + #13#10 +
                  '  선택 한 출고요청 정보를 ' + TmpType + '처리 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end else
  begin
    if MessageDlg('  [ ' + RowCnt + ' ] 건의 출고요청 정보를 선택하셨습니다. ' + #13#10 + #13#10 +
                  '  '+TmpType+'처리를 진행하시겠습니까? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end;

  try
    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    for i := 0 to (dgInfo.SelectedRows.Count-1) do
    begin
      with dgInfo.DataSource.DataSet do
      begin
        GotoBookmark(pointer(dgInfo.SelectedRows.Items[i]));

        SelectInfo_1 := qryInfo.FieldByName('PROC_INFO1').AsString; // 수신일시(가공안됨)
        SelectInfo_2 := qryInfo.FieldByName('PROC_INFO2').AsString; // 제품번호(가공안됨)
        SelectInfo_3 := qryInfo.FieldByName('PROC_INFO3').AsString; // 요청일시(가공안됨)
        SelectInfo_4 := qryInfo.FieldByName('BODY_03'   ).AsString; // 제품번호(가공 데이터)
        SelectInfo_5 := qryInfo.FieldByName('BODY_04'   ).AsString; // 요청일시(가공 데이터)
        SelectInfo_6 := qryInfo.FieldByName('PROC_INFO4').AsString; // 요청구분(가공안됨)

        with qryTemp do
        begin
          Close;
          SQL.Clear;
          StrSQL := ' UPDATE IF_RECEIVE ' +
                    '    SET PROC_MANUAL = ' + QuotedStr(IntToStr(Mode)) +
                    '      , MEMO_01     = ''C'' ' +
                    '      , MEMO_05     = ' + QuotedStr(SelectInfo_1) +
                    '      , UP_DT       = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                    '  WHERE RTRIM(LTRIM(TC_CD)) = ''MW001100'' ' +  // 출고요청정보
                    '    AND RECV_DT = ' + QuotedStr(SelectInfo_1) + // 수신일시(가공안됨)
                    '    AND BODY_03 = ' + QuotedStr(SelectInfo_2) + // 제품번호(가공안됨)
                    '    AND BODY_04 = ' + QuotedStr(SelectInfo_3) ; // 요청일시(가공안됨)
          SQL.Text := StrSQL;
          ExecNo := ExecSQL;

          if ExecNo > 0 then
          begin
            Close;
            SQL.Clear;
            StrSQL := ' DELETE FROM IF_RECEIVE ' +
                      '  WHERE RTRIM(LTRIM(TC_CD)) = ''MW001100'' ' +         // 출고요청정보
                      '    AND RECV_DT = ' + QuotedStr(SelectInfo_1) + // 수신일시(가공안됨)
                      '    AND BODY_03 = ' + QuotedStr(SelectInfo_2) + // 제품번호(가공안됨)
                      '    AND BODY_04 = ' + QuotedStr(SelectInfo_3) ; // 요청일시(가공안됨)
            SQL.Text := StrSQL;
            ExecNo := ExecSQL;

            if ExecNo > 0 then
            begin
              TraceLogWrite('[340] 출고요청 정보 취소 - 요청일시['+SelectInfo_5+'], 제품번호['+SelectInfo_4+']');
            end else
            begin
              if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
              MessageDlg( '  작업 수동처리를 실패하였습니다.(STEP1)', mtWarning, [mbYes], 0);
              Exit;
            end;
          end else
          begin
            if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
            MessageDlg( '  작업 수동처리를 실패하였습니다.(STEP2)', mtWarning, [mbYes], 0);
            Exit;
          end;
        end;
      end;
    end;
    if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
    fnCommandQuery;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[340] 출고요청 정보 수동 처리 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// cbOUT_MODEChange
//==============================================================================
procedure TfrmU340.cbOUT_MODEChange(Sender: TObject);
begin
  if (Sender as TComboBox).ItemIndex = 0 then
  begin // 수동선택(수량입력 창 비활성화)
    cbOUT_MODE.Color     := clYellow;
    edtOUT_COUNT.Text    := '';
    edtOUT_COUNT.Color   := $00F5F5F5;
    edtOUT_COUNT.Enabled := False;
    dgInfo.SetFocus;
  end else
  begin // 수량입력(수량입력 창 활성화)
    cbOUT_MODE.Color     := clLime;
    edtOUT_COUNT.Text    := IniRead( INI_PATH, 'IO_Info', 'INT_OUT_COUNT'  ,'' );
    edtOUT_COUNT.Color   := clWhite;
    edtOUT_COUNT.Enabled := True;
    edtOUT_COUNT.SetFocus;
  end;
  IniWrite( INI_PATH, 'IO_Info', 'INT_OUT_MODE', IntToStr((Sender as TComboBox).ItemIndex) );
  dgInfo.SelectedRows.Clear;
end;

//==============================================================================
// cbID_TYPEChange
//==============================================================================
procedure TfrmU340.cbID_TYPEChange(Sender: TObject);
begin
  if cbID_TYPE.ItemIndex = 0 then
  begin
    cbID_TYPE.Color := clWhite;
    cbID_TYPE.Font.Color := clBlack;
  end else
  begin
    cbID_TYPE.Color := $00006200;
    cbID_TYPE.Font.Color := clWhite;
  end;
end;

//==============================================================================
// cbHogiChange
//==============================================================================
procedure TfrmU340.cbHogiChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// dgInfoSelectionChanged
//==============================================================================
procedure TfrmU340.dgInfoSelectionChanged(Sender: TObject);
begin
  if cbOUT_MODE.ItemIndex = 0 then
  begin
    edtOUT_COUNT.Text := '선택 '+IntToStr(dgInfo.SelectedRows.Count)+'건';
  end;
end;

//==============================================================================
// DatePickerChange
//==============================================================================
procedure TfrmU340.DatePickerChange(Sender: TObject);
var
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : Integer;
begin
  TmpDate1 := StrToInt(FormatDateTime('YYYYMMDD' , DatePicker1.Date));
  TmpTime1 := StrToInt(FormatDateTime('HHNNSSZZZ', TimePicker1.Time));
  TmpDate2 := StrToInt(FormatDateTime('YYYYMMDD' , DatePicker2.Date));
  TmpTime2 := StrToInt(FormatDateTime('HHNNSSZZZ', TimePicker2.Time));

  if (TmpDate1 <= TmpDate2) then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU340.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU340.KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    (Sender as TEdit).Text := '';
  end;
end;

//==============================================================================
// cbChange
//==============================================================================
procedure TfrmU340.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU340.cbKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    (Sender as TComboBox).ItemIndex := 0;
    fnCommandQuery;
  end;
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU340.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU340.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU340.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfo do
  begin
    if DataCol = 2 then
    begin
      if Column.Field.DataSet.FieldByName('BODY_01').AsString = '확인불가' then
      begin
        Canvas.Font.Color := clRed;
        Canvas.Font.Style := [fsBold];
      end else
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Font.Style := [];
      end;
    end;

    if DataCol = 3 then
    begin
      if (Column.Field.DataSet.FieldByName('BODY_02').AsString = '요청취소') or
         (Column.Field.DataSet.FieldByName('BODY_02').AsString = '확인불가') then
      begin
        Canvas.Font.Color := clRed;
        Canvas.Font.Style := [fsBold];
      end else
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Font.Style := [];
      end;
    end;

    if DataCol = 4 then
    begin
      if Column.Field.DataSet.FieldByName('PROC_STAT').AsString <> '출고대기' then
      begin
        Canvas.Font.Color := clNavy;
        Canvas.Font.Style := [fsBold];
      end else
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Font.Style := [];
      end;
    end;

    if DataCol = 10 then
    begin
      if Column.Field.DataSet.FieldByName('STOCK_EXIST').AsString = '재고없음' then
      begin
        Canvas.Font.Color := clRed;
        Canvas.Font.Style := [fsBold];
      end else
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Font.Style := [];
      end;
    end;
    dgInfo.defaultdrawcolumncell(rect, datacol, column, state);
  end;
end;


//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU340.dgInfoTitleClick(Column: TColumnEh);
begin
  if Column.Field.DataSet is TADOQuery then
  begin
    with TADOQuery(Column.Field.DataSet) do
    begin
      if RecordCount=0 then Exit ;
      if SrtFlag = 0 then
      begin
        SrtFlag := 1; Sort := Column.FieldName + ' DESC' ;
      end else
      begin
        SrtFlag := 0; Sort := Column.FieldName + ' ASC' ;
      end;
    end;
  end;
end;


{
' CASE WHEN S.ITEM_LOT is NULL THEN ''재고없음'' ' +
'      ELSE CASE WHEN K.RACK_STAT = ''재고'' THEN ' +
'                CASE WHEN K.ORDER_STAT = ''없음'' THEN ' +
'                     CASE WHEN K.ERR_STAT = ''없음'' THEN ''재고있음'' ' +
'                     ELSE K.ERR_STAT END ' +
'                ELSE K.ORDER_STAT END ' +
'       	  ELSE CASE WHEN K.ORDER_STAT = ''없음'' THEN ' +
'                     CASE WHEN K.ERR_STAT = ''없음'' THEN ''재고없음'' ' +
'       				      ELSE K.ERR_STAT END ' +
'       		     ELSE K.ORDER_STAT END ' +
'           END ' +
'      END as STOCK_EXIST, ' + // 재고상태
}

end.
