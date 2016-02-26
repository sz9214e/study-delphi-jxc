object FrmStockIn: TFrmStockIn
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #36827#36135#21333#25454#32500#25252
  ClientHeight = 392
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 97
    Align = alTop
    TabOrder = 0
    object Edit1: TEdit
      Left = 112
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 15
      Width = 90
      Height = 17
      Caption = #21333#25454#32534#21495#65306
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 112
      Top = 46
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object CheckBox2: TCheckBox
      Left = 16
      Top = 41
      Width = 90
      Height = 17
      Caption = #21046#21333#20154#21592#65306
      TabOrder = 3
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 97
    Width = 774
    Height = 295
    ActivePage = 单头数据
    Align = alClient
    TabOrder = 1
    object 单头数据: TTabSheet
      Caption = #21333#22836#25968#25454
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 766
        Height = 242
        Align = alClient
        DataSource = dsTranH
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'Type_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #21333#25454#31867#21035
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TBDate_'
            Title.Alignment = taCenter
            Title.Caption = #21046#21333#26085#26399
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TBNo_'
            Title.Alignment = taCenter
            Title.Caption = #21333#25454#32534#21495
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AppUser_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #21046#21333#20154#21592
            Width = 65
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 242
        Width = 766
        Height = 25
        DataSource = dsTranH
        Align = alBottom
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #21333#36523#25968#25454
      ImageIndex = 1
      OnShow = TabSheet2Show
      object DBGrid2: TDBGrid
        Left = 0
        Top = 41
        Width = 766
        Height = 201
        Align = alClient
        DataSource = dsTranB
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'It_'
            Title.Alignment = taCenter
            Title.Caption = #24207
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PartCode_'
            Title.Alignment = taCenter
            Title.Caption = #26009#21495
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Desc_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #21697#21517
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 145
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Spec_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #35268#26684
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 165
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Unit_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #21333#20301
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Num_'
            Title.Alignment = taCenter
            Title.Caption = #25968#37327
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Final_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #36807#24080#21542
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 65
            Visible = True
          end>
      end
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 242
        Width = 766
        Height = 25
        DataSource = dsTranB
        Align = alBottom
        TabOrder = 1
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 766
        Height = 41
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 2
        object Button3: TButton
          Left = 12
          Top = 10
          Width = 75
          Height = 25
          Caption = #36807#24080'(T)'
          TabOrder = 0
          OnClick = Button3Click
        end
      end
    end
  end
  object Button1: TButton
    Left = 504
    Top = 11
    Width = 75
    Height = 25
    Caption = #26597#35810'(&F)'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 504
    Top = 42
    Width = 75
    Height = 25
    Caption = #20851#38381'(&C)'
    TabOrder = 3
    OnClick = Button2Click
  end
  object cdsTranH: TADOQuery
    Connection = FrmMain.adoConn
    CursorType = ctStatic
    OnNewRecord = cdsTranHNewRecord
    Parameters = <>
    SQL.Strings = (
      'select * from TranH')
    Left = 192
    Top = 192
    object cdsTranHID_: TGuidField
      FieldName = 'ID_'
      FixedChar = True
      Size = 38
    end
    object cdsTranHTBDate_: TDateTimeField
      FieldName = 'TBDate_'
    end
    object cdsTranHTBNo_: TWideStringField
      FieldName = 'TBNo_'
      Size = 14
    end
    object cdsTranHType_: TIntegerField
      FieldName = 'Type_'
      OnGetText = cdsTranHType_GetText
    end
    object cdsTranHAppUser_: TWideStringField
      FieldName = 'AppUser_'
      Size = 10
    end
  end
  object cdsTranB: TADOQuery
    Connection = FrmMain.adoConn
    CursorType = ctStatic
    OnNewRecord = cdsTranBNewRecord
    Parameters = <>
    SQL.Strings = (
      'select * from TranB')
    Left = 288
    Top = 192
    object cdsTranBPID_: TGuidField
      FieldName = 'PID_'
      FixedChar = True
      Size = 38
    end
    object cdsTranBIt_: TIntegerField
      FieldName = 'It_'
    end
    object cdsTranBPartCode_: TWideStringField
      FieldName = 'PartCode_'
      OnChange = cdsTranBPartCode_Change
      OnValidate = cdsTranBPartCode_Validate
      Size = 18
    end
    object cdsTranBDesc_: TWideStringField
      FieldName = 'Desc_'
      Size = 100
    end
    object cdsTranBSpec_: TWideStringField
      FieldName = 'Spec_'
      Size = 100
    end
    object cdsTranBUnit_: TWideStringField
      FieldName = 'Unit_'
      Size = 4
    end
    object cdsTranBNum_: TBCDField
      FieldName = 'Num_'
      Precision = 18
    end
    object cdsTranBPDNum_: TWideStringField
      FieldName = 'PDNum_'
      Size = 18
    end
    object cdsTranBFinal_: TBooleanField
      FieldName = 'Final_'
      OnGetText = cdsTranBFinal_GetText
    end
  end
  object dsTranH: TDataSource
    DataSet = cdsTranH
    Left = 192
    Top = 272
  end
  object dsTranB: TDataSource
    DataSet = cdsTranB
    Left = 288
    Top = 272
  end
end
