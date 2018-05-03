object Form2: TForm2
  Left = 398
  Top = 368
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1085#1085#1099#1093' '#1086' '#1090#1086#1074#1072#1088#1072#1093
  ClientHeight = 293
  ClientWidth = 518
  Color = 12373963
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 184
    Top = 64
    Width = 305
    Height = 97
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 92
    Height = 13
    Caption = #1062#1077#1085#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080':'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 21
    Top = 180
    Width = 117
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072':'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 24
    Top = 88
    Width = 67
    Height = 13
    Caption = #1062#1077#1085#1072' '#1079#1072#1082#1091#1087#1072':'
    FocusControl = DBEdit4
  end
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 60
    Height = 13
    Caption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072':'
  end
  object Label6: TLabel
    Left = 192
    Top = 72
    Width = 116
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1072' '#1089#1082#1083#1072#1076#1077':'
    FocusControl = DBEdit1
  end
  object Label5: TLabel
    Left = 208
    Top = 112
    Width = 62
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
  end
  object Label7: TLabel
    Left = 328
    Top = 72
    Width = 125
    Height = 13
    Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093
  end
  object DBText1: TDBText
    Left = 40
    Top = 152
    Width = 65
    Height = 17
    DataField = 'dPrice'
    DataSource = Form1.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 24
    Top = 136
    Width = 47
    Height = 13
    Caption = #1053#1072#1094#1077#1085#1082#1072':'
  end
  object DBEdit2: TDBEdit
    Left = 24
    Top = 64
    Width = 134
    Height = 21
    DataField = 'Price_retail'
    DataSource = Form1.DataSource1
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 24
    Top = 200
    Width = 465
    Height = 21
    AutoSize = False
    DataField = 'Name'
    DataSource = Form1.DataSource1
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 24
    Top = 104
    Width = 134
    Height = 21
    DataField = 'Price_wholesale'
    DataSource = Form1.DataSource1
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 240
    Width = 360
    Height = 33
    DataSource = Form1.DataSource1
    Hints.Strings = (
      #1053#1072' '#1087#1077#1088#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
      #1053#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      #1053#1072' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      #1053#1072' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1079#1072#1087#1080#1089#1100
      #1042#1089#1090#1072#1074#1082#1072' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
      #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      #1054#1090#1084#1077#1085#1072' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
      #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1089' '#1076#1080#1089#1082#1072)
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 424
    Top = 240
    Width = 73
    Height = 33
    Cancel = True
    Caption = #1074#1099#1093#1086#1076
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object DBEdit1: TDBEdit
    Left = 200
    Top = 88
    Width = 105
    Height = 21
    AutoSize = False
    Color = clSilver
    DataField = 'Amount'
    DataSource = Form1.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object SpinEdit1: TSpinEdit
    Left = 208
    Top = 128
    Width = 73
    Height = 22
    MaxValue = 999999999
    MinValue = 1
    TabOrder = 6
    Value = 1
  end
  object Button1: TButton
    Left = 320
    Top = 120
    Width = 65
    Height = 33
    Caption = #1087#1088#1080#1093#1086#1076
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 408
    Top = 120
    Width = 67
    Height = 33
    Caption = #1087#1088#1086#1076#1072#1085#1086
    TabOrder = 8
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 328
    Top = 88
    Width = 137
    Height = 21
    Date = 40261.049189085650000000
    Time = 40261.049189085650000000
    TabOrder = 9
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 104
    Top = 16
    Width = 393
    Height = 21
    DataField = 'Type_product'
    DataSource = Form1.DataSource1
    KeyField = 'Type_product'
    ListField = 'Name_type_product'
    ListSource = Form1.DataSource2
    TabOrder = 10
  end
end
