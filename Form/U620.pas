unit U620;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU620 = class(TForm)
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
    Panel24: TPanel;
    edtERR_CODE: TEdit;
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
    Panel12: TPanel;
    cbID_MACH: TComboBox;
    Panel13: TPanel;
    Panel19: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    Panel1: TPanel;
    cbID_MACHNO: TComboBox;
    Panel4: TPanel;
    edtERR_NAME: TEdit;
    Notebook: TNotebook;
    PnlNt1: TPanel;
    dgInfo: TDBGridEh;
    PnlNt2: TPanel;
    dgInfoSum: TDBGridEh;
    qryInfoSum: TADOQuery;
    dsInfoSum: TDataSource;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel10: TPanel;
    Panel14: TPanel;
    cbType1: TCheckBox;
    cbType2: TCheckBox;
    lblCnt: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure ComboChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbtClearClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure DatePickerChange(Sender: TObject);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure cbTypeClick(Sender: TObject);
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
  procedure U620Create();

const
  FormNo ='620';

var
  frmU620: TfrmU620;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U620Create
//==============================================================================
procedure U620Create();
begin
  if not Assigned( frmU620 ) then
  begin
    frmU620 := TfrmU620.Create(Application);
    with frmU620 do
    begin
      fnCommandStart;
    end;
  end;
  frmU620.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU620.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU620.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU620.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU620.FormActivate(Sender: TObject);
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
procedure TfrmU620.FormDeactivate(Sender: TObject);
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
procedure TfrmU620.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU620 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU620.fnCommandStart;
begin
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
  Notebook.ActivePage := '1';
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandAdd [????]
//==============================================================================
procedure TfrmU620.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU620.fnCommandExcel;
begin
  if NoteBook.ActivePage = '1' then
  begin
    if not qryInfo.Active then Exit;
    if qryInfo.RecordCount < 1 then Exit;

    if hlbEhgridListExcel(dgInfo, '???? ????????' + '_' + FormatDatetime('YYYYMMDD', Now)) then
    begin
      MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
    end;
  end else
  begin
    if not qryInfoSum.Active then Exit;
    if qryInfoSum.RecordCount < 1 then Exit;

    if hlbEhgridListExcel(dgInfoSum, '???? ????????(????????)' + '_' + FormatDatetime('YYYYMMDD', Now)) then
    begin
      MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
    end;
  end;
