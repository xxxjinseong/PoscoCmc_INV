unit U440;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons,
  Vcl.ComCtrls ;

type
  TfrmU440 = class(TForm)
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    EhPrint: TPrintDBGridEh;
    qryInfoSub: TADOQuery;
    dsInfoSub: TDataSource;
    chkGridSub: TCheckBox;
    chkGridMain: TCheckBox;
    Panel1: TPanel;
    edtLOT: TEdit;
    Panel4: TPanel;
    edtCode: TEdit;
    Panel10: TPanel;
    edtRowHeight: TEdit;
    Panel12: TPanel;
    Panel6: TPanel;
    sbt_ITEM: TSpeedButton;
    edtFontSize: TEdit;
    udRowHeight: TUpDown;
    udFontSize: TUpDown;
    Panel15: TPanel;
    cbRACK_STAT: TComboBox;
    Panel16: TPanel;
    cbITEM_TYPE: TComboBox;
    dgInfo: TDBGridEh;
    dgInfoSub: TDBGridEh;
    lblCnt: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtKeyPress(Sender: TObject; var Key: Char);
    procedure edtChange(Sender: TObject);
    procedure sbtClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pnl_MainResize(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure dgInfoSubDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure chkGridSubClick(Sender: TObject);
    procedure chkGridMainClick(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
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
    procedure fnCommandQuerySub(Code:String);
  end;
  procedure U440Create();

var
  frmU440: TfrmU440;

  implementation

uses Main, ItemSearch;

{$R *.dfm}

//==============================================================================
// U440Create
//==============================================================================
procedure U440Create();
begin
  if not Assigned( frmU440 ) then
  begin
    frmU440 := TfrmU440.Create(Application);
    with frmU440 do
    begin
      fnCommandStart;
    end;
  end;
  frmU440.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU440.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU440.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU440.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    fnWmMsgSend( 21211, 111 );
  end else
  begin
    fnWmMsgSend( 21211, 111 );
  end;
  fnCommandQuery ;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU440.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : Integer;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i] is TTimer) then
       (Self.Components[i] as TTimer).Enabled := False ;
    if (Self.Components[i] is TADOQuery) then
       (Self.Components[i] as TADOQuery).Active := False ;
  end;

  Action := Cafree;
  try frmU440 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart
//==============================================================================
procedure TfrmU440.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandAdd
//==============================================================================
procedure TfrmU440.fnCommandAdd;
begin
//
end;

//==============================================================================
// fnCommandClose
//==============================================================================
procedure TfrmU440.fnCommandClose;
begin
  Close;
end;


//==============================================================================
// fnCommandDelete
//==============================================================================
procedure TfrmU440.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandExcel
//==============================================================================
procedure TfrmU440.fnCommandExcel;
begin
  if (not chkGridMain.Checked) and (not chkGridSub.Checked)  then
  begin
    MessageDlg('  ???????? ???????? ?????? ????????.', mtConfirmation, [mbOk], 0);
    Exit;
  end;

  if (chkGridMain.Checked) and (not chkGridSub.Checked) then
  begin
    if hlbEhgridListExcel ( dgInfo , 'LOT?? ???? ????' + '_' + FormatDatetime('YYYYMMDD', Now) ) then
    begin
      MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
    end;
  end else
  begin
    if hlbEhgridListExcel ( dgInfoSub , 'LOT?? ???? ????(????)' + '_' + FormatDatetime('YYYYMMDD', Now) ) then
    begin
      MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
    end;
  end;
end;

//==============================================================================
// fnCommandPrint
//==============================================================================
procedure TfrmU440.fnCommandPrint;
begin
  if not qryInfo.Active then Exit;

  if (not chkGridMain.Checked) and (not chkGridSub.Checked)  then
  begin
    MessageDlg('  ?????? ???????? ?????? ????????.', mtConfirmation, [mbOk], 0);
    Exit;
  end;

//  fnCommandQuery;
  if (chkGridMain.Checked) and (not chkGridSub.Checked) then
  begin
    EhPrint.DBGridEh := dgInfo;
  end
  else if (not chkGridMain.Checked) and (chkGridSub.Checked) then
  begin
    EhPrint.DBGridEh := dgInfoSub;
  end;
  EhPrint.PageFooter.RightText.Clear;
  EhPrint.PageFooter.RightText.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS',Now()) + '   ' +
                                   MainDM.M_Info.UserCode+' / '+MainDM.M_Info.UserName);
  EhPrint.PageFooter.Font.Name := '????';
  EhPrint.PageFooter.Font.Size := 11;
  EhPrint.Preview;
end;

//==============================================================================
// fnCommandQuery
//==============================================================================
procedure TfrmU440.fnCommandQuery;
var
  StrSQL, WhereStr : String;
