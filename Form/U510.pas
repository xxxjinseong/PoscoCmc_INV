unit U510;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU510 = class(TForm)
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
    Panel6: TPanel;
    DatePicker1: TDateTimePicker;
    TimePicker1: TDateTimePicker;
    Panel15: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel18: TPanel;
    DatePicker2: TDateTimePicker;
    TimePicker2: TDateTimePicker;
    lblCnt: TLabel;
    dgInfo: TDBGridEh;
    edtCode: TEdit;
    Panel1: TPanel;
    edtLOT: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    Panel24: TPanel;
    Panel12: TPanel;
    Panel10: TPanel;
    cbITEM_TYPE: TComboBox;
    Panel13: TPanel;
    Panel19: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    Panel4: TPanel;
    Panel7: TPanel;
    cbHogi: TComboBox;
    Panel20: TPanel;
    cbCBank: TComboBox;
    cbCBay: TComboBox;
    Panel21: TPanel;
    cbCLevel: TComboBox;
    Panel22: TPanel;
    cbIN_SITE: TComboBox;
    Panel5: TPanel;
    Panel16: TPanel;
    edtITEM_INFO_06: TEdit;
    edtITEM_INFO_08: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtClearClick(Sender: TObject);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure edtChange(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure DatePickerChange(Sender: TObject);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
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
  procedure U510Create();

const
  FormNo ='510';

var
  frmU510: TfrmU510;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U510Create
//==============================================================================
procedure U510Create();
begin
  if not Assigned( frmU510 ) then
  begin
    frmU510 := TfrmU510.Create(Application);
    with frmU510 do
    begin
      fnCommandStart;
    end;
  end;
  frmU510.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU510.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU510.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU510.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU510.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    fnWmMsgSend( 21211, 111 );
  end else
  begin
    fnWmMsgSend( 21221, 111 );
  end;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU510.FormDeactivate(Sender: TObject);
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
procedure TfrmU510.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU510 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU510.fnCommandStart;
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
procedure TfrmU510.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU510.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel(dgInfo, '입고 실적 조회' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  엑셀 저장을 완료하였습니다.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU510.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU510.fnCommandPrint;
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
procedure TfrmU510.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // 제품번호
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND H.ITEM_LOT LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // 제품코드
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (H.ITEM_INFO_01 LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      H.ITEM_INFO_02 LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')';
  // 제품여부
  if (Trim(cbITEM_TYPE.Text) <> '전체') then
    WhereStr := WhereStr + ' AND H.ITEM_TYPE = ' + QuotedStr(cbITEM_TYPE.Text) ;

  // 공정라인
  if (Trim(cbIN_SITE.Text) <> '전체') then
  begin
    if      cbIN_SITE.ItemIndex = 1 then
      WhereStr := WhereStr + ' AND H.IN_SITE = ''102'' '
    else if cbIN_SITE.ItemIndex = 2 then
      WhereStr := WhereStr + ' AND H.IN_SITE = ''112'' '
    else if cbIN_SITE.ItemIndex = 3 then
      WhereStr := WhereStr + ' AND H.IN_SITE = ''120'' ';
  end;

  // 주문번호
  if (Trim(edtITEM_INFO_08.Text) <> '') then
    WhereStr := WhereStr + ' AND H.ITEM_INFO_08 LIKE ' + QuotedStr('%'+edtITEM_INFO_08.Text+'%') ;

  // 고객코드
  if (Trim(edtITEM_INFO_06.Text) <> '') then
    WhereStr := WhereStr + ' AND ( H.ITEM_INFO_06 LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ' or ' +
                           '       H.ITEM_INFO_07 LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ')' ;

  // 적치-호기
  if (cbHogi.Text <> '전체') then
    WhereStr := WhereStr + ' AND H.ID_SC = ' + QuotedStr(IntToStr(cbHOGI.ItemIndex)) ;

  // 적치-열
  if (cbCBank.Text <> '전체') then
    WhereStr := WhereStr + ' AND H.UNLOAD_BANK = ' + QuotedStr(cbCBank.Text) ;

  // 적치-연
  if (cbCBay.Text <> '전체') then
    WhereStr := WhereStr + ' AND H.UNLOAD_BAY = ' + QuotedStr(cbCBay.Text) ;

  // 적치-단
  if (cbCLevel.Text <> '전체') then
    WhereStr := WhereStr + ' AND H.UNLOAD_LEVEL = ' + QuotedStr(cbCLevel.Text) ;

  // 작업일시
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND OR_DT BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                         '               AND ''' + TmpDate2 + TmpTime2 + ''' ' ;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT H.*, ' +
                ' H.ID_SC + ''호기'' as HOGI,' +
                ' CASE H.IN_SITE WHEN ''102'' THEN ''1라인(''+H.IN_SITE+'')'' ' +
                '                WHEN ''112'' THEN ''2라인(''+H.IN_SITE+'')'' ' +
                '                WHEN ''120'' THEN ''3라인(''+H.IN_SITE+'')'' ELSE '''' END as SRC_POS, ' +
                ' H.UNLOAD_BANK + ''-'' + UNLOAD_BAY + ''-'' + UNLOAD_LEVEL as DST_RACK, ' +
                ' CASE WHEN H.ITEM_WEIGHT = '''' or H.ITEM_WEIGHT = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(H.ITEM_WEIGHT))) END as tITEM_WEIGHT, ' +
                ' SUBSTRING(H.OR_DT, 1, 19) as tOR_DT, ' +
                ' SUBSTRING(H.IN_DATE, 1, 19) as tIN_DATE, ' +
                ' CASE WHEN LEN(ITEM_INFO_05)= 14 THEN CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) ' +
                '      ELSE '''' END as tITEM_INFO_05 ' + // 생산일시
                '   FROM TT_HISTORY H WITH (NOLOCK)' +
                '  WHERE 1 = 1 ' +
                '    AND SUBSTRING(H.ID_TYPE, LEN(H.ID_TYPE)-1, 2) = ''입고'' ' + WhereStr +
                '  ORDER BY H.OR_DT' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'건)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[510] 입고이력 조회 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU510.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU510.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU510.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
//
end;

//==============================================================================
// ComboChange
//==============================================================================
procedure TfrmU510.cbChange(Sender: TObject);
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
procedure TfrmU510.cbKeyPress(Sender: TObject; var Key: Char);
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
// DatePickerChange
//==============================================================================
procedure TfrmU510.DatePickerChange(Sender: TObject);
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
procedure TfrmU510.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU510.KeyPress(Sender: TObject; var Key: Char);
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
// sbtClearClick
//==============================================================================
procedure TfrmU510.sbtClearClick(Sender: TObject);
begin
  edtLOT.Text           := ''; // 제품번호
  edtCODE.Text          := ''; // 제품코드
  cbITEM_TYPE.ItemIndex := 0;  // 제품여부
  cbIN_SITE.ItemIndex   := 0;  // 시작위치
  edtITEM_INFO_08.Text  := ''; // 주문번호
  edtITEM_INFO_06.Text  := ''; // 고객코드
  cbHogi.ItemIndex      := 0;  // 적치호기
  cbCBank.ItemIndex     := 0;  // 적치 열
  cbCBay.ItemIndex      := 0;  // 적치 연
  cbCLEvel.ItemIndex    := 0;  // 적치 단
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [품목찾기]
//==============================================================================
procedure TfrmU510.sbt_ITEMClick(Sender: TObject);
begin
  frmItemSearch := TfrmItemSearch.Create(Application);
  frmItemSearch.PnlFormName.Caption := '품목 코드 찾기';
  frmItemSearch.Caption := '코드찾기';
  // 품목코드
  frmItemSearch.edtCode.Text := edtCode.Text;
  frmItemSearch.ShowModal ;

  if m.Popup_ItemInfo.ResultCd = 'OK' then
  begin
    edtCode.Text    := m.Popup_ItemInfo.DATA01;
    edtCode.SetFocus;
  end;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmU510.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    edtLOT.SetFocus;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU510.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU510.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU510.dgInfoTitleClick(Column: TColumnEh);
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

