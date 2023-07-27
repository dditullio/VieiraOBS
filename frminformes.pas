unit frminformes;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF MSWINDOWS}
    Windows,
    windirs,
  {$ENDIF}
  {$IFDEF UNIX}
    Unix,
  {$ENDIF}
  Classes, SysUtils, LazFileUtils, Fileutil, AbZipper, DateTimePicker, LR_Class,
  LR_DBSet, RxIniPropStorage, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ActnList, ComCtrls, StdCtrls, EditBtn, IniPropStorage, Grids,
  frmbase, ZDataset, DB, datGeneral, comobj, variants, frmrptdatospuente,
  funciones, LSConfig, LR_DSet, lr_e_pdf, dateutils, strutils;

type

  { TfmInformes }

  TfmInformes = class(TfmBase)
    acGuardarPlanillas: TAction;
    acImprimirDatosPuente: TAction;
    acImprimirSenasa: TAction;
    acImprimirMuestrasBiol: TAction;
    azPlanillas: TAbZipper;
    bbGuardar: TBitBtn;
    cbDatosPuentePDF: TCheckBox;
    cbSenasaPDF: TCheckBox;
    cbMuestrasBiolPDF: TCheckBox;
    cbCondrictios: TCheckBox;
    cbReemplazar: TCheckBox;
    cbDatosPuente: TCheckBox;
    cbRindes: TCheckBox;
    cbCoccion: TCheckBox;
    cbTallas: TCheckBox;
    cbDanio: TCheckBox;
    cbByCatch: TCheckBox;
    dsResumen: TDataSource;
    dedCarpetaPlanillas: TDirectoryEdit;
    dtFecha: TDateTimePicker;
    frDBCallos: TfrDBDataSet;
    frDBMuestrasBiol: TfrDBDataSet;
    frDBDatosPuente: TfrDBDataSet;
    frDBEntera: TfrDBDataSet;
    frrDatosPuente: TfrReport;
    frrMuestrasBiol: TfrReport;
    frrSenasa: TfrReport;
    gbPlanillasExcel: TGroupBox;
    gbPlanillasPDF: TGroupBox;
    gbResumen: TGroupBox;
    Label1: TLabel;
    laProceso: TLabel;
    pcInformes: TPageControl;
    pbProceso: TProgressBar;
    sddCarpetaPlanillas: TSelectDirectoryDialog;
    sgResumen: TStringGrid;
    tsLances: TTabSheet;
    zqByCatch: TZQuery;
    zqDetTallascomentarios: TStringField;
    zqDetTallaspeso_muestra_captura: TFloatField;
    zqDetTallaspeso_muestra_captura_comercial: TFloatField;
    zqDetTallaspeso_muestra_captura_no_comercial: TFloatField;
    zqInfDatosPuentefecha_fmt: TStringField;
    zqInfDatosPuentelatitud_fin_inf: TLongintField;
    zqInfDatosPuentelatitud_ini_inf: TLongintField;
    zqInfDatosPuentelongitud_fin_inf: TLongintField;
    zqInfDatosPuentelongitud_ini_inf: TLongintField;
    zqRaya: TZQuery;
    zqInfDatosPuente: TZQuery;
    zqInfDatosPuentecable_babor: TLongintField;
    zqInfDatosPuentecable_estribor: TLongintField;
    zqInfDatosPuenteCapturaBabor: TLongintField;
    zqInfDatosPuenteCapturaEstribor: TLongintField;
    zqDetByCatch: TZQuery;
    zqDatosPuente: TZQuery;
    zqDanio: TZQuery;
    zqDetTallasbanda: TStringField;
    zqDetTallascod_tipo_muestra: TStringField;
    zqDetTallasfecha: TDateField;
    zqDetTallashora: TTimeField;
    zqDetTallasidmarea: TLongintField;
    zqDetTallasnro_ejemplares: TLongintField;
    zqDetTallasnro_lance: TLongintField;
    zqDetTallastalla: TLongintField;
    zqInfDatosPuentecaptura_babor: TFloatField;
    zqInfDatosPuentecaptura_estribor: TFloatField;
    zqInfDatosPuentecod_estado_mar: TLongintField;
    zqInfDatosPuentecomentarios: TStringField;
    zqInfDatosPuentecuadrante_latitud_fin: TStringField;
    zqInfDatosPuentecuadrante_latitud_ini: TStringField;
    zqInfDatosPuentecuadrante_longitud_fin: TStringField;
    zqInfDatosPuentecuadrante_longitud_ini: TStringField;
    zqInfDatosPuentedireccion_viento: TLongintField;
    zqInfDatosPuentefecha: TDateField;
    zqInfDatosPuentegrados_latitud_fin: TLongintField;
    zqInfDatosPuentegrados_latitud_ini: TLongintField;
    zqInfDatosPuentegrados_longitud_fin: TLongintField;
    zqInfDatosPuentegrados_longitud_ini: TLongintField;
    zqInfDatosPuentehora: TTimeField;
    zqInfDatosPuenteidlance: TLongintField;
    zqInfDatosPuenteidmarea: TLongintField;
    zqInfDatosPuentelargo_relinga_inferior: TLongintField;
    zqInfDatosPuentelatitud_fin: TStringField;
    zqInfDatosPuentelatitud_fin_fmt: TStringField;
    zqInfDatosPuentelatitud_ini: TStringField;
    zqInfDatosPuentelatitud_ini_fmt: TStringField;
    zqInfDatosPuentelongitud_fin: TStringField;
    zqInfDatosPuentelongitud_fin_fmt: TStringField;
    zqInfDatosPuentelongitud_ini: TStringField;
    zqInfDatosPuentelongitud_ini_fmt: TStringField;
    zqInfDatosPuentemallero_copo_mm: TLongintField;
    zqInfDatosPuenteminutos_arrastre: TFloatField;
    zqInfDatosPuenteminutos_latitud_fin: TFloatField;
    zqInfDatosPuenteminutos_latitud_ini: TFloatField;
    zqInfDatosPuenteminutos_longitud_fin: TFloatField;
    zqInfDatosPuenteminutos_longitud_ini: TFloatField;
    zqInfDatosPuentenro_lance: TLongintField;
    zqInfDatosPuentenudos_viento: TLongintField;
    zqInfDatosPuenteprofundidad: TLongintField;
    zqInfDatosPuenterinde_comercial_B: TFloatField;
    zqInfDatosPuenterinde_comercial_E: TFloatField;
    zqInfDatosPuenterinde_total_B: TFloatField;
    zqInfDatosPuenterinde_total_E: TFloatField;
    zqInfDatosPuenterumbo: TLongintField;
    zqInfDatosPuentetemperatura_aire: TFloatField;
    zqInfDatosPuentetemperatura_fondo: TFloatField;
    zqInfDatosPuentetemperatura_superficie: TFloatField;
    zqInfDatosPuentetipo_malla: TStringField;
    zqInfDatosPuentevelocidad: TFloatField;
    zqResumenarribo: TDateField;
    zqResumencant_lances: TLargeintField;
    zqResumencant_muestras_bycatch: TLargeintField;
    zqResumencant_muestras_coccion: TLargeintField;
    zqResumencant_muestras_condrictios: TLargeintField;
    zqResumencant_muestras_danio: TLargeintField;
    zqResumencant_muestras_rinde: TLargeintField;
    zqResumencant_muestras_senasa_callo: TLargeintField;
    zqResumencant_muestras_senasa_entera: TLargeintField;
    zqResumencant_muestras_talla_c: TLargeintField;
    zqResumencant_muestras_talla_d: TLargeintField;
    zqResumencant_muestras_talla_r: TLargeintField;
    zqResumencant_muestras_talla_total: TLargeintField;
    zqResumendias_navegacion: TLongintField;
    zqResumendias_pesca: TLargeintField;
    zqResumendias_pesca_bajo_50: TLargeintField;
    zqResumenidmarea: TLongintField;
    zqResumentotal_produccion: TFloatField;
    zqResumenzarpada: TDateField;
    zqRindes: TZQuery;
    zqCoccion: TZQuery;
    zqSenasaEntera: TZQuery;
    zqSenasaCalloscontramuestra1: TLongintField;
    zqSenasaCalloscontramuestra2: TLongintField;
    zqSenasaCalloscuadrante_latitud: TStringField;
    zqSenasaCalloscuadrante_longitud: TStringField;
    zqSenasaCallosfecha: TDateField;
    zqSenasaCalloshora: TTimeField;
    zqSenasaCallosidmarea: TLongintField;
    zqSenasaCallosidmuestras_senasa_callos: TLongintField;
    zqSenasaCalloslab_bsas: TLongintField;
    zqSenasaCalloslab_mdp: TLongintField;
    zqSenasaCalloslatitud: TFloatField;
    zqSenasaCalloslatitud_fmt: TStringField;
    zqSenasaCalloslatitud_fmt1: TStringField;
    zqSenasaCalloslongitud: TFloatField;
    zqSenasaCalloslongitud_fmt: TStringField;
    zqSenasaCalloslongitud_fmt1: TStringField;
    zqSenasaCallosmax_latitud: TFloatField;
    zqSenasaCallosmax_longitud: TFloatField;
    zqSenasaCallosmin_latitud: TFloatField;
    zqSenasaCallosmin_longitud: TFloatField;
    zqSenasaCallosnro_muestra: TLongintField;
    zqSenasaCallosstr_latitud: TStringField;
    zqSenasaCallosstr_latitud1: TStringField;
    zqSenasaCallosstr_longitud: TStringField;
    zqSenasaCallosstr_longitud1: TStringField;
    zqSenasaCallosstr_max_lat: TStringField;
    zqSenasaCallosstr_max_long: TStringField;
    zqSenasaCallosstr_min_lat: TStringField;
    zqSenasaCallosstr_min_long: TStringField;
    zqSenasaEnteracuadrante_latitud: TStringField;
    zqSenasaEnteracuadrante_longitud: TStringField;
    zqSenasaEnterafecha: TDateField;
    zqSenasaEnterahora: TTimeField;
    zqSenasaEnteraidmarea: TLongintField;
    zqSenasaEnteraidmuestras_senasa_entera: TLongintField;
    zqSenasaEnteralab_bsas: TLongintField;
    zqSenasaEnteralab_mdp: TLongintField;
    zqSenasaEnteralatitud: TFloatField;
    zqSenasaEnteralongitud: TFloatField;
    zqSenasaEnteranro_muestra: TLongintField;
    zqSenasaEnteraprofundidad: TLongintField;
    zqSenasaEnteratemp_superficie: TFloatField;
    zqTallas: TZQuery;
    zqDetTallas: TZQuery;
    zqTallasbanda: TStringField;
    zqTallascod_tipo_muestra: TStringField;
    zqTallascomentarios: TStringField;
    zqTallasfecha: TDateField;
    zqTallashora: TTimeField;
    zqTallasidmarea: TLongintField;
    zqTallasminutos_arrastre: TFloatField;
    zqTallasnrolance: TLongintField;
    zqTallaspeso_muestra_captura: TFloatField;
    zqTallaspeso_muestra_captura_comercial: TFloatField;
    zqTallaspeso_muestra_captura_no_comercial: TFloatField;
    zqTallaspeso_total_produccion: TFloatField;
    zqTallasporcent_bolsa_captura: TFloatField;
    zqSenasaCallos: TZQuery;
    zqInfMuestrasBiol: TZQuery;
    zqResumen: TZQuery;
    procedure acGuardarPlanillasExecute(Sender: TObject);
    procedure acImprimirDatosPuenteExecute(Sender: TObject);
    procedure acImprimirMuestrasBiolExecute(Sender: TObject);
    procedure acImprimirSenasaExecute(Sender: TObject);
    procedure ckPlanillasChange(Sender: TObject);
    procedure dedCarpetaPlanillasAcceptDirectory(Sender: TObject;
      var Value: String);
    procedure dedCarpetaPlanillasChange(Sender: TObject);
    procedure dedCarpetaPlanillasExit(Sender: TObject);
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frrDatosPuenteProgress(n: Integer);
    procedure frrMuestrasBiolProgress(n: Integer);
    procedure frrPDFProgress(n: Integer);
    procedure frrSenasaProgress(n: Integer);
    procedure gbResumenClick(Sender: TObject);
    procedure zqByCatchBeforeOpen(DataSet: TDataSet);
    procedure zqCoccionBeforeOpen(DataSet: TDataSet);
    procedure zqDanioBeforeOpen(DataSet: TDataSet);
    procedure zqDatosPuenteBeforeOpen(DataSet: TDataSet);
    procedure zqDetByCatchBeforeOpen(DataSet: TDataSet);
    procedure zqInfDatosPuenteBeforeOpen(DataSet: TDataSet);
    procedure zqInfDatosPuenteCalcFields(DataSet: TDataSet);
    procedure zqInfMuestrasBiolBeforeOpen(DataSet: TDataSet);
    procedure zqRayaBeforeOpen(DataSet: TDataSet);
    procedure zqResumenBeforeOpen(DataSet: TDataSet);
    procedure zqRindesBeforeOpen(DataSet: TDataSet);
    procedure zqSenasaCallosBeforeOpen(DataSet: TDataSet);
    procedure zqSenasaCallosCalcFields(DataSet: TDataSet);
    procedure zqSenasaEnteraBeforeOpen(DataSet: TDataSet);
    procedure zqTallasAfterScroll(DataSet: TDataSet);
    procedure zqTallasBeforeOpen(DataSet: TDataSet);
    procedure ZQuery3BeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
    procedure GenerarDatosPuenteXLS;
    procedure GenerarRindesXLS;
    procedure GenerarCoccionXLS;
    procedure GenerarTallasXLS;
    procedure GenerarDanioXLS;
    procedure GenerarByCatchXLS;
    procedure GenerarByCatch2XLS;
    procedure GenerarByCatch3XLS;
    procedure GenerarRayaXLS;

    procedure GenerarDatosPuentePDF;
    procedure GenerarSenasaPDF;
    procedure GenerarMuestrasBiolPDF;

    function InicializarArchivoExcelTallas (var xls: olevariant; numero: integer; forzar_reemplazo: boolean = False): boolean;

  public
    { public declarations }
  end;

