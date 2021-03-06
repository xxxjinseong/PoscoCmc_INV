unit U120_Pop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, d_MainDm, h_MainLib, h_ReferLib,
  DB, ADODB, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.Mask, Vcl.DBCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmU120_Pop = class(TForm)
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
    GroupBox3: TGroupBox;
    Panel39: TPanel;
    qryCommand: TADOQuery;
    qrySearch: TADOQuery;
    Panel1: TPanel;
    edtERR_NAME: TEdit;
    qryTemp: TADOQuery;
    Panel3: TPanel;
    edtERR_CODE: TEdit;
    cbID_MACH: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure USERKeyPress(Sender: TObject; var Key: Char);
    procedure cbID_MACHKeyPress(Sender: TObject; var Key: Char);
  private
    procedure SetItemList;
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmU120_Pop: TfrmU120_Pop;

implementation

uses U120;

{$R *.dfm}

//==============================================================================
// btnSaveClick
//==============================================================================
procedure TfrmU120_Pop.btnSaveClick(Sender: TObject);
var
  ExecNo : integer ;
  StrSQL, tmpStr, StrSQL2 : String ;
begin
  //+++++++++++++++++++++++++++++++
  // 코드데이터 체크
  //+++++++++++++++++++++++++++++++
  if Trim(edtERR_CODE.Text) = '' then
  begin
    edtERR_CODE.SetFocus;
    MessageDlg('에러코드를 확인해주십시오', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  if Trim(edtERR_NAME.Text) = '' then
  begin
    edtERR_NAME.SetFocus;
    MessageDlg('에러내용을 확인해주십시오', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  //+++++++++++++++++++++++++++++++
  // 코드데이터 처리
  //+++++++++++++++++++++++++++++++
  if btnSave.Caption = '등 록' then
  begin
    tmpStr := '등록';
    StrSQL := ' INSERT INTO TM_ERROR ( ' +
              '  ID_MACH, ID_MACHNO, ERR_CODE, ' +
              '  ERR_NAME, ERR_DESC, ERR_ETC, UP_DT, CR_DT ) ' +
              ' VALUES( ' +
              QuotedStr(UpperCase(cbID_MACH.Text))   + ',' +
              QuotedStr('1') + ',' +
              QuotedStr(UpperCase(edtERR_CODE.Text)) + ',' +
              QuotedStr(edtERR_NAME.Text) + ',' +
              QuotedStr('') + ',' +
              QuotedStr('') + ',' +
              ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ' + ','+
              ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ' + ')';
  end else
  if btnSave.Caption = '수 정' then
  begin
    tmpStr := '수정';
    StrSQL := ' UPDATE TM_ERROR ' +
            	'    SET ERR_NAME = ' + QuotedStr(edtERR_NAME.Text) +
              '      , UP_DT    = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
              '  WHERE ID_MACH   = ' + QuotedStr(UpperCase(cbID_MACH.Text)) +
              '    AND ERR_CODE  = ' + QuotedStr(UpperCase(edtERR_CODE.Text )) ;
  end;

  try
    with qryCommand do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL ;
      ExecNo := ExecSQL;

      if (ExecNo > 0) and
         (btnSave.Caption = '수 정') then
      begin
        StrSQL := ' UPDATE TT_ERROR ' +
                	'    SET ERR_NAME = ' + QuotedStr(edtERR_NAME.Text) +
                  '  WHERE ID_MACH   = ' + QuotedStr(UpperCase(cbID_MACH.Text)) +
                  '    AND ERR_CODE  = ' + QuotedStr(UpperCase(edtERR_CODE.Text )) ;
        SQL.Clear;
        SQL.Text := StrSQL ;
        ExecNo := ExecSQL;
      end;
      Close;
    end;
    TraceLogWrite('[120] 에러코드(팝업) - 처리구분['+tmpStr+'], 로그인계정['+MainDm.M_Info.UserCode+']');
    frmU120.SetComboBox ;
    frmU120.fnCommandQuery;
    Close;
  except
    on E : Exception do
    begin
      qryCommand.Close;
      if tmpStr = '등록' then
        ShowMessage('코드' + tmpStr + '에 실패하였습니다.' + #13#10 + '중복코드 여부 및 입력 정보를 확인해 주십시오.' )
      else
        ShowMessage('코드' + tmpStr + '에 실패하였습니다.' + #13#10 + '입력 정보를 확인해 주십시오.' );
      TraceLogWrite('[120] 에러코드(팝업) - 에러['+E.Message+'], 쿼리['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU120_Pop.FormActivate(Sender: TObject);
begin
  SetItemList;
  if btnSave.Caption = '등 록' then cbID_MACH.SetFocus
  else                              edtERR_NAME.SetFocus;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU120_Pop.FormDeactivate(Sender: TObject);
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
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU120_Pop.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU120_Pop := Nil ;
  except end;
end;

//==============================================================================
// btnCloseClick
//==============================================================================
procedure TfrmU120_Pop.btnCloseClick(Sender: TObject);
begin
  Close;
end;

//==============================================================================
// SetItemList
//==============================================================================
procedure TfrmU120_Pop.SetItemList;
begin
//
end;

//==============================================================================
// USERKeyPress
//==============================================================================
procedure TfrmU120_Pop.USERKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    btnSaveClick(nil);
  end else
  if key = #27 then
  begin
    Close;
  end;
end;

//==============================================================================
// cbID_MACHKeyPress
//==============================================================================
procedure TfrmU120_Pop.cbID_MACHKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    btnSaveClick(nil);
  end else
  if key = #27 then
  begin
    Close;
  end;
end;

end.
