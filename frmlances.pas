unit frmlances;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, TAGraph,
  TASources, TASeries, TATools, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, ComCtrls, frmlistabase, db, ZDataset,
  zcontroladorgrilla, datGeneral, frmeditarlances, dateutils, funciones, math,
  TAFuncSeries, TADataTools, TAChartListbox, types, LSConfig, LSControls,
  TACustomSeries, LCLIntf, DBGrids, TAChartUtils;

type

  { TfmLances }

  TfmLances = class(TfmListaBase)
    acMover: TAction;
    acMedir: TAction;
    acInfo: TAction;
    acGuardarImagen: TAction;
    acZoomLanceSeleccionado: TAction;
    acZoomLances: TAction;
    acZoomRect: TAction;
    acZoomOut: TAction;
    acZoomIn: TAction;
    alMapa: TActionList;
    ckOcultarMapaBase: TCheckBox;
    clbReferencias: TChartListbox;
    ChartToolset1: TChartToolset;
    ChartToolset1DataPointCrosshairTool1: TDataPointCrosshairTool;
    chtLancesLanceSeleccionadoSerie: TLineSeries;
    chtLancesZEP_ZEESeries: TLineSeries;
    ctPanDrag: TPanDragTool;
    ctZoomOut: TZoomClickTool;
    ctDistancia: TDataPointDistanceTool;
    ctInformacion: TDataPointHintTool;
    ctMover: TPanDragTool;
    ctZoomIn: TZoomClickTool;
    ctZoomDrag: TZoomDragTool;
    ctZoomWheel: TZoomMouseWheelTool;
    chtLances: TChart;
    chtLancesEtiquetasUMSerie1: TLineSeries;
    chtLancesMapaBaseSerie1: TBSplineSeries;
    chtLancesMuestrasEcologicasSerie1: TLineSeries;
    chtLancesOtrasZonasSerie1: TLineSeries;
    chtLancesSerieLances1: TLineSeries;
    chtLancesUMVieiraSerie1: TLineSeries;
    ckMapaLances: TCheckBox;
    chtLancesEtiquetasUMSerie: TLineSeries;
    chtLancesMuestrasEcologicasSerie: TLineSeries;
    chtLancesOtrasZonasSerie: TLineSeries;
    chtLancesUMVieiraSerie: TLineSeries;
    chtLancesMapaBaseSerie: TBSplineSeries;
    chtLancesSerieLances: TLineSeries;
    dsLances: TDataSource;
    dtFecha: TDateTimePicker;
    ilToolbar: TImageList;
    lcsLances: TListChartSource;
    lcsMapaBase: TListChartSource;
    lcsZonasEconomicas: TListChartSource;
    lcsUMVieira: TListChartSource;
    lcsOtrasZonas: TListChartSource;
    lcsEtiquetasUM: TListChartSource;
    lcsMuestrasEcologicas: TListChartSource;
    lcsLanceSeleccionado: TListChartSource;
    LSExpandPanel1: TLSExpandPanel;
    Panel2: TPanel;
    sdGuardarImagen: TSaveDialog;
    splDetalles: TSplitter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    zqLances: TZQuery;
    zqLancesDifRumbo: TFloatField;
    zqLancesetiqueta_fin: TStringField;
    zqLancesetiqueta_inicio: TStringField;
    zqLanceslat_fin_gis: TFloatField;
    zqLanceslat_ini_gis: TFloatField;
    zqLanceslong_fin_gis: TFloatField;
    zqLanceslong_ini_gis: TFloatField;
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
    zqLancesRumboCalc: TFloatField;
    zqLancestemperatura_aire: TFloatField;
    zqLancestemperatura_fondo: TFloatField;
    zqLancestemperatura_superficie: TFloatField;
    zqLancestipo_malla: TStringField;
    zqLancesvelocidad: TFloatField;
    zqLancesVelocidadNecesaria: TFloatField;
    zqOtrosMapas: TZQuery;
    zqMuestrasEcologicas: TZQuery;
    procedure acGuardarImagenExecute(Sender: TObject);
    procedure acHabilitarHerramienta(Sender: TObject);
    procedure acZoomLanceSeleccionadoExecute(Sender: TObject);
    procedure acZoomLancesExecute(Sender: TObject);
    procedure chtLancesExtentChanged(ASender: TChart);
    procedure clbReferenciasCheckboxClick(ASender: TObject; AIndex: Integer);
    procedure ChartToolset1DataPointClickTool1PointClick(ATool: TChartTool;
      APoint: TPoint);
    procedure ctDistanciaGetDistanceText(
      ASender: TDataPointDistanceTool; var AText: String);
    procedure chtLancesAxisList0MarkToText(var AText: String; AMark: Double);
    procedure chtLancesAxisList1MarkToText(var AText: String; AMark: Double);
    procedure ckMapaLancesChange(Sender: TObject);
    procedure dbgListaCellClick(Column: TColumn);
    procedure dbgListaGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqLancesAfterOpen(DataSet: TDataSet);
    procedure zqLancesBeforeOpen(DataSet: TDataSet);
    procedure zqLancesCalcFields(DataSet: TDataSet);
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
{$R cursores.res}

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

  if (not zqLancesLatIni.IsNull) and
    (not zqLancesLongIni.IsNull) and
    (not zqLancesLatFin.IsNull) and
    (not zqLancesLongFin.IsNull) and
    (not zqLancesDistancia.IsNull) and
    (zqLancesDistancia.Value>0) then
  begin
    //Calculo rumbo
    zqLancesRumboCalc.Value :=
      Rumbo(zqLancesLatIni.Value, zqLancesLongIni.Value,
      zqLancesLatFin.Value, zqLancesLongFin.Value);

    //Calculo diferencia > 15°
    zqLancesDifRumbo.Value:=abs(zqLancesRumboCalc.Value-zqLancesrumbo.Value);
    //Me aseguro de que la diferencia no sea mayor a 180°
    if zqLancesDifRumbo.Value>180 then
       zqLancesDifRumbo.Value:=360-zqLancesDifRumbo.Value;
  end;
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
    CargarMapa('LIMITE PROVINCIAL', lcsZonasEconomicas);
    CargarMapa('ZONA ECONOMICA EXCLUSIVA', lcsZonasEconomicas, False);
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
var
  bm: TBookMark;
