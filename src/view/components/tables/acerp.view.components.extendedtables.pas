unit acerp.view.components.extendedtables;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Generics.Collections, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Effects, FMX.Controls.Presentation;

type
  TTransfer = record
    Nome: string;
    Item: string;
    Descricao: string;
    Cargo: string;
    Desde: string;
    Salario: Currency;
  end;

  TComponentExtendedTable = class(TFrame)
    lytContainer: TLayout;
    RectangleBackground: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout1: TLayout;
    lblTitulo: TLabel;
    LayoutTable: TLayout;
    LayoutTitulosTable: TLayout;
    VertScrollBox1: TVertScrollBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Layout2: TLayout;
    RoundRect1: TRoundRect;
    Label1: TLabel;
    Layout3: TLayout;
    procedure Layout3MouseEnter(Sender: TObject);
    procedure Layout3MouseLeave(Sender: TObject);
    procedure Layout3Click(Sender: TObject);
  private
    FProc: TProc<TObject>;

    procedure AlimentarLista;
  public
    class function New(AOwner: TComponent): TComponentExtendedTable;
    function Nome(AValue: string): TComponentExtendedTable;
    function Titulo(AValue: string): TComponentExtendedTable;
    function ColorTitulo(AValue: TAlphaColor): TComponentExtendedTable;
    function Click(AValue: TProc<TObject>): TComponentExtendedTable;
    function Build(AValue: TList<TTransfer>): TFMXObject;
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

function TComponentExtendedTable.Build(AValue: TList<TTransfer>): TFMXObject;
begin
  for var I := 0 to Pred(AValue.Count) do
    VertScrollBox1.AddObject(
      TComponentListaTable.New(Self)
        .Nome(AValue[I].Nome)
        .Item(AValue[I].Item)
        .Descricao(AValue[I].Descricao)
        .Desde(AValue[I].Desde)
        .Cargo(AValue[I].Cargo)
        .Salario(AValue[I].Salario)
        .Alinhamento(TAlignLayout.Top)
      .Build);

  Result := lytContainer;
end;

function TComponentExtendedTable.Click(
  AValue: TProc<TObject>): TComponentExtendedTable;
begin
  Result := Self;
  FProc := AValue;
end;

function TComponentExtendedTable.ColorTitulo(
  AValue: TAlphaColor): TComponentExtendedTable;
begin
  Result := Self;
  lblTitulo.TextSettings.FontColor := AValue;
end;

procedure TComponentExtendedTable.Layout3Click(Sender: TObject);
begin
  if Assigned(FProc) then
    FProc(Sender);
end;

procedure TComponentExtendedTable.Layout3MouseEnter(Sender: TObject);
begin
  RoundRect1.Fill.Color := $FF29A0C2;
end;

procedure TComponentExtendedTable.Layout3MouseLeave(Sender: TObject);
begin
  RoundRect1.Fill.Color := $FF51BCDA;
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

function TComponentExtendedTable.Titulo(
  AValue: string): TComponentExtendedTable;
begin
  Result := Self;
  lblTitulo.Text := AValue;
end;

end.
