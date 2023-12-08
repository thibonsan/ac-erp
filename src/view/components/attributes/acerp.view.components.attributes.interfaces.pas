unit acerp.view.components.attributes.interfaces;

interface

uses
  System.UITypes, System.SysUtils, FMX.Types;

type
  IButton<T> = interface
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

end.
