unit acerp.services.charts;

interface

uses
  acerp.services.chats.interfaces,
  System.UITypes,
  FMX.Layouts,
  acerp.services.enums,
  Chart4Delphi;

type
  TCharts = class(TInterfacedObject, iCharts)
  private
    FLoadFromJSON: String;
    FShowPercent: Boolean;
    FShowValues: Boolean;
    FShowHint: Boolean;
    FHintFieldName: Boolean;
    FShowBarTitle: Boolean;
    FShowBarLegend: Boolean;
    FFullHint: Boolean;
    FAnimate: Boolean;
    FTextOffset: Real;
    FAnimationDuration: Single;
    FDonutsCenterRadius: Integer;
    FTextFontSize: Integer;
    FLinePointDiameter: Integer;
    FLineTickness: Integer;
    FFormatValues: string;
    FBarTitle: string;
    FTextStyle: TFontStyles;
    FColorLinePoint: TAlphaColor;
    FColorsGraph: array of TAlphaColor;
    FColorsText: array of TAlphaColor;
    FError: String;

    FLayout: TLayout;
    FChartType: TChartType;
    FChart: TChart4Delphi;

    procedure ShowGraph;

    constructor Create(Layout: TLayout);
    destructor Destroy; override;
  public
    class function New(Layout: TLayout): iCharts;

    function ChartType(Value: TChartType): iCharts;
    function LoadFromJSON(Value: String): iCharts;
    function ShowPercent(Value: Boolean): iCharts;
    function ShowValues(Value: Boolean): iCharts;
    function ShowHint(Value: Boolean): iCharts;
    function HintFieldName(Value: Boolean): iCharts;
    function ShowBarTitle(Value: Boolean): iCharts;
    function ShowBarLegend(Value: Boolean): iCharts;
    function FullHint(Value: Boolean): iCharts;
    function Animate(Value: Boolean): iCharts;
    function TextOffset(Value: Real): iCharts;
    function AnimationDuration(Value: Single): iCharts;
    function DonutsCenterRadius(Value: Integer): iCharts;
    function TextFontSize(Value: Integer): iCharts;
    function LinePointDiameter(Value: Integer): iCharts;
    function LineTickness(Value: Integer): iCharts;
    function FormatValues(Value: string): iCharts;
    function BarTitle(Value: string): iCharts;
    function TextStyle(Value: TFontStyles): iCharts;
    function ColorLinePoint(Value: TAlphaColor): iCharts;
    function SetColor(ColorsGraph, ColorsText: Array of TAlphaColor): iCharts;
    function Error(var Value: String): iCharts;
    procedure Gerar;
  end;

implementation

uses
  System.SysUtils,
  System.Classes;

function TCharts.Animate(Value: Boolean): iCharts;
begin
  Result := Self;
  FAnimate := Value;
end;

function TCharts.AnimationDuration(Value: Single): iCharts;
begin
  Result := Self;
  FAnimationDuration := Value;
end;

function TCharts.BarTitle(Value: string): iCharts;
begin
  Result := Self;
  FBarTitle := Value;
end;

function TCharts.ChartType(Value: TChartType): iCharts;
begin
  Result := Self;
  FChartType := Value;
end;

function TCharts.ColorLinePoint(Value: TAlphaColor): iCharts;
begin
  Result := Self;
  FColorLinePoint := Value;
end;

constructor TCharts.Create(Layout: TLayout);
begin
  FLayout := Layout;
end;

destructor TCharts.Destroy;
begin

  inherited;
end;

function TCharts.DonutsCenterRadius(Value: Integer): iCharts;
begin
  Result := Self;
  FDonutsCenterRadius := Value;
end;

function TCharts.Error(var Value: String): iCharts;
begin
  Result := Self;
  Value := FError;
end;

function TCharts.FormatValues(Value: string): iCharts;
begin
  Result := Self;
  FFormatValues := Value;
end;

function TCharts.FullHint(Value: Boolean): iCharts;
begin
  Result := Self;
  FFullHint := Value;
