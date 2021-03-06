unit U320;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU320 = class(TForm)
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
    Panel6: TPanel;
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
  procedure U320Create();

const
  FormNo ='320';

var
  frmU320: TfrmU320;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U320Create
//==============================================================================
procedure U320Create();
begin
  if not Assigned( frmU320 ) then
  begin
    frmU320 := TfrmU320.Create(Application);
    with frmU320 do
    begin
      fnCommandStart;
    end;
  end;
  frmU320.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU320.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU320.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU320.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU320.FormActivate(Sender: TObject);
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
procedure TfrmU320.FormDeactivate(Sender: TObject);
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
procedure TfrmU320.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU320 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU320.fnCommandStart;
begin
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandAdd [????]
//==============================================================================
procedure TfrmU320.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU320.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel(dgInfo, '???????? ????' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU320.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU320.fnCommandPrint;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  fnCommandQuery;
  EhPrint.DBGridEh := dgInfo;
  EhPrint.PageFooter.RightText.Clear;
  EhPrint.PageFooter.RightText.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS',Now()) + '   ' +
                                   MainDM.M_Info.UserCode+' / '+MainDM.M_Info.UserName);
  EhPrint.PageFooter.Font.Name := '????';
  EhPrint.PageFooter.Font.Size := 11;
  EhPrint.Preview;
end;

