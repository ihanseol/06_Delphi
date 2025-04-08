object StringListViewerFrame: TStringListViewerFrame
  Left = 0
  Top = 0
  Width = 547
  Height = 249
  TabOrder = 0
  object PCViews: TPageControl
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 531
    Height = 233
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ActivePage = TabText
    Align = alClient
    TabHeight = 20
    TabOrder = 0
    OnChange = PCViewsChange
    object TabList: TTabSheet
      Caption = '&List'
      object StringListView: TListView
        Left = 0
        Top = 0
        Width = 523
        Height = 203
        Align = alClient
        BorderStyle = bsNone
        Columns = <
          item
            Caption = 'Index'
          end
          item
            AutoSize = True
            Caption = 'Value'
          end>
        ColumnClick = False
        TileOptions.SizeType = tstFixedSize
        OwnerData = True
        OwnerDraw = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnData = StringListViewData
        OnDrawItem = StringListViewDrawItem
      end
    end
    object TabText: TTabSheet
      Caption = '&Text'
      ImageIndex = 1
      object StringTextView: TMemo
        Left = 0
        Top = 0
        Width = 523
        Height = 203
        Align = alClient
        BorderStyle = bsNone
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WantReturns = False
        WordWrap = False
      end
    end
  end
end
