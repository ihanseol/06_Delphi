unit start;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UnitPerson;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  person : TPerson;

implementation

{$R *.dfm}


{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Person := TPerson.Create;
  try
    Person.FirstName := 'John';
    Person.LastName := 'Smith';
    Person.Age := 25;

//    ShowMessage(Person.GetFullName); // Shows "John Smith"

    Edit1.Text := Person.GetFullName + '  : Button1 pressed';
  finally

    Person.Free;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
// showmessage('button2 ');
 Edit1.Text := ' button2 pressed ' ;
end;






end.