end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU620.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU620.fnCommandPrint;
begin
  if NoteBook.ActivePage = '1' then
  begin
    if not qryInfo.Active then Exit;
    if qryInfo.RecordCount < 1 then Exit;
    fnCommandQuery;
    EhPrint.DBGridEh := dgInfo;
  end else
  begin
    if not qryInfoSum.Active then Exit;
    if qryInfoSum.RecordCount < 1 then Exit;
    fnCommandQuery;
    EhPrint.DBGridEh := dgInfoSum;
  end;
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
procedure TfrmU620.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // ????????
  if (cbID_MACH.Text <> '????') then
    WhereStr := WhereStr + ' AND ID_MACH = ' + QuotedStr(cbID_MACH.Text) ;

  // ????????
  if (cbID_MACHNO.Text <> '????') then
    WhereStr := WhereStr + ' AND ID_MACHNO = ' + QuotedStr(cbID_MACHNO.Text) ;

  // ????????
  if (Trim(edtERR_CODE.Text) <> '') then
    WhereStr := WhereStr + ' AND ERR_CODE LIKE ' + QuotedStr('%'+edtERR_CODE.Text+'%') ;

  // ??????
  if (Trim(edtERR_NAME.Text) <> '') then
    WhereStr := WhereStr + ' AND ERR_NAME LIKE ' + QuotedStr('%'+edtERR_NAME.Text+'%') ;

  // ????????
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND CR_DT BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                         '               AND ''' + TmpDate2 + TmpTime2 + ''' ' ;


  //===================
  // ???? ???? ????
  //===================
  if NoteBook.ActivePage = '1' then
  begin
    try
      qryInfoSum.Close;
      with qryInfo do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT *, ' +
                  '        CASE WHEN ERR_END IS NOT NULL THEN ' +
                  '             CAST(DATEDIFF(SECOND, ERR_START, ERR_END)/60 as VARCHAR(10)) + ''?? '' + ' +
                  '             CAST((DATEDIFF(SECOND, ERR_START, ERR_END)) -' +
                  '             (DATEDIFF(SECOND, ERR_START, ERR_END)/60 * 60) as VARCHAR(2)) + ''??'' ' +
                  '        ELSE '''' END DelayTime, ' +
                  '        SUBSTRING(CR_DT, 1, 19) as tCR_DT, ' +
                  '        SUBSTRING(UP_DT, 1, 19) as tUP_DT  ' +
                  '   FROM TT_ERROR WITH (NOLOCK) ' +
                  '  WHERE 1 = 1 ' + WhereStr +
                  '  ORDER BY CR_DT ' ;
        SQL.Text := StrSQL;
        Open;
        lblCnt.Caption := '('+IntToStr(RecordCount)+'??)';
      end;
    except
      on E : Exception do
      begin
        qryInfo.Close;
        TraceLogWrite('[620] ???? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
      end;
    end ;
  end else
  //===================
  // ???? ???? ????
  //===================
  if NoteBook.ActivePage = '2' then
  begin
    try
      qryInfo.Close;
      with qryInfoSum do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT ID_MACH, ID_MACHNO, ERR_CODE, ERR_NAME, COUNT(ERR_CODE) as ERR_CNT ' +
                  '   FROM TT_ERROR ERR WITH (NOLOCK) ' +
                  '  WHERE 1 = 1 ' + WhereStr +
                  '  GROUP BY ID_MACH, ID_MACHNO, ERR_CODE, ERR_NAME ' +
                  '  ORDER BY ID_MACH, ID_MACHNO, ERR_CODE ' ;
        SQL.Text := StrSQL;
        Open;
        lblCnt.Caption := '('+IntToStr(RecordCount)+'??)';
      end;
    except
      on E : Exception do
      begin
        qryInfoSum.Close;
        TraceLogWrite('[620] ???? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
      end;
    end;
  end;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU620.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// ComboChange
//==============================================================================
procedure TfrmU620.ComboChange(Sender: TObject);
begin
  if (Sender as TComboBox).Tag = 1 then
  begin
    cbID_MACHNO.Items.Clear;
    cbID_MACHNO.Items.Add('????');
    if (Sender as TComboBox).Text = 'CV' then
    begin
      cbID_MACHNO.Items.Add('1');
    end else
    if (Sender as TComboBox).Text = 'SC' then
    begin
      cbID_MACHNO.Items.Add('1');
      cbID_MACHNO.Items.Add('2');
      cbID_MACHNO.Items.Add('3');
    end else
    if (Sender as TComboBox).Text = 'AC' then
    begin
      cbID_MACHNO.Items.Add('1');
    end else
    begin
      cbID_MACHNO.Items.Add('1');
      cbID_MACHNO.Items.Add('2');
      cbID_MACHNO.Items.Add('3');
    end;
  end;
  fnCommandQuery;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU620.cbKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    (Sender as TComboBox).ItemIndex := 0;
  end;
end;

//==============================================================================
// DatePickerChange
//==============================================================================
procedure TfrmU620.DatePickerChange(Sender: TObject);
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
// cbTypeClick
//==============================================================================
procedure TfrmU620.cbTypeClick(Sender: TObject);
var
  idx : integer;
begin
  idx := (Sender as TCheckBox).Tag;

  if (Sender as TCheckBox).Checked then
  begin
    if idx = 1 then
         cbType2.Checked := False
    else cbType1.Checked := False;
  end else
  begin
    if idx = 1 then
    begin
      cbType2.Checked := True;
      NoteBook.ActivePage := '2';
      fnCommandQuery;
    end else
    begin
      cbType1.Checked := True;
      NoteBook.ActivePage := '1';
      fnCommandQuery;
    end;
  end;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU620.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU620.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU620.sbtClearClick(Sender: TObject);
begin
  cbID_MACH.ItemIndex   := 0;  // ????????
  cbID_MACHNO.ItemIndex := 0;  // ????????
  edtERR_CODE.Text      := ''; // ????????
  edtERR_NAME.Text      := ''; // ??????
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59');
  cbID_MACH.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU620.dgInfoTitleClick(Column: TColumnEh);
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
procedure TfrmU620.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    cbID_MACH.SetFocus;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU620.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines    := StrToIntDef((Sender as TEdit).Text,0);
  dgInfoSum.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU620.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size    := StrToIntDef((Sender as TEdit).Text,11);
  dgInfoSum.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

end.

