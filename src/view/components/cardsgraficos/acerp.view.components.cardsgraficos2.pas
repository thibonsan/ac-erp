unit acerp.view.components.cardsgraficos2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, acerp.services.enums,
  FMX.Effects;

type
  TComponentCardGraficos2 = class(TForm)
    lytContainer: TLayout;
    RectangleBackground: TRectangle;
    lytTitulos: TLayout;
    Layout1: TLayout;
    lblTitulo: TLabel;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    lblInfo: TLabel;
    lytrodaPe: TLayout;
    Line1: TLine;
    Layout3: TLayout;
    Circle1: TCircle;
    ImageRodape: TImage;
    lytRodapeTitulo: TLayout;
    lblTituloRodape: TLabel;
    lytGraficosEmbed: TLayout;
    lytTituloGrafico: TLayout;
    lblTituloGrafico: TLabel;
    lytGraficos: TLayout;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
  public
    class function New(AOWner: TComponent): TComponentCardGraficos2;
    function TituloInfo(Value: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos2;
    function TituloDescricao(Value: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos2;
    function DescricaoRodape(Value: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos2;
    function ImagemRodape(Value: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos2;
    function TituloGrafico(Value: String; Color: TAlphaColor = $FF000000): TComponentCardGraficos2;
    function TipoGrafico(Value: TChartType): TComponentCardGraficos2;
    function Alinhamento(VAlue: TAlignLayout): TComponentCardGraficos2;
    function MargemTop(Value: Integer): TComponentCardGraficos2;
    function MargemBottom(Value: Integer): TComponentCardGraficos2;
    function MargemLeft(Value: Integer): TComponentCardGraficos2;
    function MargemRigth(Value: Integer): TComponentCardGraficos2;
    function Largura(AHeight, AWidth: Integer): TComponentCardGraficos2;
    function Build: TFMXObject;
  end;

implementation

uses
  acerp.services.utils, acerp.services.charts;

{$R *.fmx}

{ TComponentCardGraficos2 }

function TComponentCardGraficos2.Alinhamento(
  VAlue: TAlignLayout): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentCardGraficos2.Build: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentCardGraficos2.DescricaoRodape(Value: String;
  Color: TAlphaColor): TComponentCardGraficos2;
begin
  Result := Self;
  lblTituloRodape.Text := Value;
  lblTituloRodape.TextSettings.FontColor := Color;
end;

function TComponentCardGraficos2.ImagemRodape(Value: String;
  Color: TAlphaColor): TComponentCardGraficos2;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageRodape);
  TUtils.ImageColor(ImageRodape,Color);
end;

function TComponentCardGraficos2.Largura(AHeight,
  AWidth: Integer): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Width := AWidth;
  lytContainer.Height := AHeight;
end;

function TComponentCardGraficos2.MargemBottom(
  Value: Integer): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Margins.Bottom := Value;
end;

function TComponentCardGraficos2.MargemLeft(
  Value: Integer): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Margins.Left := Value;
end;

function TComponentCardGraficos2.MargemRigth(
  Value: Integer): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Margins.Right := Value;
end;

function TComponentCardGraficos2.MargemTop(
  Value: Integer): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Margins.Top := Value;
end;

class function TComponentCardGraficos2.New(
  AOWner: TComponent): TComponentCardGraficos2;
begin
  Result := Self.Create(AOWner);
end;

function TComponentCardGraficos2.TipoGrafico(
  Value: TChartType): TComponentCardGraficos2;
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

function TComponentCardGraficos2.TituloDescricao(Value: String;
  Color: TAlphaColor): TComponentCardGraficos2;
begin
  Result := Self;
  lblTitulo.Text := Value;
  lblTitulo.TextSettings.FontColor := Color;
end;

function TComponentCardGraficos2.TituloGrafico(Value: String;
  Color: TAlphaColor): TComponentCardGraficos2;
begin
  Result := Self;
  lblTituloGrafico.Text := Value;
  lblTituloGrafico.FontColor := Color;
  lytTituloGrafico.Visible := True;
end;

function TComponentCardGraficos2.TituloInfo(Value: String;
  Color: TAlphaColor): TComponentCardGraficos2;
begin
  Result := Self;
  lblInfo.Text := Value;
  lblInfo.FontColor := COlor;
end;

end.
