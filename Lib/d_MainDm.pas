unit d_MainDm;

interface

uses
  Windows, SysUtils, Classes, DB, ADODB, Messages, Dialogs, Inifiles,
  ComObj, StdCtrls, h_MainLib, Variants, DBGrids, Graphics, DBGridEh,
  DBGridEhImpExp  ;

type

  TMainDm = class(TDataModule)
    MainDatabase: TADOConnection;
    qrySearch: TADOQuery;
    saveDlg: TSaveDialog;
    procedure MainDatabaseAfterDisconnect(Sender: TObject);
    procedure MainDatabaseAfterConnect(Sender: TObject);
  private
    { Private declarations }

  public
    M_Info : Main_Info;
    F_Info : Form_Info;
    procedure SearchCodeList(var ComboBox: TComboBox; Table, Field: String);
    procedure SearchCodeList2(var ComboBox: TComboBox; Table, Field: String);
    { Public declarations }
  end;
  procedure fnWmMsgSend   ( const WMsg, LMsg : LongWord );
  function fnFileFilter( var FileName : String; Const FilterName : String   ) : Boolean ;
  function IniRead ( IniRoot , KeyName  , FieldName , ReadStr   : String ) : String;
  function IniWrite( IniRoot , KeyName  , FieldName , WriteStr  : String ) : Boolean;
  function ADOConnection : Boolean;
  function hlbEhgridListExcel( RvGrid : TDBGridEh ; FileName : String ; bSel : Boolean = True ): Boolean ;


Const
  INI_PATH: String = 'AWHOUSE.INI';

var
  MainDm: TMainDm;
  m : Main_Info;

implementation

{$R *.dfm}

{ TMainDm }

//==============================================================================
// IniRead -> INI 파일에서 Key Field 의 값을 읽음
//==============================================================================
function IniRead( IniRoot , KeyName , FieldName , ReadStr : String ): String;
var Ini_File    : TIniFile;
begin
  try
    Ini_File := TIniFile.Create( ExpandFileName ( IniRoot )  );
    try
      Result := PChar ( Ini_File.ReadString ( KeyName ,FieldName , ReadStr ) );
    finally
      Ini_File := nil;
      Ini_File.Free;
    end;
  except
    Result := ReadStr;
  end;
end;

//==============================================================================
// IniWrite -> INI 파일에서 Key Field의 값을 기록
//==============================================================================
function IniWrite ( IniRoot , KeyName, FieldName, WriteStr : String ): Boolean ;
var
  Ini_File   : TIniFile;
begin
  try
    Ini_File := TIniFile.Create( ExpandFileName ( IniRoot )  );
    try
      Ini_File.WriteString( KeyName, FieldName, WriteStr  );
      Result := True;
    finally
      Ini_File := nil;
      Ini_File.Free;
    end;
  except
    Result := False;
  end;
end;

//==============================================================================
// hlbEhgridListExcel
//==============================================================================
function hlbEhgridListExcel( RvGrid : TDBGridEh ; FileName : String ; bSel : Boolean = True ): Boolean;
var
  Save_Dlg : TSaveDialog;
begin
  Result := False;
  if RvGrid.DataSource.DataSet.Active and not RvGrid.DataSource.DataSet.IsEmpty then
  begin
    Save_Dlg := TSaveDialog.Create(nil);
    try
      Save_Dlg.FileName := ChangeFileExt ( FileName , '.xlsx'  );
      Save_Dlg.Title    := '엑셀로 저장';
      Save_Dlg.Filter   := '엑셀문서[ *.xlsx ]|*.xlsx';
      if Save_Dlg.Execute then
      begin
        ExportDBGridEhToXlsx(RvGrid,Save_Dlg.FileName,[]);
        Result := True;
      end;
    finally
      FreeAndNil( Save_Dlg );
    end;
  end;
end;

//==============================================================================
// ADOConnection -> Database Connect
//==============================================================================
function ADOConnection: Boolean;
begin
  Result := False;

  if UpperCase ( MainDm.M_Info.DbType ) = 'MSSQL' Then
  begin
    try
      With MainDm Do
      begin
        MainDatabase.Close;
        MainDatabase.ConnectionString :='';
        MainDatabase.ConnectionString := 'Provider=' +  MainDm.M_Info.DbOle +
                                         ';Persist Security Info=True;User ID=' +
                                         MainDm.M_Info.DbUser  +
                                         ';Data Source=' + MainDm.M_Info.DbAlais +
                                         ';Password=' + MainDm.M_Info.DbPswd +
                                         ';Initial Catalog=' + MainDm.M_Info.DbFile ;
        MainDatabase.Connected := True;
        Result:= True ;
        m.ConChk := True;
      end;
    except
      on E: Exception do
      begin
        Result := False ;
        m.ConChk := False;
        ShowMessage('커넥션 실패 관리자에게 문의 하시기 바랍니다....?');
      end ;
    end;
  end;
end;

//==============================================================================
// fnWmMsgSend
//==============================================================================
procedure fnWmMsgSend(const WMsg, LMsg: LongWord);
begin
  SendMessage( m.MainHd ,  WM_USER, WMsg, LMsg );
end;

//==============================================================================
// fnFileFilter -> 파일명을 받아 뒤의 확장자를 붙여넣어준다.
//==============================================================================
function fnFileFilter ( var FileName : String; Const FilterName : String   ) : Boolean ;
var
  PosCheck : Integer;
begin
  Result := False;
  if  Trim ( FileName ) = '' then Exit;
  PosCheck := Pos ( '.' , FileName  );
  if  PosCheck = 0 then FileName := FileName + '.' + FilterName
  else FileName := Copy ( FileName, 1 , PosCheck - 1 ) + '.' + FilterName;
  Result := True;
end;

{ TMainDm }



{ TMainDm }

//==============================================================================
// SearchCodeList
//==============================================================================
procedure TMainDm.SearchCodeList(var ComboBox: TComboBox; Table, Field: String);
begin
  with qrySearch do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT  DISTINCT ' + Field + ' FROM ' + Table + ' ORDER BY ' + Field + ' ';
    Open;
    First;
    ComboBox.Items.Clear;
    ComboBox.Items.Add('전체');

    while Not Eof do
    begin
      if (FieldByName(Field).AsString <> '') then
        ComboBox.Items.Add(fieldByName(Field).AsString);
      Next;
    end;
    Close;
  end;
  ComboBox.ItemIndex := 0;
end;

//==============================================================================
// fnFileFilter -> 파일명을 받아 뒤의 확장자를 붙여넣어준다.
//==============================================================================
procedure TMainDm.SearchCodeList2(var ComboBox: TComboBox; Table, Field: String);
begin
  with qrySearch do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT  DISTINCT ' + Field + ' FROM ' + Table + ' ORDER BY ' + Field + ' ';
    Open;
    First;
    ComboBox.Items.Clear;

    while Not Eof do
    begin
      if (FieldByName(Field).AsString <> '') then
        ComboBox.Items.Add(fieldByName(Field).AsString);
      Next;
    end;
    Close;
  end;
  ComboBox.ItemIndex := -1;
end;

//==============================================================================
// MainDatabaseAfterConnect
//==============================================================================
procedure TMainDm.MainDatabaseAfterConnect(Sender: TObject);
begin
  m.ConChk := True;
end;

//==============================================================================
// MainDatabaseAfterDisconnect
//==============================================================================
procedure TMainDm.MainDatabaseAfterDisconnect(Sender: TObject);
begin
  m.ConChk := False;
end;

end.
