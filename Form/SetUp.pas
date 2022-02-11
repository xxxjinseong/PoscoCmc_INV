unit SetUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, d_MainDm, h_MainLib, h_ReferLib,
  DB, ADODB, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.Mask, Vcl.DBCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Imaging.pngimage, CPortCtl;

type
  TfrmSetUpBox = class(TForm)
    Pnl_Main: TPanel;
    Pnl_Sub: TPanel;
    Pnl_Top: TPanel;
    Pnl_BTN: TPanel;
    Pnl_Btn5: TPanel;
    btnClose: TSpeedButton;
    Pnl_Btn0: TPanel;
    btnSave: TSpeedButton;
    Panel24: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    PnlFormName: TPanel;
    Panel16: TPanel;
    qryCommand: TADOQuery;
    qrySearch: TADOQuery;
    Panel10: TPanel;
    btnQry: TSpeedButton;
    qryInfo: TADOQuery;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel43: TPanel;
    Panel46: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Image16: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel9: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel23: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel29: TPanel;
    IN_SC2: TComboBox;
    OT_SC2: TComboBox;
    IN_SC3: TComboBox;
    OT_SC3: TComboBox;
    IN_CV1: TComboBox;
    OT_CV1: TComboBox;
    IN_SC1: TComboBox;
    OT_SC1: TComboBox;
    Panel3: TPanel;
    Image4: TImage;
    Label5: TLabel;
    Panel15: TPanel;
    Image5: TImage;
    Label6: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    IP_CV1: TEdit;
    PO_CV1: TEdit;
    PO_INT1: TEdit;
    IP_INT1: TEdit;
    IP_SC1: TEdit;
    PO_SC1: TEdit;
    IP_SC2: TEdit;
    PO_SC2: TEdit;
    IP_SC3: TEdit;
    PO_SC3: TEdit;
    Panel2: TPanel;
    IN_BCD1: TComboBox;
    Panel4: TPanel;
    OT_BCD1: TComboBox;
    Panel6: TPanel;
    Image6: TImage;
    Label7: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    C1_BCR1: TComComboBox;
    C2_BCR1: TComComboBox;
    Panel25: TPanel;
    Panel28: TPanel;
    Panel30: TPanel;
    C3_BCR1: TComComboBox;
    C4_BCR1: TComComboBox;
    C5_BCR1: TComComboBox;
    C1_BCR2: TComComboBox;
    C2_BCR2: TComComboBox;
    C3_BCR2: TComComboBox;
    C4_BCR2: TComComboBox;
    C5_BCR2: TComComboBox;
    Panel32: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel31: TPanel;
    Image7: TImage;
    Label8: TLabel;
    Panel37: TPanel;
    Image8: TImage;
    Label9: TLabel;
    Panel38: TPanel;
    Panel39: TPanel;
    Edit1: TEdit;
    Panel40: TPanel;
    Panel41: TPanel;
    Edit3: TEdit;
    Edit4: TEdit;
    cb120In: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure cbMachChange(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtComsetChange(Sender: TObject);
    procedure cbComComsetChange(Sender: TObject);
  private
    procedure ProcStatusDisplay;
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmSetUpBox: TfrmSetUpBox;
  COMSET_Change : Array [1..7] of Boolean ;
  CURRENT_Change: Array [1..7] of Boolean ;

implementation

{$R *.dfm}

//==============================================================================
// btnQryClick
//==============================================================================
procedure TfrmSetUpBox.btnQryClick(Sender: TObject);
begin
  ProcStatusDisplay;
end;

//==============================================================================
// btnSaveClick
//==============================================================================
procedure TfrmSetUpBox.btnSaveClick(Sender: TObject);
var
  i : integer ;
  StrSQL : String ;
begin
  try
    with qryCommand do
    begin
      Close;
      if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;
      //===========================
      // SC 통신정속 변경
      //===========================
      if COMSET_Change[1] then
      begin
        SQL.Clear;
        StrSQL := ' UPDATE TC_COMSET ' +
                  '    SET ID_IP   = ' + QuotedStr(IP_SC1.Text) +
                  '      , ID_PORT = ' + QuotedStr(PO_SC1.Text) +
                  '      , ID_USER = ' + QuotedStr(MainDM.M_Info.UserCode) +
                  '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE ID_MACH = ''SC'' ';
        SQL.Text := StrSQL;
        ExecSQL;
      end;

      //===========================
      // CV, AC 통신접속 변경
      //===========================
      if COMSET_Change[4] then
      begin
        SQL.Clear;
        StrSQL := ' UPDATE TC_COMSET ' +
                  '    SET ID_IP   = ' + QuotedStr(IP_CV1.Text) +
                  '      , ID_PORT = ' + QuotedStr(PO_CV1.Text) +
                  '      , ID_USER = ' + QuotedStr(MainDM.M_Info.UserCode) +
                  '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE ID_MACH in (''CV'', ''AC'') ';
        SQL.Text := StrSQL;
        ExecSQL;
      end;

      //===========================
      // 입고바코드 통신접속 변경
      //===========================
      if COMSET_Change[5] then
      begin
        SQL.Clear;
        StrSQL := ' UPDATE TC_COMSET ' +
                  '    SET ID_COMPORT    = ' + QuotedStr(C1_BCR1.Text) +
                  '      , ID_BAUDRATE   = ' + QuotedStr(C2_BCR1.Text) +
                  '      , ID_DATABITS   = ' + QuotedStr(C3_BCR1.Text) +
                  '      , ID_STOPBITS   = ' + QuotedStr(C4_BCR1.Text) +
                  '      , ID_PARITYBITS = ' + QuotedStr(C5_BCR1.Text) +
                  '      , ID_USER = ' + QuotedStr(MainDM.M_Info.UserCode) +
                  '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE ID_MACH   = ''BCR'' ' +
                  '    AND ID_MACHNO = ''1'' ' ;
        SQL.Text := StrSQL;
        ExecSQL;
      end;

      //===========================
      // 출고바코드 통신접속 변경
      //===========================
      if COMSET_Change[6] then
      begin
        SQL.Clear;
        StrSQL := ' UPDATE TC_COMSET ' +
                  '    SET ID_COMPORT    = ' + QuotedStr(C1_BCR2.Text) +
                  '      , ID_BAUDRATE   = ' + QuotedStr(C2_BCR2.Text) +
                  '      , ID_DATABITS   = ' + QuotedStr(C3_BCR2.Text) +
                  '      , ID_STOPBITS   = ' + QuotedStr(C4_BCR2.Text) +
                  '      , ID_PARITYBITS = ' + QuotedStr(C5_BCR2.Text) +
                  '      , ID_USER = ' + QuotedStr(MainDM.M_Info.UserCode) +
                  '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE ID_MACH   = ''BCR'' ' +
                  '    AND ID_MACHNO = ''2'' ' ;
        SQL.Text := StrSQL;
        ExecSQL;
      end;

      //===========================
      // INT 통신정속 변경
      //===========================
      if COMSET_Change[7] then
      begin
        SQL.Clear;
        StrSQL := ' UPDATE TC_COMSET ' +
                  '    SET ID_IP   = ' + QuotedStr(IP_INT1.Text) +
                  '      , ID_PORT = ' + QuotedStr(PO_INT1.Text) +
                  '      , ID_USER = ' + QuotedStr(MainDM.M_Info.UserCode) +
                  '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE ID_MACH = ''INT'' ';
        SQL.Text := StrSQL;
        ExecSQL;
      end;

      //===========================
      // SC 입출고 가능 여부 변경
      //===========================
      for i := 1 to 3 do
      begin
        if CURRENT_Change[i] then
        begin
          SQL.Clear;
          StrSQL := ' UPDATE TC_CURRENT ' +
                    '    SET OPTION1 = ' + QuotedStr(IntToStr(TComboBox(Self.FindComponent('IN_SC'+IntToStr(i))).ItemIndex)) +
                    '      , ID_USER = ' + QuotedStr(MainDM.M_Info.UserCode) +
                    '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                    '  WHERE CURRENT_NAME = ''SC_IN_USE'' ' +
                    '    AND CURRENT_ID   = ''' + IntToStr(i) + ''' ';
          SQL.Text := StrSQL;
          ExecSQL;

          SQL.Clear;
          StrSQL := ' UPDATE TC_CURRENT ' +
                    '    SET OPTION1 = ' + QuotedStr(IntToStr(TComboBox(Self.FindComponent('OT_SC'+IntToStr(i))).ItemIndex)) +
                    '      , ID_USER = ' + QuotedStr(MainDM.M_Info.UserCode) +
                    '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                    '  WHERE CURRENT_NAME = ''SC_OT_USE'' ' +
                    '    AND CURRENT_ID   = ''' + IntToStr(i) + ''' ';
          SQL.Text := StrSQL;
          ExecSQL;
        end;
      end;

      //===========================
      // AC 입출고 가능 여부 변경
      //===========================
      if CURRENT_Change[4] then
      begin
        SQL.Clear;
        StrSQL := ' UPDATE TC_CURRENT ' +
                  '    SET OPTION1 = ' + QuotedStr(IntToStr(IN_CV1.ItemIndex)) +
                  '      , ID_USER = ' + QuotedStr(MainDM.M_Info.UserCode) +
                  '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE CURRENT_NAME = ''AC_IN_USE'' ' ;
        SQL.Text := StrSQL;
        ExecSQL;

        SQL.Clear;
        StrSQL := ' UPDATE TC_CURRENT ' +
                  '    SET OPTION1 = ' + QuotedStr(IntToStr(OT_CV1.ItemIndex)) +
                  '      , ID_USER = ' + QuotedStr(MainDM.M_Info.UserCode) +
                  '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE CURRENT_NAME = ''AC_OT_USE'' ' ;
        SQL.Text := StrSQL;
        ExecSQL;
      end;

      //===========================
      // 바코드 사용 여부 변경
      //===========================
      if (CURRENT_Change[5]) or
         (CURRENT_Change[6]) or
         (CURRENT_Change[7]) then
      begin
        SQL.Clear;
        StrSQL := ' UPDATE TC_CURRENT ' +
                  '    SET OPTION1 = ' + QuotedStr(IntToStr(IN_BCD1.ItemIndex)) +
                  '      , OPTION2 = ' + QuotedStr(IntToStr(OT_BCD1.ItemIndex)) +
                  '      , OPTION3 = ' + QuotedStr(IntToStr(cb120In.ItemIndex)) +
                  '      , ID_USER = ' + QuotedStr(MainDM.M_Info.UserCode) +
                  '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                  '  WHERE CURRENT_NAME = ''READMODE'' ' ;
        SQL.Text := StrSQL;
        ExecSQL;
      end;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
      Close;
    end;
    ProcStatusDisplay;
    MessageDlg('시스템 설정이 변경되었습니다.', mtConfirmation, [mbOK], 0);
    TraceLogWrite( '시스템 설정 변경 | btnSaveClick -> StrSQL : ['+StrSQL+']');
  except
    on E : Exception do
    begin
      qryCommand.Close;
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;

      TraceLogWrite( '시스템 설정 에러 | ' +
                     'btnSaveClick -> StrSQL : ['+StrSQL+
                     '], Exception : ['+E.Message+']');
      MessageDlg('설정 변경을 실패하였습니다.' + #13#10 + '입력 정보를 확인해 주십시오.', mtWarning, [mbOK], 0);
    end;
  end;
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmSetUpBox.FormActivate(Sender: TObject);
begin
  ProcStatusDisplay;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmSetUpBox.FormDeactivate(Sender: TObject);
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
procedure TfrmSetUpBox.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmSetUpBox := Nil ;
  except end;
end;

//==============================================================================
// btnCloseClick
//==============================================================================
procedure TfrmSetUpBox.btnCloseClick(Sender: TObject);
begin
  Close;
end;

//==============================================================================
// ProcStatusDisplay
//==============================================================================
procedure TfrmSetUpBox.ProcStatusDisplay;
var
  i : integer;
  StrSQL : String;
begin
  try
    with qryInfo do
    begin
      //====================================
      // 설비 통신 접속 정보(IP, PORT)
      //====================================
      Close;
      SQL.Clear;
      StrSQL := ' SELECT * FROM TC_COMSET WITH (NOLOCK) ' +
                '  ORDER BY ID_MACH, ID_MACHNO ' ;
      SQL.Text := StrSQL;
      Open;
      First;
      While not (Eof) do
      begin
        if FieldByName('ID_MACH').AsString = 'CV' then
        begin
          IP_CV1.Text := FieldByName('ID_IP'  ).AsString;
          PO_CV1.Text := FieldByName('ID_PORT').AsString;
        end else
        if FieldByName('ID_MACH').AsString = 'SC' then
        begin
          TEdit(Self.FindComponent('IP_SC'+FieldByName('ID_MACHNO').AsString)).Text := FieldByName('ID_IP'  ).AsString;
          TEdit(Self.FindComponent('PO_SC'+FieldByName('ID_MACHNO').AsString)).Text := FieldByName('ID_PORT').AsString;
        end else

        if FieldByName('ID_MACH').AsString = 'BCR' then
        begin
          TComComboBox(Self.FindComponent('C1_BCR'+FieldByName('ID_MACHNO').AsString)).Text := FieldByName('ID_COMPORT'   ).AsString;
          TComComboBox(Self.FindComponent('C2_BCR'+FieldByName('ID_MACHNO').AsString)).Text := FieldByName('ID_BAUDRATE'  ).AsString;
          TComComboBox(Self.FindComponent('C3_BCR'+FieldByName('ID_MACHNO').AsString)).Text := FieldByName('ID_DATABITS'  ).AsString;
          TComComboBox(Self.FindComponent('C4_BCR'+FieldByName('ID_MACHNO').AsString)).Text := FieldByName('ID_STOPBITS'  ).AsString;
          TComComboBox(Self.FindComponent('C5_BCR'+FieldByName('ID_MACHNO').AsString)).Text := FieldByName('ID_PARITYBITS').AsString;
        end else
        if FieldByName('ID_MACH').AsString = 'INT' then
        begin
          IP_INT1.Text := FieldByName('ID_IP'  ).AsString;
          PO_INT1.Text := FieldByName('ID_PORT').AsString;
        end;
        Next;
      end;

      //====================================
      // 설비 입출고 사용유무
      //====================================
      Close;
      SQL.Clear;
      StrSQL := ' SELECT * FROM TC_CURRENT WITH (NOLOCK) ' +
                '  WHERE CURRENT_TYPE = ''MACHCONTROL'' ' +
                '  ORDER BY CURRENT_NAME, CURRENT_ID ' ;
      SQL.Text := StrSQL;
      Open;
      First;
      While not (Eof) do
      begin
        if Copy(FieldByName('CURRENT_NAME').AsString, 1, 2) = 'AC' then
        begin
          if FieldByName('CURRENT_NAME').AsString = 'AC_IN_USE' then
          begin
            IN_CV1.ItemIndex := Integer(FieldByName('OPTION1').AsBoolean);
            cbMachChange(IN_CV1);
          end else
          begin
            OT_CV1.ItemIndex := Integer(FieldByName('OPTION1').AsBoolean);
            cbMachChange(OT_CV1);
          end;
        end else
        if Copy(FieldByName('CURRENT_NAME').AsString, 1, 2) = 'SC' then
        begin
          if FieldByName('CURRENT_NAME').AsString = 'SC_IN_USE' then
          begin
            TComboBox(Self.FindComponent('IN_SC'+FieldByName('CURRENT_ID').AsString)).ItemIndex := Integer(FieldByName('OPTION1').AsBoolean);
            cbMachChange(TComboBox(Self.FindComponent('IN_SC'+FieldByName('CURRENT_ID').AsString)));
          end else
          begin
            TComboBox(Self.FindComponent('OT_SC'+FieldByName('CURRENT_ID').AsString)).ItemIndex := Integer(FieldByName('OPTION1').AsBoolean);
            cbMachChange(TComboBox(Self.FindComponent('OT_SC'+FieldByName('CURRENT_ID').AsString)));
          end;
        end else
        if FieldByName('CURRENT_NAME').AsString = 'READMODE' then
        begin
          IN_BCD1.ItemIndex := Integer(FieldByName('OPTION1').AsBoolean);
          cbMachChange(IN_BCD1);
          OT_BCD1.ItemIndex := Integer(FieldByName('OPTION2').AsBoolean);
          cbMachChange(OT_BCD1);
          cb120In.ItemIndex := Integer(FieldByName('OPTION3').AsBoolean);
          cbMachChange(cb120In);
        end;
        Next;
      end;
    end;
    for i := 1 to 7 do
    begin
      COMSET_Change[i]  := False;
      CURRENT_Change[i] := False;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite( '시스템 설정 에러 | ' +
                     'ProcStatusDisplay -> StrSQL : ['+StrSQL+
                     '], Exception : ['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// FormKeyPress
//==============================================================================
procedure TfrmSetUpBox.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #27 ) then
  begin
    Close;
  end;
end;

//==============================================================================
// cbMachChange
//==============================================================================
procedure TfrmSetUpBox.cbMachChange(Sender: TObject);
begin
  if (Sender as TComboBox).Text = 'N' then
  begin
    (Sender as TComboBox).Color := clYellow;
  end else
  if (Sender as TComboBox).Text = 'Y' then
  begin
    (Sender as TComboBox).Color := clLime;
  end;
  CURRENT_Change[(Sender as TComboBox).Tag] := True;
end;

//==============================================================================
// edtComsetChange
//==============================================================================
procedure TfrmSetUpBox.edtComsetChange(Sender: TObject);
begin
  COMSET_Change[(Sender as TEdit).Tag] := True;
end;

//==============================================================================
// cbComComsetChange
//==============================================================================
procedure TfrmSetUpBox.cbComComsetChange(Sender: TObject);
begin
  COMSET_Change[(Sender as TComComboBox).Tag] := True;
end;

end.
