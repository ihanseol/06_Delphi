object frmBook: TfrmBook
  Left = 0
  Top = 0
  Caption = #46020#49436#44288#47532' '#54868#47732
  ClientHeight = 791
  ClientWidth = 1246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 1246
    Height = 57
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1246
      57)
    object lblCaption: TLabel
      Left = 8
      Top = 18
      Width = 52
      Height = 17
      Caption = #46020#49436#44288#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnAdd: TButton
      Left = 1078
      Top = 8
      Width = 75
      Height = 43
      Anchors = [akTop, akRight]
      Caption = #52628#44032
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnClose: TButton
      Left = 1159
      Top = 8
      Width = 75
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 57
    Width = 1246
    Height = 734
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 870
    object Splitter1: TSplitter
      Left = 739
      Top = 1
      Width = 6
      Height = 732
      ExplicitLeft = 750
      ExplicitTop = 6
      ExplicitHeight = 868
    end
    object pnlMain: TPanel
      Left = 1
      Top = 1
      Width = 738
      Height = 732
      Align = alLeft
      TabOrder = 0
      ExplicitHeight = 868
      object pnlMainHeader: TPanel
        Left = 1
        Top = 1
        Width = 736
        Height = 59
        Align = alTop
        TabOrder = 0
        object lblSearch: TLabel
          Left = 6
          Top = 15
          Width = 26
          Height = 17
          Caption = #44160#49353
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtSearch: TEdit
          Left = 38
          Top = 11
          Width = 241
          Height = 23
          TabOrder = 0
        end
        object chkSearchTitle: TCheckBox
          Left = 285
          Top = 15
          Width = 97
          Height = 17
          Caption = #51228#47785
          TabOrder = 1
        end
        object chkSearchAuthor: TCheckBox
          Left = 335
          Top = 15
          Width = 58
          Height = 17
          Caption = #51200#51088
          TabOrder = 2
        end
      end
      object gridBook: TDBGrid
        Left = 1
        Top = 60
        Width = 736
        Height = 671
        Align = alClient
        DataSource = dsBook
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'BOOK_TITLE'
            Title.Alignment = taCenter
            Title.Caption = #51228#47785
            Width = 351
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOOK_AUTHOR'
            Title.Alignment = taCenter
            Title.Caption = #51200#51088
            Width = 185
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOOK_PRICE'
            Title.Alignment = taCenter
            Title.Caption = #44032#44201
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'BOOK_RENT'
            Title.Alignment = taCenter
            Title.Caption = #45824#50668#50668#48512
            Width = 66
            Visible = True
          end>
      end
    end
    object pnlInput: TPanel
      Left = 745
      Top = 1
      Width = 500
      Height = 732
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 868
      DesignSize = (
        500
        732)
      object lblTitle: TLabel
        Left = 6
        Top = 20
        Width = 26
        Height = 17
        Caption = #51228#47785
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblISBN: TLabel
        Left = 14
        Top = 89
        Width = 27
        Height = 17
        Caption = 'ISBN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblAuthor: TLabel
        Left = 14
        Top = 118
        Width = 26
        Height = 17
        Caption = #51200#51088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 14
        Top = 142
        Width = 26
        Height = 17
        Caption = #44032#44201
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 14
        Top = 176
        Width = 26
        Height = 17
        Caption = #47553#53356
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 14
        Top = 335
        Width = 26
        Height = 17
        Caption = #49444#47749
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object dbeTitle: TDBEdit
        Left = 6
        Top = 43
        Width = 470
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_TITLE'
        DataSource = dsBook
        TabOrder = 0
      end
      object dbeISBN: TDBEdit
        Left = 47
        Top = 88
        Width = 202
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_ISBN'
        DataSource = dsBook
        TabOrder = 1
        OnExit = dbeISBNExit
      end
      object dbeAuthor: TDBEdit
        Left = 46
        Top = 117
        Width = 200
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_AUTHOR'
        DataSource = dsBook
        TabOrder = 2
      end
      object dbePrice: TDBEdit
        Left = 46
        Top = 141
        Width = 200
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_PRICE'
        DataSource = dsBook
        TabOrder = 3
      end
      object dbeLlink: TDBEdit
        Left = 46
        Top = 170
        Width = 200
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_LINK'
        DataSource = dsBook
        TabOrder = 4
      end
      object btnImageLoad: TButton
        Left = 383
        Top = 331
        Width = 105
        Height = 30
        Anchors = [akTop, akRight]
        Caption = #48520#47084#50724#44592
        TabOrder = 5
        OnClick = btnImageLoadClick
      end
      object GroupBox1: TGroupBox
        Left = 255
        Top = 72
        Width = 226
        Height = 253
        Anchors = [akTop, akRight]
        Caption = 'GroupBox1'
        TabOrder = 6
        object imgBook: TImage
          Left = 2
          Top = 17
          Width = 222
          Height = 234
          Align = alClient
          Proportional = True
          Stretch = True
          ExplicitTop = 16
          ExplicitWidth = 206
          ExplicitHeight = 217
        end
      end
      object btnImageClear: TButton
        Left = 264
        Top = 331
        Width = 113
        Height = 30
        Anchors = [akTop, akRight]
        Caption = #52488#44592#54868
        TabOrder = 7
        OnClick = btnImageClearClick
      end
      object dbmDescription: TDBMemo
        Left = 6
        Top = 367
        Width = 483
        Height = 298
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_DESCRIPTION'
        DataSource = dsBook
        ScrollBars = ssVertical
        TabOrder = 8
      end
      object btnDelete: TButton
        Left = 6
        Top = 671
        Width = 89
        Height = 30
        Caption = #49325#51228
        TabOrder = 9
        OnClick = btnDeleteClick
      end
      object btnSave: TButton
        Left = 301
        Top = 671
        Width = 89
        Height = 30
        Anchors = [akTop, akRight]
        Caption = #51200#51109
        TabOrder = 10
        OnClick = btnSaveClick
      end
      object btnCancel: TButton
        Left = 396
        Top = 671
        Width = 89
        Height = 30
        Anchors = [akTop, akRight]
        Caption = #52712#49548
        TabOrder = 11
        OnClick = btnCancelClick
      end
    end
  end
  object dsBook: TDataSource
    DataSet = dmDataAccess.qryBook
    OnStateChange = dsBookStateChange
    OnDataChange = dsBookDataChange
    Left = 225
    Top = 338
  end
  object dlgLoadImage: TOpenDialog
    Left = 1055
    Top = 259
  end
end
