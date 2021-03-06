program POSCOCMC_AWS;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  d_MainDm in 'Lib\d_MainDm.pas' {MainDm: TDataModule},
  h_MainLib in 'Lib\h_MainLib.pas',
  h_ReferLib in 'Lib\h_ReferLib.pas',
  Main in 'Form\Main.pas' {frmMain},
  Login in 'Form\Login.pas' {frmLoginBox},
  SetUp in 'Form\SetUp.pas' {frmSetUpBox},
  U210 in 'Form\U210.pas' {frmU210},
  ItemSearch in 'Form\ItemSearch.pas' {frmItemSearch},
  U220 in 'Form\U220.pas' {frmU220},
  U240 in 'Form\U240.pas' {frmU240},
  U250 in 'Form\U250.pas' {frmU250},
  U310 in 'Form\U310.pas' {frmU310},
  U320 in 'Form\U320.pas' {frmU320},
  U410 in 'Form\U410.pas' {frmU410},
  U420 in 'Form\U420.pas' {frmU420},
  U430 in 'Form\U430.pas' {frmU430},
  U440 in 'Form\U440.pas' {frmU440},
  U510 in 'Form\U510.pas' {frmU510},
  U520 in 'Form\U520.pas' {frmU520},
  U540 in 'Form\U540.pas' {frmU540},
  U550 in 'Form\U550.pas' {frmU550},
  U620 in 'Form\U620.pas' {frmU620},
  U630 in 'Form\U630.pas' {frmU630},
  U610 in 'Form\U610.pas' {frmU610},
  ChangeLocation in 'Form\ChangeLocation.pas' {frmChangeLocation},
  U230 in 'Form\U230.pas' {frmU230},
  U530 in 'Form\U530.pas' {frmU530},
  U110 in 'Form\U110.pas' {frmU110},
  U110_Pop in 'Form\U110_Pop.pas' {frmU110_Pop},
  U120 in 'Form\U120.pas' {frmU120},
  U120_Pop in 'Form\U120_Pop.pas' {frmU120_Pop},
  U330 in 'Form\U330.pas' {frmU330},
  U340 in 'Form\U340.pas' {frmU340},
  U350 in 'Form\U350.pas' {frmU350},
  U360 in 'Form\U360.pas' {frmU360},
  U380 in 'Form\U380.pas' {frmU380},
  U370 in 'Form\U370.pas' {frmU370},
  U390 in 'Form\U390.pas' {frmU390};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '포스코케미칼 자동창고 관리 시스템';
  Application.CreateForm(TMainDm, MainDm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
