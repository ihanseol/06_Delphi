inherited StringsEditDlg: TStringsEditDlg
  HelpContext = 26000
  ClientHeight = 317
  ExplicitHeight = 356
  TextHeight = 15
  inherited PanelBottom: TPanel
    Top = 268
    ExplicitTop = 268
    inherited CancelButton: TButton
      Left = 259
      ExplicitLeft = 259
    end
    inherited HelpButton: TButton
      Left = 342
      ExplicitLeft = 342
    end
    inherited OKButton: TButton
      Left = 176
      ExplicitLeft = 176
    end
  end
  object ToolBar1: TToolBar [1]
    Left = 0
    Top = 0
    Width = 429
    Height = 25
    AutoSize = True
    ButtonHeight = 25
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = ImageList
    Indent = 8
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 8
      Top = 0
      Action = FileOpen1
    end
    object ToolButton2: TToolButton
      Left = 33
      Top = 0
      Action = FileSave1
    end
    object ToolButton9: TToolButton
      Left = 58
      Top = 0
      Width = 10
      Caption = 'ToolButton9'
      ImageName = 'Clear'
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 68
      Top = 0
      Action = EditCut1
    end
    object ToolButton6: TToolButton
      Left = 93
      Top = 0
      Action = EditCopy1
    end
    object ToolButton7: TToolButton
      Left = 118
      Top = 0
      Action = EditPaste1
    end
    object ToolButton4: TToolButton
      Left = 143
      Top = 0
      Action = EditSelectAll1
    end
    object ToolButton8: TToolButton
      Left = 168
      Top = 0
      Action = EditDelete1
    end
    object ToolButton3: TToolButton
      Left = 193
      Top = 0
      Action = EditUndo1
    end
  end
  object Memo: TRichEdit [2]
    AlignWithMargins = True
    Left = 10
    Top = 35
    Width = 409
    Height = 199
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HideScrollBars = False
    ParentFont = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
    OnChange = UpdateStatus
    OnKeyDown = Memo1KeyDown
    OnSelectionChange = MemoSelectionChange
  end
  object StatusBar: TStatusBar [3]
    Left = 0
    Top = 244
    Width = 429
    Height = 24
    DoubleBuffered = True
    Panels = <
      item
        Style = psOwnerDraw
        Width = 100
      end
      item
        Style = psOwnerDraw
        Width = 100
      end
      item
        Style = psOwnerDraw
        Width = 200
      end>
    ParentDoubleBuffered = False
    SizeGrip = False
    OnDrawPanel = StatusBarDrawPanel
  end
  inherited OpenDialog: TOpenDialog
    Left = 336
    Top = 88
  end
  inherited SaveDialog: TSaveDialog
    Left = 340
    Top = 152
  end
  inherited StringEditorMenu: TPopupActionBar
    Left = 240
    Top = 88
  end
  object ImageList: TVirtualImageList
    Images = <
      item
        CollectionIndex = 643
        CollectionName = 'AppBuilderActions\OpenFile'
        Name = 'OpenFile'
        Description = 
          'StandardActions.ImageList1, ImageListDesignerForm.ImageList1, We' +
          'bBrowserActions.ImageList1, StyleDesignerToolbar.AppBuilder_Imag' +
          'eList1, AppBuilder.ImageList1'
      end
      item
        CollectionIndex = 644
        CollectionName = 'AppBuilderActions\SaveFile'
        Name = 'SaveFile'
        Description = 
          'TypeLibraryEditForm.ToolImageList, ConfigManagerForm.ImageList1,' +
          ' StandardActions.ImageList1, frmScreenTipsEdit.ImageList1, WebBr' +
          'owserActions.ImageList1, StringTableDialog.ImageList1, AppBuilde' +
          'r.ImageList1'
      end
      item
        CollectionIndex = 106
        CollectionName = 'AppBuilderActions\Undo'
        Name = 'Undo'
        Description = 
          'DeploymentFrame.ImageList1, PatchFrm.RefactoringImgList, HTMLDes' +
          'ignerCommands.ImageList1, StandardActions.ImageList1, WebBrowser' +
          'Actions.ImageList1, FrBeaconFencingMap.ImageList1, FileHistoryFr' +
          'ame.ImageList1, RefactoringForm.imglstRefactoring, AppBuilder.Im' +
          'ageList1'
      end
      item
        CollectionIndex = 107
        CollectionName = 'AppBuilderActions\Redo'
        Name = 'Redo'
        Description = 
          'HTMLDesignerCommands.ImageList1, StandardActions.ImageList1, Web' +
          'BrowserActions.ImageList1, FrBeaconFencingMap.ImageList1, AppBui' +
          'lder.ImageList1'
      end
      item
        CollectionIndex = 203
        CollectionName = 'AppBuilderActions\Cut'
        Name = 'Cut'
        Description = 
          'CppBrowWindow.ImageList1, BCCBrowFrameWindow.ImageList1, ObjectT' +
          'reeView.ImageList, EditorActionLists.EditorMenuImages, StandardA' +
          'ctions.ImageList1, WebBrowserActions.ImageList1, FileHistoryFram' +
          'e.ImageList1, StringTableDialog.ImageList1, AppBuilder.ImageList' +
          '1'
      end
      item
        CollectionIndex = 204
        CollectionName = 'AppBuilderActions\Copy'
        Name = 'Copy'
        Description = 
          'CppBrowWindow.ImageList1, BCCBrowFrameWindow.ImageList1, BuildGr' +
          'oupFrame.GroupImageList, ConfigMgrDlg.ImageList1, ObjectTreeView' +
          '.ImageList, EditorActionLists.EditorMenuImages, StandardActions.' +
          'ImageList1, WebBrowserActions.ImageList1, MessageHintFrm.ImageLi' +
          'st1, StringTableDialog.ImageList1, AppBuilder.ImageList1'
      end
      item
        CollectionIndex = 205
        CollectionName = 'AppBuilderActions\Paste'
        Name = 'Paste'
        Description = 
          'ObjectTreeView.ImageList, EditorActionLists.EditorMenuImages, St' +
          'andardActions.ImageList1, WebBrowserActions.ImageList1, StringTa' +
          'bleDialog.ImageList1, AppBuilder.ImageList1'
      end
      item
        CollectionIndex = 753
        CollectionName = 'AppBuilderActions\SelectAll'
        Name = 'SelectAll'
        Description = 'ConfigMgrDlg.ImageList1, AppBuilder.ImageList1'
      end
      item
        CollectionIndex = 26
        CollectionName = 'AppBuilderActions\Cancel'
        Name = 'Delete'
        Description = 
          'RegisteredTypeLibraryWindow.ImageList1, IntfSelWizard.ImageList1' +
          ', ListFrame.ArrowList, PropertyInspector.ilObjectInspector, Tool' +
          'Form.imgListToolbar, BindCompExprDesigner.ImageList1, ComponentT' +
          'oolbarFrame.imgListToolbar, FindReferencesForm.imglstToolbar, Ge' +
          'tItPage.ImageListDefaultSearch, AppBuilder.ImageList1'
      end>
    ImageCollection = IDEImageResourcesFrm.IDEImageCollection
    Left = 144
    Top = 88
  end
  object ActionList1: TActionList
    Images = ImageList
    Left = 72
    Top = 88
    object FileOpen1: TAction
      Category = 'File'
      Caption = 'FileOpen1'
      Hint = 'Open|Open a file'
      ImageIndex = 0
      ImageName = 'OpenFile'
      OnExecute = FileOpen1Execute
    end
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 4
      ImageName = 'Cut'
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 5
      ImageName = 'Copy'
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 6
      ImageName = 'Paste'
      ShortCut = 16470
    end
    object FileSave1: TAction
      Category = 'File'
      Caption = '&Save'
      Hint = 'Save|Save current file'
      ImageIndex = 1
      ImageName = 'SaveFile'
      OnExecute = FileSave1Execute
    end
    object EditUndo1: TEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 2
      ImageName = 'Undo'
      ShortCut = 16474
    end
    object EditSelectAll1: TEditSelectAll
      Category = 'Edit'
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ImageIndex = 7
      ImageName = 'SelectAll'
      ShortCut = 16449
    end
    object EditDelete1: TEditDelete
      Category = 'Edit'
      Caption = '&Delete'
      Hint = 'Delete|Erases the selection'
      ImageIndex = 8
      ImageName = 'Delete'
      ShortCut = 46
    end
  end
end
