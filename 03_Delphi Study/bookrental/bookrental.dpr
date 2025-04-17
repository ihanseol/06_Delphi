program bookrental;

uses
  Vcl.Forms,
  mainform in 'mainform.pas' {frmMain},
  dataAccessModule in 'dataAccessModule.pas' {dmDataAccess: TDataModule},
  BookForm in 'BookForm.pas' {frmBook},
  CommonFunctions in 'CommonFunctions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDataAccess, dmDataAccess);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
