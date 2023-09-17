unit acerp.view.pages.login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, Router4D.Interfaces,
  FMX.Effects;

type
  TPageLogin = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Label1: TLabel;
    Layout7: TLayout;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    Layout8: TLayout;
    Label3: TLabel;
    ImageBloquear: TImage;
    Layout9: TLayout;
    Layout10: TLayout;
    ImageUser: TImage;
    Layout11: TLayout;
    Label4: TLabel;
    Layout12: TLayout;
    Layout13: TLayout;
    ImageRegistrado: TImage;
    Layout14: TLayout;
    Label5: TLabel;
    Layout15: TLayout;
    Layout16: TLayout;
    Layout17: TLayout;
    Layout18: TLayout;
    procedure Layout18Click(Sender: TObject);
  private
    procedure MontarEdits;
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  PageLogin: TPageLogin;

implementation

{$R *.fmx}

uses
  acerp.services.utils, acerp.view.components.editImage,
  acerp.view.components.interfaces, Router4D;

{ TPageLogin }

procedure TPageLogin.Layout18Click(Sender: TObject);
begin
  TRouter4D.Link.IndexLink('Layout');
end;

procedure TPageLogin.MontarEdits;
begin
  var lMargem: TEditMargins;
  lMargem.Bottom := 5;
  lMargem.Top := 5;

  Layout8.AddObject(
    TComponentEditImage.New(Self)
      .Nome('segredo')
      .BackgroundColor($FFFFFFFF)
      .FontColor($FF4B2D8B)
      .Alinhamento(TAlignLayout.Top)
      .Margem(lMargem)
      .Image('segredo')
      .ImageColor($FFBEBCBA)
      .PlaceHolder('Password')
      .Password(True)
      .Build);

  Layout8.AddObject(
    TComponentEditImage.New(Self)
      .Nome('usuario')
      .BackgroundColor($FFFFFFFF)
      .FontColor($FF4B2D8B)
      .Alinhamento(TAlignLayout.Top)
      .Margem(lMargem)
      .Image('user')
      .ImageColor($FFBEBCBA)
      .PlaceHolder('Usuário')
      .Build);
end;

function TPageLogin.Render: TFMXObject;
begin
  TUtils.ResourceImage('user', ImageUser);
  TUtils.ImageColor(ImageUser, $FFFFFFFF) ;
  TUtils.ResourceImage('registrado', ImageRegistrado);
  TUtils.ImageColor(ImageRegistrado, $FFFFFFFF) ;
  TUtils.ResourceImage('segredo', ImageBloquear);
  TUtils.ImageColor(ImageBloquear, $FFFFFFFF) ;
  MontarEdits;
  Result := lytContainer;
end;

procedure TPageLogin.UnRender;
begin

end;

end.
