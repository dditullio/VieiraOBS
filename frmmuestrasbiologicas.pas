unit frmmuestrasbiologicas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, frmlistabase, db, ZDataset,
  zcontroladorgrilla, datGeneral, frmeditarmuestrasbiologicas;

type

  { TfmMuestrasBiologicas }

  TfmMuestrasBiologicas = class(TfmListaBase)
    dsMuestrasBiologicas: TDataSource;
    zqMuestrasBiologicas: TZQuery;
    zqMuestrasBiologicascontenido: TStringField;
    zqMuestrasBiologicascuadrante_latitud: TStringField;
    zqMuestrasBiologicascuadrante_longitud: TStringField;
    zqMuestrasBiologicasfecha: TDateField;
    zqMuestrasBiologicashora: TTimeField;
    zqMuestrasBiologicasidmarea: TLongintField;
    zqMuestrasBiologicasidmuestras_biologicas: TLongintField;
    zqMuestrasBiologicasLatitud: TFloatField;
    zqMuestrasBiologicaslongitud: TFloatField;
    zqMuestrasBiologicasnro_caja: TLongintField;
    zqMuestrasBiologicasstr_latitud: TStringField;
    zqMuestrasBiologicasstr_longitud: TStringField;
    zqMuestrasBiologicastipo_muestra: TStringField;
    procedure zqMuestrasBiologicasBeforeOpen(DataSet: TDataSet);
    procedure zqMuestrasBiologicasCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmMuestrasBiologicas: TfmMuestrasBiologicas;

implementation

{$R *.lfm}

{ TfmMuestrasBiologicas }

procedure TfmMuestrasBiologicas.zqMuestrasBiologicasBeforeOpen(DataSet: TDataSet);
begin
  zqMuestrasBiologicas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMuestrasBiologicas.zqMuestrasBiologicasCalcFields(DataSet: TDataSet);
begin
  zqMuestrasBiologicasstr_latitud.Value:=FormatFloat('00º 00.00´', zqMuestrasBiologicasLatitud.Value)+zqMuestrasBiologicascuadrante_latitud.Value;
  zqMuestrasBiologicasstr_longitud.Value:=FormatFloat('00º 00.00´', zqMuestrasBiologicaslongitud.Value)+zqMuestrasBiologicascuadrante_longitud.Value;
end;

end.

