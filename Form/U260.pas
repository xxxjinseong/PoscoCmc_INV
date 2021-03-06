unit U260;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage ;

type
  TfrmU260 = class(TForm)
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
    sp_OrderJobEnd: TADOStoredProc;
    Panel10: TPanel;
    Panel12: TPanel;
    tmrQuery: TTimer;
    qryJobCnt: TADOQuery;
    sp_GetLugg: TADOStoredProc;
    sp_GetEmptyRack: TADOStoredProc;
    qryOrder: TADOQuery;
    dsOrder: TDataSource;
    Pnl_Top: TPanel;
    edtITEM_CODE: TEdit;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel6: TPanel;
    Pnl_Order: TPanel;
    sbt_Order: TSpeedButton;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    Panel7: TPanel;
    Panel29: TPanel;
    Panel23: TPanel;
    edtITEM_NO: TEdit;
    Panel1: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Edit4: TEdit;
    Edit5: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Edit6: TEdit;
    cbINT_TYPE: TComboBox;
    Pnl_Label: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Img_Barcode: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Pnl_Port: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Shape1: TShape;
    Panel13: TPanel;
    SpeedButton1: TSpeedButton;
    Label11: TLabel;
    Panel17: TPanel;
    SpeedButton2: TSpeedButton;
    ComboBox1: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPress2(Sender: TObject; var Key: Char);
    procedure cbMoveCntChange(Sender: TObject);
    procedure tmrQueryTimer(Sender: TObject);
    procedure cbSC_HOGIChange(Sender: TObject);
    procedure sbtClea2Click(Sender: TObject);
    procedure sbt_OrderClick(Sender: TObject);
    procedure Pnl_MainResize(Sender: TObject);
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
    procedure fnCommandQueryOrderCnt;
    procedure fnCommandClose;
    procedure fnWmMsgRecv (var MSG : TMessage) ; message WM_USER ;
    procedure fnCommandOrderDisPlay;
    function  fnGetEmptyRack(SC_HOGI, ITEM, LOT_NO:String): String;
    function  fnOrderDataInsert(OrderData: TTORDER): Boolean;
  end;
  procedure U260Create();

const
  FormNo ='260';

var
  frmU260: TfrmU260;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U260Create
//==============================================================================
procedure U260Create();
begin
  if not Assigned( frmU260 ) then
  begin
    frmU260 := TfrmU260.Create(Application);
    with frmU260 do
    begin
      fnCommandStart;
    end;
  end;
  frmU260.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU260.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU260.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU260.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU260.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    fnWmMsgSend( 21211, 111 );
  end else
  begin
    fnWmMsgSend( 22221, 111 );
  end;

{
  fnCommandQuery ;
  fnCommandQueryOrderCnt;
  fnCommandOrderDisPlay;
  if not tmrQuery.Enabled then tmrQuery.Enabled := True;
}
//  dgInfo.SelectedRows.Clear;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU260.FormDeactivate(Sender: TObject);
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
procedure TfrmU260.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU260 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU260.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandAdd [????]
//==============================================================================
procedure TfrmU260.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU260.fnCommandExcel;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU260.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU260.fnCommandPrint;
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;
   {
  fnCommandQuery;
  EhPrint.DBGridEh := dgInfo;
  EhPrint.PageFooter.RightText.Clear;
  EhPrint.PageFooter.RightText.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS',Now()) + '   ' +
                                   MainDM.M_Info.UserCode+' / '+MainDM.M_Info.UserName);
  EhPrint.PageFooter.Font.Name := '????';
  EhPrint.PageFooter.Font.Size := 11;
  EhPrint.Preview;
  }
end;

//==============================================================================
// fnCommandQuery [????]
//==============================================================================
procedure TfrmU260.fnCommandQuery;
begin

end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU260.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU260.dgInfoCellClick(Column: TColumnEh);
var
  tmpCode : String;
