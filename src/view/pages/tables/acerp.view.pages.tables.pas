unit acerp.view.pages.tables;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  Router4D.Interfaces;

type
  TPageTables = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
  private
    { Private declarations }
  public
    function Render: TFMXobject;
    procedure UnRender;
  end;

implementation

{$R *.fmx}

uses acerp.view.components.extendedtables;

{ TPageTables }

function TPageTables.Render: TFMXobject;
begin

  lytContainer.AddObject(
    TComponentExtendedTable.New(Self)
      .ColorTitulo($FFB6CFCE)
      .Build);

  Result := lytContainer;
end;

procedure TPageTables.UnRender;
begin

end;

end.
