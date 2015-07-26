unit frmlances;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, TAGraph, TALegendPanel,
  TASources, TASeries, TATools, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, ComCtrls, frmlistabase, db, ZDataset,
  zcontroladorgrilla, datGeneral, frmeditarlances, dateutils, funciones, math,
  TAChartAxisUtils, TAFuncSeries, TADataTools, TAChartListbox, TANavigation,
  ovctcbox, types, LSConfig;

type

  { TfmLances }

  TfmLances = class(TfmListaBase)
    acIdentLances: TAction;
    acMostrarMuestrasEcologicas: TAction;
    alMapa: TActionList;
    ChartListbox1: TChartListbox;
    ChartToolset1: TChartToolset;
    ChartToolset1DataPointCrosshairTool1: TDataPointCrosshairTool;
    ChartToolset1DataPointDistanceTool1: TDataPointDistanceTool;
    ChartToolset1DataPointHintTool1: TDataPointHintTool;
    ChartToolset1PanDragTool1: TPanDragTool;
    ChartToolset1ZoomDragTool1: TZoomDragTool;
    ChartToolset1ZoomMouseWheelTool1: TZoomMouseWheelTool;
    ckMapaLances: TCheckBox;
    chtLancesEtiquetasUMSerie: TLineSeries;
    chtLancesMuestrasEcologicasSerie: TLineSeries;
    chtLancesOtrasZonasSerie: TLineSeries;
    chtLancesUMVieiraSerie: TLineSeries;
    chtLancesMapaBaseSerie: TBSplineSeries;
    chtLances: TChart;
    chtLancesSerieLances: TLineSeries;
    dsLances: TDataSource;
    dtFecha: TDateTimePicker;
    ilToolbar: TImageList;
    lcsDatosMapa: TListChartSource;
    lcsMapaBase: TListChartSource;
    lcsUMVieira: TListChartSource;
    lcsOtrasZonas: TListChartSource;
    lcsEtiquetasUM: TListChartSource;
    lcsMuestrasEcologicas: TListChartSource;
    Splitter1: TSplitter;
    zqLances: TZQuery;
    zqMapaLances: TZQuery;
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
    zqOtrosMapas: TZQuery;
    zqMuestrasEcologicas: TZQuery;
    procedure acIdentLancesExecute(Sender: TObject);
    procedure acMostrarMuestrasEcologicasExecute(Sender: TObject);
    procedure ChartToolset1DataPointClickTool1PointClick(ATool: TChartTool;
      APoint: TPoint);
    procedure ChartToolset1DataPointDistanceTool1GetDistanceText(
      ASender: TDataPointDistanceTool; var AText: String);
    procedure ChartToolset1DataPointDistanceTool1Measure(
      ASender: TDataPointDistanceTool);
    procedure chtLancesAxisList0MarkToText(var AText: String; AMark: Double);
    procedure chtLancesAxisList1MarkToText(var AText: String; AMark: Double);
    procedure chtLancesClick(Sender: TObject);
    procedure chtLancesExtentChanged(ASender: TChart);
    procedure ckMapaLancesChange(Sender: TObject);
    procedure dbgListaGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqLancesAfterOpen(DataSet: TDataSet);
    procedure zqLancesBeforeOpen(DataSet: TDataSet);
    procedure zqLancesCalcFields(DataSet: TDataSet);
    procedure zqMapaLancesAfterOpen(DataSet: TDataSet);
    procedure zqMapaLancesBeforeOpen(DataSet: TDataSet);
    procedure zqMuestrasEcologicasAfterOpen(DataSet: TDataSet);
    procedure zqMuestrasEcologicasBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
    procedure CargarMapa(mapa: string; var lcs: TListChartSource;clearSource: boolean=True;campoEtiqueta:string='');
    procedure InicializarMapas;
    procedure CargarMapaLances;
  public
    { public declarations }
  end;

var
  fmLances: TfmLances;
  FMapasCargados: Boolean=False;

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

procedure TfmLances.zqMapaLancesAfterOpen(DataSet: TDataSet);
begin
  lcsDatosMapa.Clear;
  with zqMapaLances do
  begin
    while not EOF do
    begin
      lcsDatosMapa.Add(FieldByName('long_ini').AsFloat,FieldByName('lat_ini').AsFloat,FieldByName('fecha_hora_inicio').AsString, clGreen);
      lcsDatosMapa.Add(FieldByName('long_fin').AsFloat,FieldByName('lat_fin').AsFloat,FieldByName('fecha_hora_fin').AsString, clRed);
      lcsDatosMapa.Add(NaN,NaN);
      Next;
    end;
  end;
  chtLances.LogicalExtent:=chtLancesSerieLances.Extent;
end;

procedure TfmLances.zqMapaLancesBeforeOpen(DataSet: TDataSet);
begin
  zqMapaLances.ParamByName('__FILTRO__').Value:=edBuscar.Text;
  zqMapaLances.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if dtFecha.Checked then
     zqMapaLances.ParamByName('fecha').AsDateTime:=dtFecha.Date
  else
    zqMapaLances.ParamByName('fecha').AsString:='';
end;

procedure TfmLances.zqMuestrasEcologicasAfterOpen(DataSet: TDataSet);
begin
  lcsMuestrasEcologicas.Clear;
  with zqMuestrasEcologicas do
  begin
    while not EOF do
    begin
      lcsMuestrasEcologicas.Add(FieldByName('long_gis').AsFloat,FieldByName('lat_gis').AsFloat,'Muestra ecológica'+LineEnding+FieldByName('fecha_hora').AsString);
      Next;
    end;
  end;
