unit U120;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.ComCtrls ;

type
  TfrmU120 = class(TForm)
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
    Pnl_Top: TPanel;
    Panel1: TPanel;
    Panel11: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtERR_CODE: TEdit;
    Panel4: TPanel;
    edtERR_NAME: TEdit;
    Panel5: TPanel;
    cbID_MACH: TComboBox;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel10: TPanel;
    Panel6: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure ComboChange(Sender: TObject);
    procedure dgInfoDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure mnCodeDelClick(Sender: TObject);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure pmControlPopup(Sender: TObject);
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
    procedure SetComboBox ;
    procedure ProcDeleteCode(MACH,CODE: String);
  end;
  procedure U120Create();

const
  FormNo ='120';

var
  frmU120: TfrmU120;
  SrtFlag : integer = 0 ;

implementation

uses Main, U120_Pop ;

{$R *.dfm}

//==============================================================================
// U120Create
//==============================================================================
procedure U120Create();
begin
  if not Assigned( frmU120 ) then
  begin
    frmU120 := TfrmU120.Create(Application);
    with frmU120 do
    begin
      fnCommandStart;
    end;
  end;
  frmU120.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU120.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU120.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU120.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU120.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    fnWmMsgSend( 11111, 111 );
  end else
  begin
    fnWmMsgSend( 21211, 111 );
  end;
  SetComboBox;
  fnCommandQuery ;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU120.FormDeactivate(Sender: TObject);
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
procedure TfrmU120.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU120 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU120.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandAdd [????]
//==============================================================================
procedure TfrmU120.fnCommandAdd  ;
begin
  frmU120_Pop := TfrmU120_Pop.Create(Application);
  frmU120_Pop.PnlFormName.Caption := '???? ???? ????';
  frmU120_Pop.Caption := '???? ???? ????';
  frmU120_Pop.btnSave.Caption := '?? ??';

  // ????????
  frmU120_Pop.cbID_MACH.ItemIndex := 0;
  frmU120_Pop.cbID_MACH.Color := clWhite;
  frmU120_Pop.cbID_MACH.Enabled := True;

  // ????????
  frmU120_Pop.edtERR_CODE.Text  := '';
  frmU120_Pop.edtERR_CODE.Color := clWhite;
  frmU120_Pop.edtERR_CODE.ReadOnly := False;

  // ????????
  frmU120_Pop.edtERR_NAME.Text  := '';
  frmU120_Pop.edtERR_NAME.Color := clWhite;
  frmU120_Pop.edtERR_NAME.ReadOnly := False;

  frmU120_Pop.ShowModal ;
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU120.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  if hlbEhgridListExcel(dgInfo, '????????' + '_' + FormatDatetime('YYYYMMDD', Now)) then
  begin
    MessageDlg('  ???? ?????? ??????????????.', mtConfirmation, [mbYes], 0);
  end;
end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU120.fnCommandDelete;
var
  i : Integer;
  tmpCode1 : String;
  tmpCode2 : String;
