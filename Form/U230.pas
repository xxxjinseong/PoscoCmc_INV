unit U230;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage ;

type
  TfrmU230 = class(TForm)
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
  end;
  procedure U230Create();

const
  FormNo ='230';

var
  frmU230: TfrmU230;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch, ChangeLocation ;

{$R *.dfm}

//==============================================================================
// U230Create
//==============================================================================
procedure U230Create();
begin
  if not Assigned( frmU230 ) then
  begin
    frmU230 := TfrmU230.Create(Application);
    with frmU230 do
    begin
      fnCommandStart;
    end;
  end;
  frmU230.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU230.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU230.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU230.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU230.FormActivate(Sender: TObject);
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
procedure TfrmU230.FormDeactivate(Sender: TObject);
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
procedure TfrmU230.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU230 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU230.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandAdd [????]
//==============================================================================
procedure TfrmU230.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU230.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel ( dgInfo , '???? ????????' + '_' + FormatDatetime('YYYYMMDD', Now) ) then
  begin
    MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU230.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU230.fnCommandPrint;
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
procedure TfrmU230.fnCommandQuery;
var
  WhereStr, StrSQL : String;
begin
  try
    WhereStr := '' ;
    // ????????
    if (Trim(edtID_INDEX.Text) <> '') then
      WhereStr := WhereStr + ' AND O.ID_INDEX LIKE ' + QuotedStr('%'+edtID_INDEX.Text+'%') ;

    // ????????
    if (edtITEM_LOT.Text <> '') then
      WhereStr := WhereStr + ' AND O.ITEM_LOT LIKE ' + QuotedStr('%'+edtITEM_LOT.Text+'%') ;

    // ????????
    if (cbID_SC.Text <> '????') then
      WhereStr := WhereStr + ' AND O.ID_SC = ' + QuotedStr(IntToStr(cbID_SC.ItemIndex)) ;

    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT O.ID_DATE, O.ID_TIME, ' +
                ' O.ID_TYPE, O.ID_INDEX, O.OR_DT, ' +
                ' SUBSTRING(O.OR_DT, 1, 19) as tOR_DT, ' +
                ' O.ID_SC + ''????'' as ID_SC,' +
                ' O.LOAD_BANK + ''-'' + O.LOAD_BAY + ''-'' + O.LOAD_LEVEL as SRC_POS, ' +
                ' O.UNLOAD_BANK + ''-'' + O.UNLOAD_BAY + ''-'' + O.UNLOAD_LEVEL as DST_POS, ' +
                ' O.NOW_SITE as NOW_POS, ' +
                ' O.NOW_MACH, ' +
                ' O.ITEM_LOT, O.ITEM_TYPE, O.WRAP_YN, O.ID_USER, O.STATUS, O.PROCESS, ' +
                ' CASE WHEN O.ITEM_WEIGHT = '''' or O.ITEM_WEIGHT = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(O.ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_ORDER O WITH (NOLOCK)' +
                '  WHERE 1 = 1 ' + WhereStr +
                '    AND SUBSTRING(O.ID_TYPE, LEN(O.ID_TYPE)-1, 2) = ''????'' ' +
                '  ORDER BY O.ID_DATE, O.ID_TIME ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'??)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[230] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU230.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// tmrQueryTimer
//==============================================================================
procedure TfrmU230.tmrQueryTimer(Sender: TObject);
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
procedure TfrmU230.dgInfoCellClick(Column: TColumnEh);
begin
  try
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;

    if PnlTimer.Color = clYellow then
    begin // ???????? OFF ????
      edtvID_INDEX.Text := qryInfo.FieldByName('ID_INDEX').AsString;
      edtvITEM_LOT.Text := qryInfo.FieldByName('ITEM_LOT').AsString;
      LblSelCnt.Caption := '('+IntToStr(dgInfo.SelectedRows.Count)+'??)'
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[230] ???????? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// pmControlPopup
//==============================================================================
procedure TfrmU230.pmControlPopup(Sender: TObject);
begin
  if qryInfo.RecordCount < 1 then Exit;
  if dgInfo.SelectedRows.Count < 1 then Exit ;

  if (PnlTimer.Color = clYellow) and       // ???????? ????
     (MainDM.M_Info.UserAdmin = 'Y') then  // ?????? ????
  begin
    mnJobCancel.Visible      := True;
    mnJobComplete.Visible    := True;
  end else
  begin
    mnJobCancel.Visible      := False;
    mnJobComplete.Visible    := False;
  end;
end;

//==============================================================================
// ComboChange
//==============================================================================
procedure TfrmU230.ComboChange(Sender: TObject);
begin
  if (Trim((Sender as TComboBox).Text) <> '') then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU230.edtChange(Sender: TObject);
begin
  if (Trim((Sender as TEdit).Text) <> '') then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU230.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU230.sbtClearClick(Sender: TObject);
begin
  edtID_INDEX.Text     := ''; // ????????
  edtITEM_LOT.Text     := ''; // ????????
  cbID_SC.ItemIndex    := 0;  // ????????
  edtvID_INDEX.Text    := ''; // ????????(??????)
  edtvITEM_LOT.Text    := ''; // ????????(??????)
  edtID_INDEX.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbtClear2Click
//==============================================================================
procedure TfrmU230.sbtClear2Click(Sender: TObject);
begin
  edtvID_INDEX.Text    := ''; // ????????(??????)
  edtvITEM_LOT.Text    := ''; // ????????(??????)
  dgInfo.SelectedRows.Clear;
  LblSelCnt.Caption := '(0??)';
end;

//==============================================================================
// sbtTimerClick
//==============================================================================
procedure TfrmU230.sbtTimerClick(Sender: TObject);
begin
  if (Sender as TSpeedButton).Tag = 1 then
  begin // ?????? ????
    PnlTimer.Color := clLime;
    tmrQuery.Enabled := True;
    pmControl.AutoPopup := False;
    lblTimerStat.Caption := 'ON';
    dgInfo.SelectedRows.Clear;
    DisplayEditClear;
    dgInfo.Options := dgInfo.Options - [dgMultiSelect];
    PnlSelInfo.Visible := False;
    PnlManual.Visible  := False;
    LblSelCnt.Caption := '(0??)';
  end else
  begin // ?????? ????
    PnlTimer.Color := clYellow;
    tmrQuery.Enabled := False;
    pmControl.AutoPopup := True;
    lblTimerStat.Caption := 'OFF';
    dgInfo.Options := dgInfo.Options + [dgMultiSelect];
    if MainDM.M_Info.UserAdmin = 'Y' then
         PnlManual.Visible := True
    else PnlManual.Visible := False;
    PnlSelInfo.Visible := True;
    LblSelCnt.Caption := '(0??)';
  end;
end;

//==============================================================================
// DisplayEditClear
//==============================================================================
procedure TfrmU230.DisplayEditClear;
begin
  edtvID_INDEX.Text := '';
  edtvITEM_LOT.Text := '';
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU230.dgInfoTitleClick(Column: TColumnEh);
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
procedure TfrmU230.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    if PnlTimer.Color = clLime then sbtTimerClick(sbtTimerOff)
    else                            sbtTimerClick(sbtTimerOn);
  end;
end;

//==============================================================================
// mnJobCancelClick [????????]
//==============================================================================
procedure TfrmU230.mnJobProcClick(Sender: TObject);
begin
  // 1 : ????????,  2 : ????????
  OrderProcCheck((Sender as TMenuItem).Tag);
end;

//==============================================================================
// sbtCancelClick [????????]
//==============================================================================
procedure TfrmU230.sbtJobProcClick(Sender: TObject);
begin
  // 1 : ????????,  2 : ????????
  OrderProcCheck((Sender as TSpeedButton).Tag);
end;

//==============================================================================
// OrderProcess [????????]
//==============================================================================
procedure TfrmU230.OrderProcCheck(Mode: Integer);
var
  ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, TmpType : String;
  SelCnt, RowCnt : integer;
begin
  try
    if (not qryInfo.Active) or
       (qryInfo.RecordCount < 1) or
       (dgInfo.SelectedRows.Count < 1) or
       (Trim(edtvID_INDEX.Text) = '') then
    begin
      MessageDlg('  ?????? ???????? ??????????.' + #13#10 +
                 '  ???????? ?? ?????? ???? ?? ?????? ????????.', mtConfirmation, [mbYes], 0);
      dgInfo.SetFocus;
      Exit;
    end;

    if Mode = 1 then TmpType := '????' else TmpType := '????';

    ID_INDEX := qryInfo.FieldByName('ID_INDEX').AsString;
    SelCnt   := dgInfo.SelectedRows.Count;

    if SelCnt = 1 then
    begin
      if MessageDlg( '  [ '+ID_INDEX+' ] ?? ?????? '+TmpType+'???? ?????????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
    end else
    begin
      if MessageDlg( '  [ '+ID_INDEX+' ] ?? ???? ?? '+IntToStr(SelCnt-1)+'???? '+TmpType+'???? ?????????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
    end;

    //================================================
    // ????, ????????
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

          if TmpType = '????' then
          begin
            OrderProcUpdate('????????', ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, '????');
            OrderProcUpdate('????????', ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, '????');
          end else
          if TmpType = '????' then
          begin
            OrderProcUpdate('????????', ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, '????????');
            OrderProcUpdate('????????', ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, '????');
          end;
          TraceLogWrite('[230] ???????? ???????? - ????????['+ID_INDEX+'], ????????['+TmpType+']');
        end;
      end;
    end;
    fnCommandQuery;
    sbtTimerClick(sbtTimerOn);
  except
    on E : Exception do
    begin
      TraceLogWrite('[230] ???????? ???????? - ????['+E.Message+'], ????????['+ID_INDEX+'], ????????['+TmpType+']');
    end;
  end;
end;

//==============================================================================
// OrderProcessUpdate
//==============================================================================
procedure TfrmU230.OrderProcUpdate(Mode, ID_DATE, ID_TIME, ID_TYPE, ID_INDEX, STATUS: String);
var
  StrSQL : String;
begin
  if Mode = '????????' then
  begin
    StrSQL := ' DELETE FROM TT_ORDER ' +
              '  WHERE ID_DATE  = ''' + ID_DATE  + ''' ' +
              '    AND ID_TIME  = ''' + ID_TIME  + ''' ' +
              '    AND ID_TYPE  = ''' + ID_TYPE  + ''' ' +
              '    AND ID_INDEX = '   + ID_INDEX ;
  end else
  if Mode = '????????' then
  begin
    StrSQL := ' UPDATE TT_ORDER ' +
              '    SET PROCESS  = ''' + STATUS   + ''' ' +
              '      , IN_DATE = CONVERT([varchar](max),getdate(),(21)) ' +
              '  WHERE ID_DATE  = ''' + ID_DATE  + ''' ' +
              '    AND ID_TIME  = ''' + ID_TIME  + ''' ' +
              '    AND ID_TYPE  = ''' + ID_TYPE  + ''' ' +
              '    AND ID_INDEX = '   + ID_INDEX ;
  end else
  if Mode = '????????' then
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

        if STATUS = '????' then
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
      TraceLogWrite('[230] ???????? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// TrackDelete                                                                //
//==============================================================================
function TfrmU230.TrackDelete(ID_DATE, ID_TIME, ID_TYPE, ID_INDEX: String): String;
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
	            ' UP_DT        = '''' , ' + // ???????? ????????
	            ' CR_DT        = ''''   ' + // ???????? ????
              ' WHERE ID_DATE  = ''' + ID_DATE + ''' ' +
              '   AND ID_TIME  = ''' + ID_TIME + ''' ' +
              '   AND ID_TYPE  = ''' + ID_TYPE + ''' ' +
              '   AND ID_INDEX = '   + ID_INDEX ;
    Result := StrSQL;
  except
    on E: Exception do
    begin
      TraceLogWrite('[230] ???????? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU230.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
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

end.

