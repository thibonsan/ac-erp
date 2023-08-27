unit acerp.view.components.cardsgraficos;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Objects,
  FMX.Controls.Presentation, acerp.services.enums;

type
  TComponentCardGraficos = class(TFrame)
    lytContainer: TLayout;
    RectangleBackground: TRectangle;
    lytTitulos: TLayout;
    lytrodaPe: TLayout;
    lytGraficosEmbed: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    lblInfo: TLabel;
    Line1: TLine;
    Layout3: TLayout;
    Circle1: TCircle;
    ImageRodape: TImage;
    lytRodapeTitulo: TLayout;
    lytTituloGrafico: TLayout;
    lblTituloGrafico: TLabel;
    lblTitulo: TLabel;
    lblTituloRodape: TLabel;
    lytGraficos: TLayout;
  private
    FTituloGrafico: String;
  public
    class function New(AOWner: TComponent): TComponentCardGraficos;
    function Nome(Value: String): TComponentCardGraficos;
    function TituloInfo(Value: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos;
    function TituloDescricao(Value: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos;
    function DescricaoRodape(Value: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos;
    function ImagemRodape(Value: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos;
    function TituloGrafico(Value: String; Color: TAlphaColor = $FF000000): TComponentCardGraficos;
    function TipoGrafico(Value: TChartType): TComponentCardGraficos;
    function Alinhamento(VAlue: TAlignLayout): TComponentCardGraficos;
    function Build: TFMXObject;
  end;

implementation

{$R *.fmx}

uses acerp.services.utils, acerp.services.charts;

{ TComponentCardGraficos }

function TComponentCardGraficos.Alinhamento(
  VAlue: TAlignLayout): TComponentCardGraficos;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := VAlue;
end;

function TComponentCardGraficos.Build: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentCardGraficos.DescricaoRodape(Value: String;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblTituloRodape.Text := Value;
  lblTituloRodape.TextSettings.FontColor := Color;
end;

function TComponentCardGraficos.ImagemRodape(Value: String;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageRodape);
  TUtils.ImageColor(ImageRodape,Color);
end;

class function TComponentCardGraficos.New(
  AOWner: TComponent): TComponentCardGraficos;
begin
  Result := Self.Create(AOWner);
end;

function TComponentCardGraficos.Nome(Value: String): TComponentCardGraficos;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentCardGraficos.TipoGrafico(
  Value: TChartType): TComponentCardGraficos;
begin
  var lJson := '[{"field":"Jan", "value":520}, {"field":"Fev", "value":400}, {"field":"Mar", "value":840}, {"field":"Abr", "value":200}, {"field":"Mai", "value":997}, {"field":"Jun", "value":1270}]';
  Result := Self;
  case Value of
    Pie: ;
    Donuts: ;
    Lines: TCharts.New(lytGraficos)
            .LoadFromJSON(lJson)
            .ChartType(Value)
            .TextStyle([TFontStyle.fsBold])
            .TextFontSize(12)
            .TextOffset(0.1)
            .FormatValues('##,#0')
            .ShowPercent(True)
            .ShowValues(True)
            .ShowHint(True)
            .FullHint(True)
            .Animate(True)
            .AnimationDuration(0.8)
            .SetColor([TAlphaColors.Green],[TAlphaColors.Black])
            .ColorLinePoint(TAlphaColors.Black)
            .LineTickness(3)
            .LinePointDiameter(8)
            .Gerar;
    Bars: ;
  end;
end;

function TComponentCardGraficos.TituloDescricao(Value: String;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblTitulo.Text := Value;
  lblTitulo.TextSettings.FontColor := Color;
end;

function TComponentCardGraficos.TituloGrafico(Value: String;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblTituloGrafico.Text := Value;
  lblTituloGrafico.FontColor := Color;
  lytTituloGrafico.Visible := True;
end;

function TComponentCardGraficos.TituloInfo(Value: String;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblInfo.Text := Value;
  lblInfo.FontColor := COlor;
end;

end.
