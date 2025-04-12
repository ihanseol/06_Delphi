unit kakaoWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, KakaoLocalAPI;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  KakaoAPI: TKakaoLocalAPI;
//  Memo1 : TMemo;
begin
     try
    KakaoAPI := TKakaoLocalAPI.Create('bb159a41d2eb8d5acb71e0ef1dde4d16');
    try
      Memo1.Lines.Add( KakaoAPI.SearchAddressRerurn('충청남도 예산군 대술면 화산리 607-1'));
    finally
      KakaoAPI.Free;
    end;
  except
    on E: Exception do
      WriteLn('Error: ', E.Message);
  end;
end;

end.
