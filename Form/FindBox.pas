unit u_FindBox2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Db, DBTables, Grids, DBGrids,  DBCtrls, Mask, ADODB,
  ImgList, ExtCtrls, Buttons, h_MainLib ;

type
  TFindBox = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    DSfind: TDataSource;
    Qfind: TADOQuery;
    xFind: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    LvFind: TDBGrid;
    yFind: TEdit;
    procedure xFindChange(Sender: TObject);
    procedure xFindKeyDown( Sender: TObject; var Key: Word;      Shift: TShiftState);
    procedure CancelBtnClick( Sender: TObject  );
    procedure LvFindDblClick(Sender: TObject );
    procedure LvFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure AddBtnClick(Sender: TObject);
    procedure ModiBtnClick(Sender: TObject);
    procedure CanBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure yFindChange(Sender: TObject);
    procedure yFindKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
     f : TFind_Info;
     SqlTable : String;
     function  SqlTextOpen (TableIndex:Integer; KeyStr:String): boolean ;
  public
  end;
    function FindBoxCreate (Sender: TObject) : TFind_Info ;

var
  FindBox : TFindBox ;

implementation

uses d_MainDm, u_Main ;

{$R *.DFM}

Function FindSqlText (TableName : String) : String;
begin
  Result := ' SELECT  *  FROM  ' + TableName ;
end;


//Ract :수정,추가가능 콤보 박스 보임 여부
//==============================================================================
//  FIndBox 찾기항목
//==============================================================================
function FindBoxCreate ( Sender: TObject) : TFind_Info ;
var
  DefaultCode , FindKey   : String;
  FindTableIndex : Integer ;
begin
  if (Sender is TDbEdit    ) then
  begin
    DefaultCode  := Trim( TDBEdit ( Sender ).Text   );
    FindKey      := Trim( TDBEdit ( Sender ).Hint   );
  end else
  if (Sender is TDbComboBox) then
  begin
    DefaultCode  := Trim( TDbComboBox ( Sender ).Text   );
    FindKey      := Trim( TDbComboBox ( Sender ).Hint   );
  end else
  if (Sender is TComboBox  ) then
  begin
    DefaultCode  := Trim( TComboBox ( Sender ).Text   );
    FindKey      := Trim( TComboBox ( Sender ).Hint   );
  end else
  if (Sender is TEdit      ) then
  begin
    DefaultCode    := Trim( TEdit ( Sender ).Text   );
    FindKey        := Trim( TEdit ( Sender ).Hint   );
    FindTableIndex := TEdit ( Sender ).Tag ;
  end;

  with TFindBox.Create(Application)  do
  begin
    try
      if  SqlTextOpen (FindTableIndex, FindKey) then
      begin
        xFind.Text := DefaultCode  ;
        Cursor := crDefault;
        ShowModal;
      end;
    finally
      if f.Find_Code <> '' then f.Find_Code := Lvfind.Fields[0].AsString ;
      if f.Find_desc <> '' then f.Find_desc := LvFind.Fields[1].AsString ;
      Result   := f  ;
      Free;
    end;
  end;
end;

function  TFindBox.SqlTextOpen (TableIndex:Integer; KeyStr:String) :boolean ;
begin
  try
    Result := False;

    with QFind Do
    begin
      Close;
      SQL.Clear;
      if  TableIndex = 1 then
      begin
        SQL.Text := ' SELECT PART_CODE, PART_NAME, PART_SPEC FROM TM_PART ORDER BY PART_CODE ' ;
        with LvFind do
        begin
          Columns[0].Visible       := True ;
          Columns[1].Visible       := True ;
          Columns[2].Visible       := True ;
          Columns[0].Title.Caption := '품목코드' ;
          Columns[0].Width     := 80 ;
          Columns[0].FieldName := 'PART_CODE' ;
          Columns[1].Title.Caption := '품목명' ;
          Columns[1].Width     := 140 ;
          Columns[1].FieldName := 'PART_NAME' ;
          Columns[2].Title.Caption := '자재내역' ;
          Columns[2].Width     := 200 ;
          Columns[2].FieldName := 'PART_SPEC' ;
        end;
      end;

      if  Sql.Text = '' then Exit ;

      Qfind.Open;
      Result := True;
    end;
  except
    Result := false;
  end;
