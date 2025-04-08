unit UnitPerson2;

interface

uses
  System.SysUtils;

type
  TGender = (gMale, gFemale, gOther); // Enumerated type for gender

  TPerson = class(TObject)
  private
    FName: string;
    FAge: Integer;
    FGender: TGender;
    FIsEmployed: Boolean;
    FSalary: Double;
    function GetAgeCategory: string;
    procedure SetAge(Value: Integer);
  public
    constructor Create(const AName: string; AAge: Integer; AGender: TGender); overload;
    constructor Create; overload; // Default constructor
    destructor Destroy; override;

    // Properties
    property Name: string read FName write FName;
    property Age: Integer read FAge write SetAge;
    property Gender: TGender read FGender write FGender;
    property IsEmployed: Boolean read FIsEmployed write FIsEmployed;
    property Salary: Double read FSalary write FSalary;
    property AgeCategory: string read GetAgeCategory;

    // Methods
    function GetFullDescription: string;
    procedure IncreaseSalary(Percentage: Double);
    function GenderToString: string;
  end;

implementation

{ TPerson }

constructor TPerson.Create(const AName: string; AAge: Integer; AGender: TGender);
begin
  inherited Create;
  FName := AName;
  SetAge(AAge); // Use setter to enforce validation
  FGender := AGender;
  FIsEmployed := False; // Default value
  FSalary := 0.0;
end;

constructor TPerson.Create;
begin
  inherited Create;
  FName := 'Unknown';
  FAge := 0;
  FGender := gOther;
  FIsEmployed := False;
  FSalary := 0.0;
end;

destructor TPerson.Destroy;
begin
  // Cleanup code if needed
  inherited Destroy;
end;

function TPerson.GetAgeCategory: string;
begin
  case FAge of
    0..12: Result := 'Child';
    13..19: Result := 'Teenager';
    20..35: Result := 'Young Adult';
    36..60: Result := 'Adult';
    61..120: Result := 'Senior';
  else
    Result := 'Invalid Age';
  end;
end;

procedure TPerson.SetAge(Value: Integer);
begin
  if (Value < 0) or (Value > 150) then
    FAge := 0 // Default to 0 for invalid age
  else
    FAge := Value;
end;

function TPerson.GetFullDescription: string;
begin
  Result := 'Name: ' + FName + ', Age: ' + IntToStr(FAge) + ' (' + GetAgeCategory + '), ' +
            'Gender: ' + GenderToString;
  if FIsEmployed then
    Result := Result + ', Employed with Salary: $' + FormatFloat('#,##0.00', FSalary)
  else
    Result := Result + ', Not Employed';
end;

procedure TPerson.IncreaseSalary(Percentage: Double);
begin
  if FIsEmployed and (Percentage > 0) then
    FSalary := FSalary * (1 + Percentage / 100);
end;

function TPerson.GenderToString: string;
begin
  case FGender of
    gMale: Result := 'Male';
    gFemale: Result := 'Female';
    gOther: Result := 'Other';
  end;
end;

end.
