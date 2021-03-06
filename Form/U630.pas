unit U630;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU630 = class(TForm)
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Pnl_Top: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel6: TPanel;
    DatePicker1: TDateTimePicker;
    Panel15: TPanel;
    Panel3: TPanel;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    Panel19: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    cbTime1: TComboBox;
    CommLog: TListBox;
    CommMemo: TMemo;
    Panel5: TPanel;
    Panel7: TPanel;
    ColorBox1: TColorBox;
    Panel4: TPanel;
    Panel10: TPanel;
    ColorBox2: TColorBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure ComboChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure DatePickerChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure CommLogClick(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
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
    procedure fnCommandClose;
    procedure fnWmMsgRecv (var MSG : TMessage) ; message WM_USER ;
  end;
  procedure U630Create();

const
  FormNo ='630';

var
  frmU630: TfrmU630;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U630Create
//==============================================================================
procedure U630Create();
begin
  if not Assigned( frmU630 ) then
  begin
    frmU630 := TfrmU630.Create(Application);
    with frmU630 do
    begin
      fnCommandStart;
    end;
  end;
  frmU630.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU630.fnWmMsgRecv(var MSG: TMessage);
begin
  case MSG.WParam of
    MSG_MDI_WIN_ADD     : begin fnCommandAdd     ; end;
    MSG_MDI_WIN_EXCEL   : begin fnCommandExcel   ; end;
    MSG_MDI_WIN_DELETE  : begin fnCommandDelete  ; end;
    MSG_MDI_WIN_PRINT   : begin fnCommandPrint   ; end;
    MSG_MDI_WIN_QUERY   : begin fnCommandQuery   ; end;
    MSG_MDI_WIN_CLOSE   : begin fnCommandClose   ; Close; end;
  end;
end;

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmU630.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU630.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU630.FormActivate(Sender: TObject);
begin
  frmMain.LblMenu000.Caption := (Sender as TForm).Caption ;
  if MainDM.M_Info.UserAdmin = 'Y' then
  begin
    fnWmMsgSend( 22221, 111 );
  end else
  begin
    fnWmMsgSend( 22221, 111 );
  end;
  ColorBox1.Selected := StringToColor(IniRead( INI_PATH, 'IO_Info', 'COLOR_630_1'  ,'clBlack' ));
  ColorBox2.Selected := StringToColor(IniRead( INI_PATH, 'IO_Info', 'COLOR_630_2'  ,'clLime' ));
  CommLog.Color      := ColorBox1.Selected;
  CommLog.Font.Color := ColorBox2.Selected;
  fnCommandQuery;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU630.FormDeactivate(Sender: TObject);
var
  i : integer ;
begin
  CommLog.Items.Clear;
  for i := 0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i] is TTimer) then
       (Self.Components[i] as TTimer).Enabled := False ;
  end;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU630.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmU630 := Nil ;
  except end;
end;

//==============================================================================
// fnCommandStart [????]
//==============================================================================
procedure TfrmU630.fnCommandStart;
begin
  DatePicker1.Date := Now;
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandAdd [????]
//==============================================================================
procedure TfrmU630.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandExcel [????]
//==============================================================================
procedure TfrmU630.fnCommandExcel;
begin
//
end;

//==============================================================================
// fnCommandDelete [????]
//==============================================================================
procedure TfrmU630.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandPrint [????]
//==============================================================================
procedure TfrmU630.fnCommandPrint;
begin
//
end;

//==============================================================================
// fnCommandQuery [????]
//==============================================================================
procedure TfrmU630.fnCommandQuery;
var
  FileName, TmpStr : String;
  i : integer;
begin
  try
    CommLog.Items.Clear;
    FileName := '.\Log\INVTrace_' + FormatDatetime('YYYYMMDD', DatePicker1.Date) + '.log';
    if FileExists(FileName) then
    begin
      CommLog.Items.LoadFromFile(FileName) ;

      if cbTime1.ItemIndex <> 0 then
      begin
        for i := CommLog.TopIndex + 1 to CommLog.Items.Count - 1 do
        begin
          TmpStr := Copy(CommLog.Items[i],1,2) ;
          if Pos(Copy(cbTime1.Text,1,2),TmpStr) = 0 then
          begin
            TmpStr := '' ;
          end else
          begin
            CommLog.TopIndex  := i ;
            CommLog.ItemIndex := i ;
            Break ;
          end;
        end;
      end;
    end else
    begin
      CommLog.Items.Add('???? ?????? ?????? ????????.');
    end;
  except
    on E : Exception do
    begin
      TraceLogWrite( '[630] ???? ???????? ???? | ' +
                     'fnCommandQuery -> FileName : ['+FileName+
                     '], Exception : ['+E.Message+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [????]
//==============================================================================
procedure TfrmU630.fnCommandClose;
begin
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU630.dgInfoCellClick(Column: TColumnEh);
begin
//
end;

//==============================================================================
// ComboChange
//==============================================================================
procedure TfrmU630.ComboChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// CommLogClick
//==============================================================================
procedure TfrmU630.CommLogClick(Sender: TObject);
begin
  CommMemo.Lines.Clear;
  if (CommLog.Items.Count <> 0) and
     (Commlog.ItemIndex <> -1) and
     (CommLog.Items.Count >= Commlog.ItemIndex) then
  begin
    CommMemo.Lines.Add(' ');
    CommMemo.Lines.Add(' '+Commlog.Items[Commlog.ItemIndex]);
  end;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU630.cbKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin

  end;
end;

//==============================================================================
// DatePickerChange
//==============================================================================
procedure TfrmU630.DatePickerChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// edtChange
//==============================================================================
procedure TfrmU630.edtChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU630.KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
  //
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU630.sbtClearClick(Sender: TObject);
begin
  DatePicker1.Date := Now;
  cbTime1.Text := '00H';
  fnCommandQuery;
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU630.edtFontSizeChange(Sender: TObject);
begin
  CommLog.Font.Size  := StrToIntDef((Sender as TEdit).Text,11);
  CommMemo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// ColorBox1Change
//==============================================================================
procedure TfrmU630.ColorBox1Change(Sender: TObject);
begin
  CommLog.Color := (Sender as TColorBox).Selected;
  IniWrite( INI_PATH, 'IO_Info', 'COLOR_630_1' , ColorToString((Sender as TColorBox).Selected) );
end;

//==============================================================================
// ColorBox2Change
//==============================================================================
procedure TfrmU630.ColorBox2Change(Sender: TObject);
begin
  CommLog.Font.Color := (Sender as TColorBox).Selected;
  IniWrite( INI_PATH, 'IO_Info', 'COLOR_630_2' , ColorToString((Sender as TColorBox).Selected) );
end;

end.

