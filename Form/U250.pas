unit U250;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, System.DateUtils ;

type
  TfrmU250 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    qryTemp: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    pmControl: TPopupMenu;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    tmrQuery: TTimer;
    qryStat: TADOQuery;
    Splitter2: TSplitter;
    qryStock: TADOQuery;
    dsStock: TDataSource;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel4: TPanel;
    Panel6: TPanel;
    Pnl_Order: TPanel;
    sbt_Order: TSpeedButton;
    Panel7: TPanel;
    Panel31: TPanel;
    Panel23: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    cbDEST: TComboBox;
    Panel10: TPanel;
    cbID_TYPE: TComboBox;
    dgStock: TDBGridEh;
    edtITEM_INFO_01: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    edtITEM_INFO_02: TEdit;
    edtITEM_LOT: TEdit;
    cbITEM_TYPE: TComboBox;
    Panel12: TPanel;
    Panel33: TPanel;
    cbCBank: TComboBox;
    cbCBay: TComboBox;
    Panel17: TPanel;
    cbCLevel: TComboBox;
    Panel30: TPanel;
    cbCHogi: TComboBox;
    lblCnt: TLabel;
    SP_AUTO_INDEX: TADOStoredProc;
    dgInfo: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure sbtClearClick(Sender: TObject);
    procedure pmControlPopup(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure tmrQueryTimer(Sender: TObject);
    procedure sbt_OrderClick(Sender: TObject);
    procedure cbCellChange(Sender: TObject);
    procedure cbCHogiChange(Sender: TObject);
    procedure cbITEM_TYPEChange(Sender: TObject);
    procedure edtITEM_LOTKeyPress(Sender: TObject; var Key: Char);
    procedure edtITEM_INFOKeyPress(Sender: TObject; var Key: Char);
    procedure qryChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure dgStockSelectionChanged(Sender: TObject);
    procedure Pnl_MainResize(Sender: TObject);
    procedure cbID_TYPEChange(Sender: TObject);
    procedure cbDESTChange(Sender: TObject);
    procedure dgStockDrawColumnCell(Sender: TObject; const Rect: TRect;
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
    procedure fnCommandOrderDisPlay;
    procedure fnCommandStockStat;
    function  fnValidCheck : Boolean;
    function  fnOrderDataInsert(OrderData:TTORDER): Boolean;
    function  ItemInfoSearch(FieldName, ValueName, ItemCode: String): String;
  end;
  procedure U250Create();

const
  FormNo ='250';

var
  frmU250 : TfrmU250;
  SrtFlag : integer = 0 ;
  TmpCVNo : String;
  TmpQty  : integer;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U250Create
//==============================================================================
procedure U250Create();
begin
  if not Assigned( frmU250 ) then
  begin
    frmU250 := TfrmU250.Create(Application);
    with frmU250 do
    begin
      fnCommandStart;
    end;
  end;
  frmU250.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU250.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU250.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU250.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU250.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    fnWmMsgSend( 22221, 111 );
  end else
  begin
    fnWmMsgSend( 22221, 111 );
  end;

  fnCommandQuery ;
//  if not tmrQuery.Enabled then tmrQuery.Enabled := True;

  if MainDM.M_Info.UserAdmin = 'Y' then
       Pnl_Order.Visible := True
  else Pnl_Order.Visible := False;

  edtITEM_LOT.SetFocus;
  dgStock.SelectedRows.Clear;
  dgInfo.SelectedRows.Clear;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU250.FormDeactivate(Sender: TObject);
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
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU250.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU250 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU250.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandAdd [????]
//==============================================================================
procedure TfrmU250.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU250.fnCommandExcel;
begin
//
end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU250.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU250.fnCommandPrint;
begin
//
end;

//==============================================================================
// fnCommandQuery [????]
//==============================================================================
procedure TfrmU250.fnCommandQuery;
begin
  try
    fnCommandOrderDisPlay;
    fnCommandStockStat;
  except
    on E : Exception do
    begin
      TraceLogWrite('[250] ???????? ???? - ????['+E.Message+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU250.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// pmControlPopup
//==============================================================================
procedure TfrmU250.pmControlPopup(Sender: TObject);
begin
//
end;

//==============================================================================
// sbt_ITEMClick [????????]
//==============================================================================
procedure TfrmU250.sbt_ITEMClick(Sender: TObject);
begin
  frmItemSearch := TfrmItemSearch.Create(Application);
  frmItemSearch.PnlFormName.Caption := '???? ???? ????';
  frmItemSearch.Caption := '????????';
  // ????????
  frmItemSearch.edtCode.Text := edtITEM_INFO_01.Text;
  frmItemSearch.ShowModal ;

  if m.Popup_ItemInfo.ResultCd = 'OK' then
  begin
    if cbITEM_TYPE.ItemIndex in [0, 1] then
    begin
      edtITEM_INFO_01.Text := m.Popup_ItemInfo.DATA01; // ??????????
      edtITEM_INFO_02.Text := m.Popup_ItemInfo.DATA02; // ????????
    end else
    begin
      edtITEM_INFO_01.Text := m.Popup_ItemInfo.DATA03; // ????????
      edtITEM_INFO_02.Text := m.Popup_ItemInfo.DATA04; // ??????
    end;
    edtITEM_INFO_01.SetFocus;
  end;
end;

//==============================================================================
// fnCommandOrderDisPlay [????????????]
//==============================================================================
procedure TfrmU250.fnCommandOrderDisPlay;
var
  StrSQL : String;
begin
  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT O.ID_DATE, O.ID_TIME, ' +
                ' SUBSTRING(O.OR_DT, 1, 19) as OR_DT, ' +
                ' O.ID_TYPE, O.ID_INDEX, ' +
                ' O.ID_SC + ''????'' as ID_SC,' +
                ' O.LOAD_BANK + ''-'' + O.LOAD_BAY + ''-'' + O.LOAD_LEVEL as SRC_POS, ' +
                ' O.OT_SITE as DST_POS, ' +
                ' O.NOW_SITE as NOW_POS, ' +
                ' O.NOW_MACH, ' +
                ' O.ITEM_LOT, O.ITEM_TYPE, O.WRAP_YN, O.ID_USER, O.STATUS, O.PROCESS, ' +
                ' CASE WHEN O.ITEM_WEIGHT = '''' or O.ITEM_WEIGHT = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(O.ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_ORDER O WITH (NOLOCK)' +
                '  WHERE 1 = 1 ' +
                '    AND SUBSTRING(O.ID_TYPE, LEN(O.ID_TYPE)-1, 2) = ''????'' ' +
                '  ORDER BY O.ID_DATE, O.ID_TIME ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('[250] ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandStockStat [????????]
//==============================================================================
procedure TfrmU250.fnCommandStockStat;
var
  StrSQL, WhereStr, OrderByStr : String;
begin
  try
    WhereStr := '' ;
    OrderByStr := '';

    // ????????
    if (Trim(edtITEM_LOT.Text) <> '') then
      WhereStr := WhereStr + ' AND S.ITEM_LOT LIKE ' + QuotedStr('%'+edtITEM_LOT.Text+'%') ;

    // ????????
    if (Trim(cbITEM_TYPE.Text) <> '????') then
      WhereStr := WhereStr + ' AND S.ITEM_TYPE = ' + QuotedStr(cbITEM_TYPE.Text) ;

    // ????????
    if (Trim(edtITEM_INFO_01.Text) <> '') then
      WhereStr := WhereStr + ' AND ( (S.ITEM_INFO_01 LIKE' + QuotedStr('%'+edtITEM_INFO_01.Text+'%') + ') or ' +
                             '       (S.ITEM_INFO_03 LIKE' + QuotedStr('%'+edtITEM_INFO_01.Text+'%') + ') )  ' ;

    // ??????
    if (Trim(edtITEM_INFO_02.Text) <> '') then
      WhereStr := WhereStr + ' AND ( (S.ITEM_INFO_02 LIKE' + QuotedStr('%'+edtITEM_INFO_02.Text+'%') + ') or ' +
                             '       (S.ITEM_INFO_04 LIKE' + QuotedStr('%'+edtITEM_INFO_02.Text+'%') + ') )  ' ;

    // ???? ????
    if (Trim(cbCHogi.Text) <> '????') then
      WhereStr := WhereStr + ' AND S.RACK_HOGI = ' + QuotedStr(IntToStr(cbCHogi.ItemIndex)) ;

    // ???? ??
    if (Trim(cbCBank.Text) <> '????') then
      WhereStr := WhereStr + ' AND S.RACK_BANK = ' + QuotedStr(cbCBank.Text) ;

    // ???? ??
    if (Trim(cbCBay.Text) <> '????') then
      WhereStr := WhereStr + ' AND S.RACK_BAY = ' + QuotedStr(cbCBay.Text) ;

    // ???? ??
    if (Trim(cbCLevel.Text) <> '????') then
      WhereStr := WhereStr + ' AND S.RACK_LEVEL = ' + QuotedStr(cbCLevel.Text) ;

    with qryStock do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT S.*, ' +
                '        CASE WHEN R.OT_USED = ''Y'' THEN ''????'' ELSE ''????'' END OT_USED, ' +
                '        SUBSTRING(S.RACK_LOC, 1, 2) + ''-'' + ' +
                '        SUBSTRING(S.RACK_LOC, 3, 2) + ''-'' + ' +
                '        SUBSTRING(S.RACK_LOC, 5, 2) as RACK_LOC_DESC, ' +
                '   	   CASE WHEN C.OPTION1 = ''1'' THEN ''????'' ELSE ''????'' END SC_USED, ' +
                '        CASE WHEN S.ITEM_WEIGHT = '''' or S.ITEM_WEIGHT = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '             ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(S.ITEM_WEIGHT))) END as tITEM_WEIGHT, ' +
                '        CASE WHEN LEN(ITEM_INFO_05)= 14 THEN CONVERT([varchar](19), CONVERT(DATETIME, (SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)), 1, 8) + '' '' + ' +
                '                  STUFF(STUFF(SUBSTRING(RTRIM(LTRIM(ITEM_INFO_05)),9, 6), 3, 0, '':''), 6, 0, '':'')), 21), 21) ' +
                '             ELSE '''' END as tITEM_INFO_05, ' + // ????????
                '        SUBSTRING(S.IN_DATE, 1, 19) as tIN_DATE ' +
                '    FROM TT_RACK_STOCK S WITH (NOLOCK) ' +
                '    LEFT JOIN TT_RACK  R WITH (NOLOCK) ' +
                '      ON S.RACK_LOC = R.RACK_LOC ' +
                '    LEFT JOIN TC_CURRENT C WITH (NOLOCK) ' +
                '      ON C.CURRENT_ID = S.RACK_HOGI ' +
                '     AND C.CURRENT_NAME = ''SC_OT_USE'' ' +
                '   WHERE 1 = 1 ' + WhereStr +
                '     AND R.ORDER_STAT = ''????'' ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryStock.Close;
      TraceLogWrite('[250] ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// sbt_OrderClick [????????]
//==============================================================================
procedure TfrmU250.sbt_OrderClick(Sender: TObject);
begin
  OrderProcess(0);
  fnCommandQuery ;
end;

//==============================================================================
// OrderProcess [????????]
//==============================================================================
procedure TfrmU250.OrderProcess(Mode: Integer);
var
  StrSQL : String;
  StrMsg1, StrMsg2, StrMsg3, StrMsg4, ItemCode, ItemType : String;
  OrderData : TTORDER;
  i, RowCnt : integer;
begin
  // ???? ???? ???? ????
  if not fnValidCheck then Exit;

  RowCnt := dgStock.SelectedRows.Count ;
  if RowCnt = 1 then
  begin
    StrMsg1 := '???????? - ' + qryStock.FieldByName('ITEM_LOT'     ).AsString ;
    StrMsg2 := '???????? - ' + qryStock.FieldByName('ITEM_TYPE'    ).AsString;
    StrMsg3 := '???????? - ' + qryStock.FieldByName('RACK_LOC_DESC').AsString;
    StrMsg4 := '???????? - ' + cbID_TYPE.Text + ' / ' + cbDEST.Text;

    if MessageDlg('  ?????????? ????????????????? ' + #13#10 +
                  '  ' + StrMsg1 + #13#10 +
                  '  ' + StrMsg2 + #13#10 +
                  '  ' + StrMsg3 + #13#10 +
                  '  ' + StrMsg4, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  end else
  begin
    if MessageDlg('  [ ' + IntToStr(RowCnt) + ' ] ???? ?????? ??????????????. ' + #13#10 +
                  '  ?????????? ????????????????? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end;

  for i := 0 to RowCnt-1 do
  begin
    with dgStock.DataSource.DataSet do
    begin
      GotoBookmark(Pointer(dgStock.SelectedRows.Items[i]));

      OrderData.ID_DATE   := ' CONVERT(VARCHAR(MAX), GETDATE(), 112) ';
      OrderData.ID_TIME   := ' REPLACE(CONVERT(VARCHAR(MAX), GETDATE(), 108), '':'', '''') ';
      OrderData.ID_TYPE   := cbID_TYPE.Text;
      with SP_AUTO_INDEX do
      begin
        Parameters.ParamByName('@Index').Value := '2';
        ExecProc;
        OrderData.ID_INDEX  := Integer(Parameters.ParamValues['@RETURN_VALUE']);
        OrderData.ID_SUBIDX := 1;
      end;
      if cbID_TYPE.Text = '????????' then
           OrderData.ID_EMG := 1
      else OrderData.ID_EMG := 0 ;
      OrderData.ID_SC        := qryStock.FieldByName('RACK_HOGI').AsString;
      OrderData.ID_CODE      := qryStock.FieldByName('RACK_LOC' ).AsString;
      OrderData.LOAD_BANK    := qryStock.FieldByName('RACK_BANK' ).AsString;
      OrderData.LOAD_BAY     := qryStock.FieldByName('RACK_BAY'  ).AsString;
      OrderData.LOAD_LEVEL   := qryStock.FieldByName('RACK_LEVEL').AsString;
      OrderData.UNLOAD_BANK  := '00';
      OrderData.UNLOAD_BAY   := '00';
      OrderData.UNLOAD_LEVEL := '01'; // ???? 1??, ???? 2??
      OrderData.KIND_1       := '';
      OrderData.KIND_2       := '';
      OrderData.KIND_3       := '';
      OrderData.KIND_4       := '';
      OrderData.KIND_5       := '';
      OrderData.NOW_SITE     := IntToStr(SC_OT_BUFF[StrToInt(OrderData.ID_SC)]);
      OrderData.NOW_MACH     := 'SC';
      OrderData.IN_SITE      := qryStock.FieldByName('IN_SITE').AsString;
      OrderData.IN_DATE      := qryStock.FieldByName('IN_DATE').AsString;
      OrderData.OT_SITE      := '194';
      OrderData.OT_DATE      := '';
      OrderData.BCR_CHK      := 0;
      OrderData.STATUS       := '????????';
      OrderData.PROCESS      := '';

      //===============================================
      // ????????
      //===============================================
      OrderData.ITEM_LOT     := qryStock.FieldByName('ITEM_LOT'    ).AsString;
      OrderData.ITEM_TYPE    := qryStock.FieldByName('ITEM_TYPE'   ).AsString;
      OrderData.ITEM_WEIGHT  := qryStock.FieldByName('ITEM_WEIGHT' ).AsString;
      OrderData.ITEM_QTY     := qryStock.FieldByName('ITEM_QTY'    ).AsString;
      OrderData.ITEM_INFO_01 := qryStock.FieldByName('ITEM_INFO_01').AsString;
      OrderData.ITEM_INFO_02 := qryStock.FieldByName('ITEM_INFO_02').AsString;
      OrderData.ITEM_INFO_03 := qryStock.FieldByName('ITEM_INFO_03').AsString;
      OrderData.ITEM_INFO_04 := qryStock.FieldByName('ITEM_INFO_04').AsString;
      OrderData.ITEM_INFO_05 := qryStock.FieldByName('ITEM_INFO_05').AsString;
      OrderData.ITEM_INFO_06 := qryStock.FieldByName('ITEM_INFO_06').AsString;
      OrderData.ITEM_INFO_07 := qryStock.FieldByName('ITEM_INFO_07').AsString;
      OrderData.ITEM_INFO_08 := qryStock.FieldByName('ITEM_INFO_08').AsString;
      OrderData.ITEM_INFO_09 := qryStock.FieldByName('ITEM_INFO_09').AsString;
      OrderData.ITEM_INFO_10 := qryStock.FieldByName('ITEM_INFO_10').AsString;
      OrderData.ITEM_INFO_11 := qryStock.FieldByName('ITEM_INFO_11').AsString;
      OrderData.ITEM_INFO_12 := qryStock.FieldByName('ITEM_INFO_12').AsString;
      OrderData.ITEM_INFO_13 := qryStock.FieldByName('ITEM_INFO_13').AsString;
      OrderData.ITEM_INFO_14 := qryStock.FieldByName('ITEM_INFO_14').AsString;
      OrderData.ITEM_INFO_15 := qryStock.FieldByName('ITEM_INFO_15').AsString;
      OrderData.ITEM_INFO_16 := qryStock.FieldByName('ITEM_INFO_16').AsString;
      OrderData.ITEM_INFO_17 := qryStock.FieldByName('ITEM_INFO_17').AsString;
      OrderData.ITEM_INFO_18 := qryStock.FieldByName('ITEM_INFO_18').AsString;
      OrderData.ITEM_INFO_19 := qryStock.FieldByName('ITEM_INFO_19').AsString;
      OrderData.ITEM_INFO_20 := qryStock.FieldByName('ITEM_INFO_20').AsString;
      OrderData.PLT_CODE     := qryStock.FieldByName('PLT_CODE'    ).AsString;
      if cbDEST.ItemIndex = 0 then
           OrderData.WRAP_YN := 'N'
      else OrderData.WRAP_YN := 'Y';
      //else OrderData.WRAP_YN := qryStock.FieldByName('WRAP_YN'     ).AsString;
      OrderData.MEMO_1       := qryStock.FieldByName('MEMO_1'      ).AsString;
      OrderData.MEMO_2       := qryStock.FieldByName('MEMO_2'      ).AsString;
      OrderData.MEMO_3       := qryStock.FieldByName('MEMO_3'      ).AsString;
      OrderData.MEMO_4       := qryStock.FieldByName('MEMO_4'      ).AsString;
      OrderData.MEMO_5       := qryStock.FieldByName('MEMO_5'      ).AsString;
      OrderData.ID_USER      := MainDM.M_Info.UserCode;
      OrderData.END_YN       := 'N';
      OrderData.SEND_YN      := 'N';
      OrderData.OR_DT        := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';
      OrderData.UP_DT        := '';
      OrderData.CR_DT        := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';

      if not fnOrderDataInsert(OrderData) then
      begin

      end;
    end;
  end;
  fnCommandQuery;
end;

//==============================================================================
// fnOrderDataInsert [???????? ?????? Insert]
//==============================================================================
function TfrmU250.fnOrderDataInsert(OrderData: TTORDER): Boolean;
var
  ExecNo : integer;
  StrSQL : String;
begin
  Result := False;

  try
    StrSQL := ' INSERT INTO TT_ORDER( ID_DATE , ID_TIME, ID_TYPE, ' +
              '  ID_INDEX, ID_SUBIDX, ID_EMG, ID_SC, ID_CODE, ' +
              '  LOAD_BANK, LOAD_BAY, LOAD_LEVEL, UNLOAD_BANK, ' +
              '  UNLOAD_BAY, UNLOAD_LEVEL, KIND_1, KIND_2, KIND_3, ' +
              '  KIND_4, KIND_5, NOW_SITE, NOW_MACH, IN_SITE, ' +
              '  IN_DATE, OT_SITE, OT_DATE, BCR_CHK, STATUS, ' +
              '  PROCESS, ITEM_LOT, ITEM_TYPE, ITEM_WEIGHT, ITEM_QTY, ' +
              '  ITEM_INFO_01, ITEM_INFO_02, ITEM_INFO_03, ITEM_INFO_04, ITEM_INFO_05, ' +
              '  ITEM_INFO_06, ITEM_INFO_07, ITEM_INFO_08, ITEM_INFO_09, ITEM_INFO_10, ' +
              '  ITEM_INFO_11, ITEM_INFO_12, ITEM_INFO_13, ITEM_INFO_14, ITEM_INFO_15, ' +
              '  ITEM_INFO_16, ITEM_INFO_17, ITEM_INFO_18, ITEM_INFO_19, ITEM_INFO_20, ' +
              '  PLT_CODE, WRAP_YN, MEMO_1, MEMO_2, MEMO_3, ' +
              '  MEMO_4, MEMO_5, ID_USER, END_YN, SEND_YN, ' +
              '  OR_DT, UP_DT, CR_DT ) ' +
              ' VALUES( ' +
              OrderData.ID_DATE                 + ', ' +  // ID_DATE
              OrderData.ID_TIME                 + ', ' +  // ID_TIME
              QuotedStr(OrderData.ID_TYPE)      + ', ' +  // ID_TYPE
              IntToStr(OrderData.ID_INDEX)      + ', ' +  // ID_INDEX
              IntToStr(OrderData.ID_SUBIDX)     + ', ' +  // ID_SUBIDX
              IntToStr(OrderData.ID_EMG)        + ', ' +  // ID_EMG
              QuotedStr(OrderData.ID_SC)        + ', ' +  // ID_SC
              QuotedStr(OrderData.ID_CODE)      + ', ' +  // ID_CODE
              QuotedStr(OrderData.LOAD_BANK)    + ', ' +  // LOAD_BANK
              QuotedStr(OrderData.LOAD_BAY)     + ', ' +  // LOAD_BAY
              QuotedStr(OrderData.LOAD_LEVEL)   + ', ' +  // LOAD_LEVEL   ?????? ?? ????
              QuotedStr(OrderData.UNLOAD_BANK)  + ', ' +  // UNLOAD_BANK
              QuotedStr(OrderData.UNLOAD_BAY)   + ', ' +  // UNLOAD_BAY
              QuotedStr(OrderData.UNLOAD_LEVEL) + ', ' +  // UNLOAD_LEVEL
              QuotedStr(OrderData.KIND_1)       + ', ' +  // KIND_1
              QuotedStr(OrderData.KIND_2)       + ', ' +  // KIND_2
              QuotedStr(OrderData.KIND_3)       + ', ' +  // KIND_3
              QuotedStr(OrderData.KIND_4)       + ', ' +  // KIND_4
              QuotedStr(OrderData.KIND_5)       + ', ' +  // KIND_5
              QuotedStr(OrderData.NOW_SITE)     + ', ' +  // NOW_SITE
              QuotedStr(OrderData.NOW_MACH)     + ', ' +  // NOW_MACH
              QuotedStr(OrderData.IN_SITE)      + ', ' +  // IN_SITE    ???????? ????
              QuotedStr(OrderData.IN_DATE)      + ', ' +  // IN_DATE    ???????? ????
              QuotedStr(OrderData.OT_SITE)      + ', ' +  // OT_SITE    ???????? ????
              QuotedStr(OrderData.OT_DATE)      + ', ' +  // OT_DATE    ???????? ????
              IntToStr(OrderData.BCR_CHK)       + ', ' +  // BCR_CHK
              QuotedStr(OrderData.STATUS)       + ', ' +  // STATUS
              QuotedStr(OrderData.PROCESS)      + ', ' +  // PROCESS
              QuotedStr(OrderData.ITEM_LOT)     + ', ' +  // ITEM_LOT
              QuotedStr(OrderData.ITEM_TYPE)    + ', ' +  // ITEM_TYPE
              QuotedStr(OrderData.ITEM_WEIGHT)  + ', ' +  // ITEM_WEIGHT
              QuotedStr(OrderData.ITEM_QTY)     + ', ' +  // ITEM_QTY
              QuotedStr(OrderData.ITEM_INFO_01) + ', ' +  // ITEM_INFO_01
              QuotedStr(OrderData.ITEM_INFO_02) + ', ' +  // ITEM_INFO_02
              QuotedStr(OrderData.ITEM_INFO_03) + ', ' +  // ITEM_INFO_03
              QuotedStr(OrderData.ITEM_INFO_04) + ', ' +  // ITEM_INFO_04
              QuotedStr(OrderData.ITEM_INFO_05) + ', ' +  // ITEM_INFO_05
              QuotedStr(OrderData.ITEM_INFO_06) + ', ' +  // ITEM_INFO_06
              QuotedStr(OrderData.ITEM_INFO_07) + ', ' +  // ITEM_INFO_07
              QuotedStr(OrderData.ITEM_INFO_08) + ', ' +  // ITEM_INFO_08
              QuotedStr(OrderData.ITEM_INFO_09) + ', ' +  // ITEM_INFO_09
              QuotedStr(OrderData.ITEM_INFO_10) + ', ' +  // ITEM_INFO_10
              QuotedStr(OrderData.ITEM_INFO_11) + ', ' +  // ITEM_INFO_11
              QuotedStr(OrderData.ITEM_INFO_12) + ', ' +  // ITEM_INFO_12
              QuotedStr(OrderData.ITEM_INFO_13) + ', ' +  // ITEM_INFO_13
              QuotedStr(OrderData.ITEM_INFO_14) + ', ' +  // ITEM_INFO_14
              QuotedStr(OrderData.ITEM_INFO_15) + ', ' +  // ITEM_INFO_15
              QuotedStr(OrderData.ITEM_INFO_16) + ', ' +  // ITEM_INFO_16
              QuotedStr(OrderData.ITEM_INFO_17) + ', ' +  // ITEM_INFO_17
              QuotedStr(OrderData.ITEM_INFO_18) + ', ' +  // ITEM_INFO_18
              QuotedStr(OrderData.ITEM_INFO_19) + ', ' +  // ITEM_INFO_19
              QuotedStr(OrderData.ITEM_INFO_20) + ', ' +  // ITEM_INFO_20
              QuotedStr(OrderData.PLT_CODE)     + ', ' +  // PLT_CODE
              QuotedStr(OrderData.WRAP_YN)      + ', ' +  // WRAP_YN
              QuotedStr(OrderData.MEMO_1)       + ', ' +  // MEMO_1
              QuotedStr(OrderData.MEMO_2)       + ', ' +  // MEMO_2
              QuotedStr(OrderData.MEMO_3)       + ', ' +  // MEMO_3
              QuotedStr(OrderData.MEMO_4)       + ', ' +  // MEMO_4
              QuotedStr(OrderData.MEMO_5)       + ', ' +  // MEMO_5
              QuotedStr(OrderData.ID_USER)      + ', ' +  // ID_USER
              QuotedStr(OrderData.END_YN)       + ', ' +  // END_YN
              QuotedStr(OrderData.SEND_YN)      + ', ' +  // SEND_YN
              OrderData.OR_DT                   + ', ' +  // OR_DT      ???????? ????(??????????)
              QuotedStr(OrderData.UP_DT)        + ', ' +  // UP_DT
              OrderData.CR_DT                   + ') ' ;  // CR_DT      ???????? ????

    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
      begin
        Result := True;
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
        TraceLogWrite('[250] ???????? - ????['+OrderData.ITEM_TYPE+'], ????['+OrderData.ITEM_LOT+'], ????['+OrderData.ID_TYPE+'], ????['+OrderData.ID_CODE+']');
      end else
      begin
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
        TraceLogWrite('[250] ???????? - ????[?????? ????????], ????['+OrderData.ITEM_TYPE+'], ????['+OrderData.ITEM_LOT+'], ????['+OrderData.ID_TYPE+'], ????['+OrderData.ID_CODE+']');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[250] ???????? - ????['+E.Message+'], ????['+OrderData.ITEM_TYPE+'], ????['+OrderData.ITEM_LOT+'], ????['+OrderData.ID_TYPE+'], ????['+OrderData.ID_CODE+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnValidCheck [???????? ????]
//==============================================================================
function TfrmU250.fnValidCheck : Boolean;
begin
  try
    Result := False;

    if (not qryStock.Active) or
       (qryStock.RecordCount < 1) or
       (dgStock.SelectedRows.Count < 1) then
    begin
      MessageDlg('  ???? ?????? ???????? ??????????.' + #13#10 +
                 '  ?????? ???? ?? ?????? ????????.', mtConfirmation, [mbYes], 0);
      dgStock.SetFocus;
      Exit;
    end;
    Result := True;
  except
    on E : Exception do
    begin
      TraceLogWrite('[250] ???????? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// cbMCellChange
//==============================================================================
procedure TfrmU250.cbCellChange(Sender: TObject);
begin
  fnCommandStockStat;
end;

//==============================================================================
// cbCHogiChange
//==============================================================================
procedure TfrmU250.cbCHogiChange(Sender: TObject);
begin
  // ???? ???? ?? Bank ????
  cbCBank.Items.Clear;
  cbCBank.Items.Add('????');
  if (Sender as TComboBox).ItemIndex = 0 then
  begin
    cbCBank.Items.Add('01');
    cbCBank.Items.Add('02');
    cbCBank.Items.Add('03');
    cbCBank.Items.Add('04');
    cbCBank.Items.Add('05');
    cbCBank.Items.Add('06');
  end else
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
  cbCBank.ItemIndex  := 0;
  cbCBay.ItemIndex   := 0;
  cbCLevel.ItemIndex := 0;
  fnCommandQuery;
end;

//==============================================================================
// cbITEM_TYPEChange
//==============================================================================
procedure TfrmU250.cbITEM_TYPEChange(Sender: TObject);
var
  TmpData1, TmpData2 : String;
begin
  try
    fnCommandQuery;
    {
    if Trim(edtITEM_INFO_01.Text) = '' then Exit;
    if (Sender as TComboBox).Text = '??????' then
    begin
      TmpData1 := ItemInfoSearch('ITEM_INFO_01', 'ITEM_INFO_03', edtITEM_INFO_01.Text);  // ?????????? ?????????? Get
      TmpData2 := ItemInfoSearch('ITEM_INFO_02', 'ITEM_INFO_03', edtITEM_INFO_01.Text);
    end else
    if (Sender as TComboBox).Text = '????' then
    begin
      TmpData1 := ItemInfoSearch('ITEM_INFO_03', 'ITEM_INFO_01', edtITEM_INFO_01.Text);  // ???????????? ???????? Get
      TmpData2 := ItemInfoSearch('ITEM_INFO_04', 'ITEM_INFO_01', edtITEM_INFO_01.Text);  //
    end;

    if TmpData1 <> '' then
    begin
      edtITEM_INFO_01.Text := TmpData1;
      edtITEM_INFO_02.Text := TmpData2;
    end;
    }
  except
    on E : Exception do
    begin
      TraceLogWrite('[250] ???????? ???? - ????['+E.Message+'], ????[???????? ????]');
    end;
  end;
end;

//==============================================================================
// ItemInfoSearch
//==============================================================================
function TfrmU250.ItemInfoSearch(FieldName, ValueName, ItemCode: String): String;
var
  StrSQL, FName : String;
begin
  Result := '';
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ' + FieldName + ' as Data FROM TM_ITEM WITH (NOLOCK) ' +
                '  WHERE ' + ValueName + ' = ' + QuotedStr(ItemCode) ;
      SQL.Text := StrSQL;
      Open;
      if not (Bof and Eof) then
      begin
        Result := FieldByName('Data').AsString;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[250] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+'], ????[???????? ????]');
    end;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU250.sbtClearClick(Sender: TObject);
begin
  edtITEM_LOT.Text := '';
  cbITEM_TYPE.ItemIndex := 0;
  edtITEM_INFO_01.Text := '';
  edtITEM_INFO_02.Text := '';
  cbCHogi.ItemIndex := 0;
  cbCHogiChange(cbCHogi);
  cbID_TYPE.ItemIndex := 0;
  cbID_TYPEChange(cbID_TYPE);
  cbDEST.ItemIndex := 0;
  cbDESTChange(cbDEST);
  dgStock.SelectedRows.Clear;
  dgInfo.SelectedRows.Clear;
  edtITEM_LOT.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU250.dgInfoTitleClick(Column: TColumnEh);
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
// edtITEM_INFOKeyPress
//==============================================================================
procedure TfrmU250.edtITEM_INFOKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    (Sender as TEdit).Text := '';
    fnCommandQuery;
  end;
end;

//==============================================================================
// QryChange
//==============================================================================
procedure TfrmU250.qryChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// edtITEM_LOTKeyPress
//==============================================================================
procedure TfrmU250.edtITEM_LOTKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    (Sender as TEdit).Text := '';
    fnCommandQuery;
  end;
end;

//==============================================================================
// tmrQueryTimer
//==============================================================================
procedure TfrmU250.tmrQueryTimer(Sender: TObject);
begin
  try
    tmrQuery.Enabled := False;
//    fnCommandQuery;
  finally
    tmrQuery.Enabled := True;
  end;
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU250.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
{
  with dgInfo do
  begin
    if Column.Field.DataSet.FieldByName('ERR_STAT').AsString = 'Y' then
    begin
      Canvas.Font.Color := clRed;
      Canvas.Font.Style := [];
      dgInfo.defaultdrawcolumncell(rect, datacol, column, state);
    end;
  end;
  }
end;

//==============================================================================
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU250.dgStockDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with dgStock do
  begin
    if DataCol = 7 then
    begin
      if Column.Field.DataSet.FieldByName('SC_USED').AsString = '????' then
      begin
        Canvas.Font.Color := clRed;
        Canvas.Font.Style := [fsBold];
      end else
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Font.Style := [];
      end;
    end;

    if DataCol = 8 then
    begin
      if Column.Field.DataSet.FieldByName('OT_USED').AsString = '????' then
      begin
        Canvas.Font.Color := clRed;
        Canvas.Font.Style := [fsBold];
      end else
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Font.Style := [];
      end;
    end;
    dgStock.defaultdrawcolumncell(rect, datacol, column, state);
  end;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU250.cbKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    (Sender as TComboBox).ItemIndex := 0;
    fnCommandQuery;
  end;
end;

//==============================================================================
// dgStockSelectionChanged
//==============================================================================
procedure TfrmU250.dgStockSelectionChanged(Sender: TObject);
begin
  lblCnt.Caption := '(???? '+IntToStr(dgStock.SelectedRows.Count)+'??)';
end;

//==============================================================================
// Pnl_MainResize
//==============================================================================
procedure TfrmU250.Pnl_MainResize(Sender: TObject);
begin
  dgInfo.Height := ((Sender as TPanel).Height div 2) - 30;
end;

//==============================================================================
// cbID_TYPEChange
//==============================================================================
procedure TfrmU250.cbID_TYPEChange(Sender: TObject);
begin
  if cbID_TYPE.ItemIndex = 0 then
  begin
    cbID_TYPE.Color := clWhite;
    cbID_TYPE.Font.Color := clBlack;
  end else
  begin
    cbID_TYPE.Color := $00006200;
    cbID_TYPE.Font.Color := clWhite;
  end;
end;

//==============================================================================
// cbDESTChange
//==============================================================================
procedure TfrmU250.cbDESTChange(Sender: TObject);
begin
  if cbDEST.ItemIndex = 0 then
  begin
    cbDEST.Color := clWhite;
    cbDEST.Font.Color := clBlack;
  end else
  begin
    cbDEST.Color := $00006200;
    cbDEST.Font.Color := clWhite;
  end;
end;

end.

