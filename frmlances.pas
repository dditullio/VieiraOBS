unit frmlances;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, rxdbgrid, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, ActnList, StdCtrls, frmlistabase, db,
  ZDataset, zcontroladorgrilla, datGeneral, frmeditarlances, dateutils, funciones;

type

  { TfmLances }

  TfmLances = class(TfmListaBase)
    dsLances: TDataSource;
    dtFecha: TDateTimePicker;
    zqLances: TZQuery;
    zqLancescable_babor: TLongintField;
    zqLancescable_estribor: TLongintField;
    zqLancescaptura_babor: TFloatField;
    zqLancescaptura_estribor: TFloatField;
    zqLancescod_estado_mar: TLongintField;
    zqLancescomentarios: TStringField;
    zqLancescuadrante_latitud_fin: TStringField;
    zqLancescuadrante_latitud_ini: TStringField;
    zqLancescuadrante_longitud_fin: TStringField;
    zqLancescuadrante_longitud_ini: TStringField;
    zqLancesdireccion_viento: TLongintField;
    zqLancesDistancia: TFloatField;
    zqLancesfecha: TDateField;
    zqLancesgrados_latitud_fin: TLongintField;
    zqLancesgrados_latitud_ini: TLongintField;
    zqLancesgrados_longitud_fin: TLongintField;
    zqLancesgrados_longitud_ini: TLongintField;
    zqLanceshora: TTimeField;
    zqLancesHorasPesca: TFloatField;
    zqLancesidlance: TLongintField;
    zqLancesidmarea: TLongintField;
    zqLanceslargo_relinga_inferior: TLongintField;
    zqLancesLatFin: TFloatField;
    zqLancesLatIni: TFloatField;
    zqLanceslatitud_fin: TStringField;
    zqLanceslatitud_fin_fmt: TBytesField;
    zqLanceslatitud_ini: TStringField;
    zqLanceslatitud_ini_fmt: TBytesField;
    zqLancesLongFin: TFloatField;
    zqLancesLongIni: TFloatField;
    zqLanceslongitud_fin: TStringField;
    zqLanceslongitud_fin_fmt: TBytesField;
    zqLanceslongitud_ini: TStringField;
    zqLanceslongitud_ini_fmt: TBytesField;
    zqLancesmallero_copo_mm: TLongintField;
    zqLancesminutos_arrastre: TFloatField;
    zqLancesminutos_latitud_fin: TFloatField;
    zqLancesminutos_latitud_ini: TFloatField;
    zqLancesminutos_longitud_fin: TFloatField;
    zqLancesminutos_longitud_ini: TFloatField;
    zqLancesnro_lance: TLongintField;
    zqLancesnudos_viento: TLongintField;
    zqLancesprofundidad: TLongintField;
    zqLancesrinde_comercial_B: TFloatField;
    zqLancesrinde_comercial_E: TFloatField;
    zqLancesrinde_total_B: TFloatField;
    zqLancesrinde_total_E: TFloatField;
    zqLancesrumbo: TLongintField;
    zqLancestemperatura_aire: TFloatField;
    zqLancestemperatura_fondo: TFloatField;
    zqLancestemperatura_superficie: TFloatField;
    zqLancestipo_malla: TStringField;
    zqLancesvelocidad: TFloatField;
    zqLancesVelocidadNecesaria: TFloatField;
    procedure dbgListaGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqLancesBeforeOpen(DataSet: TDataSet);
    procedure zqLancesCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmLances: TfmLances;

implementation

{$R *.lfm}

{ TfmLances }

procedure TfmLances.zqLancesBeforeOpen(DataSet: TDataSet);
begin
  zqLances.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if dtFecha.Checked then
     zqLances.ParamByName('fecha').AsDateTime:=dtFecha.Date
  else
    zqLances.ParamByName('fecha').AsString:='';
end;

procedure TfmLances.zqLancesCalcFields(DataSet: TDataSet);
begin
  zqLancesLatIni.Value := zqLancesgrados_latitud_ini.Value * 100 +
    zqLancesminutos_latitud_ini.Value;
  zqLancesLongIni.Value := zqLancesgrados_longitud_ini.Value * 100 +
    zqLancesminutos_longitud_ini.Value;
  zqLancesLatFin.Value := zqLancesgrados_latitud_fin.Value * 100 +
    zqLancesminutos_latitud_fin.Value;
  zqLancesLongFin.Value := zqLancesgrados_longitud_fin.Value * 100 +
    zqLancesminutos_longitud_fin.Value;

  zqLancesDistancia.Value:=DistanciaEnMillas(zqLancesLatIni.Value, zqLancesLongIni.Value,
      zqLancesLatFin.Value, zqLancesLongFin.Value);
  if (not zqLancesDistancia.IsNull) and
    (zqLancesminutos_arrastre.Value > 0) then
  begin
    zqLancesVelocidadNecesaria.Value :=
      zqLancesDistancia.Value * 60 / zqLancesminutos_arrastre.Value;
  end;
  if not zqLancesminutos_arrastre.IsNull then
  begin
    zqLancesHorasPesca.Value:=zqLancesminutos_arrastre.Value/60;
  end;
end;

procedure TfmLances.dtFechaChange(Sender: TObject);
begin
  zcgLista.Buscar;
end;

procedure TfmLances.dbgListaGetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
  if (zqLancesVelocidadNecesaria.Value > 5.8) or (zqLancesVelocidadNecesaria.Value < 3) or
      (zqLancesDistancia.Value > 3) then
    Background := clRed;
end;

procedure TfmLances.dtFechaCheckBoxChange(Sender: TObject);
begin
  if dtFecha.Checked then
     dtFecha.Date:=IncDay(Date,-1)
  else
    dtFecha.Date:=NullDate;
  zcgLista.Buscar;
end;

procedure TfmLances.FormShow(Sender: TObject);
begin
  dtFecha.Date:=IncDay(Date,-1);
  inherited;
end;

end.

