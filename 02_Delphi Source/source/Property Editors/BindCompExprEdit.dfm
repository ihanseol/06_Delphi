inherited BindCompExprDesigner: TBindCompExprDesigner
  HelpContext = 16202
  HorzScrollBar.Increment = 19
  VertScrollBar.Increment = 16
  BorderIcons = [biSystemMenu]
  Caption = 'BindCompExprDesigner'
  ClientHeight = 462
  ClientWidth = 742
  KeyPreview = True
  PopupMode = pmExplicit
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  ExplicitWidth = 758
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TSplitter
    Width = 742
    ExplicitWidth = 328
  end
  inherited ToolBar1: TToolBar
    Width = 742
    Images = ImageList1
    TabOrder = 1
    ExplicitWidth = 742
    object ToolButtonAddCol: TToolButton
      Left = 4
      Top = 0
      Action = AddCollectionCmd
    end
    object ToolButtonDeleteCol: TToolButton
      Left = 27
      Top = 0
      Action = DeleteCollectionCmd
    end
    object ToolButtonMoveColUp: TToolButton
      Left = 50
      Top = 0
      Action = MoveCollectionUpCmd
    end
    object ToolButtonMoveColDown: TToolButton
      Left = 73
      Top = 0
      Action = MoveCollectionDownCmd
    end
    object ToolButtonMoveSep: TToolButton
      Left = 96
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton1a: TToolButton
      Left = 104
      Top = 0
      Action = AddExprCmd
    end
    object ToolButton2a: TToolButton
      Left = 127
      Top = 0
      Action = DeleteExprCmd
    end
    object ToolButton4z: TToolButton
      Left = 150
      Top = 0
      Action = MoveExprUpCmd
    end
    object ToolButton5z: TToolButton
      Left = 173
      Top = 0
      Action = MoveExprDownCmd
    end
  end
  object PanelTop: TPanel [2]
    Left = 0
    Top = 33
    Width = 742
    Height = 429
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter5: TSplitter
      Left = 140
      Top = 0
      Width = 4
      Height = 429
      Beveled = True
      ExplicitLeft = 0
      ExplicitTop = 2
      ExplicitHeight = 177
    end
    object PanelCollections: TPanel
      Left = 0
      Top = 0
      Width = 140
      Height = 429
      Align = alLeft
      BevelOuter = bvNone
      Padding.Left = 4
      Padding.Top = 4
      Padding.Right = 4
      Padding.Bottom = 4
      TabOrder = 0
      object ListBoxCollections: TListBox
        Left = 4
        Top = 22
        Width = 132
        Height = 51
        Align = alTop
        BevelOuter = bvNone
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBoxCollectionsClick
      end
      object PanelCollectionsLabel: TPanel
        Left = 4
        Top = 4
        Width = 132
        Height = 18
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label3: TLabel
          Left = 0
          Top = -1
          Width = 55
          Height = 13
          Caption = 'Collections:'
          FocusControl = ListView1
        end
      end
      object TreeViewCollections: TTreeView
        Left = 4
        Top = 73
        Width = 132
        Height = 352
        Align = alClient
        HideSelection = False
        Indent = 19
        ReadOnly = True
        RightClickSelect = True
        RowSelect = True
        ShowLines = False
        TabOrder = 2
        OnClick = TreeViewCollectionsClick
      end
    end
    object PanelExpressionsAndEditors: TPanel
      Left = 144
      Top = 0
      Width = 598
      Height = 429
      Align = alClient
      TabOrder = 1
      object PanelExpressions: TPanel
        Left = 1
        Top = 1
        Width = 596
        Height = 303
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PanelExpressions'
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        TabOrder = 0
        object ListView1: TListView
          Left = 3
          Top = 21
          Width = 590
          Height = 279
          Align = alClient
          Columns = <
            item
              Caption = 'Name'
              Width = 60
            end
            item
              Caption = 'Output Scope'
              Width = 100
            end
            item
              Caption = 'Output Expr'
              Width = 100
            end
            item
              Caption = 'Value Scope'
              Width = 100
            end
            item
              Caption = 'Value Expr'
              Width = 150
            end>
          ColumnClick = False
          DragMode = dmAutomatic
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          TabOrder = 1
          ViewStyle = vsReport
          OnChange = ListView1Change
          OnClick = ListView1Click
          OnDblClick = ListView1DblClick
          OnKeyDown = ListView1KeyDown
          OnKeyPress = ListView1KeyPress
          OnResize = ListView1Resize
          OnStartDrag = ListView1StartDrag
        end
        object PanelExpressionsLabel: TPanel
          Left = 3
          Top = 3
          Width = 590
          Height = 18
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 4
            Top = 1
            Width = 61
            Height = 13
            Caption = 'Expressions:'
            FocusControl = ListView1
          end
        end
      end
      object MemosPanel: TPanel
        Left = 1
        Top = 304
        Width = 596
        Height = 124
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          596
          124)
        object LabelControlScope: TLabel
          Left = 3
          Top = 1
          Width = 190
          Height = 13
          Caption = 'Control Expression for  EditWithHandler'
        end
        object LabelSourceScope: TLabel
          Left = 3
          Top = 47
          Width = 213
          Height = 13
          Caption = 'Source Expression for BindScopeDB1, Image'
        end
        object ButtonEvalControl: TButton
          Left = 3
          Top = 93
          Width = 150
          Height = 25
          Hint = 'Evaluate control expression and display result'
          Action = actEvalControl
          Anchors = [akLeft, akTop]
          Caption = '&Eval Control'
          TabOrder = 4
        end
        object ButtonAssignToSource: TButton
          Left = 451
          Top = 93
          Width = 130
          Height = 25
          Hint = 'Assign to source from control using expressions'
          Action = actAssignToSource
          Anchors = [akLeft, akTop]
          TabOrder = 7
        end
        object ButtonAssignToControl: TButton
          Left = 295
          Top = 93
          Width = 150
          Height = 25
          Hint = 'Assign to control from source using expressions'
          Action = actAssignToControl
          Anchors = [akLeft, akTop]
          TabOrder = 6
        end
        object ButtonEvalSource: TButton
          Left = 159
          Top = 93
          Width = 130
          Height = 25
          Hint = 'Evaluate source expression and display result'
          Action = actEvalSource
          Anchors = [akLeft, akTop]
          Caption = 'E&val Source'
          TabOrder = 5
        end
        object MemoControl: TMemo
          Left = 3
          Top = 20
          Width = 536
          Height = 21
          Anchors = [akLeft, akTop]
          Enabled = False
          TabOrder = 0
          WordWrap = False
          OnChange = MemoControlChange
          OnKeyDown = MemoControlKeyDown
          OnKeyPress = MemoControlKeyPress
        end
        object MemoSource: TMemo
          Left = 3
          Top = 66
          Width = 536
          Height = 21
          Anchors = [akLeft, akTop]
          TabOrder = 2
          WordWrap = False
          OnChange = MemoSourceChange
          OnKeyDown = MemoSourceKeyDown
          OnKeyPress = MemoSourceKeyPress
        end
        object ToolBar4: TToolBar
          Left = 546
          Top = 20
          Width = 47
          Height = 23
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alNone
          Anchors = [akTop, akRight]
          Caption = 'ToolBar3'
          Images = ImageList1
          TabOrder = 1
          object ToolButtonApplyOutput: TToolButton
            Left = 0
            Top = 0
            Action = actApplyControl
          end
          object ToolButton4: TToolButton
            Left = 23
            Top = 0
            Action = actCancelControl
          end
        end
        object ToolBarSource: TToolBar
          Left = 546
          Top = 66
          Width = 46
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alNone
          Anchors = [akTop, akRight]
          Caption = 'ToolBarSource'
          Images = ImageList1
          List = True
          TabOrder = 3
          object ToolButtonApplyValue: TToolButton
            Left = 0
            Top = 0
            Action = actApplySource
            Caption = '```'
          end
          object ToolButton2: TToolButton
            Left = 23
            Top = 0
            Action = actCancelSource
          end
        end
      end
    end
  end
  inherited PopupMenu1: TPopupActionBar
    Images = ImageList1
    Left = 256
    Top = 96
    object Add1: TMenuItem [0]
      Action = actAddItem
    end
    object N1: TMenuItem [1]
      Caption = '-'
    end
    object Cut1: TMenuItem [2]
      Action = actCut
    end
    object Copy1: TMenuItem [3]
      Action = actCopy
    end
    object Paste1: TMenuItem [4]
      Action = actPaste
    end
    object Delete1: TMenuItem [5]
      Action = actDelete
    end
    object N2: TMenuItem [6]
      Caption = '-'
    end
    object PanelDescriptions1: TMenuItem [7]
      Action = DescriptionsAction
    end
    object Multiline1: TMenuItem
      Action = actMultilineExpr
    end
  end
  inherited ActionList1: TActionList
    Images = ImageList1
    Left = 360
    Top = 88
    object DescriptionsAction: TAction
      Caption = 'Panel D&escriptions'
      Checked = True
      Hint = 'Descriptions|Shows/hides panel descriptions'
      ShortCut = 0
      OnExecute = DescriptionsActionExecute
    end
    object actEvalControl: TAction
      Caption = '&Evaluate'
      ShortCut = 0
      OnExecute = actEvalControlExecute
      OnUpdate = actEvalControlUpdate
    end
    object actApplyControl: TAction
      Caption = 'Post'
      Hint = 'Post'
      ImageIndex = 4
      ShortCut = 0
      OnExecute = actApplyControlExecute
      OnUpdate = actApplyControlUpdate
    end
    object actAssignToControl: TAction
      Caption = 'Assign to &Control'
      ShortCut = 0
      OnExecute = actAssignToControlExecute
      OnUpdate = actAssignToControlUpdate
    end
    object actEvalSource: TAction
      Caption = 'E&valuate'
      ShortCut = 0
      OnExecute = actEvalSourceExecute
      OnUpdate = actEvalSourceUpdate
    end
    object actApplySource: TAction
      Caption = 'Apply'
      Hint = 'Post'
      ImageIndex = 4
      ShortCut = 0
      OnExecute = actApplySourceExecute
      OnUpdate = actApplySourceUpdate
    end
    object actCancelSource: TAction
      Caption = 'Cancel'
      Hint = 'Cancel (Esc)'
      ImageIndex = 5
      ShortCut = 0
      OnExecute = actCancelSourceExecute
      OnUpdate = actCancelSourceUpdate
    end
    object actCancelControl: TAction
      Caption = 'Cancel'
      Hint = 'Cancel (Esc)'
      ImageIndex = 5
      ShortCut = 0
      OnExecute = actCancelControlExecute
      OnUpdate = actCancelControlUpdate
    end
    object AddExprCmd: TAction
      Caption = '&Add Expression'
      Hint = 'Add Expression'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = AddClick
      OnUpdate = AddExprCmdUpdate
    end
    object DeleteExprCmd: TAction
      Caption = '&Delete Expression'
      Enabled = False
      Hint = 'Delete Expression'
      ImageIndex = 1
      ShortCut = 0
      OnExecute = DeleteClick
      OnUpdate = CollectionItemSelectionUpdate
    end
    object AddCollectionCmd: TAction
      Caption = '&Add Collection'
      Hint = 'Add Collection'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = AddCollectionCmdExecute
      OnUpdate = AddCollectionCmdUpdate
    end
    object DeleteCollectionCmd: TAction
      Caption = '&Delete Collection'
      Enabled = False
      Hint = 'Delete Collection'
      ImageIndex = 1
      ShortCut = 0
      OnExecute = DeleteCollectionCmdExecute
      OnUpdate = DeleteCollectionCmdUpdate
    end
    object MoveExprUpCmd: TAction
      Caption = 'Expression &Up'
      Enabled = False
      Hint = 'Move Expression Up'
      ImageIndex = 2
      ShortCut = 16422
      OnExecute = MoveUpClick
      OnUpdate = CollectionItemSelectionUpdate
    end
    object MoveExprDownCmd: TAction
      Caption = 'Expression Dow&n'
      Enabled = False
      Hint = 'Move Expression Down'
      ImageIndex = 3
      ShortCut = 16424
      OnExecute = MoveDownClick
      OnUpdate = CollectionItemSelectionUpdate
    end
    object MoveCollectionUpCmd: TAction
      Caption = 'Collection &Up'
      Enabled = False
      Hint = 'Move Collection Up'
      ImageIndex = 2
      ShortCut = 16422
      OnExecute = MoveCollectionUpCmdExecute
      OnUpdate = MoveCollectionUpCmdUpdate
    end
    object MoveCollectionDownCmd: TAction
      Caption = 'Collection Dow&n'
      Enabled = False
      Hint = 'Move Collection Down'
      ImageIndex = 3
      ShortCut = 16424
      OnExecute = MoveCollectionDownCmdExecute
      OnUpdate = MoveCollectionDownCmdUpdate
    end
    object actCut: TAction
      Caption = 'Cut'
      ShortCut = 16472
      OnExecute = actCutExecute
    end
    object actCopy: TAction
      Caption = 'Copy'
      ShortCut = 16451
      OnExecute = actCopyExecute
    end
    object actDelete: TAction
      Caption = 'Delete'
      ImageIndex = 1
      ShortCut = 0
      OnExecute = actDeleteExecute
      OnUpdate = actDeleteUpdate
    end
    object actPaste: TAction
      Caption = 'Paste'
      ShortCut = 16470
      OnExecute = actPasteExecute
    end
    object actAddItem: TAction
      Caption = 'Add'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = actAddItemExecute
      OnUpdate = actAddItemUpdate
    end
    object actAssignToSource: TAction
      Caption = 'Assign to &Source'
      ShortCut = 0
      OnExecute = actAssignToSourceExecute
      OnUpdate = actAssignToSourceUpdate
    end
    object actMultilineExpr: TAction
      Caption = '&Multiline Expressions'
      ShortCut = 0
      OnExecute = actMultilineExprExecute
      OnUpdate = actMultilineExprUpdate
    end
  end
  inherited PopupMenu2: TPopupActionBar
    Left = 440
    Top = 104
  end
  object ImageList1: TVirtualImageList
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 402
        CollectionName = 'Collections\Add'
        Disabled = False
        Name = 'Collections\Add'
      end
      item
        CollectionIndex = 411
        CollectionName = 'Collections\Delete'
        Disabled = False
        Name = 'Collections\Delete'
      end
      item
        CollectionIndex = 412
        CollectionName = 'Collections\MoveUp'
        Disabled = False
        Name = 'Collections\MoveUp'
      end
      item
        CollectionIndex = 413
        CollectionName = 'Collections\MoveDown'
        Disabled = False
        Name = 'Collections\MoveDown'
      end
      item
        CollectionIndex = 39
        CollectionName = 'AppBuilderActions\Apply'
        Disabled = False
        Name = 'AppBuilderActions\Apply'
      end
      item
        CollectionIndex = 26
        CollectionName = 'AppBuilderActions\Cancel'
        Disabled = False
        Name = 'AppBuilderActions\Cancel'
      end
      item
        CollectionIndex = 912
        CollectionName = 'DataBinding\NextBlack'
        Disabled = False
        Name = 'DataBinding\NextBlack'
      end
      item
        CollectionIndex = 913
        CollectionName = 'DataBinding\PrevBlack'
        Disabled = False
        Name = 'DataBinding\PrevBlack'
      end
      item
        CollectionIndex = 914
        CollectionName = 'DataBinding\Item2609'
        Disabled = False
        Name = 'DataBinding\Item2609'
      end>
    ImageCollection = IDEImageResourcesFrm.IDEImageCollection
    Left = 152
    Top = 96
  end
  object NewDataBindingsPopup: TPopupMenu
    Left = 416
    Top = 152
  end
end
