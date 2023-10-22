unit acerp.view.styles.states;

interface

uses
  System.Generics.Collections;

type
  TStylesStates = class
  private
    FList: TDictionary<string, IInterface>;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: TStylesStates;
    function RegisterStyle(StyleName: string; StyleInterface: IInterface): TStylesStates;
    function GetStyle(StyleName: string): IInterface;
  end;

var
  StylesStates: TStylesStates;

implementation

uses
  System.SysUtils;

{ TStylesStates }

constructor TStylesStates.Create;
begin
  FList := TDictionary<string, IInterface>.Create;
end;

destructor TStylesStates.Destroy;
begin
  FList.Free;
  inherited;
end;

function TStylesStates.GetStyle(StyleName: string): IInterface;
begin
  if not FList.TryGetValue(StyleName, Result) then
    raise Exception.Create('Style not Register');
end;

class function TStylesStates.New: TStylesStates;
begin
  Result := Self.Create;
end;

function TStylesStates.RegisterStyle(StyleName: string;
  StyleInterface: IInterface): TStylesStates;
begin
  Result := Self;
  FList.Add(StyleName, StyleInterface);
end;

initialization
  StylesStates := TStylesStates.New;

finalization
  StylesStates.Free;

end.
