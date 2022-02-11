unit U240;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, System.DateUtils ;

type
  TfrmU240 = class(TForm)
    dsInfo1: TDataSource;
    qryInfo1: TADOQuery;
    qryTemp: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Pnl_Top: TPanel;
    edtITEM_INFO_01: TEdit;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel4: TPanel;
    Panel6: TPanel;
    Pnl_Order: TPanel;
    sbt_Order: TSpeedButton;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    Panel7: TPanel;
    Panel29: TPanel;
    Panel31: TPanel;
    Panel23: TPanel;
    edtITEM_LOT: TEdit;
    Panel1: TPanel;
    cbITEM_TYPE: TComboBox;
    edtITEM_INFO_02: TEdit;
    edtITEM_QTY: TEdit;
    edtITEM_WEIGHT: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    cbIN_POS: TComboBox;
    cbCellCtrl: TComboBox;
    dgInfo1: TDBGridEh;
    PnlManualSelect: TPanel;
    Panel10: TPanel;
    Panel33: TPanel;
    cbCBank: TComboBox;
    cbCBay: TComboBox;
    Panel17: TPanel;
    cbCLevel: TComboBox;
    Panel30: TPanel;
    Panel5: TPanel;
    cbCHogi: TComboBox;
    lblCnt: TLabel;
    Panel36: TPanel;
    Panel35: TPanel;
    dgInfo2: TDBGridEh;
    qryInfo2: TADOQuery;
    dsInfo2: TDataSource;
    SP_CELL_FIND: TADOStoredProc;
    tmrQuery: TTimer;
    Pnl_Btm: TPanel;
    dgInfo3: TDBGridEh;
    qryInfo3: TADOQuery;
    dsInfo3: TDataSource;
    pmControl1: TPopupMenu;
    mnJobCancel1: TMenuItem;
    pmControl2: TPopupMenu;
    mnJobCancel2: TMenuItem;
    Splitter2: TSplitter;
    Splitter1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfo1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure sbtClearClick(Sender: TObject);
    procedure pmControlPopup(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure sbt_OrderClick(Sender: TObject);
    procedure cbCellCtrlChange(Sender: TObject);
    procedure cbCHogiChange(Sender: TObject);
    procedure cbCBankChange(Sender: TObject);
    procedure Pnl_MainResize(Sender: TObject);
    procedure edtITEM_INFOKeyPress(Sender: TObject; var Key: Char);
    procedure edtITEM_LOTKeyPress(Sender: TObject; var Key: Char);
    procedure tmrQueryTimer(Sender: TObject);
    procedure Pnl_BaseResize(Sender: TObject);
    procedure mnJobCancelClick(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
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
    function  fnValidCheck : Boolean;
    function  fnTrackDataInsert(TrackInfo: TTRACKInfo): Boolean;
    function  fnItemInfoGet(iType, iCode: String): TITEMInfo;
    function  SelectCurrent(FieldName, Current_Name, Current_ID : String): Boolean;
    function  EmptyRackChk(ID_SC, ID_CODE: String): Boolean;
    procedure BCRUpdate(BcrNo, Field, Value, Field1, Value1 : String);
    procedure BcrDataUpdate(BcrNo, BcrData:String);
    function  fnInterfaceUpdate(Mode, RequestDate, ItemLot: String): Boolean;
    procedure TrackDelete(nowBuff: String);
  end;
  procedure U240Create();

const
  FormNo ='240';

var
  frmU240 : TfrmU240;
  SrtFlag : integer = 0 ;
  StrInfo : integer = 0 ;
  StrWeight : String;
implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U240Create
//==============================================================================
procedure U240Create();
begin
  if not Assigned( frmU240 ) then
  begin
    frmU240 := TfrmU240.Create(Application);
    with frmU240 do
    begin
      fnCommandStart;
    end;
  end;
  frmU240.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU240.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU240.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU240.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU240.FormActivate(Sender: TObject);
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
  dgInfo1.SelectedRows.Clear;
  dgInfo2.SelectedRows.Clear;
  dgInfo3.SelectedRows.Clear;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU240.FormDeactivate(Sender: TObject);
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
procedure TfrmU240.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU240 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU240.fnCommandStart;
begin
//
end;
//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU240.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU240.fnCommandExcel;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU240.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU240.fnCommandPrint;
begin
//
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU240.fnCommandQuery;
var
  StrSQL : String;
begin
  try
    with qryInfo1 do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 122 ' +
                ' UNION ALL ' +
                ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 121 ' +
                ' UNION ALL ' +
                ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 120 ' +
                ' UNION ALL ' +
                ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 100 ' +
                ' UNION ALL ' +
                ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 101 ' +
                ' UNION ALL ' +
                ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 102 ' ;

      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo1.Close;
      TraceLogWrite('[240] 입고지시 조회1 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;

  try
    with qryInfo2 do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 124 ' +
                ' UNION ALL ' +
                ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 123 ' +
                ' UNION ALL ' +
                ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 110 ' +
                ' UNION ALL ' +
                ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 111 ' +
                ' UNION ALL ' +
                ' SELECT ID_BUFF, ID_TYPE, ' +
                '   	   CASE WHEN ID_DATA = 0 THEN '''' ELSE SUBSTRING(CR_DT, 1, 19) END as CR_DT, ' +
                '        CASE WHEN (ID_TYPE <> ''지정입고'') and (ID_DATA = 1) THEN ''124'' ' +
                '	            WHEN ID_TYPE =  ''지정입고'' THEN SUBSTRING(ID_CODE, 1, 2) + ''-'' + SUBSTRING(ID_CODE, 3, 2) + ''-'' + SUBSTRING(ID_CODE, 5, 2) ' +
                '			        ELSE '''' END as DST_POS, ' +
                ' 	     ITEM_LOT, ITEM_TYPE, ' +
                '        CASE WHEN ID_DATA = 0 THEN ''0'' ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_BUFF = 112 ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo2.Close;
      TraceLogWrite('[240] 입고지시 조회2 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;

  try
    with qryInfo3 do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ''1호기 - 01열'' AS HOGI, SUM(TOTAL) AS TOTAL, SUM(CNT1) AS CNT1, SUM(CNT2) AS CNT2, ' +
                '        SUM(CNT3) AS CNT3, SUM(CNT4) AS CNT4, SUM(CNT5) AS CNT5, SUM(CNT6) AS CNT6 ' +
                '   FROM ' +
                '   (SELECT 1 AS TOTAL, ' +
                '           (CASE WHEN (RACK_STAT = ''빈랙'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT1, ' +
                '           (CASE WHEN (RACK_STAT = ''재고'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT2, ' +
                '           (CASE WHEN (ORDER_STAT = ''입고중'') THEN 1 ELSE 0 END) AS CNT3, ' +
                '           (CASE WHEN (ORDER_STAT = ''출고중'') THEN 1 ELSE 0 END) AS CNT4, ' +
                '           (CASE WHEN IN_USED = ''N'' THEN 1 ELSE 0 END) AS CNT5, ' +
                '           (CASE WHEN OT_USED = ''N'' THEN 1 ELSE 0 END) AS CNT6  ' +
                '      FROM TT_RACK WITH (NOLOCK) ' +
                '     WHERE RACK_HOGI = ''1'' AND RACK_BANK = ''01'') AS TABLE1 ' +
                ' UNION ' +
                ' SELECT ''1호기 - 02열'' AS HOGI, SUM(TOTAL) AS TOTAL, SUM(CNT1) AS CNT1, SUM(CNT2) AS CNT2, ' +
                '        SUM(CNT3) AS CNT3, SUM(CNT4) AS CNT4, SUM(CNT5) AS CNT5, SUM(CNT6) AS CNT6 ' +
                '   FROM ' +
                '   (SELECT 1 AS TOTAL, ' +
                '           (CASE WHEN (RACK_STAT = ''빈랙'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT1, ' +
                '           (CASE WHEN (RACK_STAT = ''재고'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT2, ' +
                '           (CASE WHEN (ORDER_STAT = ''입고중'') THEN 1 ELSE 0 END) AS CNT3, ' +
                '           (CASE WHEN (ORDER_STAT = ''출고중'') THEN 1 ELSE 0 END) AS CNT4, ' +
                '           (CASE WHEN IN_USED = ''N'' THEN 1 ELSE 0 END) AS CNT5, ' +
                '           (CASE WHEN OT_USED = ''N'' THEN 1 ELSE 0 END) AS CNT6  ' +
                '      FROM TT_RACK WITH (NOLOCK) ' +
                '     WHERE RACK_HOGI = ''1'' AND RACK_BANK = ''02'') AS TABLE2 ' +
                ' UNION ' +
                ' SELECT ''2호기 - 03열'' AS HOGI, SUM(TOTAL) AS TOTAL, SUM(CNT1) AS CNT1, SUM(CNT2) AS CNT2, ' +
                '        SUM(CNT3) AS CNT3, SUM(CNT4) AS CNT4, SUM(CNT5) AS CNT5, SUM(CNT6) AS CNT6 ' +
                '   FROM ' +
                '   (SELECT 1 AS TOTAL, ' +
                '           (CASE WHEN (RACK_STAT = ''빈랙'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT1, ' +
                '           (CASE WHEN (RACK_STAT = ''재고'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT2, ' +
                '           (CASE WHEN (ORDER_STAT = ''입고중'') THEN 1 ELSE 0 END) AS CNT3, ' +
                '           (CASE WHEN (ORDER_STAT = ''출고중'') THEN 1 ELSE 0 END) AS CNT4, ' +
                '           (CASE WHEN IN_USED = ''N'' THEN 1 ELSE 0 END) AS CNT5, ' +
                '           (CASE WHEN OT_USED = ''N'' THEN 1 ELSE 0 END) AS CNT6  ' +
                '      FROM TT_RACK WITH (NOLOCK) ' +
                '     WHERE RACK_HOGI = ''2'' AND RACK_BANK = ''03'') AS TABLE3 ' +
                '  UNION ' +

                ' SELECT ''2호기 - 04열'' AS HOGI, SUM(TOTAL) AS TOTAL, SUM(CNT1) AS CNT1, SUM(CNT2) AS CNT2, ' +
                '        SUM(CNT3) AS CNT3, SUM(CNT4) AS CNT4, SUM(CNT5) AS CNT5, SUM(CNT6) AS CNT6 ' +
                '   FROM ' +
                '   (SELECT 1 AS TOTAL, ' +
                '           (CASE WHEN (RACK_STAT = ''빈랙'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT1, ' +
                '           (CASE WHEN (RACK_STAT = ''재고'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT2, ' +
                '           (CASE WHEN (ORDER_STAT = ''입고중'') THEN 1 ELSE 0 END) AS CNT3, ' +
                '           (CASE WHEN (ORDER_STAT = ''출고중'') THEN 1 ELSE 0 END) AS CNT4, ' +
                '           (CASE WHEN IN_USED = ''N'' THEN 1 ELSE 0 END) AS CNT5, ' +
                '           (CASE WHEN OT_USED = ''N'' THEN 1 ELSE 0 END) AS CNT6  ' +
                '      FROM TT_RACK WITH (NOLOCK) ' +
                '     WHERE RACK_HOGI = ''2'' AND RACK_BANK = ''04'') AS TABLE4 ' +
                '  UNION ' +
                ' SELECT ''3호기 - 05열'' AS HOGI, SUM(TOTAL) AS TOTAL, SUM(CNT1) AS CNT1, SUM(CNT2) AS CNT2, ' +
                '        SUM(CNT3) AS CNT3, SUM(CNT4) AS CNT4, SUM(CNT5) AS CNT5, SUM(CNT6) AS CNT6 ' +
                '   FROM ' +
                '   (SELECT 1 AS TOTAL, ' +
                '           (CASE WHEN (RACK_STAT = ''빈랙'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT1, ' +
                '           (CASE WHEN (RACK_STAT = ''재고'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT2, ' +
                '           (CASE WHEN (ORDER_STAT = ''입고중'') THEN 1 ELSE 0 END) AS CNT3, ' +
                '           (CASE WHEN (ORDER_STAT = ''출고중'') THEN 1 ELSE 0 END) AS CNT4, ' +
                '           (CASE WHEN IN_USED = ''N'' THEN 1 ELSE 0 END) AS CNT5, ' +
                '           (CASE WHEN OT_USED = ''N'' THEN 1 ELSE 0 END) AS CNT6  ' +
                '      FROM TT_RACK WITH (NOLOCK) ' +
                '     WHERE RACK_HOGI = ''3'' AND RACK_BANK = ''05'') AS TABLE5 ' +
                '  UNION ' +
                ' SELECT ''3호기 - 06열'' AS HOGI, SUM(TOTAL) AS TOTAL, SUM(CNT1) AS CNT1, SUM(CNT2) AS CNT2, ' +
                '        SUM(CNT3) AS CNT3, SUM(CNT4) AS CNT4, SUM(CNT5) AS CNT5, SUM(CNT6) AS CNT6 ' +
                '   FROM ' +
                '   (SELECT 1 AS TOTAL, ' +
                '           (CASE WHEN (RACK_STAT = ''빈랙'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT1, ' +
                '           (CASE WHEN (RACK_STAT = ''재고'') AND (ORDER_STAT = ''없음'') THEN 1 ELSE 0 END) AS CNT2, ' +
                '           (CASE WHEN (ORDER_STAT = ''입고중'') THEN 1 ELSE 0 END) AS CNT3, ' +
                '           (CASE WHEN (ORDER_STAT = ''출고중'') THEN 1 ELSE 0 END) AS CNT4, ' +
                '           (CASE WHEN IN_USED = ''N'' THEN 1 ELSE 0 END) AS CNT5, ' +
                '           (CASE WHEN OT_USED = ''N'' THEN 1 ELSE 0 END) AS CNT6  ' +
                '      FROM TT_RACK WITH (NOLOCK) ' +
                '     WHERE RACK_HOGI = ''3'' AND RACK_BANK = ''06'') AS TABLE6 ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo3.Close;
      TraceLogWrite('[240] 사용현황 조회 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU240.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// pmControlPopup
//==============================================================================
procedure TfrmU240.pmControlPopup(Sender: TObject);
var
  Idx : integer;
begin
  Idx := (Sender as TPopupMenu).Tag;
  if TAdoQuery(Self.FindComponent('qryInfo'+IntToStr(Idx))).RecordCount < 1 then Exit;
  if TDBGridEh(Self.FindComponent('dgInfo' +IntToStr(Idx))).SelectedRows.Count < 1 then Exit;

  if (MainDM.M_Info.UserAdmin = 'Y') then  // 관리자 권한
  begin
    TMenuItem(Self.FindComponent('mnJobCancel'+IntToStr(Idx))).Visible := True;
  end else
  begin
    TMenuItem(Self.FindComponent('mnJobCancel'+IntToStr(Idx))).Visible := False;
  end;
end;

//==============================================================================
// mnJobCancelClick
//==============================================================================
procedure TfrmU240.mnJobCancelClick(Sender: TObject);
var
  Idx, ID_BUFF : integer;
begin
  Idx := (Sender as TMenuItem).Tag;

  if (not TAdoQuery(Self.FindComponent('qryInfo'+IntToStr(Idx))).Active) then
  begin
    MessageDlg('  작업을 선택하지 않았습니다.' + #13#10 +
               '  작업삭제 할 작업을 선택 후 진행해 주십시오.', mtConfirmation, [mbYes], 0);
    TDBGridEh(Self.FindComponent('dgInfo' +IntToStr(Idx))).SetFocus;
    Exit;
  end;

  ID_BUFF := TAdoQuery(Self.FindComponent('qryInfo'+IntToStr(Idx))).FieldByName('ID_BUFF').AsInteger;

  if ID_BUFF = 124 then Exit;
  if MessageDlg('  [ '+IntToStr(ID_BUFF)+' ] 번 버퍼의 작업을 삭제 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  TrackDelete(IntToStr(ID_BUFF));
  if ID_BUFF in [102, 112, 120] then
  begin
    BCRUpdate('1', 'FLAG', '1', 'COMMAND', '2');
  end;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [품목찾기]
//==============================================================================
procedure TfrmU240.sbt_ITEMClick(Sender: TObject);
begin
//
end;

//==============================================================================
// sbt_OrderClick [입고지시]
//==============================================================================
procedure TfrmU240.sbt_OrderClick(Sender: TObject);
begin
  OrderProcess(0);
  fnCommandQuery ;
end;

//==============================================================================
// OrderProcess [입고지시]
//==============================================================================
procedure TfrmU240.OrderProcess(Mode: Integer);
var
  StrSQL, ReturnCell, StrResult : String;
  StrMsg1, StrMsg2, StrMsg3, StrMsg4, StrMsg5, ItemLot, ItemType : String;
  TrackInfo : TTRACKInfo;
  ItemInfo : TITEMInfo;
begin
  try
    // 필드 입력 정보 체크
    if not fnValidCheck then Exit;

    StrMsg1 := '제품번호 - ' + edtITEM_LOT.Text;
    StrMsg2 := '제품타입 - ' + cbITEM_TYPE.Text;
    StrMsg3 := '시작위치 - ' + cbIN_POS.Text;

    if cbCellCtrl.Text = '자동' then
    begin // 자동(호기 자동, 위치 자동)
      StrMsg4 := '입고위치 - [' + cbCellCtrl.Text + '] 자동배정';
      TrackInfo.ID_TYPE := '창고입고';
    end else
    if cbCBank.Text = '전체' then
    begin // 반자동(호기 지정, 위치 자동)
      StrMsg4 := '입고위치 - [' + cbCellCtrl.Text + '] ' + cbCHogi.Text + ' 중 자동배정';
      TrackInfo.ID_TYPE := '지정입고';
    end else
    begin // 수동(호기 지정, 위치 지정)
      StrMsg4 := '입고위치 - [' + cbCellCtrl.Text + '] ' + cbCHogi.Text + ' ' + cbCBank.Text + '-' + cbCBay.Text + '-' + cbCLevel.Text;
      TrackInfo.ID_TYPE := '지정입고';
    end;
    StrMsg5 := '작업구분 - ' + TrackInfo.ID_TYPE;

    if MessageDlg('  입고지시를 진행하시겠습니까? ' + #13#10 +
                  '  ' + StrMsg1 + #13#10 +
                  '  ' + StrMsg2 + #13#10 +
                  '  ' + StrMsg3 + #13#10 +
                  '  ' + StrMsg4 + #13#10 +
                  '  ' + StrMsg5, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    StrInfo := 0;


    //===============================================
    // 동일LOT 체크(창고재고)(TT_RACK_STOCK)
    //===============================================
    StrResult := frmMain.fnStockCheck(edtITEM_LOT.Text);
    if StrResult <> '' then
    begin
      MessageDlg('  창고 재고에 동일한 제품번호가 존재합니다.' + #13#10 +
                 '  재고를 확인해 주십시오.' + #13#10 + #13#10 +
                 '  제품번호 - [ '+edtITEM_LOT.Text+' ]' + #13#10 +
                 '  적재호기 - [ '+Copy(StrResult,1,1)+ '호기 ]' + #13#10 +
                 '  적재위치 - [ '+Copy(StrResult,2,8) + ' ]', mtWarning, [mbYes], 0);
      Exit;
    end;

    //===============================================
    // 동일LOT 체크(컨베어라인)(TT_TRACK)
    //===============================================
    StrResult := frmMain.fnCVLineCheck(edtITEM_LOT.Text);
    if StrResult <> '' then
    begin
      MessageDlg('  컨베이어 라인에 동일한 제품번호가 존재합니다.' + #13#10 +
                 '  라인을 확인해 주십시오.' + #13#10 + #13#10 +
                 '  제품번호 - [ '+edtITEM_LOT.Text +' ]' + #13#10 +
                 '  버퍼위치 - [ '+Copy(StrResult,1,3)+' ]', mtWarning, [mbYes], 0);
      Exit;
    end;

    //===============================================
    // 작업정보
    //===============================================
    TrackInfo.ID_DATE      := ' CONVERT(VARCHAR(MAX), GETDATE(), 112) ';
    TrackInfo.ID_TIME      := ' REPLACE(CONVERT(VARCHAR(MAX), GETDATE(), 108), '':'', '''') ';
    if cbCellCtrl.Text = '자동' then
    begin // 자동(호기 자동, 위치 자동)
      TrackInfo.ID_SC      := '';
      TrackInfo.ID_CODE    := '';
      TrackInfo.ID_BANK    := '';
      TrackInfo.ID_BAY     := '';
      TrackInfo.ID_LEVEL   := '';
    end else
    begin
      TrackInfo.ID_SC      := IntToStr(cbCHogi.ItemIndex + 1);

      if not SelectCurrent('OPTION1', 'SC_IN_USE', TrackInfo.ID_SC) then
      begin
        MessageDlg('  입고지시를 실패 하였습니다. ' + #13#10 + '  ' + cbCHogi.Text + ' 입고 금지 상태', mtWarning, [mbYes], 0);
        Exit;
      end;

      if cbCBank.Text = '전체' then
      begin // 반자동(호기 지정, 위치 자동)
        with SP_CELL_FIND do
        begin
          Parameters.ParamByName('@TYPE').Value := '창고입고';
          Parameters.ParamByName('@ITEM').Value := '';
          Parameters.ParamByName('@SC'  ).Value := TrackInfo.ID_SC;
          ExecProc;
          ReturnCell := Parameters.ParamValues['@RETURN_VALUE'];
        end;

        if Copy(ReturnCell, 1,2) = 'NG' then
        begin
          MessageDlg('  입고지시를 실패 하였습니다. ' + #13#10 + '  ' + cbCHogi.Text + ' 빈랙 검색 실패', mtWarning, [mbYes], 0);
          Exit;
        end;
      end else
      begin  // 수동(호기 지정, 위치 자동)
        ReturnCell := 'OK'+cbCBank.Text+cbCBay.Text+cbCLevel.Text;
        if not EmptyRackChk(TrackInfo.ID_SC, Copy(ReturnCell, 3, 6)) then
        begin
          MessageDlg('  입고지시를 실패 하였습니다. ' + #13#10 + '  ' + cbCHogi.Text + ' / ' + cbCBank.Text + '-' + cbCBay.Text + '-' + cbCLevel.Text + #13#10 +
                     '  해당 랙 입고불가', mtWarning, [mbYes, mbNo], 0);
          Exit;
        end;
      end;
      TrackInfo.ID_CODE    := Copy(ReturnCell, 3, 6);
      TrackInfo.ID_BANK    := Copy(TrackInfo.ID_CODE, 1, 2);
      TrackInfo.ID_BAY     := Copy(TrackInfo.ID_CODE, 3, 2);
      TrackInfo.ID_LEVEL   := Copy(TrackInfo.ID_CODE, 5, 2);
    end;
    TrackInfo.ID_INDEX     := 0; // 작업번호
    TrackInfo.ID_SUBIDX    := 0; // 작업번호(서브)
    TrackInfo.ID_EMG       := 0; // 긴급여부(0:일반, 1:긴급)
    TrackInfo.KIND_1       := '';
    TrackInfo.KIND_2       := '';
    TrackInfo.KIND_3       := '';
    TrackInfo.KIND_4       := '';
    TrackInfo.KIND_5       := '';
    if      cbIN_POS.ItemIndex = 0 then TrackInfo.IN_SITE := '102' // 입고위치
    else if cbIN_POS.ItemIndex = 1 then TrackInfo.IN_SITE := '112'
    else if cbIN_POS.ItemIndex = 2 then TrackInfo.IN_SITE := '120';
    TrackInfo.IN_DATE      := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';
    TrackInfo.OT_SITE      := ''; // 출고위치
    TrackInfo.OT_DATE      := ''; // 출고시간
    TrackInfo.BCR_CHK      := 0;  // 컨베이어 프로그램 확인 여부 (0:리딩상태, 1:리딩확인)
    TrackInfo.STATUS       := ''; // 작업상태(CV대기, CV이동)
    TrackInfo.PROCESS      := ''; // 처리상태(취소,강제완료)
    TrackInfo.ITEM_LOT     := Trim(edtITEM_LOT.Text); // 제품번호
    TrackInfo.ITEM_TYPE    := cbITEM_TYPE.Text; // 제품타입(반제품, 제품)
    TrackInfo.ITEM_WEIGHT  := FormatFloat('####0.000', StrToFloatDef(Trim(edtITEM_WEIGHT.Text), 0)); // 제품중량
    TrackInfo.ITEM_QTY     := IntToStr(StrToIntDef(Trim(edtITEM_QTY.Text), 0));    // 제품수량

    //===============================================
    // 입고제품 정보 [TM_ITEM]
    //===============================================
    ItemType := cbITEM_TYPE.Text;     // 제품타입
    ItemLot  := TrackInfo.ITEM_LOT;   // 제품번호
    ItemInfo := fnItemInfoGet(ItemType, ItemLot);

    if StrInfo in [1] then
    begin
      TrackInfo.ITEM_WEIGHT := FormatFloat('####0.000', StrToFloatDef(Trim(StrWeight), 0))
    end;

    TrackInfo.ITEM_INFO_01 := ItemInfo.ITEM_INFO_01;
    TrackInfo.ITEM_INFO_02 := ItemInfo.ITEM_INFO_02;
    TrackInfo.ITEM_INFO_03 := ItemInfo.ITEM_INFO_03;
    TrackInfo.ITEM_INFO_04 := ItemInfo.ITEM_INFO_04;
    TrackInfo.ITEM_INFO_05 := ItemInfo.ITEM_INFO_05;
    TrackInfo.ITEM_INFO_06 := ItemInfo.ITEM_INFO_06;
    TrackInfo.ITEM_INFO_07 := ItemInfo.ITEM_INFO_07;
    TrackInfo.ITEM_INFO_08 := ItemInfo.ITEM_INFO_08;
    TrackInfo.ITEM_INFO_09 := ItemInfo.ITEM_INFO_09;
    TrackInfo.ITEM_INFO_10 := ItemInfo.ITEM_INFO_10;
    TrackInfo.ITEM_INFO_11 := ItemInfo.ITEM_INFO_11;
    TrackInfo.ITEM_INFO_12 := ItemInfo.ITEM_INFO_12;
    TrackInfo.ITEM_INFO_13 := ItemInfo.ITEM_INFO_13;
    TrackInfo.ITEM_INFO_14 := ItemInfo.ITEM_INFO_14;
    TrackInfo.ITEM_INFO_15 := ItemInfo.ITEM_INFO_15;
    TrackInfo.ITEM_INFO_16 := ItemInfo.ITEM_INFO_16;
    TrackInfo.ITEM_INFO_17 := ItemInfo.ITEM_INFO_17;
    TrackInfo.ITEM_INFO_18 := ItemInfo.ITEM_INFO_18;
    TrackInfo.ITEM_INFO_19 := ItemInfo.ITEM_INFO_19;
    TrackInfo.ITEM_INFO_20 := ItemInfo.ITEM_INFO_20;

    TrackInfo.PLT_CODE     := '';
    TrackInfo.WRAP_YN      := 'N';
    TrackInfo.MEMO_1       := '';
    TrackInfo.MEMO_2       := '';
    TrackInfo.MEMO_3       := '';
    TrackInfo.MEMO_4       := '';
    TrackInfo.MEMO_5       := '';
    TrackInfo.ID_USER      := MainDM.M_Info.UserCode;
    TrackInfo.UP_DT        := '';
    TrackInfo.CR_DT        := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';  // 입고지시 시간 -> ORDER의 OR_DT로 감

    //===============================================
    // 데이터 처리
    //===============================================
    if not fnTrackDataInsert(TrackInfo) then
    begin
      MessageDlg('  입고지시를 실패 하였습니다. ' + #13#10 +
                 '  ' + StrMsg1 + #13#10 +
                 '  ' + StrMsg2 + #13#10 +
                 '  ' + StrMsg3 + #13#10 +
                 '  ' + StrMsg4 + #13#10 +
                 '  ' + StrMsg5 + #13#10 + #13#10 +
                 '  ※해당 입고대 데이터 유무, 랙 상태 등 확인 필요※ '
                 , mtWarning, [mbYes, mbNo], 0);
      Exit;
    end else
    begin
      // 바코드 리딩 상태 업데이트
      BcrDataUpdate('1', TrackInfo.ITEM_LOT);

      // [인터페이스] 입고예정정보 업데이트 (입고실적 전송)
      if StrInfo = 1 then
      begin
        fnInterfaceUpdate('1', TrackInfo.ITEM_INFO_20, TrackInfo.ITEM_LOT);
        StrInfo := 0;
      end;
    end;
  except
    on E : Exception do
    begin
      SP_CELL_FIND.Close;
      TraceLogWrite('[240] 입고지시 - 에러['+E.Message+'], 제품번호['+edtITEM_LOT.Text+'], 제품타입['+cbITEM_TYPE.Text+']');
    end;
  end;
end;

//==============================================================================
// fnInterfaceUpdate
//==============================================================================
function TfrmU240.fnInterfaceUpdate(Mode, RequestDate, ItemLot: String): Boolean;
var
  ExecNo : integer;
  StrSQL : String;
begin
  Result := False;
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE IF_RECEIVE ' +
                '    SET PROC_STAT = ' + QuotedStr(Mode) +
                '      , MEMO_01   = ''R'' ' +
                '      , MEMO_02   = CONVERT(VARCHAR(MAX), GETDATE(), 112) + REPLACE(CONVERT(VARCHAR(MAX), GETDATE(), 108), '':'', '''') ' +
                '      , UP_DT     = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                '  WHERE RTRIM(LTRIM(TC_CD  )) = ''MW001300'' ' +              // 입고예정정보
                '    AND RTRIM(LTRIM(BODY_01)) = ''R'' ' +                    // 입고예정구분
                '    AND RTRIM(LTRIM(BODY_02)) = ' + QuotedStr(RequestDate) + // 요청일시
                '    AND RTRIM(LTRIM(BODY_03)) = ' + QuotedStr(ItemLot    ) ; // 제품번호
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then Result := True;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[240] 인터페이스 업데이트 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnTrackDataInsert [입고지시 데이터 Insert]
//==============================================================================
function TfrmU240.fnTrackDataInsert(TrackInfo: TTRACKInfo): Boolean;
var
  ExecNo : integer;
  StrSQL, RckSQL : String;
begin
  Result := False;
  try
    StrSQL := ' UPDATE TT_TRACK ' +
              ' SET ' +
              ' ID_DATA      = ''1'', ' +
	            ' ID_DATE      = '   + TrackInfo.ID_DATE      +   ', ' +
	            ' ID_TIME      = '   + TrackInfo.ID_TIME      +   ', ' +
	            ' ID_TYPE      = ''' + TrackInfo.ID_TYPE      + ''', ' +
	            ' ID_INDEX     = '   + IntToStr(TrackInfo.ID_INDEX)    + ', ' +
	            ' ID_SUBIDX    = '   + IntToStr(TrackInfo.ID_SUBIDX)   + ', ' +
	            ' ID_EMG       = '   + IntToStr(TrackInfo.ID_EMG)      + ', ' +
	            ' ID_SC        = ''' + TrackInfo.ID_SC        + ''', ' +
	            ' ID_CODE      = ''' + TrackInfo.ID_CODE      + ''', ' +
	            ' ID_BANK      = ''' + TrackInfo.ID_BANK      + ''', ' +
	            ' ID_BAY       = ''' + TrackInfo.ID_BAY       + ''', ' +
	            ' ID_LEVEL     = ''' + TrackInfo.ID_LEVEL     + ''', ' +
	            ' KIND_1       = ''' + TrackInfo.KIND_1       + ''', ' +
	            ' KIND_2       = ''' + TrackInfo.KIND_2       + ''', ' +
	            ' KIND_3       = ''' + TrackInfo.KIND_3       + ''', ' +
	            ' KIND_4       = ''' + TrackInfo.KIND_4       + ''', ' +
	            ' KIND_5       = ''' + TrackInfo.KIND_5       + ''', ' +
	            ' IN_SITE      = ''' + TrackInfo.IN_SITE      + ''', ' +
	            ' IN_DATE      = '   + TrackInfo.IN_DATE      +   ', ' +
	            ' OT_SITE      = ''' + TrackInfo.OT_SITE      + ''', ' +
	            ' OT_DATE      = ''' + TrackInfo.OT_DATE      + ''', ' +
	            ' BCR_CHK      = '   + IntToStr(TrackInfo.BCR_CHK)     + ', ' +
	            ' STATUS       = ''' + TrackInfo.STATUS       + ''', ' +
	            ' PROCESS      = ''' + TrackInfo.PROCESS      + ''', ' +
	            ' ITEM_LOT     = ''' + TrackInfo.ITEM_LOT     + ''', ' +
	            ' ITEM_TYPE    = ''' + TrackInfo.ITEM_TYPE    + ''', ' +
	            ' ITEM_WEIGHT  = '   + TrackInfo.ITEM_WEIGHT  + ', ' +
	            ' ITEM_QTY     = '   + TrackInfo.ITEM_QTY     + ', ' +
	            ' ITEM_INFO_01 = ''' + TrackInfo.ITEM_INFO_01 + ''', ' +
	            ' ITEM_INFO_02 = ''' + TrackInfo.ITEM_INFO_02 + ''', ' +
	            ' ITEM_INFO_03 = ''' + TrackInfo.ITEM_INFO_03 + ''', ' +
	            ' ITEM_INFO_04 = ''' + TrackInfo.ITEM_INFO_04 + ''', ' +
	            ' ITEM_INFO_05 = ''' + TrackInfo.ITEM_INFO_05 + ''', ' +
	            ' ITEM_INFO_06 = ''' + TrackInfo.ITEM_INFO_06 + ''', ' +
	            ' ITEM_INFO_07 = ''' + TrackInfo.ITEM_INFO_07 + ''', ' +
	            ' ITEM_INFO_08 = ''' + TrackInfo.ITEM_INFO_08 + ''', ' +
	            ' ITEM_INFO_09 = ''' + TrackInfo.ITEM_INFO_09 + ''', ' +
              ' ITEM_INFO_10 = ''' + TrackInfo.ITEM_INFO_10 + ''', ' +
              ' ITEM_INFO_11 = ''' + TrackInfo.ITEM_INFO_11 + ''', ' +
              ' ITEM_INFO_12 = ''' + TrackInfo.ITEM_INFO_12 + ''', ' +
              ' ITEM_INFO_13 = ''' + TrackInfo.ITEM_INFO_13 + ''', ' +
              ' ITEM_INFO_14 = ''' + TrackInfo.ITEM_INFO_14 + ''', ' +
              ' ITEM_INFO_15 = ''' + TrackInfo.ITEM_INFO_15 + ''', ' +
              ' ITEM_INFO_16 = ''' + TrackInfo.ITEM_INFO_16 + ''', ' +
              ' ITEM_INFO_17 = ''' + TrackInfo.ITEM_INFO_17 + ''', ' +
              ' ITEM_INFO_18 = ''' + TrackInfo.ITEM_INFO_18 + ''', ' +
              ' ITEM_INFO_19 = ''' + TrackInfo.ITEM_INFO_19 + ''', ' +
              ' ITEM_INFO_20 = ''' + TrackInfo.ITEM_INFO_20 + ''', ' +
	            ' PLT_CODE     = ''' + TrackInfo.PLT_CODE     + ''', ' +
	            ' WRAP_YN      = ''' + TrackInfo.WRAP_YN      + ''', ' +
	            ' MEMO_1       = ''' + TrackInfo.MEMO_1       + ''', ' +
	            ' MEMO_2       = ''' + TrackInfo.MEMO_2       + ''', ' +
	            ' MEMO_3       = ''' + TrackInfo.MEMO_3       + ''', ' +
	            ' MEMO_4       = ''' + TrackInfo.MEMO_4       + ''', ' +
	            ' MEMO_5       = ''' + TrackInfo.MEMO_5       + ''', ' +
	            ' ID_USER      = ''' + TrackInfo.ID_USER      + ''', ' +
	            ' UP_DT        = ''' + TrackInfo.UP_DT        + ''', ' +
	            ' CR_DT        = '   + TrackInfo.CR_DT        +   '  ' +
              '  FROM TT_TRACK T WITH (NOLOCK) ' +
              ' WHERE T.ID_BUFF = ' + TrackInfo.IN_SITE +
              '   AND T.ID_DATA = 0 ' ;

    RckSQL := ' UPDATE TT_RACK ' +
	            '    SET ORDER_STAT = ''입고중'' ' +
		          '      , LUGG       = '''' ' +
              '      , MEMO_1     = ''ORDER TRIGGER INSERT 입고'' ' +
		          '      , UP_DT      = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
              '  WHERE RACK_LOC   = ''' + TrackInfo.ID_CODE + ''' ';

    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
      begin
        if TrackInfo.ID_CODE <> '' then
        begin
          SQL.Clear;
          SQL.Text := RckSQL;
          ExecNo := ExecSQL;
          if ExecNo > 0 then
          begin
            Result := True;
            if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
            TraceLogWrite('[240] 입고지시 - 타입['+TrackInfo.ITEM_TYPE+'], 번호['+TrackInfo.ITEM_LOT+'], 작업['+TrackInfo.ID_TYPE+'], 위치['+TrackInfo.ID_CODE+']');
          end else
          begin
            if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
            TraceLogWrite('[240] 입고지시 - 에러[랙상태 변경오류], 타입['+TrackInfo.ITEM_TYPE+'], 번호['+TrackInfo.ITEM_LOT+'], 작업['+TrackInfo.ID_TYPE+'], 위치['+TrackInfo.ID_CODE+']');
          end;
        end else
        begin
          Result := True;
          if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
          TraceLogWrite('[240] 입고지시 - 타입['+TrackInfo.ITEM_TYPE+'], 번호['+TrackInfo.ITEM_LOT+'], 작업['+TrackInfo.ID_TYPE+']');
        end;
      end else
      begin
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
        TraceLogWrite('[240] 입고지시 - 에러[데이터 생성오류], 타입['+TrackInfo.ITEM_TYPE+'], 번호['+TrackInfo.ITEM_LOT+'], 작업['+TrackInfo.ID_TYPE+']');
      end;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryTemp.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[240] 입고지시 - 에러['+E.Message+'], 타입['+TrackInfo.ITEM_TYPE+'], 번호['+TrackInfo.ITEM_LOT+'], 작업['+TrackInfo.ID_TYPE+'], 위치['+TrackInfo.ID_CODE+'], 쿼리1['+StrSQL+'], 쿼리2['+RckSQL+']');
    end;
  end;
end;

//==============================================================================
// fnItemInfoGet
//==============================================================================
function TfrmU240.fnItemInfoGet(iType, iCode: String): TITEMInfo;
var
  StrSQL, tFieldName : String;
  ItemInfo : TITEMInfo;
begin
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ' +
                ' RTRIM(LTRIM(BODY_01)) as BODY_01, ' +
                ' RTRIM(LTRIM(BODY_02)) as BODY_02, ' +
                ' RTRIM(LTRIM(BODY_03)) as BODY_03, ' +
                ' RTRIM(LTRIM(BODY_04)) as BODY_04, ' +
                ' RTRIM(LTRIM(BODY_05)) as BODY_05, ' +
                ' RTRIM(LTRIM(BODY_06)) as BODY_06, ' +
                ' RTRIM(LTRIM(BODY_07)) as BODY_07, ' +
                ' RTRIM(LTRIM(BODY_08)) as BODY_08, ' +
                ' RTRIM(LTRIM(BODY_09)) as BODY_09, ' +
                ' RTRIM(LTRIM(BODY_10)) as BODY_10, ' +
                ' RTRIM(LTRIM(BODY_11)) as BODY_11, ' +
                ' RTRIM(LTRIM(BODY_12)) as BODY_12  ' +
                '   FROM IF_RECEIVE WITH (NOLOCK) ' +
                '  WHERE RTRIM(LTRIM(TC_CD  )) = ''MW001300'' ' +
                '    AND RTRIM(LTRIM(BODY_01)) = ''R'' ' +
                '    AND RTRIM(LTRIM(BODY_03)) = ''' + iCode + ''' ' ;
      SQL.Text := StrSQL;
      Open;

      if not (Bof and Eof) then
      begin
        ItemInfo.ITEM_INFO_01 := FieldByName('BODY_04').AsString;      // 제품코드 (검사 완료후 코드 변경 시 이전코드정보를 ITEM_INFO_03, ITEM_INFO_04로 업데이트 후 ITEM_INFO_01, ITEM_INFO_02 변경)
        ItemInfo.ITEM_INFO_02 := FieldByName('BODY_05').AsString;      // 제품명
        ItemInfo.ITEM_INFO_03 := '';                                   // 제품코드(변경전)
        ItemInfo.ITEM_INFO_04 := '';                                   // 제품명(변경전)
        ItemInfo.ITEM_INFO_05 := FieldByName('BODY_07').AsString;      // 생산일시
        ItemInfo.ITEM_INFO_06 := FieldByName('BODY_08').AsString;      // 고객코드
        ItemInfo.ITEM_INFO_07 := FieldByName('BODY_09').AsString;      // 고객명
        ItemInfo.ITEM_INFO_08 := FieldByName('BODY_10').AsString;      // 주문번호
        ItemInfo.ITEM_INFO_09 := FieldByName('BODY_11').AsString;      // 공정라인
        ItemInfo.ITEM_INFO_10 := '';                                   // 판정결과
        ItemInfo.ITEM_INFO_11 := '';                                   //
        ItemInfo.ITEM_INFO_12 := '';                                   //
        ItemInfo.ITEM_INFO_13 := '';                                   //
        ItemInfo.ITEM_INFO_14 := '';                                   //
        ItemInfo.ITEM_INFO_15 := '';                                   //
        ItemInfo.ITEM_INFO_16 := '';                                   //
        ItemInfo.ITEM_INFO_17 := '';                                   //
        ItemInfo.ITEM_INFO_18 := '';                                   //
        ItemInfo.ITEM_INFO_19 := '';                                   //
        ItemInfo.ITEM_INFO_20 := FieldByName('BODY_02').AsString;      // 입고예정정보(요청일시)
        StrInfo := 1; // 입고예정정보에서 제품번호에 대한 정보 추출 '1'
        StrWeight := FieldByName('BODY_06').AsString;
      end else
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT TOP 1 * FROM TT_HISTORY WITH (NOLOCK) ' +
                  '  WHERE ITEM_LOT = ''' + iCode + ''' ' +
                  '    AND SUBSTRING(ID_TYPE, LEN(ID_TYPE)-1, 2) = ''출고'' ' ;
        SQL.Text := StrSQL;
        Open;
        if not (Bof and Eof) then
        begin
          ItemInfo.ITEM_INFO_01 := FieldByName('ITEM_INFO_01').AsString; // 제품코드 (검사 완료후 코드 변경 시 이전코드정보를 ITEM_INFO_03, ITEM_INFO_04로 업데이트 후 ITEM_INFO_01, ITEM_INFO_02 변경)
          ItemInfo.ITEM_INFO_02 := FieldByName('ITEM_INFO_02').AsString; // 제품명
          ItemInfo.ITEM_INFO_03 := FieldByName('ITEM_INFO_03').AsString; // 제품코드(변경전)
          ItemInfo.ITEM_INFO_04 := FieldByName('ITEM_INFO_04').AsString; // 제품명(변경전)
          ItemInfo.ITEM_INFO_05 := FieldByName('ITEM_INFO_05').AsString; // 생산일시
          ItemInfo.ITEM_INFO_06 := FieldByName('ITEM_INFO_06').AsString; // 고객코드
          ItemInfo.ITEM_INFO_07 := FieldByName('ITEM_INFO_07').AsString; // 고객명
          ItemInfo.ITEM_INFO_08 := FieldByName('ITEM_INFO_08').AsString; // 주문번호
          ItemInfo.ITEM_INFO_09 := FieldByName('ITEM_INFO_09').AsString; // 공정라인
          ItemInfo.ITEM_INFO_10 := FieldByName('ITEM_INFO_10').AsString; // 판정결과
          ItemInfo.ITEM_INFO_11 := FieldByName('ITEM_INFO_11').AsString; //
          ItemInfo.ITEM_INFO_12 := FieldByName('ITEM_INFO_12').AsString; //
          ItemInfo.ITEM_INFO_13 := FieldByName('ITEM_INFO_13').AsString; //
          ItemInfo.ITEM_INFO_14 := FieldByName('ITEM_INFO_14').AsString; //
          ItemInfo.ITEM_INFO_15 := FieldByName('ITEM_INFO_15').AsString; //
          ItemInfo.ITEM_INFO_16 := FieldByName('ITEM_INFO_16').AsString; //
          ItemInfo.ITEM_INFO_17 := FieldByName('ITEM_INFO_17').AsString; //
          ItemInfo.ITEM_INFO_18 := FieldByName('ITEM_INFO_18').AsString; //
          ItemInfo.ITEM_INFO_19 := FieldByName('ITEM_INFO_19').AsString; //
          ItemInfo.ITEM_INFO_20 := FieldByName('ITEM_INFO_20').AsString; // 입고예정정보(요청일시)
          StrInfo := 2; // 출고 이력에서 제품번호에 대한 정보 추출 '2'
//          StrWeight := FieldByName('ITEM_WEIGHT').AsString; //
        end else
        begin
          ItemInfo.ITEM_INFO_01 := edtITEM_INFO_01.Text; // 제품코드 (검사 완료후 코드 변경 시 이전코드정보를 ITEM_INFO_03, ITEM_INFO_04로 업데이트 후 ITEM_INFO_01, ITEM_INFO_02 변경)
          ItemInfo.ITEM_INFO_02 := edtITEM_INFO_02.Text; // 제품명
          ItemInfo.ITEM_INFO_03 := '';                   // 제품코드(변경전)
          ItemInfo.ITEM_INFO_04 := '';                   // 제품명(변경전)
          ItemInfo.ITEM_INFO_05 := '';                   // 생산일시
          ItemInfo.ITEM_INFO_06 := '';                   // 고객코드
          ItemInfo.ITEM_INFO_07 := '';                   // 고객명
          ItemInfo.ITEM_INFO_08 := '';                   // 주문번호
          ItemInfo.ITEM_INFO_09 := '';                   // 공정라인
          ItemInfo.ITEM_INFO_10 := '';                   // 판정결과
          ItemInfo.ITEM_INFO_11 := '';                   //
          ItemInfo.ITEM_INFO_12 := '';                   //
          ItemInfo.ITEM_INFO_13 := '';                   //
          ItemInfo.ITEM_INFO_14 := '';                   //
          ItemInfo.ITEM_INFO_15 := '';                   //
          ItemInfo.ITEM_INFO_16 := '';                   //
          ItemInfo.ITEM_INFO_17 := '';                   //
          ItemInfo.ITEM_INFO_18 := '';                   //
          ItemInfo.ITEM_INFO_19 := '';                   //
          ItemInfo.ITEM_INFO_20 := '';                   // 입고예정정보(요청일시)
          StrInfo := 0; // 제품번호에 대한 정보를 얻지못할 경우 입력정보만 반환
        end;
      end;
      Close;
      Result := ItemInfo;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[240] 제품정보 조회 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnValidCheck [입력정보 체크]
//==============================================================================
function TfrmU240.fnValidCheck : Boolean;
begin
  try
    Result := False;

    if Trim(edtITEM_LOT.Text) = '' then
    begin
      MessageDlg('  제품번호를 입력해 주십시오.', mtConfirmation, [mbYes], 0);
      edtITEM_LOT.SetFocus;
      Exit;
    end;

    if Trim(edtITEM_QTY.Text) = '' then
    begin
      MessageDlg('  제품수량을 입력해 주십시오.', mtConfirmation, [mbYes], 0);
      edtITEM_QTY.SetFocus;
      Exit;
    end;

    if Trim(edtITEM_WEIGHT.Text) = '' then
    begin
      MessageDlg('  제품중량을 입력해 주십시오.', mtConfirmation, [mbYes], 0);
      edtITEM_WEIGHT.SetFocus;
      Exit;
    end;
    Result := True;
  except
    on E : Exception do
    begin
      TraceLogWrite('[240] 입고지시 체크 - 에러['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// cbCellCtrlChange
//==============================================================================
procedure TfrmU240.cbCellCtrlChange(Sender: TObject);
begin
  // 입고위치 자동 찾기 인 경우
  if (Sender as TComboBox).Text = '자동' then
  begin
    PnlManualSelect.Visible := False;
  end else
  // 입고위치 수동 입력 인 경우
  begin
    PnlManualSelect.Visible := True;
    cbCHogi.SetFocus;
  end;
  cbCHogi.ItemIndex := 0;

  cbCBank.Items.Clear;
  cbCBank.Items.Add('전체');
  cbCBank.Items.Add('01');
  cbCBank.Items.Add('02');
  cbCBank.ItemIndex  := 0;

  cbCBay.Items.Clear;
  cbCLevel.Items.Clear;
  cbCBay.Items.Add('전체');
  cbCLevel.Items.Add('전체');
  cbCBay.ItemIndex   := 0;
  cbCLevel.ItemIndex := 0;
end;

//==============================================================================
// cbCHogiChange
//==============================================================================
procedure TfrmU240.cbCHogiChange(Sender: TObject);
begin
  // 호기 변경 시 Bank 설정
  cbCBank.Items.Clear;
  cbCBank.Items.Add('전체');
  if (Sender as TComboBox).ItemIndex = 0 then
  begin
    cbCBank.Items.Add('01');
    cbCBank.Items.Add('02');
  end else
  if (Sender as TComboBox).ItemIndex = 1 then
  begin
    cbCBank.Items.Add('03');
    cbCBank.Items.Add('04');
  end else
  if (Sender as TComboBox).ItemIndex = 2 then
  begin
    cbCBank.Items.Add('05');
    cbCBank.Items.Add('06');
  end;
  cbCBank.ItemIndex := 0; // 전체

  // Bank 설정에 의한 Bay, Level 재설정
  cbCBay.Items.Clear;
  cbCLevel.Items.Clear;
  cbCBay.Items.Add('전체');
  cbCLevel.Items.Add('전체');
  cbCBay.ItemIndex   := 0;
  cbCLevel.ItemIndex := 0;
end;

//==============================================================================
// cbCBankChange
//==============================================================================
procedure TfrmU240.cbCBankChange(Sender: TObject);
var
  i : integer;
begin
  // Bank 설정 시 Bay, Level 설정
  cbCBay.Items.Clear;
  cbCLevel.Items.Clear;
  if (Sender as TComboBox).ItemIndex = 0 then // Bank가 전체이면
  begin
    cbCBay.Items.Add('전체');
    cbCLevel.Items.Add('전체');
  end else
  begin
    for i := 1 to CELL_MAX_BAY   do cbCBay.Items.Add(  FormatFloat('00',i));
    for i := 1 to CELL_MAX_LEVEL do cbCLevel.Items.Add(FormatFloat('00',i));
  end;
  cbCBay.ItemIndex   := 0;
  cbCLevel.ItemIndex := 0;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU240.sbtClearClick(Sender: TObject);
begin
  edtITEM_LOT.Text      := '';   // 제품번호
  cbITEM_TYPE.ItemIndex := 0;    // 제품타입
  edtITEM_INFO_01.Text  := '';   // 제품코드
  edtITEM_INFO_02.Text  := '';   // 제품명
  edtITEM_QTY.Text      := '1';  // 제품수량
  edtITEM_WEIGHT.Text   := '';   // 제품중량
  dgInfo1.SelectedRows.Clear;
  dgInfo2.SelectedRows.Clear;
  dgInfo3.SelectedRows.Clear;
  edtITEM_LOT.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// SelectCurrent                                                              //
//==============================================================================
function TfrmU240.SelectCurrent(FieldName, Current_Name, Current_ID : String): Boolean;
var
  StrSQL : String;
begin
  Result := False;
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ' + FieldName  +
                '   FROM TC_CURRENT WITH (NOLOCK) ' +
                '  WHERE CURRENT_NAME = ''' + Current_Name + ''' ' +
                '    AND CURRENT_ID   = ' + Current_ID ;
      SQL.Text := StrSQL;
      Open;
      if not (Eof and Bof) then
      begin
        Result := Fields[0].AsBoolean ;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[240] 설비상태 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// EmptyRackChk                                                              //
//==============================================================================
function TfrmU240.EmptyRackChk(ID_SC, ID_CODE: String): Boolean;
var
  StrSQL : String;
begin
  Result := False;
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT COUNT(*) as Cnt ' +
	              '   FROM TT_RACK WITH (NOLOCK) ' +
                '   WHERE RACK_HOGI  = ''' + ID_SC   + ''' ' +
                '     AND RACK_LOC   = ''' + ID_CODE + ''' ' +
			          '     AND RACK_STAT  = ''빈랙'' ' +
                '     AND ORDER_STAT = ''없음'' ' +
                '     AND ERR_STAT   = ''없음'' ' +
                '     AND NOW_RESERV = ''없음'' ' +
                '     AND IN_USED    = ''Y'' ' ;
      SQL.Text := StrSQL;
      Open;
      if not (Eof and Bof) then
      begin
        if FieldByName('Cnt').AsInteger > 0 then Result := True;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[240] 랙상태 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// BCRUpdate [바코드 상태 업데이트]                                           //
//==============================================================================
procedure TfrmU240.BCRUpdate(BcrNo, Field, Value, Field1, Value1 : String);
Var
  StrSQL : String;
begin
  try
    StrSQL := ' UPDATE TT_BCRR SET ' + Field  + ' = ''' + Value  + ''' ' ;

    if Trim(Field1) <> '' then
      StrSQL := StrSQL +
              '                 , ' + Field1 + ' = ''' + Value1 + ''' ' ;
    StrSQL := StrSQL +
              '      , BCRDATA = '''' ' +
              '      , MEMO_1  = '''' ' +
              '      , MEMO_2  = '''' ' +
              '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
              '  WHERE BCRNO   = ' + BcrNo ;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[240] 바코드 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// BcrDataUpdate [바코드 상태 및 데이터 업데이트]                             //
//==============================================================================
procedure TfrmU240.BcrDataUpdate(BcrNo, BcrData: String);
var
  StrSQL : String;
begin
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_BCRR ' +
                '    SET BCRDATA = ''' + BcrData + ''' ' +
                '      , FLAG    = ''0'' ' +
                '      , COMMAND = ''2'' ' +
                '      , MEMO_1  = ''''  ' +
                '      , MEMO_2  = ''''  ' +
                '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                '  WHERE BCRNO = ''' + BcrNo + ''' ';
      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[240] 바코드 데이터 업데이트 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;

end;

//==============================================================================
// TrackDelete                                                                //
//==============================================================================
procedure TfrmU240.TrackDelete(nowBuff: String);
var
  StrSQL : String ;
begin
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_TRACK ' +
                ' SET ' +
                ' ID_DATA      = ''0'', ' +
	              ' ID_DATE      = '''' , ' +
	              ' ID_TIME      = '''' , ' +
	              ' ID_TYPE      = '''' , ' +
	              ' ID_INDEX     = ''0'', ' +
	              ' ID_SUBIDX    = ''0'', ' +
	              ' ID_EMG       = '''' , ' +
	              ' ID_SC        = '''' , ' +
	              ' ID_CODE      = '''' , ' +
	              ' ID_BANK      = '''' , ' +
	              ' ID_BAY       = '''' , ' +
	              ' ID_LEVEL     = '''' , ' +
	              ' KIND_1       = '''' , ' +
	              ' KIND_2       = '''' , ' +
	              ' KIND_3       = '''' , ' +
	              ' KIND_4       = '''' , ' +
	              ' KIND_5       = '''' , ' +
	              ' IN_SITE      = '''' , ' +
	              ' IN_DATE      = '''' , ' +
	              ' OT_SITE      = '''' , ' +
	              ' OT_DATE      = '''' , ' +
	              ' BCR_CHK      = ''0'', ' +
	              ' STATUS       = '''' , ' +
	              ' PROCESS      = '''' , ' +
	              ' ITEM_LOT     = '''' , ' +
	              ' ITEM_TYPE    = '''' , ' +
	              ' ITEM_WEIGHT  = ''0'', ' +
	              ' ITEM_QTY     = ''0'', ' +
	              ' ITEM_INFO_01 = '''' , ' +
	              ' ITEM_INFO_02 = '''' , ' +
	              ' ITEM_INFO_03 = '''' , ' +
	              ' ITEM_INFO_04 = '''' , ' +
	              ' ITEM_INFO_05 = '''' , ' +
	              ' ITEM_INFO_06 = '''' , ' +
	              ' ITEM_INFO_07 = '''' , ' +
	              ' ITEM_INFO_08 = '''' , ' +
	              ' ITEM_INFO_09 = '''' , ' +
                ' ITEM_INFO_10 = '''' , ' +
                ' ITEM_INFO_11 = '''' , ' +
                ' ITEM_INFO_12 = '''' , ' +
                ' ITEM_INFO_13 = '''' , ' +
                ' ITEM_INFO_14 = '''' , ' +
                ' ITEM_INFO_15 = '''' , ' +
                ' ITEM_INFO_16 = '''' , ' +
                ' ITEM_INFO_17 = '''' , ' +
                ' ITEM_INFO_18 = '''' , ' +
                ' ITEM_INFO_19 = '''' , ' +
                ' ITEM_INFO_20 = '''' , ' +
	              ' PLT_CODE     = '''' , ' +
	              ' WRAP_YN      = ''N'', ' +
	              ' MEMO_1       = '''' , ' +
	              ' MEMO_2       = '''' , ' +
	              ' MEMO_3       = '''' , ' +
	              ' MEMO_4       = '''' , ' +
	              ' MEMO_5       = '''' , ' +
	              ' ID_USER      = '''' , ' +
	              ' UP_DT        = '''' , ' + // 현재버퍼 도착시간
	              ' CR_DT        = ''''   ' + // 입고지시 시간
                ' WHERE ID_BUFF = ' + nowBuff ;
      SQL.Text := StrSQL ;
      ExecSQL;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryTemp.Close;
      TraceLogWrite('[240] 작업삭제 - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// Pnl_MainResize
//==============================================================================
procedure TfrmU240.Pnl_MainResize(Sender: TObject);
begin
  dgInfo1.Width := ((Sender as TPanel).Width div 2) - 3;
end;

//==============================================================================
// Pnl_BaseResize
//==============================================================================
procedure TfrmU240.Pnl_BaseResize(Sender: TObject);
begin
  Pnl_Btm.Height := (((Sender as TPanel).Height - Pnl_Top.Height) div 2) - 30;
end;

//==============================================================================
// edtITEM_INFOKeyPress
//==============================================================================
procedure TfrmU240.edtITEM_INFOKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
  //
  end else
  if (Key = #27) then
  begin
    (Sender as TEdit).Text := '';
  end;
end;

//==============================================================================
// edtITEM_LOTKeyPress
//==============================================================================
procedure TfrmU240.edtITEM_LOTKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    (Sender as TEdit).Text := '';
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU240.dgInfo1TitleClick(Column: TColumnEh);
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
// tmrQueryTimer
//==============================================================================
procedure TfrmU240.tmrQueryTimer(Sender: TObject);
begin
  try
    tmrQuery.Enabled := False;
//    fnCommandQuery;
  finally
    tmrQuery.Enabled := True;
  end;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmU240.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    fnCommandQuery;
  end;
end;

end.

