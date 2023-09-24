unit acerp.view.components.listatables;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Objects;

type
  TComponentListaTable = class(TFrame)
    lytContainer: TLayout;
    LayoutItem: TLayout;
    LayoutAcoes: TLayout;
    LayoutSalario: TLayout;
    LayoutDesde: TLayout;
    LayoutCargo: TLayout;
    LayoutNome: TLayout;
    lblItem: TLabel;
    lblNome: TLabel;
    lblCargo: TLabel;
    lblDesde: TLabel;
    lblSalario: TLabel;
    Label6: TLabel;
    LayoutNovo: TLayout;
    LayoutExcluir: TLayout;
    LayoutEditar: TLayout;
    RectangleNovo: TRectangle;
    RectangleEditar: TRectangle;
    RectangleExcluir: TRectangle;
    ImageNovo: TImage;
    ImageEditar: TImage;
    ImageExcluir: TImage;
    LayoutButtonNovo: TLayout;
    LayoutButtonExcluir: TLayout;
    LayoutButtonEditar: TLayout;
    procedure LayoutButtonNovoMouseEnter(Sender: TObject);
    procedure LayoutButtonNovoMouseLeave(Sender: TObject);
    procedure LayoutButtonExcluirMouseEnter(Sender: TObject);
    procedure LayoutButtonExcluirMouseLeave(Sender: TObject);
    procedure LayoutButtonEditarMouseEnter(Sender: TObject);
    procedure LayoutButtonEditarMouseLeave(Sender: TObject);
  private
    procedure MontaBotoes;
  public
    class function New(AOwner: TComponent): TComponentListaTable;
    function Nome(AValue: string): TComponentListaTable;
    function Item(AValue: string): TComponentListaTable;
    function Descricao(AValue: string): TComponentListaTable;
    function Cargo(AValue: string): TComponentListaTable;
    function Salario(AValue: Currency): TComponentListaTable;
    function Desde(AValue: string): TComponentListaTable;
    function Alinhamento(AValue: TAlignLayout): TComponentListaTable;
    function Build: TFMXObject;
  end;

implementation

{$R *.fmx}

uses acerp.services.utils;

function TComponentListaTable.Alinhamento(
  AValue: TAlignLayout): TComponentListaTable;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := AValue;
end;

function TComponentListaTable.Build: TFMXObject;
begin
  MontaBotoes;
  Result := lytContainer;
end;

function TComponentListaTable.Cargo(AValue: string): TComponentListaTable;
begin
  Result := Self;
  lblCargo.Text := AValue;
end;

function TComponentListaTable.Descricao(AValue: string): TComponentListaTable;
begin
  Result := Self;
  lblNome.Text := AValue;
end;

function TComponentListaTable.Desde(AValue: string): TComponentListaTable;
begin
  Result := Self;
  lblDesde.Text := AVAlue;
end;

function TComponentListaTable.Item(AValue: string): TComponentListaTable;
begin
  Result := Self;
  lblItem.Text := AValue;
end;

procedure TComponentListaTable.LayoutButtonEditarMouseEnter(Sender: TObject);
begin
  RectangleEditar.Fill.Color := $FF44C37D;
end;

procedure TComponentListaTable.LayoutButtonEditarMouseLeave(Sender: TObject);
begin
  RectangleEditar.Fill.Color := $FF68CA94;
end;

procedure TComponentListaTable.LayoutButtonExcluirMouseEnter(Sender: TObject);
begin
  RectangleExcluir.Fill.Color := $FFE46231;
end;

procedure TComponentListaTable.LayoutButtonExcluirMouseLeave(Sender: TObject);
begin
  RectangleExcluir.Fill.Color := $FFEF8157;
end;

procedure TComponentListaTable.LayoutButtonNovoMouseEnter(Sender: TObject);
begin
  RectangleNovo.Fill.Color := $FF29A0C2;
end;

procedure TComponentListaTable.LayoutButtonNovoMouseLeave(Sender: TObject);
begin
  RectangleNovo.Fill.Color := $FF51BCDA;
end;

procedure TComponentListaTable.MontaBotoes;
begin
  TUtils.ResourceImage('user', ImageNovo);
  TUtils.ResourceImage('editar', ImageEditar);
  TUtils.ResourceImage('cancelar', ImageExcluir);
  TUtils.ImageColor(ImageNovo, $FFFFFFFF);
  TUtils.ImageColor(ImageEditar, $FFFFFFFF);
  TUtils.ImageColor(ImageExcluir, $FFFFFFFF);
end;

class function TComponentListaTable.New(
  AOwner: TComponent): TComponentListaTable;
begin
  Result := Self.Create(AOwner);
end;

function TComponentListaTable.Nome(AValue: string): TComponentListaTable;
begin
  Result := Self;
  Self.Name := AValue;
end;

function TComponentListaTable.Salario(AValue: Currency): TComponentListaTable;
begin
  Result := Self;
  lblSalario.Text := FormatCurr('"R$ ",0.00', AValue);
end;

end.
