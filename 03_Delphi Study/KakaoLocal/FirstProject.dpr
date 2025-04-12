program FirstProject;

uses
  Vcl.Forms,
  frmFirstDemo_u in 'frmFirstDemo_u.pas' {Form1},
  frmWindowOne in 'frmWindowOne.pas' {Form2},
  frmWindowTwo in 'frmWindowTwo.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
