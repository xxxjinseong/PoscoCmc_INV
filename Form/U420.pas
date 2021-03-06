unit U420;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons,
  Vcl.ComCtrls ;

type
  TfrmU420 = class(TForm)
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Splitter1: TSplitter;
    dgInfo: TDBGridEh;
    dgInfoSub: TDBGridEh;
    Panel2: TPanel;
    Panel3: TPanel;
    Pnl_Top: TPanel;
    Panel1: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    edtCode: TEdit;
    Panel4: TPanel;
    edtName: TEdit;
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    EhPrint: TPrintDBGridEh;
    qryInfoSub: TADOQuery;
    dsInfoSub: TDataSource;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    chkGridSub: TCheckBox;
    chkGridMain: TCheckBox;
    Panel15: TPanel;
    cbRACK_STAT: TComboBox;
    Panel10: TPanel;
    edtRowHeight: TEdit;
    Panel12: TPanel;
    edtFontSize: TEdit;
    udRowHeight: TUpDown;
    udFontSize: TUpDown;
    Panel5: TPanel;
    cbITEM_TYPE: TComboBox;
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
  procedure U420Create();

var
  frmU420: TfrmU420;


implementation

uses Main, ItemSearch;

{$R *.dfm}

//==============================================================================
// U420Create
//==============================================================================
procedure U420Create();
begin
  if not Assigned( frmU420 ) then
  begin
    frmU420 := TfrmU420.Create(Application);
    with frmU420 do
    begin
      fnCommandStart;
    end;
  end;
  frmU420.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU420.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU420.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU420.FormActivate(Sender: TObject);
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
// FormClose                                                                  //
//==============================================================================
procedure TfrmU420.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU420 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart
//==============================================================================
procedure TfrmU420.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandAdd
//==============================================================================
procedure TfrmU420.fnCommandAdd;
begin
//
end;

//==============================================================================
// fnCommandClose
//==============================================================================
procedure TfrmU420.fnCommandClose;
begin
  Close;
end;


//==============================================================================
// fnCommandDelete
//==============================================================================
procedure TfrmU420.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandExcel
//==============================================================================
procedure TfrmU420.fnCommandExcel;
begin
  if (not chkGridMain.Checked) and (not chkGridSub.Checked)  then
  begin
    MessageDlg('  ???????? ???????? ?????? ????????.', mtConfirmation, [mbOk], 0);
    Exit;
  end;

  if (chkGridMain.Checked) and (not chkGridSub.Checked) then
  begin
    if hlbEhgridListExcel ( dgInfo , '?????? ???? ????' + '_' + FormatDatetime('YYYYMMDD', Now) ) then
    begin
      MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
    end;
  end else
  begin
    if hlbEhgridListExcel ( dgInfoSub , '?????? ???? ????(????)' + '_' + FormatDatetime('YYYYMMDD', Now) ) then
    begin
      MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
    end;
  end;
end;

//==============================================================================
// fnCommandPrint
//==============================================================================
procedure TfrmU420.fnCommandPrint;
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
procedure TfrmU420.fnCommandQuery;
var
  StrSQL, WhereStr : String;
begin
  WhereStr := '';

  // ????????
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND ITEM_INFO_01 LIKE ' + QuotedStr('%'+edtCode.Text+'%') ;

  // ??????
  if (Trim(edtName.Text) <> '') then
    WhereStr := WhereStr + ' AND ITEM_INFO_02 LIKE ' + QuotedStr('%'+edtName.Text+'%') ;

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
      StrSQL := ' SELECT ITEM_INFO_01, ITEM_INFO_02, ' +
                '        COUNT(ITEM_INFO_01) AS COUNT_ITEM, ' +
                '        SUM(CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT)))) AS SUM_ITEM_WEIGHT ' +
                '   FROM TT_RACK_STOCK S WITH (NOLOCK) ' +
                '   LEFT JOIN TT_RACK  R WITH (NOLOCK) ' +
                '     ON S.RACK_LOC = R.RACK_LOC ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '  GROUP BY ITEM_INFO_01, ITEM_INFO_02 ' +
                '  ORDER BY ITEM_INFO_01 ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'??)';
    end;
    qryInfoSub.Active := False;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[420] ???????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuerySub
//==============================================================================
procedure TfrmU420.fnCommandQuerySub(Code: String);
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
                '   LEFT JOIN TT_RACK R WITH (NOLOCK) ' +
                '     ON S.RACK_LOC = R.RACK_LOC ' +
                '  WHERE ITEM_INFO_01 = ' + QuotedStr(Code) + WhereStr +
                '  ORDER BY ITEM_LOT ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfoSub.Close;
      TraceLogWrite('[420] ???????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// dgInfoCellClick                                                            //
//==============================================================================
procedure TfrmU420.dgInfoCellClick(Column: TColumnEh);
begin
  try
    dgInfoSub.SelectedRows.Clear;
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;
    fnCommandQuerySub(UpperCase(qryInfo.FieldByName('ITEM_INFO_01').AsString));
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[420] ???????? ???? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU420.sbtClearClick(Sender: TObject);
begin
  edtCode.Text := '';
  edtName.Text := '';
  cbRACK_STAT.ItemIndex := 0;
  cbITEM_TYPE.ItemIndex := 0;
  dgInfoSub.SelectedRows.Clear;
  fnCommandQuery;
  edtCode.SetFocus;
end;

//==============================================================================
// sbt_ITEMClick
//==============================================================================
procedure TfrmU420.sbt_ITEMClick(Sender: TObject);
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
    edtName.Text    := m.Popup_ItemInfo.DATA02;
    edtCode.SetFocus;
  end;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU420.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// edtKeyPress
//==============================================================================
procedure TfrmU420.edtKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU420.dgInfoKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU420.dgInfoSubDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfoSub do
  begin
    if DataCol = 10 then
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
procedure TfrmU420.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU420.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU420.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
  dgInfoSub.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU420.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
  dgInfoSub.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// chkGridMainClick
//==============================================================================
procedure TfrmU420.chkGridMainClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridSub.Checked := False
  else chkGridSub.Checked := True;
end;

//==============================================================================
// chkGridSubClick
//==============================================================================
procedure TfrmU420.chkGridSubClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridMain.Checked := False
  else chkGridMain.Checked := True;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU420.Pnl_MainResize(Sender: TObject);
begin
  chkGridSub.Left := dgInfoSub.Left + 4;
end;

//==============================================================================
// Splitter1Moved
//==============================================================================
procedure TfrmU420.Splitter1Moved(Sender: TObject);
begin
  chkGridSub.Left := dgInfoSub.Left + 4;
end;

end.
