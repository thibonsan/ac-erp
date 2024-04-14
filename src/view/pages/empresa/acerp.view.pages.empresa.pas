unit acerp.view.pages.empresa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, Router4D.Interfaces,
  Router4D.Props, acerp.view.components.interfaces, acerp.services.enums;

type
  TEmpresa = record
    ID: string;
    CRT: string;
    RAZAOSOCIAL: string;
    NOMEFANTASIA: string;
    CNPJ: string;
    IE: string;
    IM: string;
    CNAE: string;
    FONE: string;
    ENDERECO: string;
    NUMERO: string;
    COMPLEMENTO: string;
    BAIRRO: string;
    CIDADE: string;
    CEP: string;
    ESTADO: string;
    EMAIL: string;
    OBSERVACAO: string;
    LOGRADOURO: string;
  end;

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
    procedure lytButtonClick(Sender: TObject);
  private
    FTipo: TTipoAcao;
    FEmpresa: TEmpresa;

    procedure MontarEdit;
    procedure MontaPrimeiroBLoco(Margem: TEditMargins);
    procedure MontaSegundoBLoco(Margem: TEditMargins);
    procedure MontaTerceiroBLoco(Margem: TEditMargins);
    procedure MontaQuartoBLoco(Margem: TEditMargins);
    procedure MontaQuintoBLoco(Margem: TEditMargins);
    procedure MontaSextoBLoco(Margem: TEditMargins);
    procedure Cadastrar;
    procedure Editar;
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
  acerp.view.components.edits2, acerp.view.components.editarea,
  acerp.resources.impl.conexaofiredac;

procedure TPageEmpresa.Cadastrar;
begin
  TConexaoFiredac.New
    .Query('INSERT INTO empresa (crt, razao_social, nome_fantasia, cnpj, ie, im, cnae, fone, endereco, numero, complemento, bairro, cidade, cep, estado, email, observacao, logradouro) ' +
           'VALUES(:crt, :razao_social, :nome_fantasia, :cnpj, :ie, :im, :cnae, :fone, :endereco, :numero, :complemento, :bairro, :cidade, :cep, :estado, :email, :observacao, :logradouro)',
           [StrToInt(FEmpresa.CRT),
            FEmpresa.RAZAOSOCIAL,
            FEmpresa.NOMEFANTASIA,
            FEmpresa.CNPJ,
            FEmpresa.IE,
            FEmpresa.IM,
            FEmpresa.CNAE,
            FEmpresa.FONE,
            FEmpresa.ENDERECO,
            FEmpresa.NUMERO,
            FEmpresa.COMPLEMENTO,
            FEmpresa.BAIRRO,
            StrToInt(FEmpresa.CIDADE),
            StrToInt(FEmpresa.CEP),
            FEmpresa.ESTADO,
            FEmpresa.EMAIL,
            FEmpresa.OBSERVACAO,
            FEmpresa.LOGRADOURO]);
end;

procedure TPageEmpresa.Editar;
begin
  TConexaoFiredac.New
    .Query('UPDATE empresa SET crt=:crt, razao_social=:razao_social, nome_fantasia=:nome_fantasia, ' +
      'cnpj=:cnpj, ie=:ie, im=:im, cnae=:cnae, fone=:fone, endereco=:endereco, numero=:numero, ' +
      'complemento=:complemento, bairro=:bairro, cidade=:cidade, cep=:cep, estado=:estado, ' +
      'email=:email, observacao=:observacao, logradouro=:logradouro WHERE id=:id',
       [StrToInt(FEmpresa.CRT),
        FEmpresa.RAZAOSOCIAL,
        FEmpresa.NOMEFANTASIA,
        FEmpresa.CNPJ,
        FEmpresa.IE,
        FEmpresa.IM,
        FEmpresa.CNAE,
        FEmpresa.FONE,
        FEmpresa.ENDERECO,
        FEmpresa.NUMERO,
        FEmpresa.COMPLEMENTO,
        FEmpresa.BAIRRO,
        StrToInt(FEmpresa.CIDADE),
        StrToInt(FEmpresa.CEP),
        FEmpresa.ESTADO,
        FEmpresa.EMAIL,
        FEmpresa.OBSERVACAO,
        FEmpresa.LOGRADOURO,
        StrToInt(FEmpresa.ID)]);
end;

procedure TPageEmpresa.Layout2Resized(Sender: TObject);
begin
  var lWidth : Single;
  lWidth := 0;

  for var I := 0 to Pred(layout5.ChildrenCount) do
     lWidth := lWidth + TLayout(Layout5.Children[I]).Width;

  if not (lWidth = 0) then
    Layout2.Padding.Right := lWidth - 200;
end;

procedure TPageEmpresa.lytButtonClick(Sender: TObject);
begin

  case FTipo of
    TTipoAcao.EDITAR: Editar;
    TTipoAcao.NOVO: Cadastrar;
  end;
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
  MontaPrimeiroBLoco(lMargem);
  MontaSegundoBLoco(lMargem);
  MontaTerceiroBLoco(lMargem);
  MontaQuartoBLoco(lMargem);
  MontaQuintoBLoco(lMargem);
  MontaSextoBLoco(lMargem);
