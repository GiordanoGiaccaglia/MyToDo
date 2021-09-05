object FrameTask: TFrameTask
  Left = 0
  Top = 0
  Width = 615
  Height = 32
  Align = alTop
  TabOrder = 0
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 459
    Height = 26
    Align = alClient
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seClient, seBorder]
    ExplicitWidth = 59
    ExplicitHeight = 24
  end
  object BitBtn1: TBitBtn
    Left = 465
    Top = 0
    Width = 75
    Height = 32
    Align = alRight
    Caption = 'Done'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 540
    Top = 0
    Width = 75
    Height = 32
    Align = alRight
    Caption = 'Delete'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn2Click
  end
end
