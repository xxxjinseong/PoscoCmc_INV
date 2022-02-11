unit U550;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU550 = class(TForm)
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
    edtITEM_INFO_01: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel24: TPanel;
    edtITEM_INFO_02: TEdit;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel6: TPanel;
    DatePicker1: TDateTimePicker;
    Panel15: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel18: TPanel;
    DatePicker2: TDateTimePicker;
    Panel13: TPanel;
    Panel19: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    dgInfo: TDBGridEh;
    lblCnt: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure DatePickerChange(Sender: TObject);
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
  end;
  procedure U550Create();

const
  FormNo ='550';

var
  frmU550: TfrmU550;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U550Create
//==============================================================================
procedure U550Create();
begin
  if not Assigned( frmU550 ) then
  begin
    frmU550 := TfrmU550.Create(Application);
    with frmU550 do
    begin
      fnCommandStart;
    end;
  end;
  frmU550.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU550.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU550.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU550.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU550.FormActivate(Sender: TObject);
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
procedure TfrmU550.FormDeactivate(Sender: TObject);
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
procedure TfrmU550.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer ;
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
  try frmU550 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU550.fnCommandStart;
begin
  DatePicker1.Date := Now;
  DatePicker2.Date := Now;
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU550.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU550.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel(dgInfo, '코드별 실적조회' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  엑셀 저장을 완료하였습니다.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU550.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU550.fnCommandPrint;
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
procedure TfrmU550.fnCommandQuery;
var
  WhereStr, WhereStr2, StrSQL : String;
  TmpDate1, TmpDate2 : String;
begin
  WhereStr := '' ;
  WhereStr2 := '';

  // 작업일시
  TmpDate1 := FormatDateTime('YYYY-MM-DD', DatePicker1.Date);
  TmpDate2 := FormatDateTime('YYYY-MM-DD', DatePicker2.Date);
  WhereStr := WhereStr + ' AND SUBSTRING(OR_DT, 1, 10) BETWEEN ''' + TmpDate1 + ''' ' +
                         '                                 AND ''' + TmpDate2 + ''' ' ;
  // 제품코드
  if Trim(edtITEM_INFO_01.Text) <> '' then
  begin
    WhereStr  := WhereStr  + ' AND ITEM_INFO_01 LIKE     ' + QuotedStr('%'+edtITEM_INFO_01.Text+'%');
    WhereStr2 := WhereStr2 + ' AND RST.ITEM_INFO_01 LIKE ' + QuotedStr('%'+edtITEM_INFO_01.Text+'%');
  end;

  // 제품명
  if Trim(edtITEM_INFO_02.Text) <> ''  then
  begin
    WhereStr  := WhereStr  + ' AND ITEM_INFO_02 LIKE     ' + QuotedStr('%'+edtITEM_INFO_02.Text+'%');
    WhereStr2 := WhereStr2 + ' AND RST.ITEM_INFO_02 LIKE ' + QuotedStr('%'+edtITEM_INFO_02.Text+'%');
  end;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT TOTAL.ITEM_INFO_01, TOTAL.ITEM_INFO_02, ' +
                '   SUM(IN_CNT) AS IN_CNT, ' +
                '   SUM(OT_CNT) AS OT_CNT, ' +
                '   SUM(MV_CNT) AS MV_CNT, ' +
                '   SUM(STOCK_CNT) AS STK_CNT, ' +
                '   SUM(STOCK_CNT_OUTUSED) AS STKU_CNT ' +
						    '   FROM ( ' +
                '   SELECT ITEM_INFO_01, ITEM_INFO_02, ' +
                '          COUNT(ITEM_INFO_01) AS IN_CNT, 0 AS OT_CNT, 0 AS MV_CNT, 0 AS STOCK_CNT, 0 AS STOCK_CNT_OUTUSED ' +
                '     FROM TT_HISTORY WITH (NOLOCK) ' +
                '    WHERE SUBSTRING(ID_TYPE, LEN(ID_TYPE)-1, 2) = ''입고'' ' + WhereStr +
                '    GROUP BY ITEM_INFO_01, ITEM_INFO_02 ' +
                '    UNION ALL ' +
                '   SELECT ITEM_INFO_01, ITEM_INFO_02, ' +
                '          0 AS IN_CNT, COUNT(ITEM_INFO_01) AS OT_CNT, 0 AS MV_CNT, 0 AS STOCK_CNT, 0 AS STOCK_CNT_OUTUSED ' +
                '     FROM TT_HISTORY WITH (NOLOCK) ' +
                '    WHERE SUBSTRING(ID_TYPE, LEN(ID_TYPE)-1, 2) = ''출고'' ' + WhereStr +
                '    GROUP BY ITEM_INFO_01, ITEM_INFO_02 ' +
                '    UNION ALL ' +
                '   SELECT ITEM_INFO_01, ITEM_INFO_02, ' +
                '          0 AS IN_CNT, 0 AS OT_CNT, COUNT(ITEM_INFO_01) AS MV_CNT, 0 AS STOCK_CNT, 0 AS STOCK_CNT_OUTUSED ' +
                '     FROM TT_HISTORY WITH (NOLOCK) ' +
                '    WHERE SUBSTRING(ID_TYPE, LEN(ID_TYPE)-1, 2) = ''이동'' ' + WhereStr +
                '    GROUP BY ITEM_INFO_01, ITEM_INFO_02 ' +
                '    UNION ALL ' +
                '   SELECT RST.ITEM_INFO_01, RST.ITEM_INFO_02, ' +
                '          0 AS IN_CNT, 0 AS OT_CNT, 0 AS MV_CNT, COUNT(RST.ITEM_INFO_01) AS STOCK_CNT, 0 AS STOCK_CNT_OUTUSED ' +
                '     FROM TT_RACK_STOCK RST WITH (NOLOCK), ' +
                '          TT_RACK RCK WITH (NOLOCK) ' +
                '    WHERE RST.RACK_LOC = RCK.RACK_LOC ' +
                '      AND RCK.RACK_STAT <> ''빈랙'' ' + WhereStr2 +
                '    GROUP BY RST.ITEM_INFO_01, RST.ITEM_INFO_02 ' +
						    '    UNION ALL ' +
						    '   SELECT RST.ITEM_INFO_01, RST.ITEM_INFO_02, ' +
                '          0 AS IN_CNT, 0 AS OT_CNT, 0 AS MV_CNT, 0 AS STOCK_CNT, COUNT(RST.ITEM_INFO_01) AS STOCK_CNT_OUTUSED ' +
                '  	  FROM TT_RACK_STOCK RST WITH (NOLOCK), ' +
                '          TT_RACK RCK WITH (NOLOCK) ' +
                '  	 WHERE RST.RACK_LOC = RCK.RACK_LOC ' +
                '      AND RCK.RACK_STAT  <> ''빈랙'' ' + WhereStr2 +
							  '      AND RCK.ORDER_STAT = ''없음'' ' +
							  '      AND RCK.ERR_STAT   = ''없음'' ' +
						    '      AND RCK.OT_USED    = ''Y'' ' +
                ' 	 GROUP BY RST.ITEM_INFO_01, RST.ITEM_INFO_02  ' +
						    '        ) AS TOTAL ' +
		            '  GROUP BY TOTAL.ITEM_INFO_01, TOTAL.ITEM_INFO_02 ' +
		            '  ORDER BY TOTAL.ITEM_INFO_01 ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'건)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[550] 코드별 실적조회 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU550.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU550.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU550.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfo do
  begin
    if DataCol = 2 then
    begin
      if Column.Field.DataSet.FieldByName('IN_CNT').AsString <> '0' then
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
      if Column.Field.DataSet.FieldByName('OT_CNT').AsString <> '0' then
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
      if Column.Field.DataSet.FieldByName('MV_CNT').AsString <> '0' then
      begin
        Canvas.Font.Color := clRed;
        Canvas.Font.Style := [fsBold];
      end else
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Font.Style := [];
      end;
    end;

    if DataCol = 5 then
    begin
      if Column.Field.DataSet.FieldByName('STK_CNT').AsString <> '0' then
      begin
        Canvas.Font.Color := clRed;
        Canvas.Font.Style := [fsBold];
      end else
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Font.Style := [];
      end;
    end;

    if DataCol = 6 then
    begin
      if Column.Field.DataSet.FieldByName('STK_CNT').AsString <>
         Column.Field.DataSet.FieldByName('STKU_CNT').AsString then
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
// DatePickerChange
//==============================================================================
procedure TfrmU550.DatePickerChange(Sender: TObject);
var
  TmpDate1, TmpDate2 : Integer;
begin
  TmpDate1 := StrToInt(FormatDateTime('YYYYMMDD' , DatePicker1.Date));
  TmpDate2 := StrToInt(FormatDateTime('YYYYMMDD' , DatePicker2.Date));

  if (TmpDate1 <= TmpDate2) then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU550.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU550.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU550.sbtClearClick(Sender: TObject);
begin
  edtITEM_INFO_01.Text := ''; // 제품코드
  edtITEM_INFO_02.Text := ''; // 제품명
  DatePicker1.Date := Now;
  DatePicker2.Date := Now;
  DatePicker1.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [품목찾기]
//==============================================================================
procedure TfrmU550.sbt_ITEMClick(Sender: TObject);
begin
  frmItemSearch := TfrmItemSearch.Create(Application);
  frmItemSearch.PnlFormName.Caption := '품목 코드 찾기';
  frmItemSearch.Caption := '코드찾기';
  // 품목코드
  frmItemSearch.edtCode.Text := edtITEM_INFO_01.Text;
  frmItemSearch.ShowModal ;

  if m.Popup_ItemInfo.ResultCd = 'OK' then
  begin
    edtITEM_INFO_01.Text := m.Popup_ItemInfo.DATA01;
    edtITEM_INFO_02.Text := m.Popup_ItemInfo.DATA02;
    edtITEM_INFO_01.SetFocus;
  end;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmU550.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    edtITEM_INFO_01.SetFocus;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU550.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU550.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU550.dgInfoTitleClick(Column: TColumnEh);
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