end;

procedure TPageEmpresa.MontaPrimeiroBLoco(Margem: TEditMargins);
begin

  Layout5.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('CRT')
      .Alinhamento(TAlignLayout.Left)
      .Largura(100)
      .Margem(Margem)
      .PlaceHolder('CRT')
      .FieldValue(FEmpresa.CRT)
      .Build);
  Layout5.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('IE')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(Margem)
      .PlaceHolder('IE')
      .FieldValue(FEmpresa.IE)
      .Build);
  Layout5.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('IM')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(Margem)
      .PlaceHolder('IM')
      .FieldValue(FEmpresa.IM)
      .Build);
  Layout5.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('CNAE')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(Margem)
      .PlaceHolder('CNAE')
      .FieldValue(FEmpresa.CNAE)
      .Build);
  Layout5.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('CNPJ')
      .Alinhamento(TAlignLayout.Left)
      .Largura(190)
      .Margem(Margem)
      .PlaceHolder('CNPJ')
      .FieldValue(FEmpresa.CNPJ)
      .Build);
end;

procedure TPageEmpresa.MontaQuartoBLoco(Margem: TEditMargins);
begin

  Layout7.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Bairro')
      .Alinhamento(TAlignLayout.Left)
      .Largura(400)
      .Margem(Margem)
      .PlaceHolder('Bairro')
      .FieldValue(FEmpresa.BAIRRO)
      .Build);
  Layout7.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Estado')
      .Alinhamento(TAlignLayout.Left)
      .Largura(110)
      .Margem(Margem)
      .PlaceHolder('Estado')
      .FieldValue(FEmpresa.ESTADO)
      .Build);
  Layout7.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Cidade')
      .Alinhamento(TAlignLayout.Left)
      .Largura(400)
      .Margem(Margem)
      .PlaceHolder('Cidade')
      .FieldValue(FEmpresa.CIDADE)
      .Build);
end;

procedure TPageEmpresa.MontaQuintoBLoco(Margem: TEditMargins);
begin

  Layout10.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Telefone')
      .Alinhamento(TAlignLayout.Left)
      .Largura(300)
      .Margem(Margem)
      .PlaceHolder('Telefone')
      .FieldValue(FEmpresa.FONE)
      .Build);
  Layout10.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('E-Mail')
      .Alinhamento(TAlignLayout.Left)
      .Largura(620)
      .Margem(Margem)
      .PlaceHolder('E-Mail')
      .FieldValue(FEmpresa.EMAIL)
      .Build);
end;

procedure TPageEmpresa.MontaSegundoBLoco(Margem: TEditMargins);
begin

  Layout9.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Razão Social')
      .Alinhamento(TAlignLayout.Left)
      .Largura(460)
      .Margem(Margem)
      .PlaceHolder('Razão Social')
      .FieldValue(FEmpresa.RAZAOSOCIAL)
      .Build);
  Layout9.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Nome fantasia')
      .Alinhamento(TAlignLayout.Left)
      .Largura(460)
      .Margem(Margem)
      .PlaceHolder('Nome fantasia')
      .FieldValue(FEmpresa.NOMEFANTASIA)
      .Build);
end;

procedure TPageEmpresa.MontaSextoBLoco(Margem: TEditMargins);
begin

  Layout6.AddObject(
  TComponentEditArea.New(Self)
      .Titulo('Observação')
      .Alinhamento(TAlignLayout.Left)
      .Largura(930)
      .Margem(Margem)
      .PlaceHolder('Observação')
      .FieldValue(FEmpresa.OBSERVACAO)
      .Build);
end;

procedure TPageEmpresa.MontaTerceiroBLoco(Margem: TEditMargins);
begin

  Layout8.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Cep')
      .Alinhamento(TAlignLayout.Left)
      .Largura(100)
      .Margem(Margem)
      .PlaceHolder('Cep')
      .FieldValue(FEmpresa.CEP)
      .Build);
  Layout8.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Logradouro')
      .Alinhamento(TAlignLayout.Left)
      .Largura(500)
      .Margem(Margem)
      .PlaceHolder('Logradouro')
      .FieldValue(FEmpresa.LOGRADOURO)
      .Build);
  Layout8.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Numero')
      .Alinhamento(TAlignLayout.Left)
      .Largura(100)
      .Margem(Margem)
      .PlaceHolder('Numero')
      .FieldValue(FEmpresa.NUMERO)
      .Build);
  Layout8.AddObject(
  TComponentEdit2.New(Self)
      .Titulo('Complemento')
      .Alinhamento(TAlignLayout.Left)
      .Largura(200)
      .Margem(Margem)
      .PlaceHolder('Complemento')
      .FieldValue(FEmpresa.COMPLEMENTO)
      .Build);
end;

procedure TPageEmpresa.Props(aValue: TProps);
begin
  var lTipo: TTipoAcao;
  FTipo := lTipo.ToEnum(aValue.Key);

  case FTipo of
    TTipoAcao.EDITAR: Label1.Text := 'Editar Empresa';
    TTipoAcao.NOVO: Label1.Text := 'Cadastrar Empresa';
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
