unit acerp.view.components.interfaces;

interface

uses
  System.SysUtils, System.UITypes, FMX.Types;

type

  TEditMargins = record
    Left: Integer;
    Top: Integer;
    Right: Integer;
    Bottom: Integer;

    class operator Initialize(out Dest: TEditMargins);
  end;

  iEdits = interface
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

{ TEditMargins }

class operator TEditMargins.Initialize(out Dest: TEditMargins);
begin
  Dest.Left := 0;
  Dest.Top := 0;
  Dest.Right := 0;
  Dest.Bottom := 0;
end;

end.
