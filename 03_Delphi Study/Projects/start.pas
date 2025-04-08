unit start;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,  Unit3;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
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
  SecondForm: TForm3; // Declare a variable of the second form's class
  i : integer;
begin
  SecondForm := TForm3.Create(Self); // Create an instance of the form, optionally passing the owner
  try
    SecondForm.Show;         // Shows the form non-modally (the user can interact with both forms)
    // or
    // SecondForm.ShowModal;

    for i := 1 to 4 do
    begin
           ShowMessage('The current value of i is: ' + IntToStr(i));
    end;


      // Shows the form modally (the user must close this form before interacting with the first)
  finally
    // Important: Free the form when you're done with it to prevent memory leaks
    SecondForm.Free;
  end;
end;


end.


