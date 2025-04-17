program FirstProject;

uses
  Vcl.Forms,
  frmFirstDemo_u in 'frmFirstDemo_u.pas' {Form1},
  KakaoLocalAPI in 'KakaoLocalAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFirstMain, frmFirstMain);
  Application.Run;
end.
