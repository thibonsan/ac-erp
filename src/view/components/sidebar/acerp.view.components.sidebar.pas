unit acerp.view.components.sidebar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.MultiView;

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
    FMultiView: TMultiView;
    FOnMenuShow: TProc;
    FOnMenuHide: TProc;

    procedure ConstruirMenu;
    procedure ConstruirPerfil;
  public
    class function New(AOwner: TComponent): TComponentSidebar;
    function MultiView(Value: TMultiView): TComponentSidebar;
    function OnMenuShow(Value: TProc): TComponentSidebar;
    function OnMenuHide(Value: TProc): TComponentSidebar;
    function Component:TFMXObject;
  end;

implementation

{$R *.fmx}

uses
  Router4D,
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
      .ColorDefault($FFC1C0BF)
      .ColorEnter($FFFFFFFF)
      .Click(procedure (Sender: TObject)
      begin
        TRouter4D.Link.&To('ListaPessoas');
      end)
      .Component);

  lytMenu.AddObject(
    TComponentButton.New(Self)
      .Nome('dashboard')
      .SingleButton
      .Descricao('Dashboard')
      .Imagem('banco')
      .ColorDefault($FFC1C0BF)
      .ColorEnter($FFFFFFFF)
      .Alinhamento(TAlignLayout.Top)
      .Click(procedure (Sender: TObject)
      begin
        TRouter4D.Link.&To('Home');
      end)
      .Component);

  lytMenu.AddObject(
    TComponentButton.New(Self)
      .Nome('cadastros')
      .CompositeButton
      .SubMenu(lListaBotoes)
      .Descricao('Cadastros')
      .Imagem('cadastros')
      .ColorDefault($FFC1C0BF)
      .ColorEnter($FFFFFFFF)
      .Alinhamento(TAlignLayout.Top)
      .Component);

  lytMenu.AddObject(
    TComponentButton.New(Self)
      .Nome('tabela')
      .SingleButton
      .Descricao('Tabela')
      .Imagem('tabela')
      .ColorDefault($FFC1C0BF)
      .ColorEnter($FFFFFFFF)
      .Alinhamento(TAlignLayout.Top)
      .Click(procedure (Sender: TObject)
      begin
        TRouter4D.Link.&To('Tables');
      end)
      .Component);
end;

procedure TComponentSidebar.ConstruirPerfil;
begin

  Layout2.AddObject(
    TComponentButton.New(Self)
      .Nome('home')
      .SingleButton
      .Descricao(EmptyStr)
      .Imagem('home')
      .ColorDefault($FFC1C0BF)
      .ColorEnter($FFFFFFFF)
      .Alinhamento(TAlignLayout.Client)
      .Click(procedure (Sender: TObject)
      begin

        if Assigned(FOnMenuShow) then
          FOnMenuShow;
      end)
      .Component);

  lytProfile.AddObject(
    TComponentButton.New(Self)
      .Nome('perfil')
      .Perfil('darth')
      .Descricao('Darth Vader')
      .ColorDefault($FFC1C0BF)
      .ColorEnter($FFFFFFFF)
      .Component);
end;

function TComponentSidebar.MultiView(Value: TMultiView): TComponentSidebar;
begin
  Result := Self;
  FMultiView := Value;
end;

class function TComponentSidebar.New(AOwner: TComponent): TComponentSidebar;
begin
  Result := Self.Create(AOwner);
end;

function TComponentSidebar.OnMenuHide(Value: TProc): TComponentSidebar;
begin
  Result := Self;
  FOnMenuHide := Value;
end;

function TComponentSidebar.OnMenuShow(Value: TProc): TComponentSidebar;
begin
  Result := Self;
  FOnMenuShow := Value;
end;

end.