var
  fmInformes: TfmInformes;
  strfecha: string = '';

implementation


{$R *.lfm}

{ TfmInformes }

procedure TfmInformes.acGuardarPlanillasExecute(Sender: TObject);
var
  xls, odf: olevariant;
  gen_ok:boolean;
  archivo_zip, archivo_datos_puente, archivo_rindes, archivo_coccion, archivo_tallas,
    archivo_danio, archivo_bycatch, archivo_rayas: WideString;
begin
  // Guardo la selección de planillas a guardar
  dmGeneral.GuardarBooleanConfig('DatosPuente', cbDatosPuente.Checked, 'PlanillasInforme');
  dmGeneral.GuardarBooleanConfig('Rinde', cbRindes.Checked, 'PlanillasInforme');
  dmGeneral.GuardarBooleanConfig('Talla', cbTallas.Checked, 'PlanillasInforme');

  if not dtFecha.Checked then
  begin
    dmGeneral.GuardarBooleanConfig('Coccion', cbCoccion.Checked, 'PlanillasInforme');
    dmGeneral.GuardarBooleanConfig('Danio', cbDanio.Checked, 'PlanillasInforme');
    dmGeneral.GuardarBooleanConfig('Raya', cbCondrictios.Checked, 'PlanillasInforme');
    dmGeneral.GuardarBooleanConfig('ByCatch', cbByCatch.Checked, 'PlanillasInforme');
    dmGeneral.GuardarBooleanConfig('DatosPuentePDF', cbDatosPuentePDF.Checked, 'PlanillasInforme');
    dmGeneral.GuardarBooleanConfig('SenasaPDF', cbSenasaPDF.Checked, 'PlanillasInforme');
    dmGeneral.GuardarBooleanConfig('BiologicasPDF', cbMuestrasBiolPDF.Checked, 'PlanillasInforme');
  end;

  try
    xls := CreateOleObject('Excel.Application');
  except
    //try
    //  odf := CreateOleObject('com.sun.star.ServiceManager');
    //except
      MessageDlg('No se puede abrir la aplicación Hojas de Cálculo, o la misma no está instalada', mtError, [mbClose], 0);
      Exit;
    //end;
  end;

  gen_ok:=False;
  if dedCarpetaPlanillas.Directory <> '' then
  begin
    if xls<>Null then
    begin
      if cbDatosPuente.Checked then
        GenerarDatosPuenteXLS;
      if cbRindes.Checked then
        GenerarRindesXLS;
      if cbCoccion.Checked then
        GenerarCoccionXLS;
      if cbTallas.Checked then
        GenerarTallasXLS;
      if cbDanio.Checked then
        GenerarDanioXLS;
      if cbByCatch.Checked then
      begin
        //GenerarByCatchXLS;
        //GenerarByCatch2XLS; //La muestra detallada no se requiere por ahora
        GenerarByCatch3XLS; //Formato de planillas 2023

      end;
      if cbCondrictios.Checked then
      begin
        GenerarRayaXLS;
      end;

      if cbDatosPuentePDF.Checked then
      begin
        GenerarDatosPuentePDF;
      end;
      if cbSenasaPDF.Checked then
      begin
        GenerarSenasaPDF;
      end;
      if cbMuestrasBiolPDF.Checked then
      begin
        GenerarMuestrasBiolPDF;
      end;

      gen_ok:=True;


    end;

    //Está guardando las planillas para una fecha específica,
    //Comprimir en ZIP
    if dtFecha.Checked then
    begin
      archivo_zip:=dedCarpetaPlanillas.Directory +
        DirectorySeparator+strfecha+'Reporte diario.zip';

      archivo_datos_puente := dedCarpetaPlanillas.Directory +
        DirectorySeparator + strfecha + 'Datos puente.xls';
      archivo_rindes := dedCarpetaPlanillas.Directory +
        DirectorySeparator + strfecha + 'Rindes.xls';
      archivo_coccion := dedCarpetaPlanillas.Directory +
        DirectorySeparator + strfecha + 'Cocción.xls';
      archivo_tallas := dedCarpetaPlanillas.Directory +
        DirectorySeparator + strfecha + 'Tallas.xls';
      archivo_danio := dedCarpetaPlanillas.Directory +
        DirectorySeparator + strfecha + 'Daño valvar.xls';
      archivo_bycatch := dedCarpetaPlanillas.Directory +
        DirectorySeparator + strfecha + 'Fauna acompañante.xls';
      archivo_rayas := dedCarpetaPlanillas.Directory +
        DirectorySeparator + strfecha + 'Rayas.xls';

      if (not FileExistsUTF8(archivo_zip)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_zip+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
      begin
         DeleteFileUTF8(archivo_zip);
         azPlanillas.BaseDirectory:=dedCarpetaPlanillas.Directory;
         azPlanillas.FileName:=archivo_zip;

         //Agrego los archivos
         if FileExistsUTF8(archivo_datos_puente) then
            azPlanillas.AddFiles(UTF8Decode(archivo_datos_puente),0);

         if FileExistsUTF8(archivo_rindes) then
            azPlanillas.AddFiles(UTF8Decode(archivo_rindes),0);

         if FileExistsUTF8(archivo_coccion) then
            azPlanillas.AddFiles(UTF8Decode(archivo_coccion),0);

         if FileExistsUTF8(archivo_tallas) then
            azPlanillas.AddFiles(UTF8Decode(archivo_tallas),0);

         if FileExistsUTF8(archivo_danio) then
            azPlanillas.AddFiles(UTF8Decode(archivo_danio),0);

         if FileExistsUTF8(archivo_bycatch) then
            azPlanillas.AddFiles(UTF8Decode(archivo_bycatch),0);

         if FileExistsUTF8(archivo_rayas) then
            azPlanillas.AddFiles(UTF8Decode(archivo_rayas),0);
      end;

      //Borro los archivos porque ya no se necesitan
      if FileExistsUTF8(archivo_datos_puente) then
         DeleteFileUTF8(archivo_datos_puente);
      if FileExistsUTF8(archivo_rindes) then
         DeleteFileUTF8(archivo_rindes);
      if FileExistsUTF8(archivo_coccion) then
         DeleteFileUTF8(archivo_coccion);
      if FileExistsUTF8(archivo_tallas) then
         DeleteFileUTF8(archivo_tallas);
      if FileExistsUTF8(archivo_danio) then
         DeleteFileUTF8(archivo_danio);
      if FileExistsUTF8(archivo_bycatch) then
         DeleteFileUTF8(archivo_bycatch);
      if FileExistsUTF8(archivo_rayas) then
         DeleteFileUTF8(archivo_rayas);

      azPlanillas.CloseArchive;
    end;

    if gen_ok and (MessageDlg('Las planillas han sido guaradas en la carpeta indicada. ¿Desea abrir la carpeta para ver los archivos?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      {$IFDEF MSWINDOWS}
        ShellExecute(Handle, 'open', PChar(dedCarpetaPlanillas.Directory), nil, nil, SW_SHOWNORMAL)
      {$ENDIF}
      {$IFDEF UNIX}
        Shell(format('gv %s',[ExpandFileNameUTF8(dedCarpetaPlanillas.Directory)]));
      {$ENDIF}
    end;
  end;
end;

procedure TfmInformes.acImprimirDatosPuenteExecute(Sender: TObject);
begin
  zqInfDatosPuente.Close;
  zqInfDatosPuente.Open;
  frrDatosPuente.ShowReport;
end;

procedure TfmInformes.acImprimirMuestrasBiolExecute(Sender: TObject);
begin
  zqInfMuestrasBiol.Close;
  zqInfMuestrasBiol.Open;
  frrMuestrasBiol.ShowReport;
end;

procedure TfmInformes.acImprimirSenasaExecute(Sender: TObject);
begin
  zqSenasaCallos.Close;
  zqSenasaCallos.Open;
  zqSenasaEntera.Close;
  zqSenasaEntera.Open;
  frrSenasa.ShowReport;
end;

procedure TfmInformes.ckPlanillasChange(Sender: TObject);
begin
  acGuardarPlanillas.Enabled :=
    (cbDatosPuente.Checked or cbRindes.Checked or cbCoccion.Checked or
    cbTallas.Checked or cbDanio.Checked or cbByCatch.Checked or cbCondrictios.Checked
    or cbDatosPuentePDF.Checked or cbSenasaPDF.Checked or cbMuestrasBiolPDF.Checked);
end;

procedure TfmInformes.dedCarpetaPlanillasAcceptDirectory(Sender: TObject;
  var Value: String);
begin
  dmGeneral.GuardarStringConfig('destino_informes', dedCarpetaPlanillas.Directory);
//  LSSaveConfig(['destino_informes'],[dedCarpetaPlanillas.Directory]);
end;

procedure TfmInformes.dedCarpetaPlanillasChange(Sender: TObject);
begin
  dmGeneral.GuardarStringConfig('destino_informes', dedCarpetaPlanillas.Directory);
//  LSSaveConfig(['destino_informes'],[dedCarpetaPlanillas.Directory]);
end;

procedure TfmInformes.dedCarpetaPlanillasExit(Sender: TObject);
begin
  dmGeneral.GuardarStringConfig('destino_informes', dedCarpetaPlanillas.Directory);
//  LSSaveConfig(['destino_informes'],[dedCarpetaPlanillas.Directory]);
end;

procedure TfmInformes.dtFechaChange(Sender: TObject);
begin
      if dtFecha.Checked then
       strfecha:=FormatDateTime('YYYY-mm-dd',dtFecha.Date)+'-'
    else
       strfecha:='';

end;

procedure TfmInformes.dtFechaCheckBoxChange(Sender: TObject);
begin
    if dtFecha.Checked then
    begin
       strfecha:=FormatDateTime('YYYY-mm-dd',dtFecha.Date)+'-';
       cbCoccion.Checked:=false;
       cbCoccion.Enabled:=false;
       cbDanio.Checked:=false;
       cbDanio.Enabled:=false;
       cbCondrictios.Checked:=false;
       cbCondrictios.Enabled:=false;
       cbByCatch.Checked:=false;
       cbByCatch.Enabled:=false;
       cbDatosPuentePDF.Checked:=false;
       cbDatosPuentePDF.Enabled:=false;
       cbSenasaPDF.Checked:=false;
       cbSenasaPDF.Enabled:=false;
       cbMuestrasBiolPDF.Checked:=false;
       cbMuestrasBiolPDF.Enabled:=false;
    end
    else
    begin
       strfecha:='';
       cbCoccion.Checked:=dmGeneral.LeerBooleanConfig('Coccion', False, 'PlanillasInforme');
       cbCoccion.Enabled:=True;
       cbDanio.Checked:=dmGeneral.LeerBooleanConfig('Danio', True, 'PlanillasInforme');
       cbDanio.Enabled:=True;
       cbCondrictios.Checked:=dmGeneral.LeerBooleanConfig('Raya', True, 'PlanillasInforme');
       cbCondrictios.Enabled:=True;
       cbByCatch.Checked:=dmGeneral.LeerBooleanConfig('ByCatch', True, 'PlanillasInforme');
       cbByCatch.Enabled:=True;
       cbDatosPuentePDF.Checked:=dmGeneral.LeerBooleanConfig('DatosPuentePDF', True, 'PlanillasInforme');
       cbDatosPuentePDF.Enabled:=True;
       cbSenasaPDF.Checked:=dmGeneral.LeerBooleanConfig('SenasaPDF', True, 'PlanillasInforme');
       cbSenasaPDF.Enabled:=True;
       cbMuestrasBiolPDF.Checked:=dmGeneral.LeerBooleanConfig('BiologicasPDF', True, 'PlanillasInforme');
       cbMuestrasBiolPDF.Enabled:=True;

 end;
end;

procedure TfmInformes.FormShow(Sender: TObject);
var
  destino:String;
begin
  cbDatosPuente.Checked:=dmGeneral.LeerBooleanConfig('DatosPuente', True, 'PlanillasInforme');
  cbCoccion.Checked:=dmGeneral.LeerBooleanConfig('Coccion', False, 'PlanillasInforme');
  cbDanio.Checked:=dmGeneral.LeerBooleanConfig('Danio', True, 'PlanillasInforme');
  cbCondrictios.Checked:=dmGeneral.LeerBooleanConfig('Raya', True, 'PlanillasInforme');
  cbRindes.Checked:=dmGeneral.LeerBooleanConfig('Rinde', True, 'PlanillasInforme');
  cbTallas.Checked:=dmGeneral.LeerBooleanConfig('Talla', True, 'PlanillasInforme');
  cbByCatch.Checked:=dmGeneral.LeerBooleanConfig('ByCatch', True, 'PlanillasInforme');
  cbDatosPuentePDF.Checked:=dmGeneral.LeerBooleanConfig('DatosPuentePDF', True, 'PlanillasInforme');
  cbSenasaPDF.Checked:=dmGeneral.LeerBooleanConfig('SenasaPDF', True, 'PlanillasInforme');
  cbMuestrasBiolPDF.Checked:=dmGeneral.LeerBooleanConfig('BiologicasPDF', True, 'PlanillasInforme');

  dtFecha.Date:=IncDay(Date,-1);

  destino:= dmGeneral.LeerStringConfig('destino_informes', '');
//  LSLoadConfig(['destino_informes'],[destino],[@destino]);
  {$IFDEF MSWINDOWS}
  if destino='' then
     destino:=GetWindowsSpecialDir(CSIDL_PERSONAL);
  {$ENDIF}
  dedCarpetaPlanillas.Directory := destino;
  //Completo los datos del StringGrid
  with zqResumen do
  begin
    Close;
    Open;
    if RecordCount>0 then
    begin
      sgResumen.Cells[1,0]:=FieldByName('zarpada').AsString;
      sgResumen.Cells[1,1]:=FieldByName('arribo').AsString;
      sgResumen.Cells[1,2]:=FieldByName('dias_navegacion').AsString;
      sgResumen.Cells[1,3]:=FieldByName('dias_pesca').AsString;
      sgResumen.Cells[1,4]:=FieldByName('dias_pesca_bajo_50').AsString;
      sgResumen.Cells[1,5]:=FieldByName('cant_lances').AsString;
      sgResumen.Cells[1,6]:=FieldByName('cant_muestras_senasa_callo').AsString;
      sgResumen.Cells[1,7]:=FieldByName('cant_muestras_senasa_entera').AsString;
      sgResumen.Cells[1,8]:=FieldByName('cant_muestras_talla_c').AsString;
      sgResumen.Cells[1,9]:=FieldByName('cant_muestras_talla_r').AsString;
      sgResumen.Cells[1,10]:=FieldByName('cant_muestras_talla_d').AsString;
      sgResumen.Cells[1,11]:=FieldByName('cant_muestras_talla_total').AsString;
      sgResumen.Cells[1,12]:=FieldByName('cant_muestras_rinde').AsString;
      //Esto se saca porque ya no se realizan muestras de cocción
      //sgResumen.Cells[1,13]:=FieldByName('cant_muestras_coccion').AsString;
      sgResumen.Cells[1,13]:=FieldByName('cant_muestras_bycatch').AsString;
      sgResumen.Cells[1,14]:=FieldByName('cant_muestras_danio').AsString;
      sgResumen.Cells[1,15]:=FieldByName('cant_muestras_condrictios').AsString;
//      sgResumen.Cells[1,16]:=FieldByName('total_produccion').AsString;
      sgResumen.Cells[1,16]:=FormatFloat('#,##0.00 Kg',FieldByName('total_produccion').AsFloat);
    end;
  end;
end;

procedure TfmInformes.frrDatosPuenteProgress(n: Integer);
begin
  pbProceso.Position:=zqInfDatosPuente.RecNo;
  Application.ProcessMessages;
end;

procedure TfmInformes.frrMuestrasBiolProgress(n: Integer);
begin
  pbProceso.Position:=zqInfMuestrasBiol.RecNo;
  Application.ProcessMessages;
end;

procedure TfmInformes.frrPDFProgress(n: Integer);
begin
end;

procedure TfmInformes.frrSenasaProgress(n: Integer);
begin
  pbProceso.Position:=zqSenasaEntera.RecNo;
  Application.ProcessMessages;
end;

procedure TfmInformes.gbResumenClick(Sender: TObject);
begin

end;

procedure TfmInformes.zqByCatchBeforeOpen(DataSet: TDataSet);
begin
  zqByCatch.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;

    if dtFecha.Checked then
       zqByCatch.ParamByName('fecha').AsDateTime:=dtFecha.Date
    else
      zqByCatch.ParamByName('fecha').AsString:='';

end;

procedure TfmInformes.zqCoccionBeforeOpen(DataSet: TDataSet);
begin
  zqCoccion.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;

    if dtFecha.Checked then
       zqCoccion.ParamByName('fecha').AsDateTime:=dtFecha.Date
    else
      zqCoccion.ParamByName('fecha').AsString:='';
end;

procedure TfmInformes.zqDanioBeforeOpen(DataSet: TDataSet);
begin
  zqDanio.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;

    if dtFecha.Checked then
       zqDanio.ParamByName('fecha').AsDateTime:=dtFecha.Date
    else
      zqDanio.ParamByName('fecha').AsString:='';
end;

procedure TfmInformes.zqDatosPuenteBeforeOpen(DataSet: TDataSet);
begin
  zqDatosPuente.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;

  if dtFecha.Checked then
     zqDatosPuente.ParamByName('fecha').AsDateTime:=dtFecha.Date
  else
    zqDatosPuente.ParamByName('fecha').AsString:='';

end;

procedure TfmInformes.zqDetByCatchBeforeOpen(DataSet: TDataSet);
begin
  zqDetByCatch.ParamByName('idmuestras_bycatch').Value := zqByCatch.FieldByName('idmuestras_bycatch').Value;
end;

procedure TfmInformes.zqInfDatosPuenteBeforeOpen(DataSet: TDataSet);
begin
  zqInfDatosPuente.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
end;

procedure TfmInformes.zqInfDatosPuenteCalcFields(DataSet: TDataSet);
begin
  if not zqInfDatosPuentecaptura_estribor.IsNull then
     zqInfDatosPuenteCapturaEstribor.AsInteger:=round(zqInfDatosPuentecaptura_estribor.Value*100);
  if not zqInfDatosPuentecaptura_babor.IsNull then
     zqInfDatosPuenteCapturaBabor.AsInteger:=round(zqInfDatosPuentecaptura_babor.Value*100);

  if not zqInfDatosPuentelatitud_ini.IsNull then
     zqInfDatosPuentelatitud_ini_inf.AsInteger:=round(zqInfDatosPuentelatitud_ini.AsFloat*100);
  if not zqInfDatosPuentelongitud_ini.IsNull then
     zqInfDatosPuentelongitud_ini_inf.AsInteger:=round(zqInfDatosPuentelongitud_ini.AsFloat*100);
  if not zqInfDatosPuentelatitud_fin.IsNull then
     zqInfDatosPuentelatitud_fin_inf.AsInteger:=round(zqInfDatosPuentelatitud_fin.AsFloat*100);
  if not zqInfDatosPuentelongitud_fin.IsNull then
     zqInfDatosPuentelongitud_fin_inf.AsInteger:=round(zqInfDatosPuentelongitud_fin.AsFloat*100);
end;

procedure TfmInformes.zqInfMuestrasBiolBeforeOpen(DataSet: TDataSet);
begin
  zqInfMuestrasBiol.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
end;

procedure TfmInformes.zqRayaBeforeOpen(DataSet: TDataSet);
begin
  zqRaya.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;

    if dtFecha.Checked then
       zqRaya.ParamByName('fecha').AsDateTime:=dtFecha.Date
    else
      zqRaya.ParamByName('fecha').AsString:='';
end;

procedure TfmInformes.zqResumenBeforeOpen(DataSet: TDataSet);
begin
  zqResumen.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
end;

procedure TfmInformes.zqRindesBeforeOpen(DataSet: TDataSet);
begin
  zqRindes.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;

    if dtFecha.Checked then
       zqRindes.ParamByName('fecha').AsDateTime:=dtFecha.Date
    else
      zqRindes.ParamByName('fecha').AsString:='';
end;

procedure TfmInformes.zqSenasaCallosBeforeOpen(DataSet: TDataSet);
begin
  zqSenasaCallos.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmInformes.zqSenasaCallosCalcFields(DataSet: TDataSet);
begin
  zqSenasaCallosstr_min_lat.Value:=FormatFloat('00º 00´', zqSenasaCallosmin_latitud.Value);
  zqSenasaCallosstr_max_lat.Value:=FormatFloat('00º 00´', zqSenasaCallosmax_latitud.Value);
  zqSenasaCallosstr_min_long.Value:=FormatFloat('00º 00´', zqSenasaCallosmin_longitud.Value);
  zqSenasaCallosstr_max_long.Value:=FormatFloat('00º 00´', zqSenasaCallosmax_longitud.Value);
end;

procedure TfmInformes.zqSenasaEnteraBeforeOpen(DataSet: TDataSet);
begin
  zqSenasaEntera.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
end;

procedure TfmInformes.zqTallasAfterScroll(DataSet: TDataSet);
begin
  zqDetTallas.Close;
  zqDetTallas.ParamByName('idmarea').Value := zqTallasidmarea.Value;
  zqDetTallas.ParamByName('fecha').AsDateTime := zqTallasfecha.AsDateTime;
  zqDetTallas.ParamByName('hora').AsString := zqTallashora.AsString;
  if zqTallascod_tipo_muestra.AsString <> 'C' then
  begin
    zqDetTallas.ParamByName('cod_tipo_muestra').AsString := zqTallascod_tipo_muestra.AsString;
    zqDetTallas.ParamByName('banda').AsString := zqTallasbanda.AsString;
  end else
  begin
    zqDetTallas.ParamByName('cod_tipo_muestra').AsString := '';
    zqDetTallas.ParamByName('banda').AsString := '';
  end;
  zqDetTallas.Open;
end;

procedure TfmInformes.zqTallasBeforeOpen(DataSet: TDataSet);
begin
  zqTallas.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;

    if dtFecha.Checked then
       zqTallas.ParamByName('fecha').AsDateTime:=dtFecha.Date
    else
      zqTallas.ParamByName('fecha').AsString:='';
end;

procedure TfmInformes.ZQuery3BeforeOpen(DataSet: TDataSet);
begin
end;

procedure TfmInformes.GenerarDatosPuenteXLS;
const
  ////Fuente: https://www.clubdelphi.com/foros/showthread.php?t=40405
  ////--------- Bordes de las Celdas -------------------------------------------
  //  xlEdgeLeft         = $00000007; // ( 7) Izquierdo
  //  xlEdgeTop          = $00000008; // ( 8) Superior
  //  xlEdgeBottom       = $00000009; // ( 9) Inferior
  //  xlEdgeRight        = $0000000A; // (10) Derecho
  //  xlInsideVertical   = $0000000B; // (11) Vertical Interior
  //  xlInsideHorizontal = $0000000C; // (12) Horizontal Interior
  //  //--------- Tipo de línea en bordes de Celdas ------------------------------
  //  xlContinuous = $00000001; // ( 1) Continua
  //  xlNone       = $FFFFEFD2; // (-4142) Ningúna línea
  //  //--------- Grosores en bordes de Celdas -----------------------------------
  //  xlThin   = $00000002; // ( 2) Fino
  //  xlMedium = $00000003; // ( 3) Medio
  xlContinuous = 1;
  xlVAlignCenter = -4108;
  xlEdgeTop = 8;
  xlEdgeBottom = 9;
  xlDouble = -4119;
  xlThin = 2;
  xlMedium = 3;
  xlThick = 4;
  xl3DColumn = -4100;
  xlColumns = 2;

Const xlLocationAsObject = 2;
var
  xls: olevariant;
  archivo_origen, archivo_destino, tmp: WideString;
  fila, columna, i: integer;
  relinga: integer;
  ult_fecha: TDate;
begin
  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar le Excel al terminar
  try
    archivo_origen := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'Datos puente_2022.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + strfecha + 'Datos puente.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      xls.Workbooks.Open(archivo_destino);
      //Pongo los datos de la marea
      tmp := UTF8Decode(dmGeneral.zqMareaActivaMareaStr.AsString);
      xls.Cells[1, 3] := tmp;
      tmp := UTF8Decode(dmGeneral.zqMareaActivacapitan.AsString);
      xls.Cells[2, 3] := tmp;
      tmp := UTF8Decode(dmGeneral.zqMareaActivaobservador.AsString);
      xls.Cells[4, 3] := tmp;

      //Inicializo la última fecha en un valor inexistente
      ult_fecha := NullDate;

      with zqDatosPuente do
      begin
        Close;
        Open;
        First;
        relinga:=0;
        //Configuro la barra de progreso
        pbProceso.Max := RecordCount;
        pbProceso.Position := 0;
        laProceso.Caption:='Procesando datos de puente';
        pbProceso.Visible := True;
        Fila := 8;//Arranco en la fila 6 porque antes están los títulos
        while not EOF do
        begin
          if (relinga=0) and (FieldByName('largo_relinga_inferior').AsInteger>0) then
          begin
             relinga:=FieldByName('largo_relinga_inferior').AsInteger;
             xls.Cells[3,3] := relinga;
          end;
          xls.Cells[fila, 1] := FieldByName('fecha').AsDateTime;
          xls.Cells[fila, 2] := FieldByName('hora').AsDateTime;
          xls.Cells[fila, 3] := FieldByName('nro_lance').AsInteger;
          if not FieldByName('latitud_ini').IsNull then
             xls.Cells[fila, 4] := FieldByName('latitud_ini').AsFloat*100;
          if not FieldByName('longitud_ini').IsNull then
             xls.Cells[fila, 5] := FieldByName('longitud_ini').AsFloat*100;
          if not FieldByName('rumbo').IsNull then
             xls.Cells[fila, 6] := FieldByName('rumbo').AsInteger;
          if not FieldByName('profundidad').IsNull then
             xls.Cells[fila, 7] := FieldByName('profundidad').AsInteger;
          if not FieldByName('cable_estribor').IsNull then
             xls.Cells[fila, 8] := FieldByName('cable_estribor').AsInteger;
          if not FieldByName('cable_babor').IsNull then
             xls.Cells[fila, 9] := FieldByName('cable_babor').AsInteger;
          if not FieldByName('minutos_arrastre').IsNull then
             xls.Cells[fila, 10] := FieldByName('minutos_arrastre').AsFloat;
          if not FieldByName('latitud_fin').IsNull then
             xls.Cells[fila, 11] := FieldByName('latitud_fin').AsFloat*100;
          if not FieldByName('longitud_fin').IsNull then
             xls.Cells[fila, 12] := FieldByName('longitud_fin').AsFloat*100;
          if not FieldByName('captura_estribor').IsNull then
             xls.Cells[fila, 13] := FieldByName('captura_estribor').AsFloat;
          if not FieldByName('captura_babor').IsNull then
             xls.Cells[fila, 14] := FieldByName('captura_babor').AsFloat;
          if not FieldByName('velocidad').IsNull then
             xls.Cells[fila, 15] := FieldByName('velocidad').AsFloat;
          if not FieldByName('rinde_total_e').IsNull then
             xls.Cells[fila, 16] := FieldByName('rinde_total_e').AsFloat;
          if not FieldByName('rinde_total_b').IsNull then
             xls.Cells[fila, 17] := FieldByName('rinde_total_b').AsFloat;
          if not FieldByName('rinde_comercial_e').IsNull then
             xls.Cells[fila, 18] := FieldByName('rinde_comercial_e').AsFloat;
          if not FieldByName('rinde_comercial_b').IsNull then
             xls.Cells[fila, 19] := FieldByName('rinde_comercial_b').AsFloat;
          // Dibujo una línea de división en cada cambio de fecha
          if ((ult_fecha = NullDate) OR (FieldByName('fecha').AsDateTime <> ult_fecha))  then
          begin
               for i := 1 to 22 do
               begin
                 xls.Cells[fila, i].Borders.Item[xlEdgeTop].Linestyle := xlContinuous;
                 xls.Cells[fila, i].Borders.Item[xlEdgeTop].Weight := xlThin;
               end;
          end;

          // Sólo imprimo la producción la primera vez en cada cambio de fecha
          if ((not FieldByName('produccion').IsNull)
             and ((ult_fecha = NullDate) OR (FieldByName('fecha').AsDateTime <> ult_fecha)))  then
          begin
               xls.Cells[fila, 20] := FieldByName('produccion').AsFloat;
          end;

          ult_fecha := FieldByName('fecha').AsDateTime;

          if not FieldByName('comentarios').IsNull then
          begin
            tmp := UTF8Decode(FieldByName('comentarios').AsString);
            xls.Cells[fila, 21] := tmp;
          end;
          //if not FieldByName('temperatura_superficie').IsNull then
          //   xls.Cells[fila, 21] := FieldByName('temperatura_superficie').AsFloat;
          //if not FieldByName('temperatura_aire').IsNull then
          //   xls.Cells[fila, 23] := FieldByName('temperatura_aire').AsFloat;
          //if not FieldByName('temperatura_fondo').IsNull then
          //   xls.Cells[fila, 24] := FieldByName('temperatura_fondo').AsFloat;
          if not FieldByName('cod_estado_mar').IsNull then
             xls.Cells[fila, 22] := FieldByName('cod_estado_mar').AsInteger;
          //if not FieldByName('direccion_viento').IsNull then
          //   xls.Cells[fila, 26] := FieldByName('direccion_viento').AsInteger;
          //if not FieldByName('nudos_viento').IsNull then
          //   xls.Cells[fila, 27] := FieldByName('nudos_viento').AsFloat;
          pbProceso.Position := RecNo;
          Application.ProcessMessages;
          Next;
          Inc(fila);
        end;
        xls.ActiveWorkBook.Save;
      end;
    end;
  finally
    laProceso.Caption:='';
    pbProceso.Visible := False;
    xls.Quit;
    xls := Unassigned;
  end;
end;

procedure TfmInformes.GenerarRindesXLS;
var
  xls: olevariant;
  archivo_origen, archivo_destino, tmp: WideString;
  fila, columna: integer;
begin
  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar le Excel al terminar
  try
    archivo_origen := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'Rindes_2022.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + strfecha + 'Rindes.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      xls.Workbooks.Open(archivo_destino);
      //Pongo los datos de la marea
      tmp := UTF8Decode(dmGeneral.zqMareaActivaobservador.AsString);
      xls.Cells[1, 2] := tmp;
      tmp := UTF8Decode(dmGeneral.zqMareaActivaMareaStr.AsString);
      xls.Cells[2, 2] := tmp;
      with zqRindes do
      begin
        Close;
        Open;
        First;
        //Configuro la barra de progreso
        pbProceso.Max := RecordCount;
        pbProceso.Position := 0;
        laProceso.Caption:='Procesando muestras de rinde';
        pbProceso.Visible := True;
        Fila := 6;//Arranco en la fila 4 porque antes están los títulos
        //Columnas: 1: Fecha, 2: Lance (Nro y banda), 3: Comenrcial, 4: No comercial, 5:Acompañante, 9: Observaciones
        while not EOF do
        begin
          xls.Cells[fila, 1] := FieldByName('fecha').AsDateTime;
          tmp := UTF8Decode(FieldByName('lance_banda').AsString);
          xls.Cells[fila, 2] := tmp;
          xls.Cells[fila, 3] := FieldByName('peso_comercial').AsFloat;
          xls.Cells[fila, 4] := FieldByName('peso_no_comercial').AsFloat;
          xls.Cells[fila, 5] := FieldByName('peso_fauna_acomp').AsFloat;
          //Pongo también las fórmulas
          tmp := UTF8Decode(Format('=(C%d+D%d+E%d)',[fila,fila,fila]));
          xls.Cells[fila, 6] := tmp;
          tmp := UTF8Decode(Format('=((C%d+D%d)*100)/F%d',[fila,fila,fila]));
          xls.Cells[fila, 7] := tmp;
          tmp := UTF8Decode(Format('=(C%d*100)/F%d',[fila,fila]));
          xls.Cells[fila, 8] := tmp;
          tmp := UTF8Decode(FieldByName('comentarios').AsString);
          xls.Cells[fila, 9] := tmp;
          pbProceso.Position := RecNo;
          Application.ProcessMessages;
          Next;
          Inc(fila);
        end;
        xls.ActiveWorkBook.Save;
      end;
    end;
  finally
    laProceso.Caption:='';
    pbProceso.Visible := False;
    xls.Quit;
    xls := Unassigned;
  end;
end;

procedure TfmInformes.GenerarCoccionXLS;
var
  xls: olevariant;
  archivo_origen, archivo_destino, tmp: WideString;
  fila, columna: integer;
begin
  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar le Excel al terminar
  try
    archivo_origen := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'Cocción.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + strfecha + 'Cocción.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      xls.Workbooks.Open(archivo_destino);
      //Pongo los datos de la marea
      tmp := UTF8Decode(dmGeneral.zqMareaActivaMareaStr.AsString);
      xls.Cells[1, 2] := tmp;
      with zqCoccion do
      begin
        Close;
        Open;
        First;
        //Configuro la barra de progreso
        pbProceso.Max := RecordCount;
        pbProceso.Position := 0;
        laProceso.Caption:='Procesando muestras de cocción';
        pbProceso.Visible := True;
        Fila := 5;//Arranco en la fila 5 porque antes están los títulos
        while not EOF do
        begin
          xls.Cells[fila, 1] := FieldByName('fecha').AsDateTime;
          xls.Cells[fila, 2] := FieldByName('hora').AsDateTime;
          tmp := UTF8Decode(FieldByName('lance_banda').AsString);
          xls.Cells[fila, 3] := tmp;
          xls.Cells[fila, 4] := FieldByName('antes_valvas_vacias').AsInteger;
          xls.Cells[fila, 5] := FieldByName('antes_vivos').AsInteger;
          tmp := UTF8Decode(Format('=(D%d*100)/(D%d+E%d)',[fila,fila,fila]));
          xls.Cells[fila, 6] := tmp;
          xls.Cells[fila, 7] := FieldByName('despues_valvas_vacias').AsInteger;
          xls.Cells[fila, 8] := FieldByName('despues_carnes').AsInteger;
          tmp := UTF8Decode(Format('=G%d*(100-F%d)/100',[fila,fila]));
          xls.Cells[fila, 9] := tmp;
          tmp := UTF8Decode(Format('=(H%d*100)/I%d',[fila,fila]));
          xls.Cells[fila, 10] := tmp;
          tmp := UTF8Decode(FieldByName('comentarios').AsString);
          xls.Cells[fila, 11] := tmp;
          pbProceso.Position := RecNo;
          Application.ProcessMessages;
          Next;
          Inc(fila);
        end;
        xls.ActiveWorkBook.Save;
      end;
    end;
  finally
    laProceso.Caption:='';
    pbProceso.Visible := False;
    xls.Quit;
    xls := Unassigned;
  end;
end;

function TfmInformes.InicializarArchivoExcelTallas(var xls: olevariant;
  numero: integer; forzar_reemplazo: boolean = False): boolean;
var
    archivo_origen, archivo_destino, tmp: WideString;
    subfijo: string = '';
begin
  if numero > 1 then
  begin
    subfijo := '('+IntToStr(numero)+')';
  end;
  archivo_origen := ExtractFilePath(Application.ExeName) +
    'PlanillasExcel' + DirectorySeparator + 'Tallas_2022.xls';
  archivo_destino := dedCarpetaPlanillas.Directory +
    DirectorySeparator + strfecha + 'Tallas'+subfijo+'.xls';
  if (not FileExistsUTF8(archivo_destino)) or forzar_reemplazo or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
  begin

    CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile], true);
    archivo_destino:=UTF8Decode(archivo_destino);
    //Abro el archivo para guardar los datos
    xls.Workbooks.Open(archivo_destino);
    //Pongo los datos de la marea
    tmp := UTF8Decode(dmGeneral.zqMareaActivaMareaStr.AsString);
    xls.Cells[1, 2] := tmp;
    tmp := UTF8Decode(dmGeneral.zqMareaActivacapitan.AsString);
    xls.Cells[2, 2] := tmp;
    tmp := UTF8Decode(dmGeneral.zqMareaActivaobservador.AsString);
    xls.Cells[3, 2] := tmp;
    Result := True;
  end else
    Result := False;
end;


procedure TfmInformes.GenerarTallasXLS;
var
  xls: olevariant;
  archivo_origen, archivo_destino, tmp: WideString;
  fila, columna, inc_col: integer;
  banda_captura, banda_retenido, banda_descarte: string;
  numero_archivo_excel: integer = 1;//Si hay demasiadas muestras hay que crear más de un archivo
  lance: Integer;
  total, menor, mayor: double;
  begin
  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar le Excel al terminar
  try
//    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    if (InicializarArchivoExcelTallas (xls, numero_archivo_excel)) then
    begin
      with zqTallas do
      begin
        Close;
        Open;
        First;
        //Configuro la barra de progreso
        pbProceso.Max := RecordCount;
        pbProceso.Position := 0;
        laProceso.Caption:='Procesando muestras de talla';
        pbProceso.Visible := True;
        fila := 16;
        columna := 2;
        while not EOF do
        begin
          //El máximo de columnas de muestra es 241.
          //Si supera, se crea un nuevo archivo y comienza desde la columna 2
          if columna > 241 then
          begin
            xls.ActiveWorkBook.Save;//Guardo el archivo actual
            //Creo un nuevo archivo
            Inc(numero_archivo_excel);
            InicializarArchivoExcelTallas (xls, numero_archivo_excel, True);
            columna := 2;
          end;

          //Datos de encabezado de muestra
          if zqTallasminutos_arrastre.AsFloat > 0 then
            xls.Cells[8, columna] := zqTallasminutos_arrastre.AsFloat;
          //El dato de captura se quitó de la planilla
          //if zqTallasporcent_bolsa_captura.AsFloat > 0 then
          //  xls.Cells[8, columna] := zqTallasporcent_bolsa_captura.AsFloat;
          //Proceso las tallas
          if zqTallaspeso_total_produccion.AsFloat > 0 then
            xls.Cells[9, columna] := zqTallaspeso_total_produccion.AsFloat;
          xls.Cells[10, columna] := zqTallasfecha.AsDateTime;
          banda_captura := '';
          banda_retenido := '';
          banda_descarte := '';
          zqDetTallas.First;
          while not zqDetTallas.EOF do
          begin
            //Según el tipo de muestra, incremento la columna y guardo la banda
            if zqDetTallascod_tipo_muestra.AsString = 'C' then
            begin
              inc_col := 0;
              banda_captura := zqDetTallasbanda.AsString;
            end
            else if zqDetTallascod_tipo_muestra.AsString = 'R' then
            begin
              inc_col := 1;
              banda_retenido := zqDetTallasbanda.AsString;
            end
            else
            begin
              inc_col := 2;
              banda_descarte := zqDetTallasbanda.AsString;
            end;
            lance := zqTallasnrolance.AsInteger;
            total := zqDetTallaspeso_muestra_captura.AsFloat;
            mayor := zqDetTallaspeso_muestra_captura_comercial.AsFloat;
            menor := zqDetTallaspeso_muestra_captura_no_comercial.AsFloat;
            //Datos de encabezado de muestra
            if zqDetTallaspeso_muestra_captura.AsFloat > 0 then
              xls.Cells[5, columna+inc_col] := zqDetTallaspeso_muestra_captura.AsFloat;
            if zqDetTallaspeso_muestra_captura_comercial.AsFloat > 0 then
              xls.Cells[6, columna+inc_col] := zqDetTallaspeso_muestra_captura_comercial.AsFloat;
            if zqDetTallaspeso_muestra_captura_no_comercial.AsFloat > 0 then
              xls.Cells[7, columna+inc_col] := zqDetTallaspeso_muestra_captura_no_comercial.AsFloat;
            //Si hay algún comentario, lo coloco en la fila 4, que está vacía
            if (zqDetTallascomentarios.AsString <> '') then
            begin
              tmp := UTF8Decode(zqDetTallascomentarios.AsString);
              xls.Cells[4, columna+inc_col] := tmp;
            end;

            //En la planilla, el detalle de tallas comienza en 1 en la fila 14, es decir, talla+13
            fila := zqDetTallastalla.AsInteger + 15;
            //Salteo los valores nulos o 0 (cero)
            if zqDetTallasnro_ejemplares.AsInteger > 0 then
              xls.Cells[fila, columna + inc_col] := zqDetTallasnro_ejemplares.AsInteger;
            zqDetTallas.Next;
          end;
          //Al finalizar el procesado de las tallas, coloco nro de lance y banda
          if banda_captura <> '' then
          begin
            tmp := UTF8Decode(zqTallasnrolance.AsString + ' ' + banda_captura);
            xls.Cells[12, columna] := tmp;
          end;
          if banda_retenido <> '' then
          begin
            tmp := UTF8Decode(zqTallasnrolance.AsString + ' ' + banda_retenido);
            xls.Cells[12, columna + 1] := tmp;
          end;
          if banda_descarte <> '' then
          begin
            tmp := UTF8Decode(zqTallasnrolance.AsString + ' ' + banda_descarte);
            xls.Cells[12, columna + 2] := tmp;
          end;

          pbProceso.Position := RecNo;
          Application.ProcessMessages;
          Next;
          //Como se grabaron las 3 columnas de la muestra, incremento la columna en 3
          Inc(columna, 3);
        end;
        xls.ActiveWorkBook.Save;
      end;
    end;
  finally
    laProceso.Caption:='';
    pbProceso.Visible := False;
    xls.Quit;
    xls := Unassigned;
  end;
end;

procedure TfmInformes.GenerarDanioXLS;
var
  xls, xlp: olevariant;
  archivo_origen, archivo_destino, tmp, plantilla, rango: WideString;
  fila, columna: integer;
begin
  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
    xlp := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar le Excel al terminar
  try
    plantilla := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'dv_plantilla.xls';
    archivo_origen := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'Daño valvar.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + strfecha + 'Daño valvar.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      //Abro el archivo de donde voy a copiar el formato
      xlp.Workbooks.Open(plantilla);
      //Abro el archivo para guardar los datos
      xls.Workbooks.Open(archivo_destino);
      //Pongo los datos de la marea
      tmp := UTF8Decode(dmGeneral.zqMareaActivaMareaStr.AsString);
      xls.Cells[1, 3] := tmp;
      with zqDanio do
      begin
        Close;
        Open;
        First;
        //Configuro la barra de progreso
        pbProceso.Max := RecordCount;
        pbProceso.Position := 0;
        laProceso.Caption:='Procesando muestras de daño valvar';
        pbProceso.Visible := True;
        fila := 4;//Arranco en la fila 4 porque antes están los títulos
        //Copio la plantilla para pegarla en la fila actual
        xlp.Range('A4:M9').Copy;
        Sleep(1000);
        while not EOF do
        begin
          rango:=UTF8Decode('A'+IntToStr(fila)+':M'+IntToStr(fila+5));
          //Pego el texto
          xls.Range(rango).PasteSpecial(-4163);
          //Pego formatos
          xls.Range(rango).PasteSpecial(-4122);
          Inc(fila);
          xls.Cells[fila, 1] := FieldByName('fecha').AsDateTime;
          xls.Cells[fila, 2] := FieldByName('hora').AsDateTime;
          tmp := UTF8Decode(FieldByName('lance_banda').AsString);
          xls.Cells[fila, 3] := tmp;
          if not FieldByName('latitud_ini').IsNull then
             xls.Cells[fila+3, 2] := FieldByName('latitud_ini').AsFloat*100;
          if not FieldByName('longitud_ini').IsNull then
             xls.Cells[fila+4, 2] := FieldByName('longitud_ini').AsFloat*100;

          xls.Cells[fila, 5] := FieldByName('cant_ejemp_sd_01_20_antes').AsInteger;
          xls.Cells[fila, 6] := FieldByName('cant_ejemp_sd_21_40_antes').AsInteger;
          xls.Cells[fila, 7] := FieldByName('cant_ejemp_sd_41_54_antes').AsInteger;
          xls.Cells[fila, 8] := FieldByName('cant_ejemp_sd_mas_54_antes').AsInteger;
          xls.Cells[fila, 10] := FieldByName('cant_ejemp_sd_01_20_despues').AsInteger;
          xls.Cells[fila, 11] := FieldByName('cant_ejemp_sd_21_40_despues').AsInteger;
          xls.Cells[fila, 12] := FieldByName('cant_ejemp_sd_41_54_despues').AsInteger;
          xls.Cells[fila, 13] := FieldByName('cant_ejemp_sd_mas_54_despues').AsInteger;
          xls.Cells[fila+1, 5] := FieldByName('cant_ejemp_da_01_20_antes').AsInteger;
          xls.Cells[fila+1, 6] := FieldByName('cant_ejemp_da_21_40_antes').AsInteger;
          xls.Cells[fila+1, 7] := FieldByName('cant_ejemp_da_41_54_antes').AsInteger;
          xls.Cells[fila+1, 8] := FieldByName('cant_ejemp_da_mas_54_antes').AsInteger;
          xls.Cells[fila+1, 10] := FieldByName('cant_ejemp_da_01_20_despues').AsInteger;
          xls.Cells[fila+1, 11] := FieldByName('cant_ejemp_da_21_40_despues').AsInteger;
          xls.Cells[fila+1, 12] := FieldByName('cant_ejemp_da_41_54_despues').AsInteger;
          xls.Cells[fila+1, 13] := FieldByName('cant_ejemp_da_mas_54_despues').AsInteger;
          xls.Cells[fila+2, 5] := FieldByName('cant_ejemp_db_01_20_antes').AsInteger;
          xls.Cells[fila+2, 6] := FieldByName('cant_ejemp_db_21_40_antes').AsInteger;
          xls.Cells[fila+2, 7] := FieldByName('cant_ejemp_db_41_54_antes').AsInteger;
          xls.Cells[fila+2, 8] := FieldByName('cant_ejemp_db_mas_54_antes').AsInteger;
          xls.Cells[fila+2, 10] := FieldByName('cant_ejemp_db_01_20_despues').AsInteger;
          xls.Cells[fila+2, 11] := FieldByName('cant_ejemp_db_21_40_despues').AsInteger;
          xls.Cells[fila+2, 12] := FieldByName('cant_ejemp_db_41_54_despues').AsInteger;
          xls.Cells[fila+2, 13] := FieldByName('cant_ejemp_db_mas_54_despues').AsInteger;
          xls.Cells[fila+3, 5] := FieldByName('cant_ejemp_dc_01_20_antes').AsInteger;
          xls.Cells[fila+3, 6] := FieldByName('cant_ejemp_dc_21_40_antes').AsInteger;
          xls.Cells[fila+3, 7] := FieldByName('cant_ejemp_dc_41_54_antes').AsInteger;
          xls.Cells[fila+3, 8] := FieldByName('cant_ejemp_dc_mas_54_antes').AsInteger;
          xls.Cells[fila+3, 10] := FieldByName('cant_ejemp_dc_01_20_despues').AsInteger;
          xls.Cells[fila+3, 11] := FieldByName('cant_ejemp_dc_21_40_despues').AsInteger;
          xls.Cells[fila+3, 12] := FieldByName('cant_ejemp_dc_41_54_despues').AsInteger;
          xls.Cells[fila+3, 13] := FieldByName('cant_ejemp_dc_mas_54_despues').AsInteger;
          xls.Cells[fila+4, 5] := FieldByName('cant_ejemp_dd_01_20_antes').AsInteger;
          xls.Cells[fila+4, 6] := FieldByName('cant_ejemp_dd_21_40_antes').AsInteger;
          xls.Cells[fila+4, 7] := FieldByName('cant_ejemp_dd_41_54_antes').AsInteger;
          xls.Cells[fila+4, 8] := FieldByName('cant_ejemp_dd_mas_54_antes').AsInteger;
          xls.Cells[fila+4, 10] := FieldByName('cant_ejemp_dd_01_20_despues').AsInteger;
          xls.Cells[fila+4, 11] := FieldByName('cant_ejemp_dd_21_40_despues').AsInteger;
          xls.Cells[fila+4, 12] := FieldByName('cant_ejemp_dd_41_54_despues').AsInteger;
          xls.Cells[fila+4, 13] := FieldByName('cant_ejemp_dd_mas_54_despues').AsInteger;

          pbProceso.Position := RecNo;
          Application.ProcessMessages;
          Next;
          Inc(fila,5);
        end;
        //Selecciono la primera celda porque si no queda seleccionado
        //el último bloque pegado
        xls.Cells[1,1].Select;
        xls.ActiveWorkBook.Save;
      end;
    end;
  finally
    laProceso.Caption:='';
    pbProceso.Visible := False;
    xls.Quit;
    xls := Unassigned;
    xlp.Quit;
    xlp := Unassigned;
  end;
end;

procedure TfmInformes.GenerarByCatchXLS;
var
  xls, xlp: olevariant;
    archivo_origen, archivo_destino, plantilla, tmp, rango: WideString;
    fila, columna: integer;
begin

  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
    xlp := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar le Excel al terminar
  try
    plantilla := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'fa_plantilla_2022.xls';
    archivo_origen := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'Fauna acompañante.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + strfecha + 'Fauna acompañante.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      //Abro el archivo de donde voy a copiar el formato
      xlp.Workbooks.Open(plantilla);
      //Abro el archivo para guardar los datos
      xls.Workbooks.Open(archivo_destino);

      with zqByCatch do
      begin
        Close;
        Open;
        First;
        //Configuro la barra de progreso
        pbProceso.Max := RecordCount;
        pbProceso.Position := 0;
        laProceso.Caption:='Procesando muestras de fauna acompañante';
        pbProceso.Visible := True;
        fila := 1;
        //Copio la plantilla para pegarla en la fila actual
        xlp.Range('A1:D33').Copy;
        Sleep(1000);
        while not EOF do
        begin
          rango:=UTF8Decode('A'+IntToStr(fila)+':D'+IntToStr(fila+32));
          //Pego el texto
          xls.Range(rango).PasteSpecial(-4163);
          //Pego formatos
          xls.Range(rango).PasteSpecial(-4122);
          //Pongo los datos de la marea
          tmp := 'Buque: ' + UTF8Decode(dmGeneral.zqMareaActivabuque.AsString);
          xls.Cells[fila+1, 1] := tmp;
          tmp := UTF8Decode(dmGeneral.zqMareaActivamarea_buque.AsString);
          xls.Cells[fila+1, 3] := tmp;
          //Completo los datos
          xls.Cells[fila+2, 3] := FieldByName('fecha').AsDateTime;
          //xls.Cells[fila+2, 4] := FieldByName('hora').AsDateTime;
          tmp := UTF8Decode(FieldByName('lance_banda').AsString);
          xls.Cells[fila+3, 3] := tmp;
          if not FieldByName('latitud').IsNull then
             xls.Cells[fila+4, 3] := FieldByName('latitud').AsFloat*100;
          if not FieldByName('longitud').IsNull then
             xls.Cells[fila+5, 3] := FieldByName('longitud').AsFloat*100;
          tmp := UTF8Decode(FieldByName('unidad_manejo').AsString);
          xls.Cells[fila+6, 3] := tmp;

          if not FieldByName('profundidad').IsNull then
             xls.Cells[fila+7, 3] := FieldByName('profundidad').AsInteger;
          if not FieldByName('minutos_arrastre').IsNull then
             xls.Cells[fila+8, 3] := FieldByName('minutos_arrastre').AsInteger;
          if not FieldByName('velocidad').IsNull then
             xls.Cells[fila+9, 3] := FieldByName('velocidad').AsFloat;
          if not FieldByName('largo_relinga_inferior').IsNull then
             xls.Cells[fila+10, 3] := FieldByName('largo_relinga_inferior').AsInteger;
          //if not FieldByName('mallero_copo').IsNull then
          //   xls.Cells[fila+9, 3] := FieldByName('mallero_copo').AsInteger;
          //if not FieldByName('tipo_malla').IsNull then
          //begin
          //     tmp := UTF8Decode(FieldByName('tipo_malla').AsString);
          //     xls.Cells[fila+9, 4] := tmp;
          //end;
          if not FieldByName('rinde_total').IsNull then
             xls.Cells[fila+11, 3] := FieldByName('rinde_total').AsFloat;
          if not FieldByName('porcent_bolsa_captura').IsNull then
             xls.Cells[fila+12, 3] := FieldByName('porcent_bolsa_captura').AsFloat;
          if not FieldByName('peso_muestra_captura').IsNull then
             xls.Cells[fila+13, 3] := FieldByName('peso_muestra_captura').AsFloat;
          if not FieldByName('peso_total_vieira').IsNull then
             xls.Cells[fila+14, 3] := FieldByName('peso_total_vieira').AsFloat;
          //if not FieldByName('peso_valvas').IsNull then
          //   xls.Cells[fila+14, 3] := FieldByName('peso_valvas').AsFloat;
          if not FieldByName('peso_muestra_fauna_acomp').IsNull then
             xls.Cells[fila+15, 3] := FieldByName('peso_muestra_fauna_acomp').AsFloat;

          //
          // Planillas 2022
          // El peso de las muestras se muestra en gramos, por eso
          // se multiplica el peso registrado * 1000
          //
          xls.Cells[fila+17, 3] := FieldByName('peso_esponjas').AsFloat * 1000;
          xls.Cells[fila+18, 3] := FieldByName('peso_anemonas').AsFloat * 1000;
          xls.Cells[fila+19, 3] := FieldByName('peso_ascidias').AsFloat * 1000;
          xls.Cells[fila+20, 3] := FieldByName('peso_ofiuras').AsFloat * 1000;
          xls.Cells[fila+21, 3] := FieldByName('peso_estrellas').AsFloat * 1000;
          //xls.Cells[fila+21, 4] := FieldByName('nro_estrellas').AsInteger;
          xls.Cells[fila+22, 3] := FieldByName('peso_caracoles').AsFloat * 1000;
          //xls.Cells[fila+22, 4] := FieldByName('nro_caracoles').AsInteger;
          xls.Cells[fila+23, 3] := FieldByName('peso_erizos').AsFloat * 1000;
          //xls.Cells[fila+23, 4] := FieldByName('nro_erizos').AsInteger;
          xls.Cells[fila+24, 3] := FieldByName('peso_cangrejos').AsFloat * 1000;
          //xls.Cells[fila+24, 4] := FieldByName('nro_cangrejos').AsInteger;
          xls.Cells[fila+25, 3] := FieldByName('peso_tubos_amarillentos').AsFloat * 1000;
          xls.Cells[fila+26, 3] := FieldByName('peso_valvas').AsFloat * 1000;
          //Peces en captura
          tmp := UTF8Decode(FieldByName('peces1').AsString);
          xls.Cells[fila+28, 1] := tmp;
          tmp := UTF8Decode(FieldByName('peces2').AsString);
          xls.Cells[fila+29, 1] := tmp;
          tmp := UTF8Decode(FieldByName('peces3').AsString);
          xls.Cells[fila+30, 1] := tmp;
          tmp := UTF8Decode(FieldByName('peces4').AsString);
          xls.Cells[fila+31, 1] := tmp;
          tmp := UTF8Decode(FieldByName('peces5').AsString);
          xls.Cells[fila+32, 1] := tmp;

          tmp := UTF8Decode(FieldByName('peces6').AsString);
          xls.Cells[fila+28, 2] := tmp;
          tmp := UTF8Decode(FieldByName('peces7').AsString);
          xls.Cells[fila+29, 2] := tmp;
          tmp := UTF8Decode(FieldByName('peces8').AsString);
          xls.Cells[fila+30, 2] := tmp;
          tmp := UTF8Decode(FieldByName('peces9').AsString);
          xls.Cells[fila+31, 2] := tmp;
          tmp := UTF8Decode(FieldByName('peces10').AsString);
          xls.Cells[fila+32, 2] := tmp;

          pbProceso.Position := RecNo;
          Application.ProcessMessages;
          Next;
          Inc(fila,36);
        end;
        //Copio una celda vacía para liberar el portapapeles
        xlp.Range('E1').Copy;
        //Selecciono la primera celda porque si no queda seleccionado
        //el último bloque pegado
        xls.Cells[1,1].Select;
        xls.ActiveWorkBook.Save;
      end;
    end;
  finally
    laProceso.Caption:='';
    pbProceso.Visible := False;
    xls.Quit;
    xls := Unassigned;
    xlp.Quit;
    xlp := Unassigned;
  end;
end;

procedure TfmInformes.GenerarByCatch2XLS;
var
  xls, xlp: olevariant;
  archivo_origen, archivo_destino, plantilla, tmp, rango: WideString;
  fila, columna, muestra_pp: integer;
begin
  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
    xlp := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar le Excel al terminar
  try
    plantilla := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'fa_plantilla_detallada.xls';
    archivo_origen := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'Fauna acompañante detallada.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + strfecha + 'Fauna acompañante detallada.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      //Abro el archivo de donde voy a copiar el formato
      xlp.Workbooks.Open(plantilla);
      //Abro el archivo para guardar los datos
      xls.Workbooks.Open(archivo_destino);
      //Lo siguiente se configuró directamente en 'Fauna acompañante nueva.xls'
      //tmp:=UTF8Decode('MUESTRAS DE FAUNA ACOMPAÑANTE');
      //xls.ActiveSheet.PageSetup.CenterHeader:=tmp;
      with zqByCatch do
      begin
        Close;
        Open;
        First;
        //Configuro la barra de progreso
        pbProceso.Max := RecordCount;
        pbProceso.Position := 0;
        laProceso.Caption:='Procesando muestras de fauna acompañante (detallada)';
        pbProceso.Visible := True;
        fila := 1;
        muestra_pp:=0; //esta variable cuenta la cantidad de muestras por página
                       //Despues de la cuarta muestra se inserta un salto de página
                       //y se resetea la variable
        //Copio la plantilla para pegarla en la fila actual
        xlp.Range('A1:G22').Copy;
        Sleep(1000);
        while not EOF do
        begin
          Inc(muestra_pp);
          rango:=UTF8Decode('A'+IntToStr(fila)+':G'+IntToStr(fila+21));
          //Pego el texto
          xls.Range(rango).PasteSpecial(-4163);
          //Pego formatos
          xls.Range(rango).PasteSpecial(-4122);
          //Pongo los datos de la marea
          tmp := UTF8Decode(dmGeneral.zqMareaActivaMareaStr.AsString);
          xls.Cells[fila, 5] := tmp;
          //Completo los datos
          xls.Cells[fila+2, 2] := FieldByName('fecha').AsDateTime;
          xls.Cells[fila+3, 2] := FieldByName('hora').AsDateTime;
          tmp := UTF8Decode(FieldByName('lance_banda').AsString);
          xls.Cells[fila+4, 2] := tmp;
          if not FieldByName('latitud').IsNull then
             xls.Cells[fila+5, 2] := FieldByName('latitud').AsFloat*100;
          if not FieldByName('longitud').IsNull then
             xls.Cells[fila+6, 2] := FieldByName('longitud').AsFloat*100;

          if not FieldByName('profundidad').IsNull then
             xls.Cells[fila+7, 2] := FieldByName('profundidad').AsInteger;
          if not FieldByName('velocidad').IsNull then
             xls.Cells[fila+8, 2] := FieldByName('velocidad').AsFloat;
          if not FieldByName('largo_relinga_inferior').IsNull then
             xls.Cells[fila+9, 2] := FieldByName('largo_relinga_inferior').AsInteger;
          if not FieldByName('mallero_copo').IsNull then
             xls.Cells[fila+10, 2] := FieldByName('mallero_copo').AsInteger;
          if not FieldByName('tipo_malla').IsNull then
          begin
               tmp := UTF8Decode(FieldByName('tipo_malla').AsString);
               xls.Cells[fila+11, 2] := tmp;
          end;
          if not FieldByName('rinde_total').IsNull then
             xls.Cells[fila+12, 2] := FieldByName('rinde_total').AsFloat;
          if not FieldByName('porcent_bolsa_captura').IsNull then
             xls.Cells[fila+13, 2] := FieldByName('porcent_bolsa_captura').AsFloat;
          if not FieldByName('peso_muestra_captura').IsNull then
             xls.Cells[fila+14, 2] := FieldByName('peso_muestra_captura').AsFloat;
          if not FieldByName('peso_total_vieira').IsNull then
             xls.Cells[fila+15, 2] := FieldByName('peso_total_vieira').AsFloat;
          if not FieldByName('peso_muestra_fauna_acomp').IsNull then
             xls.Cells[fila+16, 2] := FieldByName('peso_muestra_fauna_acomp').AsFloat;
          if not FieldByName('peces').IsNull then
          begin
               tmp := UTF8Decode(FieldByName('peces').AsString);
               xls.Cells[fila+19, 1] := tmp;
          end;
          if not FieldByName('comentarios').IsNull then
          begin
               tmp := UTF8Decode(FieldByName('comentarios').AsString);
               xls.Cells[fila+19, 4] := tmp;
          end;

          //Proceso las especies
          with zqDetByCatch do
          begin
            Close;
            Open;
            zqDetByCatch.First;
            while (not zqDetByCatch.EOF) and (zqDetByCatch.RecNo<14) do
            begin
              tmp := UTF8Decode(FieldByName('nombre').AsString);
              xls.Cells[fila+2+RecNo, 4] := tmp;
              xls.Cells[fila+2+RecNo, 5] := FieldByName('peso').AsFloat;
              if FieldByName('registra_numero').AsBoolean then
                 xls.Cells[fila+2+RecNo, 6] := FieldByName('numero').AsInteger
              else
              begin
                tmp := UTF8Decode('---');
                xls.Cells[fila+2+RecNo, 6] := tmp;
              end;
              tmp := UTF8Decode(FieldByName('comentarios').AsString);
              xls.Cells[fila+2+RecNo, 7] := tmp;
              zqDetByCatch.Next;
            end;
          end;
          pbProceso.Position := RecNo;
          Application.ProcessMessages;
          Next;
          if muestra_pp=4 then
          begin
            muestra_pp:=0;
            Inc(fila,22);
            xls.ActiveWindow.SelectedSheets.HPageBreaks.Add(xls.Cells[fila,1]);
          end else
              Inc(fila,24);
        end;
        //Copio una celda vacía para liberar el portapapeles
        xlp.Range('H1').Copy;
        //Selecciono la primera celda porque si no queda seleccionado
        //el último bloque pegado
        xls.Cells[1,1].Select;
        xls.ActiveWorkBook.Save;
      end;
    end;
  finally
    laProceso.Caption:='';
    pbProceso.Visible := False;
    xls.Quit;
    xls := Unassigned;
    xlp.Quit;
    xlp := Unassigned;
  end;
end;

// Versión de la planilla 2023
procedure TfmInformes.GenerarByCatch3XLS;
var
  xls, xlp: olevariant;
    archivo_origen, archivo_destino, plantilla, tmp, rango: WideString;
    fila, columna: integer;
begin

  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
    xlp := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar el Excel al terminar
  try
    plantilla := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'fa_plantilla_2023.xls';
    archivo_origen := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'Fauna acompañante2023.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + strfecha + 'Fauna acompañante.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      //Abro el archivo de donde voy a copiar el formato
      xlp.Workbooks.Open(plantilla);
      //Abro el archivo para guardar los datos
      xls.Workbooks.Open(archivo_destino);

      //Copio la los encabezados de la plantilla
      rango:=UTF8Decode('A1:AU8');
      xlp.Range(rango).Copy;
      //Pego el texto
      xls.Range(rango).PasteSpecial(-4163);
      //Pego formatos
      xls.Range(rango).PasteSpecial(-4122);

      //Pongo los datos de la marea
      tmp := UTF8Decode(dmGeneral.zqMareaActivaMareaStr.AsString);
      xls.Cells[1, 3] := tmp;
      tmp := UTF8Decode(dmGeneral.zqMareaActivacapitan.AsString);
      xls.Cells[2, 3] := tmp;
      tmp := UTF8Decode(dmGeneral.zqMareaActivaobservador.AsString);
      xls.Cells[3, 3] := tmp;


      with zqByCatch do
      begin
        Close;
        Open;
        First;

      //Armo el dato de mallero
      tmp := '';
      if not FieldByName('mallero_copo').IsNull then
         tmp := UTF8Decode(FieldByName('mallero_copo').AsString);
      if not FieldByName('tipo_malla').IsNull then
         tmp := tmp + 'mm ' + UTF8Decode(FieldByName('tipo_malla').AsString);
      if tmp <> '' then
         xls.Cells[4, 3] := tmp;

      //Configuro la barra de progreso
        pbProceso.Max := RecordCount;
        pbProceso.Position := 0;
        laProceso.Caption:='Procesando muestras de fauna acompañante';
        pbProceso.Visible := True;
        fila := 9;
        //Copio la plantilla para pegarla en la fila actual
        xlp.Range('A9:AU9').Copy;
        Sleep(1000);
        while not EOF do
        begin
          rango:=UTF8Decode('A'+IntToStr(fila)+':AU'+IntToStr(fila));
          //Pego el texto
          xls.Range(rango).PasteSpecial(-4163);
          //Pego formatos
          xls.Range(rango).PasteSpecial(-4122);
          //Completo los datos
          //Numero de muestra
          xls.Cells[fila, 1] := fila - 8;

          xls.Cells[fila, 2] := FieldByName('fecha').AsDateTime;
          tmp := UTF8Decode(FieldByName('lance_banda').AsString);
          xls.Cells[fila, 3] := tmp;
          if not FieldByName('latitud').IsNull then
             xls.Cells[fila, 4] := FieldByName('latitud').AsFloat*100;
          if not FieldByName('longitud').IsNull then
             xls.Cells[fila, 5] := FieldByName('longitud').AsFloat*100;
          tmp := UTF8Decode(FieldByName('unidad_manejo').AsString);
          xls.Cells[fila, 6] := tmp;

          if not FieldByName('profundidad').IsNull then
             xls.Cells[fila, 7] := FieldByName('profundidad').AsInteger;
          if not FieldByName('minutos_arrastre').IsNull then
             xls.Cells[fila, 8] := FieldByName('minutos_arrastre').AsInteger;
          if not FieldByName('velocidad').IsNull then
             xls.Cells[fila, 9] := FieldByName('velocidad').AsFloat;
          if not FieldByName('largo_relinga_inferior').IsNull then
             xls.Cells[fila, 10] := FieldByName('largo_relinga_inferior').AsInteger;
          //if not FieldByName('mallero_copo').IsNull then
          //   xls.Cells[fila+9, 3] := FieldByName('mallero_copo').AsInteger;
          //if not FieldByName('tipo_malla').IsNull then
          //begin
          //     tmp := UTF8Decode(FieldByName('tipo_malla').AsString);
          //     xls.Cells[fila+9, 4] := tmp;
          //end;
          if not FieldByName('rinde_total').IsNull then
             xls.Cells[fila, 11] := FieldByName('rinde_total').AsFloat;
          if not FieldByName('porcent_bolsa_captura').IsNull then
             xls.Cells[fila, 12] := FieldByName('porcent_bolsa_captura').AsFloat;
          if not FieldByName('peso_muestra_captura').IsNull then
             xls.Cells[fila, 13] := FieldByName('peso_muestra_captura').AsFloat;
          if not FieldByName('peso_total_vieira').IsNull then
             xls.Cells[fila, 14] := FieldByName('peso_total_vieira').AsFloat;
          if not FieldByName('peso_valvas').IsNull then
             xls.Cells[fila, 15] := FieldByName('peso_valvas').AsFloat * 1000;  //Va en gramos
          if not FieldByName('peso_muestra_fauna_acomp').IsNull then
             xls.Cells[fila, 16] := FieldByName('peso_muestra_fauna_acomp').AsFloat;

          //
          // Planillas 2023
          // El peso de las muestras se muestra en gramos, por eso
          // se multiplica el peso registrado * 1000
          //
          xls.Cells[fila, 17] := FieldByName('peso_esponjas').AsFloat * 1000;
          xls.Cells[fila, 18] := FieldByName('peso_anemonas').AsFloat * 1000;
          xls.Cells[fila, 19] := FieldByName('peso_ascidias').AsFloat * 1000;
          xls.Cells[fila, 20] := FieldByName('peso_corales').AsFloat * 1000;
          xls.Cells[fila, 21] := FieldByName('peso_ofiuras').AsFloat * 1000;
          xls.Cells[fila, 22] := FieldByName('peso_gorgonias').AsFloat * 1000;
          xls.Cells[fila, 23] := FieldByName('nro_gorgonias').AsInteger;
          xls.Cells[fila, 24] := FieldByName('peso_estrellas').AsFloat * 1000;
          xls.Cells[fila, 25] := FieldByName('nro_estrellas').AsInteger;
          xls.Cells[fila, 26] := FieldByName('peso_erizos').AsFloat * 1000;
          xls.Cells[fila, 27] := FieldByName('nro_erizos').AsInteger;
          xls.Cells[fila, 28] := FieldByName('peso_caracoles').AsFloat * 1000;
          xls.Cells[fila, 29] := FieldByName('nro_caracoles').AsInteger;
          xls.Cells[fila, 30] := FieldByName('peso_braquiopodos').AsFloat * 1000;
          xls.Cells[fila, 31] := FieldByName('nro_braquiopodos').AsInteger;
          xls.Cells[fila, 32] := FieldByName('peso_centollas').AsFloat * 1000;
          xls.Cells[fila, 33] := FieldByName('nro_centollas').AsInteger;
          xls.Cells[fila, 34] := FieldByName('peso_arania_violeta').AsFloat * 1000;
          xls.Cells[fila, 35] := FieldByName('nro_arania_violeta').AsInteger;
          xls.Cells[fila, 36] := FieldByName('peso_arania_comun').AsFloat * 1000;
          xls.Cells[fila, 37] := FieldByName('nro_arania_comun').AsInteger;
          xls.Cells[fila, 38] := FieldByName('peso_tractor').AsFloat * 1000;
          xls.Cells[fila, 39] := FieldByName('nro_tractor').AsInteger;
          xls.Cells[fila, 40] := FieldByName('peso_ermitanio').AsFloat * 1000;
          xls.Cells[fila, 41] := FieldByName('nro_ermitanio').AsInteger;
          xls.Cells[fila, 42] := FieldByName('peso_bogavantes').AsFloat * 1000;
          xls.Cells[fila, 43] := FieldByName('nro_bogavantes').AsInteger;
          xls.Cells[fila, 44] := FieldByName('peso_tubos_amarillentos').AsFloat * 1000;
          xls.Cells[fila, 45] := FieldByName('peso_poliquetos').AsFloat * 1000;
          xls.Cells[fila, 46] := FieldByName('peso_otros').AsFloat * 1000;
          //Peces en captura
          tmp := UTF8Decode(FieldByName('peces').AsString);
          xls.Cells[fila, 47] := tmp;

          pbProceso.Position := RecNo;
          Application.ProcessMessages;
          Next;
          Inc(fila,1);
        end;
        //Copio una celda vacía para liberar el portapapeles
        xlp.Range('E1').Copy;
        //Selecciono la primera celda porque si no queda seleccionado
        //el último bloque pegado
        xls.Cells[1,1].Select;
        xls.ActiveWorkBook.Save;
      end;
    end;
  finally
    laProceso.Caption:='';
    pbProceso.Visible := False;
    xls.Quit;
    xls := Unassigned;
    xlp.Quit;
    xlp := Unassigned;
  end;
end;

procedure TfmInformes.GenerarRayaXLS;
var
  xls: olevariant;
  archivo_origen, archivo_destino: WideString;
  tmp: WideString;
  fila, columna: integer;
begin
  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar le Excel al terminar
  try
    archivo_origen := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'Condrictios.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + strfecha + 'Condrictios.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      xls.Workbooks.Open(archivo_destino);
      xls.ActiveWorkBook.Sheets('planilla para completar').Activate;

      //Pongo los datos de la marea
      tmp := UTF8Decode(dmGeneral.zqMareaActivabuque.AsString);
      xls.Cells[2, 3] := tmp;
      tmp := UTF8Decode(dmGeneral.zqMareaActivaMarea.AsString);
      xls.Cells[4, 2] := tmp;

      //Abro la planilla de datos puente (si no está abierta) para obtener
      //el N° de lances (RecordCount)
      zqDatosPuente.Open;

      with zqRaya do
      begin
        Close;
        Open;
        First;

        //Pongo datos de lances y muestras
        xls.Cells[2, 13] := zqDatosPuente.RecordCount;
        xls.Cells[4, 13] := zqRaya.RecordCount;

        //Configuro la barra de progreso
        pbProceso.Max := RecordCount;
        pbProceso.Position := 0;
        laProceso.Caption:='Procesando muestras de rayas';
        pbProceso.Visible := True;
        Fila := 9;//Arranco en la fila 9 porque antes están los títulos
        while not EOF do
        begin
          tmp := UTF8Decode(FieldByName('nrolance').AsString);
          xls.Cells[fila, 1] := tmp;
          xls.Cells[fila, 2] := FieldByName('fecha').AsDateTime;
          if not FieldByName('latitud_fin').IsNull then
             xls.Cells[fila, 3] := FieldByName('latitud_fin').AsFloat*100;
          if not FieldByName('longitud_fin').IsNull then
             xls.Cells[fila, 4] := FieldByName('longitud_fin').AsFloat*100;
          if not FieldByName('profundidad').IsNull then
             xls.Cells[fila, 5] := FieldByName('profundidad').AsInteger;
          if not FieldByName('nro_dipturus').IsNull then
             xls.Cells[fila, 6] := FieldByName('nro_dipturus').AsInteger;
          if not FieldByName('lt_max_dipturus').IsNull then
             xls.Cells[fila, 7] := FieldByName('lt_max_dipturus').AsInteger;
          if not FieldByName('lt_min_dipturus').IsNull then
             xls.Cells[fila, 8] := FieldByName('lt_min_dipturus').AsInteger;

          if not FieldByName('nro_bathyraja').IsNull then
             xls.Cells[fila, 9] := FieldByName('nro_bathyraja').AsInteger;
          if not FieldByName('lt_max_bathyraja').IsNull then
             xls.Cells[fila, 10] := FieldByName('lt_max_bathyraja').AsInteger;
          if not FieldByName('lt_min_bathyraja').IsNull then
             xls.Cells[fila, 11] := FieldByName('lt_min_bathyraja').AsInteger;

          if not FieldByName('nro_psammobatis').IsNull then
             xls.Cells[fila, 12] := FieldByName('nro_psammobatis').AsInteger;
          if not FieldByName('lt_max_psammobatis').IsNull then
             xls.Cells[fila, 13] := FieldByName('lt_max_psammobatis').AsInteger;
          if not FieldByName('lt_min_psammobatis').IsNull then
             xls.Cells[fila, 14] := FieldByName('lt_min_psammobatis').AsInteger;

          if not FieldByName('nro_amblyraja').IsNull then
             xls.Cells[fila, 15] := FieldByName('nro_amblyraja').AsInteger;
          if not FieldByName('lt_max_amblyraja').IsNull then
             xls.Cells[fila, 16] := FieldByName('lt_max_amblyraja').AsInteger;
          if not FieldByName('lt_min_amblyraja').IsNull then
             xls.Cells[fila, 17] := FieldByName('lt_min_amblyraja').AsInteger;

          if not FieldByName('nro_squalus').IsNull then
             xls.Cells[fila, 18] := FieldByName('nro_squalus').AsInteger;
          if not FieldByName('lt_max_squalus').IsNull then
             xls.Cells[fila, 19] := FieldByName('lt_max_squalus').AsInteger;
          if not FieldByName('lt_min_squalus').IsNull then
             xls.Cells[fila, 20] := FieldByName('lt_min_squalus').AsInteger;

          if not FieldByName('nro_schroederichthys').IsNull then
             xls.Cells[fila, 21] := FieldByName('nro_schroederichthys').AsInteger;
          if not FieldByName('lt_max_schroederichthys').IsNull then
             xls.Cells[fila, 22] := FieldByName('lt_max_schroederichthys').AsInteger;
          if not FieldByName('lt_min_schroederichthys').IsNull then
             xls.Cells[fila, 23] := FieldByName('lt_min_schroederichthys').AsInteger;

          if not FieldByName('nro_huevos_llenos').IsNull then
             xls.Cells[fila, 24] := FieldByName('nro_huevos_llenos').AsInteger;
          if not FieldByName('nro_huevos_vacios').IsNull then
             xls.Cells[fila, 25] := FieldByName('nro_huevos_vacios').AsInteger;

          tmp := UTF8Decode(FieldByName('menores_10').AsString);
          xls.Cells[fila, 26] := tmp;

          tmp := UTF8Decode(FieldByName('comentarios').AsString);
          xls.Cells[fila, 27] := tmp;
          pbProceso.Position := RecNo;
          Application.ProcessMessages;
          Next;
          Inc(fila);
        end;
        xls.ActiveWorkBook.Save;
      end;
    end;
  finally
    laProceso.Caption:='';
    pbProceso.Visible := False;
    xls.Quit;
    xls := Unassigned;
  end;
end;

procedure TfmInformes.GenerarDatosPuentePDF;
var
  archivo_destino: string;
begin
  archivo_destino := dedCarpetaPlanillas.Directory +
    DirectorySeparator + 'Datos puente.pdf';
  if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
  begin
    laProceso.Caption:='Generando datos de puente en PDF';
    zqInfDatosPuente.Close;
    zqInfDatosPuente.Open;
    if zqInfDatosPuente.RecordCount>0 then
    begin
      pbProceso.Max:=zqInfDatosPuente.RecordCount;
      frrDatosPuente.PrepareReport;
      frrDatosPuente.ExportTo(TfrTNPDFExportFilter, archivo_destino);
    end;
    laProceso.Caption:='';
  end;
end;

procedure TfmInformes.GenerarSenasaPDF;
var
  archivo_destino: string;
begin
  archivo_destino := dedCarpetaPlanillas.Directory +
    DirectorySeparator + 'Muestras SENASA.pdf';
  if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
  begin
    zqSenasaCallos.Close;
    zqSenasaCallos.Open;
    zqSenasaEntera.Close;
    zqSenasaEntera.Open;

    pbProceso.Max:=zqSenasaEntera.RecordCount;
    laProceso.Caption:='Generando planillas de SENASA';
    if (zqSenasaCallos.RecordCount>0) or (zqSenasaEntera.RecordCount>0) then
    begin
      frrSenasa.PrepareReport;
      frrSenasa.ExportTo(TfrTNPDFExportFilter, archivo_destino);
    end;
    laProceso.Caption:='';
  end;
end;

procedure TfmInformes.GenerarMuestrasBiolPDF;
var
  archivo_destino: string;
begin
  archivo_destino := dedCarpetaPlanillas.Directory +
    DirectorySeparator + 'Muestras biológicas.pdf';
  if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
  begin
    zqInfMuestrasBiol.Close;
    zqInfMuestrasBiol.Open;

    pbProceso.Max:=zqInfMuestrasBiol.RecordCount;
    laProceso.Caption:='Generando planilla de muestras biológicas';
    if zqInfMuestrasBiol.RecordCount>0 then
    begin
      frrMuestrasBiol.PrepareReport;
      frrMuestrasBiol.ExportTo(TfrTNPDFExportFilter, archivo_destino);
    end;
    laProceso.Caption:='';
  end;
end;

end.