begin
  lcsLances.Clear;
  lcsLanceSeleccionado.Clear;
  chtLances.Refresh;
  if (zqLances.RecordCount > 0) and (ckMapaLances.Checked) then
  begin
    with zqLances do
    begin
      DisableControls;
      bm:=GetBookmark;
      First;
      while not EOF do
      begin
        if (not FieldByName('long_ini_gis').IsNull)
           and (not FieldByName('lat_ini_gis').IsNull)
           and (not FieldByName('long_fin_gis').IsNull)
           and (not FieldByName('lat_fin_gis').IsNull) then
        begin
          lcsLances.Add(FieldByName('long_ini_gis').AsFloat,FieldByName('lat_ini_gis').AsFloat,'Lance N° '+IntToStr(FieldByName('nro_lance').AsInteger)+LineEnding+FieldByName('etiqueta_inicio').AsString, clGreen);
          lcsLances.Add(FieldByName('long_fin_gis').AsFloat,FieldByName('lat_fin_gis').AsFloat,'Lance N° '+IntToStr(FieldByName('nro_lance').AsInteger)+LineEnding+FieldByName('etiqueta_fin').AsString, clRed);
          lcsLances.Add(NaN,NaN);
        end;
        Next;
      end;
      if BookmarkValid(bm) then
         GotoBookmark(bm);
      EnableControls;
    end;
    if lcsLances.Count>0 then
       chtLances.LogicalExtent:=chtLancesSerieLances.Extent;
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
      (zqLancesDistancia.Value > 3) or (zqLancesDifRumbo.Value>15) then
    Background := clRed;
end;

procedure TfmLances.chtLancesAxisList0MarkToText(var AText: String;
  AMark: Double);
begin
  Atext:=FormatFloat('#°00.00´', GradoDecimalAGradoMinuto(AMark));
end;

