unit acerp.services.enums;

interface

uses
  System.SysUtils,
  System.TypInfo;

type
  TChartType = (Pie, Donuts, Lines, Bars);

  TTipoAcao = (EDITAR, NOVO);

  TTipoAcaoHelper = record helper for TTipoAcao
    function ToEnum(Value: String): TTipoAcao;
  end;

implementation

{ TTipoAcaoHelper }

function TTipoAcaoHelper.ToEnum(Value: String): TTipoAcao;
begin
  Result := TTipoAcao(GetEnumValue(TypeInfo(TTipoAcao), UpperCase(Value)));
end;

end.
