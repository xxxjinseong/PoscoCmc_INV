unit U390;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU390 = class(TForm)
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
    Panel10: TPanel;
    cbITEM_INFO_10: TComboBox;
    Panel13: TPanel;
    Panel16: TPanel;
    edtEmLot: TEdit;
    dgInfo: TDBGridEh;
    lblCnt: TLabel;
    Panel2: TPanel;
    Panel19: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    edtEmDate: TEdit;
    Panel3: TPanel;
    edtEmSeq: TEdit;
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
  procedure U390Create();

const
  FormNo ='390';

var
  frmU390: TfrmU390;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U390Create
//==============================================================================
procedure U390Create();
begin
  if not Assigned( frmU390 ) then
  begin
    frmU390 := TfrmU390.Create(Application);
    with frmU390 do
    begin
      fnCommandStart;
    end;
  end;
  frmU390.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU390.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU390.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU390.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU390.FormActivate(Sender: TObject);
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
procedure TfrmU390.FormDeactivate(Sender: TObject);
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
procedure TfrmU390.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU390 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU390.fnCommandStart;
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
procedure TfrmU390.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU390.fnCommandExcel;
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
procedure TfrmU390.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU390.fnCommandPrint;
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
procedure TfrmU390.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // ????????
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_01)) LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // (??)???????? or (??)????????
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_02)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_04)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')' ;

  // ????????
  if (Trim(cbITEM_INFO_10.Text) <> '????') then
  begin
    if      Trim(cbITEM_INFO_10.Text) = '????' then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_09)) = ''A'' '
    else if Trim(cbITEM_INFO_10.Text) = '??????' then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_09)) = ''F'' '
    else
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_09)) = '''' ';
  end;

  // ????LOT
  if (Trim(edtEmLot.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_10)) LIKE ' + QuotedStr('%'+edtEmLot.Text+'%') ;

  // ????????
  if (Trim(edtEmDate.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_06)) LIKE ' + QuotedStr('%'+edtEmDate.Text+'%') ;

  // ????????
  if (Trim(edtEmSeq.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_07)) LIKE ' + QuotedStr('%'+edtEmSeq.Text+'%') ;

  // ????????
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND R.RECV_DT BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                         '                   AND ''' + TmpDate2 + TmpTime2 + ''' ' ;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ' +
                // ????????
                ' SUBSTRING(R.RECV_DT, 1, 19) as RECV_DT, ' +
                // ????????
                ' RTRIM(LTRIM(R.BODY_01)) as BODY_01, ' +
                // (??)????????
                ' RTRIM(LTRIM(R.BODY_02)) as BODY_02, ' +
                // (??)??????
                ' RTRIM(LTRIM(R.BODY_03)) as BODY_03, ' +
                // (??)????????
                ' RTRIM(LTRIM(R.BODY_04)) as BODY_04, ' +
                // (??)??????
                ' RTRIM(LTRIM(R.BODY_05)) as BODY_05, ' +
                // ????????
                ' RTRIM(LTRIM(R.BODY_06)) as BODY_06, ' +
                // ????????
                ' RTRIM(LTRIM(R.BODY_07)) as BODY_07, ' +
                // ????????
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(R.BODY_08)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(R.BODY_08)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_08, ' +
                // ????????
                ' CASE RTRIM(LTRIM(R.BODY_09)) ' +
                ' WHEN ''A'' THEN ''????'' ' +
                ' WHEN ''F'' THEN ''??????'' ' +
                ' ELSE '''' END as BODY_09, ' +
                // ????LOT
                ' RTRIM(LTRIM(R.BODY_10)) as BODY_10, ' +
                // ????????????????
                ' RTRIM(LTRIM(R.BODY_11)) as BODY_11, ' +
                // ????????????
                ' RTRIM(LTRIM(R.BODY_12)) as BODY_12, ' +
                // ????????
                ' CASE WHEN R.PROC_STAT = ''0'' THEN ''????????'' ' +
                '      WHEN R.PROC_STAT = ''1'' THEN ''????????'' ' +
                '      WHEN R.PROC_STAT = ''2'' THEN ''????????'' ' +
                '      ELSE '''' END PROC_STAT ' +
                '   FROM IF_RECEIVE_EM_RESULT R WITH (NOLOCK) ' +
                '  WHERE RTRIM(LTRIM(R.TC_CD)) = ''MW001900'' ' + WhereStr +
                '  ORDER BY R.RECV_DT ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'??)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[390] ???????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU390.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU390.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU390.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfo do
  begin
    if DataCol = 1 then
    begin
      if Column.Field.DataSet.FieldByName('PROC_STAT').AsString = '????????' then
      begin
        Canvas.Font.Color := clNavy;
        Canvas.Font.Style := [fsBold];
      end else
      if Column.Field.DataSet.FieldByName('PROC_STAT').AsString = '????????' then
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
procedure TfrmU390.sbtClearClick(Sender: TObject);
begin
  edtLOT.Text := '';             // ????????
  edtCODE.Text := '';            // ????????
  cbITEM_INFO_10.ItemIndex := 0; // ????????
  edtEmDate.Text   := '';        // ????????
  edtEmSeq.Text    := '';        // ????????
  edtEmLot.Text    := '';        // ????LOT
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
procedure TfrmU390.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    DatePicker1.SetFocus;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU390.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU390.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// DatePickerChange
//==============================================================================
procedure TfrmU390.DatePickerChange(Sender: TObject);
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
procedure TfrmU390.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU390.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU390.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU390.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU390.dgInfoTitleClick(Column: TColumnEh);
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

