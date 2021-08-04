unit Unit1;

interface

uses Vcl.Dialogs;

type
  Country = array[0..1] of String;

  TDog = class(TObject)
    Name : String;
    Age : byte;
    Address : String;

    function GetName : string;
  end;

  TPerson = class (TObject)
//  private
//    ttt : string;
//  strict private
//    ttt2 : string;

    Name : String;
    Age : byte;
    Address : String;
    function GetName : string;
    constructor Create; virtual;

    //protected
    //strict protected
    //published

  end;

  TEmp = class(TPerson)
    office : string;
    function salary:integer; virtual; abstract;
    constructor Create; override;
  end;

  Ts = class(Temp)
    rank : string;
    function salary : integer;  override;
    constructor Create; override;
  end;

  Th = class(TEmp)
    hours : integer;
    rate : integer;
    function salary : integer;  override;
    constructor Create; override;
  end;


  Person = record
    Name : String;
    Age : Integer;
    Address : String;
  end;

  p_person : ^Person;

var
  s : string;
  i : integer = 100;
  t : TdateTime;
  b : boolean;
  Countries  : Country;
  p : p_person;
  ps : pchar; // c long pointer string;

  //pansicahr, pwidechar, punicodechar

  a : array of String;   //dynamic array, assign setlength

procedure Test;
function Add(x,y : integer) : integer;
function Divide(x,y : integer) : integer; overload;
function Divide(x,y : real) : real; overload;

implementation

var j : integer;

procedure Test;
var
 k : integer;

begin

  ShowMessage('test called ...');

end;




function Add(x,y : integer) : integer;
begin

  Add := x + y;
  // Result := x + y;     Type 1
  // all function's return value is Result;
  // Exit(x+y); from 2010   Type 2

end;

function Divide(x,y: integer) : integer;
begin

  Result := x div y;

end;

function Divide(x,y: real) : real;
begin

  Result := x / y;

end;

{ TDog }

function TDog.GetName: string;
begin
  result := self.name;
end;

constructor TPerson.Create;
begin
  Name := 'kim';
  Age := 20;
  Address := 'Any where';
end;

function TPerson.GetName : string;
begin
  result := self.name;
end;

{ Ts }

constructor Ts.Create;
begin
  inherited;
  rank:= '200';
end;

function Ts.salary: integer;
begin
        result := 3000;
end;

{ Th }

constructor Th.Create;
begin
  inherited;
  hours:=10;
  rate:=500;
end;

function Th.salary: integer;
begin
  result := hours * rate;
end;

{ TEmp }

constructor TEmp.Create;
begin
  inherited;        //upper level create  called

  office:='devgear';
end;

initialization
begin

  Countries[0] := 'korea';
  Countries[1] := 'Japan';
  SetLength(a,2);
  a[0] := 'a';

end;





end.
