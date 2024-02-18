unit acerp.view.pages.empresa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, Router4D.Interfaces,
  Router4D.Props, acerp.view.components.interfaces;

type
  TPageEmpresa = class(TForm, iRouter4DComponent)
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
    Layout6: TLayout;
    Layout10: TLayout;
    Layout11: TLayout;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    lytButton: TLayout;
    procedure lytButtonMouseEnter(Sender: TObject);
    procedure lytButtonMouseLeave(Sender: TObject);
    procedure Layout2Resized(Sender: TObject);
  private
    procedure MontarEdit;
    procedure MotaPrimeiroBLoco(Margem: TEditMargins);
    procedure MotaSegundoBLoco(Margem: TEditMargins);
    procedure MotaTerceiroBLoco(Margem: TEditMargins);
    procedure MotaQuartoBLoco(Margem: TEditMargins);
    procedure MotaQuintoBLoco(Margem: TEditMargins);
    procedure MotaSextoBLoco(Margem: TEditMargins);
  public
    function Render: TFMXObject;
    procedure UnRender;
    [Subscribe]
    procedure Props(aValue: TProps);
  end;

var
  PageEmpresa: TPageEmpresa;

implementation

{$R *.fmx}

uses
  acerp.view.components.edits2, acerp.view.components.editarea, acerp.services.enums;

procedure TPageEmpresa.Layout2Resized(Sender: TObject);
begin
  var lWidth : Single;
  lWidth := 0;

  for var I := 0 to Pred(layout5.ChildrenCount) do
     lWidth := lWidth + TLayout(Layout5.Children[I]).Width;

  if not (lWidth = 0) then
    Layout2.Padding.Right := lWidth - 200;
end;

procedure TPageEmpresa.lytButtonMouseEnter(Sender: TObject);
begin
  RoundRect1.Fill.Color := $FF2BA9CD;
end;

procedure TPageEmpresa.lytButtonMouseLeave(Sender: TObject);
begin
  RoundRect1.Fill.Color := $FF51BCDA;
end;

procedure TPageEmpresa.MontarEdit;
begin
  var lMargem: TEditMargins;
  lMargem.Right := 10;
  MotaPrimeiroBLoco(lMargem);
  MotaSegundoBLoco(lMargem);
  MotaTerceiroBLoco(lMargem);
  MotaQuartoBLoco(lMargem);
  MotaQuintoBLoco(lMargem);
  MotaSextoBLoco(lMargem);
end;

procedure TPageEmpresa.MotaPrimeiroBLoco(Margem: TEditMargins);
begin

  Layout5.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('CRT')
      .Alinhamento(TAlignLayout.Left)
      .Largura(100)
      .Margem(Margem)
      .PlaceHolder('CRT')
      .Build);
  Layout5.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('IE')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(Margem)
      .PlaceHolder('IE')
      .Build);
  Layout5.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('IM')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(Margem)
      .PlaceHolder('IM')
      .Build);
  Layout5.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('CNAE')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(Margem)
      .PlaceHolder('CNAE')
      .Build);
  Layout5.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('CNPJ')
      .Alinhamento(TAlignLayout.Left)
      .Largura(190)
      .Margem(Margem)
      .PlaceHolder('CNPJ')
      .Build);
end;

procedure TPageEmpresa.MotaQuartoBLoco(Margem: TEditMargins);
begin

  Layout7.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Bairro')
      .Alinhamento(TAlignLayout.Left)
      .Largura(400)
      .Margem(Margem)
      .PlaceHolder('Bairro')
      .Build);
  Layout7.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Estado')
      .Alinhamento(TAlignLayout.Left)
      .Largura(110)
      .Margem(Margem)
      .PlaceHolder('Estado')
      .Build);
  Layout7.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Cidade')
      .Alinhamento(TAlignLayout.Left)
      .Largura(400)
      .Margem(Margem)
      .PlaceHolder('Cidade')
      .Build);
end;

procedure TPageEmpresa.MotaQuintoBLoco(Margem: TEditMargins);
begin

  Layout10.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Telefone')
      .Alinhamento(TAlignLayout.Left)
      .Largura(300)
      .Margem(Margem)
      .PlaceHolder('Telefone')
      .Build);
  Layout10.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('E-Mail')
      .Alinhamento(TAlignLayout.Left)
      .Largura(620)
      .Margem(Margem)
      .PlaceHolder('E-Mail')
      .Build);
end;

procedure TPageEmpresa.MotaSegundoBLoco(Margem: TEditMargins);
begin

  Layout9.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Razão Social')
      .Alinhamento(TAlignLayout.Left)
      .Largura(460)
      .Margem(Margem)
      .PlaceHolder('Razão Social')
      .Build);
  Layout9.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Nome fantasia')
      .Alinhamento(TAlignLayout.Left)
      .Largura(460)
      .Margem(Margem)
      .PlaceHolder('Nome fantasia')
      .Build);
end;

procedure TPageEmpresa.MotaSextoBLoco(Margem: TEditMargins);
begin

  Layout6.AddObject(
  TComponentEditArea.New(Self)
      .Titulo('Observação')
      .Alinhamento(TAlignLayout.Left)
      .Largura(930)
      .Margem(Margem)
      .PlaceHolder('Observação')
      .Build);
end;

procedure TPageEmpresa.MotaTerceiroBLoco(Margem: TEditMargins);
begin

  Layout8.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Cep')
      .Alinhamento(TAlignLayout.Left)
      .Largura(100)
      .Margem(Margem)
      .PlaceHolder('Cep')
      .Build);
  Layout8.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Logradouro')
      .Alinhamento(TAlignLayout.Left)
      .Largura(500)
      .Margem(Margem)
      .PlaceHolder('Logradouro')
      .Build);
  Layout8.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Numero')
      .Alinhamento(TAlignLayout.Left)
      .Largura(100)
      .Margem(Margem)
      .PlaceHolder('Numero')
      .Build);
  Layout8.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Complemento')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(Margem)
      .PlaceHolder('Complemento')
      .Build);
end;

procedure TPageEmpresa.Props(aValue: TProps);
begin
  var lTipo: TTipoAcao;

  case lTipo.ToEnum(aValue.Key) of
    EDITAR: Label1.Text := 'Editar Empresa';
    NOVO: Label1.Text := 'Cadastrar Empresa';
  end;
end;

function TPageEmpresa.Render: TFMXObject;
begin
  MontarEdit;
  Result := lytContainer;
end;

procedure TPageEmpresa.UnRender;
begin

end;

end.
