unit acerp.view.components.buttonsubmenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TComponentButtonSubMenu = class(TForm)
    Layout1: TLayout;
    lytContainer: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    lytImageInfo: TLayout;
    ImageInfo: TImage;
    FotoPerfil: TCircle;
    lytImageMenu: TLayout;
    ImageMenu: TImage;
    lytDescricao: TLayout;
    lblDescricao: TLabel;
    lytButton: TLayout;
    lytSubMenu: TLayout;
    LayoutSubMenu: TLayout;
    lblInfodesc: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Layout1Resize(Sender: TObject);
    procedure Layout1Resized(Sender: TObject);
    procedure lytButtonClick(Sender: TObject);
    procedure lytButtonMouseEnter(Sender: TObject);
    procedure lytButtonMouseLeave(Sender: TObject);
  private
    FDescricao: string;
    FImage: string;
    FClick: TProc<TObject>;
    FDefaultColor: TAlphaColor;
    FAccentColor: TAlphaColor;
    FAlign: TAlignLayout;
    FFontSize: Integer;
    FButtonHeight:Integer;
    FCountSubMenu: Integer;

    procedure AlterColor(Value: TAlphaColor);
  public
    function Build: TFMXObject;

    function Descricao(Value: string): TComponentButtonSubMenu;
    function Image(Value: string): TComponentButtonSubMenu;
    function DescricaoMenu(Value: string): TComponentButtonSubMenu;
    function Click(Value: TProc<TObject>): TComponentButtonSubMenu;
    function DefaultColor(Value: TAlphaColor): TComponentButtonSubMenu;
    function AccentColor(Value: TAlphaColor): TComponentButtonSubMenu;
    function Align(Value: TAlignLayout): TComponentButtonSubMenu;
    function FontSize(Value: Integer): TComponentButtonSubMenu;
    function AddSubMenu(Value: TFMXObject): TComponentButtonSubMenu;
  end;

implementation

{$R *.fmx}

uses acerp.services.utils;

{ TComponentButtonSubMenu }

function TComponentButtonSubMenu.AccentColor(
  Value: TAlphaColor): TComponentButtonSubMenu;
begin
  Result := Self;
  FAccentColor := Value;
  AlterColor(FAccentColor);
end;

function TComponentButtonSubMenu.AddSubMenu(
  Value: TFMXObject): TComponentButtonSubMenu;
begin
  Result := Self;
  LayoutSubMenu.AddObject(Value);
  Inc(FCountSubMenu);
end;

function TComponentButtonSubMenu.Align(
  Value: TAlignLayout): TComponentButtonSubMenu;
begin
  Result := Self;
  FAlign := Value;
  Layout1.Align := FAlign;
end;

procedure TComponentButtonSubMenu.AlterColor(Value: TAlphaColor);
begin
  TUtils.ImageColor(ImageInfo, Value);
  TUtils.ImageColor(ImageMenu, Value);
  lblInfodesc.TextSettings.FontColor := Value;
  lblDescricao.TextSettings.FontColor := Value;
end;

function TComponentButtonSubMenu.Build: TFMXObject;
begin
  Result := Layout1;
  AlterColor(FDefaultColor);
  ImageMenu.Visible := not (FCountSubMenu = 0);
  Layout1.Height := FButtonHeight;
  LayoutSubMenu.Visible := False;
end;

function TComponentButtonSubMenu.Click(
  Value: TProc<TObject>): TComponentButtonSubMenu;
begin
  Result := Self;
  FClick := Value;
end;

function TComponentButtonSubMenu.DefaultColor(
  Value: TAlphaColor): TComponentButtonSubMenu;
begin
  Result := Self;
  FDefaultColor := Value;
  AlterColor(FDefaultColor);
end;

function TComponentButtonSubMenu.Descricao(
  Value: string): TComponentButtonSubMenu;
begin
  Result := Self;
  FDescricao := Value;
  lblDescricao.Text := FDescricao;
end;

function TComponentButtonSubMenu.DescricaoMenu(
  Value: string): TComponentButtonSubMenu;
begin
  Result := Self;
  lblInfodesc.Visible := True;
  lblInfodesc.Text := Value;
end;

function TComponentButtonSubMenu.FontSize(
  Value: Integer): TComponentButtonSubMenu;
begin
  Result := Self;
  FFontSize := Value;
  lblDescricao.TextSettings.Font.Size := FFontSize;
  lblInfodesc.TextSettings.Font.Size := FFontSize;
end;

procedure TComponentButtonSubMenu.FormCreate(Sender: TObject);
begin
  FButtonHeight := 50;
  FCountSubMenu := 0;
end;

function TComponentButtonSubMenu.Image(Value: string): TComponentButtonSubMenu;
begin
  Result := Self;
  FImage := Value;
  TUtils.ResourceImage(Value, ImageInfo);
end;

procedure TComponentButtonSubMenu.Layout1Resize(Sender: TObject);
begin

  if Layout1.Width > 100 then
    lytImageMenu.Visible := True;
end;

procedure TComponentButtonSubMenu.Layout1Resized(Sender: TObject);
begin

  if Layout1.Width > 100 then
    lytImageMenu.Visible := True
  else
    lytImageMenu.Visible := False;
end;

procedure TComponentButtonSubMenu.lytButtonClick(Sender: TObject);
begin

  if Assigned(FClick) then
    FClick(Sender);

  Layout1.Height := FButtonHeight;

  if FCountSubMenu > 0 then
  begin

    if not LayoutSubMenu.Visible then
      Layout1.Height := FButtonHeight + (FCountSubMenu * FButtonHeight);

    LayoutSubMenu.Visible := not LayoutSubMenu.Visible;
    TUtils.ResourceImage('setabaixo', ImageMenu);

    if LayoutSubMenu.Visible then
      TUtils.ResourceImage('setacima', ImageMenu);
  end;
end;

procedure TComponentButtonSubMenu.lytButtonMouseEnter(Sender: TObject);
begin
  AlterColor(FAccentColor);
end;

procedure TComponentButtonSubMenu.lytButtonMouseLeave(Sender: TObject);
begin
  AlterColor(FDefaultColor);
end;

end.
