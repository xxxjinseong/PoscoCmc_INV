unit U520;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU520 = class(TForm)
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
    Panel1: TPanel;
    edtLOT: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel24: TPanel;
    edtCode: TEdit;
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
    Panel12: TPanel;
    Panel10: TPanel;
    cbITEM_TYPE: TComboBox;
    cbWRAP_YN: TComboBox;
    Panel5: TPanel;
    Panel16: TPanel;
    edtITEM_INFO_06: TEdit;
    edtITEM_INFO_08: TEdit;
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
    dgInfo: TDBGridEh;
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
  procedure U520Create();

const
  FormNo ='520';

var
  frmU520: TfrmU520;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U520Create
//==============================================================================
procedure U520Create();
begin
  if not Assigned( frmU520 ) then
  begin
    frmU520 := TfrmU520.Create(Application);
    with frmU520 do
    begin
      fnCommandStart;
    end;
  end;
  frmU520.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU520.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU520.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU520.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU520.FormActivate(Sender: TObject);
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
procedure TfrmU520.FormDeactivate(Sender: TObject);
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
procedure TfrmU520.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU520 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU520.fnCommandStart;
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
procedure TfrmU520.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU520.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel(dgInfo, '???? ???? ????' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU520.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU520.fnCommandPrint;
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
procedure TfrmU520.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // ????????
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND H.ITEM_LOT LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // ????????
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (H.ITEM_INFO_01 LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      H.ITEM_INFO_02 LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')';

  // ????????
  if (Trim(cbITEM_TYPE.Text) <> '????') then
    WhereStr := WhereStr + ' AND H.ITEM_TYPE = ' + QuotedStr(cbITEM_TYPE.Text) ;

  // ????????
  if (Trim(cbWRAP_YN.Text) <> '????') then
    WhereStr := WhereStr + ' AND H.WRAP_YN = ' + QuotedStr(cbWRAP_YN.Text) ;

  // ????????
  if (Trim(edtITEM_INFO_08.Text) <> '') then
    WhereStr := WhereStr + ' AND H.ITEM_INFO_08 LIKE ' + QuotedStr('%'+edtITEM_INFO_08.Text+'%') ;

  // ????????
  if (Trim(edtITEM_INFO_06.Text) <> '') then
    WhereStr := WhereStr + ' AND ( H.ITEM_INFO_06 LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ' or ' +
                           '       H.ITEM_INFO_07 LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ')' ;

  // ????-????
  if (cbHogi.Text <> '????') then
    WhereStr := WhereStr + ' AND H.ID_SC = ' + QuotedStr(IntToStr(cbHOGI.ItemIndex)) ;

  // ????-??
  if (cbCBank.Text <> '????') then
    WhereStr := WhereStr + ' AND H.LOAD_BANK = ' + QuotedStr(cbCBank.Text) ;

  // ????-??
  if (cbCBay.Text <> '????') then
    WhereStr := WhereStr + ' AND H.LOAD_BAY = ' + QuotedStr(cbCBay.Text) ;

  // ????-??
  if (cbCLevel.Text <> '????') then
    WhereStr := WhereStr + ' AND H.LOAD_LEVEL = ' + QuotedStr(cbCLevel.Text) ;

  // ????????
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
                ' H.ID_SC + ''????'' as HOGI,' +
                ' CASE H.IN_SITE WHEN ''102'' THEN ''1????(''+H.IN_SITE+'')'' ' +
                '                WHEN ''112'' THEN ''2????(''+H.IN_SITE+'')'' ' +
                '                WHEN ''120'' THEN ''3????(''+H.IN_SITE+'')'' ELSE '''' END as SRC_POS, ' +
                ' H.LOAD_BANK + ''-'' + LOAD_BAY + ''-'' + LOAD_LEVEL as SRC_RACK, ' +
                ' CASE WHEN H.ITEM_WEIGHT = '''' or H.ITEM_WEIGHT = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(H.ITEM_WEIGHT))) END as tITEM_WEIGHT, ' +
                ' SUBSTRING(H.OR_DT, 1, 19) as tOR_DT, ' +
                ' SUBSTRING(H.IN_DATE, 1, 19) as tIN_DATE, ' +
                ' CASE WHEN LEN(ITEM_INFO_05)= 14 THEN CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) ' +
                '      ELSE '''' END as tITEM_INFO_05 ' + // ????????
                '   FROM TT_HISTORY H WITH (NOLOCK)' +
                '  WHERE 1 = 1 ' +
                '    AND SUBSTRING(H.ID_TYPE, LEN(H.ID_TYPE)-1, 2) = ''????'' ' + WhereStr +
                '  ORDER BY H.OR_DT' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'??)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[520] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU520.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU520.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU520.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
//
end;

//==============================================================================
// cbChange
//==============================================================================
procedure TfrmU520.cbChange(Sender: TObject);
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
procedure TfrmU520.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU520.DatePickerChange(Sender: TObject);
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
procedure TfrmU520.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU520.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU520.sbtClearClick(Sender: TObject);
begin
  edtLOT.Text           := ''; // ????????
  edtCODE.Text          := ''; // ????????
  cbITEM_TYPE.ItemIndex := 0;  // ????????
  cbWRAP_YN.ItemIndex   := 0;  // ????????
  edtITEM_INFO_08.Text  := ''; // ????????
  edtITEM_INFO_06.Text  := ''; // ????????
  cbHogi.ItemIndex      := 0;  // ????????
  cbCBank.ItemIndex     := 0;  // ???? ??
  cbCBay.ItemIndex      := 0;  // ???? ??
  cbCLEvel.ItemIndex    := 0;  // ???? ??
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [????????]
//==============================================================================
procedure TfrmU520.sbt_ITEMClick(Sender: TObject);
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
    edtCode.SetFocus;
  end;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmU520.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    edtLOT.SetFocus;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU520.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU520.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU520.dgInfoTitleClick(Column: TColumnEh);
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

