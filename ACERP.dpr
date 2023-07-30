program ACERP;

uses
  System.StartUpCopy,
  FMX.Forms,
  acerp.view.index in 'src\view\acerp.view.index.pas' {PageIndex},
  acerp.view.router in 'src\view\router\acerp.view.router.pas',
  acerp.view.pages.home in 'src\view\pages\home\acerp.view.pages.home.pas' {PageHome},
  acerp.view.pages.layout in 'src\view\pages\layout\acerp.view.pages.layout.pas' {PageLayout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPageIndex, PageIndex);
  Application.Run;
end.
