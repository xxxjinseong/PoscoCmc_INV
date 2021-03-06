unit U110;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus ;

type
  TfrmU110 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    qryTemp: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    pmControl: TPopupMenu;
    mnCodeDel: TMenuItem;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    dgInfo: TDBGridEh;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    dgInfoSub: TDBGridEh;
    Pnl_Top: TPanel;
    Panel1: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    edtCode: TEdit;
    Panel4: TPanel;
    edtName: TEdit;
    Panel5: TPanel;
    cbAdmin_YN: TComboBox;
    qryInfoSub: TADOQuery;
    dsInfoSub: TDataSource;
    CheckBoxAll: TCheckBox;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    sbtUsed: TSpeedButton;
    Panel13: TPanel;
    sbtNone: TSpeedButton;
    SlectCnt: TLabel;
    qryTempSub: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure ComboChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure mnCodeDelClick(Sender: TObject);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure pmControlPopup(Sender: TObject);
    procedure Pnl_MainResize(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure CheckBoxAllClick(Sender: TObject);
    procedure dgInfoSubDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dgInfoSubSelectionChanged(Sender: TObject);
    procedure dgInfoSubCellClick(Column: TColumnEh);

    procedure sbtUsedClick(Sender: TObject);
    procedure dgInfoDblClick(Sender: TObject);
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
    procedure SetComboBox ;
    procedure fnCommandQuerySub(Code:String);
    procedure ProcDeleteCode(Code: String);
    procedure ProcUpdateCode(Code,MenuNo,Used: String);
  end;
  procedure U110Create();

const
  FormNo ='110';

var
  frmU110: TfrmU110;
  SrtFlag : integer = 0 ;

implementation

uses Main, U110_Pop ;

{$R *.dfm}

//==============================================================================
// U110Create
//==============================================================================
procedure U110Create();
begin
  if not Assigned( frmU110 ) then
  begin
    frmU110 := TfrmU110.Create(Application);
    with frmU110 do
    begin
      fnCommandStart;
    end;
  end;
  frmU110.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU110.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU110.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU110.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU110.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    fnWmMsgSend( 12121, 111 );
  end else
  begin
    fnWmMsgSend( 22221, 111 );
  end;
  SetComboBox;
  fnCommandQuery ;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU110.FormDeactivate(Sender: TObject);
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
procedure TfrmU110.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU110 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU110.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandAdd [????]
//==============================================================================
procedure TfrmU110.fnCommandAdd  ;
begin
  frmU110_Pop := TfrmU110_Pop.Create(Application);
  frmU110_Pop.PnlFormName.Caption := '?????? ???? ????';
  frmU110_Pop.Caption := '?????? ???? ????';
  frmU110_Pop.btnSave.Caption := '?? ??';

  // ??????????
  frmU110_Pop.edtUSERID.Text  := '';
  frmU110_Pop.edtUSERID.Color := clWhite;
  frmU110_Pop.edtUSERID.ReadOnly := False;

  // ????????
  frmU110_Pop.edtUSERID.Text  := '';
  frmU110_Pop.edtUSERID.Color := clWhite;
  frmU110_Pop.edtUSERID.ReadOnly := False;

  // ??????????
  frmU110_Pop.edtPW.Text  := '';
  frmU110_Pop.edtPW.Color := clWhite;
  frmU110_Pop.edtPW.ReadOnly := False;

  // ????????
  frmU110_Pop.edtPWCheck.Text  := '';
  frmU110_Pop.edtPWCheck.Color := clWhite;
  frmU110_Pop.edtPWCheck.ReadOnly := False;

  // ??????????
  frmU110_Pop.edtETC.Text  := '';
  frmU110_Pop.edtETC.Color := clWhite;
  frmU110_Pop.edtETC.ReadOnly := False;

  // ??????????
  frmU110_Pop.cbAUTHORITY.ItemIndex := 0;
  frmU110_Pop.cbAUTHORITY.Color := clWhite;

  // ????????
  frmU110_Pop.PnlCurrPW.Visible := False;
  frmU110_Pop.edtCurrPW.Visible := False;

  frmU110_Pop.ShowModal ;
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU110.fnCommandExcel;
begin
  if hlbEhgridListExcel(dgInfo, '??????????' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU110.fnCommandDelete;
var
  i : Integer;
  tmpCode : String;
begin
  if not qryInfo.Active then Exit;
  if dgInfo.SelectedRows.Count < 1 then Exit ;

  if qryInfo.FieldByName('USER_ID').AsString = MainDM.M_Info.UserCode then
  begin
    MessageDlg('  ???? ???????????? ???? ?? ?? ????????.', mtWarning, [mbYes], 0) ;
    Exit;
  end;

  if MainDM.M_Info.UserAdmin <> 'Y' then
  begin
    MessageDlg('  ???? ???????????? ?????? ?????? ???????? ???? ?? ?? ????????.', mtWarning, [mbYes], 0) ;
    Exit;
  end;

  tmpCode := UpperCase(qryInfo.FieldByName('USER_ID').AsString);
  if MessageDlg('  ?????? ??????????['+tmpCode+']?? ?????????????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;

  for i := 0 to (dgInfo.SelectedRows.Count-1) do
  begin
    with dgInfo.DataSource.DataSet do
    begin
      GotoBookmark(pointer(dgInfo.SelectedRows.Items[i]));
      ProcDeleteCode(UpperCase(qryInfo.FieldByName('USER_ID').AsString));
    end;
  end;
  SetComboBox;
  fnCommandQuery;
  if qryInfoSub.Active then qryInfoSub.Close;
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU110.fnCommandPrint;
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
// fnCommandQuery [????]
//==============================================================================
procedure TfrmU110.fnCommandQuery;
var
  WhereStr, StrSQL : String;
begin
  try
    WhereStr := '' ;
    // ??????????
    if (Trim(edtCode.Text) <> '') then
      WhereStr := WhereStr + ' AND USER_ID LIKE ' + QuotedStr('%'+edtCode.Text+'%') ;
    // ????????
    if (Trim(edtName.Text) <> '') then
      WhereStr := WhereStr + ' AND USER_NM LIKE ' + QuotedStr('%'+edtName.Text+'%') ;
    // ??????????
    if (cbAdmin_YN.Text <> '????') then
      WhereStr := WhereStr + ' AND ADMIN_YN LIKE ' + QuotedStr('%'+cbAdmin_YN.Text+'%') ;

    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ROW_NUMBER() OVER(ORDER BY USER_ID) as IDX, *, ' +
                '        SUBSTRING(CR_DT, 1, 19) as tCR_DT ' +
                '   FROM TT_USER WITH (NOLOCK) ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '    AND WMS_NO = ' + QuotedStr(MainDM.M_Info.WMS_NO);
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[110] ?????????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandQuery [????????]
//==============================================================================
procedure TfrmU110.fnCommandQuerySub(Code:String);
var
  WhereStr, StrSQL : String;
begin
  try
    CheckBoxAll.Checked := False;
    if Trim(Code) = '' then Exit;

    with qryInfoSub do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ROW_NUMBER() OVER(ORDER BY L.MENU_ID) as IDX, ' +
                '        (SELECT MENU_NM                      ' +
                '           FROM TT_MENU WITH (NOLOCK)        ' +
                '          WHERE WMS_NO = L.WMS_NO            ' +
                '            AND MENU_ID = M.MENU_INFO_1 ) GP_NM, ' +
                '        L.USER_ID, L.MENU_ID, L.MENU_NM, L.USED_YN ' +
                '   FROM TT_USER_MENU L WITH (NOLOCK) ' +
                '   LEFT JOIN TT_MENU M WITH (NOLOCK) ' +
                '     ON L.WMS_NO  = M.WMS_NO  ' +
                '    AND L.MENU_ID = M.MENU_ID ' +
                '  WHERE L.WMS_NO  = ' + QuotedStr(MainDM.M_Info.WMS_NO) +
                '    AND L.USER_ID = ' + QuotedStr(Code) +
                '    AND M.MENU_LVL = 2 ' +
                '  ORDER BY M.MENU_ID ';
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfoSub.Close;
      TraceLogWrite('[110] ?????????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU110.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// SetComboBox
//==============================================================================
procedure TfrmU110.SetComboBox;
begin
//
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU110.dgInfoCellClick(Column: TColumnEh);
var
  tmpCode : String;
begin
  try
    SlectCnt.Caption := '0';
    dgInfoSub.SelectedRows.Clear;
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;
    tmpCode := UpperCase(qryInfo.FieldByName('USER_ID').AsString);
    fnCommandQuerySub(tmpCode);
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[110] ?????????? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoDblClick : ?????? ????
//==============================================================================
procedure TfrmU110.dgInfoDblClick(Sender: TObject);
begin
  if MainDM.M_Info.UserAdmin <> 'Y' then Exit;

  frmU110_Pop := TfrmU110_Pop.Create(Application);
  frmU110_Pop.PnlFormName.Caption := '?????? ???? ????';
  frmU110_Pop.Caption := '?????? ???? ????';
  frmU110_Pop.btnSave.Caption := '?? ??';

  // ?????? ????
  frmU110_Pop.edtUSERID.Text  := UpperCase(qryInfo.FieldByName('USER_ID').AsString);
  frmU110_Pop.edtUSERID.Color := $00E9F3E9;
  frmU110_Pop.edtUSERID.ReadOnly := True;

  // ?????? ????
  frmU110_Pop.edtUSERNM.Text  := UpperCase(qryInfo.FieldByName('USER_NM').AsString);
  frmU110_Pop.edtUSERNM.Color := clWhite;
  frmU110_Pop.edtUSERNM.ReadOnly := False;

  // ?????? ????
  frmU110_Pop.edtPW.Text  := UpperCase(qryInfo.FieldByName('USER_PW').AsString);
  frmU110_Pop.edtPW.Color := clWhite;
  frmU110_Pop.edtPW.ReadOnly := False;

  // ????????
  frmU110_Pop.edtPWCheck.Text  := UpperCase(qryInfo.FieldByName('USER_PW').AsString);
  frmU110_Pop.edtPWCheck.Color := clWhite;
  frmU110_Pop.edtPWCheck.ReadOnly := False;

  // ?????? ????
  frmU110_Pop.edtETC.Text  := UpperCase(qryInfo.FieldByName('USER_INFO_1').AsString);
  frmU110_Pop.edtETC.Color := clWhite;
  frmU110_Pop.edtETC.ReadOnly := False;

  // ?????? ????
  frmU110_Pop.cbAUTHORITY.Text := UpperCase(qryInfo.FieldByName('ADMIN_YN').AsString);
  frmU110_Pop.cbAUTHORITY.Color := clWhite;

  // ????????
  frmU110_Pop.PnlCurrPW.Visible := True;
  frmU110_Pop.edtCurrPW.Visible := True;

  frmU110_Pop.ShowModal ;

  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    frmMain.cmdSetUp.Enabled := True;
    fnWmMsgSend( 12121, 111 );
  end else
  begin
    frmMain.cmdSetUp.Enabled := False;
    fnWmMsgSend( 22221, 111 );
  end;
end;

//==============================================================================
// dgInfoSubCellClick
//==============================================================================
procedure TfrmU110.dgInfoSubCellClick(Column: TColumnEh);
begin
  if not qryInfoSub.Active then Exit;
  if qryInfoSub.IsEmpty then Exit;
  dgInfoSub.SelectedRows.CurrentRowSelected := Not dgInfoSub.SelectedRows.CurrentRowSelected;
end;

//==============================================================================
// ComboChange
//==============================================================================
procedure TfrmU110.ComboChange(Sender: TObject);
begin
  if (Trim((Sender as TComboBox).Text) <> '') then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU110.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// ProcDeleteCode [????????????]
//==============================================================================
procedure TfrmU110.ProcDeleteCode(CODE: String);
var
  ExecNo : integer;
  StrSQL : String;
begin
  try
    //=======================
    // ?????? ????
    //=======================
    StrSQL := ' DELETE FROM TT_USER ' +
              '  WHERE WMS_NO  = ' + QuotedStr(MainDM.M_Info.WMS_NO) +
              '    AND USER_ID = ' + QuotedStr(CODE) ;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
        TraceLogWrite('[110] ?????????? ???? - ??????????['+CODE+'], ??????????['+MainDm.M_Info.UserCode+']')
      else
        TraceLogWrite('[110] ?????????? ???? ???? - ??????????['+CODE+'], ??????????['+MainDm.M_Info.UserCode+']');
      Close;
    end;

    //=======================
    // ?????? ???? ????
    //=======================
    StrSQL := ' DELETE FROM TT_USER_MENU ' +
              '  WHERE WMS_NO  = ' + QuotedStr(MainDM.M_Info.WMS_NO) +
              '    AND USER_ID = ' + QuotedStr(CODE) ;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
        TraceLogWrite('[110] ?????????? ???? ???? - ??????????['+CODE+'], ??????????['+MainDm.M_Info.UserCode+']')
      else
        TraceLogWrite('[110] ?????????? ???? ???? ???? - ??????????['+CODE+'], ??????????['+MainDm.M_Info.UserCode+']');
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[110] ?????????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// dgInfoSubDrawColumnCell
//==============================================================================
procedure TfrmU110.dgInfoSubDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgInfoSub do
  begin
    if Column.Field.DataSet.FieldByName('USED_YN').AsString = 'Y' then
    begin
      begin
      Canvas.Font.Color := clBlack;
      Canvas.Font.Style := [];
      end;
    end else
    begin
      Canvas.Font.Color := clRed;
      Canvas.Font.Style := [];
    end;
    dgInfoSub.defaultdrawcolumncell(rect, datacol, column, state);
  end;
end;

//==============================================================================
// pmControlPopup
//==============================================================================
procedure TfrmU110.pmControlPopup(Sender: TObject);
begin
  if qryInfo.RecordCount < 1 then Exit;
  if dgInfo.SelectedRows.Count < 1 then Exit ;

  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    mnCodeDel.Visible := True;
  end else
  begin
    mnCodeDel.Visible := False;
  end;
end;

//==============================================================================
// mnCodeDelClick
//==============================================================================
procedure TfrmU110.mnCodeDelClick(Sender: TObject);
begin
  fnCommandDelete;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU110.KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU110.sbtClearClick(Sender: TObject);
begin
  edtCode.Text := '';
  edtName.Text := '';
  cbAdmin_YN.ItemIndex := 0;
  dgInfoSub.SelectedRows.Clear;
  fnCommandQuery;
end;

//==============================================================================
// Pnl_MainResize
//==============================================================================
procedure TfrmU110.Pnl_MainResize(Sender: TObject);
begin
  dgInfo.Width := ((Sender as TPanel).Width - 10) div 2;
  CheckBoxAll.Left := dgInfoSub.Left + 19;
end;

//==============================================================================
// Splitter1Moved
//==============================================================================
procedure TfrmU110.Splitter1Moved(Sender: TObject);
begin
  CheckBoxAll.Left := dgInfoSub.Left + 19;
end;

//==============================================================================
// CheckBoxAllClick
//==============================================================================
procedure TfrmU110.CheckBoxAllClick(Sender: TObject);
begin
  if not qryInfoSub.Active then Exit;
  if qryInfoSub.IsEmpty then Exit;

  qryInfoSub.First;
  if CheckBoxAll.Checked then dgInfoSub.SelectedRows.SelectAll
  else                        dgInfoSub.SelectedRows.Clear;

  SlectCnt.Caption := IntToStr(dgInfoSub.SelectedRows.Count);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU110.dgInfoTitleClick(Column: TColumnEh);
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
// dgInfoTitleClick
//==============================================================================
procedure TfrmU110.dgInfoSubSelectionChanged(Sender: TObject);
begin
  SlectCnt.Caption := IntToStr(dgInfoSub.SelectedRows.Count);
end;

//==============================================================================
// sbtUsedClick
//==============================================================================
procedure TfrmU110.sbtUsedClick(Sender: TObject);
var
  i : Integer;
  StrSQL, Used : String;
begin
  if not qryInfoSub.Active then Exit;
  if dgInfoSub.SelectedRows.Count < 1 then Exit ;
  Used := UpperCase((Sender as TSpeedButton).Hint);

  if MessageDlg('  ???????? ?????????? ' + (Sender AS TSpeedButton).Caption+ ' (??)?? '  + #13#10 +
                '  ???? ????????????? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;

  for i := 0 to (dgInfoSub.SelectedRows.Count-1) do
  begin
    with dgInfoSub.DataSource.DataSet do
    begin
      GotoBookmark(pointer(dgInfoSub.SelectedRows.Items[i]));
      ProcUpdateCode(UpperCase(qryInfoSub.FieldByName('USER_ID').AsString),
                     UpperCase(qryInfoSub.FieldByName('MENU_ID').AsString),
                     Used);
    end;
  end;
  SlectCnt.Caption := '0';
  dgInfoSub.SelectedRows.Clear;
  if (not qryInfoSub.Active) or (qryInfoSub.RecordCount = 0) then Exit;
  fnCommandQuerySub(UpperCase(qryInfoSub.FieldByName('USER_ID').AsString));
end;

//==============================================================================
// ProcUpdateCode : ?????? ???????? ????????
//==============================================================================
procedure TfrmU110.ProcUpdateCode(Code,MenuNo,Used: String);
var
  ExecNo : integer;
  StrSQL : String;
begin
  try
    StrSQL := ' UPDATE TT_USER_MENU ' +
              '    SET USED_YN = ' + QuotedStr(Used) +
              '  WHERE WMS_NO  = ' + QuotedStr(MainDM.M_Info.WMS_NO) +
              '    AND USER_ID = ' + QuotedStr(Code) +
              '    AND MENU_ID = ' + QuotedStr(MenuNo) ;

    with qryTempSub do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
      begin
        if Code = MainDM.M_Info.UserCode then
          FrmMain.fnSetMenuLblClick(MenuNo, Used);
        TraceLogWrite('[110] ???????? ???????? - ??????????['+CODE+
                      '], ????????['+MenuNo+'], ????????['+Used+
                      '], ??????????['+MainDm.M_Info.UserCode+']');
      end else
      begin
        TraceLogWrite('[110] ???????? ???????? ???? - ??????????['+CODE+
                      '], ????????['+MenuNo+'], ????????['+Used+
                      '], ??????????['+MainDm.M_Info.UserCode+']');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTempSub.Close;
      TraceLogWrite('[110] ???????? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

end.




