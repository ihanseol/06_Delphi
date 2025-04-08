unit TClassInheritMultipleCLass_01;


interface

uses
  System.SysUtils;

type
  IMovable = interface
    ['{5EE9BEC2-F124-4A57-A1F5-DD7F88E9DC6A}']
    procedure Move(DeltaX, DeltaY: Integer);
  end;

  IDrawable = interface
    ['{B1F4A3E7-C92D-4618-B45D-7D0D9C2A894D}']
    procedure Draw;
  end;

  TShape = class(TInterfacedObject, IMovable, IDrawable)
  private
    FX, FY: Integer;
  public
    constructor Create(X, Y: Integer);
    // Interface implementations
    procedure Move(DeltaX, DeltaY: Integer);
    procedure Draw;
  end;

implementation

{ TShape }

constructor TShape.Create(X, Y: Integer);
begin
  inherited Create;
  FX := X;
  FY := Y;
end;

procedure TShape.Draw;
begin
  Writeln(Format('Drawing shape at (%d, %d)', [FX, FY]));
end;

procedure TShape.Move(DeltaX, DeltaY: Integer);
begin
  FX := FX + DeltaX;
  FY := FY + DeltaY;
  Writeln(Format('Moving shape by (%d, %d) to (%d, %d)', [DeltaX, DeltaY, FX, FY]));
end;

end.
