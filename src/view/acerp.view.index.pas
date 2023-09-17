unit acerp.view.index;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
  TPageIndex = class(TForm)
    lytContainer: TLayout;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageIndex: TPageIndex;

implementation

uses
  Router4D,
  acerp.view.pages.login;

{$R *.fmx}

procedure TPageIndex.FormCreate(Sender: TObject);
begin
  TRouter4D.Render<TPageLogin>.SetElement(lytContainer, lytContainer);
end;

end.
