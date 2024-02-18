program ACERP;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  acerp.view.index in 'src\view\acerp.view.index.pas' {PageIndex},
  acerp.view.router in 'src\view\router\acerp.view.router.pas',
  acerp.view.pages.home in 'src\view\pages\home\acerp.view.pages.home.pas' {PageHome},
  acerp.view.pages.layout in 'src\view\pages\layout\acerp.view.pages.layout.pas' {PageLayout},
  acerp.view.components.sidebar in 'src\view\components\sidebar\acerp.view.components.sidebar.pas' {ComponentSidebar: TFrame},
  acerp.services.utils in 'src\services\acerp.services.utils.pas',
  acerp.view.components.cards in 'src\view\components\cards\acerp.view.components.cards.pas' {ComponentCard: TFrame},
  acerp.view.components.cardsgraficos in 'src\view\components\cardsgraficos\acerp.view.components.cardsgraficos.pas' {ComponentCardGraficos: TFrame},
  acerp.services.charts in 'src\services\acerp.services.charts.pas',
  acerp.services.chats.interfaces in 'src\services\acerp.services.chats.interfaces.pas',
  acerp.services.enums in 'src\services\acerp.services.enums.pas',
  acerp.view.pages.pessoas in 'src\view\pages\pessoas\acerp.view.pages.pessoas.pas' {PagePessoas},
  acerp.view.components.edits in 'src\view\components\edits\acerp.view.components.edits.pas' {ComponentEdit: TFrame},
  acerp.view.components.interfaces in 'src\view\components\acerp.view.components.interfaces.pas',
  acerp.view.pages.login in 'src\view\pages\login\acerp.view.pages.login.pas' {PageLogin},
  acerp.view.components.editImage in 'src\view\components\editImagem\acerp.view.components.editImage.pas' {ComponentEditImage: TFrame},
  acerp.view.pages.tables in 'src\view\pages\tables\acerp.view.pages.tables.pas' {PageTables},
  acerp.view.components.extendedtables in 'src\view\components\tables\acerp.view.components.extendedtables.pas' {ComponentExtendedTable: TFrame},
  acerp.view.components.listatables in 'src\view\components\ListaTbles\acerp.view.components.listatables.pas' {ComponentListaTable: TFrame},
  acerp.view.styles in 'src\view\styles\acerp.view.styles.pas',
  acerp.view.styles.states in 'src\view\styles\acerp.view.styles.states.pas',
  acerp.view.pages.listapessoas in 'src\view\pages\pessoas\acerp.view.pages.listapessoas.pas' {PageListaPessoas},
  acerp.view.pages.menugenerico in 'src\view\pages\menugenerico\acerp.view.pages.menugenerico.pas' {PageMenuGenerico},
  acerp.view.components.attributes.interfaces in 'src\view\components\attributes\acerp.view.components.attributes.interfaces.pas',
  acerp.view.components.attributes.button in 'src\view\components\attributes\acerp.view.components.attributes.button.pas',
  acerp.view.components.button in 'src\view\components\buttons\buttonmenu\acerp.view.components.button.pas' {ComponentButton: TFrame},
  acerp.view.components.buttonsubmenu in 'src\view\components\buttons\buttonsubmenu\acerp.view.components.buttonsubmenu.pas' {ComponentButtonSubMenu},
  acerp.view.components.buttons.styles in 'src\view\components\buttons\acerp.view.components.buttons.styles.pas',
  acerp.resources.interfaces in 'src\resources\acerp.resources.interfaces.pas',
  acerp.resources.impl.conexaofiredac in 'src\resources\impl\acerp.resources.impl.conexaofiredac.pas',
  acerp.resources.impl.configuracao in 'src\resources\impl\acerp.resources.impl.configuracao.pas',
  acerp.resources.impl.resource in 'src\resources\impl\acerp.resources.impl.resource.pas',
  acerp.view.components.edits2 in 'src\view\components\edits\acerp.view.components.edits2.pas' {ComponentEdit2},
  acerp.view.components.editarea in 'src\view\components\edits\acerp.view.components.editarea.pas' {ComponentEditArea},
  acerp.view.pages.empresa in 'src\view\pages\empresa\acerp.view.pages.empresa.pas' {PageEmpresa};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPageIndex, PageIndex);
  Application.Run;
end.
