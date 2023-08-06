unit acerp.services.utils;

interface

uses
  FMX.Objects;

type
  TUtils = class
  private
  public
    class procedure ResourceImage(Resource: string; Image: TImage);
  end;

implementation

uses
  System.Classes,
  System.Types;

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

end.
