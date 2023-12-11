unit acerp.view.components.buttons.styles;

interface

uses
  acerp.view.styles.states;

type
  TCompponentButtonStyles = class
  private
    FStyles: TStylesStates;
  public
    constructor Create;
    destructor Destroy; override;
    function Styles: TStylesStates;
  end;

implementation

uses
  acerp.view.components.attributes.button, acerp.view.styles, FMX.Types;

{ TCompponentButtonStyles }

constructor TCompponentButtonStyles.Create;
begin
  FStyles := TStylesStates.Create
    .RegisterStyle('ComponentButtonSubMenu',
      TButton<TCompponentButtonStyles>.New(nil)
        .DefaultColor(PRIMARY)
        .AccentColor(WHITE)
        .Align(TAlignLayout.Top));
end;

destructor TCompponentButtonStyles.Destroy;
begin
  FStyles.Free;
  inherited;
end;

function TCompponentButtonStyles.Styles: TStylesStates;
begin
  Result := FStyles;
end;

end.
