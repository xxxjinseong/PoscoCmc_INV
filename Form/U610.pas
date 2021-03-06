unit U610;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, d_MainDm, h_MainLib, h_ReferLib, ExtCtrls, Grids, StdCtrls, DB,
  ADODB, Buttons, ComCtrls, jpeg, Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Menus ;

type
  TfrmU610 = class(TForm)
    Pnl_Main: TPanel;
    Pnl_All: TPanel;
    Label15: TLabel;
    Shape4: TShape;
    Label16: TLabel;
    DisplayTimer: TTimer;
    Pnl_Info: TPanel;
    Panel1: TPanel;
    Panel6: TPanel;
    Sh_SC1: TShape;
    Label285: TLabel;
    Sh_SC2: TShape;
    Label287: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Scb1: TScrollBox;
    Pnl_Mon1: TPanel;
    Pnl1: TPanel;
    Panel96: TPanel;
    Panel114: TPanel;
    GroupBox11: TGroupBox;
    Label186: TLabel;
    Label187: TLabel;
    Label188: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Panel124: TPanel;
    Panel125: TPanel;
    Panel132: TPanel;
    Panel137: TPanel;
    Panel185: TPanel;
    Panel94: TPanel;
    GroupBox12: TGroupBox;
    Label192: TLabel;
    Label193: TLabel;
    Panel210: TPanel;
    Panel256: TPanel;
    GroupBox13: TGroupBox;
    Label194: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    Panel258: TPanel;
    Panel260: TPanel;
    Panel271: TPanel;
    Panel277: TPanel;
    GroupBox15: TGroupBox;
    Label199: TLabel;
    Label200: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    Label201: TLabel;
    pnlCXDX: TPanel;
    pnlCODX: TPanel;
    pnlCODO: TPanel;
    pnlCXDO: TPanel;
    Panel67: TPanel;
    Panel81: TPanel;
    qryOrderList: TADOQuery;
    dsOrderList: TDataSource;
    Sh_CV: TShape;
    Label5: TLabel;
    Sh_AC: TShape;
    Label6: TLabel;
    Sh_SC3: TShape;
    Label39: TLabel;
    Shape16: TShape;
    Panel21: TPanel;
    Label3: TLabel;
    qryCV: TADOQuery;
    qrySC: TADOQuery;
    qryCommand: TADOQuery;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Panel133: TPanel;
    Panel219: TPanel;
    Panel221: TPanel;
    Panel227: TPanel;
    Panel228: TPanel;
    Panel232: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel17: TPanel;
    pcSC: TPageControl;
    tsSC1: TTabSheet;
    tsSC2: TTabSheet;
    tsSC3: TTabSheet;
    Panel379: TPanel;
    Panel425: TPanel;
    PnlSelMach: TPanel;
    pnlDBGrid: TPanel;
    Label319: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel9: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Panel60: TPanel;
    Panel61: TPanel;
    Panel62: TPanel;
    Panel63: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    Panel66: TPanel;
    Panel68: TPanel;
    Panel69: TPanel;
    Panel70: TPanel;
    Panel71: TPanel;
    Panel72: TPanel;
    Panel73: TPanel;
    Panel74: TPanel;
    Panel75: TPanel;
    Panel76: TPanel;
    Panel77: TPanel;
    Panel78: TPanel;
    Panel79: TPanel;
    Panel82: TPanel;
    Panel83: TPanel;
    Panel84: TPanel;
    Panel85: TPanel;
    Panel86: TPanel;
    Panel87: TPanel;
    Panel88: TPanel;
    Panel89: TPanel;
    Panel90: TPanel;
    Panel91: TPanel;
    Panel92: TPanel;
    Panel93: TPanel;
    Panel95: TPanel;
    Panel97: TPanel;
    Panel98: TPanel;
    Panel99: TPanel;
    Panel588: TPanel;
    Panel589: TPanel;
    pnlCVStat171: TPanel;
    pnlCV171: TPanel;
    Panel592: TPanel;
    pnlCVStat170: TPanel;
    pnlCV170: TPanel;
    Panel100: TPanel;
    Panel104: TPanel;
    pnlCVStat190: TPanel;
    pnlCV190: TPanel;
    Panel113: TPanel;
    pnlCVStat192: TPanel;
    pnlCV192: TPanel;
    Panel117: TPanel;
    pnlCVStat191: TPanel;
    pnlCV191: TPanel;
    Panel101: TPanel;
    Panel102: TPanel;
    pnlCVStat194: TPanel;
    pnlCV194: TPanel;
    Panel108: TPanel;
    pnlCVStat193: TPanel;
    pnlCV193: TPanel;
    Panel111: TPanel;
    Panel122: TPanel;
    pnlCVStat112: TPanel;
    pnlCV112: TPanel;
    Panel149: TPanel;
    Panel150: TPanel;
    pnlCVStat180: TPanel;
    pnlCV180: TPanel;
    Panel153: TPanel;
    pnlCVStat181: TPanel;
    pnlCV181: TPanel;
    Panel112: TPanel;
    Panel120: TPanel;
    pnlCVStat150: TPanel;
    pnlCV150: TPanel;
    Panel128: TPanel;
    pnlCVStat151: TPanel;
    pnlCV151: TPanel;
    Panel131: TPanel;
    Panel134: TPanel;
    pnlCVStat131: TPanel;
    pnlCV131: TPanel;
    Panel138: TPanel;
    pnlCVStat130: TPanel;
    pnlCV130: TPanel;
    Panel142: TPanel;
    Panel143: TPanel;
    pnlCVStat161: TPanel;
    pnlCV161: TPanel;
    Panel146: TPanel;
    pnlCVStat160: TPanel;
    pnlCV160: TPanel;
    Panel156: TPanel;
    Panel157: TPanel;
    pnlCVStat140: TPanel;
    pnlCV140: TPanel;
    Panel160: TPanel;
    pnlCVStat141: TPanel;
    pnlCV141: TPanel;
    Panel163: TPanel;
    Shape2: TShape;
    Shape3: TShape;
    Panel164: TPanel;
    Panel165: TPanel;
    Panel167: TPanel;
    lblCV181: TLabel;
    lblCV170: TLabel;
    lblCV160: TLabel;
    lblCV151: TLabel;
    lblCV141: TLabel;
    lblCV130: TLabel;
    lblCV131: TLabel;
    lblCV140: TLabel;
    lblCV150: TLabel;
    lblCV161: TLabel;
    lblCV171: TLabel;
    lblCV180: TLabel;
    lblCV190: TLabel;
    lblCV191: TLabel;
    lblCV192: TLabel;
    lblCV112: TLabel;
    lblCV193: TLabel;
    lblCV194: TLabel;
    Panel168: TPanel;
    Panel169: TPanel;
    pnlCVStat124: TPanel;
    pnlCV124: TPanel;
    lblCV124: TLabel;
    Panel172: TPanel;
    pnlCVStat122: TPanel;
    pnlCV122: TPanel;
    lblCV122: TLabel;
    Panel175: TPanel;
    pnlCVStat123: TPanel;
    pnlCV123: TPanel;
    lblCV123: TLabel;
    Panel178: TPanel;
    Shape1: TShape;
    Panel179: TPanel;
    pnlCVStat199: TPanel;
    pnlCV199: TPanel;
    lblCV199: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Panel182: TPanel;
    pnlCVStat121: TPanel;
    pnlCV121: TPanel;
    lblCV121: TLabel;
    Panel186: TPanel;
    pnlCVStat120: TPanel;
    pnlCV120: TPanel;
    lblCV120: TLabel;
    Panel191: TPanel;
    pnlCVStat111: TPanel;
    pnlCV111: TPanel;
    lblCV111: TLabel;
    Panel194: TPanel;
    pnlCVStat110: TPanel;
    pnlCV110: TPanel;
    lblCV110: TLabel;
    Panel197: TPanel;
    Panel198: TPanel;
    pnlCVStat102: TPanel;
    pnlCV102: TPanel;
    lblCV102: TLabel;
    Panel201: TPanel;
    pnlCVStat101: TPanel;
    pnlCV101: TPanel;
    lblCV101: TLabel;
    Panel204: TPanel;
    pnlCVStat100: TPanel;
    pnlCV100: TPanel;
    lblCV100: TLabel;
    Panel207: TPanel;
    Image2: TImage;
    Panel208: TPanel;
    ImgS112_2: TImage;
    Image5: TImage;
    ImgS180: TImage;
    ImgS160: TImage;
    Image10: TImage;
    Image11: TImage;
    ImgS130: TImage;
    ImgS170: TImage;
    Image14: TImage;
    Image15: TImage;
    ImgS150: TImage;
    ImgS140: TImage;
    Image18: TImage;
    Image20: TImage;
    Panel209: TPanel;
    ImgS100_2: TImage;
    Panel212: TPanel;
    ImgS120: TImage;
    Panel211: TPanel;
    ImgS102_2: TImage;
    lblUsed1: TLabel;
    lblInUsed1: TLabel;
    lblOtUsed1: TLabel;
    lblUsed2: TLabel;
    lblInUsed2: TLabel;
    lblOtUsed2: TLabel;
    lblUsed3: TLabel;
    lblInUsed3: TLabel;
    lblOtUsed3: TLabel;
    Panel189: TPanel;
    Panel190: TPanel;
    Panel213: TPanel;
    Panel214: TPanel;
    Panel220: TPanel;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Panel222: TPanel;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Panel223: TPanel;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Panel615: TPanel;
    Panel614: TPanel;
    Panel612: TPanel;
    PnlSCT2: TPanel;
    Panel666: TPanel;
    Panel667: TPanel;
    Panel668: TPanel;
    PnlSCT1: TPanel;
    Panel670: TPanel;
    Panel671: TPanel;
    Panel673: TPanel;
    PnlSCT3: TPanel;
    Panel224: TPanel;
    Panel225: TPanel;
    Panel226: TPanel;
    PnlLOP2: TPanel;
    Panel230: TPanel;
    Panel231: TPanel;
    Panel233: TPanel;
    PnlLOP1: TPanel;
    Panel239: TPanel;
    lblLoadCell: TLabel;
    Label23: TLabel;
    PnlSC2: TPanel;
    PnlSCStat2: TPanel;
    PnlScInfo22: TPanel;
    PnlScInfo21: TPanel;
    PnlSC1: TPanel;
    PnlSCStat1: TPanel;
    PnlScInfo12: TPanel;
    PnlScInfo11: TPanel;
    PnlSC3: TPanel;
    PnlSCStat3: TPanel;
    PnlScInfo32: TPanel;
    PnlScInfo31: TPanel;
    PnlAC: TPanel;
    PnlACStat: TPanel;
    PnlAcInfo2: TPanel;
    PnlAcInfo1: TPanel;
    Panel103: TPanel;
    ImgS112_1: TImage;
    Panel105: TPanel;
    ImgS102_1: TImage;
    Panel106: TPanel;
    ImgS100_1: TImage;
    Panel107: TPanel;
    ImgS110_1: TImage;
    Panel109: TPanel;
    ImgS122: TImage;
    Panel110: TPanel;
    ImgS110_2: TImage;
    Panel115: TPanel;
    ImgS191: TImage;
    Panel116: TPanel;
    ImgS190: TImage;
    Panel118: TPanel;
    ImgS193: TImage;
    Panel119: TPanel;
    ImgS192: TImage;
    Panel121: TPanel;
    ImgS199: TImage;
    Panel123: TPanel;
    Right_RUN: TImage;
    Right_IDLE: TImage;
    LEFT_IDLE: TImage;
    LEFT_RUN: TImage;
    DOWN_RUN: TImage;
    DOWN_IDLE: TImage;
    UP_RUN: TImage;
    UP_IDLE: TImage;
    Panel126: TPanel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    shpRmStat21: TShape;
    shpRmStat22: TShape;
    shpRmStat23: TShape;
    Panel127: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    shpRmStat11: TShape;
    shpRmStat12: TShape;
    shpRmStat13: TShape;
    pnlSC1Info: TPanel;
    Panel20: TPanel;
    Panel59: TPanel;
    Panel80: TPanel;
    Panel139: TPanel;
    SCJobType: TPanel;
    MachinePower: TPanel;
    WorkReady: TPanel;
    MachineAction: TPanel;
    Panel623: TPanel;
    ForkCenter: TPanel;
    ScErrorDesc: TPanel;
    Panel624: TPanel;
    Panel283: TPanel;
    SCIndex: TPanel;
    Panel285: TPanel;
    WorkMode: TPanel;
    Panel286: TPanel;
    MachineTrouble: TPanel;
    btnSCCancel: TButton;
    btnSCComplete: TButton;
    btnSCReset: TButton;
    Panel678: TPanel;
    ForkTrayExist: TPanel;
    Panel680: TPanel;
    SCOrdLoc: TPanel;
    Panel287: TPanel;
    SCHogi: TPanel;
    Panel129: TPanel;
    ReturnFinish: TPanel;
    Panel135: TPanel;
    SCLoc: TPanel;
    qryErrorDesc: TADOQuery;
    shpOutDoor: TShape;
    shpInDoor: TShape;
    shpRMDoor2: TShape;
    shpRMDoor1: TShape;
    Panel215: TPanel;
    Panel216: TPanel;
    Panel217: TPanel;
    Panel218: TPanel;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Panel166: TPanel;
    Shape17: TShape;
    Shape23: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape5: TShape;
    Shape28: TShape;
    Label29: TLabel;
    Label30: TLabel;
    Label20: TLabel;
    Label31: TLabel;
    shpRmStat14: TShape;
    shpRmStat24: TShape;
    Shape24: TShape;
    Shape29: TShape;
    PnlSDoor1: TPanel;
    ShpDoorLine1: TShape;
    Shape19: TShape;
    Shape30: TShape;
    PnlSDoor2: TPanel;
    ShpDoorLine2: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    shpWP_READY: TShape;
    shpWP_JOB_COMPLETE: TShape;
    shpWP_EMER: TShape;
    lblLoadCellData: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    lblACUsed: TLabel;
    lblACInUsed: TLabel;
    lblACOtUsed: TLabel;
    pnlCVInfo: TPanel;
    Panel145: TPanel;
    Panel147: TPanel;
    CVJobType: TPanel;
    PnlBuffInfo: TPanel;
    Panel155: TPanel;
    CVIndex: TPanel;
    Panel162: TPanel;
    PnlBuffNo: TPanel;
    Panel181: TPanel;
    CVOrdLoc: TPanel;
    Panel184: TPanel;
    Panel144: TPanel;
    pnlITEM_INFO_02: TPanel;
    Panel171: TPanel;
    pnlITEM_INFO_01: TPanel;
    Panel174: TPanel;
    Panel177: TPanel;
    pnlITEM_QTY: TPanel;
    Panel196: TPanel;
    pnlITEM_WEIGHT: TPanel;
    Panel136: TPanel;
    cbWRAP_YN: TComboBox;
    cbITEM_TYPE: TComboBox;
    pnlACInfo: TPanel;
    Panel570: TPanel;
    Panel572: TPanel;
    Panel573: TPanel;
    Panel577: TPanel;
    ACJobType: TPanel;
    AC_Emer: TPanel;
    AC_Error: TPanel;
    AC_Ready: TPanel;
    Panel594: TPanel;
    AC_Cargo: TPanel;
    Panel613: TPanel;
    ACIndex: TPanel;
    Panel621: TPanel;
    AC_Auto: TPanel;
    Panel627: TPanel;
    AC_Run: TPanel;
    btnACCancel: TButton;
    btnACRetry: TButton;
    Panel631: TPanel;
    ACOrdLoc_L: TPanel;
    Panel635: TPanel;
    ACOrdLoc_U: TPanel;
    btnACErrorReset: TButton;
    Panel692: TPanel;
    AcErrorDesc: TPanel;
    Panel130: TPanel;
    AC_LCPL: TPanel;
    Panel140: TPanel;
    AC_UCPL: TPanel;
    btnACHome: TButton;
    qrySelect: TADOQuery;
    btnCVDataUpdate: TButton;
    Panel148: TPanel;
    Panel151: TPanel;
    Panel272: TPanel;
    Panel152: TPanel;
    btnCVDataMove: TButton;
    btnCVDataDelete: TButton;
    btnCVDataChange: TButton;
    Panel188: TPanel;
    Panel193: TPanel;
    Panel154: TPanel;
    btnCVMove: TButton;
    btnCVMoveComplete: TButton;
    btnCVPass: TButton;
    btnCVPassComplete: TButton;
    cbSelectCV: TComboBox;
    cbUpdateCV: TComboBox;
    btnBCRComplete: TButton;
    btnCVEmergency: TButton;
    btnCVErrorReset: TButton;
    Shape15: TShape;
    Panel159: TPanel;
    Panel649: TPanel;
    Pnl_JobCnt: TPanel;
    dgInfo: TDBGridEh;
    Panel161: TPanel;
    Panel158: TPanel;
    btnBCRUpdateOt: TButton;
    btnBCRUpdateIn: TButton;
    edtInBCRDataInput: TEdit;
    edtOtBCRDataInput: TEdit;
    edtInBCRData: TEdit;
    edtOtBCRData: TEdit;
    Panel170: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel173: TPanel;
    lblBCRReadStatus1: TLabel;
    lblBCRReadStatus2: TLabel;
    Splitter1: TSplitter;
    Panel183: TPanel;
    Pnl_ErrorCnt: TPanel;
    dgError: TDBGridEh;
    qryError: TADOQuery;
    dsError: TDataSource;
    ListTimer: TTimer;
    pnlErrorClear: TPanel;
    btnErrorClear: TButton;
    btnACUnLoadComplete: TButton;
    btnACLoadComplete: TButton;
    pnlEmergency: TPanel;
    Panel176: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    Shape18: TShape;
    Label8: TLabel;
    shpWP_MANUAL_CENTER: TShape;
    Label10: TLabel;
    edtITEM_LOT: TEdit;
    PnlCVSDoor2: TPanel;
    ShpCVDoorLine2: TShape;
    Shape34: TShape;
    Shape35: TShape;
    PnlCVSDoor1: TPanel;
    ShpCVDoorLine1: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Panel141: TPanel;
    Panel180: TPanel;
    PnlOtBcr: TPanel;
    Panel192: TPanel;
    Label14: TLabel;
    Panel195: TPanel;
    Label18: TLabel;
    PnlInBcr: TPanel;
    lblInBCRData: TLabel;
    lblOtBCRData: TLabel;
    pnlBcrClear1: TPanel;
    btnBcrClear1: TButton;
    pnlBcrClear2: TPanel;
    btnBcrClear2: TButton;
    lblReIpgo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DisplayTimerTimer(Sender: TObject);
    procedure Scb1Resize(Sender: TObject);
    procedure CVInfoClick(Sender: TObject);
    procedure btnSCControlClick(Sender: TObject);
    procedure btnACControlClick(Sender: TObject);
    procedure btnCVControlClick(Sender: TObject);
    procedure pcSCChange(Sender: TObject);
    procedure SCInfoClick(Sender: TObject);
    procedure btnCVOrderClick(Sender: TObject);
    procedure cbITEM_TYPEChange(Sender: TObject);
    procedure btnCVDataUpdateClick(Sender: TObject);
    procedure btnBCRUpdateClick(Sender: TObject);
    procedure ListTimerTimer(Sender: TObject);
    procedure btnErrorClearClick(Sender: TObject);
    procedure pnlEmerOffDblClick(Sender: TObject);
    procedure btnBcrClearClick(Sender: TObject);
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
    procedure fnCommandQueryList;
    procedure fnCommandClose;
    procedure fnWmMsgRecv (var MSG : TMessage) ; message WM_USER ;

    // CV ???? ????
    function  CVRead: Boolean;
    procedure CvcStatusDisplay ;
    procedure TrackInfoClear(BuffNo: integer);
    procedure TrackDataUpdate(Field, Value, BuffNo: String);
    procedure TrackDataMove(nowBuff, nextBuff: Integer);
    procedure TrackDelete(nowBuff: String);
    procedure TrackDataChange(nowBuff, nextBuff: Integer);
    procedure InsertCVACOrder(Mach, Gubun, Buff_No, Orders, KeyValue: String);
    procedure OrderDataUpdate(Field, Value, BuffNo: String);
    procedure BcrDataUpdate(BcrNo, BcrData: String);
    procedure BcrDataReset(BcrNo: String);

    // SC ???? ????
    function  SCRead: Boolean;
    procedure SccStatusDisplay;
    procedure SccStatusDisplayPanel(ScNo: integer);
    procedure ScRcClear(ScNo: integer);
    procedure ScioClear(ScNo: integer);
    function  SelectCurrent(FieldName, FieldValue, Current_Name, Current_ID: String): Boolean;
    procedure UpdateCurrent(FieldName, FieldValue, Current_Name, Current_ID: String);

    // ???????????? ????????
    function  ErrorDesc(ID_MACH, ERR_CODE: String): String;
  end;
  procedure U610Create();

const
  FormNo ='610' ;
  PLC_Color : Array[0..1] of TColor  = ( clRed, clLime ) ;

