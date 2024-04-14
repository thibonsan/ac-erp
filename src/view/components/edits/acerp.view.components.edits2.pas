unit acerp.view.components.edits2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  acerp.view.components.interfaces, FMX.Edit, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TComponentEdit2 = class(TForm, IEdits)
    lytContainer: TLayout;
    lblTitulo: TLabel;
    Rectangle1: TRectangle;
    edtText: TEdit;
    procedure edtTextChange(Sender: TObject);
    procedure edtTextKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    FChange: TProc<TObject>;
    FField: ^string;
  public
    class function New(AOwner: TComponent): iEdits;
    function Nome(Value: string): iEdits;
    function Text(Value: string): iEdits;
    function FontColor(Value: TAlphaColor = $FF000000): iEdits;
    function BackgroundColor(Value: TAlphaColor = $FFFFFFFF): iEdits;
    function Enable(Value: Boolean = False): iEdits;
    function Change(Value: TProc<TObject>): iEdits;
    function FieldValue(var AField: string): iEdits;
    function Alinhamento(Value: TAlignLayout): iEdits;
    function VertText(Value: TTextAlign): iEdits;
    function HorzText(Value: TTextAlign): iEdits;
    function Largura(Value: Integer): iEdits;
    function Margem(Value: TEditMargins): iEdits;
    function Titulo(Value: string): iEdits;
    function FontColorTitulo(Value: TAlphaColor = $FFE3E3E3): iEdits;
    function PlaceHolder(Value: string): iEdits;
    function Image(Value: string): iEdits;
    function ImageColor(Value: TAlphaColor): iEdits;
    function Password(Value: Boolean): iEdits;
    function Build: TFMXObject;
  end;

implementation

{$R *.fmx}

{ TComponentEdit2 }

function TComponentEdit2.Alinhamento(Value: TAlignLayout): iEdits;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentEdit2.BackgroundColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  Rectangle1.Fill.Color := Value;
end;

function TComponentEdit2.Build: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentEdit2.Change(Value: TProc<TObject>): iEdits;
begin
  Result := Self;
  FChange := Value;
end;

procedure TComponentEdit2.edtTextChange(Sender: TObject);
begin
  if Assigned(FChange) then
    FChange(Sender);
end;

procedure TComponentEdit2.edtTextKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  FField^ := edtText.Text;
end;

function TComponentEdit2.Enable(Value: Boolean): iEdits;
begin
  Result := Self;
  Rectangle1.Fill.Color := $FFE3E3E3;
  edtText.Enabled := Value;
end;

function TComponentEdit2.FieldValue(var AField: string): iEdits;
begin
  Result := Self;
  FField := @AField;
end;

function TComponentEdit2.FontColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  edtText.TextSettings.FontColor := Value;
end;

function TComponentEdit2.FontColorTitulo(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  lblTitulo.TextSettings.FontColor := Value;
end;

function TComponentEdit2.HorzText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  edtText.TextSettings.HorzAlign := Value;
end;

function TComponentEdit2.Image(Value: string): iEdits;
begin
  Result :=Self;
end;

function TComponentEdit2.ImageColor(Value: TAlphaColor): iEdits;
begin
  Result :=Self;
end;

function TComponentEdit2.Largura(Value: Integer): iEdits;
begin
  Result := Self;
  lytContainer.Width := Value;
end;

function TComponentEdit2.Margem(Value: TEditMargins): iEdits;
begin
  Result := Self;
  lytContainer.Margins.Left := Value.Left;
  lytContainer.Margins.Right := Value.Right;
  lytContainer.Margins.Bottom := Value.Bottom;
  lytContainer.Margins.Top := Value.Top;
end;

class function TComponentEdit2.New(AOwner: TComponent): iEdits;
begin
  Result := Self.Create(AOwner);
end;

function TComponentEdit2.Nome(Value: string): iEdits;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentEdit2.Password(Value: Boolean): iEdits;
begin
  Result :=Self;
end;

function TComponentEdit2.PlaceHolder(Value: string): iEdits;
begin
  Result := Self;
  edtText.TextPrompt := Value;
end;

function TComponentEdit2.Text(Value: string): iEdits;
begin
  Result := Self;
  edtText.Text := Value;
end;

function TComponentEdit2.Titulo(Value: string): iEdits;
begin
  Result := Self;
  lblTitulo.Text := Value;
end;

function TComponentEdit2.VertText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  edtText.TextSettings.VertAlign := Value;
end;

end.
