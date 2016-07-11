inherited AReportDm: TAReportDm
  OldCreateOrder = True
  Height = 359
  Width = 509
  inherited SQLDatabase: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\WebProjects\AUST' +
      'RESSTenderDatabase\data 97.mdb;Persist Security Info=False'
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
  end
  object QryTenderWonLost: TADOQuery
    Connection = SQLDatabase
    CursorType = ctStatic
    AfterOpen = QryMainAfterOpen
    AfterInsert = QryMainAfterInsert
    Parameters = <>
    SQL.Strings = (
      
        'select [Tender Id], [Tender No], Project, Location, Client, Type' +
        ', Value, Date, [Start date],'
      
        ' Priority, Comments, [Action by], division, [Business Centre], s' +
        'tatus,'
      '(select top 1 CStr(Iif(IsNull([Comment]),"",[Comment]))'
      ' FROM [Tenders Comment] as C where C.[Tender Id] = X.[Tender Id]'
      ' and C.[Comment Id] = (Select MAX([Comment Id])'
      
        ' from [Tenders Comment] M where M.[Tender Id]=C.[Tender Id] )) a' +
        's comment from [Tenders]  X'
      '')
    Left = 44
    Top = 184
  end
  object DsTenderWonList: TDataSource
    DataSet = QryTenderWonLost
    Left = 44
    Top = 135
  end
  object QryTenderSummary: TADOQuery
    Connection = SQLDatabase
    AfterOpen = QryMainAfterOpen
    AfterInsert = QryMainAfterInsert
    Parameters = <>
    SQL.Strings = (
      
        'select YY, MM, sum(DeadVal) as Dead, sum(LostVal) as Lost, sum(L' +
        'iveVal) as Live,'
      'sum(WonVal) as Won, dead+lost+Live+Won as Grandcount,'
      
        'sum(deadm) as deadmt, sum(lostm) as lostmt, sum(Livem) as Livemt' +
        ', sum(wonm) as wonmt,'
      'deadmt+lostmt+livemt+wonmt as Grandtotal'
      ''
      ''
      'from'
      '('
      ''
      'select YY, MM,'
      'iif(stat='#39'Dead'#39', count(*),0) as DeadVal,'
      'iif(stat='#39'Lost'#39', count(*),0) as LostVal,'
      'iif(stat='#39'Live'#39', count(*),0) as LiveVal,'
      'iif(stat='#39'Won'#39', count(*),0) as WonVal,'
      ''
      'iif(stat='#39'Dead'#39', sum(value),0) as Deadm,'
      'iif(stat='#39'Lost'#39', sum(value),0) as Lostm,'
      'iif(stat='#39'Live'#39', sum(value),0) as Livem,'
      'iif(stat='#39'Won'#39', sum(value),0) as Wonm,'
      ''
      ''
      'stat'
      'from'
      '('
      
        'SELECT year([date]) as YY, month([date]) as MM,  Mid([status],13' +
        ') AS Stat, Tenders.Division, Tenders.Type, Tenders.Date, Tenders' +
        '.Value, Tenders.[Business Centre]'
      'FROM Tenders'
      
        'WHERE  ((Tenders.Date) Is Not Null) AND ((Tenders.Value)>0) AND ' +
        '((Tenders.Status) Like "submitted%") and  Year([date]) & Format(' +
        'Month([date]),"00") >= '#39'200305'#39' and Division ='#39'building'#39' and [bu' +
        'siness centre] in ('#39'nsw'#39', '#39'vic'#39', '#39'qld'#39', '#39'overseas'#39', '#39'miscellaneo' +
        'us'#39')'
      ') as Oktbl'
      'group by stat, YY, MM'
      'order by YY, MM'
      ''
      ') as badtbl'
      'group by YY, MM')
    Left = 152
    Top = 184
  end
  object DsTenderSummary: TDataSource
    DataSet = QryTenderSummary
    Left = 152
    Top = 143
  end
  object QryTenderSummary2: TADOQuery
    Connection = SQLDatabase
    AfterOpen = QryMainAfterOpen
    AfterInsert = QryMainAfterInsert
    Parameters = <>
    SQL.Strings = (
      
        'select type, sum(DeadVal) as Dead, sum(LostVal) as Lost, sum(Liv' +
        'eVal) as Live,'
      'sum(WonVal) as Won, dead+lost+Live+Won as Grandcount,'
      
        'sum(deadm) as deadmt, sum(lostm) as lostmt, sum(Livem) as Livemt' +
        ', sum(wonm) as wonmt,'
      'deadmt+lostmt+livemt+wonmt as Grandtotal'
      ''
      ''
      'from'
      '('
      ''
      'select type,'
      'iif(stat='#39'Dead'#39', count(*),0) as DeadVal,'
      'iif(stat='#39'Lost'#39', count(*),0) as LostVal,'
      'iif(stat='#39'Live'#39', count(*),0) as LiveVal,'
      'iif(stat='#39'Won'#39', count(*),0) as WonVal,'
      ''
      'iif(stat='#39'Dead'#39', sum(value),0) as Deadm,'
      'iif(stat='#39'Lost'#39', sum(value),0) as Lostm,'
      'iif(stat='#39'Live'#39', sum(value),0) as Livem,'
      'iif(stat='#39'Won'#39', sum(value),0) as Wonm,'
      ''
      ''
      'stat'
      'from'
      '('
      
        'SELECT year([date]) as YY, month([date]) as MM,  Mid([status],13' +
        ') AS Stat, Tenders.Division, Tenders.Type, Tenders.Date, Tenders' +
        '.Value, Tenders.[Business Centre]'
      'FROM Tenders'
      
        'WHERE  ((Tenders.Date) Is Not Null) AND ((Tenders.Value)>0) AND ' +
        '((Tenders.Status) Like "submitted%") and  Year([date]) & Format(' +
        'Month([date]),"00") >= '#39'200305'#39' and Division ='#39'building'#39' and [bu' +
        'siness centre] in ('#39'nsw'#39', '#39'vic'#39', '#39'qld'#39', '#39'overseas'#39', '#39'miscellaneo' +
        'us'#39')'
      ') as Oktbl'
      'group by stat, type'
      'order by type'
      ''
      ') as badtbl'
      'group by type')
    Left = 252
    Top = 188
  end
  object DsTendersSummary: TDataSource
    DataSet = QryTenderSummary2
    Left = 252
    Top = 143
  end
end