end;

procedure TCharts.Gerar;
begin
  ShowGraph;
end;

function TCharts.HintFieldName(Value: Boolean): iCharts;
begin
  Result := Self;
  FHintFieldName := Value;
end;

function TCharts.LinePointDiameter(Value: Integer): iCharts;
begin
  Result := Self;
  FLinePointDiameter := Value;
end;

function TCharts.LineTickness(Value: Integer): iCharts;
begin
  Result := Self;
  FLineTickness := Value;
end;

function TCharts.LoadFromJSON(Value: String): iCharts;
begin
  Result := Self;
  FLoadFromJSON := Value;
end;

class function TCharts.New(Layout: TLayout): iCharts;
begin
  Result := Self.Create(Layout);
end;

function TCharts.SetColor(ColorsGraph, ColorsText
  : array of TAlphaColor): iCharts;
begin
  Result := Self;
  SetLength(FColorsGraph,0);
  SetLength(FColorsText,0);


  for var I := 0 to Pred(Length(ColorsGraph)) do
  begin
    SetLength(FColorsGraph,Length(FColorsGraph)+1);
    FColorsGraph[I] := ColorsGraph[I];
  end;

  for var I := 0 to Pred(Length(ColorsText)) do
  begin
    SetLength(FColorsText, Length(FColorsText)+1);
    FColorsText[I] := ColorsText[I];
  end;
end;

function TCharts.ShowBarLegend(Value: Boolean): iCharts;
begin
  Result := Self;
  FShowBarLegend := Value;
end;

function TCharts.ShowBarTitle(Value: Boolean): iCharts;
begin
  Result := Self;
  FShowBarTitle := Value;
end;

procedure TCharts.ShowGraph;
begin
  case FChartType of
    Pie:
      FChart := TChart4Delphi.Create(FLayout, TChartLayoutType.ctlPie);
    Donuts:
      FChart := TChart4Delphi.Create(FLayout, TChartLayoutType.ctlDonuts);
    Lines:
      FChart := TChart4Delphi.Create(FLayout, TChartLayoutType.ctlLines);
    Bars:
      FChart := TChart4Delphi.Create(FLayout, TChartLayoutType.ctlPie);
  end;
  FChart.TextStyle := FTextStyle;
  FChart.TextFontSize := FTextFontSize;
  FChart.TextOffset := FTextOffset;
  FChart.FormatValues := FFormatValues;
  FChart.ShowPercent := FShowPercent;
  FChart.ShowValues := FShowValues;
  FChart.ShowHint := FShowHint;
  FChart.FullHint := FFullHint;
  FChart.Animate := FAnimate;
  FChart.AnimationDuration := FAnimationDuration;
  FChart.DonutsCenterRadius := FDonutsCenterRadius;
  FChart.BarTitle := FBarTitle;
  FChart.ShowBarTitle := FShowBarTitle;
  FChart.ShowBarLegend := FShowBarLegend;
  FChart.ColorLinePoint := FColorLinePoint;
  FChart.LineTickness := FLineTickness;
  FChart.LinePointDiameter := FLinePointDiameter;
  FChart.SetColors(FColorsGraph, FColorsText);
  FChart.DrawGraph(FLoadFromJSON, FError);
end;

function TCharts.ShowHint(Value: Boolean): iCharts;
begin
  Result := Self;
  FShowHint := Value;
end;

function TCharts.ShowPercent(Value: Boolean): iCharts;
begin
  Result := Self;
  FShowPercent := Value;
end;

function TCharts.ShowValues(Value: Boolean): iCharts;
begin
  Result := Self;
  FShowValues := Value;
end;

function TCharts.TextFontSize(Value: Integer): iCharts;
begin
  Result := Self;
  FTextFontSize := Value;
end;

function TCharts.TextOffset(Value: Real): iCharts;
begin
  Result := Self;
  FTextOffset := Value;
end;

function TCharts.TextStyle(Value: TFontStyles): iCharts;
begin
  Result := Self;
  FTextStyle := Value;
end;

end.
