unit acerp.view.pages.layout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.MultiView, Router4D.Interfaces,
  FMX.StdCtrls, FMX.WebBrowser, View.WebCharts, Data.DB, Datasnap.DBClient;

type
  TPageLayout = class(TForm, IRouter4DComponent)
    lytContainer: TLayout;
    MultiView1: TMultiView;
    Layout1: TLayout;
    lytMain: TLayout;
    Layout2: TLayout;
    lytBody: TLayout;
    recBackground: TRectangle;
    WebCharts1: TWebCharts;
    WebBrowser1: TWebBrowser;
    ClientDataSetReal1: TClientDataSet;
    ClientDataSetReal2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet4: TClientDataSet;
  private
    procedure RenderSidebar;
    procedure DashBoard(Sender: TObject);
    procedure MultiViewShow;
    procedure MultiViewHide;
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

implementation

{$R *.fmx}

uses
  Router4D,
  acerp.view.components.sidebar,
  acerp.view.pages.home, Charts.Types;

{ TPageLayout }

procedure TPageLayout.DashBoard(Sender: TObject);
begin
  WebCharts1
    .AddResource('<link href="css/green.css" rel="stylesheet">')
    .AddResource('<link href="css/custom.min.css" rel="stylesheet">')
    .NewProject
      //Criando uma Linha com 6 Colunas e Adicionando conteudo HTML em cada uma
      //dessas colunas
      .Rows
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fas fa-user"></i> Total Users ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">2500</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>4% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-clock-o"></i> Average Time ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">123</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>3% </i> From last Week' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Males ' +
               '</span>' +
               '<div class="count" style="font-size: 40px; color: #1ABB9C;">2,500</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>34% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Females ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">4,567</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="red"><i class="fa fa-angle-down"></i>12% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Collections ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">2,315</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>34% </i> From last Week ' +
               '</span> ')
        .&End
        ._Div
          .ColSpan(2)
          .Add('<span class="count_top">' +
               '  <i class="fa fa-user"></i> Total Connections ' +
               '</span>' +
               '<div class="count" style="font-size:  40px;">7,325</div>' +
               '<span class="count_bottom"> ' +
               '  <i class="green"><i class="fa fa-angle-up"></i>54% </i> From last Week ' +
               '</span> ')
        .&End
      .&End
      //Pulando Linha
      .Jumpline
      //Adicionando uma nova linha com um gráfico LineStack e Barras Horizontal
      .Rows
        //Adicionando Grafico Line
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(line)
                    .Attributes
                      .Name('linestacked1')
                      .ColSpan(8)
                      .Heigth(150)
                      .Options
                        .Scales
                          .Axes
                            .xAxe
                              .Stacked(True)
                            .&End
                            .yAxe
                              .Stacked(True)
                            .&End
                          .&End
                        .&End
                        .Title
                          .text('Network Activities Graph title sub-title')
                        .&End
                      .&End
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .RealTimeDataSet(ClientDataSetReal1)
                        .BackgroundColor('227,233,235')
                        .BorderColor('227,233,235')
                        .Fill(False)
                      .&End
                      .DataSet
                        .textLabel('Meu DataSet 2')
                        .RealTimeDataSet(ClientDataSetReal2)
                        .BackgroundColor('26,187,156')
                        .Fill(False)
                        .BorderColor('26,187,156')
                        .LineTension(0)
                        .BorderDash(8, 4)
                      .&End
                      .Options
                        .Scales
                          .Axes
                            .xAxe
                              .RealTime
                              .&End
                            .&End
                          .&End
                        .&End
                        .Tooltip
                          .Intersect(false)
//                          .Format('$0,0.00')
                        .&End
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End
        //Adicionando Grafico Barras Horizontal
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(horizontalBar)
                    .Attributes
                      .Name('horizontabar1')
                      .ColSpan(4)
                      .Heigth(295)
                      .Options
                        .Title
                          .text('Top Campaign Performance')
                        .&End
                      .&End
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet3)
                        .BackgroundColor('26,187,156')
                        .BorderColor('26,187,156')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End
      .&End
      .Rows
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(horizontalBar)
                    .Attributes
                      .Name('horizontabar2')
                      .ColSpan(4)
                      .Heigth(295)
                      .Options
                        .Title
                          .text('App Usage across versions')
                        .&End
                      .&End
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet3)
                        .BackgroundColor('26,187,156')
                        .BorderColor('26,187,156')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(doughnut)
                    .Attributes
                      .Name('Doughnut')
                      .ColSpan(4)
                      .Heigth(295)
                      .Options
                        .Title
                          .text('Device Usage')
                        .&End
                      .&End
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet4)
                        .BackgroundColor('26,187,156')
                        .BorderColor('227,233,235')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End
        .Tag
          .Add(
            WebCharts1
              .ContinuosProject
                .Charts
                  ._ChartType(doughnut)
                    .Attributes
                      .Name('Pie1')
                      .ColSpan(4)
                      .Heigth(295)
                      .Options
                        .Title
                          .text('Device Usage')
                        .&End
                      .&End
                      .DataSet
                        .textLabel('Meu DataSet 1')
                        .DataSet(ClientDataSet3)
                        .BackgroundColor('227,233,235')
                        .BorderColor('26,187,156')
                      .&End
                    .&End
                  .&End
                .&End
                .HTML
          )
        .&End

      .&End

    .WebBrowser(WebBrowser1)
    .Generated;
end;

procedure TPageLayout.MultiViewHide;
begin
  MultiView1.HideMaster;
end;

procedure TPageLayout.MultiViewShow;
begin
  MultiView1.ShowMaster;
end;

function TPageLayout.Render: TFMXObject;
begin
  RenderSidebar;
//  TRouter4D.Render<TPageHome>.SetElement(lytBody);
  Result := lytContainer;
end;

procedure TPageLayout.RenderSidebar;
begin

  Layout1.AddObject(
    TComponentSidebar
      .New(Self)
      .OnMenuShow(MultiViewShow)
      .OnMenuHide(MultiViewHide)
      .Click(DashBoard)
      .Component);
end;

procedure TPageLayout.UnRender;
begin

end;

end.
