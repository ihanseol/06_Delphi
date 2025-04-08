object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 537
  ClientWidth = 777
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 0
    Top = 496
    Width = 233
    Height = 33
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 239
    Top = 496
    Width = 233
    Height = 33
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 345
    Height = 23
    TabOrder = 2
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 8
    Top = 53
    Width = 761
    Height = 437
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
