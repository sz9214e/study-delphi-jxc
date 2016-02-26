object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = #31616#26131#36827#38144#23384'V0.1'
  ClientHeight = 662
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 136
    Top = 80
    object N1: TMenuItem
      Caption = #26009#21495#32500#25252
      object N4: TMenuItem
        Caption = #26009#21495#22522#26412#26723#32500#25252
        OnClick = N4Click
      end
    end
    object N2: TMenuItem
      Caption = #21333#25454#32500#25252
      object N5: TMenuItem
        Caption = #36827#36135#21333#32500#25252
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #38144#36135#21333#32500#25252
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #30424#28857#21333#32500#25252
      end
    end
    object N3: TMenuItem
      Caption = #25253#34920#26597#35810
      object N8: TMenuItem
        Caption = #24403#21069#24211#23384#26597#35810
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #36827#20986#24211#23384#26126#32454#26597#35810
        OnClick = N9Click
      end
    end
  end
  object adoConn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI10.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=JXC;Data Source=zhanggong\s' +
      'qlexpress;Initial File Name="";Server SPN=""'
    LoginPrompt = False
    Provider = 'SQLNCLI10.1'
    Left = 136
    Top = 136
  end
end
