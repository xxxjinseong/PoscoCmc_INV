unit U110_Pop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, d_MainDm, h_MainLib, h_ReferLib,
  DB, ADODB, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.Mask, Vcl.DBCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmU110_Pop = class(TForm)
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
    Panel44: TPanel;
    qryCommand: TADOQuery;
    qrySearch: TADOQuery;
    cbAUTHORITY: TComboBox;
    edtETC: TEdit;
    Panel5: TPanel;
    edtUSERID: TEdit;
    Panel1: TPanel;
    edtPW: TEdit;
    Panel2: TPanel;
    edtPWCheck: TEdit;
    PnlCurrPW: TPanel;
    edtCurrPW: TEdit;
    qryTemp: TADOQuery;
    Panel3: TPanel;
    edtUSERNM: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure USERKeyPress(Sender: TObject; var Key: Char);
  private
    procedure SetItemList;
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmU110_Pop: TfrmU110_Pop;

implementation

uses U110;

{$R *.dfm}

//==============================================================================
// btnSaveClick
//==============================================================================
procedure TfrmU110_Pop.btnSaveClick(Sender: TObject);
var
  ExecNo : integer ;
  StrSQL, tmpStr, StrSQL2 : String ;
begin
  //+++++++++++++++++++++++++++++++
  // �ڵ嵥���� üũ
  //+++++++++++++++++++++++++++++++
  if Trim(edtUSERID.Text) = ''  then
  begin
    edtUSERID.SetFocus;
    MessageDlg('����� �ڵ带 Ȯ�����ֽʽÿ�', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  if Trim(edtPW.Text) = '' then
  begin
    edtPW.SetFocus;
    MessageDlg('����� ��ȣ�� Ȯ�����ֽʽÿ�', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  if Trim(edtPWCheck.Text) = '' then
  begin
    edtPWCheck.SetFocus;
    MessageDlg('����� ��ȣ�� Ȯ�����ֽʽÿ�', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  if Trim(edtPW.Text) <> Trim(edtPWCheck.Text) then
  begin
    edtPW.SetFocus;
    MessageDlg('����� ��ȣ�� �������� �ʽ��ϴ�.' , mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  if (btnSave.Caption = '�� ��') and (Trim(edtCurrPW.Text) = '') then
  begin
    edtCurrPW.SetFocus;
    MessageDlg('���� ��ȣ�� �Է����ֽʽÿ�.' , mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  //+++++++++++++++++++++++++++++++
  // �ڵ嵥���� ó��
  //+++++++++++++++++++++++++++++++
  if btnSave.Caption = '�� ��' then
  begin
    tmpStr := '���';
    StrSQL := ' INSERT INTO TT_USER ( ' +
              '     WMS_NO, USER_ID, USER_NM, USER_PW, ' +
              '     USER_INFO_1, ADMIN_YN, UP_DT, CR_DT )  ' +
              '   VALUES( ' +
              QuotedStr(MainDM.M_Info.WMS_NO)        + ',' +
              QuotedStr(UpperCase(edtUSERID.Text))   + ',' +
              QuotedStr(edtUSERNM.Text)              + ',' +
              QuotedStr(UpperCase(edtPW.Text))       + ',' +
              QuotedStr(edtETC.Text)                 + ',' +
              QuotedStr(UpperCase(cbAUTHORITY.Text)) + ',' +
              ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ' + ','+
              ' CONVERT(VARCHAR(MAX), GETDATE(), 21) ' + ')';


    StrSQL2 := ' INSERT INTO TT_USER_MENU(WMS_NO, USER_ID, MENU_ID, MENU_NM, USED_YN, UP_DT, CR_DT) '+
               ' SELECT ' + QuotedStr(MainDM.M_Info.WMS_NO)+' as WMS_NO, '
                          + QuotedStr(UpperCase(edtUSERID.Text))+' as USER_ID, ' +
                          'MENU_ID, MENU_NM, '
                          + QuotedStr('Y')+' as USED_YN, ' +
                          ' CONVERT(VARCHAR(MAX), GETDATE(), 21), ' +
                          ' CONVERT(VARCHAR(MAX), GETDATE(), 21)  ' +
               '   FROM TT_MENU WITH (NOLOCK) ' +
               '  WHERE TT_MENU.WMS_NO = '+ QuotedStr(MainDM.M_Info.WMS_NO) ;
  end else
  if btnSave.Caption = '�� ��' then
  begin
    tmpStr := '����';
    StrSQL := ' UPDATE TT_USER ' +
            	'    SET USER_NM = ' + QuotedStr(edtUSERNM.Text)        +
              '      , USER_PW = ' + QuotedStr(UpperCase(edtPW.Text)) +
              '      , USER_INFO_1 = ' + QuotedStr(edtETC.Text)           +
              '      , ADMIN_YN = ' + QuotedStr(UpperCase(cbAUTHORITY.Text)) +
              '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
              ' WHERE WMS_NO   = ' + QuotedStr(MainDM.M_Info.WMS_NO) +
              '   AND USER_ID  = ' + QuotedStr(UpperCase(edtUSERID.Text )) +
              '   AND USER_PW  = ' + QuotedStr(UpperCase(edtCurrPW.Text )) ;
  end;

  try
    with qryCommand do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL ;
      ExecNo := ExecSQL;

      if (ExecNo > 0) and (tmpStr = '���') then
      begin
        SQL.Clear;
        SQL.Text := StrSQL2 ;
        ExecNo := ExecSQL;
      end else
      if (ExecNo > 0) and (tmpStr = '����') then
      begin
        if MainDM.M_Info.UserCode = UpperCase(edtUSERID.Text) then
           MainDM.M_Info.UserAdmin := UpperCase(cbAUTHORITY.Text);
      end else
      if (ExecNo <= 0) and (tmpStr = '����') then
      begin
        ShowMessage('�ڵ�' + tmpStr + '�� �����Ͽ����ϴ�.' + #13#10 + '�����ȣ �� �Է� ������ Ȯ���� �ֽʽÿ�.' );
      end;
      Close;
    end;
    TraceLogWrite('[110] ������ڵ�(�˾�) - ó������['+tmpStr+'], ������ڵ�['+UpperCase(edtUSERID.Text)+'], �α��ΰ���['+MainDm.M_Info.UserCode+']');
    frmU110.SetComboBox ;
    frmU110.fnCommandQuery;
    Close;
  except
    on E : Exception do
    begin
      if qryCommand.Active then qryCommand.Close;
      if tmpStr = '���' then
        ShowMessage('�ڵ�' + tmpStr + '�� �����Ͽ����ϴ�.' + #13#10 + '�ߺ��ڵ� ���� �� �Է� ������ Ȯ���� �ֽʽÿ�.' )
      else
        ShowMessage('�ڵ�' + tmpStr + '�� �����Ͽ����ϴ�.' + #13#10 + '�����ȣ �� �Է� ������ Ȯ���� �ֽʽÿ�.' );
      TraceLogWrite('[110] ������ڵ�(�˾�) - ����['+E.Message+'], ����['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU110_Pop.FormActivate(Sender: TObject);
begin
  SetItemList;
  if btnSave.Caption = '�� ��' then edtUSERID.SetFocus
  else                              edtUSERNM.SetFocus;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU110_Pop.FormDeactivate(Sender: TObject);
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
procedure TfrmU110_Pop.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU110_Pop := Nil ;
  except end;
end;

//==============================================================================
// btnCloseClick
//==============================================================================
procedure TfrmU110_Pop.btnCloseClick(Sender: TObject);
begin
  Close;
end;

//==============================================================================
// SetItemList
//==============================================================================
procedure TfrmU110_Pop.SetItemList;
begin
//
end;

//==============================================================================
// USERKeyPress
//==============================================================================
procedure TfrmU110_Pop.USERKeyPress(Sender: TObject; var Key: Char);
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