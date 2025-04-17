object frmFirstMain: TfrmFirstMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Get TM Cordinates'
  ClientHeight = 463
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 35
    Width = 45
    Height = 15
    Caption = 'Address '
  end
  object Button1: TButton
    Left = 568
    Top = 360
    Width = 209
    Height = 73
    Caption = 'Get TM Cordinate'
    TabOrder = 0
    OnClick = Button1Click
  end
  object editAddress: TEdit
    Left = 8
    Top = 56
    Width = 769
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'editAddress'
  end
  object memoResult: TMemo
    Left = 8
    Top = 111
    Width = 769
    Height = 202
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    Lines.Strings = (
      'memoResult')
    ParentFont = False
    TabOrder = 2
  end
end