end;

procedure TFindBox.xFindChange(Sender: TObject);
var
  Sfind : String ;
begin
  SFind := Trim(UpperCase(xFind.Text)) ;
  if SFind = ''       then Exit;
  if not Qfind.Active then exit;
  if Qfind.isEmpty    then exit;
  try
    if LvFind.Columns[0].FieldName = 'PART_CODE' then
       Qfind.Locate( 'PART_CODE'   , SFind , [  loPartialKey ] );
  except
  end;
end;

procedure TFindBox.yFindChange(Sender: TObject);
var
  Sfind : String ;
begin
  SFind :=    Trim( yFind.Text ) ;
  if SFind = ''       then Exit;
  if not Qfind.Active then exit;
  if Qfind.isEmpty    then exit;
  try
    if LvFind.Columns[0].FieldName = 'PART_CODE' then
       Qfind.Locate( 'PART_NAME' , SFind , [  loPartialKey ] );
  except
  end;
end;

procedure TFindBox.xFindKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = VK_ESCAPE  then  begin  CancelBtnClick(Sender ); Exit; end;
  if Key = VK_DOWN    then  begin  LvFind.SetFocus;         Exit; end;
  if Key = VK_RETURN  then  begin  LvFindDblClick( Sender ); Exit; end;
end;

procedure TFindBox.CancelBtnClick(Sender: TObject);
begin
  f.Find_Code := '' ;
  f.Find_desc := '' ;
  close;
end;

procedure TFindBox.LvFindDblClick(Sender: TObject);
begin
  f.Find_Code := LvFind.Fields[0].AsString ;
  f.Find_desc := LvFind.Fields[1].AsString ;
  close;
end;

procedure TFindBox.LvFindKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = VK_ESCAPE  then  begin  CancelBtnClick(Sender ); Exit; end;
  if Key = VK_BACK    then  begin  xFind.SetFocus;          Exit; end;
  if Key = VK_RETURN  then  begin  LvFindDblClick(Sender) ; Exit; end;
end;

procedure TFindBox.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = VK_ESCAPE  then
  begin
    CancelBtnClick(Sender );
    Exit;
  end;
end;

procedure TFindBox.AddBtnClick(Sender: TObject);
begin
  if not Qfind.Active then Exit;
  if QFind.Modified then
  begin
    if MessageDlg( '저장하지 않은 자료가 있습니다. 취소하시겠습니까?',  mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
       Qfind.CancelBatch( arAll );
    end else
    begin
      Exit;
    end ;
  end;
  Qfind.Append;
  Qfind.Edit ;
  QFind.Post;
end;

procedure TFindBox.ModiBtnClick(Sender: TObject);
begin
  try
    if not Qfind.Active then Exit;
    Qfind.UpdateBatch( arAll );
  finally

  end;
end;

procedure TFindBox.CanBtnClick(Sender: TObject);
begin
  try
    if not Qfind.Active then Exit;
    Qfind.CancelBatch( arAll	);
  finally

  end;
end;

procedure TFindBox.FormCreate(Sender: TObject);
begin
  f.Find_Code  := '' ;
  f.Find_desc := '' ;
end;

procedure TFindBox.yFindKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
Var
  SqlText : String;
begin
  if  Key = VK_RETURN  then
  begin
    if  Trim(yFind.Text) <> '' then
    begin
      SqlText := ' SELECT  *  FROM  '       +  SqlTable  ;
    end;

    with QFind Do
    begin
      Close;
      SQL.Clear;
      SQL.Text := SqlText ;
      Open;
    end;
  end;
end;

end.
