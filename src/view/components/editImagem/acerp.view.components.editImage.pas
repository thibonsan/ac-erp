unit acerp.view.components.editImage;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.Edit, acerp.view.components.interfaces;

type
  TComponentEditImage = class(TFrame, iEdits)
    LayoutContainer: TLayout;
    Rectanglecontainer: TRectangle;
    Layout1: TLayout;
    ImageEdit: TImage;
    Layout2: TLayout;
    RectangleBackground: TRectangle;
    Edit1: TEdit;
  private
    FProc: TProc<TObject>;
  public
    class function New(AOwner: TComponent): iEdits;
    function Nome(Value: String): iEdits;
    function Text(Value: String): iEdits;
    function FontColor(Value: TAlphaColor = $FF000000): iEdits;
    function BackgroundColor(VAlue: TAlphaColor = $FFFFFFFF): iEdits;
    function Enable(Value: Boolean = False): iEdits;
    function Change(Value: TProc<TObject>): iEdits;
    function FieldValue(var AField: string): iEdits;
    function Alinhamento(Value: TAlignLayout): iEdits;
    function VertText(VAlue: TTextAlign): iEdits;
    function HorzText(Value: TTextAlign): iEdits;
    function Largura(Value: Integer): iEdits;
    function Margem(Value: TEditMargins): iEdits;
    function Titulo(Value: String): iEdits;
    function FontColorTitulo(Value: TAlphaColor = $FFE3E3E3):iEdits;
    function PlaceHolder(Value: String): iEdits;
    function Image(Value: string): iEdits;
    function ImageColor(Value: TAlphaColor): iEdits;
    function Password(Value: Boolean): iEdits;
    function Build: TFMXObject;
  end;

implementation

{$R *.fmx}

uses acerp.services.utils;

{ TComponentEditImage }

function TComponentEditImage.Alinhamento(Value: TAlignLayout): iEdits;
begin
  Result := SElf;
  LayoutContainer.Align := TAlignLayout.None;
  LayoutContainer.Align := Value;
end;

function TComponentEditImage.BackgroundColor(VAlue: TAlphaColor): iEdits;
begin
  Result := Self;
  RectangleBackground.Fill.Color := Value;
end;

function TComponentEditImage.Build: TFMXObject;
begin
  Result := LayoutContainer;
end;

function TComponentEditImage.Change(Value: TProc<TObject>): iEdits;
begin
  Result := Self;
  FProc := VAlue;
end;

function TComponentEditImage.Enable(Value: Boolean): iEdits;
begin
  Result := Self;
  Rectanglecontainer.Enabled := Value;
end;

function TComponentEditImage.FieldValue(var AField: string): iEdits;
begin
//
end;

function TComponentEditImage.FontColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  Edit1.TextSettings.FontColor := VAlue;
end;

function TComponentEditImage.FontColorTitulo(Value: TAlphaColor): iEdits;
begin
  Result := Self;
end;

function TComponentEditImage.HorzText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  Edit1.TextSettings.HorzAlign := VAlue;
end;

function TComponentEditImage.Image(Value: string): iEdits;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageEdit);
end;

function TComponentEditImage.ImageColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  TUtils.ImageColor(ImageEdit, Value);
end;

function TComponentEditImage.Largura(Value: Integer): iEdits;
begin
  Result := Self;
end;

function TComponentEditImage.Margem(Value: TEditMargins): iEdits;
begin
  Result := Self;
  LayoutContainer.Margins.Top := Value.Top;
  LayoutContainer.Margins.Left := Value.Left;
  LayoutContainer.Margins.Bottom := Value.Bottom;
  LayoutContainer.Margins.Right := Value.Right;
end;

class function TComponentEditImage.New(AOwner: TComponent): iEdits;
begin
  Result := Self.Create(AOwner)
end;

function TComponentEditImage.Nome(Value: String): iEdits;
begin
  Result := Self;
  Self.Name := VAlue;
end;

function TComponentEditImage.Password(Value: Boolean): iEdits;
begin
  Result := Self;
  Edit1.Password := VAlue;
end;

function TComponentEditImage.PlaceHolder(Value: String): iEdits;
begin
  Result := Self;
  Edit1.TextPrompt := VAlue;
end;

function TComponentEditImage.Text(Value: String): iEdits;
begin
  Result := Self;
  Edit1.Text := VAlue
end;

function TComponentEditImage.Titulo(Value: String): iEdits;
begin
  Result := Self;
end;

function TComponentEditImage.VertText(VAlue: TTextAlign): iEdits;
begin
  Result := Self;
  Edit1.TextSettings.VertAlign := Value;
end;

end.