var
  frmU610: TfrmU610;
  SelectedCV : Integer;
  SelectedSC : Integer;
  LampFlag : Array [1..2] of Integer;

  CV, CV_OLD     : TCV;
  DBCvUsed       : TMachUsed;
  BuffData       : Array [100..199] of TTRACKInfo;
  gChrRBitBuff   : Array [0..47, 0..15] of AnsiChar;  // 48 Word W1000 ~ W102F
  gChrRWordBuff  : Array [0.. 3, 0..03] of AnsiChar;  //  4 Word W1008, W1009, W1013, W1014 (191??????, 191??????, AC????????, AC????)
  gChrWBitBuffCV : Array [0..03, 0..15] of AnsiChar;  //  2 Word W2002, W2003
  gChrWBitBuffAC : Array [0..02, 0..15] of AnsiChar;  //  3 Word W2005, W2006, W2007

  DBScRc    : Array[START_SCNO..End_SCNO] of TSCRC;
  DBScio    : Array[START_SCNO..End_SCNO] of TSCIO;
  DBScUsed  : Array[START_SCNO..End_SCNO] of TMachUsed;

  implementation

uses Main, ChangeLocation ;

{$R *.dfm}

//==============================================================================
// U610Create
//==============================================================================
procedure U610Create();
begin
  if not Assigned( frmU610 ) then
  begin
    frmU610 := TfrmU610.Create(Application);
    with frmU610 do
    begin
      fnCommandStart;
    end;
  end;
  frmU610.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU610.fnWmMsgRecv(var MSG: TMessage);
begin
  case MSG.WParam of
    MSG_MDI_WIN_ADD     : begin fnCommandAdd     ; end;
    MSG_MDI_WIN_EXCEL   : begin fnCommandExcel   ; end;
    MSG_MDI_WIN_DELETE  : begin fnCommandDelete  ; end;
    MSG_MDI_WIN_PRINT   : begin fnCommandPrint   ; end;
    MSG_MDI_WIN_QUERY   : begin fnCommandQuery   ; end;
    MSG_MDI_WIN_Close   : begin fnCommandClose   ; Close; end;
  end;
end;

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmU610.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU610.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU610.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  fnWmMsgSend ( 22222, 111 );
  fnCommandQuery;
  fnCommandQueryList;
  if not DisplayTimer.Enabled then DisplayTimer.Enabled := True ;
  if not ListTimer.Enabled then ListTimer.Enabled := True ;
//  cbITEM_TYPE.SetFocus;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU610.FormDeactivate(Sender: TObject);
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
procedure TfrmU610.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU610 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU610.fnCommandStart;
var
  i : integer;
begin
  SelectedCV  := 0;
  SelectedSC  := 1;
  LampFlag[1] := 0;
  LampFlag[2] := 0;
  Scb1.HorzScrollBar.Visible := False;

  FillChar(gChrRBitBuff[0]    , SizeOf(gChrRBitBuff[0])    , AnsiChar($00));
  FillChar(gChrRWordBuff[0]   , SizeOf(gChrRWordBuff[0])   , AnsiChar($00));
  FillChar(gChrWBitBuffCV[0]  , SizeOf(gChrWBitBuffCV[0])  , AnsiChar($00));
  FillChar(gChrWBitBuffAC[0]  , SizeOf(gChrWBitBuffAC[0])  , AnsiChar($00));

  for i := START_SCNO to End_SCNO do
  begin
    ScRcClear(i);
    ScioClear(i);
  end;
end;

//==============================================================================
// fnCommandAdd [????]
//==============================================================================
procedure TfrmU610.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU610.fnCommandExcel;
begin
//
end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU610.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU610.fnCommandPrint;
begin
//
end;

//==============================================================================
// fnCommandQuery [????]
//==============================================================================
procedure TfrmU610.fnCommandQuery;
begin
  CvcStatusDisplay;
  SccStatusDisplay;
  SccStatusDisplayPanel(SelectedSC);
end;

//==============================================================================
// fnCommandQueryList [????]
//==============================================================================
procedure TfrmU610.fnCommandQueryList;
var
  StrSQL : String;
