unit frmFirstDemo_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,  KakaoLocalAPI;

type
  TfrmFirstMain = class(TForm)
    Button1: TButton;
    editAddress: TEdit;
    Label1: TLabel;
    memoResult: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFirstMain: TfrmFirstMain;
  kakao : TKakaoLocalAPI;

implementation

{$R *.dfm}

procedure TfrmFirstMain.Button1Click(Sender: TObject);
var
 strResult : string;
 KakaoAPI: TKakaoLocalAPI;
 i : integer;
 MyList: TStringList;
begin
   KakaoAPI := TKakaoLocalAPI.Create('bb159a41d2eb8d5acb71e0ef1dde4d16');
   MyList := TStringList.Create;
//  showmessage(editAddress.text);
  memoResult.Lines.Clear;
  MyList := KakaoAPI.SearchAddressRerurn(editAddress.text);

for i := 0 to MyList.Count - 1 do
  memoResult.Lines.Add(MyList[i]);
end;

procedure TfrmFirstMain.FormCreate(Sender: TObject);
begin
  editAddress.text := '충청남도 예산군 대술면 마전리 820';
end;

end.
