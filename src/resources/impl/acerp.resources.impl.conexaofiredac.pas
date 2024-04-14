unit acerp.resources.impl.conexaofiredac;

interface

uses
  Data.DB,
  Firedac.Comp.Client,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Stan.ExprFuncs,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Phys,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  FireDAC.Phys.PGWrapper,
  FireDAC.VCLUI.Wait,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  acerp.resources.interfaces;

type

  TConexaoFiredac = class(TInterfacedObject, IConexao)
  private
    FConn: TFDConnection;
    FConf: IConfiguracao;
    FQuery: TFDQuery;
    FDriver: TFDPhysPgDriverLink;

    constructor Create;
    destructor Destroy; override;
    procedure PreencherQuery(Value: string);
    procedure PreencherParams(Value: array of Variant);
  public
    class function New: IConexao;
    function Query(const Statement: string; const Params: array of Variant): TDataSet;
  end;

implementation

uses
  System.SysUtils,
  System.Variants,
  acerp.resources.impl.configuracao;

{ TConexaoFiredac }

constructor TConexaoFiredac.Create;
begin
  FConf := TConfiguracao.New;
  FConn := TFDConnection.Create(nil);
  FQuery := TFDQuery.Create(FConn);
  FDriver := TFDPhysPgDriverLink.Create(FConn);
  FDriver.VendorHome := ExtractFilePath(ParamStr(0)) + 'lib';

  try
    FConn.Params.DriverID := FConf.DriverID;
    FConn.Params.Database := FConf.DataBase;
    FConn.Params.UserName := FConf.UserName;
    FConn.Params.Password := FConf.Password;
    FConn.Params.Add('Server=' + FConf.Server);
    FConn.Params.Add('Port=' + FConf.Port);
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

procedure TConexaoFiredac.PreencherParams(Value: array of Variant);
begin
  for var I := Low(Value) to High(Value) do
  begin
    var LVarType := VarType(Value[I]) and VarTypemask;
    var LType := VarTypeToDataType(LVarType);
    var LParam := FQuery.Params.Add;
    LParam.DataType := LType;
    LParam.ParamType := ptInput;
    FQuery.Params[I].Value := Value[I];
  end;
end;

procedure TConexaoFiredac.PreencherQuery(Value: string);
begin

  if not FConn.Connected then
    FConn.Connected := True;

  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

function TConexaoFiredac.Query(const Statement: string;
  const Params: array of Variant): TDataSet;
begin

  if not ((Pos('INSERT', UpperCase(Statement)) > 0) or
    (Pos('UPDATE', UpperCase(Statement)) > 0)) then
  begin
    FQuery.Open;
    Result := FQuery;
    Exit;
  end;

  FQuery.ExecSQL;
  Result := FQuery;
end;

end.
