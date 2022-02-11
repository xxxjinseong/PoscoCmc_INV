unit U330;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU330 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    qryTemp: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Pnl_Top: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
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
    cbITEM_TYPE: TComboBox;
    cbIN_SITE: TComboBox;
    Panel13: TPanel;
    Panel16: TPanel;
    edtITEM_INFO_06: TEdit;
    edtITEM_INFO_08: TEdit;
    dgInfo: TDBGridEh;
    lblCnt: TLabel;
    PnlIpgoPos: TPanel;
    Panel6: TPanel;
    Panel17: TPanel;
    cbHogi: TComboBox;
    Panel20: TPanel;
    cbCBank: TComboBox;
    cbCBay: TComboBox;
    Panel21: TPanel;
    cbCLevel: TComboBox;
    Panel22: TPanel;
    Panel2: TPanel;
    Panel19: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtChange(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure DatePickerChange(Sender: TObject);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
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
  end;
  procedure U330Create();

const
  FormNo ='330';

var
  frmU330: TfrmU330;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U330Create
//==============================================================================
procedure U330Create();
begin
  if not Assigned( frmU330 ) then
  begin
    frmU330 := TfrmU330.Create(Application);
    with frmU330 do
    begin
      fnCommandStart;
    end;
  end;
  frmU330.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU330.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU330.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU330.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU330.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    fnWmMsgSend( 21211, 111 );
  end else
  begin
    fnWmMsgSend( 22221, 111 );
  end;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU330.FormDeactivate(Sender: TObject);
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
procedure TfrmU330.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU330 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU330.fnCommandStart;
begin
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU330.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU330.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel(dgInfo, '적치실적 조회' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  엑셀 저장을 완료하였습니다.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU330.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU330.fnCommandPrint;
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
procedure TfrmU330.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // 제품번호
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_03)) LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // 제품코드 or 제품명
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_04)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_05)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')' ;

  // 제품여부
  if (Trim(cbITEM_TYPE.Text) <> '전체') then
  begin
    if Trim(cbITEM_TYPE.Text) = '반제품' then
         WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_12)) = ''N'' '
    else WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_12)) = ''Y'' ';
  end;

  // 공정라인
  if (Trim(cbIN_SITE.Text) <> '전체') then
  begin
    if      cbIN_SITE.ItemIndex = 1 then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_11)) LIKE ' + QuotedStr('%'+Main.GongJungLine1+'%')
    else if cbIN_SITE.ItemIndex = 2 then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_11)) LIKE ' + QuotedStr('%'+Main.GongJungLine2+'%')
    else if cbIN_SITE.ItemIndex = 3 then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_11)) NOT IN (' + QuotedStr(Main.GongJungLine1) + ', ' + QuotedStr(Main.GongJungLine2) + ')';
  end;

  // 주문번호
  if (Trim(edtITEM_INFO_08.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_10)) LIKE ' + QuotedStr('%'+edtITEM_INFO_08.Text+'%') ;

  // 고객코드
  if (Trim(edtITEM_INFO_06.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_08)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_09)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ')' ;

  // 적치-호기
  if (cbHogi.Text <> '전체') then
  begin
    if      cbHOGI.ItemIndex = 1 then
      WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) in (''01'', ''02'') '
    else if cbHOGI.ItemIndex = 2 then
      WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) in (''03'', ''04'') '
    else if cbHOGI.ItemIndex = 3 then
      WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) in (''05'', ''06'') ';
  end;

  // 적치-열
  if (cbCBank.Text <> '전체') then
    WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ' + QuotedStr(cbCBank.Text) ;

  // 적치-연
  if (cbCBay.Text <> '전체') then
    WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 3, 2) = ' + QuotedStr(cbCBay.Text) ;

  // 적치-단
  if (cbCLevel.Text <> '전체') then
    WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 5, 2) = ' + QuotedStr(cbCLevel.Text) ;

  // 작업일시
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND R.HS_DT BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                         '                 AND ''' + TmpDate2 + TmpTime2 + ''' ' ;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT R.RECV_DT as PROC_INFO1, R.BODY_02 as PROC_INFO2, R.BODY_03 as PROC_INFO3, ' +
                ' SUBSTRING(R.RECV_DT, 1, 19) as RECV_DT, ' +                     // 수신일시
                ' SUBSTRING(R.HS_DT  , 1, 19) as HS_DT, ' +                       // 작업일시
                ' CASE WHEN RTRIM(LTRIM(R.BODY_01)) = ''R'' THEN ''입고예정'' ' +        // 요청구분
                '      WHEN RTRIM(LTRIM(R.BODY_01)) = ''C'' THEN ''예정취소'' ' +
                '      ELSE '''' END as BODY_01, ' +
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(R.BODY_02)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(R.BODY_02)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_02, ' + // 요청일시
                ' RTRIM(LTRIM(R.BODY_03)) as BODY_03, ' +                                // 제품번호
                ' RTRIM(LTRIM(R.BODY_04)) as BODY_04, ' +                                // 제품코드
                ' RTRIM(LTRIM(R.BODY_05)) as BODY_05, ' +                                // 제품명
                ' CASE WHEN RTRIM(LTRIM(R.BODY_06)) = '''' or RTRIM(LTRIM(R.BODY_06)) = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(R.BODY_06))) END as BODY_06, ' +  // 중량
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(R.BODY_07)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(R.BODY_07)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_07, ' + // 생산일시
                ' RTRIM(LTRIM(R.BODY_08)) as BODY_08, ' +                                // 고객코드
                ' RTRIM(LTRIM(R.BODY_09)) as BODY_09, ' +                                // 고객명
                ' RTRIM(LTRIM(R.BODY_10)) as BODY_10, ' +                                // 주문번호
                ' RTRIM(LTRIM(R.BODY_11)) as BODY_11, ' +                                // 공정라인
                ' CASE WHEN RTRIM(LTRIM(R.BODY_12)) = ''N'' THEN ''반제품'' ' +
                '      WHEN RTRIM(LTRIM(R.BODY_12)) = ''Y'' THEN ''제품'' ' +
                '      ELSE '''' END as BODY_12, ' +                              // 제품구분
                ' CASE WHEN R.PROC_STAT = ''0'' THEN ''입고대기'' ' +             // 실적구분
                '      WHEN R.PROC_STAT = ''1'' THEN ''입고실적'' ' +
                '      WHEN R.PROC_STAT = ''2'' THEN ''적치실적'' ' +
                '      ELSE '''' END PROC_STAT, ' +
                ' CASE WHEN R.PROC_MANUAL = ''0'' THEN ''완료'' ' +               // 완료구분
                '      WHEN R.PROC_MANUAL = ''1'' THEN ''취소'' ' +
                '      WHEN R.PROC_MANUAL = ''2'' THEN ''입고진행'' ' +
                '      WHEN R.PROC_MANUAL = ''3'' THEN ''적치완료'' ' +
                '      ELSE '''' END PROC_MANUAL, ' +
                // 입고실적 구분
                ' R.MEMO_01, ' +
                // 입고일시
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(R.MEMO_02)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(R.MEMO_02)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as MEMO_02, ' +
                // 적치실적 구분
                ' R.MEMO_03, ' +
                // 적치위치
                ' CASE WHEN RTRIM(LTRIM(R.MEMO_04)) <> '''' THEN ' +
                ' SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) + ''-'' + ' +
                ' SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 3, 2) + ''-'' + ' +
                ' SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 5, 2) ELSE ''''END as MEMO_04, ' +
                // 적치호기
                ' CASE WHEN SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''01'' or SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''02'' THEN ''1호기'' ' +
                '      WHEN SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''03'' or SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''04'' THEN ''2호기'' ' +
                '      WHEN SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''05'' or SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''06'' THEN ''3호기'' ' +
                '      ELSE '''' END as HOGI, ' +
                // 전송여부
                ' CASE WHEN S.SEND_YN is NULL THEN ''N'' ELSE S.SEND_YN END as SEND_YN, ' +
                // 전송일시
                ' CASE WHEN S.HS_DT is NULL THEN '''' ELSE SUBSTRING(S.HS_DT, 1, 19) END as SEND_DT ' +
                '   FROM IF_RECEIVE_ST_RESULT R WITH (NOLOCK) ' +
                '   LEFT JOIN IF_SEND_ST_RESULT S WITH (NOLOCK) ' +
                '     ON RTRIM(LTRIM(R.MEMO_03)) = RTRIM(LTRIM(S.BODY_01)) ' + // 실적구분
                '    AND RTRIM(LTRIM(R.MEMO_04)) = RTRIM(LTRIM(S.BODY_03)) ' + // 적치위치
                '    AND RTRIM(LTRIM(R.BODY_03)) = RTRIM(LTRIM(S.BODY_02)) ' + // 제품번호
                '  WHERE RTRIM(LTRIM(R.TC_CD  )) = ''MW001300'' ' + WhereStr +
                '    AND R.PROC_STAT = ''2'' ' +
                '  ORDER BY R.HS_DT ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'건)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[330] 적치실적 조회 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU330.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU330.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU330.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfo do
  begin
    if DataCol = 4 then
    begin
      if Column.Field.DataSet.FieldByName('PROC_MANUAL').AsString = '취소' then
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
// sbtClearClick
//==============================================================================
procedure TfrmU330.sbtClearClick(Sender: TObject);
begin
  edtLOT.Text           := '';  // 제품번호
  edtCODE.Text          := '';  // 제품코드
  cbITEM_TYPE.ItemIndex := 0;   // 제품여부
  cbIN_SITE.ItemIndex   := 0;   // 시작위치
  edtITEM_INFO_08.Text  := '';  // 주문번호
  edtITEM_INFO_06.Text  := '';  // 고객코드
  cbHogi.ItemIndex      := 0;   // 적치호기
  cbCBank.ItemIndex     := 0;   // 적치 열
  cbCBay.ItemIndex      := 0;   // 적치 연
  cbCLEvel.ItemIndex    := 0;   // 적치 단
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmU330.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    DatePicker1.SetFocus;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU330.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU330.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// DatePickerChange
//==============================================================================
procedure TfrmU330.DatePickerChange(Sender: TObject);
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
procedure TfrmU330.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU330.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU330.cbChange(Sender: TObject);
begin
  if (Sender as TComboBox).Tag = 0 then
  begin
    if (Sender as TComboBox).Text <> '전체' then
    begin
      cbCBank.Items.Clear;
      cbCBank.Items.Add('전체');
      if (Sender as TComboBox).ItemIndex = 1 then
      begin
        cbCBank.Items.Add('01');
        cbCBank.Items.Add('02');
      end else
      if (Sender as TComboBox).ItemIndex = 2 then
      begin
        cbCBank.Items.Add('03');
        cbCBank.Items.Add('04');
      end else
      if (Sender as TComboBox).ItemIndex = 3 then
      begin
        cbCBank.Items.Add('05');
        cbCBank.Items.Add('06');
      end;
    end else
    begin
      cbCBank.Items.Clear;
      cbCBank.Items.Add('전체');
      cbCBank.Items.Add('01');
      cbCBank.Items.Add('02');
      cbCBank.Items.Add('03');
      cbCBank.Items.Add('04');
      cbCBank.Items.Add('05');
      cbCBank.Items.Add('06');
    end;
    cbCBank.ItemIndex  := 0;
    cbCBay.ItemIndex   := 0;
    cbCLevel.ItemIndex := 0;
  end;
  fnCommandQuery;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU330.cbKeyPress(Sender: TObject; var Key: Char);
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
// dgInfoTitleClick
//==============================================================================
procedure TfrmU330.dgInfoTitleClick(Column: TColumnEh);
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


end.

