unit frmFirstDemo_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frmWindowOne_u, KakaoLocalAPI;

type
  TForm1 = class(TForm)
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
  Form1: TForm1;
  kakao : TKakaoLocalAPI;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 strResult : string;
 KakaoAPI: TKakaoLocalAPI;
begin
   KakaoAPI := TKakaoLocalAPI.Create('bb159a41d2eb8d5acb71e0ef1dde4d16');
//  showmessage(editAddress.text);
  memoResult.Lines.Clear;
  strResult := KakaoAPI.SearchAddressRerurn(editAddress.text);
  memoResult.Lines.Add(strResult);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  editAddress.text := '충청남도 예산군 대술면 마전리 820';
end;

end.
