program Project1;

uses
  Vcl.Forms,
  start in '..\start.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  Unit1 in '..\Unit1.pas',
  UnitPerson in 'UnitPerson.pas',
  UnitPerson2 in 'UnitPerson2.pas',
  TClassInheritMultipleCLass_01 in 'TClassInheritMultipleCLass_01.pas',
  Unit4 in 'Unit4.pas',
  YangSooFileUnit in '..\YangSooFileUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
