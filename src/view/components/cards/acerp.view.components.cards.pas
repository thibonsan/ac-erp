unit acerp.view.components.cards;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.Effects;

type
  TComponentCard = class(TFrame)
    lytContainer: TLayout;
    Rectangle1: TRectangle;
    lytTitulo: TLayout;
    lytRodape: TLayout;
    Line1: TLine;
    Layout1: TLayout;
    ImageRodape: TImage;
    Layout2: TLayout;
    lblDescricaoRodape: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    ImageTitulo: TImage;
    Layout5: TLayout;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
  public
    class function New(AOwner: TComponent): TComponentCard;
    function Nome(Value: string): TComponentCard;
    function Titulo(Value: string; Color: TAlphaColor = $FFD8B59A): TComponentCard;
    function SubTitulo(Value: string; Color: TAlphaColor = $FF252422): TComponentCard;
    function ImagemTitulo(Value: string; Color: TAlphaColor = $FFFBC658): TComponentCard;
    function Descricao(Value: string; Color: TAlphaColor = $FFD8B59A): TComponentCard;
    function ImageDescricao(Value: string; Color: TAlphaColor = $FF66615B): TComponentCard;
    function Alinhamento(Value: TAlignLayout): TComponentCard;
    function Margem(Bottom, Left, Right, Top: Single): TComponentCard;
    function Build: TFmxObject;
  end;

implementation

{$R *.fmx}

uses acerp.services.utils;

{ TComponentCard }

function TComponentCard.Alinhamento(Value: TAlignLayout): TComponentCard;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentCard.Build: TFmxObject;
begin
  Result := lytContainer;
end;

function TComponentCard.Descricao(Value: string; Color: TAlphaColor = $FFD8B59A): TComponentCard;
begin
  Result := Self;
  lblDescricaoRodape.Text := Value;
  lblDescricaoRodape.TextSettings.FontColor := Color;
end;

function TComponentCard.ImageDescricao(Value: string; Color: TAlphaColor = $FF66615B): TComponentCard;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageRodape);
  TUtils.ImageColor(ImageRodape, Color);
end;

function TComponentCard.ImagemTitulo(Value: string; Color: TAlphaColor = $FFFBC658): TComponentCard;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageTitulo);
  TUtils.ImageColor(ImageTitulo, Color);
end;

function TComponentCard.Margem(Bottom, Left, Right,
  Top: Single): TComponentCard;
begin
  Result := Self;
  lytContainer.Margins.Bottom := Bottom;
  lytContainer.Margins.Left := Left;
  lytContainer.Margins.Right := Right;
  lytContainer.Margins.Top := Top;
end;

class function TComponentCard.New(AOwner: TComponent): TComponentCard;
begin
  Result :=  Self.Create(AOwner);
end;

function TComponentCard.Nome(Value: string): TComponentCard;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentCard.SubTitulo(Value: string; Color: TAlphaColor = $FF252422): TComponentCard;
begin
  Result := Self;
  lblSubTitulo.Text := Value;
  lblSubTitulo.TextSettings.FontColor := Color;
end;

function TComponentCard.Titulo(Value: string; Color: TAlphaColor = $FFD8B59A): TComponentCard;
begin
  Result := Self;
  lblTitulo.Text := Value;
  lblTitulo.TextSettings.FontColor := Color;
end;

end.
