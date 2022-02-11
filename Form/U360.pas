unit U360;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU360 = class(TForm)
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
    cbITEM_TYPE: TComboBox;
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
    Panel10: TPanel;
    cbIN_SITE: TComboBox;
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
  procedure U360Create();

const
  FormNo ='360';

var
  frmU360: TfrmU360;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U360Create
//==============================================================================
procedure U360Create();
begin
  if not Assigned( frmU360 ) then
  begin
    frmU360 := TfrmU360.Create(Application);
    with frmU360 do
    begin
      fnCommandStart;
    end;
  end;
  frmU360.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU360.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU360.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU360.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU360.FormActivate(Sender: TObject);
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
procedure TfrmU360.FormDeactivate(Sender: TObject);
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
procedure TfrmU360.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU360 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [����]
//==============================================================================
procedure TfrmU360.fnCommandStart;
begin
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandAdd [�ű�]
//==============================================================================
procedure TfrmU360.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [����]
//==============================================================================
procedure TfrmU360.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel(dgInfo, '�̵����� ��ȸ' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  ���� ������ �Ϸ��Ͽ����ϴ�.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [����]
//==============================================================================
procedure TfrmU360.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [�μ�]
//==============================================================================
procedure TfrmU360.fnCommandPrint;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  fnCommandQuery;
  EhPrint.DBGridEh := dgInfo;
  EhPrint.PageFooter.RightText.Clear;
  EhPrint.PageFooter.RightText.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS',Now()) + '   ' +
                                   MainDM.M_Info.UserCode+' / '+MainDM.M_Info.UserName);
  EhPrint.PageFooter.Font.Name := '����';
  EhPrint.PageFooter.Font.Size := 11;
  EhPrint.Preview;
end;

