unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, ToolWin, Menus, ExtCtrls,  StdCtrls, DB, ADODB,
  d_MainDm, h_MainLib, h_ReferLib, Grids, DBGrids, DBCtrls, Mask,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Imaging.GIFImg, ShellAPI, CPort;

type
  TBCRBuff = Record
    RAllBuf : Array[1..1024] of AnsiChar;
    RAllCnt : Integer;
  end;

  TfrmMain = class(TForm)
    Pnl_Top : TPanel;
    staLoginInfo: TStatusBar;
    tmrSystem: TTimer;
    GroupBox1: TGroupBox;
    ImageUp: TImage;
    ImageDown: TImage;
    ImageMenuO: TImage;
    ImageMenuX: TImage;
    Img_Menu: TImage;
    tmrConnectCheck: TTimer;
    qryDBChk: TADOQuery;
    Pnl_MenuBasic: TPanel;
    Panel1: TPanel;
    Pnl_Menu: TPanel;
    PnlMenusize5: TPanel;
    PnlMenuSizeSub5: TPanel;
    PnlMenu5: TPanel;
    shp500T: TShape;
    shp500L: TShape;
    shp500R: TShape;
    PnlMenuTile5: TPanel;
    Shape11: TShape;
    Shape12: TShape;
    ImgMenusize5: TImage;
    Image14: TImage;
    img500: TImage;
    Label4: TLabel;
    PnlMenuBot5: TPanel;
    Shape13: TShape;
    PnlMenuTop5: TPanel;
    Shape14: TShape;
    PnlMenusize4: TPanel;
    PnlMenuSizeSub4: TPanel;
    PnlMenu4: TPanel;
    shp400T: TShape;
    shp400L: TShape;
    shp400R: TShape;
    PnlMenuTile4: TPanel;
    Shape25: TShape;
    Shape26: TShape;
    ImgMenusize4: TImage;
    Image30: TImage;
    img400: TImage;
    Label3: TLabel;
    PnlMenuBot4: TPanel;
    Shape27: TShape;
    PnlMenuTop4: TPanel;
    Shape28: TShape;
    PnlMenusize3: TPanel;
    PnlMenuSizeSub3: TPanel;
    PnlMenu3: TPanel;
    shp300T: TShape;
    shp300L: TShape;
    shp300R: TShape;
    PnlMenuTile3: TPanel;
    Shape38: TShape;
    Shape39: TShape;
    ImgMenusize3: TImage;
    Image38: TImage;
    img300: TImage;
    Label2: TLabel;
    PnlMenuBot3: TPanel;
    Shape40: TShape;
    PnlMenuTop3: TPanel;
    Shape41: TShape;
    PnlMenusize2: TPanel;
    PnlMenuSizeSub2: TPanel;
    PnlMenuBot2: TPanel;
    Shape47: TShape;
    PnlMenuTop2: TPanel;
    Shape48: TShape;
    PnlMenu2: TPanel;
    shp200T: TShape;
    shp200L: TShape;
    shp200R: TShape;
    PnlMenuTile2: TPanel;
    Shape45: TShape;
    Shape46: TShape;
    ImgMenusize2: TImage;
    Image46: TImage;
    img200: TImage;
    Label1: TLabel;
    PnlMenusize1: TPanel;
    PnlMenuSizeSub1: TPanel;
    PnlMenuBot1: TPanel;
    Shape54: TShape;
    PnlMenu1: TPanel;
    shp100T: TShape;
    shp100L: TShape;
    shp100R: TShape;
    PnlMenuTile1: TPanel;
    shp100TL: TShape;
    shp100TR: TShape;
    ImgMenusize1: TImage;
    Image4: TImage;
    img100: TImage;
    lbl100: TLabel;
    PnlMenuTop1: TPanel;
    Shape55: TShape;
    qryCommChk: TADOQuery;
    qryBCRConchk: TADOQuery;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    qryPermit: TADOQuery;
    PnlMenusize6: TPanel;
    PnlMenuSizeSub6: TPanel;
    PnlMenu6: TPanel;
    shp600T: TShape;
    shp600L: TShape;
    shp600R: TShape;
    PnlMenuTile6: TPanel;
    Shape58: TShape;
    Shape59: TShape;
    ImgMenusize6: TImage;
    Image8: TImage;
    img600: TImage;
    Label9: TLabel;
    PnlMenuBot6: TPanel;
    Shape60: TShape;
    Shape61: TShape;
    Shape62: TShape;
    PnlMenuTop6: TPanel;
    Shape63: TShape;
    Shape64: TShape;
    Shape65: TShape;
    PnlMenuSize: TPanel;
    Shape76: TShape;
    Img_MenuDetect: TImage;
    Img_MenusizeDown: TImage;
    Img_MenusizeUp: TImage;
    Pnl_BTN: TPanel;
    Pnl_Btn1: TPanel;
    cmdEXCEL: TSpeedButton;
    Pnl_Btn3: TPanel;
    cmdPRINT: TSpeedButton;
    Pnl_Btn4: TPanel;
    Pnl_Btn7: TPanel;
    cmdCLOSE: TSpeedButton;
    Pnl_Btn0: TPanel;
    cmdREGISTER: TSpeedButton;
    Pnl_Btn5: TPanel;
    cmdPREV: TSpeedButton;
    Pnl_Btn6: TPanel;
    cmdNEXT: TSpeedButton;
    Pnl_Btn2: TPanel;
    cmdDELETE: TSpeedButton;
    Panel7: TPanel;
    Pnl_Btn8: TPanel;
    cmdINQUIRY: TSpeedButton;
    cmdSetUp: TSpeedButton;
    Panel53: TPanel;
    Panel4: TPanel;
    Shape49: TShape;
    Shape52: TShape;
    Pan120: TPanel;
    Shape69: TShape;
    Shape73: TShape;
    shp120: TShape;
    lbl120: TLabel;
    Img120: TImage;
    Pan110: TPanel;
    Shape75: TShape;
    Shape77: TShape;
    shp110: TShape;
    lbl110: TLabel;
    Img110: TImage;
    Panel13: TPanel;
    Shape82: TShape;
    Shape83: TShape;
    Panel16: TPanel;
    Shape84: TShape;
    Shape85: TShape;
    Panel5: TPanel;
    Shape68: TShape;
    Shape72: TShape;
    Panel6: TPanel;
    Shape74: TShape;
    Shape78: TShape;
    Panel8: TPanel;
    Shape81: TShape;
    Shape90: TShape;
    Pan250: TPanel;
    Shape94: TShape;
    Shape95: TShape;
    shp250: TShape;
    lbl250: TLabel;
    Img250: TImage;
    Pan240: TPanel;
    Shape97: TShape;
    Shape98: TShape;
    shp240: TShape;
    lbl240: TLabel;
    Img240: TImage;
    Pan230: TPanel;
    Shape100: TShape;
    Shape101: TShape;
    shp230: TShape;
    lbl230: TLabel;
    Img230: TImage;
    Pan220: TPanel;
    Shape103: TShape;
    Shape104: TShape;
    shp220: TShape;
    lbl220: TLabel;
    Img220: TImage;
    Pan210: TPanel;
    Shape106: TShape;
    Shape107: TShape;
    shp210: TShape;
    lbl210: TLabel;
    Img210: TImage;
    Panel9: TPanel;
    Panel19: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel28: TPanel;
    Img_Main: TImage;
    Pan340: TPanel;
    Shape50: TShape;
    Shape51: TShape;
    Shp340: TShape;
    lbl340: TLabel;
    Img340: TImage;
    Pan310: TPanel;
    Shape67: TShape;
    Shape70: TShape;
    Shp310: TShape;
    lbl310: TLabel;
    Img310: TImage;
    Pan330: TPanel;
    Shape93: TShape;
    Shape96: TShape;
    Shp330: TShape;
    lbl330: TLabel;
    Img330: TImage;
    Pan320: TPanel;
    Shape102: TShape;
    Shape105: TShape;
    Shp320: TShape;
    lbl320: TLabel;
    Img320: TImage;
    Pan430: TPanel;
    Shape92: TShape;
    Shape99: TShape;
    Shp430: TShape;
    lbl430: TLabel;
    Img430: TImage;
    Pan420: TPanel;
    Shape109: TShape;
    Shape110: TShape;
    Shp420: TShape;
    lbl420: TLabel;
    Img420: TImage;
    Pan410: TPanel;
    Shape112: TShape;
    Shape113: TShape;
    Shp410: TShape;
    lbl410: TLabel;
    Img410: TImage;
    Pan550: TPanel;
    Shape115: TShape;
    Shape116: TShape;
    Shp550: TShape;
    lbl550: TLabel;
    Img550: TImage;
    Pan540: TPanel;
    Shape118: TShape;
    Shape119: TShape;
    Shp540: TShape;
    lbl540: TLabel;
    Img540: TImage;
    Pan520: TPanel;
    Shape121: TShape;
    Shape122: TShape;
    Shp520: TShape;
    lbl520: TLabel;
    Img520: TImage;
    Pan510: TPanel;
    Shape124: TShape;
    Shape125: TShape;
    Shp510: TShape;
    lbl510: TLabel;
    Img510: TImage;
    Pan610: TPanel;
    Shape66: TShape;
    Shape71: TShape;
    Shp610: TShape;
    lbl610: TLabel;
    Img610: TImage;
    Pan620: TPanel;
    Shape127: TShape;
    Shape128: TShape;
    Shp620: TShape;
    lbl620: TLabel;
    Img620: TImage;
    Pan440: TPanel;
    Shape8: TShape;
    Shape9: TShape;
    Shp440: TShape;
    lbl440: TLabel;
    Img440: TImage;
    Pan630: TPanel;
    Shape10: TShape;
    Shape22: TShape;
    Shp630: TShape;
    lbl630: TLabel;
    img630: TImage;
    tmrLogFileCheck: TTimer;
    Image1: TImage;
    Pan360: TPanel;
    Shape23: TShape;
    Shape24: TShape;
    Shp360: TShape;
    lbl360: TLabel;
    Img360: TImage;
    Pan350: TPanel;
    Shape30: TShape;
    Shape31: TShape;
    Shp350: TShape;
    lbl350: TLabel;
    Img350: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel10: TPanel;
    LblMenu000: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BCRCom: TComPort;
    tmrBcrConnectCheck: TTimer;
    qryBCR: TADOQuery;
    PnlBcrData: TPanel;
    LblBcrData: TLabel;
    tmrFocus: TTimer;
    ShpBcrData: TShape;
    PnlBcr: TPanel;
    ShpBCR: TShape;
    LblBcr: TLabel;
    btnBcrTest: TButton;
    Pan530: TPanel;
    Shape43: TShape;
    Shape44: TShape;
    Shp530: TShape;
    lbl530: TLabel;
    Img530: TImage;
    Timer1: TTimer;
    tmrReadingChk1: TTimer;
    tmrReadingChk2: TTimer;
    Pan390: TPanel;
    Shape29: TShape;
    Shape42: TShape;
    Shp390: TShape;
    lbl390: TLabel;
    Img390: TImage;
    Pan380: TPanel;
    Shape56: TShape;
    Shape57: TShape;
    Shp380: TShape;
    lbl380: TLabel;
    Img380: TImage;
    Pan370: TPanel;
    Shape80: TShape;
    Shape86: TShape;
    Shp370: TShape;
    lbl370: TLabel;
    Img370: TImage;
    Edit1: TEdit;
    qryLotReq: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnClick(Sender: TObject);
    procedure execMenuClick(Sender: TObject);
    procedure execMenuLblClick(Sender: TObject);
    procedure execMenuLblClickIsNotAvailable(Sender: TObject);
    procedure ImgMenusizeClick(Sender: TObject);
    procedure Img_MenuIconUpClick(Sender: TObject);
    procedure tmrSystemTimer(Sender: TObject);
    procedure lblMenuMouseLeave(Sender: TObject);
    procedure lblMenuMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure tmrConnectCheckTimer(Sender: TObject);
    procedure execLoginClick(Sender: TObject);
    procedure staLoginInfoDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure tmrLogFileCheckTimer(Sender: TObject);
    procedure BCRComAfterOpen(Sender: TObject);
    procedure BCRComAfterClose(Sender: TObject);
    procedure BCRComError(Sender: TObject; Errors: TComErrors);
    procedure BCRComBeforeClose(Sender: TObject);
    procedure tmrBcrConnectCheckTimer(Sender: TObject);
    procedure BCRComRxChar(Sender: TObject; Count: Integer);
    procedure btnBcrTestClick(Sender: TObject);
    procedure tmrFocusTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tmrReadingChkTimer(Sender: TObject);
  private
    { Private declarations }
    procedure execMenuActive( Menu_Number : Integer );
  public
    { Public declarations }
    function  fnDBConChk: Boolean;
    procedure WmMsgRecv( var Message : TMessage); message WM_USER;
    procedure CloseChkMsg(Sender: TObject);
    procedure fnCloseSet;
    procedure fnMenuPermit(UserCode:String);
    procedure SetUp;
    procedure fnSetMenuLblClick(MenuNumber: String; IsAvailable: String);
    procedure BCRLoadConfig;

    // ???????????? ????
    procedure LogFileDelete;
    Function  DeleteRecodingFile(fileDir: string; iOption: integer): boolean;
    function  MinDeleteFile(const DirName : string; const UseRecycleBin: Boolean): Boolean;

    // ?????????? ???? ????
    function  BcrProcess(BcrNo, BcrData: String): Boolean;
    procedure BcrDataUpdate(BcrNo, BcrData:String);
    procedure BcrOnlyDataUpdate(BcrNo, BcrData, MEMO_1, MEMO_2: String);
    function  fnItemInfoGet(iFlag, iCode: String): TITEMInfo;
    procedure ItemInfoClear(var ItemInfo: TITEMInfo);
    function  fnTrackDataInsert(TrackInfo: TTRACKInfo): Boolean;
    function  SelectCurrent(FieldName, Current_Name, Current_ID : String): Boolean;
    function  fnInterfaceUpdate(Mode, RequestDate, ItemLot:String): Boolean;
    function  fnStockCheck(ITEM_LOT:String): String;
    function  fnCVLineCheck(ITEM_LOT:String): String;
    function  fnRequestDataInsert(rType, rLot, rDate: String): Boolean;
  end;
