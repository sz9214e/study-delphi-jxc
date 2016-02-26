object DlgLogin: TDlgLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #27426#36814#20351#29992#36827#38144#23384#31995#32479
  ClientHeight = 212
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 48
    Width = 60
    Height = 13
    Caption = #29992#25143#24080#21495#65306
  end
  object Label2: TLabel
    Left = 96
    Top = 88
    Width = 60
    Height = 13
    Caption = #29992#25143#23494#30721#65306
  end
  object edtAccount: TEdit
    Left = 160
    Top = 45
    Width = 233
    Height = 21
    TabOrder = 0
    Text = 'admin'
  end
  object edtPassword: TEdit
    Left = 160
    Top = 85
    Width = 233
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'admin'
  end
  object btnLogin: TButton
    Left = 208
    Top = 144
    Width = 75
    Height = 25
    Caption = #30331#20837'(&L)'
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object btnClose: TButton
    Left = 318
    Top = 144
    Width = 75
    Height = 25
    Caption = #20851#38381'(&C)'
    TabOrder = 3
    OnClick = btnCloseClick
  end
end