//==============================================================================
// fnCommandQuery [��ȸ]
//==============================================================================
procedure TfrmU360.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // ��ǰ��ȣ
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(S.BODY_03)) LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // ��ǰ�ڵ� or ��ǰ��
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(S.BODY_06)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(S.BODY_07)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')' ;
  // ��ǰ����
  if (Trim(cbITEM_TYPE.Text) <> '��ü') then
  begin
    if Trim(cbITEM_TYPE.Text) = '����ǰ' then
         WhereStr := WhereStr + ' AND RTRIM(LTRIM(S.BODY_12)) = ''N'' '
    else WhereStr := WhereStr + ' AND RTRIM(LTRIM(S.BODY_12)) = ''Y'' ';
  end;

  // �ֹ���ȣ
  if (Trim(edtITEM_INFO_08.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(S.BODY_11)) LIKE ' + QuotedStr('%'+edtITEM_INFO_08.Text+'%') ;

  // �����ڵ�
  if (Trim(edtITEM_INFO_06.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(S.BODY_09)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(S.BODY_10)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ')' ;
  // �̵�-ȣ��
  if (cbHogi.Text <> '��ü') then
  begin
    if      cbHOGI.ItemIndex = 1 then
      WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) in (''01'', ''02'') '
    else if cbHOGI.ItemIndex = 2 then
      WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) in (''03'', ''04'') '
    else if cbHOGI.ItemIndex = 3 then
      WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) in (''05'', ''06'') ';
  end;

  // �̵�-��
  if (cbCBank.Text <> '��ü') then
    WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) = ' + QuotedStr(cbCBank.Text) ;

  // �̵�-��
  if (cbCBay.Text <> '��ü') then
    WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 3, 2) = ' + QuotedStr(cbCBay.Text) ;

  // �̵�-��
  if (cbCLevel.Text <> '��ü') then
    WhereStr := WhereStr + ' AND SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 5, 2) = ' + QuotedStr(cbCLevel.Text) ;

  // �۾��Ͻ�
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND H.OR_DT BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                         '                 AND ''' + TmpDate2 + TmpTime2 + ''' ' ;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ' +
                ' SUBSTRING(H.OR_DT  , 1, 19) as OR_DT, ' +                       // �۾��Ͻ�
                ' CASE WHEN RTRIM(LTRIM(S.BODY_01)) = ''R'' THEN ''�̵�����'' ' +        // ��������
                '      WHEN RTRIM(LTRIM(S.BODY_01)) = ''C'' THEN ''�������'' ' +
                '      ELSE '''' END as BODY_01, ' +
                ' ''�Ϸ�'' as PROC_MANUAL, ' +                                    // �Ϸ����
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(S.BODY_02)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(S.BODY_02)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_02, ' + // �̵��Ͻ�
                ' RTRIM(LTRIM(S.BODY_03)) as BODY_03, ' +                                // ��ǰ��ȣ
                ' RTRIM(LTRIM(S.BODY_06)) as BODY_06, ' +                                // ��ǰ�ڵ�
                ' RTRIM(LTRIM(S.BODY_07)) as BODY_07, ' +                                // ��ǰ��
                ' CASE WHEN RTRIM(LTRIM(S.BODY_08)) = '''' or RTRIM(LTRIM(S.BODY_08)) = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(S.BODY_08))) END as BODY_08, ' +  // �߷�
                ' RTRIM(LTRIM(S.BODY_09)) as BODY_09, ' +                                // �����ڵ�
                ' RTRIM(LTRIM(S.BODY_10)) as BODY_10, ' +                                // ������
                ' RTRIM(LTRIM(S.BODY_11)) as BODY_11, ' +                                // �ֹ���ȣ
                ' RTRIM(LTRIM(S.BODY_12)) as BODY_12, ' +                                // ��ǰ����
                // �̵� �� ��ġ��ġ
                ' CASE WHEN RTRIM(LTRIM(S.BODY_04)) <> '''' THEN ' +
                ' SUBSTRING(RTRIM(LTRIM(S.BODY_04)), 1, 2) + ''-'' + ' +
                ' SUBSTRING(RTRIM(LTRIM(S.BODY_04)), 3, 2) + ''-'' + ' +
                ' SUBSTRING(RTRIM(LTRIM(S.BODY_04)), 5, 2) ELSE ''''END as BODY_04, ' +
                // �̵� �� ��ġ��ġ
                ' CASE WHEN RTRIM(LTRIM(S.BODY_05)) <> '''' THEN ' +
                ' SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) + ''-'' + ' +
                ' SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 3, 2) + ''-'' + ' +
                ' SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 5, 2) ELSE ''''END as BODY_05, ' +
                // ��ġȣ��
                ' CASE WHEN SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) = ''01'' or SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) = ''02'' THEN ''1ȣ��'' ' +
                '      WHEN SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) = ''03'' or SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) = ''04'' THEN ''2ȣ��'' ' +
                '      WHEN SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) = ''05'' or SUBSTRING(RTRIM(LTRIM(S.BODY_05)), 1, 2) = ''06'' THEN ''3ȣ��'' ' +
                '      ELSE '''' END as HOGI, ' +
                // ���ۿ���
                ' CASE WHEN S.SEND_YN is NULL THEN ''N'' ELSE S.SEND_YN END as SEND_YN, ' +
                // �����Ͻ�
                ' CASE WHEN S.HS_DT is NULL THEN '''' ELSE SUBSTRING(S.HS_DT, 1, 19) END as SEND_DT ' +
                '   FROM IF_SEND_MV_RESULT S WITH (NOLOCK) ' +
                '   LEFT JOIN TT_HISTORY H WITH (NOLOCK) ' +
                // ��ǰ��ȣ
                '     ON RTRIM(LTRIM(S.BODY_03)) = RTRIM(LTRIM(H.ITEM_LOT)) ' +
                // TT_HISTORY �������� â���̵� �����͸� �˻�
                '    AND H.ID_TYPE = ''â���̵�'' ' +
                // �̵� �� ��ġ
                '    AND RTRIM(LTRIM(S.BODY_05)) = RTRIM(LTRIM(H.ID_CODE)) ' +
                // �̵��Ͻ�
                '    AND RTRIM(LTRIM(SUBSTRING(S.BODY_02, 1, 12))) = SUBSTRING(H.HS_DT,  1, 4) + ' +
                '                                             SUBSTRING(H.HS_DT,  6, 2) + SUBSTRING(H.HS_DT,  9, 2) + ' +
                '                                             SUBSTRING(H.HS_DT, 12, 2) + SUBSTRING(H.HS_DT, 15, 2)   ' +
                '  WHERE RTRIM(LTRIM(S.TC_CD)) = ''WM001700'' ' + WhereStr +
                '  ORDER BY S.HS_DT ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'��)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[360] �̵����� ��ȸ - ����['+E.Message+'], ����['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [�ݱ�]
//==============================================================================
procedure TfrmU360.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU360.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU360.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfo do
  begin
    if DataCol = 2 then
    begin
      if Column.Field.DataSet.FieldByName('PROC_MANUAL').AsString = '���' then
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
procedure TfrmU360.sbtClearClick(Sender: TObject);
begin
  edtLOT.Text           := '';  // ��ǰ��ȣ
  edtCODE.Text          := '';  // ��ǰ�ڵ�
  cbITEM_TYPE.ItemIndex := 0;   // ��ǰ����
  cbIN_SITE.ItemIndex   := 0;   // ������ġ
  edtITEM_INFO_08.Text  := '';  // �ֹ���ȣ
  edtITEM_INFO_06.Text  := '';  // �����ڵ�
  cbHogi.ItemIndex      := 0;   // �̵�ȣ��
  cbCBank.ItemIndex     := 0;   // �̵� ��
  cbCBay.ItemIndex      := 0;   // �̵� ��
  cbCLEvel.ItemIndex    := 0;   // �̵� ��
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
procedure TfrmU360.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    DatePicker1.SetFocus;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU360.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU360.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// DatePickerChange
//==============================================================================
procedure TfrmU360.DatePickerChange(Sender: TObject);
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
procedure TfrmU360.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU360.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU360.cbChange(Sender: TObject);
begin
  if (Sender as TComboBox).Tag = 0 then
  begin
    if (Sender as TComboBox).Text <> '��ü' then
    begin
      cbCBank.Items.Clear;
      cbCBank.Items.Add('��ü');
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
      cbCBank.Items.Add('��ü');
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
procedure TfrmU360.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU360.dgInfoTitleClick(Column: TColumnEh);
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
