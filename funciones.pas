unit funciones;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;

const
  pi = 3.14159265358979323846;
  half_pi = 1.57079632679489661923;
  rad = 3.14159265358979323846 / 180;{conversion factor for degrees
                                                into radians}

function DistanciaEnMillas(lat1, lon1, lat2, lon2: double): double;
function VelocidadEnNudos(lat1, lon1, lat2, lon2, minutos: double): double;
procedure DecimalToFraction(Decimal: extended; var FractionNumerator: extended;
  var FractionDenominator: extended; AccuracyFactor: extended);
function DecimalAFraccion(decimal: extended; max_digitos_denom: integer = 3): string;
function LetrasColumnasExcel(columna: integer): string;
function HoraOK(StrHora: string): boolean;

implementation

function atan2(y, x: extended): extended;
begin
  if x = 0.0 then
  begin
    if y = 0.0 then
    (* Error! Give error message and stop program *)
    else if y > 0.0 then
      atan2 := half_pi
    else
      atan2 := -half_pi;
  end
  else
  begin
    if x > 0.0 then
      atan2 := arctan(y / x)
    else if x < 0.0 then
    begin
      if y >= 0.0 then
        atan2 := arctan(y / x) + pi
      else
        atan2 := arctan(y / x) - pi;
    end;
  end;
end; {atan2}

//La función CalcularMilla requiere en sus parámetros la notación
//de grados y minutos decimales, de la forma GGMM,MM
function DistanciaEnMillas(lat1, lon1, lat2, lon2: double): double;
var
  radius, dlon, dlat, a, distance: extended;
begin
  // 6378.137 es el radio de la tiera en km y 1.852 es la medida de una milla náutica en Km
  //radius:=6378.137/1.852; {Earth equatorial radius in Km; as used in most GPS}
  radius := 3443.918466522678;

  //Se convierte todo todo a grados con decimales
  lat1 := lat1 / 100; //se transforma GGMM,MM en GG,MMMM
  lat1 := int(lat1) + ((lat1 - int(lat1)) * 100 / 60);
  lon1 := lon1 / 100;
  lon1 := int(lon1) + ((lon1 - int(lon1)) * 100 / 60);
  lat2 := lat2 / 100;
  lat2 := int(lat2) + ((lat2 - int(lat2)) * 100 / 60);
  lon2 := lon2 / 100;
  lon2 := int(lon2) + ((lon2 - int(lon2)) * 100 / 60);

  {The Haversine formula}
  dlon := (lon2 - lon1) * rad;
  dlat := (lat2 - lat1) * rad;
  a := sqr(sin(dlat / 2)) + cos(lat1 * rad) * cos(lat2 * rad) * sqr(sin(dlon / 2));
  distance := radius * (2 * atan2(sqrt(a), sqrt(1 - a)));
  Result := int(distance * 100) / 100;
end;

function VelocidadEnNudos(lat1, lon1, lat2, lon2, minutos: double): double;
var
  dist_millas: double;
  veloc_prom: double;
begin
  if minutos > 0 then
  begin
    dist_millas := DistanciaEnMillas(lat1, lon1, lat2, lon2);
    veloc_prom := dist_millas * 60 / minutos;
  end
  else
  begin
    veloc_prom := 0;
  end;
  Result := int(veloc_prom * 100) / 100;
end;

procedure DecimalToFraction(Decimal: extended; var FractionNumerator: extended;
  var FractionDenominator: extended; AccuracyFactor: extended);
var
  DecimalSign: extended;
  Z: extended;
  PreviousDenominator: extended;
  ScratchValue: extended;
begin
  if Decimal < 0.0 then
    DecimalSign := -1.0
  else
    DecimalSign := 1.0;
  Decimal := Abs(Decimal);
  if Decimal = Int(Decimal) then { handles exact integers including 0 }
  begin
    FractionNumerator := Decimal * DecimalSign;
    FractionDenominator := 1.0;
    Exit;
  end;
  if (Decimal < 1.0E-19) then { X oe 0 already taken care of }
  begin
    FractionNumerator := DecimalSign;
    FractionDenominator := 9999999999999999999.0;
    Exit;
  end;
  if (Decimal > 1.0E+19) then
  begin
    FractionNumerator := 9999999999999999999.0 * DecimalSign;
    FractionDenominator := 1.0;
    Exit;
  end;
  Z := Decimal;
  PreviousDenominator := 0.0;
  FractionDenominator := 1.0;
  repeat
    Z := 1.0 / (Z - Int(Z));
    ScratchValue := FractionDenominator;
    FractionDenominator := FractionDenominator * Int(Z) + PreviousDenominator;
    PreviousDenominator := ScratchValue;
    FractionNumerator := Int(Decimal * FractionDenominator + 0.5)
    { Rounding Function }
  until
    (Abs((Decimal - (FractionNumerator / FractionDenominator))) < AccuracyFactor) or
    (Z = Int(Z));
  FractionNumerator := DecimalSign * FractionNumerator;
end; {procedure DecimalToFraction}

function DecimalAFraccion(decimal: extended; max_digitos_denom: integer = 3): string;
var
  numerador, denominador, AccurracyFactor: extended;
begin
  if (max_digitos_denom > 0) and (max_digitos_denom < 5) then
    AccurracyFactor := 0.5 * power(10, -1 * max_digitos_denom);
  DecimalToFraction(decimal, numerador, denominador, AccurracyFactor);
  Result := FormatFloat('0', int(numerador)) + '/' + FormatFloat('0', int(denominador));
end;

function LetrasColumnasExcel(columna: integer): string;
var
  l1, l2: string;
  nl2, nl1: integer;
begin
  if (columna < 1) or (columna > 702) then //Columna702="ZZ"
    Result := ''
  else
  begin
    nl1 := (columna - 1) div 26;
    nl2 := columna - (26 * nl1);
    if nl1 > 0 then
      l1 := CHR(nl1 + 64)
    else
      l1 := '';
    if nl2 > 0 then
      l2 := CHR(nl2 + 64)
    else
      l2 := '';
    Result := l1 + l2;
  end;
end;

function HoraOK(StrHora: string): boolean;
var
  hora: TDateTime;
begin
  try
    //Intento asignar el texto a una variable datetime. Si da error
    //es porque el texto pasado no es una hora válida
    hora := StrToTime(Strhora);
    Result := True;
  except
    Result := False;
  end;
end;

end.
