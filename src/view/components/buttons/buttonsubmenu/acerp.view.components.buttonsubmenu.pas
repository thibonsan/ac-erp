unit acerp.view.components.buttonsubmenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  acerp.view.components.interfaces,
  acerp.view.components.attributes.interfaces,
  acerp.view.components.buttons.styles;

type
  TComponentButtonSubMenu = class(TForm, IComponents<TComponentButtonSubMenu>)
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
    procedure FormDestroy(Sender: TObject);
  private
    FDescricao: string;
    FSubDescricao: string;
    FImage: string;
    FClick: TProc<TObject>;
    FDefaultColor: TAlphaColor;
    FAccentColor: TAlphaColor;
    FAlign: TAlignLayout;
    FFontSize: Integer;
    FButtonHeight:Integer;
    FCountSubMenu: Integer;
    FButton: IButton<TComponentButtonSubMenu>;
    FStyles: TCompponentButtonStyles;

    procedure AlterColor(Value: TAlphaColor);
    procedure AtualizarLayout;
  public
    function Build: TFMXObject;
    function AddSubMenu(Value: TFMXObject): TComponentButtonSubMenu;
    function LoadStyles(Value: string): TComponentButtonSubMenu;
    function Button: IButton<TComponentButtonSubMenu>;
  end;

implementation

{$R *.fmx}

uses acerp.services.utils, acerp.view.components.attributes.button;

{ TComponentButtonSubMenu }

function TComponentButtonSubMenu.AddSubMenu(
  Value: TFMXObject): TComponentButtonSubMenu;
begin
  Result := Self;
  LayoutSubMenu.AddObject(Value);
  Inc(FCountSubMenu);
end;

procedure TComponentButtonSubMenu.AlterColor(Value: TAlphaColor);
begin
  TUtils.ImageColor(ImageInfo, Value);
  TUtils.ImageColor(ImageMenu, Value);
  lblInfodesc.TextSettings.FontColor := Value;
  lblDescricao.TextSettings.FontColor := Value;
end;

procedure TComponentButtonSubMenu.AtualizarLayout;
begin

  if not FImage.IsEmpty then
    TUtils.ResourceImage(FImage, ImageInfo);

  Layout1.Align := FAlign;
  AlterColor(FDefaultColor);
  lblDescricao.Text := FDescricao;

  if not FSubDescricao.IsEmpty then
  begin
    lblInfodesc.Visible := True;
    lblInfodesc.Text := FSubDescricao;
  end;

  lblDescricao.TextSettings.Font.Size := FFontSize;
  lblInfodesc.TextSettings.Font.Size := FFontSize;
end;

function TComponentButtonSubMenu.Build: TFMXObject;
begin
  Result := Layout1;
  FDescricao := FButton.Descricao;
  FSubDescricao := FButton.DescricaoMenu;
  FImage := FButton.Image;
  FClick := FButton.Click;
  FDefaultColor := FButton.DefaultColor;
  FAccentColor := FButton.AccentColor;
  FAlign := FButton.Align;
  FFontSize := FButton.FontSize;

  ImageMenu.Visible := not (FCountSubMenu = 0);
  Layout1.Height := FButtonHeight;
  LayoutSubMenu.Visible := False;

  AtualizarLayout;
end;

function TComponentButtonSubMenu.Button: IButton<TComponentButtonSubMenu>;
begin
  Result := FButton;
end;

procedure TComponentButtonSubMenu.FormCreate(Sender: TObject);
begin
  FButtonHeight := 50;
  FCountSubMenu := 0;
  FButton := TButton<TComponentButtonSubMenu>.New(Self);
end;

procedure TComponentButtonSubMenu.FormDestroy(Sender: TObject);
begin
  FStyles.Free;
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

function TComponentButtonSubMenu.LoadStyles(
  Value: string): TComponentButtonSubMenu;
begin
  Result := Self;
  FStyles := TCompponentButtonStyles.Create;
  FButton := IButton<TComponentButtonSubMenu>(FStyles.Styles.GetStyle(Value));
  FButton.Parent(Self);
end;

procedure TComponentButtonSubMenu.lytButtonClick(Sender: TObject);
begin
  FClick := FButton.Click;

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
