unit acerp.core.entities.empresa;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.RegularExpressions;

type

  TEmpresaDadosvalidos = class
  private
    FCnpj: string;
    FValido: Boolean;

    constructor Create(CNPJ: string);
    function SomenteNumero(Value: string): string;
    function VerificarDigito(Cnpj: string; Peso: Integer): TEmpresaDadosvalidos;
    function AreEquals(Value1, Value2: Integer): Boolean;
    function VerificarIguais: Boolean;
  public
    class function New(CNPJ: string): TEmpresaDadosvalidos;
    function CnpjValido(CNPJ: string): Boolean;
  end;

implementation

{ TEmpresaDadosvalidos }

function TEmpresaDadosvalidos.AreEquals(Value1, Value2: Integer): Boolean;
begin
  Result := Value1 = Value2;
end;

function TEmpresaDadosvalidos.CnpjValido(CNPJ: string): Boolean;
begin
  VerificarDigito(FCnpj, 12)
  .VerificarDigito(FCnpj, 13);

  Result := FValido;
end;

constructor TEmpresaDadosvalidos.Create(CNPJ: string);
begin

  if not TRegEx.IsMatch(CNPJ, '\w[0,9]{1,2}.[0,9]{1,3}.[0,9]{1,3}\/.[0,9]{1,4}-.[0,9]{1,2}') then
    raise Exception.Create('CNPJ inválido');

  FCnpj := CNPJ;
end;

class function TEmpresaDadosvalidos.New(CNPJ: string): TEmpresaDadosvalidos;
begin
  Result := Self.Create(CNPJ);
end;

function TEmpresaDadosvalidos.SomenteNumero(Value: string): string;
begin
  Result := EmptyStr;

  for var I := Low(Value) to High(Value) do
    if Value[I] in ['0'..'9'] then
      Result := Result + Value[I];
end;

function TEmpresaDadosvalidos.VerificarDigito(Cnpj: string;
  Peso: Integer): TEmpresaDadosvalidos;
begin
  var lCnpj := LeftStr(cnpj, cnpj.Length - 2);
  var lDigito := RightStr(Cnpj, 2);
  var lPeso := 2;
  var lSum := 0;

  for var I := Peso downto 1 do
  begin
    lSum := lSum + (StrToInt(lCnpj[lPeso]) * I);
    Inc(lPeso);

    if lPeso = 10 then
      lPeso := 2;
  end;

  var lResultado := 0;
  var lResto := (lSum mod 11);

  if not lResto > 2 then
    lResultado := 11 - lResto;

  FValido := AreEquals(lResultado, LeftStr(lDigito, 1).ToInteger) or
    AreEquals(lResultado, RightStr(lDigito, 1).ToInteger) and (not VerificarIguais);
end;

function TEmpresaDadosvalidos.VerificarIguais: Boolean;
begin
  Result := False;

  for var I := 0 to 9 do
  begin
    var lChar := I.ToString.Chars[0];

    if FCnpj = StringOfChar(lChar, 14) then
      Result := True;
  end;
end;

end.
