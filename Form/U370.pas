unit U370;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus, System.DateUtils,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU370 = class(TForm)
    dsRequest: TDataSource;
    qryRequest: TADOQuery;
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
    dgRequest: TDBGridEh;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    qryStat: TADOQuery;
    qryOrder: TADOQuery;
    edtCode: TEdit;
    Panel7: TPanel;
    edtLOT: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    Panel24: TPanel;
    Panel12: TPanel;
    Panel10: TPanel;
    cbITEM_TYPE: TComboBox;
    cbITEM_INFO_10: TComboBox;
    Panel13: TPanel;
    Panel16: TPanel;
    edtITEM_INFO_06: TEdit;
    edtITEM_INFO_08: TEdit;
    lblSelCnt: TLabel;
    tmrQuery: TTimer;
    Splitter1: TSplitter;
    dgInfo: TDBGridEh;
    Panel6: TPanel;
    Pnl_Order: TPanel;
    sbt_Order: TSpeedButton;
    qryInfo: TADOQuery;
    dsInfo: TDataSource;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel15: TPanel;
    sbtClear2: TSpeedButton;
    Panel17: TPanel;
    edtLotInput: TEdit;
    Panel18: TPanel;
    cbRequestMode: TComboBox;
    Panel19: TPanel;
    cbReqType: TComboBox;
    Panel20: TPanel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure mnProcClick(Sender: TObject);
    procedure sbtClearClick(Sender: TObject);
    procedure pmControlPopup(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure tmrQueryTimer(Sender: TObject);
    procedure sbt_OrderClick(Sender: TObject);
    procedure cbRequestModeChange(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoSelectionChanged(Sender: TObject);
    procedure edtLotInputKeyPress(Sender: TObject; var Key: Char);
    procedure sbtClear2Click(Sender: TObject);
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
    function  fnRequestDataInsert(rType, rLot, rDate: String): Boolean;
  end;
  procedure U370Create();

const
  FormNo ='370';

var
  frmU370: TfrmU370;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U370Create
//==============================================================================
procedure U370Create();
begin
  if not Assigned( frmU370 ) then
  begin
    frmU370 := TfrmU370.Create(Application);
    with frmU370 do
    begin
      fnCommandStart;
    end;
  end;
  frmU370.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU370.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU370.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU370.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU370.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    fnWmMsgSend( 21211, 111 );
  end else
  begin
    fnWmMsgSend( 22221, 111 );
  end;

  if not tmrQuery.Enabled then tmrQuery.Enabled := True;

  if MainDM.M_Info.UserAdmin = 'Y' then
       Pnl_Order.Visible := True
  else Pnl_Order.Visible := False;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU370.FormDeactivate(Sender: TObject);
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
procedure TfrmU370.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU370 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU370.fnCommandStart;
begin
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandAdd [????]
//==============================================================================
procedure TfrmU370.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU370.fnCommandExcel;
begin
  if not qryRequest.Active then Exit;
  if qryRequest.RecordCount < 1 then Exit;

  if hlbEhgridListExcel(dgRequest, '???????? ????' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU370.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU370.fnCommandPrint;
begin
  if not qryRequest.Active then Exit;
  if qryRequest.RecordCount < 1 then Exit;

  fnCommandQuery;
  EhPrint.DBGridEh := dgRequest;
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
procedure TfrmU370.fnCommandQuery;
var
  WhereStr, StrSQL : String;
begin
  WhereStr := '' ;

  // ????????
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND S.ITEM_LOT LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // ???????? or ??????
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (ITEM_INFO_01 LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      ITEM_INFO_02 LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')' ;

  // ????????
  if (Trim(cbITEM_TYPE.Text) <> '????') then
  begin
    WhereStr := WhereStr + ' AND S.ITEM_TYPE = ' + QuotedStr(Trim(cbITEM_TYPE.Text));
  end;

  // ????????
  if (Trim(cbITEM_INFO_10.Text) <> '????') then
  begin
    if      Trim(cbITEM_INFO_10.Text) = '????' then
      WhereStr := WhereStr + ' AND S.ITEM_INFO_10 = ''A'' '
    else if Trim(cbITEM_INFO_10.Text) = '??????' then
      WhereStr := WhereStr + ' AND S.ITEM_INFO_10 = ''F'' '
    else
      WhereStr := WhereStr + ' AND S.ITEM_INFO_10 = '''' ';
  end;

  // ????????
  if (Trim(edtITEM_INFO_08.Text) <> '') then
    WhereStr := WhereStr + ' AND ITEM_INFO_08 LIKE ' + QuotedStr('%'+edtITEM_INFO_08.Text+'%') ;

  // ????????
  if (Trim(edtITEM_INFO_06.Text) <> '') then
    WhereStr := WhereStr + ' AND (ITEM_INFO_06 LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ' or ' +
                           '      ITEM_INFO_07 LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ')' ;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT S.*, ' +
                // ????????
                ' SUBSTRING(S.RACK_LOC,1,2) + ''-'' + ' +
                ' SUBSTRING(S.RACK_LOC,3,2) + ''-'' + ' +
                ' SUBSTRING(S.RACK_LOC,5,2) as iRACK_LOC, ' +
                // ????
                ' CASE WHEN RTRIM(LTRIM(S.ITEM_WEIGHT)) = '''' or RTRIM(LTRIM(S.ITEM_WEIGHT)) = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(S.ITEM_WEIGHT))) END as tITEM_WEIGHT, ' +
                // ????????
                ' CASE WHEN LEN(ITEM_INFO_05)= 14 THEN CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) ELSE '''' END as tITEM_INFO_05, ' +
                // ????????
                ' CASE ITEM_INFO_10 WHEN ''''  THEN ''??????'' ' +
                '                   WHEN ''A'' THEN ''????'' ' +
                '                   WHEN ''F'' THEN ''??????'' ' +
                '                   ELSE '''' END as iITEM_INFO_10 ' +
                '   FROM TT_RACK_STOCK S WITH (NOLOCK) ' +
                '   LEFT JOIN TT_RACK R WITH (NOLOCK) ' +
                '     ON S.RACK_LOC = R.RACK_LOC ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '    AND R.RACK_STAT = ''????'' ' +
                '    AND R.ORDER_STAT = ''????'' ' +
                '  ORDER BY RACK_LOC ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[370] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;

  try
    with qryRequest do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT S.SEND_DT as PROC_INFO1, S.BODY_02 as PROC_INFO2, S.BODY_03 as PROC_INFO3, ' +
                // ????????
                ' CASE WHEN RTRIM(LTRIM(S.BODY_01)) = ''R'' THEN ''????????'' ' +
                '      WHEN RTRIM(LTRIM(S.BODY_01)) = ''E'' THEN ''????????'' ' +
                '      WHEN RTRIM(LTRIM(S.BODY_01)) = ''C'' THEN ''????????'' ' +
                '      ELSE '''' END as BODY_01, ' +
                // ????????
                ' RTRIM(LTRIM(S.BODY_02)) as BODY_02, ' +
                // ????????
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(S.BODY_03)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(S.BODY_03)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_03, ' +
                // ????????
                ' CASE WHEN L.SEND_YN is NULL THEN ''N'' ELSE L.SEND_YN END as SEND_YN, ' +
                // ????????
                ' CASE WHEN L.HS_DT is NULL THEN '''' ELSE SUBSTRING(L.HS_DT, 1, 19) END as SEND_DT ' +
                '   FROM IF_SEND S WITH (NOLOCK)' +
                '   LEFT JOIN IF_SEND_LT_RESULT L WITH (NOLOCK) ' +
                '     ON RTRIM(LTRIM(S.BODY_02)) = RTRIM(LTRIM(L.BODY_01)) ' +
                '  WHERE RTRIM(LTRIM(S.TC_CD  )) = ''WM001800'' ' +
                '    AND RTRIM(LTRIM(S.BODY_01)) IN (''R'', ''E'') ' +
                '  ORDER BY S.BODY_03 ';
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryRequest.Close;
      TraceLogWrite('[370] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU370.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// sbt_OrderClick
//==============================================================================
procedure TfrmU370.sbt_OrderClick(Sender: TObject);
begin
  OrderCreate(0);
  fnCommandQuery ;
end;

//==============================================================================
// OrderCreate
//==============================================================================
procedure TfrmU370.OrderCreate(Mode: Integer);
var
  StrMsg0, StrMsg1, StrMsg2, tType, tLot, tDate : String;
  i, RowCnt, JobCnt : integer;
begin
  // ???? ???? ???? ????
  if not fnValidCheck then Exit;

  if cbRequestMode.ItemIndex = 0 then
  begin // ???? ????
    RowCnt := dgInfo.SelectedRows.Count ;
    JobCnt := RowCnt - 1;
  end else
  begin // ???? ????
    RowCnt := 1;
    JobCnt := RowCnt -1;
  end;

  StrMsg0 := '???????? - ' + cbReqType.Text ;
  StrMsg1 := '???????? - ' + cbRequestMode.Text ;
  StrMsg2 := '???????? - ' + IntToStr(RowCnt) + '??';

  if MessageDlg('  ???????? ?????? ????????????????? ' + #13#10 +
                '  ' + StrMsg0 + #13#10 +
                '  ' + StrMsg1 + #13#10 +
                '  ' + StrMsg2, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  //=================================
  // ????????
  //=================================
  if cbRequestMode.ItemIndex = 0 then
  begin
    for i := 0 to JobCnt do
    begin
      with dgInfo.DataSource.DataSet do
      begin
        GotoBookmark(Pointer(dgInfo.SelectedRows.Items[i]));

        if cbReqType.ItemIndex = 0 then
             tType := 'R'  // ???????? ????
        else tType := 'E'; // ???????????? ????
        tLot  := qryInfo.FieldByName('ITEM_LOT').AsString;
        tDate := FormatDateTime('YYYYMMDDHHNNSS', Now);
        fnRequestDataInsert(tType, tLot, tDate);
      end;
    end;
  end else
  //=================================
  // ????????
  //=================================
  begin
    if cbReqType.ItemIndex = 0 then
         tType := 'R'  // ???????? ????
    else tType := 'E'; // ???????????? ????
    tLot  := Trim(edtLotInput.Text);
    tDate := FormatDateTime('YYYYMMDDHHNNSS', Now);
    fnRequestDataInsert(tType, tLot, tDate);
  end;
end;

//==============================================================================
// fnOrderDataInsert [???????? ?????? Insert]
//==============================================================================
function TfrmU370.fnRequestDataInsert(rType, rLot, rDate: String): Boolean;
var
  ExecNo : integer;
  StrSQL, tmpType, tmpDate : String;
begin
  Result := False;

  if      rType = 'R' then
    tmpType := '????????'
  else if rType = 'E' then
    tmpType := '????????????'
  else if rType = 'C' then
    tmpType := '????????';

  tmpDate := Copy(rDate,  1, 4) + '-' + Copy(rDate,  5, 2) + '-' + Copy(rDate,  7, 2) + ' ' +
             Copy(rDate,  9, 2) + ':' + Copy(rDate, 11, 2) + ':' + Copy(rDate, 13, 2) ;

  try
    StrSQL := ' INSERT INTO IF_SEND ' +
              ' ( TC_CD, SEND_DT, UP_DT, SEND_YN, ' +
              '   HEADER_01, HEADER_02, HEADER_03, HEADER_04, HEADER_05, HEADER_06, HEADER_07, ' +
              '   HEADER_08, HEADER_09, HEADER_10, HEADER_11, HEADER_12, HEADER_13, ' +
              '   BODY_01, BODY_02, BODY_03 ) ' +
              ' VALUES( ' +
              QuotedStr('WM001800'    ) + ' + ' + ' REPLICATE('' '',   8 - DATALENGTH(' + QuotedStr('WM001800'    ) + ')) , ' +
              ' CONVERT([varchar](max),getdate(),(21)), ' +
              ' '''', ' +
              ' ''N'', ' +
              // ?????? '145'
              // HEADER(????100, ????13??)
			        QuotedStr('WM001800'    ) + ' + ' + ' REPLICATE('' '',   8 - DATALENGTH(' + QuotedStr('WM001800'    ) + ')) , ' +  // TC????
			        QuotedStr('G'           ) + ' + ' + ' REPLICATE('' '',   1 - DATALENGTH(' + QuotedStr('G'           ) + ')) , ' +  // ????????????
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',   3 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ????????????????
			        QuotedStr('G'           ) + ' + ' + ' REPLICATE('' '',   1 - DATALENGTH(' + QuotedStr('G'           ) + ')) , ' +  // ????????????
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',   3 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ????????????????
			        QuotedStr(rDate         ) + ' + ' + ' REPLICATE('' '',  14 - DATALENGTH(' + QuotedStr(rDate         ) + ')) , ' +  // ????????????
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',  14 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ????????????
			        QuotedStr('TEST_0001_01') + ' + ' + ' REPLICATE('' '',  12 - DATALENGTH(' + QuotedStr('TEST_0001_01') + ')) , ' +  // ?????????? ID
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',   1 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ?????????? TYPE
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',   5 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ?????????? SEQ
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',   1 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ?????????? DATA TYPE
			        QuotedStr('145'         ) + ' + ' + ' REPLICATE('' '',   6 - DATALENGTH(' + QuotedStr('145'         ) + ')) , ' +  // ?????????? ????
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',  31 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ????????
			        // BODY(????45, ????3??)
			        QuotedStr(rType         ) + ' + ' + ' REPLICATE('' '',   1 - DATALENGTH(' + QuotedStr(rType         ) + ')) , ' +   // ????????
			        QuotedStr(rLot          ) + ' + ' + ' REPLICATE('' '',  30 - DATALENGTH(' + QuotedStr(rLot          ) + ')) , ' +   // ????????
			        QuotedStr(rDate         ) + ' + ' + ' REPLICATE('' '',  14 - DATALENGTH(' + QuotedStr(rDate         ) + ')) ) ' ;   // ????????

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
        TraceLogWrite('[370] ???????? ???? - ????['+tmpType+'], ????['+rLot+'], ????['+tmpDate+']');
      end else
      begin
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
        TraceLogWrite('[370] ???????? ???? - ????[?????? ????????], ????['+tmpType+'], ????['+rLot+'], ????['+tmpDate+']');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[370] ???????? ???? - ????['+E.Message+'], ????['+tmpType+'], ????['+rLot+'], ????['+tmpDate+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnValidCheck [???????? ????]
//==============================================================================
function TfrmU370.fnValidCheck : Boolean;
begin
  Result := False;
  try
    if ((cbRequestMode.ItemIndex = 0) and (dgInfo.SelectedRows.Count < 1)) or
       ((cbRequestMode.ItemIndex = 1) and (Trim(edtLotInput.Text) = '')) then
    begin
      MessageDlg('  ?????????? ???? ???? ???? ???? ??????????.' + #13#10 +
                 '  ?????????? ???? ???? ???? ?? ?????? ????????.', mtConfirmation, [mbYes], 0);
      if cbRequestMode.ItemIndex = 0 then
           dgInfo.SetFocus
      else edtLotInput.SetFocus;
      Exit;
    end;
    Result := True;
  except
    on E : Exception do
    begin
      TraceLogWrite('[370] ???????? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// pmControlPopup
//==============================================================================
procedure TfrmU370.pmControlPopup(Sender: TObject);
begin
  mnJobCancel.Visible := False;// ????????

  if not qryRequest.Active then Exit;
  if qryRequest.RecordCount < 1 then Exit;
  if dgRequest.SelectedRows.Count < 1 then Exit ;

  if (MainDM.M_Info.UserAdmin = 'Y') then  // ?????? ????
  begin
    mnJobCancel.Visible := True; // ????????
  end else
  begin
    mnJobCancel.Visible := False;// ????????
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU370.sbtClearClick(Sender: TObject);
begin
  edtLOT.Text              := ''; // ????????
  edtCODE.Text             := ''; // ????????
  cbITEM_TYPE.ItemIndex    := 0;  // ????????
  cbITEM_INFO_10.ItemIndex := 0;  // ????????
  edtITEM_INFO_08.Text     := ''; // ????????
  edtITEM_INFO_06.Text     := ''; // ????????
  cbReqType.ItemIndex      := 0;  // ????????
  fnCommandQuery;
end;

//==============================================================================
// sbtClear2Click
//==============================================================================
procedure TfrmU370.sbtClear2Click(Sender: TObject);
begin
  edtLotInput.Text := '';
end;

//==============================================================================
// tmrQueryTimer
//==============================================================================
procedure TfrmU370.tmrQueryTimer(Sender: TObject);
begin
  try
    tmrQuery.Enabled := False;
    fnCommandQuery;
  finally
    tmrQuery.Enabled := False;
  end;
end;

//==============================================================================
// mnProcClick [????, ????????]
//==============================================================================
procedure TfrmU370.mnProcClick(Sender: TObject);
begin
  // 1 : ????
  OrderProcess((Sender as TMenuItem).Tag);
end;

//==============================================================================
// OrderProcess [????????]
//==============================================================================
procedure TfrmU370.OrderProcess(Mode: Integer);
var
  SelectInfo_1, SelectInfo_2, SelectInfo_3, SelectInfo_4, SelectInfo_5,
  RowCnt, tType, tLot, tDate, StrSQL : String;
  i : integer;
begin
  if (not qryRequest.Active) or
     (qryRequest.RecordCount < 1) or
     (dgRequest.SelectedRows.Count < 1) then
  begin
    MessageDlg('  ???? ?????? ???????? ??????????.' + #13#10 +
               '  ???????? ?? ?????? ???? ?? ?????? ????????.', mtConfirmation, [mbYes], 0);
    dgRequest.SetFocus;
    Exit;
  end;

  RowCnt := IntToStr(dgRequest.SelectedRows.Count) ;
  SelectInfo_1 := qryRequest.FieldByName('BODY_02').AsString; // ????????(???? ??????)
  SelectInfo_2 := qryRequest.FieldByName('BODY_03').AsString; // ????????(???? ??????)

  if RowCnt = '1' then
  begin
    if MessageDlg('  ???????? - [ '+SelectInfo_2 + ' ]' + #13#10 +
                  '  ???????? - [ '+SelectInfo_1 + ' ]' + #13#10 + #13#10 +
                  '  ???? ?? ???? ?????? ???????? ?????????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end else
  begin
    if MessageDlg('  [ ' + RowCnt + ' ] ???? ???? ?????? ??????????????. ' + #13#10 + #13#10 +
                  '  ?????????? ????????????????? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end;

  try
    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    for i := 0 to (dgRequest.SelectedRows.Count-1) do
    begin
      with dgRequest.DataSource.DataSet do
      begin
        GotoBookmark(Pointer(dgRequest.SelectedRows.Items[i]));

        tType := 'C';
        tLot  := qryRequest.FieldByName('BODY_02').AsString;
        tDate := FormatDateTime('YYYYMMDDHHNNSS', Now);

        if fnRequestDataInsert(tType, tLot, tDate) then
        begin
          SelectInfo_1 := qryRequest.FieldByName('PROC_INFO1').AsString; // ????????
          SelectInfo_2 := qryRequest.FieldByName('PROC_INFO2').AsString; // ????????(????????)
          SelectInfo_3 := qryRequest.FieldByName('PROC_INFO3').AsString; // ????????(????????)
          SelectInfo_4 := qryRequest.FieldByName('BODY_02'   ).AsString; // ????????(??????????)
          SelectInfo_5 := qryRequest.FieldByName('BODY_03'   ).AsString; // ????????(??????????)

          with qryTemp do
          begin
            Close;
            SQL.Clear;
            StrSQL := ' DELETE FROM IF_SEND ' +
                      '  WHERE RTRIM(LTRIM(TC_CD)) = ''WM001800'' ' +  // ????????????
                      '    AND SEND_DT = ' + QuotedStr(SelectInfo_1) + // ????????
                      '    AND BODY_01 IN (''R'', ''E'') ' +           // ????????
                      '    AND BODY_02 = ' + QuotedStr(SelectInfo_2) + // ????????(????????)
                      '    AND BODY_03 = ' + QuotedStr(SelectInfo_3) ; // ????????(????????)
            SQL.Text := StrSQL;
            ExecSQL;
            Close;
            TraceLogWrite('[370] ???????? ???? - ????[????????], ????['+SelectInfo_4+'], ????['+SelectInfo_5+']');
          end;
        end else
        begin
          if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
          MessageDlg('  ???? ?????????? ??????????????.', mtWarning, [mbYes], 0);
          Exit;
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
      TraceLogWrite('[370] ???????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmU370.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    edtLot.SetFocus;
  end;
end;

//==============================================================================
// dgInfoSelectionChanged
//==============================================================================
procedure TfrmU370.dgInfoSelectionChanged(Sender: TObject);
begin
  lblSelCnt.Caption := '(???? '+IntToStr(dgInfo.SelectedRows.Count)+'??)';
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU370.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU370.KeyPress(Sender: TObject; var Key: Char);
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
// edtLotInputKeyPress
//==============================================================================
procedure TfrmU370.edtLotInputKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    (Sender as TEdit).Text := '';
  end;
end;

//==============================================================================
// cbChange
//==============================================================================
procedure TfrmU370.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU370.cbKeyPress(Sender: TObject; var Key: Char);
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
// cbRequestModeChange
//==============================================================================
procedure TfrmU370.cbRequestModeChange(Sender: TObject);
begin
  edtLotInput.Text := '';
  if (Sender as TcomboBox).Text = '????????' then
  begin
    edtLotInput.Color := $00F5F5F5;
    edtLotInput.Enabled := False;
    (Sender as TcomboBox).Color := clWhite;
  end else
  begin
    edtLotInput.Color := clWhite;
    edtLotInput.Enabled := True;
    (Sender as TcomboBox).Color := clYellow;
  end;
  dgInfo.SelectedRows.Clear;
  dgRequest.SelectedRows.Clear;
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU370.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU370.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU370.dgInfoTitleClick(Column: TColumnEh);
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
