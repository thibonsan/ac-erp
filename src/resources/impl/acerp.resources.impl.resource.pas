unit acerp.resources.impl.resource;

interface

uses
  acerp.resources.interfaces;

type

  TResource = class(TInterfacedObject, IResource)
  private
    FConexao: IConexao;
    FConfiguracao: IConfiguracao;

    constructor Create;
  public
    class function New: IResource;
    function Conexao: IConexao;
    function Configuracao: IConfiguracao;
  end;

implementation

uses
  acerp.resources.impl.conexaofiredac,
  acerp.resources.impl.configuracao;

{ TResource }

function TResource.Conexao: IConexao;
begin

  if not Assigned(FConexao) then
    FConexao := TConexaoFiredac.New(FConfiguracao);

  Result := FConexao;
end;

function TResource.Configuracao: IConfiguracao;
begin
  Result := FConfiguracao;
end;

constructor TResource.Create;
begin
  FConfiguracao := TConfiguracao.New;
end;

class function TResource.New: IResource;
begin

end;

end.
