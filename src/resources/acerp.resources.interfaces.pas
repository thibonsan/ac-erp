unit acerp.resources.interfaces;

interface

uses
  Data.DB;

type

 IConexao = interface
   function Connect: TCustomConnection;
 end;

 IConfiguracao = interface
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

 IResource = interface
   function Conexao: IConexao;
 end;

implementation

end.