begin
  WhereStr := '';

  // LOT
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND ITEM_LOT LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // ????????
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (ITEM_INFO_01 LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      ITEM_INFO_02 LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')' ;

  // ????????
  if (Trim(cbRACK_STAT.Text) <> '????' ) then
  begin
    if      cbRACK_STAT.ItemIndex = 1 then // ????
      WhereStr := WhereStr + ' AND ORDER_STAT = ''????'' AND ERR_STAT = ''????'' AND OT_USED = ''Y'' '
    else if cbRACK_STAT.ItemIndex = 2 then // ??????
      WhereStr := WhereStr + ' AND ORDER_STAT = ''??????'' '
    else if cbRACK_STAT.ItemIndex = 3 then // ??????
      WhereStr := WhereStr + ' AND ORDER_STAT = ''??????'' '
    else if cbRACK_STAT.ItemIndex = 4 then // ????
      WhereStr := WhereStr + ' AND OT_USED = ''N'' '
    else if cbRACK_STAT.ItemIndex = 5 then // ????
      WhereStr := WhereStr + ' AND ERR_STAT <> ''????'' '
    else
      WhereStr := WhereStr;
  end;

  // ????????
  if (Trim(cbITEM_TYPE.Text) <> '????' ) then
  begin
    if      cbITEM_TYPE.ItemIndex = 1 then // ??????
      WhereStr := WhereStr + ' AND ITEM_TYPE = ''??????'' '
    else if cbITEM_TYPE.ItemIndex = 2 then // ????
      WhereStr := WhereStr + ' AND ITEM_TYPE = ''????'' '
    else
      WhereStr := WhereStr;
  end;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT SUBSTRING(ITEM_LOT, 1, DATALENGTH(ITEM_LOT)-3) as LOT, ' +
                '        COUNT(SUBSTRING(ITEM_LOT, 1, 13)) AS COUNT_ITEM, ' +
                '        SUM(CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT)))) AS SUM_ITEM_WEIGHT ' +
                '   FROM TT_RACK_STOCK S WITH (NOLOCK) ' +
                '   LEFT JOIN TT_RACK  R WITH (NOLOCK) ' +
                '     ON S.RACK_LOC = R.RACK_LOC ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '  GROUP BY SUBSTRING(ITEM_LOT, 1, DATALENGTH(ITEM_LOT)-3) ' +
                '  ORDER BY SUBSTRING(ITEM_LOT, 1, DATALENGTH(ITEM_LOT)-3) ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'??)';
    end;
    qryInfoSub.Active := False;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[440] LOT???? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuerySub
//==============================================================================
procedure TfrmU440.fnCommandQuerySub(Code: String);
var
  StrSQL, WhereStr : String;
