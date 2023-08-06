unit acerp.view.components.sidebar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects;

type
  TComponentSidebar = class(TFrame)
    lytContainer: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Line1: TLine;
    Line2: TLine;
    Layout4: TLayout;
    lytMenu: TLayout;
    Rectangle1: TRectangle;
  private
    procedure ConstruirMenu;
  public
    class function New(AOwner: TComponent): TComponentSidebar;
    function Component:TFMXObject;
  end;

implementation

{$R *.fmx}

uses acerp.view.components.buttonmenu;

{ TComponentSidebar }

function TComponentSidebar.Component: TFMXObject;
begin
  ConstruirMenu;
  Result := lytContainer;
end;

procedure TComponentSidebar.ConstruirMenu;
begin
  lytMenu.AddObject(
    TComponentButtonMenu.New(Self).Component);
end;

class function TComponentSidebar.New(AOwner: TComponent): TComponentSidebar;
begin
  Result := Self.Create(AOwner);
end;

end.
