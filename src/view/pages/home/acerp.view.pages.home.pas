unit acerp.view.pages.home;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  Router4D.Interfaces;

type
  TPageHome = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    lytCards: TLayout;
    lytGraficos: TLayout;
    lytCardLeft: TLayout;
    lytCardRight: TLayout;
    procedure lytCardsResize(Sender: TObject);
    procedure lytCardLeftResize(Sender: TObject);
    procedure lytCardRightResize(Sender: TObject);
  private
    procedure CarregaCards;
    procedure CarregaGraficos;

    procedure ResponsiveLayout(Value: TLayout; Count: Integer);
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

implementation

{$R *.fmx}

uses acerp.view.components.cards, acerp.view.components.cardsgraficos,
  acerp.services.enums;

{ TPageHome }

procedure TPageHome.CarregaCards;
begin
  lytCardRight.AddObject(
    TComponentCard.New(Self)
      .Nome('Errors')
      .Titulo('Errors')
      .SubTitulo('23')
      .ImagemTitulo('globo')
      .ImageDescricao('atualizar')
      .Descricao('In the last hour')
      .Alinhamento(TAlignLayout.Left)
    .Build);

  lytCardRight.AddObject(
    TComponentCard.New(Self)
      .Nome('Followers')
      .Titulo('Followers')
      .SubTitulo('+45K')
      .ImagemTitulo('globo')
      .ImageDescricao('atualizar')
      .Descricao('Update Now')
      .Alinhamento(TAlignLayout.Left)
    .Build);

  lytCardLeft.AddObject(
    TComponentCard.New(Self)
      .Nome('capacity')
      .Titulo('Capacity')
      .SubTitulo('150GB')
      .ImagemTitulo('globo')
      .ImageDescricao('atualizar')
      .Descricao('Update Now')
      .Alinhamento(TAlignLayout.Left)
    .Build);

  lytCardLeft.AddObject(
    TComponentCard.New(Self)
      .Nome('Revenue')
      .Titulo('Revenue')
      .SubTitulo('$ 1,345')
      .ImagemTitulo('globo')
      .ImageDescricao('atualizar')
      .Descricao('Last day')
      .Alinhamento(TAlignLayout.Left)
    .Build);
end;

procedure TPageHome.CarregaGraficos;
begin
  lytGraficos.AddObject(
    TComponentCardGraficos.New(Self)
      .Nome('financial')
      .TituloInfo('+18')
      .TituloDescricao('$34,657')
      .TituloGrafico('TOTAL EARNINGS IN LAST TEN QUARTERS')
      .DescricaoRodape('Financial Statistics')
      .ImagemRodape('mais')
      .Alinhamento(TAlignLayout.Left)
      .TipoGrafico(TChartType.Lines)
      .Build);
end;

procedure TPageHome.lytCardLeftResize(Sender: TObject);
begin
  ResponsiveLayout(lytCardLeft,2);
end;

procedure TPageHome.lytCardRightResize(Sender: TObject);
begin
  ResponsiveLayout(lytCardRight,2);
end;

procedure TPageHome.lytCardsResize(Sender: TObject);
begin
  lytCardLeft.Width := Round((lytContainer.Width - 40) / 2);
end;

function TPageHome.Render: TFMXObject;
begin
  CarregaCards;
  CarregaGraficos;
  Result := lytContainer;
end;

procedure TPageHome.ResponsiveLayout(Value: TLayout; Count: Integer);
begin
  for var I := 0 to Pred(Value.ChildrenCount) do
    if Value.Children.Items[I] is TLayout then
      TLayout(Value.Children.Items[I]).Width :=
        Round(Value.Width / Count);
end;

procedure TPageHome.UnRender;
begin

end;

end.
