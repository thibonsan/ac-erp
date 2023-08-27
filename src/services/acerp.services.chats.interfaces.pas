unit acerp.services.chats.interfaces;

interface

uses
  System.UITypes, acerp.services.enums;

type
  iCharts = interface
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

end.
