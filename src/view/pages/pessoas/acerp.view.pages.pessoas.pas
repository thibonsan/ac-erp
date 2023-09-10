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
    Layout6: TLayout;
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
      .Nome('company')
      .Enable(False)
      .Titulo('Company (disable)')
      .Alinhamento(TAlignLayout.Left)
      .Largura(300)
      .Margem(lMargem)
      .PlaceHolder('Company')
      .Build);

  Layout5.AddObject(
    TComponentEdit.New(Self)
      .Nome('email')
      .Titulo('Email address')
      .Alinhamento(TAlignLayout.Left)
      .Largura(300)
      .Margem(lMargem)
      .PlaceHolder('EMail')
      .BackgroundColor($FFFFFFFF)
      .Build);

  Layout5.AddObject(
    TComponentEdit.New(Self)
      .Nome('username')
      .Titulo('Username')
      .Alinhamento(TAlignLayout.Left)
      .Largura(300)
      .Margem(lMargem)
      .PlaceHolder('Username')
      .BackgroundColor($FFFFFFFF)
      .Build);

  Layout9.AddObject(
    TComponentEdit.New(Self)
      .Nome('first')
      .Titulo('First Name')
      .Alinhamento(TAlignLayout.Left)
      .Largura(460)
      .Margem(lMargem)
      .PlaceHolder('First Name')
      .Build);

  Layout9.AddObject(
    TComponentEdit.New(Self)
      .Nome('last')
      .Titulo('Last Name')
      .Alinhamento(TAlignLayout.Left)
      .Largura(460)
      .Margem(lMargem)
      .PlaceHolder('Last Name')
      .Build);

  Layout8.AddObject(
    TComponentEdit.New(Self)
      .Nome('address')
      .Titulo('Address')
      .Alinhamento(TAlignLayout.Left)
      .Largura(920)
      .Margem(lMargem)
      .PlaceHolder('Address')
      .Build);

  Layout7.AddObject(
    TComponentEdit.New(Self)
      .Nome('city')
      .Titulo('City')
      .Alinhamento(TAlignLayout.Left)
      .Largura(300)
      .Margem(lMargem)
      .PlaceHolder('City')
      .Build);

  Layout7.AddObject(
    TComponentEdit.New(Self)
      .Nome('country')
      .Titulo('Country')
      .Alinhamento(TAlignLayout.Left)
      .Largura(300)
      .Margem(lMargem)
      .PlaceHolder('Country')
      .Build);

  Layout7.AddObject(
    TComponentEdit.New(Self)
      .Nome('postal')
      .Titulo('Postal Code')
      .Alinhamento(TAlignLayout.Left)
      .Largura(300)
      .Margem(lMargem)
      .PlaceHolder('Postal Code')
      .Build);

  Layout6.AddObject(
    TComponentEdit.New(Self)
      .Nome('about')
      .Titulo('About Me')
      .Alinhamento(TAlignLayout.Left)
      .Largura(920)
      .Margem(lMargem)
      .VertText(TTextAlign.Leading)
      .PlaceHolder('Tell me about you...')
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