begin
  try
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;
  except
    on E : Exception do
    begin
      if qryInfo.Active then qryInfo.Close;
      TraceLogWrite( '[260] ???????? ?????????? ???? | ' +
                     'dgInfoCellClick -> Exception : ['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU260.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU260.KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
  end;
end;

//==============================================================================
// KeyPress2
//==============================================================================
procedure TfrmU260.KeyPress2(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
  //
  end;
end;

//==============================================================================
// Pnl_MainResize
//==============================================================================
procedure TfrmU260.Pnl_MainResize(Sender: TObject);
begin
  Pnl_Label.Left := (((Sender as TPanel).Width - Pnl_Label.Width) div 2) - 5;
  Pnl_Port.Left := Pnl_Label.Left;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU260.sbtClearClick(Sender: TObject);
begin
end;

//==============================================================================
// sbtClea2Click
//==============================================================================
procedure TfrmU260.sbtClea2Click(Sender: TObject);
begin
end;

//==============================================================================
// sbt_ITEMClick [????????]
//==============================================================================
procedure TfrmU260.sbt_ITEMClick(Sender: TObject);
begin
  frmItemSearch := TfrmItemSearch.Create(Application);
  frmItemSearch.PnlFormName.Caption := '???? ???? ????';
  frmItemSearch.Caption := '????????';
  // ????????
//  frmItemSearch.edtCode.Text := edtCode.Text;
  frmItemSearch.ShowModal ;

  if m.Popup_ItemInfo.ResultCd = 'OK' then
  begin
//    edtCode.Text := m.Popup_ItemInfo.DATA01;
//    edtName.Text := m.Popup_ItemInfo.DATA02;
//    edtCode.SetFocus;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU260.dgInfoTitleClick(Column: TColumnEh);
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
procedure TfrmU260.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
  //
  end;
end;

//==============================================================================
// cbMoveCntChange [???????? ????????]
//==============================================================================
procedure TfrmU260.cbMoveCntChange(Sender: TObject);
begin
//  ComboSet;
  IniWrite( INI_PATH, 'IO_Info', 'MOVE_CNT' , IntToStr((Sender as TComboBox).ItemIndex) );
end;

//==============================================================================
// cbSC_HOGIChange [???????? ????????]
//==============================================================================
procedure TfrmU260.cbSC_HOGIChange(Sender: TObject);
begin
//  ComboSet;
  fnCommandQuery;
end;



//==============================================================================
// tmrQueryTimer
//==============================================================================
procedure TfrmU260.tmrQueryTimer(Sender: TObject);
begin
  try
    tmrQuery.Enabled := False;
    fnCommandQueryOrderCnt;
    fnCommandOrderDisPlay;
  finally
    tmrQuery.Enabled := True;
  end;
end;

//==============================================================================
// fnCommandQueryOrderCnt [?????? ???? ???? ????]
//==============================================================================
procedure TfrmU260.fnCommandQueryOrderCnt;
var
  StrSQL, SC_HOGI, IN_CNT, OT_CNT, MV_CNT : String;
  i : integer;
begin
  try
    with qryJobCnt do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT SC_HOGI, ' +
                '        SUM(JOB_CNT1) AS IN_CNT, ' +
                '        SUM(JOB_CNT2) AS OT_CNT, ' +
                '        SUM(JOB_CNT3) AS MV_SNT  ' +
                '   FROM ( SELECT 0 AS SC_HOGI, 0 AS JOB_CNT1, 0 as JOB_CNT2, 0 as JOB_CNT3 ' +
                '           UNION ALL ' +
                '          SELECT 0 AS SC_HOGI, ' +
                '                 CASE WHEN IO_STAT = ''????'' THEN 1 ELSE 0 END AS JOB_CNT1, ' +
                '                 0 as JOB_CNT2, ' +
                '                 0 as JOB_CNT3 ' +
                '            FROM TT_ORDER WITH (NOLOCK) ' +
                '           WHERE SC_HOGI = 0 ' +
                '           UNION ALL ' +
                '          SELECT 1 AS SC_HOGI, 0 AS JOB_CNT1, 0 as JOB_CNT2, 0 as JOB_CNT3 ' +
                '           UNION ALL ' +
                '          SELECT 1 AS SC_HOGI, ' +
                '                 CASE WHEN IO_STAT = ''????'' THEN 1 ELSE 0 END AS JOB_CNT1, ' +
                '                 CASE WHEN IO_STAT = ''????'' THEN 1 ELSE 0 END AS JOB_CNT2, ' +
	              '                 CASE WHEN IO_STAT = ''????'' THEN 1 ELSE 0 END AS JOB_CNT3  ' +
                '            FROM TT_ORDER WITH (NOLOCK) ' +
                '           WHERE SC_HOGI = 1 ' +
                '           UNION ALL ' +
                '          SELECT 2 AS SC_HOGI, 0 AS JOB_CNT1, 0 as JOB_CNT2, 0 as JOB_CNT3 ' +
                '           UNION ALL ' +
                '          SELECT 2 AS SC_HOGI, ' +
                '                 CASE WHEN IO_STAT = ''????'' THEN 1 ELSE 0 END AS JOB_CNT1, ' +
                '                 CASE WHEN IO_STAT = ''????'' THEN 1 ELSE 0 END AS JOB_CNT2, ' +
	              '                 CASE WHEN IO_STAT = ''????'' THEN 1 ELSE 0 END AS JOB_CNT3  ' +
                '            FROM TT_ORDER WITH (NOLOCK) ' +
                '           WHERE SC_HOGI = 2 ' +
                '           UNION ALL ' +
                '          SELECT 3 AS SC_HOGI, 0 AS JOB_CNT1, 0 as JOB_CNT2, 0 as JOB_CNT3 ' +
                '           UNION ALL ' +
                '          SELECT 3 AS SC_HOGI, ' +
                '                 CASE WHEN IO_STAT = ''????'' THEN 1 ELSE 0 END AS JOB_CNT1, ' +
                '                 CASE WHEN IO_STAT = ''????'' THEN 1 ELSE 0 END AS JOB_CNT2, ' +
	              '                 CASE WHEN IO_STAT = ''????'' THEN 1 ELSE 0 END AS JOB_CNT3  ' +
                '            FROM TT_ORDER WITH (NOLOCK) ' +
                '           WHERE SC_HOGI = 3 ' +
                '        ) JobCnt ' +
                '  GROUP BY SC_HOGI ' ;

      SQL.Text := StrSQL;
      Open;
      First;
      while not (Eof) do
      begin
        SC_HOGI := IntToStr(FieldByName('SC_HOGI').AsInteger);
        IN_CNT  := IntToStr(FieldByName('IN_CNT' ).AsInteger);
        OT_CNT  := IntToStr(FieldByName('OT_CNT' ).AsInteger);
        MV_CNT  := IntToStr(FieldByName('MV_SNT' ).AsInteger);

        if SC_HOGI <> '0' then
        begin
          TEdit(Self.FindComponent('edtJobCnt'+SC_HOGI)).Text := '????'+IN_CNT+' / '+'????'+OT_CNT+' / '+'????'+MV_CNT;
          if (IN_CNT = '0') and (OT_CNT = '0') and (MV_CNT = '0') then
               TEdit(Self.FindComponent('edtJob'+SC_HOGI)).Color := clLime
          else TEdit(Self.FindComponent('edtJob'+SC_HOGI)).Color := $00F2F2F2;
        end else
        begin
          TEdit(Self.FindComponent('edtJobCnt'+SC_HOGI)).Text := '????'+IN_CNT;
          if (IN_CNT = '0') then
               TEdit(Self.FindComponent('edtJob'+SC_HOGI)).Color := clLime
          else TEdit(Self.FindComponent('edtJob'+SC_HOGI)).Color := $00F2F2F2;
        end;
        inc(i);
        Next;
      end;
    end;
  except
    on E : Exception do
    begin
      if qryJobCnt.Active then qryJobCnt.Close;
      TraceLogWrite( '[260] ???????? ?????????? ???? | ' +
                     'fnCommandQueryOrderCnt -> StrSQL : ['+StrSQL+
                     '], Exception : ['+E.Message+']');
    end;
  end ;
end;

//==============================================================================
// sbt_OrderClick [????????]
//==============================================================================
procedure TfrmU260.sbt_OrderClick(Sender: TObject);
begin
//  OrderProcess(0);
end;



//==============================================================================
// fnOrderDataInsert [???????? ?????? Insert]
//==============================================================================
function TfrmU260.fnOrderDataInsert(OrderData: TTORDER): Boolean;
var
  StrSQL : String;

begin
  {
  try
    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    //=========================================================
    // ?????? ???? (???????? ??????, ???????? ?????????? ????)
    //=========================================================
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ' UPDATE TT_RACK ' +
                  '    SET ORDER_STAT = ' + QuotedStr('??????') +
                  '      , LUGG       = ' + QuotedStr( OrderData.Lugg ) +
                  '      , NOW_RESEV  = ' + QuotedStr( '' ) +
                  '      , BASE_ITEM  = ' + QuotedStr( OrderData.ITEM ) +
                  '  WHERE WMS_NO     = ' + QuotedStr( OrderData.WMS_NO ) +
                  '    AND RACK_LOC   = ' + QuotedStr( OrderData.RACK_MOVE_OT );
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Text := ' UPDATE TT_RACK ' +
                  '    SET ORDER_STAT = ' + QuotedStr('??????') +
                  '      , LUGG       = ' + QuotedStr( OrderData.Lugg ) +
                  '      , NOW_RESEV  = ' + QuotedStr( '' ) +
                  '      , BASE_ITEM  = ' + QuotedStr( OrderData.ITEM ) +
                  '  WHERE WMS_NO     = ' + QuotedStr( OrderData.WMS_NO ) +
                  '    AND RACK_LOC   = ' + QuotedStr( OrderData.RACK_MOVE_IN );
      ExecSQL;
      Close;
    end;

    //================================
    // ????????, ???????? ????
    //================================
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ' INSERT INTO TT_ORDER_ITEM( '+
                  '   WMS_NO, ORDER_DT, ORDER_SEQ, LUGG, ' +
                  '   ITEM, ITEM_NM, ORD_QTY, QTY, BOX_QTY, ' +
                  '   SPEC, UNIT, SET_YN, LOT_NO, ' +
                  '   EXPIRY_DAY, VALID_TYPE, EXPY_DATE, FST_IN_DT, ' +
                  '   BIGO_1, BIGO_2, BIGO_3, BIGO_4, USER_ID '+
                  ' ) VALUES ( '+
                  OrderData.WMS_NO+ ',' +QuotedStr(OrderData.ORDER_DT)+ ',' +OrderData.ORDER_SEQ+ ','+ QuotedStr(OrderData.LUGG)+ ',' +
                  QuotedStr(OrderData.ITEM)+ ',' +QuotedStr(OrderData.ITEM_NM)+ ',' +OrderData.ORD_QTY+ ',' +OrderData.QTY+ ',' +OrderData.BOX_QTY+ ',' +
                  QuotedStr(OrderData.SPEC)+ ',' +QuotedStr(OrderData.UNITS)+ ',' +QuotedStr(OrderData.SET_YN)+ ',' +QuotedStr(OrderData.LOT_NO)+ ',' +
                  OrderData.EXPIRY_DAY+ ',' +QuotedStr(OrderData.VALID_TYPE)+ ',' +QuotedStr(OrderData.EXPY_DATE)+ ',' +QuotedStr(OrderData.FST_IN_DT)+ ',' +
                  QuotedStr(OrderData.BIGO_1)+ ',' +QuotedStr(OrderData.BIGO_2)+ ',' +QuotedStr(OrderData.BIGO_3)+ ',' +QuotedStr(OrderData.BIGO_4)+ ',' +QuotedStr(OrderData.USER_ID) +
                  ' )';
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Text := ' INSERT INTO TT_ORDER( '+
                  '   WMS_NO, ORDER_DT, LUGG, IO_STAT, ' +
                  '   KIND_1, KIND_2, EMG_ORD, SC_HOGI, ' +
                  '   SRC_WMS_NO, SRC_SITE, SRC_BANK, SRC_BAY, SRC_LEVEL, ' +
                  '   DST_WMS_NO, DST_SITE, DST_BANK, DST_BAY, DST_LEVEL, ' +
                  '   NOW_MC, WORK_STAT, NOW_STAT, BIGO_STAT, NOW_SITE, ' +
                  '   CV_FR, CV_TO, MEMO_1, MEMO_2, ' +
                  '   MEMO_3, MEMO_4, AUTO_ORDER, INT_NO, INT_TYPE, ERP_NO ' +
                  ' ) VALUES ( '+
                  OrderData.WMS_NO+ ',' +QuotedStr(OrderData.ORDER_DT)+ ',' +QuotedStr(OrderData.LUGG)+ ',' +QuotedStr( OrderData.IO_STAT )+ ',' +
                  QuotedStr(OrderData.KIND_1)+ ',' +QuotedStr(OrderData.KIND_2)+ ',' +OrderData.EMG_ORD + ',' +OrderData.SC_HOGI + ',' +
                  OrderData.SRC_WMS_NO+ ',' +QuotedStr(OrderData.SRC_SITE)+ ',' +QuotedStr(OrderData.SRC_BANK)+ ',' +QuotedStr(OrderData.SRC_BAY)+ ',' +QuotedStr(OrderData.SRC_LEVEL)+ ',' +
                  OrderData.DST_WMS_NO+ ',' +QuotedStr(OrderData.DST_SITE)+ ',' +QuotedStr(OrderData.DST_BANK)+ ',' +QuotedStr(OrderData.DST_BAY)+ ',' +QuotedStr(OrderData.DST_LEVEL)+ ',' +
                  QuotedStr(OrderData.NOW_MC)+ ',' +QuotedStr(OrderData.WORK_STAT)+ ',' +QuotedStr(OrderData.NOW_STAT)+ ',' +QuotedStr(OrderData.BIGO_STAT)+ ',' +QuotedStr(OrderData.NOW_SITE)+ ',' +
                  QuotedStr(OrderData.CV_FR)+ ',' +QuotedStr(OrderData.CV_TO)+ ',' +QuotedStr(OrderData.MEMO_1)+ ',' +QuotedStr(OrderData.MEMO_2)+ ',' +
                  QuotedStr(OrderData.MEMO_3)+ ',' +QuotedStr(OrderData.MEMO_4) + ',' +QuotedStr(OrderData.AUTO_ORDER) +  ',' +QuotedStr(OrderData.INT_NO) + ',' +QuotedStr(OrderData.INT_TYPE) + ',' +QuotedStr(OrderData.ERP_NO) +
                  ')';
      ExecSQL;
      Close;
    end;
    if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;

    TraceLogWrite( '[260] ???????? ?????????? ???? | ' +
                   'OrderProcess -> ???????? : ['+OrderData.LUGG+
                   '], ???????? : ['+OrderData.ITEM+
                   '], ???????? : ['+OrderData.BOX_QTY+
                   '], ???????? : ['+OrderData.RACK_MOVE_OT+
                   '], ???????? : ['+OrderData.RACK_MOVE_IN+']');

  except
    on E : Exception do
    begin
      if qryTemp.Active then qryTemp.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite( '[260] ???????? ?????????? ???? | ' +
                     'fnOrderDataInsert -> StrSQL : ['+StrSQL+
                     '], ???????? : ['+OrderData.LUGG+
                     '], Exception : ['+E.Message+']');
    end;
  end;
  }
end;

//==============================================================================
// GetEmptyRack
//==============================================================================
function TfrmU260.fnGetEmptyRack(SC_HOGI, ITEM, LOT_NO:String): String;
var
  TmpSCNo : Integer;
  StrRc : String;
begin
  try
    Result := '000000';
    TmpSCNo := StrToInt(SC_HOGI);
    with sp_GetEmptyRack do
    begin
      Close;
      Parameters.Refresh;
      Parameters.ParamByName('@fWMS_NO').Value   := StrToInt(MainDM.M_Info.WMS_NO);
      Parameters.ParamByName('@fSC_HOGI').Value  := TmpSCNo;
      Parameters.ParamByName('@fBANK').Value     := '';
      Parameters.ParamByName('@fBAY').Value      := '';
      Parameters.ParamByName('@fLEVEL').Value    := '';
      Parameters.ParamByName('@fITEM').Value     := ITEM;
      Parameters.ParamByName('@fLOT_NO').Value   := LOT_NO;
      Parameters.ParamByName('@rcCode').Value    := '';

      ExecProc;
      StrRc := Parameters.ParamValues['@rcCode'];
      Close;

      if Copy(StrRc,1,2) = 'OK' then
      begin
        Result := Copy(StrRc,4,6);
      end;
    end;
  except
    on E : Exception do
    begin
      if sp_GetEmptyRack.Active then sp_GetEmptyRack.Close;
      TraceLogWrite( '[260] ???????? ?????????? ???? | ' +
                     'fnGetEmptyRack -> SC_HOGI : [' + SC_HOGI +
                     '], ITEM : [ '+ITEM+
                     '], LOT_NO : [ '+LOT_NO+
                     '], StrRc : [ '+StrRc+
                     '], Exception : ['+E.Message+']');
    end;
  end;
end;


//==============================================================================
// fnCommandOrderDisPlay
//==============================================================================
procedure TfrmU260.fnCommandOrderDisPlay;
var
  StrSQL : String;
begin
  try
    with qryOrder do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      StrSQL := ' SELECT O.WMS_NO, O.ORDER_DT, O.LUGG, O.IO_STAT,' +
                '        O.KIND_1, O.KIND_2, O.EMG_ORD, O.SC_HOGI,' +
                ' 	     O.SRC_WMS_NO, O.SRC_SITE, O.SRC_BANK, O.SRC_BAY, O.SRC_LEVEL,' +
                ' 	     O.DST_WMS_NO, O.DST_SITE, O.DST_BANK, O.DST_BAY, O.DST_LEVEL,' +
                ' 	     O.SRC_BANK+''-''+O.SRC_BAY+''-''+O.SRC_LEVEL SRC_RACK_LOC,' +
                ' 	     O.DST_BANK+''-''+O.DST_BAY+''-''+O.DST_LEVEL DST_RACK_LOC,' +
                ' 	     O.NOW_MC, O.WORK_STAT, O.NOW_STAT, O.BIGO_STAT, O.NOW_SITE,' +
                ' 	     O.USED_YN, O.END_YN, O.RE_WORK, O.ERR_STAT, O.ERR_CODE, O.ERR_NAME,' +
                ' 	     O.CV_FR, O.CV_TO, O.TO_FIX_YN,' +
                ' 	     O.MEMO_1, O.MEMO_2, O.MEMO_3, O.MEMO_4,' +
                ' 	     O.ERP_NO, O.ERP_SEQ, O.INT_NO, O.INT_TYPE,' +
                ' 	     OI.ORDER_SEQ, OI.ITEM, OI.ITEM_NM, OI.ORD_QTY, OI.QTY, OI.BOX_QTY,' +
                ' 	     OI.SPEC, OI.UNIT, OI.SET_YN, OI.LOT_NO,' +
                ' 	     OI.EXPIRY_DAY, OI.VALID_TYPE, OI.EXPY_DATE, OI.FST_IN_DT,' +
                ' 	     OI.BIGO_1, OI.BIGO_2, OI.BIGO_3, OI.BIGO_4, 0 ETC' +
                '   FROM TT_ORDER O WITH (NOLOCK)' +
                '   LEFT JOIN TT_ORDER_ITEM OI WITH (NOLOCK)' +
                '     ON O.WMS_NO   = OI.WMS_NO' +
                '    AND O.ORDER_DT = OI.ORDER_DT' +
                '  WHERE 1 = 1 ' +
                '    AND O.IO_STAT = ''????'' ' +
                '    AND O.END_YN  = ''N'' ' +
                '  ORDER BY O.ORDER_DT' ;
      SQL.Text := StrSQL;
      Open;
      EnableControls;
    end;
  except
    on E : Exception do
    begin
      if qryOrder.Active then qryOrder.Close;
      TraceLogWrite( '[260] ???????? ?????????? ???? | ' +
                     'fnCommandOrderDisPlay -> StrSQL : ['+StrSQL+
                     '], Exception : ['+E.Message+']');
    end;
  end ;
end;

end.

