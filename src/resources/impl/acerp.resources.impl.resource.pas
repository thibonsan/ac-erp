unit acerp.resources.impl.resource;

interface

uses
  acerp.resources.interfaces;

type

  TResource = class(TInterfacedObject, IResource)
  private
    FConexao: IConexao;
  public
    class function New: IResource;
    function Conexao: IConexao;
  end;

implementation

uses
  acerp.resources.impl.conexaofiredac,
  acerp.resources.impl.configuracao;

{ TResource }

function TResource.Conexao: IConexao;
begin

  if not Assigned(FConexao) then
    FConexao := TConexaoFiredac.New;

  Result := FConexao;
end;

class function TResource.New: IResource;
begin
  Result := Self.Create;
end;

end.