procedure TfmLances.acHabilitarHerramienta(Sender: TObject);
begin
  if (Sender is TAction) then
  begin
    ctInformacion.Enabled:= ((Sender as TAction).Tag=1);
    ctMover.Enabled:= ((Sender as TAction).Tag=2);
    ctZoomIn.Enabled:= ((Sender as TAction).Tag=3);
    ctZoomOut.Enabled:= ((Sender as TAction).Tag=4);
    ctZoomDrag.Enabled:= ((Sender as TAction).Tag=5);
    ctDistancia.Enabled:= ((Sender as TAction).Tag=6);
  end;
  //Pongo el cursor correspondiente
  case (Sender as TAction).Tag of
  2: chtLances.Cursor:=1;
  3: chtLances.Cursor:=2;
  4: chtLances.Cursor:=3;
  5: chtLances.Cursor:=4;
  6: chtLances.Cursor:=5;
  else
    chtLances.Cursor:=crDefault;
  end;
end;

procedure TfmLances.acZoomLanceSeleccionadoExecute(Sender: TObject);
var
  NewExtent: TDoubleRect;
  ax, ay, bx, by: Double;
begin
  if lcsLanceSeleccionado.Count>0 then
  begin
    NewExtent.a.X:=lcsLanceSeleccionado.Extent.a.X-max(0.001,abs((lcsLanceSeleccionado.Extent.a.X-lcsLanceSeleccionado.Extent.b.X)));
    NewExtent.a.Y:=lcsLanceSeleccionado.Extent.a.Y-max(0.001,abs((lcsLanceSeleccionado.Extent.a.Y-lcsLanceSeleccionado.Extent.b.Y)));
    NewExtent.b.X:=lcsLanceSeleccionado.Extent.b.X+max(0.001,abs((lcsLanceSeleccionado.Extent.a.X-lcsLanceSeleccionado.Extent.b.X)));
    NewExtent.b.Y:=lcsLanceSeleccionado.Extent.b.Y+max(0.001,abs((lcsLanceSeleccionado.Extent.a.Y-lcsLanceSeleccionado.Extent.b.Y)));
    chtLances.LogicalExtent:=NewExtent;
  end;
end;

