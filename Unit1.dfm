object Form1: TForm1
  Left = 1674
  Top = 133
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'EXE Password Protector'
  ClientHeight = 556
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 32
    Top = 72
    Width = 210
    Height = 13
    Caption = 'Encrypt your 32 Bit PE-EXE with a Password'
    OnMouseDown = Label5MouseDown
  end
  object Label6: TLabel
    Left = 32
    Top = 88
    Width = 130
    Height = 13
    Caption = 'Don'#39't forget the Password.'
    OnMouseDown = Label6MouseDown
  end
  object Label7: TLabel
    Left = 320
    Top = 88
    Width = 134
    Height = 13
    Caption = #169' Copyright hackbard 2024'
    Enabled = False
    OnMouseDown = Label7MouseDown
  end
  object Label10: TLabel
    Left = 352
    Top = 14
    Width = 100
    Height = 13
    Caption = 'Build : 2024.001.704'
    Enabled = False
    OnMouseDown = Label10MouseDown
  end
  object Label11: TLabel
    Left = 24
    Top = 29
    Width = 372
    Height = 45
    Caption = 'EXE Password Protector'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Impact'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button2: TButton
    Left = 536
    Top = 272
    Width = 75
    Height = 25
    Caption = 'crypter'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 536
    Top = 40
    Width = 273
    Height = 225
    TabStop = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 537
    Width = 482
    Height = 19
    Panels = <
      item
        Text = 'File :'
        Width = 40
      end
      item
        Width = 130
      end
      item
        Text = 'Size :'
        Width = 40
      end
      item
        Text = '0 Kb'
        Width = 100
      end
      item
        Text = 'Type :'
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 120
    Width = 465
    Height = 409
    ActivePage = TabSheet1
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Protector'
      object Label3: TLabel
        Left = 8
        Top = 352
        Width = 49
        Height = 13
        Caption = 'Progress :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 392
        Top = 352
        Width = 57
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object Label8: TLabel
        Left = 20
        Top = 328
        Width = 36
        Height = 13
        Caption = 'Blocks :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 64
        Top = 328
        Width = 12
        Height = 13
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 441
        Height = 57
        Caption = ' Select EXE File '
        TabOrder = 0
        object Edit2: TEdit
          Left = 16
          Top = 24
          Width = 369
          Height = 21
          TabOrder = 0
        end
        object Button1: TButton
          Left = 392
          Top = 24
          Width = 33
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = Button1Click
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 72
        Width = 441
        Height = 145
        Caption = ' Password '
        TabOrder = 1
        object Label2: TLabel
          Left = 11
          Top = 56
          Width = 34
          Height = 13
          Caption = 'Force :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label4: TLabel
          Left = 10
          Top = 81
          Width = 36
          Height = 13
          Caption = 'Count :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label12: TLabel
          Left = 16
          Top = 120
          Width = 30
          Height = 13
          Caption = 'Char :'
        end
        object Edit1: TEdit
          Left = 16
          Top = 24
          Width = 369
          Height = 21
          Color = clWhite
          TabOrder = 0
        end
        object Button3: TButton
          Left = 392
          Top = 24
          Width = 33
          Height = 22
          Caption = 'gen'
          TabOrder = 1
          OnClick = Button3Click
        end
        object ProgressBar2: TProgressBar
          Left = 56
          Top = 56
          Width = 329
          Height = 17
          TabOrder = 2
        end
        object SpinEdit2: TSpinEdit
          Left = 56
          Top = 80
          Width = 121
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
          OnChange = SpinEdit2Change
          OnClick = SpinEdit2Click
          OnKeyPress = SpinEdit2KeyPress
          OnKeyUp = SpinEdit2KeyUp
        end
        object RadioButton1: TRadioButton
          Left = 56
          Top = 120
          Width = 41
          Height = 17
          Caption = 'HEX'
          TabOrder = 4
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 120
          Top = 120
          Width = 65
          Height = 17
          Caption = 'Numbers'
          TabOrder = 5
          OnClick = RadioButton2Click
        end
        object RadioButton4: TRadioButton
          Left = 288
          Top = 120
          Width = 57
          Height = 17
          Caption = 'Custom'
          TabOrder = 6
          OnClick = RadioButton4Click
        end
        object RadioButton3: TRadioButton
          Left = 208
          Top = 120
          Width = 57
          Height = 17
          Caption = 'Letters'
          TabOrder = 7
          OnClick = RadioButton3Click
        end
      end
      object ProgressBar1: TProgressBar
        Left = 64
        Top = 354
        Width = 313
        Height = 12
        Smooth = True
        TabOrder = 2
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 224
        Width = 441
        Height = 89
        Caption = ' Crypted File '
        TabOrder = 3
        object Button5: TButton
          Left = 344
          Top = 56
          Width = 75
          Height = 25
          Caption = 'Create EXE'
          TabOrder = 0
          OnClick = Button5Click
        end
        object Button4: TButton
          Left = 8
          Top = 56
          Width = 75
          Height = 25
          Caption = 'Test EXE'
          TabOrder = 1
          OnClick = Button4Click
        end
        object Edit3: TEdit
          Left = 16
          Top = 24
          Width = 409
          Height = 21
          TabOrder = 2
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Analyze'
      ImageIndex = 1
      object ListBox1: TListBox
        Left = 8
        Top = 24
        Width = 217
        Height = 177
        ItemHeight = 13
        TabOrder = 0
      end
      object ListBox2: TListBox
        Left = 232
        Top = 24
        Width = 217
        Height = 177
        ItemHeight = 13
        TabOrder = 1
      end
      object Memo2: TMemo
        Left = 8
        Top = 208
        Width = 217
        Height = 169
        ScrollBars = ssBoth
        TabOrder = 2
      end
      object Memo3: TMemo
        Left = 232
        Top = 208
        Width = 217
        Height = 169
        ScrollBars = ssBoth
        TabOrder = 3
      end
      object Header1: THeader
        Left = 8
        Top = 0
        Width = 217
        Height = 18
        BorderStyle = bsNone
        Sections.Sections = (
          #0'145'#0'                          Original File:')
        TabOrder = 4
      end
      object Header2: THeader
        Left = 232
        Top = 0
        Width = 217
        Height = 18
        BorderStyle = bsNone
        Sections.Sections = (
          #0'150'#0'                        Protected File:')
        TabOrder = 5
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Options'
      ImageIndex = 2
      object CheckBox2: TCheckBox
        Left = 16
        Top = 104
        Width = 89
        Height = 17
        Caption = ' Make Backup'
        TabOrder = 0
      end
      object CheckBox3: TCheckBox
        Left = 16
        Top = 128
        Width = 105
        Height = 17
        Caption = ' Save Passwords'
        TabOrder = 1
      end
      object CheckBox4: TCheckBox
        Left = 16
        Top = 152
        Width = 121
        Height = 17
        Caption = ' Save last Password'
        TabOrder = 2
      end
      object CheckBox5: TCheckBox
        Left = 16
        Top = 176
        Width = 153
        Height = 17
        Caption = ' Clear Backup Folder by end'
        TabOrder = 3
      end
      object CheckBox6: TCheckBox
        Left = 16
        Top = 256
        Width = 177
        Height = 17
        Caption = ' Report Windows File Description'
        TabOrder = 4
      end
      object CheckBox7: TCheckBox
        Left = 16
        Top = 280
        Width = 213
        Height = 17
        Caption = ' Analyze Dump DOS Header Information'
        TabOrder = 5
      end
      object CheckBox8: TCheckBox
        Left = 16
        Top = 304
        Width = 201
        Height = 17
        Caption = ' Analyze Dump PE Header Information'
        TabOrder = 6
      end
      object CheckBox10: TCheckBox
        Left = 256
        Top = 104
        Width = 105
        Height = 17
        Caption = ' Time Calculation'
        TabOrder = 7
      end
      object CheckBox9: TCheckBox
        Left = 16
        Top = 328
        Width = 233
        Height = 17
        Caption = ' Analyze Dump Optional Header Information '
        TabOrder = 8
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 16
        Width = 425
        Height = 65
        Caption = ' 64 Bit Executables '
        TabOrder = 9
        object CheckBox1: TCheckBox
          Left = 48
          Top = 40
          Width = 161
          Height = 17
          Caption = ' Try Crypt 64 Bit Executable'
          TabOrder = 0
        end
      end
      object CheckBox11: TCheckBox
        Left = 256
        Top = 128
        Width = 43
        Height = 17
        Caption = ' Size'
        TabOrder = 10
      end
      object CheckBox12: TCheckBox
        Left = 256
        Top = 152
        Width = 49
        Height = 17
        Caption = ' 8 Bit'
        TabOrder = 11
      end
      object CheckBox13: TCheckBox
        Left = 256
        Top = 176
        Width = 49
        Height = 17
        Caption = ' 16 Bit'
        TabOrder = 12
      end
      object CheckBox14: TCheckBox
        Left = 256
        Top = 200
        Width = 53
        Height = 17
        Caption = ' 32 Bit'
        TabOrder = 13
      end
      object CheckBox15: TCheckBox
        Left = 256
        Top = 224
        Width = 51
        Height = 17
        Caption = ' 64 Bit'
        TabOrder = 14
      end
    end
  end
  object Button7: TButton
    Left = 536
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Analyze'
    TabOrder = 4
    OnClick = Button7Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Executable (*.EXE)|*.exe'
    Left = 176
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'exe'
    Filter = 'Executable (*.EXE)|*.exe'
    Left = 208
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 150
    OnTimer = Timer1Timer
    Left = 240
    Top = 8
  end
end
