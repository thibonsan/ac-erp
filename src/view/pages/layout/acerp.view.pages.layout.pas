unit acerp.view.pages.layout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.MultiView, Router4D.Interfaces,
  FMX.StdCtrls;

type
  TPageLayout = class(TForm, IRouter4DComponent)
    lytContainer: TLayout;
    MultiView1: TMultiView;
    Layout1: TLayout;
    lytMain: TLayout;
    Layout2: TLayout;
    lytBody: TLayout;
    recBackground: TRectangle;
    Button1: TButton;
  private
    procedure RenderSidebar;
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
  acerp.view.pages.home;

{ TPageLayout }

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
  TRouter4D.Render<TPageHome>.SetElement(lytBody);
  Result := lytContainer;
end;

procedure TPageLayout.RenderSidebar;
begin
  Layout1.AddObject(
    TComponentSidebar
      .New(Self)
      .MultiView(MultiView1)
      .OnMenuShow(MultiViewShow)
      .OnMenuHide(MultiViewHide)
      .Component);
end;

procedure TPageLayout.UnRender;
begin

end;

end.
