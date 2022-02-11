unit ItemSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, d_MainDm, h_MainLib, h_ReferLib,
  DB, ADODB, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.Mask, Vcl.DBCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmItemSearch = class(TForm)
    Pnl_Main: TPanel;
    Pnl_Sub: TPanel;
    Pnl_Top: TPanel;
    Pnl_BTN: TPanel;
    Pnl_Btn5: TPanel;
    btnClose: TSpeedButton;
    Panel24: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    PnlFormName: TPanel;
    dsInfo: TDataSource;
    Pnl_Base: TPanel;
    Panel1: TPanel;
    dgInfo: TDBGridEh;
    Panel2: TPanel;
    Panel3: TPanel;
    edtCode: TEdit;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel4: TPanel;
    cbSTOCK_EXIST: TCheckBox;
    qryInfo: TADOQuery;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel7: TPanel;
    Panel9: TPanel;
    lblITEM_CODE1: TLabel;
    lblITEM_CODE2: TLabel;
    Panel10: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Panel11: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel12: TPanel;
    Panel16: TPanel;
    SlectCnt: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject);
    procedure dgInfoDblClick(Sender: TObject);
    procedure sbtClearClick(Sender: TObject);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodeChange(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
  private
    procedure SetItemList;
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmItemSearch: TfrmItemSearch;
  SrtFlag : integer = 0 ;

implementation

{$R *.dfm}

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmItemSearch.FormActivate(Sender: TObject);
begin
  lblITEM_CODE1.Caption := '';
  lblITEM_CODE2.Caption := '';
  SetItemList;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmItemSearch.FormDeactivate(Sender: TObject);
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
procedure TfrmItemSearch.FormClose(Sender: TObject; var Action: TCloseAction);
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
  try frmItemSearch := Nil ;
  except end;
end;

//==============================================================================
// btnCloseClick
//==============================================================================
procedure TfrmItemSearch.btnCloseClick(Sender: TObject);
begin
  if qryInfo.Active then qryInfo.Close;
  Close;
end;

//==============================================================================
// SetItemList
//==============================================================================
procedure TfrmItemSearch.SetItemList;
var
  WhereStr, StrSQL : String;
begin
  try
    WhereStr := '' ;

    // 前格内靛/前格疙
    if (Trim(edtCode.Text) <> '') then
      WhereStr := WhereStr + ' AND ( (T.ITEM_INFO_01 LIKE ' + QuotedStr('%'+edtCode.Text+'%')+ ') or ' +
                             '       (T.ITEM_INFO_02 LIKE ' + QuotedStr('%'+edtCode.Text+'%')+ ') or ' +
                             '       (T.ITEM_INFO_03 LIKE ' + QuotedStr('%'+edtCode.Text+'%')+ ') or ' +
                             '       (T.ITEM_INFO_04 LIKE ' + QuotedStr('%'+edtCode.Text+'%')+ ') )  ' ;

    // 犁绊乐绰前格
    if (cbSTOCK_EXIST.Checked) then
      WhereStr := WhereStr + ' AND T.QTY is NOT NULL  AND T.QTY <> 0 ' ;

    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT T.* ' +
                '   FROM ( SELECT ROW_NUMBER() OVER(ORDER BY ITEM.ITEM_INFO_01) as IDX, ITEM.*, ' +
                '                ISNULL((SELECT SUM(ITEM_QTY) ' +
                '                          FROM TT_RACK_STOCK S WITH (NOLOCK) ' +
                '                          LEFT JOIN TT_RACK R  WITH (NOLOCK) ' +
                '                            ON S.RACK_LOC = R.RACK_LOC ' +
                '                         WHERE S.ITEM_INFO_01 = ITEM.ITEM_INFO_01 ' +
                '                           AND R.RACK_STAT  <>''后发'' ' +
                '                           AND R.ORDER_STAT = ''绝澜'' ' +
                '                           AND R.ERR_STAT   = ''绝澜'' ' +
                '                         GROUP BY S.ITEM_INFO_01),0) QTY ' +
                '          	 FROM TM_ITEM ITEM ) T ' +
                '  WHERE 1=1 ' + WhereStr ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      TraceLogWrite('前格茫扁 - 俊矾['+E.Message+'], 孽府['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// CheckBoxClick
//==============================================================================
procedure TfrmItemSearch.CheckBoxClick(Sender: TObject);
begin
  SetItemList;
end;

//==============================================================================
// edtCodeChange
//==============================================================================
procedure TfrmItemSearch.edtCodeChange(Sender: TObject);
begin
  SetItemList;
end;

//==============================================================================
// edtCodeKeyPress
//==============================================================================
procedure TfrmItemSearch.edtCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if      (Key = #13) then SetItemList  // Enter
  else if (Key = #27) then Close;
end;

//==============================================================================
// CheckBoxClick
//==============================================================================
procedure TfrmItemSearch.dgInfoDblClick(Sender: TObject);
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  m.Popup_ItemInfo.DATA01 := qryInfo.FieldByName('ITEM_INFO_01').AsString; // 馆力前内靛
  m.Popup_ItemInfo.DATA02 := qryInfo.FieldByName('ITEM_INFO_02').AsString; // 馆力前疙
  m.Popup_ItemInfo.DATA03 := qryInfo.FieldByName('ITEM_INFO_03').AsString; // 力前内靛
  m.Popup_ItemInfo.DATA04 := qryInfo.FieldByName('ITEM_INFO_04').AsString; // 力前疙
  m.Popup_ItemInfo.DATA05 := qryInfo.FieldByName('ITEM_INFO_05').AsString; //
  m.Popup_ItemInfo.DATA06 := qryInfo.FieldByName('ITEM_INFO_06').AsString; //
  m.Popup_ItemInfo.DATA07 := qryInfo.FieldByName('ITEM_INFO_07').AsString; //
  m.Popup_ItemInfo.DATA08 := qryInfo.FieldByName('ITEM_INFO_08').AsString; //
  m.Popup_ItemInfo.DATA09 := qryInfo.FieldByName('ITEM_INFO_09').AsString; //
  m.Popup_ItemInfo.DATA10 := qryInfo.FieldByName('ITEM_INFO_10').AsString; //
  m.Popup_ItemInfo.QTY    := qryInfo.FieldByName('ITEM_QTY'    ).AsInteger; //
  m.Popup_ItemInfo.WEIGHT := qryInfo.FieldByName('ITEM_WEIGHT' ).AsInteger; //
  m.Popup_ItemInfo.ResultCd := 'OK';
  qryInfo.Close;
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmItemSearch.dgInfoCellClick(Column: TColumnEh);
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;
  if dgInfo.SelectedRows.Count  < 1 then Exit;

  lblITEM_CODE1.Caption := qryInfo.FieldByName('ITEM_INFO_01').AsString;
  lblITEM_CODE2.Caption   := qryInfo.FieldByName('ITEM_INFO_03').AsString;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmItemSearch.sbtClearClick(Sender: TObject);
begin
  edtCode.Text := '';
  cbSTOCK_EXIST.Checked := False;
  lblITEM_CODE1.Caption := '';
  lblITEM_CODE1.Caption := '';
  dgInfo.SelectedRows.Clear;
  SetItemList;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmItemSearch.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (qryInfo.Active) and
     (qryInfo.RecordCount > 0) and
     (Key = #13) then
  begin
    dgInfoDblClick(nil);
  end else
  if (Key = #27) then Close;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmItemSearch.dgInfoTitleClick(Column: TColumnEh);
begin
  if Column.Field.DataSet is TADOQuery then
  begin
    with TADOQuery(Column.Field.DataSet) do
    begin
      if RecordCount=0 then Exit ;
      if SrtFlag = 0 then
      begin
        SrtFlag := 1; Sort := Column.FieldName + ' DESC' ;
      end else
      begin
        SrtFlag := 0; Sort := Column.FieldName + ' ASC' ;
      end;
    end;
  end;
end;

end.