procedure TfmLances.acGuardarImagenExecute(Sender: TObject);
begin
  if sdGuardarImagen.Execute then
  begin
    if (not FileExistsUTF8(sdGuardarImagen.FileName)) or (MessageDlg('El archivo '+sdGuardarImagen.FileName+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      chtLances.SaveToFile(TJPEGImage, sdGuardarImagen.FileName);
      OpenDocument(sdGuardarImagen.FileName);
    end;
  end;
end;

procedure TfmLances.acZoomLancesExecute(Sender: TObject);
begin
  if lcsLances.Count>0 then
     chtLances.LogicalExtent:=chtLancesSerieLances.Extent;
end;

procedure TfmLances.chtLancesExtentChanged(ASender: TChart);
var
  ext_y: double;
begin
  //Si se aumenta el zoom como para mostrar menos de 1/2 grado en vertical,
  //deshabilito el mapa base (si está marcada esta opción)
  if ckOcultarMapaBase.Checked then
  begin
    ext_y:=ABS(chtLances.LogicalExtent.a.Y-chtLances.LogicalExtent.b.Y);
       if (ext_y<0.5) and (chtLancesMapaBaseSerie.Active) then
          chtLancesMapaBaseSerie.Active:=False
       else if (ext_y>=0.5) and (not chtLancesMapaBaseSerie.Active) then
          chtLancesMapaBaseSerie.Active:=True;
  end;
end;

procedure TfmLances.clbReferenciasCheckboxClick(ASender: TObject; AIndex: Integer
  );
begin
     clbReferencias.Series[AIndex].Active:=clbReferencias.Checked[AIndex];
end;

procedure TfmLances.ChartToolset1DataPointClickTool1PointClick(
  ATool: TChartTool; APoint: TPoint);
begin
  //ShowMessage('Clic');
end;

procedure TfmLances.ctDistanciaGetDistanceText(
  ASender: TDataPointDistanceTool; var AText: String);
begin
  with ASender do
  begin
    Atext:=Format('Distancia: %f mn', [DistanciaEnMillas(GradoDecimalAGradoMinuto(PointStart.GraphPos.Y), GradoDecimalAGradoMinuto(PointStart.GraphPos.X), GradoDecimalAGradoMinuto(PointEnd.GraphPos.Y), GradoDecimalAGradoMinuto(PointEnd.GraphPos.X))])
                              +LineEnding+'Rumbo: '+FormatFloat('000°', Rumbo(Abs(GradoDecimalAGradoMinuto(PointStart.GraphPos.Y)),
                                                                        Abs(GradoDecimalAGradoMinuto(PointStart.GraphPos.X)),
                                                                        Abs(GradoDecimalAGradoMinuto(PointEnd.GraphPos.Y)),
                                                                        Abs(GradoDecimalAGradoMinuto(PointEnd.GraphPos.X))));
  end;
end;

procedure TfmLances.chtLancesAxisList1MarkToText(var AText: String;
  AMark: Double);
begin
  Atext:=FormatFloat('#°00.00´', GradoDecimalAGradoMinuto(AMark));
end;

procedure TfmLances.ckMapaLancesChange(Sender: TObject);
begin
  if ckMapaLances.Checked then
  begin
    paDetalles.Visible:=True;
    splDetalles.Visible:=True;
  end else
  begin
    splDetalles.Visible:=False;
    paDetalles.Visible:=False;
  end;
  ckMapaLances.Checked;
  LSSaveConfig(['ver_mapa_lances'], [ckMapaLances.Checked]);
  if ckMapaLances.Checked then
  begin
    InicializarMapas;
  end;
end;

procedure TfmLances.dbgListaCellClick(Column: TColumn);
begin
  lcsLanceSeleccionado.Clear;
  with zqLances do
  begin
    if (not FieldByName('long_ini_gis').IsNull)
       and (not FieldByName('lat_ini_gis').IsNull)
       and (not FieldByName('long_fin_gis').IsNull)
       and (not FieldByName('lat_fin_gis').IsNull) then
    begin
      lcsLanceSeleccionado.Add(FieldByName('long_ini_gis').AsFloat,FieldByName('lat_ini_gis').AsFloat,'Lance N° '+IntToStr(FieldByName('nro_lance').AsInteger)+LineEnding+FieldByName('etiqueta_inicio').AsString, clGreen);
      lcsLanceSeleccionado.Add(FieldByName('long_fin_gis').AsFloat,FieldByName('lat_fin_gis').AsFloat,'Lance N° '+IntToStr(FieldByName('nro_lance').AsInteger)+LineEnding+FieldByName('etiqueta_fin').AsString, clRed);
      lcsLanceSeleccionado.Add(NaN,NaN);
    end;
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

procedure TfmLances.FormCreate(Sender: TObject);
var
  Cur: TCursorImage;
begin
  Cur := TCursorImage.Create;
  Cur.LoadFromResourceName(HInstance, 'VPRHANDOPEN');
  Screen.Cursors[1] := Cur.ReleaseHandle;
  Cur.LoadFromResourceName(HInstance, 'ZOOM_IN');
  Screen.Cursors[2] := Cur.ReleaseHandle;
  Cur.LoadFromResourceName(HInstance, 'ZOOM_OUT');
  Screen.Cursors[3] := Cur.ReleaseHandle;
  Cur.LoadFromResourceName(HInstance, 'MAGNIFY_REGION');
  Screen.Cursors[4] := Cur.ReleaseHandle;
  Cur.LoadFromResourceName(HInstance, 'CR_CROSS');
  Screen.Cursors[5] := Cur.ReleaseHandle;
  Cur.LoadFromResourceName(HInstance, 'VPRHANDCLOSED');
  Screen.Cursors[6] := Cur.ReleaseHandle;
  Cur.Free;

  chtLances.Cursor:=1;
  ctMover.ActiveCursor:=6;
end;

procedure TfmLances.FormShow(Sender: TObject);
var
  str_conf: string;
begin
  dtFecha.Date:=IncDay(Date,-1);
  chtLances.Title.Text.Text:=PChar('Marea: '+dmGeneral.DscMareaActiva);
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

