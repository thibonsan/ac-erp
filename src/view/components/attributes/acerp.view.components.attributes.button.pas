unit acerp.view.components.attributes.button;

interface

uses
  acerp.view.components.attributes.interfaces, System.SysUtils, System.UITypes,
  FMX.Types;

type
  TButton<T: class> = class(TInterfacedObject, IButton<T>)
  private
    [weak]
    FParent: T;

    FDescricao: string;
    FImage: string;
    FDescricaoMenu: string;
    FClick: TProc<TObject>;
    FDefaultColor: TAlphaColor;
    FAccentColor: TAlphaColor;
    FAlign: TAlignLayout;
    FFontSize: Integer;

    constructor Create(Parent: T);
  public
    class function New(Parent: T): IButton<T>;
    function Descricao(Value: string): IButton<T>; overload;
    function Descricao: string; overload;
    function Image(Value: string): IButton<T>; overload;
    function Image: string; overload;
    function DescricaoMenu(Value: string): IButton<T>; overload;
    function DescricaoMenu: string; overload;
    function Click(Value: TProc<TObject>): IButton<T>; overload;
    function Click: TProc<TObject>; overload;
    function DefaultColor(Value: TAlphaColor): IButton<T>; overload;
    function DefaultColor: TAlphaColor; overload;
    function AccentColor(Value: TAlphaColor): IButton<T>; overload;
    function AccentColor: TAlphaColor; overload;
    function Align(Value: TAlignLayout): IButton<T>; overload;
    function Align: TAlignLayout; overload;
    function FontSize(Value: Integer): IButton<T>; overload;
    function FontSize: Integer; overload;
    function &End: T;
  end;

implementation

{ TButton<T> }

function TButton<T>.AccentColor(Value: TAlphaColor): IButton<T>;
begin
  Result := Self;
  FAccentColor := Value;
end;

function TButton<T>.AccentColor: TAlphaColor;
begin
  Result := FAccentColor;
end;

function TButton<T>.Align: TAlignLayout;
begin
  Result := FAlign;
end;

function TButton<T>.Align(Value: TAlignLayout): IButton<T>;
begin
  Result := Self;
  FAlign := Value;
end;

function TButton<T>.Click(Value: TProc<TObject>): IButton<T>;
begin
  Result := Self;
  FClick := Value;
end;

function TButton<T>.Click: TProc<TObject>;
begin
  Result := FClick;
end;

function TButton<T>.&End: T;
begin
  Result := FParent;
end;

constructor TButton<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

function TButton<T>.DefaultColor: TAlphaColor;
begin
  Result := FDefaultColor;
end;

function TButton<T>.DefaultColor(Value: TAlphaColor): IButton<T>;
begin
  Result := Self;
  FDefaultColor := Value;
end;

function TButton<T>.Descricao(Value: string): IButton<T>;
begin
  Result := Self;
  FDescricao := Value;
end;

function TButton<T>.Descricao: string;
begin
  Result := FDescricao;
end;

function TButton<T>.DescricaoMenu: string;
begin
  Result := FDescricaoMenu;
end;

function TButton<T>.DescricaoMenu(Value: string): IButton<T>;
begin
  Result := Self;
  FDescricaoMenu := Value;
end;

function TButton<T>.FontSize: Integer;
begin

  if not FFontSize >= 0 then
  begin
    Result := FFontSize;
    Exit;
  end;

  Result := 13;
end;

function TButton<T>.FontSize(Value: Integer): IButton<T>;
begin
  Result := Self;
  FFontSize := Value;
end;

function TButton<T>.Image: string;
begin
  Result := FImage;
end;

function TButton<T>.Image(Value: string): IButton<T>;
begin
  Result := Self;
  FImage := Value;
end;

class function TButton<T>.New(Parent: T): IButton<T>;
begin
  Result := Self.Create(Parent);
end;

end.
