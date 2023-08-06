unit acerp.view.components.buttonmenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation;

type
  TComponentButtonMenu = class(TFrame)
    lytContainer: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    lytImageInfo: TLayout;
    lytImageMenu: TLayout;
    ImageInfo: TImage;
    ImageMenu: TImage;
    lytDescricao: TLayout;
    lblDescricao: TLabel;
    lytSubMenu: TLayout;
    lytButton: TLayout;
    procedure lytButtonClick(Sender: TObject);
  private
    FHeight: Single;

    procedure RedimensionaSubMenu;
  public
    constructor Create(AOwner: TComponent); override;
    class function New(AOwner: TComponent): TComponentButtonMenu;
    function Component: TFMXObject;
    function SubMenu(Value: TFMXObject): TComponentButtonMenu;
  end;

implementation

uses
  acerp.services.utils;

{$R *.fmx}

{ TComponentButtonMenu }

function TComponentButtonMenu.Component: TFMXObject;
begin
  Result := lytContainer;
end;

constructor TComponentButtonMenu.Create(AOwner: TComponent);
begin
  inherited;

//  lytContainer.Height := 60;
//  TUtils.ResourceImage('setabaixo', ImageMenu);
end;

procedure TComponentButtonMenu.lytButtonClick(Sender: TObject);
begin
  lytContainer.Height := FHeight;
end;

class function TComponentButtonMenu.New(AOwner: TComponent): TComponentButtonMenu;
begin
  Result := Self.Create(AOwner);
end;

procedure TComponentButtonMenu.RedimensionaSubMenu;
begin
  for var I := 0 to Pred(lytSubMenu.ComponentCount) do
    if lytSubMenu.Components[I] is TLayout then
      FHeight := FHeight + TLayout(lytSubMenu.Components[I]).Height;
end;

function TComponentButtonMenu.SubMenu(Value: TFMXObject): TComponentButtonMenu;
begin
  Result := Self;
  lytSubMenu.AddObject(Value);
end;

end.
