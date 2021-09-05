object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'MyTodo'
  ClientHeight = 512
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Edit1: TEdit
      Left = 16
      Top = 19
      Width = 353
      Height = 21
      TabOrder = 0
    end
    object btnAdd: TButton
      Left = 384
      Top = 17
      Width = 75
      Height = 25
      Caption = '+'
      TabOrder = 1
      OnClick = btnAddClick
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 57
    Width = 472
    Height = 455
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 1
  end
end
