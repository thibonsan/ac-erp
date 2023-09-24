unit acerp.view.components.extendedtables;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Effects, FMX.Controls.Presentation;

type
  TComponentExtendedTable = class(TFrame)
    lytContainer: TLayout;
    RectangleBackground: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout1: TLayout;
    Label1: TLabel;
    LayoutTable: TLayout;
    LayoutTitulosTable: TLayout;
    VertScrollBox1: TVertScrollBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
  private
    procedure AlimentarLista;
  public
    class function New(AOwner: TComponent): TComponentExtendedTable;
    function Nome(AValue: string): TComponentExtendedTable;
    function ColorTitulo(AValue: TAlphaColor): TComponentExtendedTable;
    function Build: TFMXObject;
  end;

implementation

{$R *.fmx}

uses acerp.view.components.listatables;

{ TComponentExtendedTable }

procedure TComponentExtendedTable.AlimentarLista;
begin
  for var I := 0 to 10 do
    VertScrollBox1.AddObject(
      TComponentListaTable.New(Self)
        .Nome('Frame' + I.ToString)
        .Item(I.ToString)
        .Descricao('Colaborador ' + I.ToString)
        .Cargo('Cargo ' + I.ToString)
        .Salario(Round(I))
        .Descricao('2023')
        .Alinhamento(TAlignLayout.Top)
        .Build);
end;

function TComponentExtendedTable.Build: TFMXObject;
begin
  AlimentarLista;
  Result := lytContainer;
end;

function TComponentExtendedTable.ColorTitulo(
  AValue: TAlphaColor): TComponentExtendedTable;
begin
  Result := Self;

  for var I := 0 to Pred(ComponentCount) do
    if Components[I] is TLabel and (not TLabel(Components[I]).Text.Equals('Simple Example')) then
      TLabel(Components[I]).TextSettings.FontColor := AValue;
end;

class function TComponentExtendedTable.New(
  AOwner: TComponent): TComponentExtendedTable;
begin
  Result := Self.Create(AOwner);
end;

function TComponentExtendedTable.Nome(AValue: string): TComponentExtendedTable;
begin
  Result := Self;
  Self.Name := AValue;
end;

end.
