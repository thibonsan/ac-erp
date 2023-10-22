unit acerp.view.pages.pessoas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  Router4D.Interfaces, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Effects;

type
  TPagePessoas = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Label1: TLabel;
    Layout5: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    ShadowEffect1: TShadowEffect;
  private
    procedure CriaEdits;
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

implementation

{$R *.fmx}

uses acerp.view.components.edits, acerp.view.components.interfaces;

{ TForm1 }

procedure TPagePessoas.CriaEdits;
begin
  var lMargem: TEditMargins;
  lMargem.Right := 10;

  Layout5.AddObject(
    TComponentEdit.New(Self)
      .Nome('ativo')
      .Titulo('Ativo')
      .Alinhamento(TAlignLayout.Left)
      .Largura(100)
      .Margem(lMargem)
      .PlaceHolder('Ativo')
      .Build);

  Layout5.AddObject(
    TComponentEdit.New(Self)
      .Nome('nome')
      .Titulo('Nome')
      .Alinhamento(TAlignLayout.Left)
      .Largura(600)
      .Margem(lMargem)
      .PlaceHolder('Nome')
      .Build);

  Layout5.AddObject(
    TComponentEdit.New(Self)
      .Nome('cpfcnpj')
      .Titulo('CPF')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(lMargem)
      .PlaceHolder('CPF')
      .BackgroundColor($FFFFFFFF)
      .Build);

  Layout9.AddObject(
    TComponentEdit.New(Self)
      .Nome('telefone')
      .Titulo('Telefone')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(lMargem)
      .PlaceHolder('Telefone')
      .Build);

  Layout9.AddObject(
    TComponentEdit.New(Self)
      .Nome('eMail')
      .Titulo('E-Mail')
      .Alinhamento(TAlignLayout.Left)
      .Largura(710)
      .Margem(lMargem)
      .PlaceHolder('E-Mail')
      .Build);

  Layout8.AddObject(
    TComponentEdit.New(Self)
      .Nome('endereco')
      .Titulo('Endereço')
      .Alinhamento(TAlignLayout.Left)
      .Largura(600)
      .Margem(lMargem)
      .PlaceHolder('Endereço')
      .Build);

  Layout8.AddObject(
    TComponentEdit.New(Self)
      .Nome('complemento')
      .Titulo('Complemento')
      .Alinhamento(TAlignLayout.Left)
      .Largura(180)
      .Margem(lMargem)
      .PlaceHolder('Complemento')
      .Build);

  Layout8.AddObject(
    TComponentEdit.New(Self)
      .Nome('numero')
      .Titulo('Número')
      .Alinhamento(TAlignLayout.Left)
      .Largura(120)
      .Margem(lMargem)
      .PlaceHolder('Número')
      .Build);

  Layout7.AddObject(
    TComponentEdit.New(Self)
      .Nome('cep')
      .Titulo('Cep')
      .Alinhamento(TAlignLayout.Left)
      .Largura(300)
      .Margem(lMargem)
      .PlaceHolder('Cep')
      .Build);

  Layout7.AddObject(
    TComponentEdit.New(Self)
      .Nome('estado')
      .Titulo('Estado')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(lMargem)
      .PlaceHolder('Estado')
      .Build);

  Layout7.AddObject(
    TComponentEdit.New(Self)
      .Nome('cidade')
      .Titulo('Cidade')
      .Alinhamento(TAlignLayout.Left)
      .Largura(400)
      .Margem(lMargem)
      .PlaceHolder('Cidade')
      .Build);
end;

function TPagePessoas.Render: TFMXObject;
begin
  CriaEdits;
  Result := lytContainer;
end;

procedure TPagePessoas.UnRender;
begin

end;

end.
