unit acerp.view.pages.menugenerico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
  TPageMenuGenerico = class(TForm)
    Layout1: TLayout;
  private
    { Private declarations }
  public
    function Build: TFMXObject;
    function AddButton(Value: TFMXObject): TPageMenuGenerico;
  end;

implementation

{$R *.fmx}

{ TPageMenuGenerico }

function TPageMenuGenerico.AddButton(Value: TFMXObject): TPageMenuGenerico;
begin
  Result := Self;
  Layout1.AddObject(Value);
end;

function TPageMenuGenerico.Build: TFMXObject;
begin
  Result := Layout1;
end;

end.
