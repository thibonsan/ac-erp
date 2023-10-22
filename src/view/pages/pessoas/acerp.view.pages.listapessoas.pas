unit acerp.view.pages.listapessoas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Generics.Collections, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, FMX.Layouts, Router4D.Interfaces;

type
  TPageListaPessoas = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
  private
    { Private declarations }
  public
    function Render: TFmxObject;
    procedure UnRender;
  end;

var
  PageListaPessoas: TPageListaPessoas;

implementation

{$R *.fmx}

uses
  Router4D,
  acerp.view.components.extendedtables;

{ TForm1 }

function TPageListaPessoas.Render: TFmxObject;
begin
  var lLista := TList<TTransfer>.Create;

  for var I := 0 to 10 do
  begin
    var lTransfer: TTransfer;
    lTransfer.Nome := 'Frame' + I.ToString;
    lTransfer.Item := I.ToString;
    lTransfer.Descricao := 'Colaborador ' + I.ToString;
    lTransfer.Cargo := 'Cargo ' + I.ToString;
    lTransfer.Salario := Round(I);
    lLista.Add(lTransfer);
  end;

  lytContainer.AddObject(
    TComponentExtendedTable.New(Self)
      .Titulo('Lista de Pessoas')
      .ColorTitulo($FFB6CFCE)
      .Click(procedure (Sender: TObject)
      begin
        TRouter4D.Link.&To('Pessoas');
      end)
    .Build(lLista));

  Result := lytContainer;
end;

procedure TPageListaPessoas.UnRender;
begin

end;

end.
