unit u_FindBoxAll;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Db, DBTables, Grids, DBGrids,  DBCtrls, Mask, ADODB,
  ImgList, ExtCtrls, Buttons, h_MainLib, Variants ;

type
  TFindBoxAll = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    DSfind: TDataSource;
    Qfind: TADOQuery;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    LvFind: TDBGrid;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure EditChange(Sender: TObject);
    procedure Edit1KeyDown( Sender: TObject; var Key: Word;      Shift: TShiftState);
    procedure CancelBtnClick( Sender: TObject  );
    procedure LvFindDblClick(Sender: TObject );
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     FA : TFind_InfoAll;
     procedure fnCommandOpen ;
     procedure InitGrid ;
  public
    Part_Code_V,Company_Code_V,Part_Same_Code_V:String;  
  end;
    function FindBoxALLCreate (Sender: TObject) : TFind_InfoAll ;

var
  FindBoxAll : TFindBoxAll ;

implementation

uses d_MainDm, u_Main ;

{$R *.DFM}

function FindBoxALLCreate ( Sender: TObject) : TFind_InfoAll ;
begin

  with TFindBoxAll.Create(Application)  do
  begin
    try
      InitGrid ;
      if Trim((Sender as TEdit).Hint) <> '' then Edit1.Text := (Sender as TEdit).Hint ; 
      fnCommandOpen ;
      Cursor := crDefault;
      ShowModal;
    finally
      if FA.fITEM_CODE      <> '' then FA.fITEM_CODE      := Lvfind.Fields[0].AsString ;
      if FA.fPart_Same_Code <> '' then FA.fPart_Same_Code := LvFind.Fields[2].AsString ;
      if FA.fCompany_Code   <> '' then FA.fCompany_Code   := Lvfind.Fields[3].AsString ;
      if FA.fCompany_Name   <> '' then FA.fCompany_Name   := LvFind.Fields[4].AsString ;
      Result   := FA  ;
      Free;
    end;
  end;   
end;

procedure TFindBoxAll.EditChange(Sender: TObject);
begin
  fnCommandOpen;
end;

procedure TFindBoxAll.Edit1KeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = VK_ESCAPE  then  begin  CancelBtnClick(Sender ); Exit; end;
  if Key = VK_DOWN    then  begin  LvFind.SetFocus;         Exit; end;
  if Key = VK_RETURN  then  begin  LvFindDblClick( Sender ); Exit; end;
end;

procedure TFindBoxAll.CancelBtnClick(Sender: TObject);
begin
  FA.fITEM_CODE      := '' ;
  FA.fPart_Same_Code := '' ;
  FA.fCompany_Code   := '' ;
  FA.fCompany_Name   := '' ;
  close;
end;

procedure TFindBoxAll.LvFindDblClick(Sender: TObject);
begin
  FA.fITEM_CODE      := Lvfind.Fields[0].AsString ;
  FA.fPart_Same_Code := LvFind.Fields[2].AsString ;
  FA.fCompany_Code   := Lvfind.Fields[3].AsString ;
  FA.fCompany_Name   := LvFind.Fields[4].AsString ;
  close;
end;

procedure TFindBoxAll.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = VK_ESCAPE  then
  begin
    CancelBtnClick(Sender );
    Exit;
  end;
end;

procedure TFindBoxAll.FormCreate(Sender: TObject);
begin
  FA.fITEM_CODE      := '' ;
  FA.fPart_Same_Code := '' ;
  FA.fCompany_Code   := '' ;
  FA.fCompany_Name   := '' ;
end;

procedure TFindBoxAll.fnCommandOpen;
begin
  Qfind.Close;
  Try
    Qfind.SQL.Clear;
    Qfind.SQL.Text:= ' Select CPS.PART_CODE, CP.PART_NAME, CPS.PART_SAME_CODE, ' +
                     '        CPS.COMPANY_CODE, CC.COMPANY_NAME                ' +
                     ' From CODE_PART_SAME CPS, CODE_COMPANY CC, CODE_PART CP  ' +
                     ' Where CPS.COMPANY_CODE = CC.COMPANY_CODE(+)                ' +
                     '   and CPS.PART_CODE    = CP.PART_CODE                   ' ;
                     //'   and CPS.BALANCEOUT   = ' + QuotedStr('0') + ' ';

    if Length(Trim(Edit1.Text))>0 then
    begin
      Qfind.SQL.Text := Qfind.SQL.Text+'and CPS.PART_CODE Like '+QuotedStr('%'+UpperCase(Trim(Edit1.Text))+'%')+' ';
    end;
    if Length(Trim(Edit2.Text))>0 then
    begin
      Qfind.SQL.Text := Qfind.SQL.Text+'and CC.COMPANY_NAME Like '+QuotedStr('%'+UpperCase(Trim(Edit2.Text))+'%')+' ';
    end;
    if Length(Trim(Edit3.Text))>0 then
    begin
      Qfind.SQL.Text := Qfind.SQL.Text+'and CPS.PART_SAME_CODE Like '+QuotedStr('%'+UpperCase(Trim(Edit3.Text))+'%')+' ';
    end;
    Qfind.SQL.Text := Qfind.SQL.Text+'Order By CPS.PART_CODE, CPS.COMPANY_CODE';
    Qfind.Open;
  Except
  End;
  if Qfind.Active then
  begin
    if (Qfind.RecordCount>0) then
    begin
      OKBtn.Enabled:=True;
      if (Trim(Part_Code_V)<>'') then
      begin
        Qfind.Locate('PART_CODE;COMPANY_NAME;PART_SAME_CODE',
          VarArrayOf([Part_Code_V, Company_Code_V, Part_Same_Code_V]),
          [loPartialKey]);
        Part_Code_V:='';
      end;
    end else
    begin
      OKBtn.Enabled:=False;
    end;
  end else
  begin
    OKBtn.Enabled:=False;
  end;
end;

procedure TFindBoxAll.FormShow(Sender: TObject);
begin
  fnCommandOpen();
  Edit1.SetFocus ;
end;

procedure TFindBoxAll.InitGrid;
begin
  with LvFind do
  begin
    // CPS.PART_CODE, CP.PART_NAME, CPS.PART_SAME_CODE, CPS.COMPANY_CODE, CC.COMPANY_NAME
    Columns[0].Visible       := True ;
    Columns[1].Visible       := True ;
    Columns[2].Visible       := True ;
    Columns[3].Visible       := True ;
    Columns[4].Visible       := True ;
    Columns[0].Title.Caption := 'YSP 内靛' ;
    Columns[0].Width     := 80 ;
    Columns[0].FieldName := 'PART_CODE' ;
    Columns[1].Title.Caption := '力   前   疙' ;
    Columns[1].Width     := 100 ;
    Columns[1].FieldName := 'PART_NAME' ;
    Columns[2].Title.Caption := '悼 老 前 锅' ;
    Columns[2].Width     := 80 ;
    Columns[2].FieldName := 'PART_SAME_CODE' ;
    Columns[3].Title.Caption := '惯林贸 内靛' ;
    Columns[3].Width     := 80 ;
    Columns[3].FieldName := 'COMPANY_CODE' ;
    Columns[4].Title.Caption := '惯林贸 疙' ;
    Columns[4].Width     := 160 ;
    Columns[4].FieldName := 'COMPANY_NAME' ;
  end;
end;

end.
