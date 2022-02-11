unit ChangeLocation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, d_MainDM, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, h_ReferLib;

type
  TfrmChangeLocation = class(TForm)
    Pnl_Main: TPanel;
    Pnl_Sub: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel16: TPanel;
    Pnl_Top: TPanel;
    Pnl_BTN: TPanel;
    Pnl_Btn5: TPanel;
    btnClose: TSpeedButton;
    PnlFormName: TPanel;
    Panel24: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    qryOrder: TADOQuery;
    cbHogi2: TComboBox;
    cbHogi1: TComboBox;
    Pnl_Location: TPanel;
    Panel4: TPanel;
    cbBank1: TComboBox;
    cbBay1: TComboBox;
    cbLevel1: TComboBox;
    cbBank2: TComboBox;
    cbBay2: TComboBox;
    cbLevel2: TComboBox;
    Panel1: TPanel;
    edtLUGG: TEdit;
    sp_GetEmptyRack: TADOStoredProc;
    Panel36: TPanel;
    sbtCellSearch: TSpeedButton;
    Panel2: TPanel;
    edtHogi: TEdit;
    Pnl_Btn0: TPanel;
    btnSave: TSpeedButton;
    Panel3: TPanel;
    edtITEM: TEdit;
    Panel5: TPanel;
    edtLOT_NO: TEdit;
    edtORDER_DT: TEdit;
    cbRetry: TCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure sbtCellSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function fnSetSCRetry(SC_NO: Integer): Boolean;
    function SetJobOrder : Boolean;
    procedure SetComboBox;
  end;

var
  frmChangeLocation: TfrmChangeLocation;

implementation

uses U210;

{$R *.dfm}

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmChangeLocation.FormActivate(Sender: TObject);
begin
  SetComboBox;
end;

//==============================================================================
// SetComboBox
//==============================================================================
procedure TfrmChangeLocation.SetComboBox;
begin
  case edtHogi.Tag of
    1 :
    begin
      cbBank2.Items.Add('01');
      cbBank2.Items.Add('02');
      cbBank2.Items.Add('03');
      cbBank2.Items.Add('04');
    end;
    2 :
    begin
      cbBank2.Items.Add('05');
      cbBank2.Items.Add('06');
      cbBank2.Items.Add('07');
      cbBank2.Items.Add('08');
    end;
    3 :
    begin
      cbBank2.Items.Add('09');
      cbBank2.Items.Add('10');
      cbBank2.Items.Add('11');
      cbBank2.Items.Add('12');
    end;
  end;
end;

