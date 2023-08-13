unit acerp.services.utils;

interface

uses
  system.UITypes,
  FMX.Objects,
  FMX.Types;

type
  TUtils = class
  private
  public
    class procedure ResourceImage(Resource: string; Image: TImage); overload;
    class procedure ResourceImage(Resource: string; Image: TFMXObject); overload;
    class function UpperCamelCase(Value: string): string;
    class procedure ImageColor(Image: TImage; Color: TAlphaColor);
  end;

implementation

uses
  System.Classes,
  System.Types,
  System.SysUtils;

{ TUtils }

class procedure TUtils.ResourceImage(Resource: string; Image: TImage);
begin
  var lResource := TResourceStream.Create(HInstance, Resource, RT_RCDATA);

  try
    Image.Bitmap.LoadFromStream(lResource);
  finally
    lResource.Free;
  end;
end;

class procedure TUtils.ImageColor(Image: TImage; Color: TAlphaColor);
begin
  Image.Bitmap.ReplaceOpaqueColor(Color);
end;

class procedure TUtils.ResourceImage(Resource: string; Image: TFMXObject);
begin
  var lResource := TResourceStream.Create(HInstance, Resource, RT_RCDATA);

  try
    TShape(Image).Fill.Bitmap.Bitmap.LoadFromStream(lResource);
  finally
    lResource.Free;
  end;
end;

class function TUtils.UpperCamelCase(Value: string): string;
begin
  Result := UpperCamelCase(Copy(Value, 1, 1)) +
    LowerCase(Copy(Value, 2, Length(Value)))
end;

end.