begin
  try
    // ?????????? ????
    with qryOrderList do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      StrSQL := ' SELECT O.ID_DATE, O.ID_TIME, ' +
                ' O.ID_TYPE, O.ID_INDEX, ' +
                ' SUBSTRING(O.OR_DT, 1, 19) as OR_DT, ' +
                ' O.ID_SC + ''????'' as ID_SC,' +
                ' CASE WHEN SUBSTRING(O.ID_TYPE, LEN(O.ID_TYPE)-1, 2) = ''????'' THEN ' +
                '           CASE O.IN_SITE WHEN ''102'' THEN ''1????(''+O.IN_SITE+'')'' ' +
                '                          WHEN ''112'' THEN ''2????(''+O.IN_SITE+'')'' ' +
                '                          WHEN ''120'' THEN ''3????(''+O.IN_SITE+'')'' ELSE '''' END ' +
                '      WHEN SUBSTRING(O.ID_TYPE, LEN(O.ID_TYPE)-1, 2) = ''????'' THEN ' +
                '           O.LOAD_BANK + ''-'' + O.LOAD_BAY + ''-'' + O.LOAD_LEVEL ' +
                '      WHEN SUBSTRING(O.ID_TYPE, LEN(O.ID_TYPE)-1, 2) = ''????'' THEN ' +
                '           O.LOAD_BANK + ''-'' + O.LOAD_BAY + ''-'' + O.LOAD_LEVEL ' +
                '      ELSE '''' END as SRC_POS, ' +
                ' CASE WHEN SUBSTRING(O.ID_TYPE, LEN(O.ID_TYPE)-1, 2) = ''????'' THEN ' +
                '           O.UNLOAD_BANK + ''-'' + O.UNLOAD_BAY + ''-'' + O.UNLOAD_LEVEL ' +
                '      WHEN SUBSTRING(O.ID_TYPE, LEN(O.ID_TYPE)-1, 2) = ''????'' THEN ' +
                '           O.OT_SITE ' +
                '      WHEN SUBSTRING(O.ID_TYPE, LEN(O.ID_TYPE)-1, 2) = ''????'' THEN ' +
                '           O.UNLOAD_BANK + ''-'' + O.UNLOAD_BAY + ''-'' + O.UNLOAD_LEVEL ' +
                '      ELSE '''' END as DST_POS, ' +
                ' O.NOW_SITE as NOW_POS, ' +
                ' O.NOW_MACH, ' +
                ' O.ITEM_LOT, O.ITEM_TYPE, O.WRAP_YN, O.ID_USER, O.STATUS, O.PROCESS, ' +
                ' CASE WHEN O.ITEM_WEIGHT = '''' or O.ITEM_WEIGHT = NULL THEN CONVERT(NUMERIC(9,3), 0) ' +
                '      ELSE CONVERT(NUMERIC(9,3), RTRIM(LTRIM(O.ITEM_WEIGHT))) END as ITEM_WEIGHT ' +
                '   FROM TT_ORDER O WITH (NOLOCK)' +
                '  WHERE 1 = 1 ' +
                '  ORDER BY O.ID_DATE, O.ID_TIME ' ;
      SQL.Text := StrSQL;
      Open;
      Pnl_JobCnt.Caption := '???????? ['+IntToStr(RecordCount)+']';
      EnableControls;
    end;
    dgInfo.SelectedRows.Clear;
  except
    on E : Exception do
    begin
      qryOrderList.Close;
      TraceLogWrite('[610] ???????? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
      Exit;
    end;
  end;

  try
    // ?????????? ????
    with qryError do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      StrSQL := ' SELECT *, ' +
                '        SUBSTRING(CR_DT, 1, 19) as tCR_DT ' +
                '   FROM TT_ERROR WITH (NOLOCK) ' +
                '  WHERE ERR_END IS NULL ' +
                '  ORDER BY ERR_START DESC ' ;
      SQL.Text := StrSQL;
      Open;
      Pnl_ErrorCnt.Caption := '???????? ['+IntToStr(RecordCount)+']';
      EnableControls;

      if RecordCount > 0 then
           PnlErrorClear.Visible := True
      else PnlErrorClear.Visible := False;
    end;
    dgError.SelectedRows.Clear;
  except
    on E : Exception do
    begin
      qryError.Close;
      TraceLogWrite('[610] ???????? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
      Exit;
    end;
  end;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU610.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// DisplayTimerTimer
//==============================================================================
procedure TfrmU610.DisplayTimerTimer(Sender: TObject);
begin
  try
    DisplayTimer.Enabled := False ;
    if m.ConChk then fnCommandQuery ;
    DisplayTimer.Enabled := True ;
  except
    on E : Exception do
    begin
      DisplayTimer.Enabled := False ;
      TraceLogWrite('[610] ???????? ???? ?????? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// ListTimerTimer
//==============================================================================
procedure TfrmU610.ListTimerTimer(Sender: TObject);
begin
  try
    ListTimer.Enabled := False ;
    if m.ConChk then fnCommandQueryList ;
    ListTimer.Enabled := True ;
  except
    on E : Exception do
    begin
      ListTimer.Enabled := False ;
      TraceLogWrite('[610] ???????? ?????? ?????? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// CVDisplay                                                                  //
//==============================================================================
procedure TfrmU610.CvcStatusDisplay;
var
  StrSQL, tmpStr, TmpData : String;
  i, TmpBuff, TmpScNo, TmpAcPos : Integer;
  StrValue : AnsiString;
  TmpWeight : integer;
begin
  //==================================
  // CV ???? ???? / ?????? ????
  //==================================
  CVRead;

  //==================================
  // W1000 / OP ????
  //==================================
  try
    for i := Low(CV.Read.OP) to High(CV.Read.OP) do
    begin
      if (CV.Read.OP[i].Erro = '1') then  // ????
      begin
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Color := clRed;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Font.Color := clWhite;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Hint  := '????';
      end else
      if (CV.Read.OP[i].Emer = '1') then  // ????????
      begin
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Color := clRed;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Font.Color := clWhite;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Hint  := '????????';
      end else
      if (CV.Read.OP[i].Semi = '1') then  // ??????
      begin
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Color := clYellow;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Font.Color := clBlack;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Hint  := '??????';
      end else
      if (CV.Read.OP[i].Manu = '1') then  // ????
      begin
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Color := clYellow;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Font.Color := clBlack;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Hint  := '????';
      end else
      if (CV.Read.OP[i].RRun1 = '1') then // ??????1
      begin
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Color := clNavy;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Font.Color := clWhite;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Hint  := '?????? #1 ????';
      end else
      if (CV.Read.OP[i].RRun2 = '1') then // ??????2
      begin
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Color := clNavy;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Font.Color := clWhite;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Hint  := '?????? #2 ????';
      end else
      if (CV.Read.OP[i].Auto = '1') then  // ????
      begin
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Color := $0066FF66;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Font.Color := clBlack;
        TPanel(Self.FindComponent('PnlLOP' + IntToStr(i))).Hint  := '????';
      end;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ???????? LOP - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // W1002 ~ W1004 / ????, ?????? ????
  //==================================
  try
    for i := 100 to High(CV.Read.Buff) do
    begin
      if not (i in [100..102, 110..112, 120..124, 130, 131, 140, 141, 150, 151, 160, 161, 170, 171, 180, 181, 190..194, 199]) then Continue;

      if (CV.Read.Buff[i].CargoExist = '0') and (BuffData[i].ID_DATE  = '') then
      begin
        TPanel(Self.FindComponent('pnlCV'+FormatFloat('000', i))).Color := pnlCXDX.Color;
        TPanel(Self.FindComponent('pnlCV'+FormatFloat('000', i))).Hint  := '????(X) / ??????(X)';
      end else
      if (CV.Read.Buff[i].CargoExist = '0') and (BuffData[i].ID_DATE <> '') then
      begin
        TPanel(Self.FindComponent('pnlCV'+FormatFloat('000', i))).Color := pnlCXDO.Color;
        TPanel(Self.FindComponent('pnlCV'+FormatFloat('000', i))).Hint  := '????(X) / ??????(O)';
      end else
      if (CV.Read.Buff[i].CargoExist = '1') and (BuffData[i].ID_DATE  = '') then
      begin
        TPanel(Self.FindComponent('pnlCV'+FormatFloat('000', i))).Color := pnlCODX.Color;
        TPanel(Self.FindComponent('pnlCV'+FormatFloat('000', i))).Hint  := '????(O) / ??????(X)';
      end else
      if (CV.Read.Buff[i].CargoExist = '1') and (BuffData[i].ID_DATE <> '') then
      begin
        TPanel(Self.FindComponent('pnlCV'+FormatFloat('000', i))).Color := pnlCODO.Color;
        TPanel(Self.FindComponent('pnlCV'+FormatFloat('000', i))).Hint  := '????(O) / ??????(O)';
      end;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ???????? ????/?????????? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // W1005, W1010 / ?????? ?????? ????
  //==================================
  try
    for i := Low(CV.Read.AC.Ready) to High(CV.Read.AC.Ready) do
    begin
      if CV.Read.AC.OtSensor[i] = '0' then // ????????
      begin
        if CV.Read.AC.Ready[i] = '1' then  // READY
        begin
          TPanel(Self.FindComponent('pnlCVStat'+IntToStr(AC_BUFF[i]))).Color := clLime;
          TPanel(Self.FindComponent('pnlCVStat'+IntToStr(AC_BUFF[i]))).Hint := '[' + IntToStr(AC_BUFF[i]) + '] ?????? ?????? Ready';
        end else
        begin
          TPanel(Self.FindComponent('pnlCVStat'+IntToStr(AC_BUFF[i]))).Color := clSilver;
          TPanel(Self.FindComponent('pnlCVStat'+IntToStr(AC_BUFF[i]))).Hint := '[' + IntToStr(AC_BUFF[i]) + '] ?????? ?????? ????';
        end;
      end else
      begin
        TPanel(Self.FindComponent('pnlCVStat'+IntToStr(AC_BUFF[i]))).Color := clYellow;
        TPanel(Self.FindComponent('pnlCVStat'+IntToStr(AC_BUFF[i]))).Hint := '[' + IntToStr(AC_BUFF[i]) + '] ?????? ?????? ???? ????';
      end;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ?????? ?????? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // W1005 / ????????(H.P, O.P)
  //==================================
  try
    if CV.Read.AC.DoorOpen1 = '0' then
         PnlSDoor1.Visible := True
    else PnlSDoor1.Visible := False;

    if CV.Read.AC.DoorOpen2 = '0' then
         PnlSDoor2.Visible := True
    else PnlSDoor2.Visible := False;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ???????? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // W1005 / ???????? ????????(H.P, O.P)
  //==================================
  try
    if CV.Read.SDoor.SDoor1 = '0' then
         PnlCVSDoor1.Visible := True
    else PnlCVSDoor1.Visible := False;

    if CV.Read.SDoor.SDoor2 = '0' then
         PnlCVSDoor2.Visible := True
    else PnlCVSDoor2.Visible := False;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ???????? ???????? - ????['+E.Message+']');
      Exit;
    end;
  end;


  //==================================
  // W1006 / ???????? ????
  //==================================
  try
    for i := Low(CV.Read.SC) to High(CV.Read.SC) do
    begin
      if CV.Read.SC[i].InReady = '1' then
      begin
        TPanel(Self.FindComponent('pnlCVStat'+IntToStr(SC_IN_BUFF[i]))).Color := clLime;
        TPanel(Self.FindComponent('pnlCVStat'+IntToStr(SC_IN_BUFF[i]))).Hint := '[' + IntToStr(SC_IN_BUFF[i]) + '] ?????? Ready';
      end else
      begin
        TPanel(Self.FindComponent('pnlCVStat'+IntToStr(SC_IN_BUFF[i]))).Color := clSilver;
        TPanel(Self.FindComponent('pnlCVStat'+IntToStr(SC_IN_BUFF[i]))).Hint := '[' + IntToStr(SC_IN_BUFF[i]) + '] ?????? ????';
      end;

      if CV.Read.SC[i].OutReady = '1' then
      begin
        TPanel(Self.FindComponent('pnlCVStat'+IntToStr(SC_OT_BUFF[i]))).Color := clLime;
        TPanel(Self.FindComponent('pnlCVStat'+IntToStr(SC_OT_BUFF[i]))).Hint := '[' + IntToStr(SC_OT_BUFF[i]) + '] ?????? Ready';
      end else
      begin
        TPanel(Self.FindComponent('pnlCVStat'+IntToStr(SC_OT_BUFF[i]))).Color := clSilver;
        TPanel(Self.FindComponent('pnlCVStat'+IntToStr(SC_OT_BUFF[i]))).Hint := '[' + IntToStr(SC_OT_BUFF[i]) + '] ?????? ????';
      end;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ???????? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // W1008, W1009 / ??????
  //==================================
  TmpWeight := HexToInt(Copy(gChrRWordBuff[0], 1, 4));

  if (TmpWeight >= 32768) or
     (TmpWeight < 1) then
       TmpWeight := 0
  else TmpWeight := TmpWeight;

  lblLoadCell.Caption := FormatFloat('##,##0.0', TmpWeight / 10) + ' Kg';

  //==================================
  // ?????? ?????? ????
  //==================================
  if BuffData[191].ID_DATE <> '' then
  begin
    lblLoadCellData.Caption := FormatFloat('##,##0.0', StrToFloatDef(Trim(BuffData[191].ITEM_WEIGHT), 0)) + ' Kg';
  end else
  begin
    lblLoadCellData.Caption := '0 Kg';
  end;


  //==================================
  // ???????? ???? ????
  //==================================
  try
    StrMove(@CV_OLD.Write.All, PAnsiChar(@CV.Write.All), SizeOf(CV.Write.All)) ;

    with qryCV do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT CH00+CH01+CH02+CH03+CH04+CH05+CH06+CH07 as WData ' +
                '   FROM TC_CVCW WITH (NOLOCK) ' ;
      SQL.Text := StrSQL;
      Open;
      First;

      if not (Bof and Eof) then
      begin
        StrValue := FieldByName('WData').AsString;
        // CH00
        StrMove(@CV.Write.E_STOP                 , PAnsiChar(Copy(StrValue,   1, 1)), 1);
        StrMove(@CV.Write.F_RESET                , PAnsiChar(Copy(StrValue,   2, 1)), 1);
        StrMove(@CV.Write.RM1_READ_CONF          , PAnsiChar(Copy(StrValue,   3, 1)), 1);
        StrMove(@CV.Write.RM2_READ_CONF          , PAnsiChar(Copy(StrValue,   4, 1)), 1);
        // CH02
        StrMove(@CV.Write.BUFF[102].StraightOrder, PAnsiChar(Copy(StrValue,  33, 1)), 1);
        StrMove(@CV.Write.BUFF[100].StraightOrder, PAnsiChar(Copy(StrValue,  34, 1)), 1);
        StrMove(@CV.Write.BUFF[120].StraightOrder, PAnsiChar(Copy(StrValue,  35, 1)), 1);
        StrMove(@CV.Write.BUFF[112].StraightOrder, PAnsiChar(Copy(StrValue,  36, 1)), 1);
        StrMove(@CV.Write.BUFF[110].StraightOrder, PAnsiChar(Copy(StrValue,  37, 1)), 1);
        StrMove(@CV.Write.BUFF[122].StraightOrder, PAnsiChar(Copy(StrValue,  38, 1)), 1);
        StrMove(@CV.Write.BUFF[130].StraightOrder, PAnsiChar(Copy(StrValue,  41, 1)), 1);
        StrMove(@CV.Write.BUFF[140].StraightOrder, PAnsiChar(Copy(StrValue,  42, 1)), 1);
        StrMove(@CV.Write.BUFF[150].StraightOrder, PAnsiChar(Copy(StrValue,  43, 1)), 1);
        StrMove(@CV.Write.BUFF[160].StraightOrder, PAnsiChar(Copy(StrValue,  44, 1)), 1);
        StrMove(@CV.Write.BUFF[170].StraightOrder, PAnsiChar(Copy(StrValue,  45, 1)), 1);
        StrMove(@CV.Write.BUFF[180].StraightOrder, PAnsiChar(Copy(StrValue,  46, 1)), 1);
        // CH03
        StrMove(@CV.Write.BUFF[190].StraightOrder, PAnsiChar(Copy(StrValue,  49, 1)), 1);
        StrMove(@CV.Write.BUFF[191].StraightOrder, PAnsiChar(Copy(StrValue,  50, 1)), 1);
        StrMove(@CV.Write.BUFF[192].StraightOrder, PAnsiChar(Copy(StrValue,  51, 1)), 1);
        StrMove(@CV.Write.BUFF[199].StraightOrder, PAnsiChar(Copy(StrValue,  52, 1)), 1);
        StrMove(@CV.Write.BUFF[192].ByPass       , PAnsiChar(Copy(StrValue,  53, 1)), 1);
        StrMove(@CV.Write.BUFF[193].StraightOrder, PAnsiChar(Copy(StrValue,  54, 1)), 1);
        // CH05
        StrMove(@CV.Write.AC.AC_JobPos[1]        , PAnsiChar(Copy(StrValue,  81, 1)), 1);
        StrMove(@CV.Write.AC.AC_JobPos[2]        , PAnsiChar(Copy(StrValue,  82, 1)), 1);
        StrMove(@CV.Write.AC.AC_JobPos[3]        , PAnsiChar(Copy(StrValue,  83, 1)), 1);
        StrMove(@CV.Write.AC.AC_JobPos[4]        , PAnsiChar(Copy(StrValue,  84, 1)), 1);
        StrMove(@CV.Write.AC.AC_JobPos[5]        , PAnsiChar(Copy(StrValue,  85, 1)), 1);
        StrMove(@CV.Write.AC.AC_JobPos[6]        , PAnsiChar(Copy(StrValue,  86, 1)), 1);
        StrMove(@CV.Write.AC.AC_JobPos[7]        , PAnsiChar(Copy(StrValue,  87, 1)), 1);
        StrMove(@CV.Write.AC.AC_JobPos[8]        , PAnsiChar(Copy(StrValue,  88, 1)), 1);
        // CH07
        StrMove(@CV.Write.AC.AC_Order            , PAnsiChar(Copy(StrValue, 113, 1)), 1);
        StrMove(@CV.Write.AC.AC_Cancel           , PAnsiChar(Copy(StrValue, 114, 1)), 1);
        StrMove(@CV.Write.AC.AC_Retry            , PAnsiChar(Copy(StrValue, 115, 1)), 1);
        StrMove(@CV.Write.AC.AC_Reset            , PAnsiChar(Copy(StrValue, 116, 1)), 1);
        StrMove(@CV.Write.AC.AC_Home             , PAnsiChar(Copy(StrValue, 117, 1)), 1);
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryCV.Close;
      TraceLogWrite('[610] ???????? ???? - ????['+E.Message+']');
      Exit;
    end;
  end;

  // ???????? ???????? ????
  if CV.Write.E_STOP = '1' then pnlEmergency.Visible := True
  else                          pnlEmergency.Visible := False;

  try
    if (CV.Write.BUFF[102].StraightOrder) <> (CV_OLD.Write.BUFF[102].StraightOrder) then
    begin
      if CV.Write.BUFF[102].StraightOrder = '1' then
      begin
        ImgS102_1.Picture := UP_RUN.Picture;
        ImgS102_2.Picture := UP_RUN.Picture;
        ImgS102_1.Hint    := '#102 ?? #100 ????????';
        ImgS102_2.Hint    := ImgS102_1.Hint;
      end else
      begin
        ImgS102_1.Picture := UP_IDLE.Picture;
        ImgS102_2.Picture := UP_IDLE.Picture;
        ImgS102_1.Hint    := '';
        ImgS102_2.Hint    := ImgS102_1.Hint;
      end;
    end;

    if (CV.Write.BUFF[100].StraightOrder) <> (CV_OLD.Write.BUFF[100].StraightOrder) then
    begin
      if CV.Write.BUFF[100].StraightOrder = '1' then
      begin
        ImgS100_1.Picture := UP_RUN.Picture;
        ImgS100_2.Picture := LEFT_RUN.Picture;
        ImgS100_1.Hint := '#100 ?? #122 ????????';
        ImgS100_2.Hint := ImgS100_1.Hint;
      end else
      begin
        ImgS100_1.Picture := UP_IDLE.Picture;
        ImgS100_2.Picture := LEFT_IDLE.Picture;
        ImgS100_1.Hint := '';
        ImgS100_2.Hint := ImgS100_1.Hint;
      end;
    end;

    if (CV.Write.BUFF[120].StraightOrder) <> (CV_OLD.Write.BUFF[120].StraightOrder) then
    begin
      if CV.Write.BUFF[120].StraightOrder = '1' then
      begin
        ImgS120.Picture   := LEFT_RUN.Picture;
        ImgS100_2.Picture := LEFT_RUN.Picture;
        ImgS120.Hint := '#120 ?? #122 ????????';
      end else
      begin
        ImgS120.Picture   := LEFT_IDLE.Picture;
        ImgS100_2.Picture := LEFT_IDLE.Picture;
        ImgS120.Hint := '';
      end;
    end;

    if (CV.Write.BUFF[112].StraightOrder) <> (CV_OLD.Write.BUFF[112].StraightOrder) then
    begin
      if CV.Write.BUFF[112].StraightOrder = '1' then
      begin
        ImgS112_1.Picture := UP_RUN.Picture;
        ImgS112_2.Picture := UP_RUN.Picture;
        ImgS112_1.Hint := '#112 ?? #110 ????????';
        ImgS112_2.Hint := ImgS112_1.Hint;
      end else
      begin
        ImgS112_1.Picture := UP_IDLE.Picture;
        ImgS112_2.Picture := UP_IDLE.Picture;
        ImgS112_1.Hint := '';
        ImgS112_2.Hint := ImgS112_1.Hint;
      end;
    end;

    if (CV.Write.BUFF[110].StraightOrder) <> (CV_OLD.Write.BUFF[110].StraightOrder) then
    begin
      if CV.Write.BUFF[110].StraightOrder = '1' then
      begin
        ImgS110_1.Picture := UP_RUN.Picture;
        ImgS110_2.Picture := LEFT_RUN.Picture;
        ImgS110_1.Hint := '#110 ?? #124 ????????';
        ImgS110_2.Hint := ImgS110_1.Hint;
      end else
      begin
        ImgS110_1.Picture := UP_IDLE.Picture;
        ImgS110_1.Hint := '';
        if CV.Write.BUFF[122].StraightOrder = '0' then
        begin
          ImgS110_2.Picture := LEFT_IDLE.Picture;
          ImgS110_2.Hint := ImgS110_1.Hint;
        end;
      end;
    end;

    if (CV.Write.BUFF[122].StraightOrder) <> (CV_OLD.Write.BUFF[122].StraightOrder) then
    begin
      if CV.Write.BUFF[122].StraightOrder = '1' then
      begin
        ImgS122.Picture   := LEFT_RUN.Picture;
        ImgS110_2.Picture := LEFT_RUN.Picture;
        ImgS122.Hint := '#122 ?? #124 ????????';
        ImgS110_2.Hint := ImgS122.Hint;
      end else
      begin
        ImgS122.Picture   := LEFT_IDLE.Picture;
        ImgS122.Hint := '';
        if CV.Write.BUFF[110].StraightOrder = '0' then
        begin
          ImgS110_2.Picture := LEFT_IDLE.Picture;
          ImgS110_2.Hint := ImgS122.Hint;
        end;
      end;
    end;

    if (CV.Write.BUFF[130].StraightOrder) <> (CV_OLD.Write.BUFF[130].StraightOrder) then
    begin
      if CV.Write.BUFF[130].StraightOrder = '1' then
      begin
        ImgS130.Picture := RIGHT_RUN.Picture;
        ImgS130.Hint := '#130 ?? #131 ????????';
      end else
      begin
        ImgS130.Picture := RIGHT_IDLE.Picture;
        ImgS130.Hint := '';
      end;
    end;

    if (CV.Write.BUFF[140].StraightOrder) <> (CV_OLD.Write.BUFF[140].StraightOrder) then
    begin
      if CV.Write.BUFF[140].StraightOrder = '1' then
      begin
        ImgS140.Picture := LEFT_RUN.Picture;
        ImgS140.Hint := '#140 ?? #141 ????????';
      end else
      begin
        ImgS140.Picture := LEFT_IDLE.Picture;
        ImgS140.Hint := '';
      end;
    end;

    if (CV.Write.BUFF[150].StraightOrder) <> (CV_OLD.Write.BUFF[150].StraightOrder) then
    begin
      if CV.Write.BUFF[150].StraightOrder = '1' then
      begin
        ImgS150.Picture := LEFT_RUN.Picture;
        ImgS150.Hint := '#150 ?? #151 ????????';
      end else
      begin
        ImgS150.Picture := LEFT_IDLE.Picture;
        ImgS150.Hint := '';
      end;

    end;
    if (CV.Write.BUFF[160].StraightOrder) <> (CV_OLD.Write.BUFF[160].StraightOrder) then
    begin
      if CV.Write.BUFF[160].StraightOrder = '1' then
      begin
        ImgS160.Picture := RIGHT_RUN.Picture;
        ImgS160.Hint := '#160 ?? #161 ????????';
      end else
      begin
        ImgS160.Picture := RIGHT_IDLE.Picture;
        ImgS160.Hint := '';
      end;

    end;
    if (CV.Write.BUFF[170].StraightOrder) <> (CV_OLD.Write.BUFF[170].StraightOrder) then
    begin
      if CV.Write.BUFF[170].StraightOrder = '1' then
      begin
        ImgS170.Picture := RIGHT_RUN.Picture;
        ImgS170.Hint := '#170 ?? #171 ????????';
      end else
      begin
        ImgS170.Picture := RIGHT_IDLE.Picture;
        ImgS170.Hint := '';
      end;
    end;

    if (CV.Write.BUFF[180].StraightOrder) <> (CV_OLD.Write.BUFF[180].StraightOrder) then
    begin
      if CV.Write.BUFF[180].StraightOrder = '1' then
      begin
        ImgS180.Picture := LEFT_RUN.Picture;
        ImgS180.Hint := '#180 ?? #181 ????????';
      end else
      begin
        ImgS180.Picture := LEFT_IDLE.Picture;
        ImgS180.Hint := '';
      end;
    end;

    if (CV.Write.BUFF[190].StraightOrder) <> (CV_OLD.Write.BUFF[190].StraightOrder) then
    begin
      if CV.Write.BUFF[190].StraightOrder = '1' then
      begin
        ImgS190.Picture := RIGHT_RUN.Picture;
        ImgS190.Hint := '#190 ?? #191 ????????';
      end else
      begin
        ImgS190.Picture := RIGHT_IDLE.Picture;
        ImgS190.Hint := '';
      end;
    end;

    if (CV.Write.BUFF[191].StraightOrder) <> (CV_OLD.Write.BUFF[191].StraightOrder) then
    begin
      if CV.Write.BUFF[191].StraightOrder = '1' then
      begin
        ImgS191.Picture := RIGHT_RUN.Picture;
        ImgS191.Hint := '#191 ?? #192 ????????';
      end else
      begin
        ImgS191.Picture := RIGHT_IDLE.Picture;
        ImgS191.Hint := '';
      end;
    end;

    if ((CV.Write.BUFF[192].StraightOrder) <> (CV_OLD.Write.BUFF[192].StraightOrder)) or
       ((CV.Write.BUFF[192].ByPass       ) <> (CV_OLD.Write.BUFF[192].ByPass       )) then
    begin
      if (CV.Write.BUFF[192].StraightOrder = '1') then
      begin
        ImgS192.Picture := RIGHT_RUN.Picture;
        ImgS192.Hint := '#192 ?? Wrapping Machine ????????';
      end else
      if (CV.Write.BUFF[192].ByPass        = '1') then
      begin
        ImgS192.Picture := RIGHT_RUN.Picture;
        ImgS192.Hint := '#192 ?? #193 ????????';
      end else
      begin
        ImgS192.Picture := RIGHT_IDLE.Picture;
        ImgS192.Hint := '';
      end;
    end;

    if ((CV.Write.BUFF[199].StraightOrder) <> (CV_OLD.Write.BUFF[199].StraightOrder)) or
       ((CV.Write.BUFF[192].ByPass       ) <> (CV_OLD.Write.BUFF[192].ByPass       )) then
    begin
      if (CV.Write.BUFF[199].StraightOrder = '1') then
      begin
        ImgS199.Picture := RIGHT_RUN.Picture;
        ImgS199.Hint := 'Wrapping Machine ?? #193 ????????';
      end else
      if (CV.Write.BUFF[192].ByPass        = '1') then
      begin
        ImgS199.Picture := RIGHT_RUN.Picture;
        ImgS199.Hint := '#192 ?? #193 ????????';
      end else
      begin
        ImgS199.Picture := RIGHT_IDLE.Picture;
        ImgS199.Hint := '';
      end;
    end;

    if (CV.Write.BUFF[193].StraightOrder) <> (CV_OLD.Write.BUFF[193].StraightOrder) then
    begin
      if CV.Write.BUFF[193].StraightOrder = '1' then
      begin
        ImgS193.Picture := RIGHT_RUN.Picture;
        ImgS193.Hint := '#193 ?? #194 ????????';
      end else
      begin
        ImgS193.Picture := RIGHT_IDLE.Picture;
        ImgS193.Hint := '';
      end;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ???????? ???? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // W100D / ??????
  //==================================
  try
    if CV.Read.ROOM.RM1_RUN_CMD = '1' then shpRmStat11.Brush.Color := clLime else shpRmStat11.Brush.Color := $00ACACAC;
    if CV.Read.ROOM.RM1_FEED_BK = '1' then shpRmStat12.Brush.Color := clLime else shpRmStat12.Brush.Color := $00ACACAC;
    if CV.Read.ROOM.RM1_DOOR    = '1' then shpRmStat13.Brush.Color := clLime else shpRmStat13.Brush.Color := $00ACACAC;
    if CV.Read.ROOM.RM2_RUN_CMD = '1' then shpRmStat21.Brush.Color := clLime else shpRmStat21.Brush.Color := $00ACACAC;
    if CV.Read.ROOM.RM2_FEED_BK = '1' then shpRmStat22.Brush.Color := clLime else shpRmStat22.Brush.Color := $00ACACAC;
    if CV.Read.ROOM.RM2_DOOR    = '1' then shpRmStat23.Brush.Color := clLime else shpRmStat23.Brush.Color := $00ACACAC;
    if CV.Read.ROOM.RM_EMER     = '1' then
    begin
      shpRmStat14.Brush.Color := clRed;
      shpRmStat24.Brush.Color := clRed;
    end else
    begin
      shpRmStat14.Brush.Color := $00ACACAC;
      shpRmStat24.Brush.Color := $00ACACAC;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ?????? ???? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // W100E / Wrapping Machine
  //==================================
  try
    if CV.Read.WRAP.WP_MANUAL_CENTER = '1' then
    begin // ??????????
      shpWP_MANUAL_CENTER.Brush.Color := clLime;
    end else
    begin
      shpWP_MANUAL_CENTER.Brush.Color := $00ACACAC;
    end;

    if CV.Read.WRAP.WP_READY = '1' then
    begin // ?????? ????
      shpWP_READY.Brush.Color := clLime;
    end else
    begin
      shpWP_READY.Brush.Color := $00ACACAC;
    end;

    if CV.Read.WRAP.WP_JOB_COMPLETE = '1' then
    begin // ?????? ????????
      shpWP_JOB_COMPLETE.Brush.Color := clLime;
    end else
    begin
      shpWP_JOB_COMPLETE.Brush.Color := $00ACACAC;
    end;

    if CV.Read.WRAP.WP_EMER  = '1' then
    begin // ?????? ????????
      shpWP_EMER.Brush.Color := clRed;
    end else
    begin
      shpWP_EMER.Brush.Color := $00ACACAC;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ?????? ???? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // W100F / ???? ???? ????
  //==================================
  try
    if CV.Read.DOOR.IN_DR_UPL = '1' then
    begin
      shpInDoor.Brush.Color := clLime;
      shpInDoor.Hint := '???????? DOOR FULL UP LIMIT';
    end else
    if CV.Read.DOOR.IN_DR_DWL = '1' then
    begin
      shpInDoor.Brush.Color := clGray;
      shpInDoor.Hint := '???????? DOOR FULL DOWN LIMIT';
    end else
    if CV.Read.DOOR.IN_DR_RDY = '1' then
    begin
      shpInDoor.Brush.Color := clLime;
      shpInDoor.Hint := '???????? DOOR READY';
    end else
    if CV.Read.DOOR.IN_DR_RUN = '1' then
    begin
      shpInDoor.Brush.Color := clYellow;
      shpInDoor.Hint := '???????? DOOR RUNNING';
    end else
    begin
      shpInDoor.Brush.Color := clGray;
      shpInDoor.Hint := '';
    end;

    if CV.Read.DOOR.OT_DR_UPL = '1' then
    begin
      shpOutDoor.Brush.Color := clLime;
      shpOutDoor.Hint := '???????? DOOR FULL UP LIMIT';
    end else
    if CV.Read.DOOR.OT_DR_DWL = '1' then
    begin
      shpOutDoor.Brush.Color := clGray;
      shpOutDoor.Hint := '???????? DOOR FULL DOWN LIMIT';
    end else
    if CV.Read.DOOR.OT_DR_RDY = '1' then
    begin
      shpOutDoor.Brush.Color := clLime;
      shpOutDoor.Hint := '???????? DOOR READY';
    end else
    if CV.Read.DOOR.OT_DR_RUN = '1' then
    begin
      shpOutDoor.Brush.Color := clYellow;
      shpOutDoor.Hint := '???????? DOOR RUNNING';
    end else
    begin
      shpOutDoor.Brush.Color := clGray;
      shpOutDoor.Hint := '';
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ???????? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // ?????? ?????? ???? ????
  //==================================
  try
    if DBCvUsed.In_Used then
    begin
      lblACInUsed.Caption    := '????????';
      lblACInUsed.Font.Color := $00464646;
    end else
    begin
      lblACInUsed.Caption    := '????????';
      lblACInUsed.Font.Color := clRed;
    end;

    // ?????? ???????? ????
    if DBCvUsed.Ot_Used then
    begin
      lblACOtUsed.Caption    := '????????';
      lblACOtUsed.Font.Color := $00464646;
    end else
    begin
      lblACOtUsed.Caption    := '????????';
      lblACOtUsed.Font.Color := clRed;
    end;

    if DBCvUsed.In_Used and DBCvUsed.Ot_Used then
    begin
      lblACUsed.Caption := '?????? ??????????';
      lblACUsed.Font.Color := $00464646;
    end else
    begin
      if DBCvUsed.In_Used then
      begin
        lblACUsed.Caption := '?????? ????????';
        lblAcUsed.Font.Color := $00464646;
      end else
      if DBCvUsed.Ot_Used then
      begin
        lblACUsed.Caption := '?????? ????????';
        lblACUsed.Font.Color := $00464646;
      end else
      begin
        lblAcUsed.Caption := '?????? ????????';
        lblACUsed.Font.Color := clRed;
      end;
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite('[610] ?????? ?????? ???????? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // ?????? ???? ????
  //==================================
  try
    if CV.Read.AC.AC_Auto = '1' then
    begin // ???? or ????
      AC_Auto.Caption  := '????';
      PnlAcInfo1.Color := $0066FF66;
      PnlAcInfo1.Hint  := '????????';
    end else
    begin
      AC_Auto.Caption  := '????';
      PnlAcInfo1.Color := clYellow;
      PnlAcInfo1.Hint  := '????????';
    end;

    if CV.Read.AC.AC_Emer = '1' then
    begin // ????????
      AC_Emer.Caption := 'O';
    end else
    begin
      AC_Emer.Caption := '';
    end;

    if CV.Read.AC.AC_Ready = '1' then
    begin // ????????
      AC_Ready.Caption := 'O';
    end else
    begin
      AC_Ready.Caption := '';
    end;

    if CV.Read.AC.AC_Run = '1' then
    begin // ??????
      AC_Run.Caption := 'O';
    end else
    begin
      AC_Run.Caption := '';
    end;

    if CV.Read.AC.AC_Error = '1' then
    begin // ????????
      AC_Error.Caption := 'O';
      AcErrorDesc.Caption := Copy(gChrRWordBuff[2], 3, 2) + ' : ' + ErrorDesc('AC', Copy(gChrRWordBuff[2], 3, 2));
      btnACCancel.Enabled     := True;
      btnACRetry.Enabled      := True;
      btnACErrorReset.Enabled := True;
      btnACLoadComplete.Enabled := True;
      btnACUnLoadComplete.Enabled := True;
    end else
    begin
      AC_Error.Caption := '';
      AcErrorDesc.Caption := '';
    end;

    if CV.Read.AC.AC_Emer = '1' then
    begin
      PnlACStat.Color := clRed;
      PnlACStat.Hint  := '????????';
    end else
    if CV.Read.AC.AC_Error = '1' then
    begin
      PnlACStat.Color := clRed;
      PnlACStat.Hint  := '????????';
    end else
    if CV.Read.AC.AC_Run = '1' then
    begin
      PnlACStat.Color := clLime;
      PnlACStat.Hint  := '??????';
    end else
    if CV.Read.AC.AC_Ready = '1' then
    begin
      PnlACStat.Color := clSilver;
      PnlACStat.Hint  := '????????';
    end else
    begin
      PnlACStat.Color := clSilver;
      PnlACStat.Hint  := '';
    end;

    if CV.Read.AC.AC_Cargo = '1' then
    begin // ????????
      AC_Cargo.Caption := 'O';
      if BuffData[198].ID_DATE <> '' then
      begin
        PnlAcInfo2.Color := pnlCODO.Color;
        PnlAcInfo2.Hint  := '????(O) / ??????(O)';
      end else
      begin
        PnlAcInfo2.Color := pnlCODX.Color;
        PnlAcInfo2.Hint  := '????(O) / ??????(X)';
      end;
    end else
    begin
      AC_Cargo.Caption := '';
      if BuffData[198].ID_DATE <> '' then
      begin
        PnlAcInfo2.Color := pnlCXDO.Color;
        PnlAcInfo2.Hint  := '????(X) / ??????(O)';
      end else
      begin
        PnlAcInfo2.Color := pnlCXDX.Color;
        PnlAcInfo2.Hint  := '????(X) / ??????(X)';
      end;
    end;

    if CV.Read.AC.AC_LCPL = '1' then
    begin // ????????
      AC_LCPL.Caption := 'O';
    end else
    begin
      AC_LCPL.Caption := '';
    end;

    if CV.Read.AC.AC_UCPL = '1' then
    begin // ????????
      AC_UCPL.Caption := 'O';
    end else
    begin
      AC_UCPL.Caption := '';
    end;
  except
    on E:Exception do
    begin
      TraceLogWrite('[610] ?????? ???? ???? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // ?????? ????????
  //==================================
  try
    TmpAcPos := StrToIntDef(Copy(gChrRWordBuff[3], 4, 1), 0);
    if (TmpAcPos < 0) then
      PnlAC.Top :=  AC_POS[0]
    else if (TmpAcPos >= 0) and (TmpAcPos < 7) then
      PnlAC.Top :=  AC_POS[TmpAcPos]
    else if (TmpAcPos >= 7) then
      PnlAC.Top :=  AC_POS[7]
    else PnlAC.Top := PnlAC.Top;
  except
    on E:Exception do
    begin
      TraceLogWrite('[610] ?????? ???? ???? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // ?????? ????????
  //==================================
  try
    with qryCV do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT Top 1 * ' +
                '   FROM TT_ORDER WITH (NOLOCK) ' +
                '  WHERE STATUS IN (''AC????'') ' ;
      SQL.Text := StrSQL;
      Open;

      if not (Bof and Eof) then
      begin
        ACIndex.Caption   := FieldByName('ID_INDEX').AsString;
        ACJobType.Caption := FieldByName('ID_TYPE' ).AsString;
        TmpScNo           := StrToInt(FieldByName('ID_SC').AsString);

        if (FieldByName('LOAD_BANK' ).AsString = '00') and
           (FieldByName('LOAD_BAY'  ).AsString = '00') and
           (FieldByName('LOAD_LEVEL').AsString = '02') then
        begin // ????????
          ACOrdLoc_L.Caption := '124';
          ACOrdLoc_U.Caption := IntToStr(AC_IN_BUFF[TmpScNo]);
        end else
        begin // ????????
          ACOrdLoc_L.Caption := IntToStr(AC_OT_BUFF[TmpScNo]);
          ACOrdLoc_U.Caption := '190';
        end;
      end else
      begin
        ACIndex.Caption    := '';
        ACJobType.Caption  := '';
        ACOrdLoc_L.Caption := '';
        ACOrdLoc_U.Caption := '';
//        btnACCancel.Enabled := False;
//        btnACRetry.Enabled  := False;
//        btnACLoadComplete.Enabled := False;
//        btnACUnLoadComplete.Enabled := False;

      end;
      Close;
    end;
  except
    on E:Exception do
    begin
      qryCV.Close;
      TraceLogWrite('[610] ???????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
      Exit;
    end;
  end;


  //==================================
  // ?????? ????
  //==================================
  try
    edtInBCRData.Text := Main.BarcodeData[1][1];
    edtOtBCRData.Text := Main.BarcodeData[2][1];

    if Main.BarcodeData[1][2] <> '' then
         inc(LampFlag[1])
    else LampFlag[1] := 0;

    if (LampFlag[1] <> 0) and
       (LampFlag[1] <  4) then
    begin
      if lblBCRReadStatus1.Caption <> 'Reading' then
      begin
        lblBCRReadStatus1.Caption := 'Reading';
        lblBCRReadStatus1.Color   := $0066FF66;
      end;
    end else
    begin
      if lblBCRReadStatus1.Caption <> '' then
      begin
        lblBCRReadStatus1.Caption := '';
        lblBCRReadStatus1.Color   := clBtnFace;
        Main.BarcodeData[1][2] := '';
        LampFlag[1] := 0;
      end;
    end;

    if Main.BarcodeData[2][2] <> '' then
         inc(LampFlag[2])
    else LampFlag[2] := 0;

    if (LampFlag[2] <> 0) and
       (LampFlag[2] <  4) then
    begin
      if lblBCRReadStatus2.Caption <> 'Reading' then
      begin
        lblBCRReadStatus2.Caption := 'Reading';
        lblBCRReadStatus2.Color   := $0066FF66;
      end;
    end else
    begin
      if lblBCRReadStatus2.Caption <> '' then
      begin
        lblBCRReadStatus2.Caption := '';
        lblBCRReadStatus2.Color   := clBtnFace;
        Main.BarcodeData[2][2] := '';
        LampFlag[2] := 0;
      end;
    end;
  except
    on E:Exception do
    begin
      TraceLogWrite('[610] ?????? ???? ???? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // ?????????? ????
  //==================================
  try
    if SelectCurrent('OPTION3','1', 'READMODE', '0') then
    begin
      lblReIpgo.Visible := True;
    end else
    begin
      lblReIpgo.Visible := False;
    end;
  except
    on E:Exception do
    begin
      TraceLogWrite('[610] ?????? ???? ???? - ????['+E.Message+']');
      Exit;
    end;
  end;
end;

//==============================================================================
// CVRead                                                                     //
//==============================================================================
function TfrmU610.CVRead: Boolean;
var
  i, j, TmpBuff : integer;
  StrSQL, TmpData : String;
  StrValue : AnsiString;
begin
  Result := False;

  try
    StrSQL := ' SELECT (CASE WHEN CR_DATE > DATEADD(SECOND, -5, GETDATE()) ' +
              '              THEN 1 ELSE 0 END) AS STATUS, TC_CVCR.*   ' +
              '   FROM TC_CVCR WITH (NOLOCK) ' +
              '  WHERE IDX = ''1'' ' ;

    with qryCV do
    begin
      Close ;
      SQL.Clear;
      SQL.Text := StrSQL ;
      Open;

      if not (Bof and Eof) then
      begin
        StrMove(@CV_OLD.Read.All, PAnsiChar(@CV.Read.All), SizeOf(CV.Read.All)) ;

        j := 0;
        for i := Low(gChrRBitBuff) to High(gChrRBitBuff) do
        begin
          StrValue := FieldByName('CH'+FormatFloat('00',i)).AsString;
          if i in [8, 9, 19, 20] then
          begin
            StrMove(@gChrRWordBuff[j], PAnsiChar(StrValue), SizeOf(gChrRWordBuff[j]));
            inc(j);
          end else StrMove(@gChrRBitBuff[i], PAnsiChar(StrValue), SizeOf(gChrRBitBuff[i]));
        end;
        Sh_CV.Brush.Color := PLC_Color[FieldByName('STATUS').AsInteger] ;
        Sh_AC.Brush.Color := Sh_CV.Brush.Color ;
      end;
      Close;
    end;
  except
    on E:Exception do
    begin
      qryCV.Close;
      TraceLogWrite('[610] ???????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
      Exit;
    end;
  end;

  try
    //==================================
    // W1000 / OP????
    //==================================
    CV.Read.OP[1].Auto  := gChrRBitBuff[ 00, 00 ];  // LOP1 ????
    CV.Read.OP[1].Semi  := gChrRBitBuff[ 00, 01 ];  // LOP1 ????
    CV.Read.OP[1].Manu  := gChrRBitBuff[ 00, 02 ];  // LOP1 ????
    CV.Read.OP[1].Erro  := gChrRBitBuff[ 00, 03 ];  // LOP1 ????
    CV.Read.OP[1].Emer  := gChrRBitBuff[ 00, 04 ];  // LOP1 ????????
    CV.Read.OP[1].RRun1 := gChrRBitBuff[ 00, 05 ];  // LOP1 ??????#1 Run
    CV.Read.OP[1].RRun2 := gChrRBitBuff[ 00, 06 ];  // LOP1 ??????#2 Run
    CV.Read.OP[2].Auto  := gChrRBitBuff[ 00, 08 ];  // LOP2 ????
    CV.Read.OP[2].Semi  := '0';                     // LOP2 ????
    CV.Read.OP[2].Manu  := gChrRBitBuff[ 00, 11 ];  // LOP2 ???? 2019.05.16 add
    CV.Read.OP[2].Erro  := gChrRBitBuff[ 00, 09 ];  // LOP2 ????
    CV.Read.OP[2].Emer  := gChrRBitBuff[ 00, 10 ];  // LOP2 ????????
    CV.Read.OP[2].RRun1 := '0';                     // LOP2 ??????#1 Run
    CV.Read.OP[2].RRun2 := '0';                     // LOP2 ??????#2 Run

    //==================================
    // W1002 ~ W1004 / ????????
    //==================================
    CV.Read.BUFF[100].CargoExist := gChrRBitBuff[ 02, 00 ]; // 100 PLT ??
    CV.Read.BUFF[101].CargoExist := gChrRBitBuff[ 02, 01 ]; // 101 PLT ??
    CV.Read.BUFF[102].CargoExist := gChrRBitBuff[ 02, 02 ]; // 102 PLT ??
    CV.Read.BUFF[110].CargoExist := gChrRBitBuff[ 02, 04 ]; // 110 PLT ??
    CV.Read.BUFF[111].CargoExist := gChrRBitBuff[ 02, 05 ]; // 111 PLT ??
    CV.Read.BUFF[112].CargoExist := gChrRBitBuff[ 02, 06 ]; // 112 PLT ??
    CV.Read.BUFF[120].CargoExist := gChrRBitBuff[ 02, 08 ]; // 120 PLT ??
    CV.Read.BUFF[121].CargoExist := gChrRBitBuff[ 02, 09 ]; // 121 PLT ??
    CV.Read.BUFF[122].CargoExist := gChrRBitBuff[ 02, 10 ]; // 122 PLT ??
    CV.Read.BUFF[123].CargoExist := gChrRBitBuff[ 02, 11 ]; // 123 PLT ??
    CV.Read.BUFF[124].CargoExist := gChrRBitBuff[ 02, 12 ]; // 124 PLT ??
    CV.Read.BUFF[130].CargoExist := gChrRBitBuff[ 03, 00 ]; // 130 PLT ??
    CV.Read.BUFF[131].CargoExist := gChrRBitBuff[ 03, 01 ]; // 131 PLT ??
    CV.Read.BUFF[140].CargoExist := gChrRBitBuff[ 03, 04 ]; // 140 PLT ??
    CV.Read.BUFF[141].CargoExist := gChrRBitBuff[ 03, 05 ]; // 141 PLT ??
    CV.Read.BUFF[150].CargoExist := gChrRBitBuff[ 03, 08 ]; // 150 PLT ??
    CV.Read.BUFF[151].CargoExist := gChrRBitBuff[ 03, 09 ]; // 151 PLT ??
    CV.Read.BUFF[160].CargoExist := gChrRBitBuff[ 03, 12 ]; // 160 PLT ??
    CV.Read.BUFF[161].CargoExist := gChrRBitBuff[ 03, 13 ]; // 161 PLT ??
    CV.Read.BUFF[170].CargoExist := gChrRBitBuff[ 04, 00 ]; // 170 PLT ??
    CV.Read.BUFF[171].CargoExist := gChrRBitBuff[ 04, 01 ]; // 171 PLT ??
    CV.Read.BUFF[180].CargoExist := gChrRBitBuff[ 04, 04 ]; // 180 PLT ??
    CV.Read.BUFF[181].CargoExist := gChrRBitBuff[ 04, 05 ]; // 181 PLT ??
    CV.Read.BUFF[190].CargoExist := gChrRBitBuff[ 04, 08 ]; // 190 PLT ??
    CV.Read.BUFF[191].CargoExist := gChrRBitBuff[ 04, 09 ]; // 191 PLT ??
    CV.Read.BUFF[192].CargoExist := gChrRBitBuff[ 04, 10 ]; // 192 PLT ??
    CV.Read.BUFF[199].CargoExist := gChrRBitBuff[ 04, 11 ]; // WRAPPING PLT ??(199?? ???? ????)
    CV.Read.BUFF[193].CargoExist := gChrRBitBuff[ 04, 12 ]; // 193 PLT ??
    CV.Read.BUFF[194].CargoExist := gChrRBitBuff[ 04, 13 ]; // 194 PLT ??

    //==================================
    // W1005 / ?????? ?????? ????????
    //==================================
    CV.Read.AC.OtSensor[1] := gChrRBitBuff[ 05, 00 ]; // 131 ?????? ???????? (????)
    CV.Read.AC.OtSensor[2] := gChrRBitBuff[ 05, 01 ]; // 124 ?????? ???????? (????)
    CV.Read.AC.OtSensor[3] := gChrRBitBuff[ 05, 02 ]; // 161 ?????? ???????? (????)
    CV.Read.AC.OtSensor[4] := gChrRBitBuff[ 05, 03 ]; // 171 ?????? ???????? (????)
    CV.Read.AC.OtSensor[5] := gChrRBitBuff[ 05, 04 ]; // 140 ?????? ???????? (????)
    CV.Read.AC.OtSensor[6] := gChrRBitBuff[ 05, 05 ]; // 150 ?????? ???????? (????)
    CV.Read.AC.OtSensor[7] := gChrRBitBuff[ 05, 06 ]; // 190 ?????? ???????? (????)
    CV.Read.AC.OtSensor[8] := gChrRBitBuff[ 05, 07 ]; // 180 ?????? ???????? (????)
    CV.Read.AC.DoorOpen1   := gChrRBitBuff[ 05, 08 ]; // ???? ???? DOOR OPEN (H.P)
    CV.Read.AC.DoorOpen2   := gChrRBitBuff[ 05, 09 ]; // ???? ???? DOOR OPEN (O.P)
    CV.Read.SDoor.SDoor1   := gChrRBitBuff[ 05, 10 ]; // ???????? ???? ???? DOOR OPEN (H.P) 2019.09.27 add
    CV.Read.SDoor.SDoor2   := gChrRBitBuff[ 05, 11 ]; // ???????? ???? ???? DOOR OPEN (O.P) 2019.09.27 add

    //==================================
    // W1006 / ???????? ????
    //==================================
    CV.Read.SC[1].OutReady := gChrRBitBuff[ 06, 00 ]; // 130 ?????? Ready
    CV.Read.SC[1].InReady  := gChrRBitBuff[ 06, 01 ]; // 141 ?????? Ready
    CV.Read.SC[2].OutReady := gChrRBitBuff[ 06, 04 ]; // 160 ?????? Ready
    CV.Read.SC[2].InReady  := gChrRBitBuff[ 06, 05 ]; // 151 ?????? Ready
    CV.Read.SC[3].OutReady := gChrRBitBuff[ 06, 08 ]; // 170 ?????? Ready
    CV.Read.SC[3].InReady  := gChrRBitBuff[ 06, 09 ]; // 181 ?????? Ready

    //==================================
    // W100A ~ W100B / ????????
    //==================================
    CV.Read.BUFF[102].StraightFinish := gChrRBitBuff[ 10, 00 ]; // #102 -> #100 ????????
    CV.Read.BUFF[100].StraightFinish := gChrRBitBuff[ 10, 01 ]; // #100 -> #122 ????????
    CV.Read.BUFF[120].StraightFinish := gChrRBitBuff[ 10, 02 ]; // #120 -> #122 ????????
    CV.Read.BUFF[112].StraightFinish := gChrRBitBuff[ 10, 03 ]; // #112 -> #110 ????????
    CV.Read.BUFF[110].StraightFinish := gChrRBitBuff[ 10, 04 ]; // #110 -> #124 ????????
    CV.Read.BUFF[122].StraightFinish := gChrRBitBuff[ 10, 05 ]; // #122 -> #124 ????????
    CV.Read.BUFF[130].StraightFinish := gChrRBitBuff[ 10, 08 ]; // #130 -> #131 ????????
    CV.Read.BUFF[140].StraightFinish := gChrRBitBuff[ 10, 09 ]; // #140 -> #141 ????????
    CV.Read.BUFF[150].StraightFinish := gChrRBitBuff[ 10, 10 ]; // #150 -> #151 ????????
    CV.Read.BUFF[160].StraightFinish := gChrRBitBuff[ 10, 11 ]; // #160 -> #161 ????????
    CV.Read.BUFF[170].StraightFinish := gChrRBitBuff[ 10, 12 ]; // #170 -> #171 ????????
    CV.Read.BUFF[180].StraightFinish := gChrRBitBuff[ 10, 13 ]; // #180 -> #181 ????????
    CV.Read.BUFF[190].StraightFinish := gChrRBitBuff[ 11, 00 ]; // #190 -> #191 ????????
    CV.Read.BUFF[191].StraightFinish := gChrRBitBuff[ 11, 01 ]; // #191 -> #192 ????????
    CV.Read.BUFF[192].StraightFinish := gChrRBitBuff[ 11, 02 ]; // #192 -> #Wrapping ????????
    CV.Read.BUFF[199].StraightFinish := gChrRBitBuff[ 11, 03 ]; // ???? -> #193 ????????
    CV.Read.BUFF[192].ByPassFinish   := gChrRBitBuff[ 11, 04 ]; // #192 -> #193 ????????(ByPass)
    CV.Read.BUFF[193].StraightFinish := gChrRBitBuff[ 11, 05 ]; // #193 -> #194 ????????

    //==================================
    // W100D / ??????
    //==================================
    CV.Read.ROOM.RM1_RUN_CMD  := gChrRBitBuff[ 13, 00 ]; // ??????1 ???? RUN CMD
    CV.Read.ROOM.RM1_FEED_BK  := gChrRBitBuff[ 13, 01 ]; // ??????1 ???? RUN FEED BACK
    CV.Read.ROOM.RM1_DOOR     := gChrRBitBuff[ 13, 02 ]; // ??????1 DOOR OPEN
    CV.Read.ROOM.RM2_RUN_CMD  := gChrRBitBuff[ 13, 04 ]; // ??????2 ???? RUN CMD
    CV.Read.ROOM.RM2_FEED_BK  := gChrRBitBuff[ 13, 05 ]; // ??????2 ???? RUN FEED BACK
    CV.Read.ROOM.RM2_DOOR     := gChrRBitBuff[ 13, 06 ]; // ??????2 DOOR OPEN
    CV.Read.ROOM.RM_EMER      := gChrRBitBuff[ 13, 07 ]; // ?????? ????????

    //==================================
    // W100E / Wrapping Machine
    //==================================
    CV.Read.WRAP.WP_MANUAL_CENTER  := gChrRBitBuff[ 14, 00 ]; // WRAPPING MACHINE ???? ?????? ????
    CV.Read.WRAP.WP_READY          := gChrRBitBuff[ 14, 01 ]; // WRAPPING MACHINE ???? ???? ????
    CV.Read.WRAP.WP_JOB_COMPLETE   := gChrRBitBuff[ 14, 02 ]; // WRAPPING MACHINE ????????
    CV.Read.WRAP.WP_EMER           := gChrRBitBuff[ 14, 03 ]; // WRAPPING MACHINE ????????

    //==================================
    // W100F / ???? ???? ????
    //==================================
    CV.Read.DOOR.IN_DR_RDY := gChrRBitBuff[ 15, 00 ]; // ???????? DOOR READY
    CV.Read.DOOR.IN_DR_RUN := gChrRBitBuff[ 15, 01 ]; // ???????? DOOR RUNNING
    CV.Read.DOOR.IN_DR_UPL := gChrRBitBuff[ 15, 02 ]; // ???????? DOOR FULL UP LIMIT
    CV.Read.DOOR.IN_DR_DWL := gChrRBitBuff[ 15, 03 ]; // ???????? DOOR FULL DOWN LIMIT
    CV.Read.DOOR.OT_DR_RDY := gChrRBitBuff[ 15, 04 ]; // ???????? DOOR READY
    CV.Read.DOOR.OT_DR_RUN := gChrRBitBuff[ 15, 05 ]; // ???????? DOOR RUNNING
    CV.Read.DOOR.OT_DR_UPL := gChrRBitBuff[ 15, 06 ]; // ???????? DOOR FULL UP LIMIT
    CV.Read.DOOR.OT_DR_DWL := gChrRBitBuff[ 15, 07 ]; // ???????? DOOR FULL DOWN LIMIT
    CV.Read.DOOR.AGV_LOCK  := gChrRBitBuff[ 15, 08 ]; // AGV CV120 LOCK ???????? 2019.05.16 add

    //==================================
    // W1010 / ?????? ?????? Ready
    //==================================
    CV.Read.AC.Ready[1] := gChrRBitBuff[ 16, 00 ]; // 131 ?????? Ready (????)
    CV.Read.AC.Ready[2] := gChrRBitBuff[ 16, 01 ]; // 124 ?????? Ready (????)
    CV.Read.AC.Ready[3] := gChrRBitBuff[ 16, 02 ]; // 161 ?????? Ready (????)
    CV.Read.AC.Ready[4] := gChrRBitBuff[ 16, 03 ]; // 171 ?????? Ready (????)
    CV.Read.AC.Ready[5] := gChrRBitBuff[ 16, 04 ]; // 140 ?????? Ready (????)
    CV.Read.AC.Ready[6] := gChrRBitBuff[ 16, 05 ]; // 150 ?????? Ready (????)
    CV.Read.AC.Ready[7] := gChrRBitBuff[ 16, 06 ]; // 190 ?????? Ready (????)
    CV.Read.AC.Ready[8] := gChrRBitBuff[ 16, 07 ]; // 180 ?????? Ready (????)

    //==================================
    // W1012 / ?????? ????
    //==================================
    CV.Read.AC.AC_Auto  := gChrRBitBuff[ 18, 00 ]; // ?????? ????
    CV.Read.AC.AC_Manu  := gChrRBitBuff[ 18, 01 ]; // ?????? ????
    CV.Read.AC.AC_Emer  := gChrRBitBuff[ 18, 02 ]; // ?????? ????????
    CV.Read.AC.AC_Ready := gChrRBitBuff[ 18, 04 ]; // ?????? Ready
    CV.Read.AC.AC_Run   := gChrRBitBuff[ 18, 05 ]; // ?????? ??????
    CV.Read.AC.AC_Error := gChrRBitBuff[ 18, 06 ]; // ?????? ????
    CV.Read.AC.AC_Cargo := gChrRBitBuff[ 18, 08 ]; // ?????? ??????
    CV.Read.AC.AC_LCPL  := gChrRBitBuff[ 18, 10 ]; // ?????? ????????
    CV.Read.AC.AC_UCPL  := gChrRBitBuff[ 18, 11 ]; // ?????? ??????????

    //==================================
    // W1015 / ??????
    //==================================
    CV.Read.BUFF[131].PosCenter := gChrRBitBuff[ 21, 01 ]; // CV131 ??????[1]
    CV.Read.BUFF[140].PosCenter := gChrRBitBuff[ 21, 02 ]; // CV140 ??????[2]
    CV.Read.BUFF[150].PosCenter := gChrRBitBuff[ 21, 03 ]; // CV150 ??????[3]
    CV.Read.BUFF[161].PosCenter := gChrRBitBuff[ 21, 04 ]; // CV161 ??????[4]
    CV.Read.BUFF[171].PosCenter := gChrRBitBuff[ 21, 05 ]; // CV171 ??????[5]
    CV.Read.BUFF[180].PosCenter := gChrRBitBuff[ 21, 06 ]; // CV180 ??????[6]
  except
    on E:Exception do
    begin
      TraceLogWrite('[610] ???????? ???? ???? - ????['+E.Message+']');
      Exit;
    end;
  end;

  //==================================
  // ???????? ?????? ????
  //==================================
  try
    FillChar(BuffData, SizeOf(BuffData), AnsiChar($00));

    with qryCV do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT * FROM TT_TRACK WITH (NOLOCK) ' +
                '  ORDER BY ID_BUFF ';
      SQL.Text := StrSQL;
      Open;
      First;

      while not Eof do
      begin
        TmpBuff := FieldByName('ID_BUFF').AsInteger;
        TmpData := FieldByName('ID_DATA').AsString;

        if TmpData = '1' then
        begin
          BuffData[TmpBuff].ID_DATE      := FieldByName('ID_DATE'     ).AsString;
          BuffData[TmpBuff].ID_TIME      := FieldByName('ID_TIME'     ).AsString;
          BuffData[TmpBuff].ID_TYPE      := FieldByName('ID_TYPE'     ).AsString;
          BuffData[TmpBuff].ID_INDEX     := FieldByName('ID_INDEX'    ).AsInteger;
          BuffData[TmpBuff].ID_SUBIDX    := FieldByName('ID_SUBIDX'   ).AsInteger;
          BuffData[TmpBuff].ID_EMG       := FieldByName('ID_EMG'      ).AsInteger;
          BuffData[TmpBuff].ID_SC        := FieldByName('ID_SC'       ).AsString;
          BuffData[TmpBuff].ID_CODE      := FieldByName('ID_CODE'     ).AsString;
          BuffData[TmpBuff].ID_BANK      := FieldByName('ID_BANK'     ).AsString;
          BuffData[TmpBuff].ID_BAY       := FieldByName('ID_BAY'      ).AsString;
          BuffData[TmpBuff].ID_LEVEL     := FieldByName('ID_LEVEL'    ).AsString;
          BuffData[TmpBuff].KIND_1       := FieldByName('KIND_1'      ).AsString;
          BuffData[TmpBuff].KIND_2       := FieldByName('KIND_2'      ).AsString;
          BuffData[TmpBuff].KIND_3       := FieldByName('KIND_3'      ).AsString;
          BuffData[TmpBuff].KIND_4       := FieldByName('KIND_4'      ).AsString;
          BuffData[TmpBuff].KIND_5       := FieldByName('KIND_5'      ).AsString;
          BuffData[TmpBuff].IN_SITE      := FieldByName('IN_SITE'     ).AsString;
          BuffData[TmpBuff].IN_DATE      := FieldByName('IN_DATE'     ).AsString;
          BuffData[TmpBuff].OT_SITE      := FieldByName('OT_SITE'     ).AsString;
          BuffData[TmpBuff].OT_DATE      := FieldByName('OT_DATE'     ).AsString;
          BuffData[TmpBuff].BCR_CHK      := FieldByName('BCR_CHK'     ).AsInteger;
          BuffData[TmpBuff].STATUS       := FieldByName('STATUS'      ).AsString;
          BuffData[TmpBuff].PROCESS      := FieldByName('PROCESS'     ).AsString;
          BuffData[TmpBuff].ITEM_LOT     := FieldByName('ITEM_LOT'    ).AsString;
          BuffData[TmpBuff].ITEM_TYPE    := FieldByName('ITEM_TYPE'   ).AsString;
          BuffData[TmpBuff].ITEM_WEIGHT  := FieldByName('ITEM_WEIGHT' ).AsString;
          BuffData[TmpBuff].ITEM_QTY     := FieldByName('ITEM_QTY'    ).AsString;
          BuffData[TmpBuff].ITEM_INFO_01 := FieldByName('ITEM_INFO_01').AsString;
          BuffData[TmpBuff].ITEM_INFO_02 := FieldByName('ITEM_INFO_02').AsString;
          BuffData[TmpBuff].ITEM_INFO_03 := FieldByName('ITEM_INFO_03').AsString;
          BuffData[TmpBuff].ITEM_INFO_04 := FieldByName('ITEM_INFO_04').AsString;
          BuffData[TmpBuff].ITEM_INFO_05 := FieldByName('ITEM_INFO_05').AsString;
          BuffData[TmpBuff].ITEM_INFO_06 := FieldByName('ITEM_INFO_06').AsString;
          BuffData[TmpBuff].ITEM_INFO_07 := FieldByName('ITEM_INFO_07').AsString;
          BuffData[TmpBuff].ITEM_INFO_08 := FieldByName('ITEM_INFO_08').AsString;
          BuffData[TmpBuff].ITEM_INFO_09 := FieldByName('ITEM_INFO_09').AsString;
          BuffData[TmpBuff].ITEM_INFO_10 := FieldByName('ITEM_INFO_10').AsString;
          BuffData[TmpBuff].ITEM_INFO_11 := FieldByName('ITEM_INFO_11').AsString;
          BuffData[TmpBuff].ITEM_INFO_12 := FieldByName('ITEM_INFO_12').AsString;
          BuffData[TmpBuff].ITEM_INFO_13 := FieldByName('ITEM_INFO_13').AsString;
          BuffData[TmpBuff].ITEM_INFO_14 := FieldByName('ITEM_INFO_14').AsString;
          BuffData[TmpBuff].ITEM_INFO_15 := FieldByName('ITEM_INFO_15').AsString;
          BuffData[TmpBuff].ITEM_INFO_16 := FieldByName('ITEM_INFO_16').AsString;
          BuffData[TmpBuff].ITEM_INFO_17 := FieldByName('ITEM_INFO_17').AsString;
          BuffData[TmpBuff].ITEM_INFO_18 := FieldByName('ITEM_INFO_18').AsString;
          BuffData[TmpBuff].ITEM_INFO_19 := FieldByName('ITEM_INFO_19').AsString;
          BuffData[TmpBuff].ITEM_INFO_20 := FieldByName('ITEM_INFO_20').AsString;
          BuffData[TmpBuff].PLT_CODE     := FieldByName('PLT_CODE'    ).AsString;
          BuffData[TmpBuff].WRAP_YN      := FieldByName('WRAP_YN'     ).AsString;
          BuffData[TmpBuff].MEMO_1       := FieldByName('MEMO_1'      ).AsString;
          BuffData[TmpBuff].MEMO_2       := FieldByName('MEMO_2'      ).AsString;
          BuffData[TmpBuff].MEMO_3       := FieldByName('MEMO_3'      ).AsString;
          BuffData[TmpBuff].MEMO_4       := FieldByName('MEMO_4'      ).AsString;
          BuffData[TmpBuff].MEMO_5       := FieldByName('MEMO_5'      ).AsString;
          BuffData[TmpBuff].ID_USER      := FieldByName('ID_USER'     ).AsString;
          BuffData[TmpBuff].UP_DT        := FieldByName('UP_DT'       ).AsString;
          BuffData[TmpBuff].CR_DT        := FieldByName('CR_DT'       ).AsString;
        end else
        begin
          TrackInfoClear(TmpBuff);
        end;
        Next;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryCV.Close;
      TraceLogWrite('[610] ???????? ?????? - ????['+E.Message+'], ????['+StrSQL+']');
      Exit;
    end;
  end;

  //==================================
  // ????????/?????? ?????? ???? ????
  //==================================
  try
    with qryCV do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT CURRENT_NAME, OPTION1 ' +
                '   FROM TC_CURRENT WITH (NOLOCK) ' +
                '  WHERE CURRENT_NAME IN (''AC_IN_USE'',''AC_OT_USE'') ' ;
      SQL.Text := StrSQL;
      Open;

      while not Eof do
      begin
        if FieldByName('CURRENT_NAME').AsString = 'AC_IN_USE' then
        begin
          DBCvUsed.In_Used := FieldByName('OPTION1').AsBoolean;
        end else
        if FieldByName('CURRENT_NAME').AsString = 'AC_OT_USE' then
        begin
          DBCvUsed.Ot_Used := FieldByName('OPTION1').AsBoolean;
        end;
        Next;
      end;
      Close;
    end;
  except
    on E:Exception do
    begin
      qryCV.Close;
      TraceLogWrite('[610] ???????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
      Exit;
    end;
  end;


  //==================================
  // ?????? ????
  //==================================
  try
    with qryCV do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT * FROM TT_BCRR WITH (NOLOCK) ' ;
      SQL.Text := StrSQL;
      Open;

      while not Eof do
      begin
        if FieldByName('BCRNO').AsInteger = 1 then
        begin
          if Trim(FieldByName('BCRDATA').AsString) <> '' then
          begin
            lblInBCRData.Caption := '[ ' + FieldByName('BCRDATA').AsString + ' ]'
          end else
          begin
            lblInBCRData.Caption := '';
          end;

          if Trim(FieldByName('MEMO_1').AsString) <> '' then
          begin
            PnlInBCR.Caption := '  ' + FieldByName('MEMO_1').AsString + FieldByName('MEMO_2').AsString;
            //if not pnlBcrClear1.Visible then pnlBcrClear1.Visible := True;
          end else
          begin
            PnlInBCR.Caption := '';
            //if pnlBcrClear1.Visible then pnlBcrClear1.Visible := False;
          end;
        end else
        if FieldByName('BCRNO').AsInteger = 2 then
        begin
          if Trim(FieldByName('BCRDATA').AsString) <> '' then
          begin
            lblOtBCRData.Caption := '[ ' + FieldByName('BCRDATA').AsString + ' ]'
          end else
          begin
            lblOtBCRData.Caption := '';
          end;

          if Trim(FieldByName('MEMO_1').AsString) <> '' then
          begin
            PnlOtBCR.Caption := '  ' + FieldByName('MEMO_1').AsString + FieldByName('MEMO_2').AsString;
            //if not pnlBcrClear2.Visible then pnlBcrClear2.Visible := True;
          end else
          begin
            PnlOtBCR.Caption := '';
            //if pnlBcrClear2.Visible then pnlBcrClear2.Visible := False;
          end;
        end;
        Next;
      end;
      Close;
    end;
  except
    on E:Exception do
    begin
      qryCV.Close;
      TraceLogWrite('[610] ?????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
      Exit;
    end;
  end;
  Result := True;
end;

//==============================================================================
// CVStatusClick                                                              //
//==============================================================================
procedure TfrmU610.CVInfoClick(Sender: TObject);
var
  iTag : integer;
  Bank, Bay, Level, Lugg : string;
  StrSQL : String;
begin
  try
    iTag := (Sender as TComponent).Tag;
    SelectedCV := iTag;

    if SelectedCV = 198 then
    begin
      cbSelectCV.Text := 'AC';
      pnlBuffNo.Caption := 'CV SITE [ AC ]';
    end else
    if SelectedCV = 199 then
    begin
      cbSelectCV.Text := 'W/M';
      pnlBuffNo.Caption := 'CV SITE [ W/M ]';
    end else
    begin
      cbSelectCV.Text := IntToStr(SelectedCV);
      pnlBuffNo.Caption := 'CV SITE [ '+IntToStr(SelectedCV)+' ]';
    end;


    if SelectedCV = 198 then
    begin
      pnlCVInfo.Visible := False;
      pnlACInfo.Visible := True;
      PnlSelMach.Caption := '???????? [AC]';
      Exit;
    end else
    begin
      pnlCVInfo.Visible := True;
      pnlACInfo.Visible := False;
      PnlSelMach.Caption := '???????? [CV]';
    end;

    if SelectedCV in [100, 110, 120, 122, 130, 140, 150, 160, 170, 180, 190, 191, 192, 193, 199 ] then
    begin
      btnCVMove.Enabled         := True;
      btnCVMoveComplete.Enabled := True;

      if SelectedCV = 192 then
      begin
        btnCVPass.Enabled         := True;
        btnCVPassComplete.Enabled := True;
      end else
      begin
        btnCVPass.Enabled         := False;
        btnCVPassComplete.Enabled := False;
      end;
    end else
    begin
      if SelectedCV in [102, 112, 192] then
      begin
        btnBCRComplete.Enabled := True;
      end else
      begin
        btnBCRComplete.Enabled := False;
      end;
      btnCVMove.Enabled         := False;
      btnCVMoveComplete.Enabled := False;
      btnCVPass.Enabled         := False;
      btnCVPassComplete.Enabled := False;
    end;

    if (CV.Read.Buff[SelectedCV].CargoExist = '0') and (BuffData[SelectedCV].ID_DATE  = '') then
    begin
      PnlBuffInfo.Caption := '????[??] ??????[??]';
    end else
    if (CV.Read.Buff[SelectedCV].CargoExist = '0') and (BuffData[SelectedCV].ID_DATE <> '') then
    begin
      PnlBuffInfo.Caption := '????[??] ??????[??]';
    end else
    if (CV.Read.Buff[SelectedCV].CargoExist = '1') and (BuffData[SelectedCV].ID_DATE  = '') then
    begin
      PnlBuffInfo.Caption := '????[??] ??????[??]';
    end else
    if (CV.Read.Buff[SelectedCV].CargoExist = '1') and (BuffData[SelectedCV].ID_DATE <> '') then
    begin
      PnlBuffInfo.Caption := '????[??] ??????[??]';
    end;

    if BuffData[SelectedCV].ID_DATE  <> '' then
    begin
      CVIndex.Caption         := IntToStr(BuffData[SelectedCV].ID_INDEX);
      CVJobType.Caption       := BuffData[SelectedCV].ID_TYPE;
      CVOrdLoc.Caption        := BuffData[SelectedCV].ID_BANK  + '-' + BuffData[SelectedCV].ID_BAY   + '-' + BuffData[SelectedCV].ID_LEVEL ;
      edtITEM_LOT.Text        := BuffData[SelectedCV].ITEM_LOT;
      PnlITEM_INFO_01.Caption := BuffData[SelectedCV].ITEM_INFO_01;
      PnlITEM_INFO_02.Caption := BuffData[SelectedCV].ITEM_INFO_02;
      PnlITEM_QTY.Caption     := BuffData[SelectedCV].ITEM_QTY;
      pnlITEM_WEIGHT.Caption  := FormatFloat('##,##0.000', StrToFloatDef(Trim(BuffData[SelectedCV].ITEM_WEIGHT), 0)) + ' Kg';

      if BuffData[SelectedCV].ITEM_TYPE = '??????' then
           cbITEM_TYPE.Text := '??????'
      else cbITEM_TYPE.Text := '????';

      if BuffData[SelectedCV].WRAP_YN = 'N' then
           cbWRAP_YN.Text := 'N'
      else cbWRAP_YN.Text := 'Y';
    end else
    begin
      CVIndex.Caption         := '';
      CVJobType.Caption       := '';
      CVOrdLoc.Caption        := '';
      edtITEM_LOT.Text        := '';
      PnlITEM_INFO_01.Caption := '';
      PnlITEM_INFO_02.Caption := '';
      PnlITEM_QTY.Caption     := '';
      pnlITEM_WEIGHT.Caption  := '';
      cbITEM_TYPE.Text        := '';
      cbWRAP_YN.Text          := '';
    end;
  except
    on E:Exception do
    begin
      TraceLogWrite('[610] ???????? ???? ???? - ????['+E.Message+'], ????['+cbSelectCV.Text+']');
    end;
  end;
end;

//==============================================================================
// SCRead                                                                     //
//==============================================================================
function TfrmU610.SCRead: Boolean;
var
  ScNo : integer;
  StrSQL : String;
  ScInfo : Array [START_SCNO..End_SCNO] of String;
begin
  Result := False;
  try
    StrSQL := ' SELECT (CASE WHEN CR_DATE > DATEADD(SECOND, -5, GETDATE()) ' +
              '              THEN 1 ELSE 0 END) AS STATUS, ' +
              '        CH00+CH04+CH05+CH06 as SC_INFO1, ' +
              '        CH01+CH07+CH08+CH09 as SC_INFO2, ' +
              '        CH02+CH10+CH11+CH12 as SC_INFO3  ' +
              '   FROM TC_SCCR WITH (NOLOCK) ' +
              '  WHERE IDX = ''1'' ' ;

    with qrySC do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL ;
      Open;

      if not (eof and bof) then
      begin
        for ScNo := START_SCNO to End_SCNO do
        begin
          ScInfo[ScNo] := FieldByName('SC_INFO'+IntToStr(ScNo)).AsString;

          DBSCRC[ScNo].ForkCenter     := Copy(ScInfo[ScNo],  8, 1); // 7 Bit : ????????
          DBSCRC[ScNo].ForkTrayExist  := Copy(ScInfo[ScNo],  9, 1); // 8 Bit : ????????
          DBSCRC[ScNo].ReturnFinish   := Copy(ScInfo[ScNo], 11, 1); // A Bit : ????????
          DBSCRC[ScNo].WorkReady      := Copy(ScInfo[ScNo], 12, 1); // B Bit : ????????
          DBSCRC[ScNo].MachineAction  := Copy(ScInfo[ScNo], 13, 1); // C Bit : ????????
          DBSCRC[ScNo].MachineTrouble := Copy(ScInfo[ScNo], 14, 1); // D Bit : ????????
          DBSCRC[ScNo].WorkMode       := Copy(ScInfo[ScNo], 15, 1); // E Bit : ????????(1:????)
          DBSCRC[ScNo].MachinePower   := Copy(ScInfo[ScNo], 16, 1); // F Bit : ????????
          DBSCRC[ScNo].Bay            := HexToInt(Copy(ScInfo[ScNo], 19, 2)); // ?? ????
          DBSCRC[ScNo].Level          := HexToInt(Copy(ScInfo[ScNo], 23, 2)); // ?? ????
          DBSCRC[ScNo].Error          := HexToInt(Copy(ScInfo[ScNo], 27, 2)); // ????
          TShape(Self.FindComponent('Sh_SC'+IntToStr(ScNo))).Brush.Color := PLC_Color[FieldByName('STATUS').AsInteger] ;
        end;
      end else
      begin
        TShape(Self.FindComponent('Sh_SC'+IntToStr(ScNo))).Brush.Color := PLC_Color[0] ;
      end;
      Close;
    end;
  except
    on E:Exception do
    begin
      qrySC.Close;
      TraceLogWrite('[610] ???????????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
      Exit;
    end;
  end;

  try
    for ScNo := START_SCNO to End_SCNO do
    begin
      with qrySC do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT * FROM TT_SCIO WITH (NOLOCK) ' +
                  '  WHERE ID_SC = ''' + IntToStr(ScNo) + ''' ';
        SQL.Text := StrSQL;
        Open;

        if not (eof and bof) then
        begin
          DBSCIO[ScNo].ID_DATE      := FieldByName('ID_DATE'     ).AsString;
          DBSCIO[ScNo].ID_TIME      := FieldByName('ID_TIME'     ).AsString;
          DBSCIO[ScNo].ID_INDEX     := FieldByName('ID_INDEX'    ).AsInteger;
          DBSCIO[ScNo].ID_SUBIDX    := FieldByName('ID_SUBIDX'   ).AsInteger;
          DBSCIO[ScNo].IO_TYPE      := FieldByName('IO_TYPE'     ).AsString;
          DBSCIO[ScNo].ID_SC        := FieldByName('ID_SC'       ).AsString;
          DBSCIO[ScNo].LOAD_BANK    := FieldByName('LOAD_BANK'   ).AsString;
          DBSCIO[ScNo].LOAD_BAY     := FieldByName('LOAD_BAY'    ).AsString;
          DBSCIO[ScNo].LOAD_LEVEL   := FieldByName('LOAD_LEVEL'  ).AsString;
          DBSCIO[ScNo].UNLOAD_BANK  := FieldByName('UNLOAD_BANK' ).AsString;
          DBSCIO[ScNo].UNLOAD_BAY   := FieldByName('UNLOAD_BAY'  ).AsString;
          DBSCIO[ScNo].UNLOAD_LEVEL := FieldByName('UNLOAD_LEVEL').AsString;
          DBSCIO[ScNo].SC_STATUS    := FieldByName('SC_STATUS'   ).AsString;
          DBSCIO[ScNo].CR_DT        := FieldByName('CR_DT'       ).AsString;
        end else
        begin
          ScioClear(ScNo);
        end;
        Close;
      end;
    end;
  except
    on E:Exception do
    begin
      qrySC.Close;
      TraceLogWrite('[610] ???????????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
      Exit;
    end;
  end;

  try
    with qrySC do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT CURRENT_NAME, CURRENT_ID, OPTION1 ' +
                '   FROM TC_CURRENT WITH (NOLOCK) ' +
                '  WHERE CURRENT_NAME IN (''SC_IN_USE'',''SC_OT_USE'') ' +
                '  ORDER BY CURRENT_NAME ' ;
      SQL.Text := StrSQL;
      Open;

      while not Eof do
      begin
        ScNo := FieldByName('CURRENT_ID').AsInteger;
        if FieldByName('CURRENT_NAME').AsString = 'SC_IN_USE' then
        begin
          DBScUsed[ScNo].In_Used := FieldByName('OPTION1').AsBoolean;
        end else
        if FieldByName('CURRENT_NAME').AsString = 'SC_OT_USE' then
        begin
          DBScUsed[ScNo].Ot_Used := FieldByName('OPTION1').AsBoolean;
        end;
        Next;
      end;
      Close;
    end;
  except
    on E:Exception do
    begin
      qrySC.Close;
      TraceLogWrite('[610] ???????????? ???? ???? - ????['+E.Message+'], ????['+StrSQL+']');
      Exit;
    end;
  end;
  Result := True;
end;

//==============================================================================
// SccStatusDisplayPanel                                                      //
//==============================================================================
procedure TfrmU610.SccStatusDisplayPanel(ScNo: integer);
begin
  try
    if ScNo > 0 then
    begin
      SCHogi.Caption := '???????????? ' + IntToStr(ScNo) + '????';

      // ????????[7]
      if DBSCRC[ScNo].ForkCenter = '1' then
      begin
        ForkCenter.Caption := 'O';
      end else
      begin
        ForkCenter.Caption := '';
      end;

      // ????????[8]
      if DBSCRC[ScNo].ForkTrayExist = '1' then
      begin
        ForkTrayExist.Caption := 'O';
      end else
      begin
        ForkTrayExist.Caption := '';
      end;

      // ????????[A]
      if DBSCRC[ScNo].ReturnFinish = '1' then
      begin
        ReturnFinish.Caption := 'O';
      end else
      begin
        ReturnFinish.Caption := '';
      end;

      // ????????[B]
      if DBSCRC[ScNo].WorkReady = '1' then
      begin
        WorkReady.Caption := 'O';
      end else
      begin
        WorkReady.Caption := '';
      end;

      // ??????[C]
      if DBSCRC[ScNo].MachineAction = '1' then
      begin
        MachineAction.Caption := 'O';
      end else
      begin
        MachineAction.Caption := '';
      end;

      // ????????[D]
      if DBSCRC[ScNo].MachineTrouble = '1' then
      begin
        MachineTrouble.Caption := 'O';
        ScErrorDesc.Caption := FormatFloat('00', DBSCRC[ScNo].Error) + ' : ' + ErrorDesc('SC', FormatFloat('00', DBSCRC[ScNo].Error));
      end else
      begin
        MachineTrouble.Caption := '';
        ScErrorDesc.Caption := '';
      end;

      // ????????[E]
      if DBSCRC[ScNo].WorkMode = '1' then
      begin
        WorkMode.Caption := '????';
      end else
      begin
        WorkMode.Caption := '????';
      end;

      // ????????[F]
      if DBSCRC[ScNo].MachinePower = '1' then
      begin
        MachinePower.Caption := '????';
      end else
      begin
        MachinePower.Caption := '????';
      end;

      // ????????
      SCLoc.Caption := FormatFloat('00', DBSCRC[ScNo].Bay) + '-' + FormatFloat('00', DBSCRC[ScNo].Level);

      // ????????
      if DBSCIO[ScNo].ID_DATE <> '' then
      begin
        SCIndex.Caption   := IntToStr(DBSCIO[ScNo].ID_INDEX);
        SCJobType.Caption := DBSCIO[ScNo].IO_TYPE;

        if (DBSCIO[ScNo].UNLOAD_BANK  = '00') and
           (DBSCIO[ScNo].UNLOAD_BAY   = '00') and
           (DBSCIO[ScNo].UNLOAD_LEVEL = '01') then
        begin // ?????? ????
          SCOrdLoc.Caption := Copy(DBSCIO[ScNo].LOAD_BANK, 2, 1)  + '-' + DBSCIO[ScNo].LOAD_BAY   + '-' + DBSCIO[ScNo].LOAD_LEVEL ;
        end else
        begin // ???? ???? ?????? ????
          SCOrdLoc.Caption := Copy(DBSCIO[ScNo].UNLOAD_BANK, 2, 1)  + '-' + DBSCIO[ScNo].UNLOAD_BAY   + '-' + DBSCIO[ScNo].UNLOAD_LEVEL ;
        end;
      end else
      begin
        SCIndex.Caption   := '';
        SCJobType.Caption := '';
        SCOrdLoc.Caption  := '';
      end;

      if SelectCurrent('Option'+IntTostr(SelectedSC), '1', 'SCEMPTYOUT', '0') then
      begin
        btnSCCancel.Enabled   := True;
        btnSCComplete.Enabled := True;
        btnSCReset.Enabled    := False;
      end else
      if SelectCurrent('Option'+IntTostr(SelectedSC), '1', 'SCDOUBLEIN', '0') then
      begin
        btnSCCancel.Enabled   := False;
        btnSCComplete.Enabled := False;
        btnSCReset.Enabled    := True;
      end else
      begin
        btnSCCancel.Enabled   := False;
        btnSCComplete.Enabled := False;
        btnSCReset.Enabled    := False;
      end;
    end;
  except
    on E:Exception do
    begin
      TraceLogWrite('[610] ???????????? ???? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// SccStatusDisplay                                                           //
//==============================================================================
procedure TfrmU610.SccStatusDisplay;
var
  StrSQL, ErrMsg : String;
  i, ScNo, nBay, nLvl : Integer;
begin
  try
    //=====================================
    // ???? ???? ????, ???? ???? ????
    //=====================================
    SCRead;

    //=====================================
    // ???? ???? ????, ???? ???? ????
    //=====================================
    for ScNo := START_SCNO to End_SCNO do
    begin
      // ????????[8]
      if DBSCRC[ScNo].ForkTrayExist = '1' then
      begin
        TPanel(Self.FindComponent('PnlScInfo'+IntToStr(ScNo)+'2')).Color := $00C08000;
        TPanel(Self.FindComponent('PnlScInfo'+IntToStr(ScNo)+'2')).Hint  := '????????';
      end else
      begin
        TPanel(Self.FindComponent('PnlScInfo'+IntToStr(ScNo)+'2')).Color := clWhite;
        TPanel(Self.FindComponent('PnlScInfo'+IntToStr(ScNo)+'2')).Hint  := '????????';
      end;

      // ????????[D]
      if DBSCRC[ScNo].MachineTrouble = '1' then
      begin
        TPanel(Self.FindComponent('PnlSCStat'+IntToStr(ScNo))).Color := clRed;
        TPanel(Self.FindComponent('PnlSCStat'+IntToStr(ScNo))).Hint  := '????????';
      end else
      // ??????[C]
      if DBSCRC[ScNo].MachineAction = '1' then
      begin
        TPanel(Self.FindComponent('PnlSCStat'+IntToStr(ScNo))).Color := clLime;
        TPanel(Self.FindComponent('PnlSCStat'+IntToStr(ScNo))).Hint  := '??????';
      end else
      // ????????[B]
      if DBSCRC[ScNo].WorkReady = '1' then
      begin
        TPanel(Self.FindComponent('PnlSCStat'+IntToStr(ScNo))).Color := clSilver;
        TPanel(Self.FindComponent('PnlSCStat'+IntToStr(ScNo))).Hint  := '????????';
      end else
      begin
        TPanel(Self.FindComponent('PnlSCStat'+IntToStr(ScNo))).Color := clSilver;
        TPanel(Self.FindComponent('PnlSCStat'+IntToStr(ScNo))).Hint  := '';
      end;

      // ????????[E]
      if DBSCRC[ScNo].WorkMode = '1' then
      begin
        TPanel(Self.FindComponent('PnlScInfo'+IntToStr(ScNo)+'1')).Color := $0066FF66;
        TPanel(Self.FindComponent('PnlScInfo'+IntToStr(ScNo)+'1')).Hint  := '????????';
      end else
      begin
        TPanel(Self.FindComponent('PnlScInfo'+IntToStr(ScNo)+'1')).Color := clYellow;
        TPanel(Self.FindComponent('PnlScInfo'+IntToStr(ScNo)+'1')).Hint  := '????????';
      end;

      // ??(Bay) ????
      if (DBSCRC[ScNo].Bay in [0..12]) then
      begin
        if      DBSCRC[ScNo].Bay = 0 then TPanel(Self.FindComponent('PnlSC'+IntToStr(ScNo))).Left := 516
        else if DBSCRC[ScNo].Bay = 1 then TPanel(Self.FindComponent('PnlSC'+IntToStr(ScNo))).Left := 466
        else                              TPanel(Self.FindComponent('PnlSC'+IntToStr(ScNo))).Left := 466 - ((DBSCRC[ScNo].Bay - 1) * 41);
      end;

      // ???????????? ???????? ????
      if DBScUsed[ScNo].In_Used then
      begin
        TLabel(Self.FindComponent('lblInUsed'+IntToStr(ScNo))).Caption    := '????????';
        TLabel(Self.FindComponent('lblInUsed'+IntToStr(ScNo))).Font.Color := $00464646;
      end else
      begin
        TLabel(Self.FindComponent('lblInUsed'+IntToStr(ScNo))).Caption    := '????????';
        TLabel(Self.FindComponent('lblInUsed'+IntToStr(ScNo))).Font.Color := clRed;
      end;

      // ???????????? ???????? ????
      if DBScUsed[ScNo].Ot_Used then
      begin
        TLabel(Self.FindComponent('lblOtUsed'+IntToStr(ScNo))).Caption    := '????????';
        TLabel(Self.FindComponent('lblOtUsed'+IntToStr(ScNo))).Font.Color := $00464646;
      end else
      begin
        TLabel(Self.FindComponent('lblOtUsed'+IntToStr(ScNo))).Caption    := '????????';
        TLabel(Self.FindComponent('lblOtUsed'+IntToStr(ScNo))).Font.Color := clRed;
      end;

      if DBScUsed[ScNo].In_Used and DBScUsed[ScNo].Ot_Used then
      begin
        TLabel(Self.FindComponent('lblUsed'+IntToStr(ScNo))).Caption := IntToStr(ScNo)+'???? ??????????';
        TLabel(Self.FindComponent('lblUsed'+IntToStr(ScNo))).Font.Color := $00464646;
      end else
      begin
        if DBScUsed[ScNo].In_Used then
        begin
          TLabel(Self.FindComponent('lblUsed'+IntToStr(ScNo))).Caption := IntToStr(ScNo)+'???? ????????';
          TLabel(Self.FindComponent('lblUsed'+IntToStr(ScNo))).Font.Color := $00464646;
        end else
        if DBScUsed[ScNo].Ot_Used then
        begin
          TLabel(Self.FindComponent('lblUsed'+IntToStr(ScNo))).Caption := IntToStr(ScNo)+'???? ????????';
          TLabel(Self.FindComponent('lblUsed'+IntToStr(ScNo))).Font.Color := $00464646;
        end else
        begin
          TLabel(Self.FindComponent('lblUsed'+IntToStr(ScNo))).Caption := IntToStr(ScNo)+'???? ????????';
          TLabel(Self.FindComponent('lblUsed'+IntToStr(ScNo))).Font.Color := clRed;
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      TraceLogWrite('[610] ???????????? ???? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// btnSCControlClick [?????? ????????, ?????? ????????, ?????? ????????]      //
//==============================================================================
procedure TfrmU610.btnSCControlClick(Sender: TObject);
var
  JobIdx : integer;
begin
  try
    JobIdx := (Sender as TButton).Tag;

    case JobIdx of
      1 : // ?????? ????????
      begin
        if MessageDlg(' ???????????? '+IntToStr(SelectedSC)+ '????- ????????[' + SCIndex.Caption + ']' + #13#10 +' ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        UpdateCurrent('Option'+IntToStr(SelectedSC), '1', 'SCEMPTYOUTCANCEL', '0');
        TraceLogWrite('[610] ???????????? ???? - ????????????['+IntToStr(SelectedSC)+'], ????????['+SCIndex.Caption+'], ????[????????]');
      end;
      2 : // ?????? ????????
      begin
        if MessageDlg(' ???????????? '+IntToStr(SelectedSC)+ '????- ????????[' + SCIndex.Caption + ']' + #13#10 +' ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        UpdateCurrent('Option'+IntToStr(SelectedSC), '1', 'SCEMPTYOUTCOMPLETE', '0');
        TraceLogWrite('[610] ???????????? ???? - ????????????['+IntToStr(SelectedSC)+'], ????????['+SCIndex.Caption+'], ????[????????]');
      end;
      3 : // ???????? ???? ???? ?? ??????
      begin
        if MessageDlg(' ???????????? '+IntToStr(SelectedSC)+ '????- ????????[' + SCIndex.Caption + ']' + #13#10 +' ???????? ?? ???????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        UpdateCurrent('Option'+IntToStr(SelectedSC), '1', 'SCDOUBLEINRESET', '0');
        TraceLogWrite('[610] ???????????? ???? - ????????????['+IntToStr(SelectedSC)+'], ????????['+SCIndex.Caption+'], ????[????????]');
      end;
    end;
  except
    on E: Exception do
    begin
      TraceLogWrite('[610] ???????????? ???? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// btnACControlClick [??????, ????????, ????????, ??????]                     //
//==============================================================================
procedure TfrmU610.btnACControlClick(Sender: TObject);
var
  JobIdx : integer;
begin
  try
    JobIdx := (Sender as TButton).Tag;

    case JobIdx of
      1 : // ??????
      begin
        if MessageDlg(' ??????- ????????[' + ACIndex.Caption + ']' + #13#10 +' ???????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        InsertCVACOrder('AC', 'W', '', 'H', '1');
        TraceLogWrite('[610] ?????? ???? - ????????['+ACIndex.Caption+'], ????[??????]');
      end;
      2 : // ????????
      begin
        if MessageDlg(' ??????- ????????[' + ACIndex.Caption + ']' + #13#10 +' ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        InsertCVACOrder('AC', 'W', '', 'S', '1');
        btnACErrorReset.Enabled := True;
        TraceLogWrite('[610] ?????? ???? - ????????['+ACIndex.Caption+'], ????[????????]');
      end;
      3 : // ????????
      begin
        if MessageDlg(' ??????- ????????[' + ACIndex.Caption + ']' + #13#10 +' ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        InsertCVACOrder('AC', 'W', '', 'C', '1');
//        btnACCancel.Enabled := False;
//        btnACRetry.Enabled  := False;
        TraceLogWrite('[610] ?????? ???? - ????????['+ACIndex.Caption+'], ????[????????]');
      end;
      4 : // ??????
      begin
        if MessageDlg(' ??????- ????????[' + ACIndex.Caption + ']' + #13#10 +' ???????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        InsertCVACOrder('AC', 'W', '', 'R', '1');
//        btnACCancel.Enabled := False;
//        btnACRetry.Enabled  := False;
        TraceLogWrite('[610] ?????? ???? - ????????['+ACIndex.Caption+'], ????[??????]');
      end;

      5 : // ????????
      begin
        if MessageDlg(' ??????- ????????[' + ACIndex.Caption + ']' + #13#10 +' ???????? ?????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        InsertCVACOrder('AC', 'R', '', 'L', '1');
//        btnACCancel.Enabled := False;
//        btnACRetry.Enabled  := False;
        TraceLogWrite('[610] ?????? ???? - ????????['+ACIndex.Caption+'], ????[????????]');
      end;

      6 : // ????????
      begin
        if MessageDlg(' ??????- ????????[' + ACIndex.Caption + ']' + #13#10 +' ???????? ?????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        InsertCVACOrder('AC', 'R', '', 'U', '1');
//        btnACCancel.Enabled := False;
//        btnACRetry.Enabled  := False;
        TraceLogWrite('[610] ?????? ???? - ????????['+ACIndex.Caption+'], ????[????????]');
      end;
    end;
  except
    on E: Exception do
    begin
      TraceLogWrite('[610] ?????? ???? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// btnCVOrderClick [????????, ????????, ????????, ????????]                   //
//==============================================================================
procedure TfrmU610.btnCVOrderClick(Sender: TObject);
var
  JobIdx, BuffNo : integer;
begin
  try
    JobIdx := (Sender as TButton).Tag;

    if      Trim(cbSelectCV.Text) = 'AC'  then
         BuffNo  := 198
    else if Trim(cbSelectCV.Text) = 'W/M' then
         BuffNo  := 199
    else BuffNo  := StrToIntDef(cbSelectCV.Text, 0);
    if JobIdx in [6, 7] then BuffNo := 200;

    if not (BuffNo in [100, 102, 110, 112, 120, 122, 130, 140, 150, 160, 170, 180, 190, 191, 192, 193, 199, 200]) then Exit;

    case JobIdx of
      1 : // ????????
      begin
        if MessageDlg(' ???????? ????????['+IntToStr(BuffNo)+']?? ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        if      CV.Write.BUFF[BuffNo].StraightOrder = '0' then InsertCVACOrder('CV', 'W', IntToStr(BuffNo), 'S', '1')
        else if CV.Write.BUFF[BuffNo].StraightOrder = '1' then InsertCVACOrder('CV', 'W', IntToStr(BuffNo), 'S', '0');
        TraceLogWrite('[610] ???????? ???? - ????['+IntToStr(BuffNo)+'], ????[????????]');
      end;
      2 : // ????????
      begin
        if MessageDlg(' ???????? ????????['+IntToStr(BuffNo)+']?? ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        if      CV.Read.BUFF[BuffNo].StraightFinish = '0' then InsertCVACOrder('CV', 'R', IntToStr(BuffNo), 'S', '1')
        else if CV.Read.BUFF[BuffNo].StraightFinish = '1' then InsertCVACOrder('CV', 'R', IntToStr(BuffNo), 'S', '0');
        TraceLogWrite('[610] ???????? ???? - ????['+IntToStr(BuffNo)+'], ????[????????]');
      end;
      3 : // ????????
      begin
        if MessageDlg(' ???????? ????????['+IntToStr(BuffNo)+']?? ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        if      CV.Write.BUFF[BuffNo].ByPass = '0'        then InsertCVACOrder('CV', 'W', IntToStr(BuffNo), 'B', '1')
        else if CV.Write.BUFF[BuffNo].ByPass = '1'        then InsertCVACOrder('CV', 'W', IntToStr(BuffNo), 'B', '0');
        TraceLogWrite('[610] ???????? ???? - ????['+IntToStr(BuffNo)+'], ????[????????]');
      end;
      4 : // ????????
      begin
        if MessageDlg(' ???????? ????????['+IntToStr(BuffNo)+']?? ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        if      CV.Read.BUFF[BuffNo].ByPassFinish = '0'   then InsertCVACOrder('CV', 'R', IntToStr(BuffNo), 'B', '1')
        else if CV.Read.BUFF[BuffNo].ByPassFinish = '1'   then InsertCVACOrder('CV', 'R', IntToStr(BuffNo), 'B', '0');
        TraceLogWrite('[610] ???????? ???? - ????['+IntToStr(BuffNo)+'], ????[????????]');
      end;
      5 : // ????????
      begin
        if BuffNo in [102, 112] then
        begin
          if MessageDlg(' ???????? ???? ????????['+IntToStr(BuffNo)+']?? ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
          BcrDataUpdate('1', ''); // ???? ?????? ????????
          TraceLogWrite('[610] ???????? ???? - ????['+IntToStr(BuffNo)+'], ????[?????????? ????????]');
          InsertCVACOrder('CV', 'W', IntToStr(BuffNo), 'C', '1');
        end else
        begin
          if MessageDlg(' ???????? ???? ????????['+IntToStr(BuffNo)+']?? ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
          BcrDataUpdate('2', ''); // ???? ?????? ????????
          TraceLogWrite('[610] ???????? ???? - ????['+IntToStr(BuffNo)+'], ????[?????????? ????????]');
        end;
      end;
      6 : // ????????
      begin
        if CV.Write.E_STOP = '0' then
        begin
          if MessageDlg(' ???????? ?????????? ???? ?????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        end else
        begin
          if MessageDlg(' ???????? ?????????? ???? ?????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
        end;
        if      CV.Write.E_STOP = '0'  then InsertCVACOrder('CV', 'W', IntToStr(200), 'E', '1')
        else if CV.Write.E_STOP = '1'  then InsertCVACOrder('CV', 'W', IntToStr(200), 'E', '0');
        TraceLogWrite('[610] ???????? ???? - ????['+IntToStr(BuffNo)+'], ????[????????]');
      end;
      7 : // ????????
      begin
        if MessageDlg(' ???????? ?????????? ?????????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
//        if      CV.Write.F_RESET = '0' then InsertCVACOrder('CV', 'W', IntToStr(200), 'F', '1')
//        else if CV.Write.F_RESET = '1' then InsertCVACOrder('CV', 'W', IntToStr(200), 'F', '0');
        InsertCVACOrder('CV', 'W', IntToStr(200), 'F', '1');
        TraceLogWrite('[610] ???????? ???? - ????['+IntToStr(BuffNo)+'], ????[????????]');
      end;
    end;
  except
    on E: Exception do
    begin
      TraceLogWrite('[610] ???????? ???? ???? - ????['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// SelectCurrent                                                              //
//==============================================================================
function TfrmU610.SelectCurrent(FieldName, FieldValue, Current_Name, Current_ID: String): Boolean;
var
  StrSQL : String ;
begin
  Result := False;
  try
    with qrySelect do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ' + FieldName +
                '   FROM TC_CURRENT WITH (NOLOCK) ' +
                '  WHERE CURRENT_NAME = ''' + Current_Name + ''' ' +
                '    AND CURRENT_ID = ' + Current_ID ;
      SQL.Text := StrSQL ;
      Open;
      if not (Eof and Bof) then
      begin
        Result := Fields[0].AsBoolean;
      end;
      Close;
    end;
  except
    on E: Exception do
    begin
      qrySelect.Close;
      TraceLogWrite('[610] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// UpdateCurrent                                                              //
//==============================================================================
procedure TfrmU610.UpdateCurrent(FieldName, FieldValue, Current_Name, Current_ID: String);
var
  StrSQL : String ;
begin
  try
    with qryCommand do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TC_CURRENT ' +
                '    SET ' + FieldName + ' = ''' + FieldValue + ''' ' +
                '  WHERE CURRENT_NAME = ''' + Current_Name + ''' ' +
                '    AND CURRENT_ID   = '+ Current_ID ;
      SQL.Text := StrSQL ;
      ExecSQL;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryCommand.Close;
      TraceLogWrite('[610] ???????? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// btnErrorClearClick                                                         //
//==============================================================================
procedure TfrmU610.btnErrorClearClick(Sender: TObject);
var
  StrSQL : String ;
begin
  try
    with qryCommand do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_ERROR ' +
                '    SET ERR_END = GETDATE() ' +
                '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                '  WHERE ERR_END is NULL ' ;
      SQL.Text := StrSQL ;
      ExecSQL;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryCommand.Close;
      TraceLogWrite('[610] ???? ???? ?????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// InsertCVACOrder                                                            //
//==============================================================================
procedure TfrmU610.InsertCVACOrder(Mach, Gubun, Buff_No, Orders, KeyValue: String);
var
  StrSQL : String;
begin
  try
    if Mach = 'CV' then
    begin
      with qryCommand do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT * FROM TC_CVORDER WITH (NOLOCK) ' +
                  '  WHERE GUBUN   = ''' + Gubun   + ''' ' +
                  '    AND BUFF_NO = '   + Buff_No +
                  '    AND ORDERS  = ''' + Orders  + ''' ' ;
        SQL.Text := StrSQL;
        Open;

        if not (Eof and Bof) then
        begin
          StrSQL := ' UPDATE TC_CVORDER ' +
                    '    SET KEYVALUE = ' + KeyValue  +
                    '  WHERE GUBUN    = ''' + Gubun   + ''' ' +
                    '    AND BUFF_NO  = '   + Buff_No +
                    '    AND ORDERS   = ''' + Orders  + ''' ' ;
        end else
        begin
          StrSQL := ' INSERT INTO TC_CVORDER(GUBUN, BUFF_NO, ORDERS, KEYVALUE, ID_USER) ' +
                    ' VALUES(''' + Gubun + ''', ' + Buff_No + ', ''' + Orders + ''', ' + KeyValue + ', ''' + MainDM.M_Info.UserCode + ''') ';
        end;
        SQL.Clear;
        SQL.Text := StrSQL;
        ExecSQL;
        Close;
      end;
    end else
    if MAch = 'AC' then
    begin
      with qryCommand do
      begin
        Close;
        StrSQL := ' INSERT INTO TC_ACORDER(GUBUN, ORDERS, KEYVALUE, ID_USER) ' +
                  ' VALUES(''' + Gubun + ''', ''' + Orders + ''', ' + KeyValue + ', ''' + MainDM.M_Info.UserCode + ''') ';
        SQL.Clear;
        SQL.Text := StrSQL;
        ExecSQL;
        Close;
      end;
    end;
  except
    on E : Exception do
    begin
      qryCommand.Close;
      TraceLogWrite('[610] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// ErrorDesc                                                                  //
//==============================================================================
function TfrmU610.ErrorDesc(ID_MACH, ERR_CODE: String): String;
var
  StrSQL : String ;
begin
  try
    Result := '?????? ????';
    with qryErrorDesc do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ERR_NAME ' +
                '   FROM TM_ERROR WITH (NOLOCK)' +
                '  WHERE ID_MACH  = ''' + ID_MACH + ''' ' +
                '    AND ERR_CODE = ''' + ERR_CODE + ''' ' ;
      SQL.Text := StrSQL ;
      Open;
      if Not (Eof and Bof) then
      begin
        Result := FieldByName('ERR_NAME').AsString;
      end;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryErrorDesc.Close;
      TraceLogWrite('[610] ???????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// btnCVDataProcClick                                                         //
//==============================================================================
procedure TfrmU610.btnCVControlClick(Sender: TObject);
var
  ProcIdx, NowBuff, NextBuff : integer;
begin
  ProcIdx  := (Sender as TButton).Tag;

  if      Trim(cbSelectCV.Text) = 'AC'  then
       NowBuff  := 198
  else if Trim(cbSelectCV.Text) = 'W/M' then
       NowBuff  := 199
  else NowBuff  := StrToIntDef(cbSelectCV.Text, 0);

  if      Trim(cbUpdateCV.Text) = 'AC'  then
       NextBuff := 198
  else if Trim(cbUpdateCV.Text) = 'W/M' then
       NextBuff := 199
  else NextBuff := StrToIntDef(cbUpdateCV.Text, 0);

  case ProcIdx of
    1 : // ????
    begin
      if not (NowBuff  in [100..102, 110..112, 120..124, 130, 131, 140, 141, 150, 151, 160, 161, 170, 171, 180, 181, 190..194, 198, 199]) or
         not (NextBuff in [100..102, 110..112, 120..124, 130, 131, 140, 141, 150, 151, 160, 161, 170, 171, 180, 181, 190..194, 198, 199]) then Exit;
      if NowBuff = NextBuff then Exit;
      TrackDataMove(NowBuff, NextBuff);
      cbUpdateCV.Text := '';
      TraceLogWrite('[610] ???????? ?????? ???? - ????['+Trim(cbSelectCV.Text)+'], ????['+Trim(cbUpdateCV.Text)+']');
    end;
    2 : // ????
    begin
      if not (NowBuff  in [100..102, 110..112, 120..124, 130, 131, 140, 141, 150, 151, 160, 161, 170, 171, 180, 181, 190..194, 198, 199]) then Exit;
      TrackDelete(IntToStr(NowBuff));
      cbUpdateCV.Text := '';
      if NowBuff in [102, 112, 120] then BcrDataReset('1');
      TraceLogWrite('[610] ???????? ?????? ???? - ????['+Trim(cbSelectCV.Text)+']');
    end;
    3 : // ????
    begin
      if not (NowBuff  in [100..102, 110..112, 120..124, 130, 131, 140, 141, 150, 151, 160, 161, 170, 171, 180, 181, 190..194, 198, 199]) or
         not (NextBuff in [100..102, 110..112, 120..124, 130, 131, 140, 141, 150, 151, 160, 161, 170, 171, 180, 181, 190..194, 198, 199]) then Exit;
      if NowBuff = NextBuff then Exit;
      TrackDataChange(NowBuff, NextBuff);
      cbUpdateCV.Text := '';
      TraceLogWrite('[610] ???????? ?????? ???? - ????['+Trim(cbSelectCV.Text)+'], ????['+Trim(cbUpdateCV.Text)+']');
    end;
  end;
end;

//==============================================================================
// btnCVDataUpdateClick
//==============================================================================
procedure TfrmU610.btnCVDataUpdateClick(Sender: TObject);
var
  BuffNo : integer;
begin
  if      Trim(cbSelectCV.Text) = 'AC'  then
       BuffNo  := 198
  else if Trim(cbSelectCV.Text) = 'W/M' then
       BuffNo  := 199
  else BuffNo  := StrToIntDef(cbSelectCV.Text, 0);
  TrackDataUpdate('ITEM_TYPE', Trim(cbITEM_TYPE.Text), IntToStr(BuffNo));
  TrackDataUpdate('WRAP_YN'  , Trim(cbWRAP_YN.Text),   IntToStr(BuffNo));
  TraceLogWrite('[610] ???????? ?????? ???????? - ????['+IntToStr(BuffNo)+'], ????['+edtITEM_LOT.Text+'], ????['+Trim(cbITEM_TYPE.Text)+'], ????['+Trim(cbWRAP_YN.Text)+']');
end;

//==============================================================================
// TrackDataUpdate                                                            //
//==============================================================================
procedure TfrmU610.TrackDataUpdate(Field, Value, BuffNo: String);
var
  StrSQL : String ;
  ExecNo : integer;
begin
  try
    with qryCommand do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_TRACK ' +
                '    SET ' + Field + ' = ''' + Value + ''' ' +
                '  WHERE ID_BUFF = ' + BuffNo ;
      SQL.Text := StrSQL ;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
      begin
        OrderDataUpdate(Field, Value, BuffNo);
      end;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryCommand.Close;
      TraceLogWrite('[610] ???? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// OrderDataUpdate                                                            //
//==============================================================================
procedure TfrmU610.OrderDataUpdate(Field, Value, BuffNo: String);
var
  StrSQL : String;
begin
  try
    StrSQL := ' UPDATE TT_ORDER ' +
              '    SET ' + Field + ' = ''' + Value + ''' ' +
              '   FROM TT_ORDER O WITH (NOLOCK) ' +
              '   JOIN TT_TRACK T WITH (NOLOCK) ' +
              '     ON O.ID_DATE   = T.ID_DATE ' +
              '    AND O.ID_TIME   = T.ID_TIME ' +
              '    AND O.ID_INDEX  = T.ID_INDEX ' +
              '    AND O.ID_SUBIDX = T.ID_SUBIDX ' +
              '    AND T.ID_BUFF   = ' + BuffNo;

    with qryCommand do
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
      qryCommand.Close;
      TraceLogWrite('[610] ???? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// TrackDataMove                                                              //
//==============================================================================
procedure TfrmU610.TrackDataMove(nowBuff, nextBuff: Integer);
var
  StrSQL : String ;
begin
  try
    with qryCommand do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ' SELECT * FROM TT_TRACK WITH (NOLOCK) ' +
                  '  WHERE ID_BUFF = ' + IntToStr(nextBuff) +
                  '    AND ID_DATA = 0 ';
      Open;

      if not (Eof and Bof) then
      begin
        Close;
        SQL.Clear;
        StrSQL := ' UPDATE TT_TRACK ' +
                  ' SET ' +
                  ' ID_DATA      = HERE.ID_DATA, ' +
                  ' ID_DATE      = HERE.ID_DATE, ' +
                  ' ID_TIME      = HERE.ID_TIME, ' +
                  ' ID_TYPE      = HERE.ID_TYPE, ' +
                  ' ID_INDEX     = HERE.ID_INDEX, ' +
                  ' ID_SUBIDX    = HERE.ID_SUBIDX, ' +
                  ' ID_EMG       = HERE.ID_EMG, ' +
                  ' ID_SC        = HERE.ID_SC, ' +
                  ' ID_CODE      = HERE.ID_CODE, ' +
                  ' ID_BANK      = HERE.ID_BANK, ' +
                  ' ID_BAY       = HERE.ID_BAY, ' +
                  ' ID_LEVEL     = HERE.ID_LEVEL, ' +
                  ' KIND_1       = HERE.KIND_1, ' +
                  ' KIND_2       = HERE.KIND_2, ' +
                  ' KIND_3       = HERE.KIND_3, ' +
                  ' KIND_4       = HERE.KIND_4, ' +
                  ' KIND_5       = HERE.KIND_5, ' +
                  ' IN_SITE      = HERE.IN_SITE, ' + // ????????
                  ' IN_DATE      = HERE.IN_DATE, ' + // ????????
                  ' OT_SITE      = HERE.OT_SITE, ' + // ????????
                  ' OT_DATE      = HERE.OT_DATE, ' + // ????????
                  ' BCR_CHK      = HERE.BCR_CHK, ' +
                  ' STATUS       = HERE.STATUS, ' +
                  ' PROCESS      = HERE.PROCESS, ' +
                  ' ITEM_LOT     = HERE.ITEM_LOT, ' +
                  ' ITEM_TYPE    = HERE.ITEM_TYPE, ' +
                  ' ITEM_WEIGHT  = HERE.ITEM_WEIGHT, ' +
                  ' ITEM_QTY     = HERE.ITEM_QTY, ' +
                  ' ITEM_INFO_01 = HERE.ITEM_INFO_01, ' +
                  ' ITEM_INFO_02 = HERE.ITEM_INFO_02, ' +
                  ' ITEM_INFO_03 = HERE.ITEM_INFO_03, ' +
                  ' ITEM_INFO_04 = HERE.ITEM_INFO_04, ' +
                  ' ITEM_INFO_05 = HERE.ITEM_INFO_05, ' +
                  ' ITEM_INFO_06 = HERE.ITEM_INFO_06, ' +
                  ' ITEM_INFO_07 = HERE.ITEM_INFO_07, ' +
                  ' ITEM_INFO_08 = HERE.ITEM_INFO_08, ' +
                  ' ITEM_INFO_09 = HERE.ITEM_INFO_09, ' +
                  ' ITEM_INFO_10 = HERE.ITEM_INFO_10, ' +
                  ' ITEM_INFO_11 = HERE.ITEM_INFO_11, ' +
                  ' ITEM_INFO_12 = HERE.ITEM_INFO_12, ' +
                  ' ITEM_INFO_13 = HERE.ITEM_INFO_13, ' +
                  ' ITEM_INFO_14 = HERE.ITEM_INFO_14, ' +
                  ' ITEM_INFO_15 = HERE.ITEM_INFO_15, ' +
                  ' ITEM_INFO_16 = HERE.ITEM_INFO_16, ' +
                  ' ITEM_INFO_17 = HERE.ITEM_INFO_17, ' +
                  ' ITEM_INFO_18 = HERE.ITEM_INFO_18, ' +
                  ' ITEM_INFO_19 = HERE.ITEM_INFO_19, ' +
                  ' ITEM_INFO_20 = HERE.ITEM_INFO_20, ' +
                  ' PLT_CODE     = HERE.PLT_CODE, ' +
                  ' WRAP_YN      = HERE.WRAP_YN, ' +
                  ' MEMO_1       = HERE.MEMO_1, ' +
                  ' MEMO_2       = HERE.MEMO_2, ' +
                  ' MEMO_3       = HERE.MEMO_3, ' +
                  ' MEMO_4       = HERE.MEMO_4, ' +
                  ' MEMO_5       = HERE.MEMO_5, ' +
                  ' ID_USER      = HERE.ID_USER, ' +
                  ' UP_DT        = HERE.UP_DT, ' + // ???????? ????????
                  ' CR_DT        = HERE.CR_DT ' +                            // ???????? ????
                  ' FROM TT_TRACK NEXT, ' +
                  '      (SELECT * FROM TT_TRACK WITH (NOLOCK) ' +
                  '        WHERE ID_BUFF = ' + IntToStr(nowBuff) + ' AND ID_DATA = ''1'' ) HERE ' +
                  ' WHERE NEXT.ID_BUFF = ' + IntToStr(nextBuff)  + ' AND NEXT.ID_DATA = ''0'' ' ;
        SQL.Text := StrSQL ;
        if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;
        ExecSQL;

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
                  ' UP_DT        = '''' , ' + // ???????? ????????
                  ' CR_DT        = ''''   ' + // ???????? ????
                  ' WHERE ID_BUFF = ' + IntToStr(nowBuff) ;
        SQL.Text := StrSQL ;
        ExecSQL;
        if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
        Close;
      end;
    end;
  except
    on E: Exception do
    begin
      qryCommand.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[610] ???????? ?????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// TrackDelete                                                                //
//==============================================================================
procedure TfrmU610.TrackDelete(nowBuff: String);
var
  StrSQL : String ;
begin
  try
    with qryCommand do
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
                ' UP_DT        = '''' , ' + // ???????? ????????
                ' CR_DT        = ''''   ' + // ???????? ????
                ' WHERE ID_BUFF = ' + nowBuff ;
      SQL.Text := StrSQL ;
      ExecSQL;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryCommand.Close;
      TraceLogWrite('[610] ???????? ?????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// TrackDataChange                                                            //
//==============================================================================
procedure TfrmU610.TrackDataChange(nowBuff, nextBuff: Integer);
var
  StrSQL : String ;
begin
  try
    with qryCommand do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_TRACK_TEMP ' +
                ' SET ' +
                ' ID_DATA      = HERE.ID_DATA, ' +
                ' ID_DATE      = HERE.ID_DATE, ' +
                ' ID_TIME      = HERE.ID_TIME, ' +
                ' ID_TYPE      = HERE.ID_TYPE, ' +
                ' ID_INDEX     = HERE.ID_INDEX, ' +
                ' ID_SUBIDX    = HERE.ID_SUBIDX, ' +
                ' ID_EMG       = HERE.ID_EMG, ' +
                ' ID_SC        = HERE.ID_SC, ' +
                ' ID_CODE      = HERE.ID_CODE, ' +
                ' ID_BANK      = HERE.ID_BANK, ' +
                ' ID_BAY       = HERE.ID_BAY, ' +
                ' ID_LEVEL     = HERE.ID_LEVEL, ' +
                ' KIND_1       = HERE.KIND_1, ' +
                ' KIND_2       = HERE.KIND_2, ' +
                ' KIND_3       = HERE.KIND_3, ' +
                ' KIND_4       = HERE.KIND_4, ' +
                ' KIND_5       = HERE.KIND_5, ' +
                ' IN_SITE      = HERE.IN_SITE, ' + // ????????
                ' IN_DATE      = HERE.IN_DATE, ' + // ????????
                ' OT_SITE      = HERE.OT_SITE, ' + // ????????
                ' OT_DATE      = HERE.OT_DATE, ' + // ????????
                ' BCR_CHK      = HERE.BCR_CHK, ' +
                ' STATUS       = HERE.STATUS, ' +
                ' PROCESS      = HERE.PROCESS, ' +
                ' ITEM_LOT     = HERE.ITEM_LOT, ' +
                ' ITEM_TYPE    = HERE.ITEM_TYPE, ' +
                ' ITEM_WEIGHT  = HERE.ITEM_WEIGHT, ' +
                ' ITEM_QTY     = HERE.ITEM_QTY, ' +
                ' ITEM_INFO_01 = HERE.ITEM_INFO_01, ' +
                ' ITEM_INFO_02 = HERE.ITEM_INFO_02, ' +
                ' ITEM_INFO_03 = HERE.ITEM_INFO_03, ' +
                ' ITEM_INFO_04 = HERE.ITEM_INFO_04, ' +
                ' ITEM_INFO_05 = HERE.ITEM_INFO_05, ' +
                ' ITEM_INFO_06 = HERE.ITEM_INFO_06, ' +
                ' ITEM_INFO_07 = HERE.ITEM_INFO_07, ' +
                ' ITEM_INFO_08 = HERE.ITEM_INFO_08, ' +
                ' ITEM_INFO_09 = HERE.ITEM_INFO_09, ' +
                ' ITEM_INFO_10 = HERE.ITEM_INFO_10, ' +
                ' ITEM_INFO_11 = HERE.ITEM_INFO_11, ' +
                ' ITEM_INFO_12 = HERE.ITEM_INFO_12, ' +
                ' ITEM_INFO_13 = HERE.ITEM_INFO_13, ' +
                ' ITEM_INFO_14 = HERE.ITEM_INFO_14, ' +
                ' ITEM_INFO_15 = HERE.ITEM_INFO_15, ' +
                ' ITEM_INFO_16 = HERE.ITEM_INFO_16, ' +
                ' ITEM_INFO_17 = HERE.ITEM_INFO_17, ' +
                ' ITEM_INFO_18 = HERE.ITEM_INFO_18, ' +
                ' ITEM_INFO_19 = HERE.ITEM_INFO_19, ' +
                ' ITEM_INFO_20 = HERE.ITEM_INFO_20, ' +
                ' PLT_CODE     = HERE.PLT_CODE, ' +
                ' WRAP_YN      = HERE.WRAP_YN, ' +
                ' MEMO_1       = HERE.MEMO_1, ' +
                ' MEMO_2       = HERE.MEMO_2, ' +
                ' MEMO_3       = HERE.MEMO_3, ' +
                ' MEMO_4       = HERE.MEMO_4, ' +
                ' MEMO_5       = HERE.MEMO_5, ' +
                ' ID_USER      = HERE.ID_USER, ' +
                ' UP_DT        = HERE.UP_DT, ' + // ???????? ????????
                ' CR_DT        = HERE.CR_DT ' +                            // ???????? ????
                ' FROM TT_TRACK_TEMP NEXT, ' +
                '      (SELECT * FROM TT_TRACK WITH (NOLOCK) ' +
                '        WHERE ID_BUFF = ' + IntToStr(nowBuff) + ' ) HERE ' +
                ' WHERE NEXT.ID_BUFF = 999 ';
      SQL.Text := StrSQL ;
      if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;
      ExecSQL;

      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_TRACK ' +
                ' SET ' +
                ' ID_DATA      = HERE.ID_DATA, ' +
                ' ID_DATE      = HERE.ID_DATE, ' +
                ' ID_TIME      = HERE.ID_TIME, ' +
                ' ID_TYPE      = HERE.ID_TYPE, ' +
                ' ID_INDEX     = HERE.ID_INDEX, ' +
                ' ID_SUBIDX    = HERE.ID_SUBIDX, ' +
                ' ID_EMG       = HERE.ID_EMG, ' +
                ' ID_SC        = HERE.ID_SC, ' +
                ' ID_CODE      = HERE.ID_CODE, ' +
                ' ID_BANK      = HERE.ID_BANK, ' +
                ' ID_BAY       = HERE.ID_BAY, ' +
                ' ID_LEVEL     = HERE.ID_LEVEL, ' +
                ' KIND_1       = HERE.KIND_1, ' +
                ' KIND_2       = HERE.KIND_2, ' +
                ' KIND_3       = HERE.KIND_3, ' +
                ' KIND_4       = HERE.KIND_4, ' +
                ' KIND_5       = HERE.KIND_5, ' +
                ' IN_SITE      = HERE.IN_SITE, ' + // ????????
                ' IN_DATE      = HERE.IN_DATE, ' + // ????????
                ' OT_SITE      = HERE.OT_SITE, ' + // ????????
                ' OT_DATE      = HERE.OT_DATE, ' + // ????????
                ' BCR_CHK      = HERE.BCR_CHK, ' +
                ' STATUS       = HERE.STATUS, ' +
                ' PROCESS      = HERE.PROCESS, ' +
                ' ITEM_LOT     = HERE.ITEM_LOT, ' +
                ' ITEM_TYPE    = HERE.ITEM_TYPE, ' +
                ' ITEM_WEIGHT  = HERE.ITEM_WEIGHT, ' +
                ' ITEM_QTY     = HERE.ITEM_QTY, ' +
                ' ITEM_INFO_01 = HERE.ITEM_INFO_01, ' +
                ' ITEM_INFO_02 = HERE.ITEM_INFO_02, ' +
                ' ITEM_INFO_03 = HERE.ITEM_INFO_03, ' +
                ' ITEM_INFO_04 = HERE.ITEM_INFO_04, ' +
                ' ITEM_INFO_05 = HERE.ITEM_INFO_05, ' +
                ' ITEM_INFO_06 = HERE.ITEM_INFO_06, ' +
                ' ITEM_INFO_07 = HERE.ITEM_INFO_07, ' +
                ' ITEM_INFO_08 = HERE.ITEM_INFO_08, ' +
                ' ITEM_INFO_09 = HERE.ITEM_INFO_09, ' +
                ' ITEM_INFO_10 = HERE.ITEM_INFO_10, ' +
                ' ITEM_INFO_11 = HERE.ITEM_INFO_11, ' +
                ' ITEM_INFO_12 = HERE.ITEM_INFO_12, ' +
                ' ITEM_INFO_13 = HERE.ITEM_INFO_13, ' +
                ' ITEM_INFO_14 = HERE.ITEM_INFO_14, ' +
                ' ITEM_INFO_15 = HERE.ITEM_INFO_15, ' +
                ' ITEM_INFO_16 = HERE.ITEM_INFO_16, ' +
                ' ITEM_INFO_17 = HERE.ITEM_INFO_17, ' +
                ' ITEM_INFO_18 = HERE.ITEM_INFO_18, ' +
                ' ITEM_INFO_19 = HERE.ITEM_INFO_19, ' +
                ' ITEM_INFO_20 = HERE.ITEM_INFO_20, ' +
                ' PLT_CODE     = HERE.PLT_CODE, ' +
                ' WRAP_YN      = HERE.WRAP_YN, ' +
                ' MEMO_1       = HERE.MEMO_1, ' +
                ' MEMO_2       = HERE.MEMO_2, ' +
                ' MEMO_3       = HERE.MEMO_3, ' +
                ' MEMO_4       = HERE.MEMO_4, ' +
                ' MEMO_5       = HERE.MEMO_5, ' +
                ' ID_USER      = HERE.ID_USER, ' +
                ' UP_DT        = HERE.UP_DT, ' + // ???????? ????????
                ' CR_DT        = HERE.CR_DT ' +                            // ???????? ????
                ' FROM TT_TRACK NEXT, ' +
                '      (SELECT * FROM TT_TRACK WITH (NOLOCK) ' +
                '        WHERE ID_BUFF = ' + IntToStr(nextBuff) + ' ) HERE ' +
                ' WHERE NEXT.ID_BUFF = ' + IntToStr(NowBuff) ;
      SQL.Text := StrSQL ;
      ExecSQL;

      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_TRACK ' +
                ' SET ' +
                ' ID_DATA      = HERE.ID_DATA, ' +
                ' ID_DATE      = HERE.ID_DATE, ' +
                ' ID_TIME      = HERE.ID_TIME, ' +
                ' ID_TYPE      = HERE.ID_TYPE, ' +
                ' ID_INDEX     = HERE.ID_INDEX, ' +
                ' ID_SUBIDX    = HERE.ID_SUBIDX, ' +
                ' ID_EMG       = HERE.ID_EMG, ' +
                ' ID_SC        = HERE.ID_SC, ' +
                ' ID_CODE      = HERE.ID_CODE, ' +
                ' ID_BANK      = HERE.ID_BANK, ' +
                ' ID_BAY       = HERE.ID_BAY, ' +
                ' ID_LEVEL     = HERE.ID_LEVEL, ' +
                ' KIND_1       = HERE.KIND_1, ' +
                ' KIND_2       = HERE.KIND_2, ' +
                ' KIND_3       = HERE.KIND_3, ' +
                ' KIND_4       = HERE.KIND_4, ' +
                ' KIND_5       = HERE.KIND_5, ' +
                ' IN_SITE      = HERE.IN_SITE, ' + // ????????
                ' IN_DATE      = HERE.IN_DATE, ' + // ????????
                ' OT_SITE      = HERE.OT_SITE, ' + // ????????
                ' OT_DATE      = HERE.OT_DATE, ' + // ????????
                ' BCR_CHK      = HERE.BCR_CHK, ' +
                ' STATUS       = HERE.STATUS, ' +
                ' PROCESS      = HERE.PROCESS, ' +
                ' ITEM_LOT     = HERE.ITEM_LOT, ' +
                ' ITEM_TYPE    = HERE.ITEM_TYPE, ' +
                ' ITEM_WEIGHT  = HERE.ITEM_WEIGHT, ' +
                ' ITEM_QTY     = HERE.ITEM_QTY, ' +
                ' ITEM_INFO_01 = HERE.ITEM_INFO_01, ' +
                ' ITEM_INFO_02 = HERE.ITEM_INFO_02, ' +
                ' ITEM_INFO_03 = HERE.ITEM_INFO_03, ' +
                ' ITEM_INFO_04 = HERE.ITEM_INFO_04, ' +
                ' ITEM_INFO_05 = HERE.ITEM_INFO_05, ' +
                ' ITEM_INFO_06 = HERE.ITEM_INFO_06, ' +
                ' ITEM_INFO_07 = HERE.ITEM_INFO_07, ' +
                ' ITEM_INFO_08 = HERE.ITEM_INFO_08, ' +
                ' ITEM_INFO_09 = HERE.ITEM_INFO_09, ' +
                ' ITEM_INFO_10 = HERE.ITEM_INFO_10, ' +
                ' ITEM_INFO_11 = HERE.ITEM_INFO_11, ' +
                ' ITEM_INFO_12 = HERE.ITEM_INFO_12, ' +
                ' ITEM_INFO_13 = HERE.ITEM_INFO_13, ' +
                ' ITEM_INFO_14 = HERE.ITEM_INFO_14, ' +
                ' ITEM_INFO_15 = HERE.ITEM_INFO_15, ' +
                ' ITEM_INFO_16 = HERE.ITEM_INFO_16, ' +
                ' ITEM_INFO_17 = HERE.ITEM_INFO_17, ' +
                ' ITEM_INFO_18 = HERE.ITEM_INFO_18, ' +
                ' ITEM_INFO_19 = HERE.ITEM_INFO_19, ' +
                ' ITEM_INFO_20 = HERE.ITEM_INFO_20, ' +
                ' PLT_CODE     = HERE.PLT_CODE, ' +
                ' WRAP_YN      = HERE.WRAP_YN, ' +
                ' MEMO_1       = HERE.MEMO_1, ' +
                ' MEMO_2       = HERE.MEMO_2, ' +
                ' MEMO_3       = HERE.MEMO_3, ' +
                ' MEMO_4       = HERE.MEMO_4, ' +
                ' MEMO_5       = HERE.MEMO_5, ' +
                ' ID_USER      = HERE.ID_USER, ' +
                ' UP_DT        = HERE.UP_DT, ' + // ???????? ????????
                ' CR_DT        = HERE.CR_DT ' +                            // ???????? ????
                ' FROM TT_TRACK NEXT, ' +
                '      (SELECT * FROM TT_TRACK_TEMP WITH (NOLOCK) ' +
                '        WHERE ID_BUFF = 999 ) HERE ' +
                ' WHERE NEXT.ID_BUFF = ' + IntToStr(NextBuff) ;
      SQL.Text := StrSQL ;
      ExecSQL;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
      Close;
    end;
  except
    on E: Exception do
    begin
      qryCommand.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      TraceLogWrite('[610] ???????? ?????? ???? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// btnBCRUpdateClick                                                          //
//==============================================================================
procedure TfrmU610.btnBCRUpdateClick(Sender: TObject);
var
  jobIdx : integer;
  BcrData, TmpStr : String;
begin
  jobIdx := (Sender as TButton).Tag;
  if jobIdx = 1 then
  begin
    BcrData := edtInBCRDataInput.Text;
    TmpStr := '??????????';
  end else
  begin
    BcrData := edtOtBCRDataInput.Text;
    TmpStr := '??????????';
  end;
  BcrDataUpdate(IntToStr(jobIdx), BcrData);
  Main.BarcodeData[jobIdx][1] := BcrData;
  Main.BarcodeData[jobIdx][2] := '';
  TraceLogWrite('[610] ?????? ?????? ???????? - ????['+TmpStr+'], ??????['+BcrData+']');
end;

//==============================================================================
// BcrDataUpdate                                                              //
//==============================================================================
procedure TfrmU610.BcrDataUpdate(BcrNo, BcrData: String);
var
  StrSQL, WhereStr : String;
begin
  try
    if BcrData = '' then
         WhereStr := ''
    else WhereStr := ', BCRDATA = ''' + BcrData + ''' ' ;

    with qryCommand do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_BCRR ' +
                '    SET FLAG    = ''0'' ' +
                '      , COMMAND = ''2'' ' +
                '      , MEMO_1  = ''''  ' +
                '      , MEMO_2  = ''''  ' +
                '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' + WhereStr +
                '  WHERE BCRNO = ''' + BcrNo + ''' ';
      SQL.Text := StrSQL;
      ExecSQL;

      // ???? ???????? ???? ???? ???? ????
      if BcrNo = '1' then
      begin
        frmMain.BcrProcess('1', BcrData);
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryCommand.Close;
      TraceLogWrite('[610] ?????? ?????? ???????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;


//==============================================================================
// BcrDataReset                                                               //
//==============================================================================
procedure TfrmU610.BcrDataReset(BcrNo: String);
var
  StrSQL : String;
begin
  try
    with qryCommand do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_BCRR ' +
                '    SET BCRDATA = '''' ' +
                '      , FLAG    = ''1'' ' +
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
      qryCommand.Close;
      TraceLogWrite('[610] ?????? ???? ?????? - ????['+E.Message+'], ????['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// ScioClear                                                                  //
//==============================================================================
procedure TfrmU610.ScioClear(ScNo: integer);
begin
  DBSCIO[ScNo].ID_DATE      := '';
  DBSCIO[ScNo].ID_TIME      := '';
  DBSCIO[ScNo].ID_INDEX     := 0;
  DBSCIO[ScNo].ID_SUBIDX    := 0;
  DBSCIO[ScNo].IO_TYPE      := '';
  DBSCIO[ScNo].ID_SC        := '';
  DBSCIO[ScNo].LOAD_BANK    := '';
  DBSCIO[ScNo].LOAD_BAY     := '';
  DBSCIO[ScNo].LOAD_LEVEL   := '';
  DBSCIO[ScNo].UNLOAD_BANK  := '';
  DBSCIO[ScNo].UNLOAD_BAY   := '';
  DBSCIO[ScNo].UNLOAD_LEVEL := '';
  DBSCIO[ScNo].SC_STATUS    := '';
  DBSCIO[ScNo].CR_DT        := '';
end;

//==============================================================================
// ScRcClear                                                                  //
//==============================================================================
procedure TfrmU610.ScRcClear(ScNo: integer);
begin
  DBSCRC[ScNo].ForkCenter     := ''; // 7 Bit : ????????
  DBSCRC[ScNo].ForkTrayExist  := ''; // 8 Bit : ????????
  DBSCRC[ScNo].ReturnFinish   := ''; // A Bit : ????????
  DBSCRC[ScNo].WorkReady      := ''; // B Bit : ????????
  DBSCRC[ScNo].MachineAction  := ''; // C Bit : ????????
  DBSCRC[ScNo].MachineTrouble := ''; // D Bit : ????????
  DBSCRC[ScNo].WorkMode       := ''; // E Bit : ????????(1:????)
  DBSCRC[ScNo].MachinePower   := ''; // F Bit : ????????
  DBSCRC[ScNo].Bay            := 0;  // ?? ????
  DBSCRC[ScNo].Level          := 0;  // ?? ????
  DBSCRC[ScNo].Error          := 0;  // ????
end;

//==============================================================================
// TrackInfoClear                                                             //
//==============================================================================
procedure TfrmU610.TrackInfoClear(BuffNo: integer);
begin
  BuffData[BuffNo].ID_DATE      := '';
  BuffData[BuffNo].ID_TIME      := '';
  BuffData[BuffNo].ID_TYPE      := '';
  BuffData[BuffNo].ID_INDEX     := 0;
  BuffData[BuffNo].ID_SUBIDX    := 0;
  BuffData[BuffNo].ID_EMG       := 0;
  BuffData[BuffNo].ID_SC        := '';
  BuffData[BuffNo].ID_CODE      := '';
  BuffData[BuffNo].ID_BANK      := '';
  BuffData[BuffNo].ID_BAY       := '';
  BuffData[BuffNo].ID_LEVEL     := '';
  BuffData[BuffNo].KIND_1       := '';
  BuffData[BuffNo].KIND_2       := '';
  BuffData[BuffNo].KIND_3       := '';
  BuffData[BuffNo].KIND_4       := '';
  BuffData[BuffNo].KIND_5       := '';
  BuffData[BuffNo].IN_SITE      := '';
  BuffData[BuffNo].IN_DATE      := '';
  BuffData[BuffNo].OT_SITE      := '';
  BuffData[BuffNo].OT_DATE      := '';
  BuffData[BuffNo].BCR_CHK      := 0;
  BuffData[BuffNo].STATUS       := '';
  BuffData[BuffNo].PROCESS      := '';
  BuffData[BuffNo].ITEM_LOT     := '';
  BuffData[BuffNo].ITEM_TYPE    := '';
  BuffData[BuffNo].ITEM_WEIGHT  := '0';
  BuffData[BuffNo].ITEM_QTY     := '0';
  BuffData[BuffNo].ITEM_INFO_01 := '';
  BuffData[BuffNo].ITEM_INFO_02 := '';
  BuffData[BuffNo].ITEM_INFO_03 := '';
  BuffData[BuffNo].ITEM_INFO_04 := '';
  BuffData[BuffNo].ITEM_INFO_05 := '';
  BuffData[BuffNo].ITEM_INFO_06 := '';
  BuffData[BuffNo].ITEM_INFO_07 := '';
  BuffData[BuffNo].ITEM_INFO_08 := '';
  BuffData[BuffNo].ITEM_INFO_09 := '';
  BuffData[BuffNo].ITEM_INFO_10 := '';
  BuffData[BuffNo].ITEM_INFO_11 := '';
  BuffData[BuffNo].ITEM_INFO_12 := '';
  BuffData[BuffNo].ITEM_INFO_13 := '';
  BuffData[BuffNo].ITEM_INFO_14 := '';
  BuffData[BuffNo].ITEM_INFO_15 := '';
  BuffData[BuffNo].ITEM_INFO_16 := '';
  BuffData[BuffNo].ITEM_INFO_17 := '';
  BuffData[BuffNo].ITEM_INFO_18 := '';
  BuffData[BuffNo].ITEM_INFO_19 := '';
  BuffData[BuffNo].ITEM_INFO_20 := '';
  BuffData[BuffNo].PLT_CODE     := '';
  BuffData[BuffNo].WRAP_YN      := '';
  BuffData[BuffNo].MEMO_1       := '';
  BuffData[BuffNo].MEMO_2       := '';
  BuffData[BuffNo].MEMO_3       := '';
  BuffData[BuffNo].MEMO_4       := '';
  BuffData[BuffNo].MEMO_5       := '';
  BuffData[BuffNo].ID_USER      := '';
  BuffData[BuffNo].UP_DT        := '';
  BuffData[BuffNo].CR_DT        := '';
end;

//==============================================================================
// Scb1Resize
//==============================================================================
procedure TfrmU610.Scb1Resize(Sender: TObject);
begin
  SendMessage(scb1.Handle, WM_VSCROLL, SB_TOP, 0);
  scb1.Perform(WM_VSCROLL, SB_TOP, 0);
  SendMessage(scb1.Handle, WM_HSCROLL, SB_LEFT, 0);
  scb1.Perform(WM_HSCROLL, SB_LEFT, 0);
end;

//==============================================================================
// pcSCChange                                                                 //
//==============================================================================
procedure TfrmU610.pcSCChange(Sender: TObject);
begin
  SelectedSC := pcSc.ActivePageIndex + 1;
  SccStatusDisplayPanel(SelectedSC);
end;

//==============================================================================
// SCStatusClick                                                              //
//==============================================================================
procedure TfrmU610.SCInfoClick(Sender: TObject);
begin
  SelectedSC := (Sender as TPanel).Tag;
  SccStatusDisplayPanel(SelectedSC);
  pcSC.ActivePageIndex := SelectedSC - 1; // ?????????????? ????
end;

//==============================================================================
// cbITEM_TYPEChange                                                          //
//==============================================================================
procedure TfrmU610.cbITEM_TYPEChange(Sender: TObject);
begin
  if (Sender as TComboBox).Text = '????' then
       cbWRAP_YN.Text := 'Y'
  else cbWRAP_YN.Text := 'N';
end;

//==============================================================================
// pnlEmerOffDblClick                                                         //
//==============================================================================
procedure TfrmU610.pnlEmerOffDblClick(Sender: TObject);
begin
  if not pnlEmergency.Visible then Exit;
  if MessageDlg(' ???????? ?????????? ???? ?????????????', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;
  InsertCVACOrder('CV', 'W', IntToStr(200), 'E', '0');
  TraceLogWrite('[610] ???????? ???? - ????[200], ????[????????]');
end;

//==============================================================================
// btnBcrClearClick                                                         //
//==============================================================================
procedure TfrmU610.btnBcrClearClick(Sender: TObject);
begin
  BcrDataReset(IntToStr((Sender as TButton).Tag));
  if IntToStr((Sender as TButton).Tag) = '1' then
       TraceLogWrite('[610] ?????? ?????? ?????? - ????[??????????]')
  else TraceLogWrite('[610] ?????? ?????? ?????? - ????[??????????]');
end;


end.