//==============================================================================
// btnSaveClick
//==============================================================================
procedure TfrmChangeLocation.btnSaveClick(Sender: TObject);
begin
  if (Trim(cbBank2.Text)  = '') or
     (Trim(cbBay2.Text)   = '') or
     (Trim(cbLevel2.Text) = '') then
  begin
    MessageDlg(' 새 작업위치를 확인해 주십시오', mtConfirmation, [mbOk], 0);
    Exit;
  end;

  if MessageDlg(' 선택하신 작업['+ edtLUGG.Text +']의 위치를' + #13#10 + #13#10 +
                ' [ ' +cbBank1.Text + '-' + cbBay1.Text + '-' + cbLevel1.Text + ' → ' +
                       cbBank2.Text + '-' + cbBay2.Text + '-' + cbLevel2.Text +
                ' ] 변경하시겠습니까?', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;

  if SetJobOrder then
  begin
    TraceLogWrite( '입고작업 위치변경 | btnSaveClick -> 작업호기: ['+edtHogi.Text+
                   '], 작업번호 : ['+ edtLUGG.Text +
                   '], 등록일시 : ['+ edtORDER_DT.Text +
                   '], 품목코드 : ['+ edtITEM.Text +
                   '], 변경 전 위치 : [ '+cbBank1.Text + '-' + cbBay1.Text + '-' + cbLevel1.Text+' ]' +
                   '], 변경 후 위치 : [ '+cbBank2.Text + '-' + cbBay2.Text + '-' + cbLevel2.Text+' ]' );

    if cbRetry.Checked then
    begin
      Sleep(500);
      fnSetSCRetry(edtHogi.Tag);
    end;
    frmU210.fnCommandQuery;
  end;
  Close;
end;

//==============================================================================
// fnSetSCRetry
//==============================================================================
function TfrmChangeLocation.fnSetSCRetry(SC_NO: Integer): Boolean;
var
  StrSQL : String ;
begin
  try
    with qryOrder do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT JOB_RETRY' +
                '   FROM TT_SCINFO WITH (NOLOCK)' +
                '  WHERE MACH_ID = ''SC'' ' +
                '    AND MACH_NO = ' + QuotedStr(IntToStr(SC_NO));
      SQL.Text := StrSQL;
      Open;
    end;

    if (qryOrder.FieldByName('JOB_RETRY').AsString <> '1') then
    begin
      with qryOrder do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' UPDATE TT_SCINFO ' +
                  '    SET JOB_RETRY = ''1'' ' +
                  '  WHERE MACH_ID = ''SC''' +
                  '    AND MACH_NO = ' + QuotedStr(IntToStr(SC_NO));
        SQL.Text := StrSQL;
        ExecSQL;
        TraceLogWrite( '입고작업 위치변경 | fnSetSCRetry -> 자동 재기동 지시' );
        Close;
      end;
    end;
  except
    on E : Exception do
    begin
      if qryOrder.Active then qryOrder.Close;
      TraceLogWrite( '[610] 설비 모니터링 에러 | ' +
                     'fnSetSCRetry -> SC No : ['+IntToStr(SC_NO)+
                     '], StrSQL : ['+StrSQL+
                     '], Exception : ['+E.Message+']');
    end;
  end;
end;
//==============================================================================
// btnCloseClick
//==============================================================================
procedure TfrmChangeLocation.btnCloseClick(Sender: TObject);
begin
  Close;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmChangeLocation.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : Integer;
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
  try frmChangeLocation := Nil ;
  except end;
end;

//==============================================================================
// FormKeyPress
//==============================================================================
procedure TfrmChangeLocation.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #27 ) then
  begin
    Close;
  end;
end;

//==============================================================================
// sbtCellSearchClick
//==============================================================================
procedure TfrmChangeLocation.sbtCellSearchClick(Sender: TObject);
var
  StrRc : String;
begin
  try
    with sp_GetEmptyRack do
    begin
      Close;
      Parameters.Refresh;
      Parameters.ParamByName('@fWMS_NO').Value   := StrToInt(MainDM.M_Info.WMS_NO);
      Parameters.ParamByName('@fSC_HOGI').Value  := edtHogi.Tag;
      Parameters.ParamByName('@fBANK').Value     := '';
      Parameters.ParamByName('@fBAY').Value      := '';
      Parameters.ParamByName('@fLEVEL').Value    := '';
      Parameters.ParamByName('@fITEM').Value     := edtITEM.Text ;
      Parameters.ParamByName('@fLOT_NO').Value   := edtLOT_NO.Hint ;
      Parameters.ParamByName('@rcCode').Value    := '';

      ExecProc;
      StrRc := Parameters.ParamValues['@rcCode'];
      Close;

      if Copy(StrRc,1,2) = 'OK' then
      begin
       cbBank2.Text  := Copy(StrRc, 4, 2);
       cbBay2.Text   := Copy(StrRc, 6, 2);
       cbLevel2.Text := Copy(StrRc, 8, 2);
      end else
      begin
        MessageDlg('빈랙찾기 실패', mtWarning, [mbOk],0);
      end;
    end;
  except
    on E : Exception do
    begin
      if sp_GetEmptyRack.Active then sp_GetEmptyRack.Close;
      TraceLogWrite( '[210] 자동창고 입고지시 팝업 에러 | ' +
                     'sbtCellSearchClick -> StrRc : [ '+StrRc+
                     '], Exception : ['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// SetJobOrder
//==============================================================================
function TfrmChangeLocation.SetJobOrder : Boolean;
var
  StrSQL : String;
begin
  try
    Result := False;

    with qryOrder do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_ORDER ' +
                '    SET DST_BANK  = ' + QuotedStr(cbBank2.Text) +
                '      , DST_BAY   = ' + QuotedStr(cbBay2.Text ) +
                '      , DST_LEVEL = ' + QuotedStr(cbLevel2.Text) +
                '  WHERE ORDER_DT  = ''' + edtORDER_DT.Text + ''' ' +
                '    AND LUGG      = ''' + edtLUGG.Text + '''' ;
      SQL.Text := StrSQL ;
      if ExecSQL > 0 then Result := True;
      Close;
    end;
  except
    on E : Exception do
    begin
      Result := False;
      if qryOrder.Active then qryOrder.Close;
      TraceLogWrite( '[210] 자동창고 입고지시 팝업 에러 | ' +
                     'SetJobOrder -> 작업호기: ['+edtHogi.Text+
                     '], 작업번호 : ['+ edtLUGG.Text +
                     '], 등록일시 : ['+ edtORDER_DT.Text +
                     '], 품목코드 : ['+ edtITEM.Text +
                     '], 변경 전 위치 : [ '+cbBank1.Text + '-' + cbBay1.Text + '-' + cbLevel1.Text+' ]' +
                     '], 변경 후 위치 : [ '+cbBank2.Text + '-' + cbBay2.Text + '-' + cbLevel2.Text+' ]' +
                     '], StrSQL : ['+StrSQL+
                     '], Exception : ['+E.Message+']');

    end;
  end;
end;

end.
