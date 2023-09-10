unit acerp.view.components.edits;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.Edit, FMX.Effects,
  acerp.view.components.interfaces;

type
  TComponentEdit = class(TFrame, iEdits)
    lytContainer: TLayout;
    lblTitulo: TLabel;
    Rectangle1: TRectangle;
    edtText: TEdit;
    procedure edtTextChange(Sender: TObject);
  private
    FChange: TProc<TObject>;
  public
    class function New(AOwner: TComponent): iEdits;
    function Nome(Value: string): iEdits;
    function Text(Value: string): iEdits;
    function FontColor(Value: TAlphaColor = $FF000000): iEdits;
    function BackgroundColor(Value: TAlphaColor = $FFFFFFFF): iEdits;
    function Enable(Value: Boolean = False): iEdits;
    function Change(Value: TProc<TObject>): iEdits;
    function Alinhamento(Value: TAlignLayout): iEdits;
    function VertText(Value: TTextAlign): iEdits;
    function HorzText(Value: TTextAlign): iEdits;
    function Largura(Value: Integer): iEdits;
    function Margem(Value: TEditMargins): iEdits;
    function Titulo(Value: string): iEdits;
    function FontColorTitulo(Value: TAlphaColor = $FFE3E3E3): iEdits;
    function PlaceHolder(Value: string): iEdits;
    function Build: TFMXObject;
  end;

implementation

{$R *.fmx}

{ TComponentEdit }

function TComponentEdit.Alinhamento(Value: TAlignLayout): iEdits;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentEdit.BackgroundColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  Rectangle1.Fill.Color := Value;
end;

function TComponentEdit.Build: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentEdit.Change(Value: TProc<TObject>): iEdits;
begin
  Result := Self;
  FChange := Value;
end;

procedure TComponentEdit.edtTextChange(Sender: TObject);
begin
  if Assigned(FChange) then
    FChange(Sender);
end;

function TComponentEdit.Enable(Value: Boolean): iEdits;
begin
  Result := Self;
  Rectangle1.Fill.Color := $FFE3E3E3;
  edtText.Enabled := Value;
end;

function TComponentEdit.FontColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  edtText.TextSettings.FontColor := Value;
end;

function TComponentEdit.FontColorTitulo(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  lblTitulo.TextSettings.FontColor := Value;
end;

function TComponentEdit.HorzText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  edtText.TextSettings.HorzAlign := Value;
end;

function TComponentEdit.Largura(Value: Integer): iEdits;
begin
  Result := Self;
  lytContainer.Width := Value;
end;

function TComponentEdit.Margem(Value: TEditMargins): iEdits;
begin
  Result := Self;
  lytContainer.Margins.Left := Value.Left;
  lytContainer.Margins.Right := Value.Right;
  lytContainer.Margins.Bottom := Value.Bottom;
  lytContainer.Margins.Top := Value.Top;
end;

class function TComponentEdit.New(AOwner: TComponent): iEdits;
begin
  Result := Self.Create(AOwner);
end;

function TComponentEdit.Nome(Value: string): iEdits;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentEdit.PlaceHolder(Value: string): iEdits;
begin
  Result := Self;
  edtText.TextPrompt := Value;
end;

function TComponentEdit.Text(Value: string): iEdits;
begin
  Result := Self;
  edtText.Text := Value;
end;

function TComponentEdit.Titulo(Value: string): iEdits;
begin
  Result := Self;
  lblTitulo.Text := Value;
end;

function TComponentEdit.VertText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  edtText.TextSettings.VertAlign := Value;
end;

end.