var
  frmMain: TfrmMain;
  CV_COMM : Boolean ;
  SC_COMM : Boolean ;
  PCPosition : Integer;
  BarcodeData : Array [1..2, 1..2] of String;
  amenu : Array [1..6] of integer;
  BCR_Buff : TBCRBuff;
  DeleteOption : integer ;
  GongJungLine1, GongJungLine2 : String;
implementation

uses Login, SetUp,
     U110, U120,
     U210, U220, U230, U240, U250,
     U310, U320, U330, U340, U350, U360, U370, U380, U390,
     U410, U420, U430, U440,
     U510, U520, U530, U540, U550,
     U610, U620, U630;

{$R *.dfm}

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
    m.MainHd := Handle;
    execLoginClick(nil) ;

    tmrConnectCheck.Enabled := True ;
    tmrSystem.Enabled := True;

    CloseChk := False ;
    frmMain.Caption    := ' ' + IniRead( INI_PATH, 'PROGRAM', 'ProgramName' ,'???????????? ?????????? ???? ??????' ) + ' Ver 1.5.0.1' ;
    frmMain.Hint       := '?????????? ???? ?????? Ver 1.2.0.1' ;
    LblMenu000.Caption := frmMain.Hint;
    PCPosition         := StrToInt(IniRead( INI_PATH, 'PROGRAM', 'PCPosition' ,''));
    staLoginInfo.Panels[1].Text := IniRead( INI_PATH, 'PROGRAM', 'CompanyName' ,'????????????' );
    staLoginInfo.Panels[2].Text := IniRead( INI_PATH, 'PROGRAM', 'CompanyKind' ,'?????? ????' );
    staLoginInfo.Panels[0].Style := psOwnerDraw ;
    PnlMenuSize.Parent := staLoginInfo ;
    staLoginInfo.Panels[5].Style := psOwnerDraw ;
    PnlBcr.Parent := staLoginInfo ;
    staLoginInfo.Panels[6].Style := psOwnerDraw ;
    PnlBcrData.Parent := staLoginInfo ;

    BarcodeData[1][1] := '';
    BarcodeData[1][2] := '';
    BarcodeData[2][1] := '';
    BarcodeData[2][2] := '';

    fnWmMsgSend( 22222,222 );

    fnMenuPermit(MainDM.M_Info.UserCode);

    if MainDM.M_info.UserAdmin = 'Y' then
    begin
      cmdSetUp.Enabled := True;
    end else
    begin
      cmdSetUp.Enabled := False;
    end;

    if PCPosition in [1,2] then BCRLoadConfig;

    Application.HintPause := 250;      // 250 mSec before hint is shown
    Application.HintHidePause := 5000; // hint disappears after 5 secs

    // ???? ???? ????
    DeleteOption := StrToIntDef(IniRead(INI_PATH, 'Delete', 'DeleteOption', '0'), 0);

    TraceLogWrite( '???????? ????============== ??????????['+MainDm.M_Info.UserCode+']');

    GongJungLine1 := IniRead( INI_PATH, 'GONGJUNG', 'LINE1' ,'' );
    GongJungLine2 := IniRead( INI_PATH, 'GONGJUNG', 'LINE2' ,'' );
  except
    on E : Exception do
    begin
      TraceLogWrite('[000] ???????? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmMain.FormActivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormCloseQuery
//==============================================================================
procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not CloseChk then
  begin
    CloseChkMsg(nil);
    CanClose := False;
  end;
end;

//==============================================================================
// CloseChkMsg
//==============================================================================
procedure TfrmMain.CloseChkMsg(Sender: TObject);
begin
  if MessageDlg('?????????? ?????????????????', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    CloseChk := True ;
    Close;
  end;
end;

//==============================================================================
// fnCloseSet
//==============================================================================
procedure TfrmMain.fnCloseSet;
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
  if MainDM.MainDatabase.Connected then MainDM.MainDatabase.Close ;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TraceLogWrite( '???????? ????============== ??????????['+MainDm.M_Info.UserCode+']');
  fnCloseSet;
  ExitProcess(0);
end;

//==============================================================================
// WmMsgRecv (???? ???? ?????? ????)
//==============================================================================
procedure TfrmMain.WmMsgRecv(var Message : TMessage);
  Procedure ToolBtnSet ( TBtnNo : Integer; Status : String  );
  var
    BtnStatus : Boolean;
  begin
    if   Status = '1' Then BtnStatus := True Else BtnStatus := False;
    case TBtnNo of
      1  : cmdREGISTER.Enabled := BtnStatus ; // cmdReset
      2  : cmdEXCEL.Enabled    := BtnStatus ; // cmdExcel
      3  : cmdDELETE.Enabled   := BtnStatus ; // cmdDelete
      4  : cmdPRINT.Enabled    := BtnStatus ; // cmdPrint
      5  : cmdINQUIRY.Enabled  := BtnStatus ; // cmdQuery
      6  : cmdPREV.Enabled     := BtnStatus ; // cmdPREV
      7  : cmdNEXT.Enabled     := BtnStatus ; // cmdNEXT
      8  : cmdCLOSE.Enabled    := BtnStatus ; // cmdClose
    end;
  end;
var
  i : Integer;
  RecvStr : String;
begin
  RecvStr  :=  IntToStr ( Message.WParam ) +  IntToStr ( Message.LParam );

  for i := 1 to  Length ( RecvStr ) do
    ToolBtnSet ( i , Copy( RecvStr, i , 1 ) );
end;

//==============================================================================
// btnClick (???????? ???? ??????)
//==============================================================================
procedure TfrmMain.btnClick(Sender: TObject);
begin
  if      ( Sender As  TSpeedButton ) =  cmdNEXT then // ???? ??
    Next
  else if ( Sender As  TSpeedButton ) =  cmdPREV then // ???? ??
    Previous
  else if ( Sender As  TSpeedButton ) =  cmdSetUp then // ????
    SetUp
  else if ( ActiveMDIChild  <>  nil ) then
    SendMessage( ActiveMDIChild.Handle, WM_USER , TSpeedButton(Sender).Tag , 0 );
end;

//==============================================================================
// tmrSystemTimer
//==============================================================================
procedure TfrmMain.tmrSystemTimer(Sender: TObject);
var
  StrSql : String;
  tmp : String;
  TmpBool : Boolean;
begin
  try
    tmrSystem.Enabled := False;
    staLoginInfo.Panels[7].Text := FormatDateTime( 'YYYY-MM-DD HH:NN:SS' ,now() ) + '      ';

    if MdiChildCount=0 then
    begin
      fnWmMsgSend( 22222,222 );
      LblMenu000.Caption := frmMain.Hint;
    end;
  finally
    tmrSystem.Enabled := True;
  end;
end;

//==============================================================================
// execMenuClick (???? ???????? ???? ??????)
//==============================================================================
procedure TfrmMain.execMenuClick(Sender: TObject);
begin
  if StrToInt(Copy ( TMenuItem( Sender).Name , 2, 4 )) <> 0 Then
  begin
    execMenuActive( StrToInt(Copy ( TMenuItem( Sender).Name , 2, 4 )) );
  end;
end;

//==============================================================================
// execMenuLblClick (???? ???????? ???? ?????? ??????)
//==============================================================================
procedure TfrmMain.execMenuLblClick(Sender: TObject);
begin
  if (TLabel( Sender).Tag) <> 0 Then
  begin
    execMenuActive( StrToInt(IntToStr(TLabel( Sender).Tag)+'0'));
  end;
end;

//==============================================================================
// execMenuLblClick (???? ???????? ???? ?????? ?? ??????)
//==============================================================================
procedure TfrmMain.execMenuLblClickIsNotAvailable(Sender: TObject);
begin
  MessageDlg('???? ?????? ?????????? ????????.', mtWarning, [mbYes], 0) ;
end;

//==============================================================================
// execMenuActive (?????????? ???? ???????? ???? ??????)
//==============================================================================
procedure TfrmMain.execMenuActive(Menu_Number: Integer);
begin
  // ?????? ???? ?????????? ???? ???? ???????? ????.
  case Menu_Number of
     // ????????------------------------------------------
     1100 : U110Create();          // ??????????
     1200 : U120Create();          // ????????

     // ????????------------------------------------------
     2100 : U210Create();          // ???? ????????
     2200 : U220Create();          // ???? ????????
     2300 : U230Create();          // ???? ????????
     2400 : U240Create();          // ???? ????????
     2500 : U250Create();          // ???? ????????

     // ??????????------------------------------------------
     3100 : U310Create();          // ???????? ????
     3200 : U320Create();          // ???????? ????
     3300 : U330Create();          // ???????? ????
     3400 : U340Create();          // ???????? ????
     3500 : U350Create();          // ???????? ????
     3600 : U360Create();          // ???????? ????
     3700 : U370Create();          // ???????? ????
     3800 : U380Create();          // ???????? ????
     3900 : U390Create();          // ???????? ????

     // ????????------------------------------------------
     4100 : U410Create();          // ?? ???? ????
     4200 : U420Create();          // ?????? ???? ????
     4300 : U430Create();          // ?????? ???? ????
     4400 : U440Create();          // LOT?? ???? ????

     // ????????------------------------------------------
     5100 : U510Create();          // ???? ???? ????
     5200 : U520Create();          // ???? ???? ????
     5300 : U530Create();          // ???? ???? ????
     5400 : U540Create();          // ?????????? ????????
     5500 : U550Create();          // ?????????? ????????

     // ????????------------------------------------------
     6100 : U610Create();          // ???? ????????
     6200 : U620Create();          // ???? ????????
     6300 : U630Create();          // ???? ????????

     else exit;
  end;
end;

//==============================================================================
// tmrConnectCheckTimer
//==============================================================================
procedure TfrmMain.tmrConnectCheckTimer(Sender: TObject);
begin
  try
    try
      tmrConnectCheck.Enabled := False ;
      if not fnDBConChk then
      begin
        ADOConnection ;
      end;
    finally
      tmrConnectCheck.Enabled := True ;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[000] ???????????? ????????(??????) - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// execLoginClick (??????/????????)
//==============================================================================
procedure TfrmMain.execLoginClick(Sender: TObject);
begin
  MainDm.M_Info.IdPass  := False;
  LoginBoxCreate();

  if MainDm.M_Info.IdPass then
  begin
    staLoginInfo.Panels[3].Text := MainDm.M_Info.UserCode + ' / ' + MainDm.M_Info.UserName ;
    if MainDM.M_Info.UserAdmin = 'Y' then
         staLoginInfo.Panels[4].Text := '?????? ????'
    else staLoginInfo.Panels[4].Text := '???? ????';
  end else
  begin
    Close;
    ExitProcess(0);
  end;
end;

//==============================================================================
// fnDBConChk
//==============================================================================
function TfrmMain.fnDBConChk: Boolean;
var
  StrSQL : String;
begin
  Result := False ;
  try
    with qryDBChk do
    begin
      Close;
      SQL.Clear ;
      StrSQL := ' SELECT GETDATE() ' ;
      SQL.Text := StrSQL ;
      Open ;
      if not (Bof and Eof) then
      begin
        Result := True ;
        m.ConChk := True ;
      end;
    end;
  except
    on E : Exception do
    begin
      m.ConChk := False ;
      qryDBChk.Close;
      TraceLogWrite('[000] ???????????? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnMenuPermit
//==============================================================================
procedure TfrmMain.fnMenuPermit(UserCode: String);
var
  i, pHight : Integer;
  StrSQL : String;
  TmpPnl : TPanel ;
begin
  try
    for i := Low(amenu) to High(amenu) do amenu[i] := 0;

    with qryPermit do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT L.USER_ID, L.MENU_ID, L.MENU_NM, L.USED_YN, ' +
                '        M.MENU_LVL, M.MENU_INFO_1 ' +
                '   FROM TT_USER_MENU L WITH (NOLOCK) ' +
                '   LEFT OUTER JOIN TT_MENU M WITH (NOLOCK) ' +
                '     ON L.WMS_NO  = M.WMS_NO  ' +
                '    AND L.MENU_ID = M.MENU_ID ' +
                '  WHERE L.WMS_NO  = ' + QuotedStr(MainDM.M_Info.WMS_NO) +
                '    AND L.USER_ID = ' + QuotedStr(UserCode)   +
                '    AND M.MENU_LVL = ''2'' ' +
                '  ORDER BY L.MENU_ID ';
      SQL.Text := StrSQL;
      Open;
      First;

      while not (Eof) do
      begin
        if FieldByName('USED_YN').AsString = 'Y' then
        begin
          i := StrToInt(Copy(FieldByName('MENU_INFO_1').AsString,1,1));
          Inc(amenu[i]);
        end;

        TmpPnl := TPanel(Self.FindComponent('Pan'+FieldByName('MENU_ID').AsString));
        if TmpPnl <> nil then
        begin
          if FieldByName('USED_YN').AsString = 'N' then
               TPanel(Self.FindComponent('Pan'+FieldByName('MENU_ID').AsString)).Visible := False
          else TPanel(Self.FindComponent('Pan'+FieldByName('MENU_ID').AsString)).Visible := True;

          TLabel(Self.FindComponent('lbl'+FieldByName('MENU_ID').AsString)).Caption :=
             FieldByName('MENU_ID').AsString+'. '+FieldByName('MENU_NM').AsString;

          TLabel(Self.FindComponent('lbl'+FieldByName('MENU_ID').AsString)).Hint :=
             FieldByName('MENU_ID').AsString+'. '+FieldByName('MENU_NM').AsString;
        end;
        Next;
      end;

      pHight := 42;   // (Menu????(24) * Menu????) + 42
      for i := Low(amenu) to High(amenu) do
      begin
        if amenu[i] = 0 then
             TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Visible := False
        else TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Visible := True;

        if amenu[i] > 0 then
        begin
          TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Height    := pHight + (Pan110.Height * amenu[i] - 3);
          TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Hint      := IntToStr(pHight + (Pan110.Height * amenu[i]) - 3);
          TPanel(Self.FindComponent('PnlMenuSizeSub'+IntToStr(i))).Height := pHight + (Pan110.Height * amenu[i]) - 5;
        end;
      end;
    end;
  except
    on E : Exception do
    begin
      qryPermit.Close;
      TraceLogWrite('[000] ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// Img_MenusizeClick (?? ?????? ????/???? ?????? ???? ??)
//==============================================================================
procedure TfrmMain.ImgMenusizeClick(Sender: TObject);
var
  MenuNo, StdSize  : integer;
  TmpPnl : TPanel ;
  TmpImg : TImage ;
begin
  TmpPnl  := nil; TmpImg := nil;
  StdSize := 32 ;
  MenuNo  := (Sender as TImage).Tag ;
  TmpPnl  := TPanel(Self.FindComponent('PnlMenusize'+IntToStr(MenuNo))) ;
  TmpImg  := TImage(Self.FindComponent('ImgMenusize'+IntToStr(MenuNo))) ;

  if TmpPnl.Height <> StdSize then
  begin // ?????? ?????????? ????
    TmpPnl.Height  := StdSize ;
    TmpImg.Picture := ImageDown.Picture ;
  end else
  begin // ?????? ?????????? ????
    TmpPnl.Height  := StrToInt(TmpPnl.Hint) ;
    TmpImg.Picture := ImageUp.Picture ;
  end;
end;

//==============================================================================
// Img_MenuIconUpClick (???? ?????? ????/???? ?????? ???? ??)
//==============================================================================
procedure TfrmMain.Img_MenuIconUpClick(Sender: TObject);
var
  SelImg, StdSize, i : integer;
begin
  StdSize := 32 ;
  SelImg  := (Sender as TImage).Tag ;

  case SelImg of
    1 : // ???? ???? ????
    begin
      for i:= 1 to MenuCount do
      begin
        TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Height  := StdSize ;
        TImage(Self.FindComponent('ImgMenusize'+IntToStr(i))).Picture := ImageDown.Picture ;
      end;
    end;
    2 : // ???? ???? ????
    begin
      for i:= 1 to MenuCount do
      begin
        TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Height :=
        StrToInt(TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Hint) ;
        TImage(Self.FindComponent('ImgMenusize'+IntToStr(i))).Picture := ImageUp.Picture ;
      end;
    end;
    3 : // ?????? ????/????
    begin
      if Pnl_MenuBasic.Visible then
      begin
        Pnl_MenuBasic.Visible := False ;
        Img_MenuDetect.Picture := ImageMenuO.Picture ;
      end else
      begin
        Pnl_MenuBasic.Visible := True ;
        Img_MenuDetect.Picture := ImageMenuX.Picture ;
      end;
    end;
  end;
end;

//==============================================================================
// lblMenuMouseLeave (???????????? ?????? ????)
//==============================================================================
procedure TfrmMain.lblMenuMouseLeave(Sender: TObject);
begin
  TShape(Self.FindComponent('Shp'+IntToStr((Sender as TLabel).Tag))).Brush.Color := $00E1E1E1;
end;

//==============================================================================
// lblMenuMouseMove (???????????? ?????? ????)
//==============================================================================
procedure TfrmMain.lblMenuMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  TShape(Self.FindComponent('Shp'+IntToStr((Sender as TLabel).Tag))).Brush.Color := $00EFC79E;
end;

//==============================================================================
// SetUp
//==============================================================================
procedure TfrmMain.SetUp;
begin
  if MainDM.M_Info.UserAdmin <> 'Y' then
  begin
    cmdSetUp.Enabled := False;
    Exit;
  end;

  frmSetUpBox := TfrmSetUpBox.Create(Application);
  frmSetUpBox.PnlFormName.Caption := '?????? ????';
  frmSetUpBox.Caption := '?????? ????';
  frmSetUpBox.btnSave.Caption := '?? ??';
  frmSetUpBox.ShowModal ;
end;

//==============================================================================
// staLoginInfoDrawPanel
//==============================================================================
procedure TfrmMain.staLoginInfoDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel = staLoginInfo.Panels[0] then
  begin
    with PnlMenuSize do
    begin
      Top := Rect.Top - 1 ;
      Left := Rect.Left + 1 ;
    end;
  end;

  if Panel = staLoginInfo.Panels[5] then
  begin
    with PnlBcr do
    begin
      Top := Rect.Top - 1 ;
      Left := Rect.Left + 1 ;
    end;
  end;

  if Panel = staLoginInfo.Panels[6] then
  begin
    with PnlBcrData do
    begin
      Top := Rect.Top - 1 ;
      Left := Rect.Left + 1 ;
    end;
  end;
end;

//==============================================================================
// fnSetMenuLblClick (???? ?????? ???? ?? ?????? ???? ?????? ????)
//==============================================================================
procedure TfrmMain.fnSetMenuLblClick(MenuNumber: String; IsAvailable: String);
var
  tmpLabel : TLabel;
begin
  tmpLabel := TLabel(Self.FindComponent('lbl' + MenuNumber));

  if tmpLabel <> nil then
  begin
    if IsAvailable = 'Y' then
    begin
      tmpLabel.OnClick := execMenuLblClick;
      tmpLabel.Cursor  := crHandPoint;
      cmdSetUp.Enabled := True;
      cmdSetUp.Cursor  := crHandPoint;
    end else
    begin
      tmpLabel.OnClick := execMenuLblClickIsNotAvailable;
      tmpLabel.Cursor := crNo;
      cmdSetUp.Enabled := False;
      cmdSetUp.Cursor  := crNo;
    end;
  end;
end;

//==============================================================================
// tmrBcrConnectCheckTimer
//==============================================================================
procedure TfrmMain.tmrBcrConnectCheckTimer(Sender: TObject);
begin
  try
    if not BCRCom.Connected then
    begin
      BCRLoadConfig;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[000] ?????? ???? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// tmrFocusTimer
//==============================================================================
procedure TfrmMain.tmrFocusTimer(Sender: TObject);
begin
  try
    tmrFocus.Enabled := False;
    shpBcrData.Brush.Color := clBtnFace;
  except
    on E : Exception do
    begin
      TraceLogWrite('[000] ?????? ???? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// BCRLoadConfig
//==============================================================================
procedure TfrmMain.BCRLoadConfig;
var
  StrSQL, FieldName : String;
  UsedChk : Boolean;
begin
  UsedChk   := False;
  FieldName := 'OPTION' + IntToStr(PCPosition);
  try
    with qryBCRConchk do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ' + FieldName + ' as UsedChk FROM TC_CURRENT WITH (NOLOCK) ' +
                '  WHERE CURRENT_NAME = ''READMODE'' ' ;
      SQL.Text := StrSQL;
      Open;
      if not (Bof and Eof) then
      begin
        UsedChk := FieldByName('UsedChk').AsBoolean;
      end;

      if UsedChk then
      begin
        if      PCPosition = 1 then LblBcr.Caption := '???? ?????? ????????'
        else if PCPosition = 2 then LblBcr.Caption := '???? ?????? ????????';

        Close;
        SQL.Clear;
        StrSQL := ' SELECT * FROM TC_COMSET WITH (NOLOCK) ' +
                  '  WHERE ID_MACH   = ''BCR'' ' +
                  '    AND ID_MACHNO = ''' + IntToStr(PCPosition) + ''' ' ;
        SQL.Text := StrSQL;
        Open;
        if not (Bof and Eof) then
        begin
          BCRCom.Port         := Trim(FieldByName('ID_COMPORT').AsString);
          BCRCom.BaudRate     := StrToBaudRate(Trim(FieldByName('ID_BAUDRATE'  ).AsString));
          BCRCom.DataBits     := StrToDataBits(Trim(FieldByName('ID_DATABITS'  ).AsString));
          BCRCom.StopBits     := StrToStopBits(Trim(FieldByName('ID_STOPBITS'  ).AsString));
          BCRCom.Parity.Bits  := StrToParity  (Trim(FieldByName('ID_PARITYBITS').AsString));
          BCRCom.Open;
        end;
      end else
      begin
        if PCPosition = 1 then LblBcr.Caption := '???? ?????? ????????' else LblBcr.Caption := '???? ?????? ????????';
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryBCRConchk.Close;
      TraceLogWrite('[000] ?????? ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// BCRComRxChar
//==============================================================================
procedure TfrmMain.BCRComRxChar(Sender: TObject; Count: Integer);
var
  RecvStr, StrSQL : String;
  RecvBuf : Array[1..1024] of AnsiChar;
  RecvCnt, i : integer;
  EndOfChk : Boolean;
begin
  try
    FillChar(RecvBuf, SizeOf(RecvBuf), Chr($00));
    RecvCnt := BCRCom.Read(RecvBuf, Count);

    EndOfChk := False;

    for i := 1 to RecvCnt do
    begin
      if (RecvBuf[i] = LF) then
      begin
        EndOfChk := True;
        Break;
      end;
    end;

    StrMove( @BCR_Buff.RAllBuf[BCR_Buff.RAllCnt+1], PAnsiChar(Copy(RecvBuf, 1, RecvCnt)), RecvCnt );
    BCR_Buff.RAllCnt := BCR_Buff.RAllCnt + RecvCnt;

    if EndOfChk then
    begin
      for i := 1 to BCR_Buff.RAllCnt do
        RecvStr := RecvStr + Copy(BCR_Buff.RAllBuf, i, 1) ;
      if RecvStr[Length(RecvStr)] = #$A then Delete(RecvStr, Length(RecvStr), 1);  // LF ????
      if RecvStr[Length(RecvStr)] = #$D then Delete(RecvStr, Length(RecvStr), 1);  // CR ????

      LblBcrData.Caption     := RecvStr;
      ShpBcrData.Brush.Color := clLime;
      tmrFocus.Enabled       := True;

      BarcodeData[PCPosition][1] := RecvStr;
      BarcodeData[PCPosition][2] := 'Reading';
      TTimer(Self.FindComponent('tmrReadingChk'+IntToStr(PCPosition))).Enabled := True;

      BcrProcess(IntToStr(PCPosition), RecvStr);

      FillChar( BCR_Buff.RAllBuf, SizeOf(BCR_Buff.RAllBuf), Chr($00) );
      BCR_Buff.RAllCnt := 0;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[000] ?????? ?????? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// BcrProcess
//==============================================================================
function TfrmMain.BcrProcess(BcrNo, BcrData: String): Boolean;
var
  TrackInfo : TTRACKInfo;
  ItemInfo : TITEMInfo;
  StrMsg1, StrMsg2, StrMsg3, StrMsg4, LogStr1, LogStr2  : String;
  StrResult, tDate : String;
begin
  Result := False;
  try
    if BcrNo = '2' then
    begin // ???? ??????
      BcrDataUpdate(BcrNo, BcrData);
      Result := True;
      Exit;
    end;
    ItemInfoClear(ItemInfo);

    //===============================================
    // ????????
    //===============================================
    TrackInfo.ID_DATE    := ' CONVERT(VARCHAR(MAX), GETDATE(), 112) ';
    TrackInfo.ID_TIME    := ' REPLACE(CONVERT(VARCHAR(MAX), GETDATE(), 108), '':'', '''') ';
    TrackInfo.ID_INDEX   := 0; // ????????
    TrackInfo.ID_SUBIDX  := 0; // ????????(????)
    TrackInfo.ID_EMG     := 0; // ????????(0:????, 1:????)
    TrackInfo.ID_SC      := '';
    TrackInfo.ID_CODE    := '';
    TrackInfo.ID_BANK    := '';
    TrackInfo.ID_BAY     := '';
    TrackInfo.ID_LEVEL   := '';
    TrackInfo.KIND_1     := '';
    TrackInfo.KIND_2     := '';
    TrackInfo.KIND_3     := '';
    TrackInfo.KIND_4     := '';
    TrackInfo.KIND_5     := '';
    TrackInfo.IN_DATE    := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';
    TrackInfo.OT_SITE    := ''; // ????????
    TrackInfo.OT_DATE    := ''; // ????????
    TrackInfo.BCR_CHK    := 0;  // ???????? ???????? ???? ???? (0:????????, 1:????????)
    TrackInfo.STATUS     := ''; // ????????(CV????, CV????)
    TrackInfo.PROCESS    := ''; // ????????(????,????????)

    //===============================================
    // ???????? [INT_INORDER]
    //===============================================
    TrackInfo.ITEM_LOT := BcrData; // ????????

    if SelectCurrent('OPTION3', 'READMODE', '0') then
    begin // 3????(120) ???? ???? ???? ON
      TrackInfo.ID_TYPE := '??????';
      TrackInfo.IN_SITE := '120';
      ItemInfo := fnItemInfoGet('??????', TrackInfo.ITEM_LOT);
    end else
    begin
      TrackInfo.ID_TYPE := '????????';
      ItemInfo := fnItemInfoGet('????', TrackInfo.ITEM_LOT);

      if ItemInfo.ITEM_INFO_09 = GongJungLine1 then
      begin
        TrackInfo.IN_SITE := '102'; // ?????? 1 ????
      end else
      if ItemInfo.ITEM_INFO_09 = GongJungLine2 then
      begin
        TrackInfo.IN_SITE := '112'; // ?????? 2 ????????
      end else
      begin
        TrackInfo.IN_SITE := '120'; // AGV ???? ????
      end;
    end;

    TrackInfo.ITEM_TYPE    := ItemInfo.ITEM_TYPE;
    TrackInfo.ITEM_WEIGHT  := ItemInfo.ITEM_WEIGHT;
    TrackInfo.ITEM_QTY     := ItemInfo.ITEM_QTY;
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
    TrackInfo.CR_DT        := ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ';  // ???????? ???? -> ORDER?? OR_DT?? ??

    StrMsg1 := TrackInfo.ID_TYPE;
    StrMsg2 := TrackInfo.IN_SITE;

    //===============================================
    // ????LOT ????(????????)(TT_RACK_STOCK)
    //===============================================
    StrResult := fnStockCheck(TrackInfo.ITEM_LOT);
    if StrResult <> '' then
    begin
      LogStr1 := ' ???????? >> ????????['+StrMsg1+'], ????????['+StrMsg2+'],';
      LogStr2 := ' ???? ?????? ?????? ???????? ????['+Copy(StrResult,2,8)+']';

      BcrOnlyDataUpdate(BcrNo, TrackInfo.ITEM_LOT, LogStr1, LogStr2);
      Exit;
    end;

    //===============================================
    // ????LOT ????(??????????)(TT_TRACK)
    //===============================================
    StrResult := fnCVLineCheck(TrackInfo.ITEM_LOT);
    if StrResult <> '' then
    begin
      LogStr1 := ' ???????? >> ????????['+StrMsg1+'], ????????['+StrMsg2+'],';
      LogStr2 := ' ???????? ?????? ?????? ???????? ????['+Copy(StrResult,1,3)+']';

      BcrOnlyDataUpdate(BcrNo, TrackInfo.ITEM_LOT, LogStr1, LogStr2);
      Exit;
    end;

    //===============================================
    // ???????? ???? ???? ??
    //===============================================
    if ItemInfo.ITEM_TYPE = '' then
    begin
      LogStr1 := ' ???????? >> ????????['+StrMsg1+'], ????????['+StrMsg2+'],';
      if TrackInfo.ID_TYPE = '??????' then
           LogStr2 := ' ???? ?????????? ?????? ???? ???? ????'
      else
      begin
        LogStr2 := ' ???? ?????????? ???????????? ????';
        tDate := FormatDateTime('YYYYMMDDHHNNSS', Now);
        fnRequestDataInsert('E', TrackInfo.ITEM_LOT, tDate);
      end;
      BcrOnlyDataUpdate(BcrNo, TrackInfo.ITEM_LOT, LogStr1, LogStr2);
      Exit;
    end;

    //===============================================
    // ?????? ????
    //===============================================
    if not fnTrackDataInsert(TrackInfo) then
    begin
      LogStr1 := ' ???????? >> ????????['+StrMsg1+'], ????????['+StrMsg2+'],';
      LogStr2 := ' ???????? ?????? ???? ???? ?????? ???? ????';
      BcrOnlyDataUpdate(BcrNo, TrackInfo.ITEM_LOT, LogStr1, LogStr2);
      Exit;
    end else
    begin
      // ?????? ???? ???? ????????
      BcrDataUpdate(BcrNo, TrackInfo.ITEM_LOT);

      // [??????????] ???????????? ???????? (???????? ????)
      if TrackInfo.ID_TYPE = '????????' then
      begin
        fnInterfaceUpdate('1', TrackInfo.ITEM_INFO_20, TrackInfo.ITEM_LOT);
      end;
      Result := True;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[000] ?????? ???????? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnItemInfoGet
//==============================================================================
function TfrmMain.fnItemInfoGet(iFlag, iCode: String): TITEMInfo;
var
  ItemInfo : TITEMInfo;
  StrSQL : String;
begin
  try
    if iFlag = '??????' then
    begin
      StrSQL := ' SELECT TOP 1 * FROM TT_HISTORY WITH (NOLOCK) ' +
                '  WHERE ITEM_LOT = ''' + iCode + ''' ' +
                '    AND SUBSTRING(ID_TYPE, LEN(ID_TYPE)-1, 2) = ''????'' ' ;
    end else
    begin
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
    end;

    with qryBCR do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      Open;

      if not (Bof and Eof) then
      begin
        // ???????? TT_HISTORY ???? ???????? ???????? Get
        // ?????? IF_RECEIVE ???????????????? ???????? Get
        if iFlag = '??????' then
        begin
          ItemInfo.ITEM_TYPE    := FieldByName('ITEM_TYPE'   ).AsString; // ????????(??????, ????)
          ItemInfo.ITEM_WEIGHT  := FieldByName('ITEM_WEIGHT' ).AsString; // ????
          ItemInfo.ITEM_QTY     := FieldByName('ITEM_QTY'    ).AsString; // ????
          ItemInfo.ITEM_INFO_01 := FieldByName('ITEM_INFO_01').AsString; // ???????? (???? ?????? ???? ???? ?? ?????????????? ITEM_INFO_03, ITEM_INFO_04?? ???????? ?? ITEM_INFO_01, ITEM_INFO_02 ????)
          ItemInfo.ITEM_INFO_02 := FieldByName('ITEM_INFO_02').AsString; // ??????
          ItemInfo.ITEM_INFO_03 := FieldByName('ITEM_INFO_03').AsString; // ????????(??????)
          ItemInfo.ITEM_INFO_04 := FieldByName('ITEM_INFO_04').AsString; // ??????(??????)
          ItemInfo.ITEM_INFO_05 := FieldByName('ITEM_INFO_05').AsString; // ????????
          ItemInfo.ITEM_INFO_06 := FieldByName('ITEM_INFO_06').AsString; // ????????
          ItemInfo.ITEM_INFO_07 := FieldByName('ITEM_INFO_07').AsString; // ??????
          ItemInfo.ITEM_INFO_08 := FieldByName('ITEM_INFO_08').AsString; // ????????
          ItemInfo.ITEM_INFO_09 := FieldByName('ITEM_INFO_09').AsString; // ????????
          ItemInfo.ITEM_INFO_10 := FieldByName('ITEM_INFO_10').AsString; // ????????
          ItemInfo.ITEM_INFO_11 := FieldByName('ITEM_INFO_11').AsString; // ????????(BAG???? ????)
          ItemInfo.ITEM_INFO_12 := FieldByName('ITEM_INFO_12').AsString; // ????????????(???????? ????)
          ItemInfo.ITEM_INFO_13 := FieldByName('ITEM_INFO_13').AsString; // ????????????(???????? ????)
          ItemInfo.ITEM_INFO_14 := FieldByName('ITEM_INFO_14').AsString; // ????????????(???????? ????)
          ItemInfo.ITEM_INFO_15 := FieldByName('ITEM_INFO_15').AsString; // ????????????(???????? ????)
          ItemInfo.ITEM_INFO_16 := FieldByName('ITEM_INFO_16').AsString; // ????LOT(???????? ????)
          ItemInfo.ITEM_INFO_17 := FieldByName('ITEM_INFO_17').AsString; //
          ItemInfo.ITEM_INFO_18 := FieldByName('ITEM_INFO_18').AsString; // ????????????(1:????????, 3:??????, 5:????, 9:????, C:????????)
          ItemInfo.ITEM_INFO_19 := FieldByName('ITEM_INFO_19').AsString; // ????????????(????????)
          ItemInfo.ITEM_INFO_20 := FieldByName('ITEM_INFO_20').AsString; // ????????????(????????)
        end else
        begin
          if FieldByName('BODY_12').AsString = 'N' then
               ItemInfo.ITEM_TYPE := '??????'
          else ItemInfo.ITEM_TYPE := '????';                             // ????????(??????, ????)
          ItemInfo.ITEM_WEIGHT  := FormatFloat('####0.000', StrToFloatDef(Trim(FieldByName('BODY_06').AsString), 0)); // ????
          ItemInfo.ITEM_QTY     := '1';                                  // ????
          ItemInfo.ITEM_INFO_01 := FieldByName('BODY_04').AsString;      // ???????? (???? ?????? ???? ???? ?? ?????????????? ITEM_INFO_03, ITEM_INFO_04?? ???????? ?? ITEM_INFO_01, ITEM_INFO_02 ????)
          ItemInfo.ITEM_INFO_02 := FieldByName('BODY_05').AsString;      // ??????
          ItemInfo.ITEM_INFO_03 := '';                                   // ????????(??????)
          ItemInfo.ITEM_INFO_04 := '';                                   // ??????(??????)
          ItemInfo.ITEM_INFO_05 := FieldByName('BODY_07').AsString;      // ????????
          ItemInfo.ITEM_INFO_06 := FieldByName('BODY_08').AsString;      // ????????
          ItemInfo.ITEM_INFO_07 := FieldByName('BODY_09').AsString;      // ??????
          ItemInfo.ITEM_INFO_08 := FieldByName('BODY_10').AsString;      // ????????
          ItemInfo.ITEM_INFO_09 := FieldByName('BODY_11').AsString;      // ????????
          ItemInfo.ITEM_INFO_10 := '';                                   // ????????
          ItemInfo.ITEM_INFO_11 := '';                                   // ????????(BAG???? ????)
          ItemInfo.ITEM_INFO_12 := '';                                   // ????????????(???????? ????)
          ItemInfo.ITEM_INFO_13 := '';                                   // ????????????(???????? ????)
          ItemInfo.ITEM_INFO_14 := '';                                   // ????????????(???????? ????)
          ItemInfo.ITEM_INFO_15 := '';                                   // ????????????(???????? ????)
          ItemInfo.ITEM_INFO_16 := '';                                   // ????LOT(???????? ????)
          ItemInfo.ITEM_INFO_17 := '';                                   //
          ItemInfo.ITEM_INFO_18 := '';                                   // ????????????(1:????????, 3:??????, 5:????, 9:????, C:????????)
          ItemInfo.ITEM_INFO_19 := '';                                   // ????????????(????????)
          ItemInfo.ITEM_INFO_20 := FieldByName('BODY_02').AsString;      // ????????????(????????)
        end;
        Result := ItemInfo;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryBCR.Close;
      TraceLogWrite('[000] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnInterfaceUpdate
//==============================================================================
function TfrmMain.fnInterfaceUpdate(Mode, RequestDate, ItemLot: String): Boolean;
var
  ExecNo : integer;
  StrSQL : String;  
begin
  Result := False;
  try
    with qryBCR do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE IF_RECEIVE ' +
                '    SET PROC_STAT = ' + QuotedStr(Mode) +
                '      , MEMO_01   = ''R'' ' +
                '      , MEMO_02   = CONVERT(VARCHAR(MAX), GETDATE(), 112) + REPLACE(CONVERT(VARCHAR(MAX), GETDATE(), 108), '':'', '''') ' +
                '      , UP_DT     = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                '  WHERE RTRIM(LTRIM(TC_CD  )) = ''MW001300'' ' +             // ????????????
                '    AND RTRIM(LTRIM(BODY_01)) = ''R'' ' +                    // ????????????
                '    AND RTRIM(LTRIM(BODY_02)) = ' + QuotedStr(RequestDate) + // ????????
                '    AND RTRIM(LTRIM(BODY_03)) = ' + QuotedStr(ItemLot    ) ; // ????????
      SQL.Text := StrSQL;
      ExecNo := ExecSQL; 
      if ExecNo > 0 then Result := True;
      Close;   
    end;
  except
    on E : Exception do
    begin
      qryBCR.Close;
      TraceLogWrite('[000] ?????????? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// BcrDataUpdate
//==============================================================================
procedure TfrmMain.BcrDataUpdate(BcrNo, BcrData: String);
var
  StrSQL : String;
begin
  try
    with qryBCR do
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
      qryBCR.Close;
      TraceLogWrite('[000] ?????? ??????1 ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// BcrOnlyDataUpdate
//==============================================================================
procedure TfrmMain.BcrOnlyDataUpdate(BcrNo, BcrData, MEMO_1, MEMO_2: String);
var
  StrSQL : String;
begin
  try
    with qryBCR do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_BCRR ' +
                '    SET BCRDATA = ''' + BcrData + ''' ' +
                '      , MEMO_1 = ''' + MEMO_1  + ''' ' +
                '      , MEMO_2 = ''' + MEMO_2  + ''' ' +
                '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                '  WHERE BCRNO = ''' + BcrNo + ''' ';
      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryBCR.Close;
      TraceLogWrite('[000] ?????? ??????2 ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// ItemInfoClear
//==============================================================================
procedure TfrmMain.ItemInfoClear(var ItemInfo: TITEMInfo);
begin
  ItemInfo.ITEM_TYPE    := '';
  ItemInfo.ITEM_WEIGHT  := '0';
  ItemInfo.ITEM_QTY     := '0';
  ItemInfo.ITEM_INFO_01 := '';
  ItemInfo.ITEM_INFO_02 := '';
  ItemInfo.ITEM_INFO_03 := '';
  ItemInfo.ITEM_INFO_04 := '';
  ItemInfo.ITEM_INFO_05 := '';
  ItemInfo.ITEM_INFO_06 := '';
  ItemInfo.ITEM_INFO_07 := '';
  ItemInfo.ITEM_INFO_08 := '';
  ItemInfo.ITEM_INFO_09 := '';
  ItemInfo.ITEM_INFO_10 := '';
  ItemInfo.ITEM_INFO_11 := '';
  ItemInfo.ITEM_INFO_12 := '';
  ItemInfo.ITEM_INFO_13 := '';
  ItemInfo.ITEM_INFO_14 := '';
  ItemInfo.ITEM_INFO_15 := '';
  ItemInfo.ITEM_INFO_16 := '';
  ItemInfo.ITEM_INFO_17 := '';
  ItemInfo.ITEM_INFO_18 := '';
  ItemInfo.ITEM_INFO_19 := '';
  ItemInfo.ITEM_INFO_20 := '';
end;

//==============================================================================
// fnTrackDataInsert [???????? ?????? Insert]
//==============================================================================
function TfrmMain.fnTrackDataInsert(TrackInfo: TTRACKInfo): Boolean;
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
	            '    SET ORDER_STAT = ''??????'' ' +
		          '      , LUGG       = '''' ' +
              '      , MEMO_1     = ''ORDER TRIGGER INSERT ????'' ' +
		          '      , UP_DT      = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
              '  WHERE RACK_LOC   = ''' + TrackInfo.ID_CODE + ''' ';

    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    with qryBCR do
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
            TraceLogWrite('[000] ?????? ???????? - ????['+TrackInfo.ITEM_TYPE+'], ????['+TrackInfo.ITEM_LOT+'], ????['+TrackInfo.ID_TYPE+'], ????['+TrackInfo.ID_CODE+']');
          end else
          begin
            if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
            TraceLogWrite('[000] ?????? ???????? - ????[?????? ????????], ????['+TrackInfo.ITEM_TYPE+'], ????['+TrackInfo.ITEM_LOT+'], ????['+TrackInfo.ID_TYPE+'], ????['+TrackInfo.ID_CODE+']');
          end;
        end else
        begin
          Result := True;
          if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
          TraceLogWrite('[000] ?????? ???????? - ????['+TrackInfo.ITEM_TYPE+'], ????['+TrackInfo.ITEM_LOT+'], ????['+TrackInfo.ID_TYPE+']');
        end;
      end else
      begin
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
        TraceLogWrite('[000] ?????? ???????? - ????[?????? ????????], ????['+TrackInfo.ITEM_TYPE+'], ????['+TrackInfo.ITEM_LOT+'], ????['+TrackInfo.ID_TYPE+']');
      end;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryBCR.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[000] ?????? ???????? - ????['+E.Message+'], ????['+TrackInfo.ITEM_TYPE+'], ????['+TrackInfo.ITEM_LOT+'], ????['+TrackInfo.ID_TYPE+'], ????['+TrackInfo.ID_CODE+'], ????1['+StrSQL+'], ????2['+RckSQL+']');
    end;
  end;
end;

//==============================================================================
// SelectCurrent                                                              //
//==============================================================================
function TfrmMain.SelectCurrent(FieldName, Current_Name, Current_ID : String): Boolean;
var
  StrSQL : String;
begin
  Result := False;
  try
    with qryBCR do
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
    on E: Exception do
    begin
      qryBCR.Close;
      TraceLogWrite('[000] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnStockCheck [???? LOT?? ?????????? ?????? ????]                           //
//==============================================================================
function TfrmMain.fnStockCheck(ITEM_LOT:String): String;
var
  StrSQL : String;
begin
  Result := '';
  try
    with qryBCR do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT TOP 1 RACK_HOGI, ITEM_LOT, ' +
                '        RACK_BANK+''-''+RACK_BAY+''-''+RACK_LEVEL as RACK_POS ' +
                '   FROM TT_RACK_STOCK WITH (NOLOCK) ' +
                '  WHERE ITEM_LOT = ' + QuotedStr(ITEM_LOT);
      SQL.Text := StrSQL;
      Open;
      if not (Eof and Bof) then
      begin
        Result := FieldByName('RACK_HOGI').AsString + FieldByName('RACK_POS').AsString ;
      end else
      begin
        Result := '';
      end;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryBCR.Close;
      TraceLogWrite('[000] ????LOT ????(????????) - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCVLineCheck [???? LOT?? ?????? ?????? ????]                              //
//==============================================================================
function TfrmMain.fnCVLineCheck(ITEM_LOT:String): String;
var
  StrSQL : String;
begin
  Result := '';
  try
    with qryBCR do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT TOP 1 ID_BUFF ' +
                '   FROM TT_TRACK WITH (NOLOCK) ' +
                '  WHERE ID_DATA  = ''1'' ' +
                '    AND ITEM_LOT = ' + QuotedStr(ITEM_LOT);
      SQL.Text := StrSQL;
      Open;
      if not (Eof and Bof) then
      begin
        Result := FieldByName('ID_BUFF').AsString;
      end else
      begin
        Result := '';
      end;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryBCR.Close;
      TraceLogWrite('[000] ????LOT ????(??????????) - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnOrderDataInsert [???????????? ???? Insert]
//==============================================================================
function TfrmMain.fnRequestDataInsert(rType, rLot, rDate: String): Boolean;
var
  ExecNo : integer;
  StrSQL, tmpType, tmpDate : String;
begin
  Result := False;

  if      rType = 'R' then
    tmpType := '????????'
  else if rType = 'E' then
    tmpType := '????????????'
  else if rType = 'C' then
    tmpType := '????????';

  tmpDate := Copy(rDate,  1, 4) + '-' + Copy(rDate,  5, 2) + '-' + Copy(rDate,  7, 2) + ' ' +
             Copy(rDate,  9, 2) + ':' + Copy(rDate, 11, 2) + ':' + Copy(rDate, 13, 2) ;

  try
    StrSQL := ' INSERT INTO IF_SEND ' +
              ' ( TC_CD, SEND_DT, UP_DT, SEND_YN, ' +
              '   HEADER_01, HEADER_02, HEADER_03, HEADER_04, HEADER_05, HEADER_06, HEADER_07, ' +
              '   HEADER_08, HEADER_09, HEADER_10, HEADER_11, HEADER_12, HEADER_13, ' +
              '   BODY_01, BODY_02, BODY_03 ) ' +
              ' VALUES( ' +
              QuotedStr('WM001800'    ) + ' + ' + ' REPLICATE('' '',   8 - DATALENGTH(' + QuotedStr('WM001800'    ) + ')) , ' +
              ' CONVERT([varchar](max),getdate(),(21)), ' +
              ' '''', ' +
              ' ''N'', ' +
              // ?????? '145'
              // HEADER(????100, ????13??)
			        QuotedStr('WM001800'    ) + ' + ' + ' REPLICATE('' '',   8 - DATALENGTH(' + QuotedStr('WM001800'    ) + ')) , ' +  // TC????
			        QuotedStr('G'           ) + ' + ' + ' REPLICATE('' '',   1 - DATALENGTH(' + QuotedStr('G'           ) + ')) , ' +  // ????????????
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',   3 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ????????????????
			        QuotedStr('G'           ) + ' + ' + ' REPLICATE('' '',   1 - DATALENGTH(' + QuotedStr('G'           ) + ')) , ' +  // ????????????
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',   3 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ????????????????
			        QuotedStr(rDate         ) + ' + ' + ' REPLICATE('' '',  14 - DATALENGTH(' + QuotedStr(rDate         ) + ')) , ' +  // ????????????
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',  14 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ????????????
			        QuotedStr('TEST_0001_01') + ' + ' + ' REPLICATE('' '',  12 - DATALENGTH(' + QuotedStr('TEST_0001_01') + ')) , ' +  // ?????????? ID
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',   1 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ?????????? TYPE
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',   5 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ?????????? SEQ
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',   1 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ?????????? DATA TYPE
			        QuotedStr('145'         ) + ' + ' + ' REPLICATE('' '',   6 - DATALENGTH(' + QuotedStr('145'         ) + ')) , ' +  // ?????????? ????
			        QuotedStr(''            ) + ' + ' + ' REPLICATE('' '',  31 - DATALENGTH(' + QuotedStr(''            ) + ')) , ' +  // ????????
			        // BODY(????45, ????3??)
			        QuotedStr(rType         ) + ' + ' + ' REPLICATE('' '',   1 - DATALENGTH(' + QuotedStr(rType         ) + ')) , ' +   // ????????
			        QuotedStr(rLot          ) + ' + ' + ' REPLICATE('' '',  30 - DATALENGTH(' + QuotedStr(rLot          ) + ')) , ' +   // ????????
			        QuotedStr(rDate         ) + ' + ' + ' REPLICATE('' '',  14 - DATALENGTH(' + QuotedStr(rDate         ) + ')) ) ' ;   // ????????

    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    with qryLotReq do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
      begin
        Result := True;
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
        TraceLogWrite('[000] ???????? ???? - ????['+tmpType+'], ????['+rLot+'], ????['+tmpDate+']');
      end else
      begin
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
        TraceLogWrite('[000] ???????? ???? - ????[?????? ????????], ????['+tmpType+'], ????['+rLot+'], ????['+tmpDate+']');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryLotReq.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[000] ???????? ???? - ????['+E.Message+'], ????['+tmpType+'], ????['+rLot+'], ????['+tmpDate+'], ????['+StrSQL+']');
    end;
  end;
end;


//==============================================================================
// BCRComAfterOpen
//==============================================================================
procedure TfrmMain.BCRComAfterOpen(Sender: TObject);
begin
  ShpBCR.Brush.Color := clLime;
  LblBcr.Hint := '??????????('+BCRCom.Port+') ???????? - ????';
end;

//==============================================================================
// BCRComBeforeClose
//==============================================================================
procedure TfrmMain.BCRComBeforeClose(Sender: TObject);
begin
  ShpBCR.Brush.Color := clBtnFace;
  LblBcr.Hint := '??????????('+BCRCom.Port+') ???????? - ????';
end;

//==============================================================================
// BCRComAfterClose
//==============================================================================
procedure TfrmMain.BCRComAfterClose(Sender: TObject);
begin
  ShpBCR.Brush.Color := clBtnFace;
  LblBcr.Hint := '??????????('+BCRCom.Port+') ???????? - ????';
end;

//==============================================================================
// BCRComError
//==============================================================================
procedure TfrmMain.BCRComError(Sender: TObject; Errors: TComErrors);
begin
  ShpBCR.Brush.Color := clRed;
  LblBcr.Hint := '??????????('+BCRCom.Port+') ???????? - ????';
end;

//==============================================================================
// ???????? ???? ???? ????
//==============================================================================
procedure TfrmMain.tmrLogFileCheckTimer(Sender: TObject);
begin
  try
    tmrLogFileCheck.Enabled := False ;
    LogFileDelete ;
  finally
    tmrLogFileCheck.Enabled := True ;
  end;
end;

//==============================================================================
// tmrReadingChkTimer
//==============================================================================
procedure TfrmMain.tmrReadingChkTimer(Sender: TObject);
begin
  (Sender as TTimer).Enabled := False;
  BarcodeData[(Sender as TTimer).Tag][2] := '';
end;

procedure TfrmMain.LogFileDelete;
var
  i : integer ;
  DeleteDir : String ;
begin
  DeleteDir := '.\Log\';
  if (DeleteDir <> '') and
     (DeleteOption in [0..2])then
  begin
    DeleteRecodingFile(DeleteDir, DeleteOption);
  end;
end;

Function TfrmMain.DeleteRecodingFile(fileDir: string; iOption: integer): boolean;
var
  FoundFile : Integer;
  SearchRec : TSearchRec;
  stLogDir  : string;
  Sdate : TDateTime;
begin
  Sdate :=  Now();
  result := true;
  stLogDir := fileDir + '*';
  try
    FoundFile := findfirst(stLogDir,faAnyFile,SearchRec);
    while FoundFile = 0 do
    begin
      Application.ProcessMessages;
      case iOption of
       0 : if (Sdate - FileDateToDateTime(SearchRec.Time)) >= 30 then
           begin
             if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
             MinDeleteFile(fileDir + SearchRec.name, true); //
           end;
       1 : if (Sdate - FileDateToDateTime(SearchRec.Time)) >= 7 then
           begin
             if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
             MinDeleteFile(fileDir + SearchRec.name, true); //
           end;
       2 : if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
           MinDeleteFile(fileDir + SearchRec.name, true); //
      end;
      FoundFile := findnext(SearchRec);
    end;
    FindClose(SearchRec);
  except
    FindClose(SearchRec);
    result := false;
  end;
end;

function TfrmMain.MinDeleteFile(const DirName : string;
const UseRecycleBin: Boolean): Boolean;
var
  SHFileOpStruct: TSHFileOpStruct;
  DirBuf: array [0..255] of char;
  Directory: string;
begin
  try
    Directory := ExcludeTrailingPathDelimiter(DirName);

    Fillchar(SHFileOpStruct, sizeof(SHFileOpStruct), 0);
    FillChar(DirBuf, sizeof(DirBuf), 0);
    StrPCopy(DirBuf, Directory);

    with SHFileOpStruct do
    begin
      Wnd := 0;
      pFrom := @DirBuf;
      wFunc := FO_DELETE;
      if UseRecycleBin = True then
      fFlags := FOF_NOCONFIRMATION or FOF_SILENT;
    end;
    Result := (SHFileOperation(SHFileOpStruct)=0);
  except
    result := false;
  end;
end;

procedure TfrmMain.btnBcrTestClick(Sender: TObject);
var
  SendBuf : Array[1..17] of AnsiChar;
begin
      LblBcrData.Caption     := Trim(Edit1.Text);
      ShpBcrData.Brush.Color := clLime;
      tmrFocus.Enabled       := True;

      BarcodeData[1][1] := Trim(Edit1.Text);
      BarcodeData[1][2] := 'Reading';
      TTimer(Self.FindComponent('tmrReadingChk'+IntToStr(1))).Enabled := True;


  BcrProcess('1', Trim(Edit1.Text) );
{
  SendBuf[01] := #$02 ;
  SendBuf[02] := 'G';
  SendBuf[03] := 'N';
  SendBuf[04] := '6';
  SendBuf[05] := '5';
  SendBuf[06] := 'B';
  SendBuf[07] := '1';
  SendBuf[08] := '9';
  SendBuf[09] := '0';
  SendBuf[10] := '4';
  SendBuf[11] := '0';
  SendBuf[12] := '9';
  SendBuf[13] := '0';
  SendBuf[14] := '1';
  SendBuf[15] := '-';
  SendBuf[16] := 'A';
  SendBuf[17] := #$03 ;
  BCRCom.Write(SendBuf, Length(SendBuf));
  }
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  btnBcrTestClick(nil);
end;

{
ITEM_LOT      // ????????
ITEM_TYPE     // ????????(??????, ????)
ITEM_WEIGHT   // ????????
ITEM_QTY      // ????????
ITEM_INFO_01  // ????????           ???? ?????? ???? ???? ?? ?????????????? ITEM_INFO_03, ITEM_INFO_04?? ???????? ?? ITEM_INFO_01, ITEM_INFO_02 ????
ITEM_INFO_02  // ??????
ITEM_INFO_03  // (??)????????
ITEM_INFO_04  // (??)??????
ITEM_INFO_05  // ????????
ITEM_INFO_06  // ????????
ITEM_INFO_07  // ??????
ITEM_INFO_08  // ????????
ITEM_INFO_09  // ???????? (??????1 ????, ??????2 ????, AGV????)
ITEM_INFO_10  // ????????
ITEM_INFO_11
ITEM_INFO_12
ITEM_INFO_13
ITEM_INFO_14
ITEM_INFO_15
ITEM_INFO_16
ITEM_INFO_17
ITEM_INFO_18
ITEM_INFO_19
ITEM_INFO_20
WRAP_YN       // ????????
}


initialization
  //???? ???? ???? ???? ????
  CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, 1, 'POSCOCMC_AWS');
  if GetlastError = ERROR_ALREADY_EXISTS then halt;
end.
