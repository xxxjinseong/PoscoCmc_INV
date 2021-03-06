unit U430;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons,
  Vcl.ComCtrls ;

type
  TfrmU430 = class(TForm)
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    Pnl_Base: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Pnl_Top: TPanel;
    Panel1: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    edtLOT: TEdit;
    Panel4: TPanel;
    edtCode: TEdit;
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    EhPrint: TPrintDBGridEh;
    Pnl_Main: TPanel;
    Panel10: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    Panel12: TPanel;
    edtFontSize: TEdit;
    udFontSize: TUpDown;
    Panel6: TPanel;
    sbt_ITEM: TSpeedButton;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel15: TPanel;
    cbRACK_STAT: TComboBox;
    Panel16: TPanel;
    cbITEM_TYPE: TComboBox;
    dgInfo: TDBGridEh;
    Panel33: TPanel;
    cbCBank: TComboBox;
    cbCBay: TComboBox;
    Panel17: TPanel;
    cbCLevel: TComboBox;
    Panel30: TPanel;
    cbCHogi: TComboBox;
    lblCnt: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtKeyPress(Sender: TObject; var Key: Char);
    procedure edtChange(Sender: TObject);
    procedure sbtClearClick(Sender: TObject);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cbChange(Sender: TObject);
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
  procedure U430Create();

var
  frmU430: TfrmU430;


implementation

uses Main, ItemSearch;

{$R *.dfm}

//==============================================================================
// U430Create
//==============================================================================
procedure U430Create();
begin
  if not Assigned( frmU430 ) then
  begin
    frmU430 := TfrmU430.Create(Application);
    with frmU430 do
    begin
      fnCommandStart;
    end;
  end;
  frmU430.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU430.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU430.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU430.FormActivate(Sender: TObject);
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
procedure TfrmU430.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : Integer;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i] is TTimer) then
       (Self.Components[i] as TTimer).Enabled := False ;
  end;

  for i := 0 to Self.ComponentCount-1 Do
  begin
    if (Self.Components[i] is TADOQuery) then
       (Self.Components[i] as TADOQuery).Active := False ;
  end;

  Action := Cafree;
  try frmU430 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart
//==============================================================================
procedure TfrmU430.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandAdd
//==============================================================================
procedure TfrmU430.fnCommandAdd;
begin
//
end;

//==============================================================================
// fnCommandClose
//==============================================================================
procedure TfrmU430.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// fnCommandDelete
//==============================================================================
procedure TfrmU430.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandExcel
//==============================================================================
procedure TfrmU430.fnCommandExcel;
begin
  if hlbEhgridListExcel(dgInfo, '?????? ???? ????' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandPrint
//==============================================================================
procedure TfrmU430.fnCommandPrint;
begin
  if not qryInfo.Active then Exit;

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
// fnCommandQuery
//==============================================================================
procedure TfrmU430.fnCommandQuery;
var
  StrSQL, WhereStr : String;
begin
  WhereStr := '';

  // ????????
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND ITEM_LOT LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // ????????
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (ITEM_INFO_01 LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      ITEM_INFO_02 LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')' ;
  // ????????
  if (Trim(cbCHOGI.Text) <> '????') then
    WhereStr := WhereStr + ' AND S.RACK_HOGI = ' + QuotedStr(IntToStr(cbCHOGI.ItemIndex));

  // ???????? - ??
  if (Trim(cbCBank.Text) <> '????') then
    WhereStr := WhereStr + ' AND S.RACK_BANK = ' + QuotedStr(cbCBank.Text);

  // ???????? - ??
  if (Trim(cbCBay.Text) <> '????') then
    WhereStr := WhereStr + ' AND S.RACK_BAY = ' + QuotedStr(cbCBay.Text);

  // ???????? - ??
  if (Trim(cbCLevel.Text) <> '????' ) then
    WhereStr := WhereStr + ' AND S.RACK_LEVEL = ' + QuotedStr(cbCLevel.Text);

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
                '        SUBSTRING(S.IN_DATE, 1, 19) as tIN_DATE, ' +
                '        CASE WHEN LEN(ITEM_INFO_05)= 14 THEN CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)), 1, 8) + '' '' + ' +
                '        STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) ' +
                '             ELSE '''' END as tITEM_INFO_05, ' + // ????????
                '        CASE WHEN S.ITEM_INFO_10 = ''A'' THEN ''????''   ' +
                '             WHEN S.ITEM_INFO_10 = ''F'' THEN ''??????'' ' +
                '             ELSE ''??????'' END tITEM_INFO_10 ' +
                '   FROM TT_RACK_STOCK S WITH (NOLOCK) ' +
                '   LEFT JOIN TT_RACK R WITH (NOLOCK) ' +
                '     ON S.RACK_LOC = R.RACK_LOC ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '  ORDER BY RACK_LOC ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'??)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[430] ?????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU430.sbtClearClick(Sender: TObject);
begin
  edtLOT.Text         := '';
  edtCode.Text        := '';
  cbCHOGI.ItemIndex    := 0;
  cbCBank.ItemIndex    := 0;
  cbCBay.ItemIndex     := 0;
  cbCLevel.ItemIndex   := 0;
  cbRACK_STAT.ItemIndex := 0;
  cbITEM_TYPE.ItemIndex := 0;
  fnCommandQuery;
  cbCHogi.SetFocus;
end;

//==============================================================================
// sbt_ITEMClick
//==============================================================================
procedure TfrmU430.sbt_ITEMClick(Sender: TObject);
begin
  frmItemSearch := TfrmItemSearch.Create(Application);
  frmItemSearch.PnlFormName.Caption := '???? ???? ????';
  frmItemSearch.Caption := '????????';
  // ????????
  frmItemSearch.edtCode.Text := edtCode.Text;
  frmItemSearch.ShowModal ;

  if m.Popup_ItemInfo.ResultCd = 'OK' then
  begin
    edtCode.Text      := m.Popup_ItemInfo.DATA01;
    edtCode.SetFocus;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU430.dgInfoTitleClick(Column: TColumnEh);
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
// cbCHogiChange
//==============================================================================
procedure TfrmU430.cbChange(Sender: TObject);
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
procedure TfrmU430.cbKeyPress(Sender: TObject; var Key: Char);
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
// edtChange
//==============================================================================
procedure TfrmU430.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// edtKeyPress
//==============================================================================
procedure TfrmU430.edtKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU430.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    fnCommandQuery;
  end else
  if key = #27 then
  begin
    cbCHogi.SetFocus;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU430.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU430.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU430.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfo do
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
    dgInfo.defaultdrawcolumncell(rect, datacol, column, state);
  end;
end;


end.

