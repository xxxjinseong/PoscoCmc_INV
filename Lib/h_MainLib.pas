unit h_MainLib;

interface

uses inifiles,Windows, Sysutils, ExtCtrls, ADODB, ScktComp, Graphics ;

Const
  LogFileName  : String = '.\Log\Monitoring.Log';
  INI_PATH : String = 'AwHouse.INI';
  MenuCount = 6;

  START_SCNO = 1 ; // Start SC No
  End_SCNO   = 3 ; // End SC No

  SPACE     = #$20;
  BACKSPACE = #8 ;
  DEL       = #48;
  STX       = #2 ;
  ETX       = #3 ;
  CR        = #13;   //D
  LF        = #10;   //A
  ACK       = #6 ;
  NAK       = #21;
  Enq       = #5 ;

  SC_IN_BUFF : Array [1..3] of integer = (141, 151, 181);
  SC_OT_BUFF : Array [1..3] of integer = (130, 160, 170);

  AC_IN_BUFF : Array [1..3] of integer = (140, 150, 180);
  AC_OT_BUFF : Array [1..3] of integer = (131, 161, 171);
  AC_POS     : Array [0..7] of integer = (433, 393, 309, 266, 182, 139, 55, 15);

  AC_BUFF : Array [1..8] of integer = (131, 124, 161, 171, 140, 150, 190, 180);

  BCR_LINE_BUFF : Array [1..3] of integer = (102, 112, 120);

  CELL_MAX_BANK  = 6;
  CELL_MAX_BAY   = 12;
  CELL_MAX_LEVEL = 8;


  //========================================================================
  // ?????? ???? ??ư Tag??
  //========================================================================
  MSG_MDI_WIN_ADD     = 11 ; // ?ű?
  MSG_MDI_WIN_EXCEL   = 12 ; // ????
  MSG_MDI_WIN_DELETE  = 13 ; // ????
  MSG_MDI_WIN_PRINT   = 14 ; // ?μ?
  MSG_MDI_WIN_QUERY   = 15 ; // ??ȸ
  MSG_MDI_WIN_CLOSE   = 18 ; // ?ݱ?