//==============================================================================
// fnCommandQuery [????]
//==============================================================================
procedure TfrmU320.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // ????????
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_03)) LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // ???????? or ??????
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_04)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_05)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')' ;

  // ????????
  if (Trim(cbITEM_TYPE.Text) <> '????') then
  begin
    if Trim(cbITEM_TYPE.Text) = '??????' then
         WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_12)) = ''N'' '
    else WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_12)) = ''Y'' ';
  end;

  // ????????
  if (Trim(cbIN_SITE.Text) <> '????') then
  begin
    if      cbIN_SITE.ItemIndex = 1 then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_11)) LIKE ' + QuotedStr('%'+Main.GongJungLine1+'%')
    else if cbIN_SITE.ItemIndex = 2 then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_11)) LIKE ' + QuotedStr('%'+Main.GongJungLine2+'%')
    else if cbIN_SITE.ItemIndex = 3 then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_11)) NOT IN (' + QuotedStr(Main.GongJungLine1) + ', ' + QuotedStr(Main.GongJungLine2) + ')';
  end;

  // ????????
  if (Trim(edtITEM_INFO_08.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_10)) LIKE ' + QuotedStr('%'+edtITEM_INFO_08.Text+'%') ;

  // ????????
  if (Trim(edtITEM_INFO_06.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_08)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_09)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ')' ;

  // ????????
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
                ' SUBSTRING(R.RECV_DT, 1, 19) as RECV_DT, ' +                   // ????????
                ' SUBSTRING(R.HS_DT  , 1, 19) as HS_DT, ' +                     // ????????
                ' CASE WHEN RTRIM(LTRIM(R.BODY_01)) = ''R'' THEN ''????????'' ' +        // ????????
                '      WHEN RTRIM(LTRIM(R.BODY_01)) = ''C'' THEN ''????????'' ' +
                '      ELSE '''' END as BODY_01, ' +
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(R.BODY_02)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(R.BODY_02)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_02, ' + // ????????
                ' RTRIM(LTRIM(R.BODY_03)) as BODY_03, ' +                                // ????????
                ' RTRIM(LTRIM(R.BODY_04)) as BODY_04, ' +                                // ????????
                ' RTRIM(LTRIM(R.BODY_05)) as BODY_05, ' +                                // ??????
                ' CASE WHEN RTRIM(LTRIM(R.BODY_06)) = '''' or RTRIM(LTRIM(R.BODY_06)) = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(R.BODY_06))) END as BODY_06, ' +  // ????
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(R.BODY_07)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(R.BODY_07)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_07, ' + // ????????
                ' RTRIM(LTRIM(R.BODY_08)) as BODY_08, ' +                                // ????????
                ' RTRIM(LTRIM(R.BODY_09)) as BODY_09, ' +                                // ??????
                ' RTRIM(LTRIM(R.BODY_10)) as BODY_10, ' +                                // ????????
                ' RTRIM(LTRIM(R.BODY_11)) as BODY_11, ' +                                // ????????
                ' CASE WHEN RTRIM(LTRIM(R.BODY_12)) = ''N'' THEN ''??????'' ' +
                '      WHEN RTRIM(LTRIM(R.BODY_12)) = ''Y'' THEN ''????'' ' +
                '      ELSE '''' END as BODY_12, ' +                            // ????????
                ' CASE WHEN R.PROC_STAT = ''0'' THEN ''????????'' ' +             // ????????
                '      WHEN R.PROC_STAT = ''1'' THEN ''????????'' ' +
                '      WHEN R.PROC_STAT = ''2'' THEN ''????????'' ' +
                '      ELSE '''' END PROC_STAT, ' +
                ' CASE WHEN R.PROC_MANUAL = ''0'' THEN ''????'' ' +               // ????????
                '      WHEN R.PROC_MANUAL = ''1'' THEN ''????'' ' +
                '      WHEN R.PROC_MANUAL = ''2'' THEN ''????????'' ' +
                '      WHEN R.PROC_MANUAL = ''3'' THEN ''????????'' ' +
                '      ELSE '''' END PROC_MANUAL, ' +
                ' R.MEMO_01, ' +                                                  // ???????? ????
                ' R.MEMO_03, ' +                                                  // ???????? ????
                ' SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) + ''-'' + SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 3, 2) + ''-'' + SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 5, 2) as MEMO_04, ' + // ????????
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(R.MEMO_05)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(R.MEMO_05)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as MEMO_05, ' + // ????????
                ' CASE WHEN SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''01'' or SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''02'' THEN ''1????'' ' +
                '      WHEN SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''03'' or SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''04'' THEN ''2????'' ' +
                '      WHEN SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''05'' or SUBSTRING(RTRIM(LTRIM(R.MEMO_04)), 1, 2) = ''06'' THEN ''3????'' ' +
                '      ELSE '''' END as HOGI, ' +  // ????????
                ' CASE WHEN S.SEND_YN is NULL THEN ''N'' ELSE S.SEND_YN END as SEND_YN, ' +
                ' CASE WHEN S.HS_DT is NULL THEN '''' ELSE SUBSTRING(S.HS_DT, 1, 19) END as SEND_DT ' +
                '   FROM IF_RECEIVE_IN_RESULT R WITH (NOLOCK) ' +
                '   LEFT JOIN IF_SEND_IN_RESULT S WITH (NOLOCK) ' +
                '     ON RTRIM(LTRIM(R.MEMO_01)) = RTRIM(LTRIM(S.BODY_01)) ' +  // ????????
                '    AND RTRIM(LTRIM(R.MEMO_02)) = RTRIM(LTRIM(S.BODY_03)) ' +  // ????????
                '    AND RTRIM(LTRIM(R.BODY_03)) = RTRIM(LTRIM(S.BODY_02)) ' +  // ????????
                '  WHERE RTRIM(LTRIM(R.TC_CD  )) = ''MW001300'' ' + WhereStr +
                '    AND R.PROC_STAT in (''0'', ''1'') ' +
                '  ORDER BY R.HS_DT ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'??)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[320] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU320.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU320.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU320.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfo do
  begin
    if DataCol = 4 then
    begin
      if Column.Field.DataSet.FieldByName('PROC_MANUAL').AsString = '????' then
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
procedure TfrmU320.sbtClearClick(Sender: TObject);
begin
  edtLOT.Text           := '';  // ????????
  edtCODE.Text          := '';  // ????????
  cbITEM_TYPE.ItemIndex := 0;   // ????????
  cbIN_SITE.ItemIndex   := 0;   // ????????
  edtITEM_INFO_08.Text  := '';  // ????????
  edtITEM_INFO_06.Text  := '';  // ????????
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
procedure TfrmU320.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    DatePicker1.SetFocus;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU320.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU320.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// DatePickerChange
//==============================================================================
procedure TfrmU320.DatePickerChange(Sender: TObject);
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
procedure TfrmU320.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU320.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU320.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU320.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU320.dgInfoTitleClick(Column: TColumnEh);
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

