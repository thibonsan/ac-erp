unit acerp.view.router;

interface

type

  TRouter = class
  private
    constructor Create;
    destructor Destroy; override;
  public
    class function New: TRouter;
  end;

var
  Router: TRouter;

implementation

uses
  Router4D, acerp.view.pages.home, acerp.view.pages.layout, acerp.view.pages.pessoas,
  acerp.view.pages.login, acerp.view.pages.tables, acerp.view.pages.empresa,
  acerp.view.pages.listapessoas;

{ TRouter }

constructor TRouter.Create;
begin
  TRouter4D
    .Switch
      .Router('Layout', TPageLayout)
      .Router('Home', TPageHome)
      .Router('ListaPessoas', TPageListaPessoas)
      .Router('Pessoas', TPagePessoas)
      .Router('Login', TPageLogin)
      .Router('Tables', TPageTables)
      .Router('Empresa', TPageEmpresa);
end;

destructor TRouter.Destroy;
begin

  inherited;
end;

class function TRouter.New: TRouter;
begin
  Result := Self.Create;
end;

initialization
  Router := TRouter.New;

finalization
  Router.Free;

end.