begin
  WhereStr := '';

  // ????????
  if (Trim(cbRACK_STAT.Text) <> '????' ) then
  begin
    if      cbRACK_STAT.ItemIndex = 1 then // ????
      WhereStr := WhereStr + ' AND ORDER_STAT = ''????'' AND ERR_STAT = ''????'' AND OT_USED = ''Y'' '
    else if cbRACK_STAT.ItemIndex = 2 then // ??????
      WhereStr := WhereStr + ' AND ORDER_STAT = ''??????'' '
    else if cbRACK_STAT.ItemIndex = 3 then // ??????
      WhereStr := WhereStr + ' AND ORDER_STAT = ''??????'' '
    else if cbRACK_STAT.ItemIndex = 4 then // ????
      WhereStr := WhereStr + ' AND OT_USED = ''N'' '
    else if cbRACK_STAT.ItemIndex = 5 then // ????
      WhereStr := WhereStr + ' AND ERR_STAT <> ''????'' '
    else
      WhereStr := WhereStr;
  end;

  // ????????
  if (Trim(cbITEM_TYPE.Text) <> '????' ) then
  begin
    if      cbITEM_TYPE.ItemIndex = 1 then // ??????
      WhereStr := WhereStr + ' AND ITEM_TYPE = ''??????'' '
    else if cbITEM_TYPE.ItemIndex = 2 then // ????
      WhereStr := WhereStr + ' AND ITEM_TYPE = ''????'' '
    else
      WhereStr := WhereStr;
  end;

  try
    with qryInfoSub do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT S.*, ' +
                '        SUBSTRING(ITEM_LOT, 15, 1) as BagNo, ' +
                '        SUBSTRING(S.RACK_LOC,1,2) + ''-'' + ' +
                '        SUBSTRING(S.RACK_LOC,3,2) + ''-'' + ' +
                '        SUBSTRING(S.RACK_LOC,5,2) as iRACK_LOC, ' +
                '        CASE WHEN ORDER_STAT = ''??????'' THEN ''??????'' ' +
                '             WHEN ORDER_STAT = ''??????'' THEN ''??????'' ' +
                '             WHEN OT_USED = ''N'' THEN ''????'' ' +
                '             WHEN ERR_STAT <> ''????'' THEN ERR_STAT ' +
                '             WHEN ORDER_STAT = ''????'' and OT_USED = ''Y'' and ERR_STAT = ''????'' THEN ''????'' ' +
                '             ELSE '''' END as RACK_STATUS, ' +
                '        CASE WHEN S.ITEM_WEIGHT = '''' or S.ITEM_WEIGHT = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '             ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(S.ITEM_WEIGHT))) END as tITEM_WEIGHT, ' +
                '        CASE WHEN LEN(ITEM_INFO_05)= 14 THEN CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)), 1, 8) + '' '' + ' +
                '        STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) ' +
                '             ELSE '''' END as tITEM_INFO_05, ' + // ????????
                '        CASE WHEN S.ITEM_INFO_10 = ''A'' THEN ''????''   ' +
                '             WHEN S.ITEM_INFO_10 = ''F'' THEN ''??????'' ' +
                '             ELSE ''??????'' END tITEM_INFO_10 ' +
                '   FROM TT_RACK_STOCK S WITH (NOLOCK) ' +
                '   LEFT JOIN TT_RACK R WITH (NOLOCK)  ' +
                '     ON S.RACK_LOC = R.RACK_LOC ' +
                '  WHERE SUBSTRING(ITEM_LOT, 1, DATALENGTH(ITEM_LOT)-3) = ' + QuotedStr(Code) + WhereStr +
                '  ORDER BY ITEM_LOT ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfoSub.Close;
      TraceLogWrite('[440] LOT???? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU440.dgInfoCellClick(Column: TColumnEh);
begin
  try
    dgInfoSub.SelectedRows.Clear;
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;
    fnCommandQuerySub(UpperCase(qryInfo.FieldByName('LOT').AsString));
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[440] LOT???? ???? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU440.sbtClearClick(Sender: TObject);
begin
  edtLOT.Text := '';
  edtCode.Text := '';
  cbRACK_STAT.ItemIndex := 0;
  cbITEM_TYPE.ItemIndex := 0;
  dgInfoSub.SelectedRows.Clear;
  edtLOT.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick
//==============================================================================
procedure TfrmU440.sbt_ITEMClick(Sender: TObject);
begin
  frmItemSearch := TfrmItemSearch.Create(Application);
  frmItemSearch.PnlFormName.Caption := '???? ???? ????';
  frmItemSearch.Caption := '????????';
  // ????????
  frmItemSearch.edtCode.Text := edtCode.Text;
  frmItemSearch.ShowModal ;

  if m.Popup_ItemInfo.ResultCd = 'OK' then
  begin
    edtCode.Text    := m.Popup_ItemInfo.DATA01;
//    edtName.Text    := m.Popup_ItemInfo.DATA02;
    edtCode.SetFocus;
  end;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU440.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// edtKeyPress
//==============================================================================
procedure TfrmU440.edtKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    fnCommandQuery;
  end else
  if key = #27 then
  begin
    (Sender as TEdit).Text := '';
  end;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmU440.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    fnCommandQuery;
  end else
  if key = #27 then
  begin
    edtCode.SetFocus;
  end;
end;

//==============================================================================
// dgInfoSubDrawColumnCell
//==============================================================================
procedure TfrmU440.dgInfoSubDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfoSub do
  begin
    if DataCol = 12 then
    begin
      if (Column.Field.DataSet.FieldByName('RACK_STATUS').AsString = '????') or
         (Column.Field.DataSet.FieldByName('RACK_STATUS').AsString = '??????') or
         (Column.Field.DataSet.FieldByName('RACK_STATUS').AsString = '????????') then
      begin
        Canvas.Font.Color := clRed;
        Canvas.Font.Style := [];
      end else
      if (Column.Field.DataSet.FieldByName('RACK_STATUS').AsString = '??????') or
         (Column.Field.DataSet.FieldByName('RACK_STATUS').AsString = '??????') then
      begin
        Canvas.Font.Color := clBlue;
        Canvas.Font.Style := [];
      end else
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Font.Style := [];
      end;
    end;
    dgInfoSub.defaultdrawcolumncell(rect, datacol, column, state);
  end;
end;

//==============================================================================
// cbChange
//==============================================================================
procedure TfrmU440.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU440.cbKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    fnCommandQuery;
  end else
  if key = #27 then
  begin
    (Sender as TComboBox).ItemIndex := 0;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU440.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
  dgInfoSub.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU440.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
  dgInfoSub.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// chkGridMainClick
//==============================================================================
procedure TfrmU440.chkGridMainClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridSub.Checked := False
  else chkGridSub.Checked := True;
end;

//==============================================================================
// chkGridSubClick
//==============================================================================
procedure TfrmU440.chkGridSubClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridMain.Checked := False
  else chkGridMain.Checked := True;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU440.Pnl_MainResize(Sender: TObject);
begin
  chkGridSub.Left := dgInfoSub.Left + 4;
end;

//==============================================================================
// Splitter1Moved
//==============================================================================
procedure TfrmU440.Splitter1Moved(Sender: TObject);
begin
  chkGridSub.Left := dgInfoSub.Left + 4;
end;
end.
