unit acerp.resources.impl.configuracao;

interface

uses
  System.SysUtils,
  LocalCache4D,
  acerp.resources.interfaces;

type

  TConfiguracao = class(TInterfacedObject, IConfiguracao)
  private
    constructor Create;
    destructor Destroy; override;
    procedure CreateStructure;
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

constructor TConfiguracao.Create;
begin

  if not FileExists(ExtractFilePath(ParamStr(0) + 'conf.lc4')) then
  begin
    CreateStructure;
    Exit;
  end;

  LocalCache.LoadDatabase(ExtractFilePath(ParamStr(0) + 'conf.lc4'));
end;

procedure TConfiguracao.CreateStructure;
begin
  LocalCache
    .Instance('Config')
    .SetItem('DriverId', 'PG')
    .SetItem('DataBase', 'postgres')
    .SetItem('UserName', 'postgres')
    .SetItem('Password', 'postgres')
    .SetItem('Port', '5432')
    .SetItem('Server', 'localhost')
    .SetItem('Schema', '')
    .SetItem('Locking', '')
    .SaveToStorage(ExtractFilePath(ParamStr(0) + 'conf.lc4'));
end;

function TConfiguracao.DataBase: string;
begin
  Result := LocalCache.GetItem('DataBase');
end;

destructor TConfiguracao.Destroy;
begin
  LocalCache.SaveToStorage(ExtractFilePath(ParamStr(0) + 'conf.lc4'));
  inherited;
end;

function TConfiguracao.DataBase(Value: string): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('DataBase', Value);
end;

function TConfiguracao.DriverID: string;
begin
  Result := LocalCache.GetItem('DriverId');
end;

function TConfiguracao.DriverID(Value: string): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('DriverId', Value);
end;

function TConfiguracao.Locking: string;
begin
  Result := LocalCache.GetItem('Locking');
end;

function TConfiguracao.Locking(Value: string): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Locking', Value);
end;

class function TConfiguracao.New: IConfiguracao;
begin
  Result := Self.Create;
end;

function TConfiguracao.Password: string;
begin
  Result := LocalCache.GetItem('Password');
end;

function TConfiguracao.Password(Value: string): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Password', Value);
end;

function TConfiguracao.Port(Value: string): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Port', Value);
end;

function TConfiguracao.Port: string;
begin
  Result := LocalCache.GetItem('Port');
end;

function TConfiguracao.Schema: string;
begin
  Result := LocalCache.GetItem('Schema');
end;

function TConfiguracao.Schema(Value: string): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Schema', Value);
end;

function TConfiguracao.Server(Value: string): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Server', Value);
end;

function TConfiguracao.Server: string;
begin
  Result := LocalCache.GetItem('Server');
end;

function TConfiguracao.UserName(Value: string): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('UserName', Value);
end;

function TConfiguracao.UserName: string;
begin
  Result := LocalCache.GetItem('UserName');
end;

end.
