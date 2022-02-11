unit U310;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus, System.DateUtils,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU310 = class(TForm)
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
    Panel2: TPanel;
    Panel3: TPanel;
    dgInfo: TDBGridEh;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    mnJobInComplete: TMenuItem;
    qryStat: TADOQuery;
    qryOrder: TADOQuery;
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
    cbIN_SITE: TComboBox;
    Panel13: TPanel;
    Panel16: TPanel;
    edtITEM_INFO_06: TEdit;
    edtITEM_INFO_08: TEdit;
    mnJobStackComplete: TMenuItem;
    Panel6: TPanel;
    Panel19: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    lblCnt: TLabel;
    tmrQuery: TTimer;
    Panel17: TPanel;
    Panel20: TPanel;
    cbBODY_01: TComboBox;
    cbPROC_STAT: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure mnProcClick(Sender: TObject);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure pmControlPopup(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure DatePickerChange(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure tmrQueryTimer(Sender: TObject);
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
    procedure OrderProcess(Mode: Integer);
  end;
  procedure U310Create();

const
  FormNo ='310';

var
  frmU310: TfrmU310;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U310Create
//==============================================================================
procedure U310Create();
begin
  if not Assigned( frmU310 ) then
  begin
    frmU310 := TfrmU310.Create(Application);
    with frmU310 do
    begin
      fnCommandStart;
    end;
  end;
  frmU310.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU310.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU310.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU310.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU310.FormActivate(Sender: TObject);
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
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU310.FormDeactivate(Sender: TObject);
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
procedure TfrmU310.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU310 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [����]
//==============================================================================
procedure TfrmU310.fnCommandStart;
begin
  DatePicker1.Date := Now -7;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandAdd [�ű�]
//==============================================================================
procedure TfrmU310.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [����]
//==============================================================================
procedure TfrmU310.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel(dgInfo, '�԰����� ����' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  ���� ������ �Ϸ��Ͽ����ϴ�.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [����]
//==============================================================================
procedure TfrmU310.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [�μ�]
//==============================================================================
procedure TfrmU310.fnCommandPrint;
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
procedure TfrmU310.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;
  // ��û����
  if (Trim(cbBODY_01.Text) <> '��ü') then
  begin
    if cbBODY_01.ItemIndex = 1 then
         WhereStr := WhereStr + ' AND R.BODY_01 = ''R'' '
    else WhereStr := WhereStr + ' AND R.BODY_01 = ''C'' ' ;
  end;

  // ó������
  if (Trim(cbPROC_STAT.Text) <> '��ü') then
    WhereStr := WhereStr + ' AND R.PROC_STAT = ' + QuotedStr(IntToStr(cbPROC_STAT.ItemIndex-1)) ;

  // ��ǰ��ȣ
  if (Trim(edtLOT.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_03)) LIKE ' + QuotedStr('%'+edtLOT.Text+'%') ;

  // ��ǰ�ڵ� or ��ǰ��
  if (Trim(edtCode.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_04)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_05)) LIKE ' + QuotedStr('%'+edtCode.Text+'%') + ')' ;

  // ��ǰ����
  if (Trim(cbITEM_TYPE.Text) <> '��ü') then
  begin
    if Trim(cbITEM_TYPE.Text) = '����ǰ' then
         WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_12)) = ''N'' '
    else WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_12)) = ''Y'' ';
  end;

  // ��������
  if (Trim(cbIN_SITE.Text) <> '��ü') then
  begin
    if      cbIN_SITE.ItemIndex = 1 then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_11)) LIKE ' + QuotedStr('%'+Main.GongJungLine1+'%')
    else if cbIN_SITE.ItemIndex = 2 then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_11)) LIKE ' + QuotedStr('%'+Main.GongJungLine2+'%')
    else if cbIN_SITE.ItemIndex = 3 then
      WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_11)) NOT IN (' + QuotedStr(Main.GongJungLine1) + ', ' + QuotedStr(Main.GongJungLine2) + ')';
  end;

  // �ֹ���ȣ
  if (Trim(edtITEM_INFO_08.Text) <> '') then
    WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.BODY_10)) LIKE ' + QuotedStr('%'+edtITEM_INFO_08.Text+'%') ;

  // �����ڵ�
  if (Trim(edtITEM_INFO_06.Text) <> '') then
    WhereStr := WhereStr + ' AND (RTRIM(LTRIM(R.BODY_08)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ' or ' +
                           '      RTRIM(LTRIM(R.BODY_09)) LIKE ' + QuotedStr('%'+edtITEM_INFO_06.Text+'%') + ')' ;

  // �����Ͻ�
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND RTRIM(LTRIM(R.RECV_DT)) BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                         '                                 AND ''' + TmpDate2 + TmpTime2 + ''' ' ;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT RECV_DT as PROC_INFO1 , BODY_02 as PROC_INFO2, BODY_03 as PROC_INFO3, ' +
                ' SUBSTRING(R.RECV_DT, 1, 19) as RECV_DT, ' +                   // �����Ͻ�
                ' CASE WHEN RTRIM(LTRIM(BODY_01)) = ''R'' THEN ''�԰�����'' ' +        // ��û����
                '      WHEN RTRIM(LTRIM(BODY_01)) = ''C'' THEN ''�������'' ' +
                '      ELSE '''' END as BODY_01, ' +
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(BODY_02)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(BODY_02)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_02, ' + // ��û�Ͻ�
                ' RTRIM(LTRIM(BODY_03)) as BODY_03, ' +                                // ��ǰ��ȣ
                ' RTRIM(LTRIM(BODY_04)) as BODY_04, ' +                                // ��ǰ�ڵ�
                ' RTRIM(LTRIM(BODY_05)) as BODY_05, ' +                                // ��ǰ��
                ' CASE WHEN RTRIM(LTRIM(BODY_06)) = '''' or RTRIM(LTRIM(BODY_06)) = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(BODY_06))) END as BODY_06, ' +  // �߷�
                ' CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(BODY_07)), 1, 8) + '' '' + ' +
                ' STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(BODY_07)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) as BODY_07, ' + // �����Ͻ�
                ' RTRIM(LTRIM(BODY_08)) as BODY_08, ' +                                // �����ڵ�
                ' RTRIM(LTRIM(BODY_09)) as BODY_09, ' +                                // ������
                ' RTRIM(LTRIM(BODY_10)) as BODY_10, ' +                                // �ֹ���ȣ
                ' RTRIM(LTRIM(BODY_11)) as BODY_11, ' +                                // ��������
                ' CASE WHEN RTRIM(LTRIM(BODY_12)) = ''N'' THEN ''����ǰ'' ' +
                '      WHEN RTRIM(LTRIM(BODY_12)) = ''Y'' THEN ''��ǰ'' ' +
                '      ELSE '''' END as BODY_12, ' +                            // ��ǰ����
                ' CASE WHEN PROC_STAT = ''0'' THEN ''�԰����'' ' +
                '      WHEN PROC_STAT = ''1'' THEN ''�԰�����'' ' +
                '      WHEN PROC_STAT = ''2'' THEN ''��ġ�Ϸ�'' ' +
                '      ELSE '''' END PROC_STAT, ' +
                ' CASE WHEN PROC_MANUAL = ''0'' THEN '''' ' +
                '      WHEN PROC_MANUAL = ''1'' THEN ''���'' ' +
                '      WHEN PROC_MANUAL = ''2'' THEN ''�԰�����'' ' +
                '      WHEN PROC_MANUAL = ''3'' THEN ''��ġ�Ϸ�'' ' +
                '      ELSE '''' END PROC_MANUAL ' +
                '   FROM IF_RECEIVE R WITH (NOLOCK)' +
                '  WHERE RTRIM(LTRIM(TC_CD)) = ''MW001300'' ' + WhereStr +
                '    AND R.PROC_STAT IN (''0'',''1'', ''2'') ' +
                '  ORDER BY R.RECV_DT' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+'��)';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[310] �԰����� ���� ��ȸ - ����['+E.Message+'], ����['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [�ݱ�]
//==============================================================================
procedure TfrmU310.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU310.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU310.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfo do
  begin
    if DataCol = 3 then
    begin
      if Column.Field.DataSet.FieldByName('PROC_STAT').AsString <> '�԰����' then
      begin
        Canvas.Font.Color := clNavy;
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
// pmControlPopup
//==============================================================================
procedure TfrmU310.pmControlPopup(Sender: TObject);
begin
  mnJobCancel.Visible := False;// ���
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;
  if dgInfo.SelectedRows.Count < 1 then Exit ;

  if (MainDM.M_Info.UserAdmin = 'Y') then  // ������ ����
  begin
    mnJobCancel.Visible        := True; // ���
    mnJobInComplete.Visible    := False;// �԰�����
    mnJobStackComplete.Visible := False;// ��ġ�Ϸ�
  end else
  begin
    mnJobCancel.Visible        := False;// ���
    mnJobInComplete.Visible    := False;// �԰�����
    mnJobStackComplete.Visible := False;// ��ġ�Ϸ�
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU310.sbtClearClick(Sender: TObject);
begin
  cbBODY_01.ItemIndex   := 0;
  cbPROC_STAT.ItemIndex := 0;
  edtLOT.Text           := ''; // ��ǰ��ȣ
  edtCODE.Text          := ''; // ��ǰ�ڵ�
  cbITEM_TYPE.ItemIndex := 0;  // ��ǰ����
  cbIN_SITE.ItemIndex   := 0;  // ������ġ
  edtITEM_INFO_08.Text  := ''; // �ֹ���ȣ
  edtITEM_INFO_06.Text  := ''; // �����ڵ�
  DatePicker1.Date := Now -7;
  TimePicker1.Time := StrToTime('00:00:00');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [ǰ��ã��]
//==============================================================================
procedure TfrmU310.sbt_ITEMClick(Sender: TObject);
begin
//
end;

//==============================================================================
// tmrQueryTimer
//==============================================================================
procedure TfrmU310.tmrQueryTimer(Sender: TObject);
begin
  try
    tmrQuery.Enabled := False;
    fnCommandQuery;
  finally

  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU310.dgInfoTitleClick(Column: TColumnEh);
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
procedure TfrmU310.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    DatePicker1.SetFocus;
  end;
end;

//==============================================================================
// mnProcClick [���, �԰�����, ��ġ�Ϸ�]
//==============================================================================
procedure TfrmU310.mnProcClick(Sender: TObject);
begin
  // 1 : ���,  2 : �԰�����,  3 : ��ġ�Ϸ�
  OrderProcess((Sender as TMenuItem).Tag);
end;

//==============================================================================
// OrderProcess [����ó��]
//==============================================================================
procedure TfrmU310.OrderProcess(Mode: Integer);
var
  SelectInfo_1, SelectInfo_2, SelectInfo_3, SelectInfo_4, SelectInfo_5, TmpType, StrSQL, RowCnt, AddSQL : String;
  ExecNo, i : integer;
begin
  if (not qryInfo.Active) or
     (qryInfo.RecordCount < 1) or
     (dgInfo.SelectedRows.Count < 1) then
  begin
    MessageDlg('  �԰����� ������ �������� �ʾҽ��ϴ�.' + #13#10 +
               '  ����ó�� �� ������ ���� �� ������ �ֽʽÿ�.', mtConfirmation, [mbYes], 0);
    dgInfo.SetFocus;
    Exit;
  end;

  RowCnt := IntToStr(dgInfo.SelectedRows.Count) ;

  if      Mode = 1 then TmpType := '���'
  else if Mode = 2 then TmpType := '�԰�����'
  else if Mode = 3 then TmpType := '��ġ�Ϸ�';

  SelectInfo_1 := qryInfo.FieldByName('BODY_02').AsString; // ��û�Ͻ�(���� ������)
  SelectInfo_2 := qryInfo.FieldByName('BODY_03').AsString; // ��ǰ��ȣ(���� ������)

  if RowCnt = '1' then
  begin
    if MessageDlg('  ��û�Ͻ� - [ '+SelectInfo_1 + ' ]' + #13#10 +
                  '  ��ǰ��ȣ - [ '+SelectInfo_2 + ' ]' + #13#10 + #13#10 +
                  '  ���� �� �԰����� ������ ' + TmpType + 'ó�� �Ͻðڽ��ϱ�?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end else
  begin
    if MessageDlg('  [ ' + RowCnt + ' ] ���� �԰����� ������ �����ϼ̽��ϴ�. ' + #13#10 + #13#10 +
                  '  '+TmpType+'ó���� �����Ͻðڽ��ϱ�? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end;

  try
    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    for i := 0 to (dgInfo.SelectedRows.Count-1) do
    begin
      with dgInfo.DataSource.DataSet do
      begin
        GotoBookmark(pointer(dgInfo.SelectedRows.Items[i]));

        SelectInfo_1 := qryInfo.FieldByName('PROC_INFO1').AsString; // �����Ͻ�(�����ȵ�)
        SelectInfo_2 := qryInfo.FieldByName('PROC_INFO2').AsString; // ��û�Ͻ�(�����ȵ�)
        SelectInfo_3 := qryInfo.FieldByName('PROC_INFO3').AsString; // ��ǰ��ȣ(�����ȵ�)
        SelectInfo_4 := qryInfo.FieldByName('BODY_02'   ).AsString; // ��û�Ͻ�(���� ������)
        SelectInfo_5 := qryInfo.FieldByName('BODY_03'   ).AsString; // ��ǰ��ȣ(���� ������)

//        if qryInfo.FieldByName('PROC_STAT').AsString = '�԰����'  then
//             AddSQL := ' , PROC_STAT = ''1'' '
//        else AddSQL := '';
        AddSQL := '';

        with qryTemp do
        begin
          Close;
          SQL.Clear;
          StrSQL := ' UPDATE IF_RECEIVE ' +
                    '    SET PROC_MANUAL = ' + QuotedStr(IntToStr(Mode)) +
                    '      , MEMO_01     = ''C'' ' +
                    '      , UP_DT       = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' + AddSQL +
                    '  WHERE RTRIM(LTRIM(TC_CD)) = ''MW001300'' ' +        // �԰���������
                    '    AND RECV_DT = ' + QuotedStr(SelectInfo_1) + // �����Ͻ�(�����ȵ�)
                    '    AND BODY_02 = ' + QuotedStr(SelectInfo_2) + // ��û�Ͻ�(�����ȵ�)
                    '    AND BODY_03 = ' + QuotedStr(SelectInfo_3) ; // ��ǰ��ȣ(�����ȵ�)
          SQL.Text := StrSQL;
          ExecNo := ExecSQL;

          if ExecNo > 0 then
          begin
            Close;
            SQL.Clear;
            StrSQL := ' DELETE FROM IF_RECEIVE ' +
                      '  WHERE RTRIM(LTRIM(TC_CD)) = ''MW001300'' ' +        // �԰���������
                      '    AND RECV_DT = ' + QuotedStr(SelectInfo_1) + // �����Ͻ�(�����ȵ�)
                      '    AND BODY_02 = ' + QuotedStr(SelectInfo_2) + // ��û�Ͻ�(�����ȵ�)
                      '    AND BODY_03 = ' + QuotedStr(SelectInfo_3) ; // ��ǰ��ȣ(�����ȵ�)
            SQL.Text := StrSQL;
            ExecNo := ExecSQL;

            if ExecNo > 0 then
            begin
              TraceLogWrite('[310] �԰����� ���� ��� - ��û�Ͻ�['+SelectInfo_4+'], ��ǰ��ȣ['+SelectInfo_5+']');
            end else
            begin
              if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
              MessageDlg( '  �۾� ����ó���� �����Ͽ����ϴ�.(STEP1)', mtWarning, [mbYes], 0);
              Exit;
            end;
          end else
          begin
            if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
            MessageDlg( '  �۾� ����ó���� �����Ͽ����ϴ�.(STEP2)', mtWarning, [mbYes], 0);
            Exit;
          end;
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
      TraceLogWrite('[310] �԰����� ���� ���� ó�� - ����['+E.Message+'], ����['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// DatePickerChange
//==============================================================================
procedure TfrmU310.DatePickerChange(Sender: TObject);
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
procedure TfrmU310.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU310.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU310.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU310.cbKeyPress(Sender: TObject; var Key: Char);
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
// edtFontSizeChange
//==============================================================================
procedure TfrmU310.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU310.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;


end.