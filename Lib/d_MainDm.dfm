object MainDm: TMainDm
  OldCreateOrder = False
  Height = 247
  Width = 272
  object MainDatabase: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Admin123;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=FOODNAMOO;Data Source=192.168.0.146\' +
      'foodnamoomssql'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    AfterConnect = MainDatabaseAfterConnect
    AfterDisconnect = MainDatabaseAfterDisconnect
    Left = 40
    Top = 24
  end
  object qrySearch: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 96
    Top = 24
  end
  object saveDlg: TSaveDialog
    Left = 144
    Top = 24
  end
end
