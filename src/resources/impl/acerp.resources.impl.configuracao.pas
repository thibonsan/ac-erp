unit acerp.resources.impl.configuracao;

interface

uses
  acerp.resources.interfaces;

type

  TConfiguracao = class(TInterfacedObject, IConfiguracao)
  private
    FDriverID: string;
    FDataBase: string;
    FUserName: string;
    FPassword: string;
    FPort: string;
    FServer: string;
    FSchema: string;
    FLocking: string;
  public
    class function New: IConfiguracao;
    function DriverID(Value: string): IConfiguracao; overload;
    function DriverID: string; overload;
    function DataBase(Value: string): IConfiguracao; overload;
    function DataBase: string; overload;
    function UserName(Value: string): IConfiguracao; overload;
    function UserName: string; overload;
    function Password(Value: string): IConfiguracao; overload;
    function Password: string; overload;
    function Port(Value: string): IConfiguracao; overload;
    function Port: string; overload;
    function Server(Value: string): IConfiguracao; overload;
    function Server: string; overload;
    function Schema(Value: string): IConfiguracao; overload;
    function Schema: string; overload;
    function Locking(Value: string): IConfiguracao; overload;
    function Locking: string; overload;
  end;

implementation

{ TConfiguracao }

function TConfiguracao.DataBase: string;
begin
  Result := FDataBase;
end;

function TConfiguracao.DataBase(Value: string): IConfiguracao;
begin
  Result := Self;
  FDataBase := Value;
end;

function TConfiguracao.DriverID: string;
begin
  Result := FDriverID;
end;

function TConfiguracao.DriverID(Value: string): IConfiguracao;
begin
  Result := Self;
  FDriverID := Value;
end;

function TConfiguracao.Locking: string;
begin
  Result := FLocking;
end;

function TConfiguracao.Locking(Value: string): IConfiguracao;
begin
  Result := Self;
  FLocking := Value;
end;

class function TConfiguracao.New: IConfiguracao;
begin
  Result := Self.Create;
end;

function TConfiguracao.Password: string;
begin
  Result := FPassword;
end;

function TConfiguracao.Password(Value: string): IConfiguracao;
begin
  Result := Self;
  FPassword := Value;
end;

function TConfiguracao.Port(Value: string): IConfiguracao;
begin
  Result := Self;
  FPort := Value;
end;

function TConfiguracao.Port: string;
begin
  Result := FPort;
end;

function TConfiguracao.Schema: string;
begin
  Result := FSchema;
end;

function TConfiguracao.Schema(Value: string): IConfiguracao;
begin
  Result := Self;
  FSchema := Value;
end;

function TConfiguracao.Server(Value: string): IConfiguracao;
begin
  Result := Self;
  FServer := Value;
end;

function TConfiguracao.Server: string;
begin
  Result := FServer;
end;

function TConfiguracao.UserName(Value: string): IConfiguracao;
begin
  Result := Self;
  FUserName := Value;
end;

function TConfiguracao.UserName: string;
begin
  Result := FUserName;
end;

end.