end;

procedure TfmLances.zqMuestrasEcologicasBeforeOpen(DataSet: TDataSet);
begin
  zqMuestrasEcologicas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmLances.CargarMapa(mapa: string; var lcs: TListChartSource;
  clearSource: boolean; campoEtiqueta: string);
var
  Texto: string;
begin
  //Mapa de Argentina
  zqOtrosMapas.Close;
  zqOtrosMapas.ParamByName('mapa').AsString:=mapa;
  zqOtrosMapas.Open;
  if clearSource then
     lcs.Clear
  else
      lcs.Add(NaN,NaN);
  with zqOtrosMapas do
  begin
    First;
    while not EOF do
    begin
      if campoEtiqueta<>'' then
         Texto:=FieldByName(campoEtiqueta).AsString;
      if (FieldByName('Longitud').AsFloat<>0) and (FieldByName('Latitud').AsFloat<>0) then
         lcs.Add(FieldByName('Longitud').AsFloat,FieldByName('Latitud').AsFloat,Texto)
      else
          lcs.Add(NaN,NaN);
      Next;
    end;
  end;
end;

procedure TfmLances.InicializarMapas;
begin
  //Si el mapa no está cargado, lo cargo
  if not FMapasCargados then
  begin
    CargarMapa('ARGENTINA', lcsMapaBase);
    CargarMapa('URUGUAY', lcsMapaBase, False);
    CargarMapa('U.M. VIEIRA', lcsUMVieira);
    CargarMapa('ETIQUETAS U.M. VIEIRA', lcsEtiquetasUM, True, 'Etiqueta');
    CargarMapa('VEDA MERLUZA', lcsOtrasZonas);
    CargarMapa('VEDA MERLUZA NEGRA', lcsOtrasZonas, False);
    CargarMapa('ZONA COMUN', lcsOtrasZonas, False);
    zqMuestrasEcologicas.Close;
    zqMuestrasEcologicas.Open;
    CargarMapaLances;
    FMapasCargados:=True;
  end;
end;

procedure TfmLances.CargarMapaLances;
begin
  zqMapaLances.Close;
  lcsDatosMapa.Clear;
  chtLances.Refresh;
  if zqLances.RecordCount > 0 then
  begin
    zqMapaLances.Open;
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

procedure TfmLances.chtLancesAxisList0MarkToText(var AText: String;
  AMark: Double);
begin
  Atext:=FormatFloat('#°00.00´', GradoDecimalAGradoMinuto(AMark));
end;

procedure TfmLances.acIdentLancesExecute(Sender: TObject);
begin
  acIdentLances.Checked:=not acIdentLances.Checked;
  chtLancesSerieLances.Marks.Visible:=acIdentLances.Checked;
end;

procedure TfmLances.acMostrarMuestrasEcologicasExecute(Sender: TObject);
begin
  acMostrarMuestrasEcologicas.Checked:=not acMostrarMuestrasEcologicas.Checked;
  chtLancesMuestrasEcologicasSerie.Active:=acMostrarMuestrasEcologicas.Checked;
end;

procedure TfmLances.ChartToolset1DataPointClickTool1PointClick(
  ATool: TChartTool; APoint: TPoint);
begin
  ShowMessage('Clic');
end;

procedure TfmLances.ChartToolset1DataPointDistanceTool1GetDistanceText(
  ASender: TDataPointDistanceTool; var AText: String);
begin
  with ASender do
  begin
       Atext:=Format('Dist: %f mn', [DistanciaEnMillas(GradoDecimalAGradoMinuto(PointStart.GraphPos.Y), GradoDecimalAGradoMinuto(PointStart.GraphPos.X), GradoDecimalAGradoMinuto(PointEnd.GraphPos.Y), GradoDecimalAGradoMinuto(PointEnd.GraphPos.X))]);
  end;
end;

procedure TfmLances.ChartToolset1DataPointDistanceTool1Measure(
  ASender: TDataPointDistanceTool);
begin

end;

procedure TfmLances.chtLancesAxisList1MarkToText(var AText: String;
  AMark: Double);
begin
  Atext:=FormatFloat('#°00.00´', GradoDecimalAGradoMinuto(AMark));
end;

procedure TfmLances.chtLancesClick(Sender: TObject);
begin
end;

procedure TfmLances.chtLancesExtentChanged(ASender: TChart);
begin

end;

procedure TfmLances.ckMapaLancesChange(Sender: TObject);
begin
  paDetalles.Visible:=ckMapaLances.Checked;
  LSSaveConfig(['ver_mapa_lances'], [ckMapaLances.Checked]);
  if ckMapaLances.Checked then
  begin
    InicializarMapas;
  end;
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
var
  str_conf: string;
begin
  dtFecha.Date:=IncDay(Date,-1);

  FMapasCargados:=False;
  LSLoadConfig(['ver_mapa_lances'], [str_conf], [@str_conf]);
  ckMapaLances.Checked:=(str_conf='True');
  inherited;
end;

procedure TfmLances.zqLancesAfterOpen(DataSet: TDataSet);
begin
  if ckMapaLances.Checked then
  begin
    if not FMapasCargados then
       InicializarMapas
    else
       CargarMapaLances;
  end;
end;

end.

