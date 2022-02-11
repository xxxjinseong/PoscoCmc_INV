unit U210;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage ;

type
  TfrmU210 = class(TForm)
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
    dgInfo: TDBGridEh;
    Pnl_Top: TPanel;
    Panel1: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    edtITEM_LOT: TEdit;
    Panel6: TPanel;
    PnlTimer: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    lblTimerStat: TLabel;
    Panel26: TPanel;
    Panel27: TPanel;
    sbtTimerOff: TSpeedButton;
    sbtTimerOn: TSpeedButton;
    tmrQuery: TTimer;
    mnJobComplete: TMenuItem;
    Panel7: TPanel;
    edtID_INDEX: TEdit;
    Panel28: TPanel;
    cbNOW_MACH: TComboBox;
    Panel30: TPanel;
    cbID_SC: TComboBox;
    PnlSelInfo: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel14: TPanel;
    edtvID_INDEX: TEdit;
    Panel15: TPanel;
    edtvITEM_LOT: TEdit;
    PnlManual: TPanel;
    Panel57: TPanel;
    sbtCancel: TSpeedButton;
    Panel38: TPanel;
    sbtComplete: TSpeedButton;
    Panel2: TPanel;
    sbtClear2: TSpeedButton;
    lblSelCnt: TLabel;
    lblCnt: TLabel;
    Panel5: TPanel;
    sbtACComplete: TSpeedButton;
    mnACComplete: TMenuItem;
    qryCVProc: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure ComboChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure pmControlPopup(Sender: TObject);
    procedure tmrQueryTimer(Sender: TObject);
    procedure sbtTimerClick(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure sbtClear2Click(Sender: TObject);
    procedure mnJobProcClick(Sender: TObject);
    procedure sbtJobProcClick(Sender: TObject);
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
    procedure DisplayEditClear;
    procedure OrderProcCheck(Mode: Integer);
    procedure OrderProcUpdate(Mode, ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, STATUS: String);
    function  TrackDelete(ID_DATE, ID_TIME, ID_TYPE, ID_INDEX: String): String;
    procedure TrackDataMove(nowBuff, nextBuff: Integer);
    procedure OrderUpdate(Status, Field, Value : String; nowBuff : integer);
  end;
  procedure U210Create();

const
  FormNo ='210';

var
  frmU210: TfrmU210;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch, ChangeLocation ;

{$R *.dfm}

//==============================================================================
// U210Create
//==============================================================================
procedure U210Create();
begin
  if not Assigned( frmU210 ) then
  begin
    frmU210 := TfrmU210.Create(Application);
    with frmU210 do
    begin
      fnCommandStart;
    end;
  end;
  frmU210.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU210.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU210.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU210.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU210.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;

  if MainDM.M_Info.UserAdmin = 'Y' then
       fnWmMsgSend( 21211, 111 )
  else fnWmMsgSend( 22221, 111 );

  fnCommandQuery ;
  if not tmrQuery.Enabled then tmrQuery.Enabled := True;

  if PnlTimer.Color = clYellow then
  begin
    dgInfo.Options := dgInfo.Options + [dgMultiSelect] ;
    if MainDM.M_Info.UserAdmin = 'Y' then
         PnlManual.Visible := True
    else PnlManual.Visible := False;
  end else
  begin
    dgInfo.Options := dgInfo.Options - [dgMultiSelect] ;
    PnlManual.Visible := False;
  end;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU210.FormDeactivate(Sender: TObject);
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
// FormClose
//==============================================================================
procedure TfrmU210.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU210 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU210.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU210.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU210.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel ( dgInfo , '입고 진행현황' + '_' + FormatDatetime('YYYYMMDD', Now) ) then
  begin
    MessageDlg('  엑셀 저장을 완료하였습니다.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU210.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU210.fnCommandPrint;
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
procedure TfrmU210.fnCommandQuery;
var
  WhereStr, StrSQL : String;
begin
  try
    WhereStr := '' ;
    // 작업번호
    if (Trim(edtID_INDEX.Text) <> '') then
      WhereStr := WhereStr + ' AND O.ID_INDEX LIKE ' + QuotedStr('%'+edtID_INDEX.Text+'%') ;

    // 제품번호
    if (edtITEM_LOT.Text <> '') then
      WhereStr := WhereStr + ' AND O.ITEM_LOT LIKE ' + QuotedStr('%'+edtITEM_LOT.Text+'%') ;

    // 설비구분
    if (cbNOW_MACH.Text <> '전체') then
      WhereStr := WhereStr + ' AND O.NOW_MACH LIKE ' + QuotedStr('%'+cbNOW_MACH.Text+'%') ;

    // 작업호기
    if (cbID_SC.Text <> '전체') then
      WhereStr := WhereStr + ' AND O.ID_SC = ' + QuotedStr(IntToStr(cbID_SC.ItemIndex)) ;

    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT O.ID_DATE, O.ID_TIME, ' +
                ' O.ID_TYPE, O.ID_INDEX, O.OR_DT, ' +
                ' SUBSTRING(O.OR_DT, 1, 19) as tOR_DT, ' +
                ' O.ID_SC + ''호기'' as ID_SC,' +
                ' CASE O.IN_SITE WHEN ''102'' THEN ''1라인(''+O.IN_SITE+'')'' ' +
                '                WHEN ''112'' THEN ''2라인(''+O.IN_SITE+'')'' ' +
                '                WHEN ''120'' THEN ''3라인(''+O.IN_SITE+'')'' ELSE '''' END as SRC_POS, ' +
                ' O.UNLOAD_BANK + ''-'' + O.UNLOAD_BAY + ''-'' + O.UNLOAD_LEVEL as DST_POS, ' +
                ' O.NOW_SITE as NOW_POS, ' +
                ' O.NOW_MACH, ' +
                ' O.ITEM_LOT, O.ITEM_TYPE, O.WRAP_YN, O.ID_USER, O.STATUS, O.PROCESS, ' +
                ' CASE WHEN O.ITEM_WEIGHT = '''' or O.ITEM_WEIGHT = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(O.ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_ORDER O WITH (NOLOCK)' +
                '  WHERE 1 = 1 ' + WhereStr +
                '    AND SUBSTRING(O.ID_TYPE, LEN(O.ID_TYPE)-1, 2) = ''입고'' ' +
                '  ORDER BY O.ID_DATE, O.ID_TIME ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'건)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[210] 입고작업 조회 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU210.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// tmrQueryTimer
//==============================================================================
procedure TfrmU210.tmrQueryTimer(Sender: TObject);
begin
  try
    tmrQuery.Enabled := False;
    fnCommandQuery;
  finally
    if PnlTimer.Color = clLime then tmrQuery.Enabled := True;
  end;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU210.dgInfoCellClick(Column: TColumnEh);
begin
  try
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;

    if PnlTimer.Color = clYellow then
    begin // 자동조회 OFF 상태
      edtvID_INDEX.Text := qryInfo.FieldByName('ID_INDEX').AsString;
      edtvITEM_LOT.Text := qryInfo.FieldByName('ITEM_LOT').AsString;
      LblSelCnt.Caption := '('+IntToStr(dgInfo.SelectedRows.Count)+'건)'
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[210] 입고작업 선택 - 에러['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// pmControlPopup
//==============================================================================
procedure TfrmU210.pmControlPopup(Sender: TObject);
begin
  if qryInfo.RecordCount < 1 then Exit;
  if dgInfo.SelectedRows.Count < 1 then Exit ;

  if (PnlTimer.Color = clYellow) and       // 자동조회 중지
     (MainDM.M_Info.UserAdmin = 'Y') then  // 관리자 권한
  begin
    mnJobCancel.Visible   := True;
    mnJobComplete.Visible := True;
    mnACComplete.Visible  := True;
  end else
  begin
    mnJobCancel.Visible   := False;
    mnJobComplete.Visible := False;
    mnACComplete.Visible  := False;
  end;
end;

//==============================================================================
// ComboChange
//==============================================================================
procedure TfrmU210.ComboChange(Sender: TObject);
begin
  if (Trim((Sender as TComboBox).Text) <> '') then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU210.edtChange(Sender: TObject);
begin
  if (Trim((Sender as TEdit).Text) <> '') then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU210.KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    if PnlTimer.Color = clLime then sbtTimerClick(sbtTimerOff)
    else                            sbtTimerClick(sbtTimerOn);
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU210.sbtClearClick(Sender: TObject);
begin
  edtID_INDEX.Text     := ''; // 작업번호
  edtITEM_LOT.Text     := ''; // 제품번호
  cbNOW_MACH.ItemIndex := 0;  // 작업위치
  cbID_SC.ItemIndex    := 0;  // 작업호기
  edtvID_INDEX.Text    := ''; // 작업번호(선택시)
  edtvITEM_LOT.Text    := ''; // 제품번호(선택시)
  edtID_INDEX.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbtClear2Click
//==============================================================================
procedure TfrmU210.sbtClear2Click(Sender: TObject);
begin
  edtvID_INDEX.Text    := ''; // 작업번호(선택시)
  edtvITEM_LOT.Text    := ''; // 제품번호(선택시)
  dgInfo.SelectedRows.Clear;
  LblSelCnt.Caption := '(0건)';
end;

//==============================================================================
// sbtTimerClick
//==============================================================================
procedure TfrmU210.sbtTimerClick(Sender: TObject);
begin
  if (Sender as TSpeedButton).Tag = 1 then
  begin // 타이머 사용
    PnlTimer.Color := clLime;
    tmrQuery.Enabled := True;
    pmControl.AutoPopup := False;
    lblTimerStat.Caption := 'ON';
    dgInfo.SelectedRows.Clear;
    DisplayEditClear;
    dgInfo.Options := dgInfo.Options - [dgMultiSelect];
    PnlSelInfo.Visible := False;
    PnlManual.Visible  := False;
    LblSelCnt.Caption := '(0건)';
  end else
  begin // 타이머 중지
    PnlTimer.Color := clYellow;
    tmrQuery.Enabled := False;
    pmControl.AutoPopup := True;
    lblTimerStat.Caption := 'OFF';
    dgInfo.Options := dgInfo.Options + [dgMultiSelect];
    if MainDM.M_Info.UserAdmin = 'Y' then
         PnlManual.Visible := True
    else PnlManual.Visible := False;
    PnlSelInfo.Visible := True;
    LblSelCnt.Caption := '(0건)';
  end;
end;

//==============================================================================
// DisplayEditClear
//==============================================================================
procedure TfrmU210.DisplayEditClear;
begin
  edtvID_INDEX.Text := '';
  edtvITEM_LOT.Text := '';
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU210.dgInfoTitleClick(Column: TColumnEh);
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

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmU210.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    if PnlTimer.Color = clLime then sbtTimerClick(sbtTimerOff)
    else                            sbtTimerClick(sbtTimerOn);
  end;
end;

//==============================================================================
// mnJobProcClick
//==============================================================================
procedure TfrmU210.mnJobProcClick(Sender: TObject);
begin
  // 1 : 작업취소,  2 : 작업완료, 3 : SC완료
  OrderProcCheck((Sender as TMenuItem).Tag);
end;

//==============================================================================
// sbtProcClick
//==============================================================================
procedure TfrmU210.sbtJobProcClick(Sender: TObject);
begin
  // 1 : 작업취소,  2 : 작업완료, 3 : SC완료
  OrderProcCheck((Sender as TSpeedButton).Tag);
end;

//==============================================================================
// OrderProcess [수동처리]
//==============================================================================
procedure TfrmU210.OrderProcCheck(Mode: Integer);
var
  ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, TmpType, StrSQL : String;
  SelCnt, RowCnt, ID_BUFF : integer;
begin
  try
    if (not qryInfo.Active) or
       (qryInfo.RecordCount < 1) or
       (dgInfo.SelectedRows.Count < 1) or
       (Trim(edtvID_INDEX.Text) = '') then
    begin
      MessageDlg('  작업을 선택하지 않았습니다.' + #13#10 +
                 '  수동처리 할 작업을 선택 후 진행해 주십시오.', mtConfirmation, [mbYes], 0);
      dgInfo.SetFocus;
      Exit;
    end;

    if      Mode = 1 then TmpType := '취소'
    else if Mode = 2 then TmpType := '완료'
    else if Mode = 3 then TmpType := 'AC완료';

    if (Mode = 3) and (dgInfo.SelectedRows.Count > 1) then
    begin
      MessageDlg('  AC완료 처리는 1건씩 처리 가능합니다.' + #13#10 +
                 '  수동처리 할 작업을 1건 선택 후 진행해 주십시오.', mtConfirmation, [mbYes], 0);
      dgInfo.SetFocus;
      Exit;
    end;

    if (Mode = 3) and (Trim(qryInfo.FieldByName('STATUS').AsString) <> 'AC이동') then
    begin
      MessageDlg('  AC완료 처리는 오토카 진행중인' + #13#10 +
                 '  작업만 처리 가능합니다.' + #13#10 +
                 '  AC이동 상태인 작업을 선택 후 진행해 주십시오.', mtConfirmation, [mbYes], 0);
      dgInfo.SetFocus;
      Exit;
    end;

    ID_INDEX := qryInfo.FieldByName('ID_INDEX').AsString;
    SelCnt   := dgInfo.SelectedRows.Count;

    if SelCnt = 1 then
    begin
      if MessageDlg( '  [ '+ID_INDEX+' ] 번 작업을 '+TmpType+'처리 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
    end else
    begin
      if MessageDlg( '  [ '+ID_INDEX+' ] 번 작업 외 '+IntToStr(SelCnt-1)+'건을 '+TmpType+'처리 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
    end;

    //================================================
    // 취소, 강제완료
    //================================================
    if Mode in [1,2] then
    begin
      for RowCnt := 0 to SelCnt - 1 do
      begin
        with dgInfo.DataSource.DataSet do
        begin
          GotoBookmark(Pointer(dgInfo.SelectedRows.Items[RowCnt]));

          ID_DATE  := qryInfo.FieldByName('ID_DATE' ).AsString;
          ID_TIME  := qryInfo.FieldByName('ID_TIME' ).AsString;
          ID_TYPE  := qryInfo.FieldByName('ID_TYPE' ).AsString;
          ID_INDEX := qryInfo.FieldByName('ID_INDEX').AsString;

          if TmpType = '취소' then
          begin
            OrderProcUpdate('일반수정', ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, '취소');
            OrderProcUpdate('일반삭제', ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, '삭제');
          end else
          if TmpType = '완료' then
          begin
            OrderProcUpdate('일반수정', ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, '강제완료');
            OrderProcUpdate('일반삭제', ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, '삭제');
          end;
          TraceLogWrite('[210] 입고작업 수동처리 - 작업번호['+ID_INDEX+'], 처리구분['+TmpType+']');
        end;
      end;
    end else
    //================================================
    // AC완료
    //================================================
    if Mode = 3 then
    begin
      ID_DATE  := qryInfo.FieldByName('ID_DATE' ).AsString;
      ID_TIME  := qryInfo.FieldByName('ID_TIME' ).AsString;
      ID_TYPE  := qryInfo.FieldByName('ID_TYPE' ).AsString;
      ID_INDEX := qryInfo.FieldByName('ID_INDEX').AsString;
      ID_BUFF  := AC_IN_BUFF[StrToInt(Copy(qryInfo.FieldByName('ID_SC').AsString, 1, 1))];

      //================================
      // 하역위치에 데이터 있는지 체크
      //================================
      try
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          StrSQL := ' SELECT * FROM TT_TRACK WITH (NOLOCK) ' +
                    '   WHERE ID_BUFF = ' + IntToStr(ID_BUFF) +
                    '     AND ID_DATA = 1 ' ;
          SQL.Text := StrSQL;
          Open;
          if not ( Bof and Eof ) then
          begin
            ShowMessage(' 오토카 하역대(' + IntToStr(ID_BUFF) + ')에 데이터가 존재합니다.');
            qryTemp.Close;
            Exit;
          end;
        end;
      except
        on E : Exception do
        begin
          qryTemp.Close;
          TraceLogWrite('[210] 입고작업 수동처리 - 에러['+E.Message+'], 작업번호['+ID_INDEX+'], 처리구분['+TmpType+'], 쿼리['+StrSQL+']');
        end;
      end;

      //====================================================
      // 데이터가 적재위치(124)에 있는 경우
      //====================================================
      if qryInfo.FieldByName('NOW_POS').AsString = '124' then
      begin
        TrackDataMove(124, 198); // 적재위치에서 AC로 데이터 이동
        OrderUpdate('AC이동', 'NOW_SITE', IntToStr(198), 198); // 현재위치 업데이트
      end;
      //====================================================
      // 데이터가 오토카(198)에 있는 경우
      //====================================================
      TrackDataMove(198, ID_BUFF); // AC에서 하역위치로 데이터 이동
      OrderUpdate('AC이동', 'STATUS'  , 'CV이동', ID_BUFF);
      OrderUpdate('CV이동', 'NOW_MACH', 'CV'    , ID_BUFF);
      OrderUpdate('CV이동', 'NOW_SITE', IntToStr(ID_BUFF), ID_BUFF); // 현재위치 업데이트

      TraceLogWrite('[210] 입고작업 수동처리 - 작업번호['+ID_INDEX+'], 처리구분['+TmpType+']');
    end;
    fnCommandQuery;
    sbtTimerClick(sbtTimerOn);
  except
    on E : Exception do
    begin
      TraceLogWrite('[210] 입고작업 수동처리 - 에러['+E.Message+'], 작업번호['+ID_INDEX+'], 처리구분['+TmpType+']');
    end;
  end;
end;

//==============================================================================
// OrderProcessUpdate
//==============================================================================
procedure TfrmU210.OrderProcUpdate(Mode, ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, STATUS: String);
var
  StrSQL : String;
begin
  if Mode = '일반삭제' then
  begin
    StrSQL := ' DELETE FROM TT_ORDER ' +
              '  WHERE ID_DATE  = ''' + ID_DATE  + ''' ' +
              '    AND ID_TIME  = ''' + ID_TIME  + ''' ' +
              '    AND ID_TYPE  = ''' + ID_TYPE  + ''' ' +
              '    AND ID_INDEX = '   + ID_INDEX ;
  end else
  if Mode = '일반수정' then
  begin
    StrSQL := ' UPDATE TT_ORDER ' +
              '    SET PROCESS  = ''' + STATUS   + ''' ' +
              '      , IN_DATE  = CONVERT([varchar](max),getdate(),(21)) ' +
              '  WHERE ID_DATE  = ''' + ID_DATE  + ''' ' +
              '    AND ID_TIME  = ''' + ID_TIME  + ''' ' +
              '    AND ID_TYPE  = ''' + ID_TYPE  + ''' ' +
              '    AND ID_INDEX = '   + ID_INDEX ;
  end else
  if Mode = '상태수정' then
  begin
    StrSQL := ' UPDATE TT_ORDER ' +
              '    SET STATUS   = ''' + STATUS  + ''' ' +
              '  WHERE ID_DATE  = ''' + ID_DATE + ''' ' +
              '    AND ID_TIME  = ''' + ID_TIME + ''' ' +
              '    AND ID_TYPE  = ''' + ID_TYPE  + ''' ' +
              '    AND ID_INDEX = '   + ID_INDEX ;
  end;

  try
    with qryTemp do
    begin
      if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

      Close;
      SQL.Clear;
      SQL.Text := ' SELECT STATUS ' +
                  '   FROM TT_ORDER WITH (NOLOCK) ' +
                  '  WHERE ID_DATE  = ''' + ID_DATE  + ''' ' +
                  '    AND ID_TIME  = ''' + ID_TIME  + ''' ' +
                  '    AND ID_TYPE  = ''' + ID_TYPE  + ''' ' +
                  '    AND ID_INDEX = '   + ID_INDEX ;
      Open;

      if not (Bof and Eof) then
      begin
        Close;
        SQL.Clear;
        SQL.Text := StrSQL ;
        ExecSQL ;

        if STATUS = '삭제' then
        begin
          SQL.Clear;
          SQL.Text := TrackDelete(ID_DATE, ID_TIME, ID_TYPE, ID_INDEX);
          ExecSQL;
        end;
      end;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[210] 입고작업 수동처리 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// TrackDelete                                                                //
//==============================================================================
function TfrmU210.TrackDelete(ID_DATE, ID_TIME, ID_TYPE, ID_INDEX: String): String;
var
  StrSQL : String ;
begin
  try
    Result := '';
    StrSQL := ' UPDATE TT_TRACK ' +
              ' SET ' +
              ' ID_DATA      = ''0'', ' +
	            ' ID_DATE      = '''' , ' +
	            ' ID_TIME      = '''' , ' +
	            ' ID_TYPE      = '''' , ' +
	            ' ID_INDEX     = ''0'', ' +
	            ' ID_SUBIDX    = ''0'', ' +
	            ' ID_EMG       = '''' , ' +
	            ' ID_SC        = '''' , ' +
	            ' ID_CODE      = '''' , ' +
	            ' ID_BANK      = '''' , ' +
	            ' ID_BAY       = '''' , ' +
	            ' ID_LEVEL     = '''' , ' +
	            ' KIND_1       = '''' , ' +
	            ' KIND_2       = '''' , ' +
	            ' KIND_3       = '''' , ' +
	            ' KIND_4       = '''' , ' +
	            ' KIND_5       = '''' , ' +
	            ' IN_SITE      = '''' , ' +
	            ' IN_DATE      = '''' , ' +
	            ' OT_SITE      = '''' , ' +
	            ' OT_DATE      = '''' , ' +
	            ' BCR_CHK      = ''0'', ' +
	            ' STATUS       = '''' , ' +
	            ' PROCESS      = '''' , ' +
	            ' ITEM_LOT     = '''' , ' +
	            ' ITEM_TYPE    = '''' , ' +
	            ' ITEM_WEIGHT  = ''0'', ' +
	            ' ITEM_QTY     = ''0'', ' +
	            ' ITEM_INFO_01 = '''' , ' +
	            ' ITEM_INFO_02 = '''' , ' +
	            ' ITEM_INFO_03 = '''' , ' +
	            ' ITEM_INFO_04 = '''' , ' +
	            ' ITEM_INFO_05 = '''' , ' +
	            ' ITEM_INFO_06 = '''' , ' +
	            ' ITEM_INFO_07 = '''' , ' +
	            ' ITEM_INFO_08 = '''' , ' +
	            ' ITEM_INFO_09 = '''' , ' +
              ' ITEM_INFO_10 = '''' , ' +
              ' ITEM_INFO_11 = '''' , ' +
              ' ITEM_INFO_12 = '''' , ' +
              ' ITEM_INFO_13 = '''' , ' +
              ' ITEM_INFO_14 = '''' , ' +
              ' ITEM_INFO_15 = '''' , ' +
              ' ITEM_INFO_16 = '''' , ' +
              ' ITEM_INFO_17 = '''' , ' +
              ' ITEM_INFO_18 = '''' , ' +
              ' ITEM_INFO_19 = '''' , ' +
              ' ITEM_INFO_20 = '''' , ' +
	            ' PLT_CODE     = '''' , ' +
	            ' WRAP_YN      = ''N'', ' +
	            ' MEMO_1       = '''' , ' +
	            ' MEMO_2       = '''' , ' +
	            ' MEMO_3       = '''' , ' +
	            ' MEMO_4       = '''' , ' +
	            ' MEMO_5       = '''' , ' +
	            ' ID_USER      = '''' , ' +
	            ' UP_DT        = '''' , ' + // 현재버퍼 도착시간
	            ' CR_DT        = ''''   ' + // 입고지시 시간
              ' WHERE ID_DATE  = ''' + ID_DATE + ''' ' +
              '   AND ID_TIME  = ''' + ID_TIME + ''' ' +
              '   AND ID_TYPE  = ''' + ID_TYPE + ''' ' +
              '   AND ID_INDEX = '   + ID_INDEX ;
    Result := StrSQL;
  except
    on E: Exception do
    begin
      TraceLogWrite('[210] 입고작업 수동처리 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU210.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
{
  with dgInfo do
  begin
    if Column.Field.DataSet.FieldByName('ERR_STAT').AsString = 'Y' then
    begin
      Canvas.Font.Color := clRed;
      Canvas.Font.Style := [];
      dgInfo.defaultdrawcolumncell(rect, datacol, column, state);
    end;
  end;
  }
end;

//==============================================================================
// TrackDataMove                                                              //
//==============================================================================
procedure TfrmU210.TrackDataMove(nowBuff, nextBuff: Integer);
var
  StrSQL : String ;
begin
  try
    with qryCVProc do
    begin
      Close;
      SQL.Clear;  // 이동할 버퍼 데이터 체크
      SQL.Text := ' SELECT * FROM TT_TRACK WITH (NOLOCK) ' +
                  '  WHERE ID_BUFF = ' + IntToStr(nextBuff) +
                  '    AND ID_DATA = 0 ';
      Open;

      if not (Eof and Bof) then
      begin
        Close;
        SQL.Clear;
        StrSQL := ' UPDATE TT_TRACK ' +
                  ' SET ' +
                  ' ID_DATA      = HERE.ID_DATA, ' +
	                ' ID_DATE      = HERE.ID_DATE, ' +
	                ' ID_TIME      = HERE.ID_TIME, ' +
	                ' ID_TYPE      = HERE.ID_TYPE, ' +
	                ' ID_INDEX     = HERE.ID_INDEX, ' +
	                ' ID_SUBIDX    = HERE.ID_SUBIDX, ' +
	                ' ID_EMG       = HERE.ID_EMG, ' +
	                ' ID_SC        = HERE.ID_SC, ' +
	                ' ID_CODE      = HERE.ID_CODE, ' +
	                ' ID_BANK      = HERE.ID_BANK, ' +
	                ' ID_BAY       = HERE.ID_BAY, ' +
	                ' ID_LEVEL     = HERE.ID_LEVEL, ' +
	                ' KIND_1       = HERE.KIND_1, ' +
	                ' KIND_2       = HERE.KIND_2, ' +
	                ' KIND_3       = HERE.KIND_3, ' +
	                ' KIND_4       = HERE.KIND_4, ' +
	                ' KIND_5       = HERE.KIND_5, ' +
	                ' IN_SITE      = HERE.IN_SITE, ' + // 입고위치
	                ' IN_DATE      = HERE.IN_DATE, ' + // 입고시간
	                ' OT_SITE      = HERE.OT_SITE, ' + // 출고위치
	                ' OT_DATE      = HERE.OT_DATE, ' + // 출고시간
	                ' BCR_CHK      = HERE.BCR_CHK, ' +
	                ' STATUS       = HERE.STATUS, ' +
	                ' PROCESS      = HERE.PROCESS, ' +
	                ' ITEM_LOT     = HERE.ITEM_LOT, ' +
	                ' ITEM_TYPE    = HERE.ITEM_TYPE, ' +
	                ' ITEM_WEIGHT  = HERE.ITEM_WEIGHT, ' +
	                ' ITEM_QTY     = HERE.ITEM_QTY, ' +
	                ' ITEM_INFO_01 = HERE.ITEM_INFO_01, ' +
	                ' ITEM_INFO_02 = HERE.ITEM_INFO_02, ' +
	                ' ITEM_INFO_03 = HERE.ITEM_INFO_03, ' +
	                ' ITEM_INFO_04 = HERE.ITEM_INFO_04, ' +
	                ' ITEM_INFO_05 = HERE.ITEM_INFO_05, ' +
	                ' ITEM_INFO_06 = HERE.ITEM_INFO_06, ' +
	                ' ITEM_INFO_07 = HERE.ITEM_INFO_07, ' +
	                ' ITEM_INFO_08 = HERE.ITEM_INFO_08, ' +
	                ' ITEM_INFO_09 = HERE.ITEM_INFO_09, ' +
                  ' ITEM_INFO_10 = HERE.ITEM_INFO_10, ' +
                  ' ITEM_INFO_11 = HERE.ITEM_INFO_11, ' +
                  ' ITEM_INFO_12 = HERE.ITEM_INFO_12, ' +
                  ' ITEM_INFO_13 = HERE.ITEM_INFO_13, ' +
                  ' ITEM_INFO_14 = HERE.ITEM_INFO_14, ' +
                  ' ITEM_INFO_15 = HERE.ITEM_INFO_15, ' +
                  ' ITEM_INFO_16 = HERE.ITEM_INFO_16, ' +
                  ' ITEM_INFO_17 = HERE.ITEM_INFO_17, ' +
                  ' ITEM_INFO_18 = HERE.ITEM_INFO_18, ' +
                  ' ITEM_INFO_19 = HERE.ITEM_INFO_19, ' +
                  ' ITEM_INFO_20 = HERE.ITEM_INFO_20, ' +
	                ' PLT_CODE     = HERE.PLT_CODE, ' +
	                ' WRAP_YN      = HERE.WRAP_YN, ' +
	                ' MEMO_1       = HERE.MEMO_1, ' +
	                ' MEMO_2       = HERE.MEMO_2, ' +
	                ' MEMO_3       = HERE.MEMO_3, ' +
	                ' MEMO_4       = HERE.MEMO_4, ' +
	                ' MEMO_5       = HERE.MEMO_5, ' +
	                ' ID_USER      = HERE.ID_USER, ' +
	                ' UP_DT        = CONVERT(VARCHAR(MAX), GETDATE(), 21), ' + // 현재버퍼 도착시간
	                ' CR_DT        = HERE.CR_DT ' +                            // 입고지시 시간
                  ' FROM TT_TRACK NEXT, ' +
                  '      (SELECT * FROM TT_TRACK WITH (NOLOCK) ' +
                  '        WHERE ID_BUFF = ' + IntToStr(nowBuff) + ' AND ID_DATA = ''1'' ) HERE ' +
                  ' WHERE NEXT.ID_BUFF = ' + IntToStr(nextBuff)  + ' AND NEXT.ID_DATA = ''0'' ' ;
        SQL.Text := StrSQL ;
        if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;
        ExecSQL;

        Close;
        SQL.Clear;
        StrSQL := ' UPDATE TT_TRACK ' +
                  ' SET ' +
                  ' ID_DATA      = ''0'', ' +
	                ' ID_DATE      = '''' , ' +
	                ' ID_TIME      = '''' , ' +
	                ' ID_TYPE      = '''' , ' +
	                ' ID_INDEX     = ''0'', ' +
	                ' ID_SUBIDX    = ''0'', ' +
	                ' ID_EMG       = '''' , ' +
	                ' ID_SC        = '''' , ' +
	                ' ID_CODE      = '''' , ' +
	                ' ID_BANK      = '''' , ' +
	                ' ID_BAY       = '''' , ' +
	                ' ID_LEVEL     = '''' , ' +
	                ' KIND_1       = '''' , ' +
	                ' KIND_2       = '''' , ' +
	                ' KIND_3       = '''' , ' +
	                ' KIND_4       = '''' , ' +
	                ' KIND_5       = '''' , ' +
	                ' IN_SITE      = '''' , ' +
	                ' IN_DATE      = '''' , ' +
	                ' OT_SITE      = '''' , ' +
	                ' OT_DATE      = '''' , ' +
	                ' BCR_CHK      = ''0'', ' +
	                ' STATUS       = '''' , ' +
	                ' PROCESS      = '''' , ' +
	                ' ITEM_LOT     = '''' , ' +
	                ' ITEM_TYPE    = '''' , ' +
	                ' ITEM_WEIGHT  = ''0'', ' +
	                ' ITEM_QTY     = ''0'', ' +
	                ' ITEM_INFO_01 = '''' , ' +
	                ' ITEM_INFO_02 = '''' , ' +
	                ' ITEM_INFO_03 = '''' , ' +
	                ' ITEM_INFO_04 = '''' , ' +
	                ' ITEM_INFO_05 = '''' , ' +
	                ' ITEM_INFO_06 = '''' , ' +
	                ' ITEM_INFO_07 = '''' , ' +
	                ' ITEM_INFO_08 = '''' , ' +
	                ' ITEM_INFO_09 = '''' , ' +
                  ' ITEM_INFO_10 = '''' , ' +
                  ' ITEM_INFO_11 = '''' , ' +
                  ' ITEM_INFO_12 = '''' , ' +
                  ' ITEM_INFO_13 = '''' , ' +
                  ' ITEM_INFO_14 = '''' , ' +
                  ' ITEM_INFO_15 = '''' , ' +
                  ' ITEM_INFO_16 = '''' , ' +
                  ' ITEM_INFO_17 = '''' , ' +
                  ' ITEM_INFO_18 = '''' , ' +
                  ' ITEM_INFO_19 = '''' , ' +
                  ' ITEM_INFO_20 = '''' , ' +
	                ' PLT_CODE     = '''' , ' +
	                ' WRAP_YN      = ''N'', ' +
	                ' MEMO_1       = '''' , ' +
	                ' MEMO_2       = '''' , ' +
	                ' MEMO_3       = '''' , ' +
	                ' MEMO_4       = '''' , ' +
	                ' MEMO_5       = '''' , ' +
	                ' ID_USER      = '''' , ' +
	                ' UP_DT        = '''' , ' + // 현재버퍼 도착시간
	                ' CR_DT        = ''''   ' + // 입고지시 시간
                  ' WHERE ID_BUFF = ' + IntToStr(nowBuff) ;
        SQL.Text := StrSQL ;
        ExecSQL;
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
        Close;
      end;
    end;
  except
    on E: Exception do
    begin
      qryCVProc.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[210] 입고작업 수동처리 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// OrderUpdate                                                                //
//==============================================================================
procedure TfrmU210.OrderUpdate(Status, Field, Value : String; nowBuff : integer);
var
  StrSQL : String;
begin
  try
    StrSQL := ' UPDATE TT_ORDER ' +
              '    SET ' + Field + ' = ''' + Value + ''' ' +
              '   FROM TT_ORDER O WITH (NOLOCK) ' +
              '   JOIN TT_TRACK T WITH (NOLOCK) ' +
              '     ON O.STATUS    = ''' + Status + ''' ' +
              '    AND O.ID_DATE   = T.ID_DATE ' +
              '    AND O.ID_TIME   = T.ID_TIME ' +
              '    AND O.ID_INDEX  = T.ID_INDEX ' +
              '    AND O.ID_SUBIDX = T.ID_SUBIDX ' +
              '    AND T.ID_BUFF   = ' + IntToStr(nowBuff);

    with qryCVProc do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryCVProc.Close;
     TraceLogWrite('[210] 입고작업 수동처리 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

end.

