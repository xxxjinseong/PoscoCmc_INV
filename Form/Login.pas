unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, d_MainDm, h_MainLib, h_ReferLib,
  DB, ADODB, Vcl.Imaging.pngimage ;

type
  TfrmLoginBox = class(TForm)
    Pnl_Main: TPanel;
    qryInfo: TADOQuery;
    Panel1: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Question1: TImage;
    edtIDPasswd: TEdit;
    Pnl_Pass: TPanel;
    btnLogin: TBitBtn;
    chkSave: TCheckBox;
    edtIDCode: TEdit;
    Pnl_ID: TPanel;
    Panel4: TPanel;
    Image2: TImage;
    procedure edtIDPasswdKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure Question1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Question1MouseLeave(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure LoginBoxCreate ();
var
  frmLoginBox: TfrmLoginBox;
  CloseChk    : Boolean ;

implementation

{$R *.dfm}

//==============================================================================
// LoginBoxCreate
//==============================================================================
procedure LoginBoxCreate();
begin
  with TfrmLoginBox.Create(Application)  do
  begin
    try
      edtIDCode.Text := IniRead( INI_PATH, 'UserSeting', 'UserCode' ,'실패' );
      ShowModal;
    finally
      Free;
    end;
  end;
end;

//==============================================================================
// edtIDPasswdKeyPress
//==============================================================================
procedure TfrmLoginBox.edtIDPasswdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnLoginClick(Self);
  end;
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmLoginBox.FormShow(Sender: TObject);
begin
  edtIDPasswd.SetFocus;
end;

//==============================================================================
// btnLoginClick
//==============================================================================
procedure TfrmLoginBox.btnLoginClick(Sender: TObject);
var
  StrSQL : String;
begin
  MainDM.M_Info.IdPass := False;

  // 아이디 체크
  if Trim(edtIDCode.Text)='' Then
  begin
    ShowMessage( '아이디를 다시 입력해 주십시오');
    Exit;
  end;

  // 비밀번호 체크
  if Trim(edtIDPasswd.Text)='' Then
  begin
    ShowMessage( '비밀번호를 다시 입력해 주십시오');
    Exit;
  end;

  // 코드 체크박스가 체크되어있을때 저장한다.
  if chkSave.Checked = True Then
  begin
    IniWrite( INI_PATH, 'UserSeting', 'UserCode' , edtIDCode.Text );
  end;

  // 데이터 베이스에 접속하기 위해 기초정보 가져옴
  MainDm.M_Info.DbType := UpperCase ( IniRead( INI_PATH, 'Database', 'Connection' ,'실패' ) );
  MainDM.M_Info.WMS_NO := IniRead( INI_PATH, 'USERSETING', 'WMS_NO'  ,'0' );

  if MainDm.M_Info.DbType = 'MSSQL' Then
  begin
    qryInfo.Connection := MainDM.MainDatabase ;
    MainDm.M_Info.DbOle   := IniRead( INI_PATH, 'Database', 'Provider'  ,'실패' );
    MainDm.M_Info.DbAlais := IniRead( INI_PATH, 'Database', 'Alais'     ,'실패' );
    MainDm.M_Info.DbUser  := IniRead( INI_PATH, 'Database', 'User'      ,'실패' );
    MainDm.M_Info.DbPswd  := IniRead( INI_PATH, 'Database', 'Pswd'      ,'실패' );
    MainDm.M_Info.DbFile  := IniRead( INI_PATH, 'Database', 'File'      ,'실패' );
  end else
  if MainDm.M_Info.DbType = 'MSACCESS' Then
  begin
    qryInfo.Connection := MainDM.MainDatabase ;
    MainDm.M_Info.DbOle   := IniRead( INI_PATH, 'Database', 'SubProvider'  ,'실패' );
    MainDm.M_Info.DbAlais := IniRead( INI_PATH, 'Database', 'SubAlais'     ,'실패' );
    MainDm.M_Info.DbUser  := '';
    MainDm.M_Info.DbPswd  := '';
  end;

  if not ADOConnection Then Exit;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT USER_ID, USER_NM, USER_PW, USER_INFO_1, USER_INFO_2, ADMIN_YN ' +
                '   FROM TT_USER WITH (NOLOCK) ' +
                '  WHERE WMS_NO  = ' + '''' + MainDM.M_Info.WMS_NO + ''' ' +
                '    AND USER_ID = ' + '''' + UpperCase(edtIDCode.Text)   + ''' ' +
                '    AND USER_PW = ' + '''' + UpperCase(edtIDPasswd.Text) + ''' ' ;

      SQL.Text := StrSQL ;
      Open;
      if isEmpty then
      begin
        ShowMessage( '존재하지 않는 아이디이거나 비밀번호가 잘못 입력되었습니다. 확인 후 입력바랍니다!  ');
        Close;
      end else
      begin
        MainDM.M_Info.UserCode  := UpperCase(qryInfo.FieldByName('USER_ID' ).AsString );    // 사용자 코드
        MainDM.M_Info.UserName  := UpperCase(qryInfo.FieldByName('USER_NM' ).AsString );    // 사용자
        MainDM.M_Info.UserPwd   := UpperCase(qryInfo.FieldByName('USER_PW' ).AsString );    // 비밀번호
        MainDM.M_Info.UserAdmin := UpperCase(qryInfo.FieldByName('ADMIN_YN').AsString );    // 권한
        MainDM.M_Info.UserETC1  := UpperCase(qryInfo.FieldByName('USER_INFO_1').AsString ); // 내용1
        MainDM.M_Info.UserETC2  := UpperCase(qryInfo.FieldByName('USER_INFO_2').AsString ); // 내용2
        MainDM.M_Info.IdPass    := True;
      end;
    end;

    if MainDM.M_Info.IdPass then
    begin
      Close;
      Exit;
    end;
  except
    if qryInfo.Active then qryInfo.Close;
    MainDM.M_Info.IdPass := False;
    ShowMessage( '로그인에 실패하였습니다. 다시 시도하시기 바랍니다!  ');
  end;
end;

//==============================================================================
// Question1MouseLeave
//==============================================================================
procedure TfrmLoginBox.Question1MouseLeave(Sender: TObject);
begin
  if Pnl_ID.Visible   = True then Pnl_ID.Visible   := False ;
  if Pnl_Pass.Visible = True then Pnl_Pass.Visible := False ;
end;

//==============================================================================
// Question1MouseMove
//==============================================================================
procedure TfrmLoginBox.Question1MouseMove(Sender: TObject; Shift: TShiftState;X, Y: Integer);
begin
  if Pnl_ID.Visible   = False then Pnl_ID.Visible   := True;
  if Pnl_Pass.Visible = False then Pnl_Pass.Visible := True;
end;

end.