type
  TStatus = (START, STANDBY, READY, ORDER, RETURN, CLEAR, RESET, ERR) ;

  TPopupData = Record
    DATA01, DATA02, DATA03, DATA04, DATA05, DATA06, DATA07, DATA08, DATA09, DATA10 : String;
    WEIGHT, QTY : integer;
    ResultCd : String;
    PopupType, PopupMsg,PopupRc : String;
    tmOn : Boolean;
  end;

  TMachUsed = Record
	  In_Used    : Boolean;
	  Ot_Used    : Boolean;
  end;

  TTORDER = Record
    ID_DATE      : String;
	  ID_TIME      : String;
	  ID_TYPE      : String;
	  ID_INDEX     : integer;
	  ID_SUBIDX    : integer;
	  ID_EMG       : integer;
	  ID_SC        : String;
	  ID_CODE      : String;
	  LOAD_BANK    : String;
	  LOAD_BAY     : String;
	  LOAD_LEVEL   : String;
	  UNLOAD_BANK  : String;
	  UNLOAD_BAY   : String;
	  UNLOAD_LEVEL : String;
	  KIND_1       : String;
	  KIND_2       : String;
	  KIND_3       : String;
	  KIND_4       : String;
	  KIND_5       : String;
	  NOW_SITE     : String;
	  NOW_MACH     : String;
	  IN_SITE      : String;
	  IN_DATE      : String;
	  OT_SITE      : String;
	  OT_DATE      : String;
	  BCR_CHK      : integer;
	  STATUS       : String;
	  PROCESS      : String;
	  ITEM_LOT     : String;
	  ITEM_TYPE    : String;
	  ITEM_WEIGHT  : String;
	  ITEM_QTY     : String;
	  ITEM_INFO_01 : String;
	  ITEM_INFO_02 : String;
	  ITEM_INFO_03 : String;
	  ITEM_INFO_04 : String;
	  ITEM_INFO_05 : String;
	  ITEM_INFO_06 : String;
	  ITEM_INFO_07 : String;
	  ITEM_INFO_08 : String;
	  ITEM_INFO_09 : String;
	  ITEM_INFO_10 : String;
	  ITEM_INFO_11 : String;
	  ITEM_INFO_12 : String;
	  ITEM_INFO_13 : String;
	  ITEM_INFO_14 : String;
	  ITEM_INFO_15 : String;
	  ITEM_INFO_16 : String;
	  ITEM_INFO_17 : String;
	  ITEM_INFO_18 : String;
	  ITEM_INFO_19 : String;
	  ITEM_INFO_20 : String;
	  PLT_CODE     : String;
	  WRAP_YN      : String;
	  MEMO_1       : String;
	  MEMO_2       : String;
	  MEMO_3       : String;
	  MEMO_4       : String;
	  MEMO_5       : String;
	  ID_USER      : String;
	  END_YN       : String;
	  SEND_YN      : String;
	  OR_DT        : String;
	  UP_DT        : String;
	  CR_DT        : String;
  end;

  TTRACKInfo = Record
    ID_DATE      : String;
    ID_TIME      : String;
    ID_TYPE      : String;
    ID_INDEX     : integer;
    ID_SUBIDX    : integer;
    ID_EMG       : integer;
    ID_SC        : String;
    ID_CODE      : String;
    ID_BANK      : String;
    ID_BAY       : String;
    ID_LEVEL     : String;
    KIND_1       : String;
    KIND_2       : String;
    KIND_3       : String;
    KIND_4       : String;
    KIND_5       : String;
    IN_SITE      : String;
    IN_DATE      : String;
    OT_SITE      : String;
    OT_DATE      : String;
    BCR_CHK      : integer;
    STATUS       : String;
    PROCESS      : String;
    ITEM_LOT     : String;
    ITEM_TYPE    : String;
    ITEM_WEIGHT  : String;
    ITEM_QTY     : String;
    ITEM_INFO_01 : String;
    ITEM_INFO_02 : String;
    ITEM_INFO_03 : String;
    ITEM_INFO_04 : String;
    ITEM_INFO_05 : String;
    ITEM_INFO_06 : String;
    ITEM_INFO_07 : String;
    ITEM_INFO_08 : String;
    ITEM_INFO_09 : String;
    ITEM_INFO_10 : String;
    ITEM_INFO_11 : String;
    ITEM_INFO_12 : String;
    ITEM_INFO_13 : String;
    ITEM_INFO_14 : String;
    ITEM_INFO_15 : String;
    ITEM_INFO_16 : String;
    ITEM_INFO_17 : String;
    ITEM_INFO_18 : String;
    ITEM_INFO_19 : String;
    ITEM_INFO_20 : String;
    PLT_CODE     : String;
    WRAP_YN      : String;
    MEMO_1       : String;
    MEMO_2       : String;
    MEMO_3       : String;
    MEMO_4       : String;
    MEMO_5       : String;
    ID_USER      : String;
    UP_DT        : String;
    CR_DT        : String;
  End;

  TITEMInfo = Record
    ITEM_TYPE    : String;
    ITEM_WEIGHT  : String;
    ITEM_QTY     : String;
    ITEM_INFO_01 : String;
    ITEM_INFO_02 : String;
    ITEM_INFO_03 : String;
    ITEM_INFO_04 : String;
    ITEM_INFO_05 : String;
    ITEM_INFO_06 : String;
    ITEM_INFO_07 : String;
    ITEM_INFO_08 : String;
    ITEM_INFO_09 : String;
    ITEM_INFO_10 : String;
    ITEM_INFO_11 : String;
    ITEM_INFO_12 : String;
    ITEM_INFO_13 : String;
    ITEM_INFO_14 : String;
    ITEM_INFO_15 : String;
    ITEM_INFO_16 : String;
    ITEM_INFO_17 : String;
    ITEM_INFO_18 : String;
    ITEM_INFO_19 : String;
    ITEM_INFO_20 : String;
  End;

  TSCRC = Record
    ForkCenter     : String;
    ForkTrayExist  : String;
    ReturnFinish   : String;
    WorkReady      : String;
    MachineAction  : String;
    MachineTrouble : String;
    WorkMode       : String;
    MachinePower   : String;
    Bay            : integer;
    Level          : integer;
    Error          : integer;
  End;

  TSCIO = Record
    ID_DATE      : String;
    ID_TIME      : String;
    ID_INDEX     : integer;
    ID_SUBIDX    : integer;
    IO_TYPE      : String;
    ID_SC        : String;
    LOAD_BANK    : String;
    LOAD_BAY     : String;
    LOAD_LEVEL   : String;
    UNLOAD_BANK  : String;
    UNLOAD_BAY   : String;
    UNLOAD_LEVEL : String;
    SC_STATUS    : String;
    CR_DT        : String;
  End;

  Main_Info = Record
    MainHd   : Hwnd;
    IdPass   : Boolean;
    ConChk   : Boolean ;
    MenuName, MenuNumber, MenuTitle  : String ;
    UserCode, UserName, UserPwd, UserAdmin, UserETC1, UserETC2 : String;
    DbOle, DbType, DbUser, DbPswd, DbAlais, DbFile  : String;
    WMS_NO : String;
    Popup_ItemInfo : TPopupData;
  end;

  Form_Info = Record
    Mainhd  : HWND ;
    ConnectionType : String;
    Menu_Name, Menu_Number, Menu_Title  : String ;
  End;

  TCVR = Record
   Case Integer of
    1 : (All : Array [1..6] of AnsiChar);
    2 : (
      CargoExist     : AnsiChar;
      StraightFinish : AnsiChar;
      LeftFinish     : AnsiChar; // Fork
      RightFinish    : AnsiChar; // Join
      ByPassFinish   : AnsiChar;
      PosCenter      : AnsiChar; // ????ġ
    )
  End;

  TOP = Record
   Case Integer of
    1 : (All : Array [1..7] of AnsiChar);
    2 : (
      Auto   : AnsiChar;
      Semi   : AnsiChar;
      Manu   : AnsiChar;
      Erro   : AnsiChar;
      Emer   : AnsiChar;
      RRun1  : AnsiChar;
      RRun2  : AnsiChar;
    )
  End;

  TSC = Record
   Case Integer of
    1 : (All : Array [1..2] of AnsiChar);
    2 : (
      InReady  : AnsiChar;
      OutReady : AnsiChar;
    )
  End;

  TAC = Record
   Case Integer of
    1 : (All : Array [1..27] of AnsiChar);
    2 : (
      Ready     : Array [1..8] of AnsiChar; // ?۾??? Ready
      OtSensor  : Array [1..8] of AnsiChar; // ?۾??? ???Ⱘ??
      AC_Auto   : AnsiChar;                 // ?ڵ?
      AC_Manu   : AnsiChar;                 // ????
      AC_Emer   : AnsiChar;                 // ????????
      AC_Ready  : AnsiChar;                 // ????ī Ready
      AC_Run    : AnsiChar;                 // ?۾???
      AC_Error  : AnsiChar;                 // ????
      AC_Cargo  : AnsiChar;                 // ȭ????
      AC_LCPL   : AnsiChar;                 // ?ε??Ϸ?
      AC_UCPL   : AnsiChar;                 // ???ε??Ϸ?
      DoorOpen1 : AnsiChar;                 // ???? ?潺 DOOR OPEN (H.P)
      DoorOpen2 : AnsiChar;                 // ???? ?潺 DOOR OPEN (O.P)
    )
  End;

  TRM = Record
   Case Integer of
    1 : (All : Array [1..7] of AnsiChar);
    2 : (
      RM1_RUN_CMD : AnsiChar;   // ??????1 ???? RUN CMD
      RM1_FEED_BK : AnsiChar;   // ??????1 ?԰? RUN FEED BANK
      RM1_DOOR    : AnsiChar;   // ??????1 DOOR OPEN
      RM2_RUN_CMD : AnsiChar;   // ??????2 ???? RUN CMD
      RM2_FEED_BK : AnsiChar;   // ??????2 ?԰? RUN FEED BANK
      RM2_DOOR    : AnsiChar;   // ??????2 DOOR OPEN
      RM_EMER     : AnsiChar;   // ?????? ????????
    )
  End;

  TDR = Record
   Case Integer of
    1 : (All : Array [1..9] of AnsiChar);
    2 : (
    IN_DR_RDY : AnsiChar;  // ?԰????? DOOR READY
    IN_DR_RUN : AnsiChar;  // ?԰????? DOOR RUNNING
    IN_DR_UPL : AnsiChar;  // ?԰????? DOOR FULL UP LIMIT
    IN_DR_DWL : AnsiChar;  // ?԰????? DOOR FULL DOWN LIMIT
    OT_DR_RDY : AnsiChar;  // ???????? DOOR READY
    OT_DR_RUN : AnsiChar;  // ???????? DOOR RUNNING
    OT_DR_UPL : AnsiChar;  // ???????? DOOR FULL UP LIMIT
    OT_DR_DWL : AnsiChar;  // ???????? DOOR FULL DOWN LIMIT
    AGV_LOCK  : AnsiChar;  // AGV CV120 LOCK ??û????
    )
  End;

  TSDR = Record
   Case Integer of
    1 : (All : Array [1..2] of AnsiChar);
    2 : (
    SDoor1 : AnsiChar;
    SDoor2 : AnsiChar;
    )
  End;

  TWP = Record
   Case Integer of
    1 : (All : Array [1..4] of AnsiChar);
    2 : (
    WP_MANUAL_CENTER : AnsiChar;  // WRAPPING MACHINE ???? ????ġ ????
    WP_READY         : AnsiChar;  // WRAPPING MACHINE ?ڵ? ?غ? ????
    WP_JOB_COMPLETE  : AnsiChar;  // WRAPPING MACHINE ???οϷ?
    WP_EMER          : AnsiChar;  // WRAPPING MACHINE ????????
    )
  End;

  TCVCR = Record
  case Integer of
    1 : (All : Array [0..1268] of AnsiChar);
    2 : (
      OP     : Array [ 1..  2 ] of TOP;    //   2 *  7 =   14 Byte 2019.04.10 Update
      BUFF   : Array [ 0..199 ] of TCVR;   // 200 *  6 = 1200 Byte 2019.04.19 Update
      SC     : Array [ 1..  3 ] of TSC;    //   3 *  2 =    6 Byte 2019.04.10 Update
      AC     : TAC;                        //   1 * 27 =   27 Byte 2019.04.19 Update
      ROOM   : TRM;                        //   1 *  7 =    7 Byte 2019.05.16 Update
      DOOR   : TDR;                        //   1 *  9 =    9 Byte 2019.05.16 Update
      WRAP   : TWP;                        //   1 *  4 =    4 Byte 2019.04.19 Update
      SDoor  : TSDR;                       //   1*   2 =    2 Byte 2019.09.27 Update
   )
  end;

  TCVW = Record
   Case Integer of
    1 : (All : Array [1..4] of AnsiChar);
    2 : (
      StraightOrder  : AnsiChar;
      LeftOrder      : AnsiChar; // Fork
      RightOrder     : AnsiChar; // Join
      ByPass         : Ansichar;
    )
  End;

  TACW = Record
   Case Integer of
    1 : (All : Array [1..13] of AnsiChar);
    2 : (
      AC_JobPos : Array [1..8] of AnsiChar;
      AC_Order  : AnsiChar;
      AC_Cancel : AnsiChar;
      AC_Retry  : AnsiChar;
      AC_Reset  : AnsiChar;
      AC_Home   : AnsiChar;
    )
  End;

  TCVCW = Record
   Case Integer of
    1 : (All : Array [1..817] of AnsiChar);
    2 : (
      BUFF : Array [0..199] of TCVW;  // 200 * 4 = 800
      AC   : TACW;                    //  13 * 1 = 13
      E_STOP        : AnsiChar;       //   1
      F_RESET       : AnsiChar;       //   1
      RM1_READ_CONF : AnsiChar;       //   1
      RM2_READ_CONF : AnsiChar;       //   1
    )
  End;

  TCV = Record
    Case Integer of
      1 : (All : Array[1..2086] of AnsiChar);
      2 : (
        Read  : TCVCR; // 1269
        Write : TCVCW; //  817
      )
  end;

implementation

end.
