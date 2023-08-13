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
    lytProfile: TLayout;
    lytMenu: TLayout;
    Rectangle1: TRectangle;
  private
    procedure ConstruirMenu;
    procedure ConstruirPerfil;
  public
    class function New(AOwner: TComponent): TComponentSidebar;
    function Component:TFMXObject;
  end;

implementation

{$R *.fmx}

uses
  System.Generics.Collections,
  acerp.view.components.button;

{ TComponentSidebar }

function TComponentSidebar.Component: TFMXObject;
begin
  ConstruirMenu;
  ConstruirPerfil;
  Result := lytContainer;
end;

procedure TComponentSidebar.ConstruirMenu;
begin
  var lListaBotoes := TObjectList<TFmxObject>.Create;

  lListaBotoes.Add(
    TComponentButton.New(Self)
      .Nome('pessoas')
      .SingleButton
      .Descricao('Pessoas')
      .Imagem('pessoas')
      .ColorDefault($FFFFFFFF)
      .Component);

  lytMenu.AddObject(
    TComponentButton.New(Self)
      .Nome('dashboard')
      .SingleButton
      .Descricao('Dashboard')
      .Imagem('banco')
      .ColorDefault($FFFFFFFF)
      .Alinhamento(TAlignLayout.Top)
      .Component);

  lytMenu.AddObject(
    TComponentButton.New(Self)
      .Nome('cadastros')
      .CompositeButton
      .SubMenu(lListaBotoes)
      .Descricao('Cadastros')
      .Imagem('cadastros')
      .ColorDefault($FFFFFFFF)
      .Alinhamento(TAlignLayout.Top)
      .Component);
end;

procedure TComponentSidebar.ConstruirPerfil;
begin

  lytProfile.AddObject(
    TComponentButton.New(Self)
      .Nome('perfil')
      .Perfil('darth')
      .Descricao('Darth Vader')
      .ColorDefault($FFFFFFFF)
      .Component);
end;

class function TComponentSidebar.New(AOwner: TComponent): TComponentSidebar;
begin
  Result := Self.Create(AOwner);
end;

end.
