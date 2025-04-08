object PictureEditorDlg: TPictureEditorDlg
  Left = 232
  Top = 143
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Picture Editor'
  ClientHeight = 294
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  OnDestroy = FormDestroy
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 256
    Height = 245
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = -8
    ExplicitHeight = 294
    object ImagePanel: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 17
      Width = 244
      Height = 222
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 5
      Color = clWindow
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 16
      ExplicitWidth = 246
      ExplicitHeight = 235
      object Shape1: TShape
        Left = 5
        Top = 5
        Width = 234
        Height = 212
        Align = alClient
        Brush.Style = bsClear
        Pen.Style = psDot
        ExplicitWidth = 250
        ExplicitHeight = 225
      end
      object ImagePaintBox: TPaintBox
        Left = 5
        Top = 5
        Width = 234
        Height = 212
        Align = alClient
        OnPaint = ImagePaintBoxPaint
        ExplicitLeft = 45
        ExplicitTop = 10
        ExplicitWidth = 240
        ExplicitHeight = 225
      end
    end
  end
  object pnRight: TPanel
    Left = 256
    Top = 0
    Width = 88
    Height = 245
    Align = alRight
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    ExplicitHeight = 294
    object OKButton: TButton
      Left = 7
      Top = 21
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object HelpButton: TButton
      Left = 7
      Top = 87
      Width = 75
      Height = 25
      Caption = '&Help'
      TabOrder = 1
      OnClick = HelpButtonClick
    end
    object CancelButton: TButton
      Left = 7
      Top = 54
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 245
    Width = 344
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 253
    object Load: TButton
      Left = 10
      Top = 18
      Width = 75
      Height = 23
      Caption = '&Load...'
      TabOrder = 0
      OnClick = LoadClick
    end
    object Save: TButton
      Left = 93
      Top = 18
      Width = 75
      Height = 23
      Caption = '&Save...'
      TabOrder = 1
      OnClick = SaveClick
    end
    object Clear: TButton
      Left = 176
      Top = 18
      Width = 75
      Height = 23
      Caption = '&Clear'
      TabOrder = 2
      OnClick = ClearClick
    end
  end
  object OpenDialog: TOpenPictureDialog
    Filter = 
      'All (*.bmp;*.ico;*.emf;*.wmf)|*.bmp;*.ico;*.emf;*.wmf|Bitmaps (*' +
      '.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf' +
      '|Metafiles (*.wmf)|*.wmf'
    Left = 140
    Top = 20
  end
  object SaveDialog: TSavePictureDialog
    Filter = 
      'All (*.bmp;*.ico;*.emf;*.wmf)|*.bmp;*.ico;*.emf;*.wmf|Bitmaps (*' +
      '.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf' +
      '|Metafiles (*.wmf)|*.wmf'
    Options = [ofOverwritePrompt, ofEnableSizing]
    Left = 140
    Top = 52
  end
end
