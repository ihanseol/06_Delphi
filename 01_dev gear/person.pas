// Person.pas
unit PersonUnit;

interface

type
  TPerson = class(TObject)
  private
    FName: string;
    FLastName: string;
    FAge: Integer;
    FEmail: string;
    
    // Private helper method
    function ValidateEmail(const Email: string): boolean;
    
  protected
    // Protected property for derived classes
    property Age: Integer read FAge write FAge;
    
  public
    // Constructor
    constructor Create(const AFirstName, ALastName: string; 
                      const AAge: Integer; const AEmail: string);
    
    // Destructor
    destructor Destroy; override;
    
    // Public properties
    property FirstName: string read FName write FName;
    property LastName: string read FLastName write FLastName;
    property FullName: string read GetFullName;
    property Email: string read FEmail write SetEmail;
    
    // Public methods
    function ToString(): string; override;
    procedure UpdateDetails(const AFirstName, ALastName: string;
                          const AAge: Integer; const AEmail: string);

  end;

implementation

constructor TPerson.Create(const AFirstName, ALastName: string;
                         const AAge: Integer; const AEmail: string);
begin
  inherited Create;
  
  // Initialize properties
  FName := AFirstName;
  FLastName := ALastName;
  FAge := AAge;
  FEmail := AEmail;
end;

destructor TPerson.Destroy;
begin
  // Clean up any resources here
  inherited Destroy;
end;

function TPerson.ValidateEmail(const Email: string): boolean;
begin
  Result := Pos('@', Email) > 0;
end;

function TPerson.GetFullName: string;
begin
  Result := Trim(FName + ' ' + FLastName);
end;

procedure TPerson.SetEmail(const Value: string);
begin
  if ValidateEmail(Value) then
    FEmail := Value
  else
    raise EInvalidArgument.Create('Invalid email address');
end;

function TPerson.ToString(): string;
begin
  Result := Format('Name: %s, Age: %d, Email: %s',
                  [GetFullName, FAge, FEmail]);
end;

procedure TPerson.UpdateDetails(const AFirstName, ALastName: string;
                              const AAge: Integer; const AEmail: string);
begin
  FName := AFirstName;
  FLastName := ALastName;
  FAge := AAge;
  FEmail := AEmail;
end;

end.