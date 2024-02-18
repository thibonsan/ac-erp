unit acerp.resources.impl.conexaofiredac;

interface

uses
  Data.DB,
  Firedac.Comp.Client,
  acerp.resources.interfaces;

type

  TConexaoFiredac = class(TInterfacedObject, IConexao)
  private
    FConn: TFDConnection;
    FConf: IConfiguracao;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: IConexao;
    function Connect: TcustomConnection;
  end;

implementation

uses
  System.SysUtils,
  acerp.resources.impl.configuracao;

{ TConexaoFiredac }

function TConexaoFiredac.Connect: TcustomConnection;
begin
  Result := FConn;
end;

constructor TConexaoFiredac.Create;
begin
  FConf := TConfiguracao.New;
  FConn := TFDConnection.Create(nil);

  try
    FConn.Params.DriverID := FConf.DriverID;
    FConn.Params.Database := FConf.DataBase;
    FConn.Params.UserName := FConf.UserName;
    FConn.Params.Password := FConf.Password;
    FConn.Params.Add('Server=' + FConf.Server);
    FConn.Params.Add('Port=' + FConf.Port);
    FConn.Params.Add('LockingMode=' + FConf.Locking);
    FConn.Connected := True;
  finally
    raise Exception.Create('Erro ao conectar no banco de dados');
  end;
end;

destructor TConexaoFiredac.Destroy;
begin
  FConn.Free;
  inherited;
end;

class function TConexaoFiredac.New: IConexao;
begin
  Result := Self.Create;
end;

end.