begin
  if not qryInfo.Active then Exit;
  if dgInfo.SelectedRows.Count < 1 then Exit ;

  tmpCode1 := UpperCase(qryInfo.FieldByName('ID_MACH' ).AsString); // ????
  tmpCode2 := UpperCase(qryInfo.FieldByName('ERR_CODE').AsString); // ????????

  if dgInfo.SelectedRows.Count = 1 then
  begin
    if MessageDlg('  ?????? ????????['+tmpCode2+']?? ?????????????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end else
  begin
    if MessageDlg('  ?????? ????????['+ IntToStr(dgInfo.SelectedRows.Count) +'??]?? ?????????????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end;

  for i := 0 to (dgInfo.SelectedRows.Count-1) do
  begin
    with dgInfo.DataSource.DataSet do
    begin
      GotoBookmark(pointer(dgInfo.SelectedRows.Items[i]));
      ProcDeleteCode(UpperCase(qryInfo.FieldByName('ID_MACH').AsString ),
                     UpperCase(qryInfo.FieldByName('ERR_CODE').AsString));
    end;
  end;
  SetComboBox;
  fnCommandQuery;
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU120.fnCommandPrint;
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
procedure TfrmU120.fnCommandQuery;
var
  WhereStr, StrSQL : String;
begin
  try
    WhereStr := '' ;
    // ????????
    if (Trim(cbID_MACH.Text) <> '????') then
      WhereStr := WhereStr + ' AND ID_MACH LIKE ' + QuotedStr('%'+cbID_MACH.Text+'%') ;
    // ????????
    if (Trim(edtERR_CODE.Text) <> '') then
      WhereStr := WhereStr + ' AND ERR_CODE LIKE ' + QuotedStr('%'+edtERR_CODE.Text+'%') ;
    // ????????
    if (Trim(edtERR_NAME.Text) <> '') then
      WhereStr := WhereStr + ' AND ERR_NAME LIKE ' + QuotedStr('%'+edtERR_NAME.Text+'%') ;

    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ROW_NUMBER() OVER(ORDER BY ID_MACH, ERR_CODE) as IDX, *,  ' +
                '        SUBSTRING(UP_DT, 1, 19) as tUP_DT, ' +
                '        SUBSTRING(CR_DT, 1, 19) as tCR_DT ' +
                '   FROM TM_ERROR WITH (NOLOCK) ' +
                '  WHERE 1 = 1 ' + WhereStr ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[120] ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU120.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// SetComboBox
//==============================================================================
procedure TfrmU120.SetComboBox;
begin
//
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU120.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// dgInfoDblClick
//==============================================================================
procedure TfrmU120.dgInfoDblClick(Sender: TObject);
begin
  if MainDM.M_Info.UserAdmin <> 'Y' then Exit;

  frmU120_Pop := TfrmU120_Pop.Create(Application);
  frmU120_Pop.PnlFormName.Caption := '???? ???? ????';
  frmU120_Pop.Caption := '???? ???? ????';
  frmU120_Pop.btnSave.Caption := '?? ??';

  // ????????
  frmU120_Pop.cbID_MACH.Text  := UpperCase(qryInfo.FieldByName('ID_MACH').AsString);
  frmU120_Pop.cbID_MACH.Color := $00E9F3E9;
  frmU120_Pop.cbID_MACH.Enabled := False;

  // ????????
  frmU120_Pop.edtERR_CODE.Text  := UpperCase(qryInfo.FieldByName('ERR_CODE').AsString);
  frmU120_Pop.edtERR_CODE.Color := $00E9F3E9;
  frmU120_Pop.edtERR_CODE.ReadOnly := True;

  // ????????
  frmU120_Pop.edtERR_NAME.Text  := qryInfo.FieldByName('ERR_NAME').AsString;
  frmU120_Pop.edtERR_NAME.Color := clWhite;
  frmU120_Pop.edtERR_NAME.ReadOnly := False;

  frmU120_Pop.ShowModal ;
end;

//==============================================================================
// ComboChange
//==============================================================================
procedure TfrmU120.ComboChange(Sender: TObject);
begin
  if (Trim((Sender as TComboBox).Text) <> '') then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU120.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// ProcDeleteCode [????????????]
//==============================================================================
procedure TfrmU120.ProcDeleteCode(MACH,CODE: String);
var
  ExecNo : integer;
  StrSQL : String;
begin
  try
    StrSQL := ' DELETE FROM TM_ERROR ' +
              '  WHERE ID_MACH  = ' + QuotedStr(MACH) +
              '    AND ERR_CODE = ' + QuotedStr(CODE) ;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
        TraceLogWrite('[120] ???????? ???? - ????['+MACH+'], ????['+CODE+'], ??????????['+MainDm.M_Info.UserCode+']')
      else
        TraceLogWrite('[120] ???????? ???? ???? - ????['+MACH+'], ????['+CODE+'], ??????????['+MainDm.M_Info.UserCode+']');
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[120] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// pmControlPopup
//==============================================================================
procedure TfrmU120.pmControlPopup(Sender: TObject);
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
procedure TfrmU120.mnCodeDelClick(Sender: TObject);
begin
  fnCommandDelete;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU120.KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU120.sbtClearClick(Sender: TObject);
begin
  cbID_MACH.ItemIndex := 0;
  edtERR_CODE.Text := '';
  edtERR_NAME.Text := '';
  fnCommandQuery;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU120.dgInfoTitleClick(Column: TColumnEh);
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
// edtRowHeightChange
//==============================================================================
procedure TfrmU120.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU120.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

end.




