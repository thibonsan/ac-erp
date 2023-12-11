unit acerp.view.components.button;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  system.Generics.Collections, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  Router4D.Props;

type
  TComponentButton = class(TFrame)
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
    FotoPerfil: TCircle;
    procedure lytButtonResized(Sender: TObject);
    procedure lytButtonClick(Sender: TObject);
    procedure lytButtonMouseEnter(Sender: TObject);
    procedure lytButtonMouseLeave(Sender: TObject);
  private
    FHeight: Single;
    FComposite: Boolean;
    FProc: TProc<TObject>;
    FEnter: TAlphaColor;
    FLeave: TAlphaColor;
    FImage: string;
    FClicked: Boolean;

    constructor Create(AOwner: TComponent); override;
    procedure ChamaSubMenu(Sender: TObject);
    procedure StyleMenu;
    procedure Clicado;
    procedure SemClique;
  public
    class function New(AOwner: TComponent): TComponentButton;
    function Nome(Value: string): TComponentButton;
    function CompositeButton: TComponentButton;
    function SingleButton: TComponentButton;
    function Perfil(Value: string): TComponentButton;
    function Descricao(Value: string): TComponentButton;
    function ColorDefault(Value: TAlphaColor): TComponentButton;
    function ColorEnter(Value: TAlphaColor): TComponentButton;
    function Alinhamento(Value: TAlignLayout): TComponentButton;
    function Imagem(Value: string): TComponentButton;
    function SubMenu(Value: TObjectList<TFMXObject>): TComponentButton;
    function Click(Value: TProc<TObject>): TComponentButton;
    function Component: TFMXObject;

    [Subscribe]
    procedure Props(Value: TProps);
  end;

implementation

uses
  acerp.services.utils;

{$R *.fmx}

{ TComponentButtonMenu }

function TComponentButton.Alinhamento(Value: TAlignLayout): TComponentButton;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.Bottom;
  lytContainer.Align := Value;
end;

procedure TComponentButton.ChamaSubMenu(Sender: TObject);
begin
  GlobalEventBus.Post(TProps.Create.PropString(FImage).Key('Button'));

  if not FComposite then
  begin
    Layout1.Padding.Right := 0;

    if Assigned(FProc) then
      FProc(Sender);

    Exit;
  end;

  lytSubMenu.Visible := not lytSubMenu.Visible;

  if not lytSubMenu.Visible then
  begin
    lytContainer.AnimateFloat('Height', 60, 0.2, TAnimationType.&In, TInterpolationType.Linear);
    ImageMenu.AnimateFloat('RotationAngle', 0, 0.2, TAnimationType.&In, TInterpolationType.Linear);
    Exit;
  end;

  lytContainer.AnimateFloat('Height', lytContainer.Height + FHeight, 0.2, TAnimationType.&In,
    TInterpolationType.Linear);

  ImageMenu.AnimateFloat('RotationAngle', 180, 0.2, TAnimationType.&In, TInterpolationType.Linear);
end;

procedure TComponentButton.Clicado;
begin
  TUtils.ImageColor(ImageInfo, FEnter);
  TUtils.ImageColor(ImageMenu, FEnter);
  lblDescricao.TextSettings.FontColor := FEnter;
end;

function TComponentButton.Click(Value: TProc<TObject>): TComponentButton;
begin
  Result := Self;
  FProc := Value;
end;

function TComponentButton.ColorDefault(Value: TAlphaColor): TComponentButton;
begin
  Result := Self;
  FLeave := Value;
end;

function TComponentButton.ColorEnter(Value: TAlphaColor): TComponentButton;
begin
  Result := Self;
  FEnter := Value;
end;

function TComponentButton.Component: TFMXObject;
begin
  Result := lytContainer;
  FClicked := False;
  GlobalEventBus.RegisterSubscriber(Self);
end;

function TComponentButton.CompositeButton: TComponentButton;
begin
  Result := Self;
  FComposite := True;
end;

constructor TComponentButton.Create(AOwner: TComponent);
begin
  inherited;

  TUtils.ResourceImage('setabaixo', ImageMenu);
end;

function TComponentButton.Descricao(Value: string): TComponentButton;
begin
  Result := Self;
  lblDescricao.Text := Value;
end;

function TComponentButton.Imagem(Value: string): TComponentButton;
begin
  Result := Self;
  FImage := Value;
  TUtils.ResourceImage(FImage, ImageInfo);
end;

procedure TComponentButton.lytButtonClick(Sender: TObject);
begin
  ChamaSubMenu(Sender);
end;

procedure TComponentButton.lytButtonMouseEnter(Sender: TObject);
begin
  Clicado;
end;

procedure TComponentButton.lytButtonMouseLeave(Sender: TObject);
begin

  if not FClicked then
    SemClique;
end;

procedure TComponentButton.lytButtonResized(Sender: TObject);
begin
  StyleMenu;
end;

class function TComponentButton.New(AOwner: TComponent): TComponentButton;
begin
  Result := Self.Create(AOwner);
end;

function TComponentButton.Nome(Value: string): TComponentButton;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentButton.Perfil(Value: string): TComponentButton;
begin
  Result := Self;
  TUtils.ResourceImage(Value, FotoPerfil);
  FotoPerfil.Visible := True;
  Layout1.Padding.Left := 10;
end;

procedure TComponentButton.Props(Value: TProps);
begin
  FClicked := False;

  if Value.Key = 'Button'  then
    if Value.PropString = FImage then
      FClicked := True
    else
      FClicked := False;

end;

procedure TComponentButton.SemClique;
begin
  TUtils.ImageColor(ImageInfo, FLeave);
  TUtils.ImageColor(ImageMenu, FLeave);
  lblDescricao.TextSettings.FontColor := FLeave;
end;

function TComponentButton.SingleButton: TComponentButton;
begin
  Result := Self;
  FComposite := False;
end;

procedure TComponentButton.StyleMenu;
begin

  if not (lytContainer.Width > 80) then
  begin
    lytImageMenu.Visible := False;
    Exit;
  end;

  if FComposite then
    lytImageMenu.Visible := True;
end;

function TComponentButton.SubMenu(Value: TObjectList<TFMXObject>): TComponentButton;
begin
  Result := Self;

  for var I in Value do
  begin
    FHeight := FHeight + TLayout(I).Height;
    lytSubMenu.AddObject(I);
  end;
end;

end.
