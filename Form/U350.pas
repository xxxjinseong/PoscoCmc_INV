unit U350;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU350 = class(TForm)
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
    cbBODY_22: TComboBox;
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
  procedure U350Create();

const
  FormNo ='350';

var
  frmU350: TfrmU350;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U350Create
//==============================================================================
procedure U350Create();
begin
  if not Assigned( frmU350 ) then
  begin
    frmU350 := TfrmU350.Create(Application);
    with frmU350 do
    begin
      fnCommandStart;
    end;
  end;
  frmU350.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU350.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU350.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU350.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU350.FormActivate(Sender: TObject);
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
procedure TfrmU350.FormDeactivate(Sender: TObject);
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
procedure TfrmU350.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU350 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU350.fnCommandStart;
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
procedure TfrmU350.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU350.fnCommandExcel;
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
procedure TfrmU350.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU350.fnCommandPrint;
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
procedure TfrmU350.fnCommandQuery;
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
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_05)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_06)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')' ;

  // ????????
  if (Trim(cbITEM_TYPE.Text) <> '????') then
  begin
    if Trim(cbITEM_TYPE.Text) = '??????' then
         WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.MEMO_04)) = ''N'' '
    else WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.MEMO_04)) = ''Y'' ';
  end;

  // ????????
  if (Trim(cbBODY_22.Text) <> '????') then
  begin
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_22)) = ' + QuotedStr(Trim(cbBODY_22.Text));
  end;

  // ????????
  if (Trim(edtITEM_INFO_08.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_13)) LIKE ' + QuotedStr('%'+edtITEM_INFO_08.Text+'%') ;

  // ????????
  if (Trim(edtITEM_INFO_06.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_11)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_12)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ')' ;

  // ????-????
  if (cbHogi.Text <> '????') then
  begin
    if      cbHOGI.ItemIndex = 1 then
      WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) in (''01'', ''02'') '
    else if cbHOGI.ItemIndex = 2 then
      WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) in (''03'', ''04'') '
    else if cbHOGI.ItemIndex = 3 then
      WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) in (''05'', ''06'') ';
  end;

  // ????-??
  if (cbCBank.Text <> '????') then
    WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) = ' + QuotedStr(cbCBank.Text) ;

  // ????-??
  if (cbCBay.Text <> '????') then
    WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 3, 2) = ' + QuotedStr(cbCBay.Text) ;

  // ????-??
  if (cbCLevel.Text <> '????') then
    WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 5, 2) = ' + QuotedStr(cbCLevel.Text) ;

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
      StrSQL := ' SELECT R.RECV_DT as PROC_INFO1, R.BODY_02 as PROC_INFO2, R.BODY_03 as PROC_INFO3, R.BODY_01 as PROC_INFO4, ' +
                // ????????
                ' SUBSTRING(R.RECV_DT, 1, 19) as RECV_DT, ' +
                // ????????
                ' SUBSTRING(R.HS_DT  , 1, 19) as HS_DT, ' +
                // ????????
                ' CASE WHEN RTRIM(LTRIM(R.BODY_01)) = ''1'' THEN ''????????'' ' +
                '      WHEN RTRIM(LTRIM(R.BODY_01)) = ''3'' THEN ''????????'' ' +
                '      WHEN RTRIM(LTRIM(R.BODY_01)) = ''5'' THEN ''??????'' ' +
                '      WHEN RTRIM(LTRIM(R.BODY_01)) = ''9'' THEN ''????????'' ' +
                '      ELSE ''????????'' END as BODY_01, ' +
                // ????????
                ' CASE WHEN RTRIM(LTRIM(R.BODY_02)) = ''R'' THEN ''????????'' ' +
                '      WHEN RTRIM(LTRIM(R.BODY_02)) = ''C'' THEN ''????????'' ' +
                '      ELSE ''????????'' END as BODY_02, ' +
                // ????????
                ' RTRIM(LTRIM(R.BODY_03)) as BODY_03, ' +
                // ????????
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(R.BODY_04)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(R.BODY_04)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_04, ' +
                // ????????
                ' RTRIM(LTRIM(R.BODY_05)) as BODY_05, ' +
                // ??????
                ' RTRIM(LTRIM(R.BODY_06)) as BODY_06, ' +
                // ????
                ' CASE WHEN RTRIM(LTRIM(R.BODY_07)) = '''' or RTRIM(LTRIM(R.BODY_07)) = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(R.BODY_07))) END as BODY_07, ' +  // ????
                // ???????? ?? ????????
                ' RTRIM(LTRIM(R.BODY_08)) as BODY_08, ' +
                // ???????? ????????
                ' RTRIM(LTRIM(R.BODY_09)) as BODY_09, ' +
                // ???????? ??????
                ' RTRIM(LTRIM(R.BODY_10)) as BODY_10, ' +
                // ????????
                ' RTRIM(LTRIM(R.BODY_11)) as BODY_11, ' +
                // ??????
                ' RTRIM(LTRIM(R.BODY_12)) as BODY_12, ' +
                // ????????
                ' RTRIM(LTRIM(R.BODY_13)) as BODY_13, ' +
                // ???????? ????
                ' RTRIM(LTRIM(R.BODY_14)) as BODY_14, ' +
                // ???????? ????
                ' RTRIM(LTRIM(R.BODY_15)) as BODY_15, ' +
                // ???????? ????
                ' RTRIM(LTRIM(R.BODY_16)) as BODY_16, ' +
                // ???????? ????
                ' RTRIM(LTRIM(R.BODY_17)) as BODY_17, ' +
                // ?????????? ????
                ' RTRIM(LTRIM(R.BODY_18)) as BODY_18, ' +
                // ?????????? ????
                ' RTRIM(LTRIM(R.BODY_19)) as BODY_19, ' +
                // ???????? ????
                ' RTRIM(LTRIM(R.BODY_20)) as BODY_20, ' +
                // ???????? ????
                ' RTRIM(LTRIM(R.BODY_21)) as BODY_21, ' +
                // ????????
                ' RTRIM(LTRIM(R.BODY_22)) as BODY_22, ' +
                // ????????
                ' CASE WHEN R.PROC_STAT = ''0'' THEN ''????????'' ' +
                '      WHEN R.PROC_STAT = ''1'' THEN ''????????'' ' +
                '      WHEN R.PROC_STAT = ''2'' THEN ''????????'' ' +
                '      ELSE '''' END PROC_STAT, ' +
                // ????????????(????????)
                ' CASE WHEN R.PROC_MANUAL = ''0'' THEN ''????'' ' +
                '      WHEN R.PROC_MANUAL = ''1'' THEN ''????'' ' +
                '      WHEN R.PROC_MANUAL = ''2'' THEN ''????????'' ' +
                '      WHEN R.PROC_MANUAL = ''3'' THEN ''????????'' ' +
                '      ELSE '''' END PROC_MANUAL, ' +
                // ????????
                ' RTRIM(LTRIM(R.MEMO_04)) as MEMO_04, ' +
                // ????????
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(R.MEMO_02)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(R.MEMO_02)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as MEMO_02, ' +
                // ????????
                ' CASE WHEN SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) = ''01'' or SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) = ''02'' THEN ''1????'' ' +
                '      WHEN SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) = ''03'' or SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) = ''04'' THEN ''2????'' ' +
                '      WHEN SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) = ''05'' or SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) = ''06'' THEN ''3????'' ' +
                '      ELSE '''' END as HOGI, ' +
                // ????????
                ' CASE WHEN RTRIM(LTRIM(R.MEMO_03)) <> '''' THEN ' +
                ' SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 1, 2) + ''-'' + ' +
                ' SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 3, 2) + ''-'' + ' +
                ' SUBSTRING(RTRIM(LTRIM(R.MEMO_03)), 5, 2) ELSE '''' END as MEMO_03, ' +
                // ????????
                ' CASE WHEN S.SEND_YN is NULL THEN ''N'' ELSE S.SEND_YN END as SEND_YN, ' +
                // ????????
                ' CASE WHEN S.HS_DT is NULL THEN '''' ELSE SUBSTRING(S.HS_DT, 1, 19) END as SEND_DT ' +
                '   FROM IF_RECEIVE_OT_RESULT R WITH (NOLOCK) ' +
                '   LEFT JOIN IF_SEND_OT_RESULT S WITH (NOLOCK) ' +
                '     ON RTRIM(LTRIM(R.MEMO_01)) = RTRIM(LTRIM(S.MEMO_01)) ' + // ????????
                '    AND RTRIM(LTRIM(R.RECV_DT)) = RTRIM(LTRIM(S.MEMO_05)) ' + // ????????
                '    AND RTRIM(LTRIM(R.MEMO_03)) = RTRIM(LTRIM(S.BODY_04)) ' + // ????????
                '    AND RTRIM(LTRIM(R.BODY_03)) = RTRIM(LTRIM(S.BODY_03)) ' + // ????????
                '  WHERE RTRIM(LTRIM(R.TC_CD  )) = ''MW001100'' ' + WhereStr +
                '  ORDER BY R.HS_DT ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'??)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[350] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU350.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU350.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU350.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfo do
  begin
    if DataCol = 2 then
    begin
      if (Column.Field.DataSet.FieldByName('BODY_01').AsString = '????????') then
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
      if (Column.Field.DataSet.FieldByName('BODY_02').AsString = '????????') or
         (Column.Field.DataSet.FieldByName('BODY_02').AsString = '????????') then
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
procedure TfrmU350.sbtClearClick(Sender: TObject);
begin
  edtLOT.Text           := '';  // ????????
  edtCODE.Text          := '';  // ????????
  cbITEM_TYPE.ItemIndex := 0;   // ????????
  cbBODY_22.ItemIndex   := 0;   // ????????
  edtITEM_INFO_08.Text  := '';  // ????????
  edtITEM_INFO_06.Text  := '';  // ????????
  cbHogi.ItemIndex      := 0;   // ????????
  cbCBank.ItemIndex     := 0;   // ???? ??
  cbCBay.ItemIndex      := 0;   // ???? ??
  cbCLEvel.ItemIndex    := 0;   // ???? ??
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
procedure TfrmU350.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    DatePicker1.SetFocus;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU350.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU350.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// DatePickerChange
//==============================================================================
procedure TfrmU350.DatePickerChange(Sender: TObject);
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
procedure TfrmU350.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU350.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU350.cbChange(Sender: TObject);
begin
  if (Sender as TComboBox).Tag = 0 then
  begin
    if (Sender as TComboBox).Text <> '????' then
    begin
      cbCBank.Items.Clear;
      cbCBank.Items.Add('????');
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
      cbCBank.Items.Add('????');
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
procedure TfrmU350.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU350.dgInfoTitleClick(Column: TColumnEh);
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

