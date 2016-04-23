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
  Classes, SysUtils, FileUtil, LR_Class, LR_DBSet, RxIniPropStorage, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, Buttons, ActnList, ComCtrls, StdCtrls,
  EditBtn, IniPropStorage, Grids, frmbase, ZDataset, DB, datGeneral,
  comobj, variants, frmrptdatospuente,
  funciones, LSConfig, LR_DSet, lr_e_pdf;

type

  { TfmInformes }

  TfmInformes = class(TfmBase)
    acGuardarPlanillas: TAction;
    acImprimirDatosPuente: TAction;
    acImprimirSenasa: TAction;
    acImprimirMuestrasBiol: TAction;
    bbGuardar: TBitBtn;
    cbDatosPuentePDF: TCheckBox;
    cbSenasaPDF: TCheckBox;
    cbMuestrasBiolPDF: TCheckBox;
    cbRaya: TCheckBox;
    cbReemplazar: TCheckBox;
    cbDatosPuente: TCheckBox;
    cbRindes: TCheckBox;
    cbCoccion: TCheckBox;
    cbTallas: TCheckBox;
    cbDanio: TCheckBox;
    cbByCatch: TCheckBox;
    dsResumen: TDataSource;
    dedCarpetaPlanillas: TDirectoryEdit;
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
    zqResumencant_muestras_danio: TLargeintField;
    zqResumencant_muestras_raya: TLongintField;
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
    zqTallasfecha: TDateField;
    zqTallashora: TTimeField;
    zqTallasidmarea: TLongintField;
    zqTallasminutos_arrastre: TFloatField;
    zqTallasnrolance: TLongintField;
    zqTallaspeso_muestra_captura: TFloatField;
    zqTallaspeso_muestra_captura_comercial: TFloatField;
    zqTallaspeso_muestra_captura_no_comercial: TFloatField;
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
    procedure GenerarRayaXLS;

    procedure GenerarDatosPuentePDF;
    procedure GenerarSenasaPDF;
    procedure GenerarMuestrasBiolPDF;

  public
    { public declarations }
  end;

var
  fmInformes: TfmInformes;

implementation


{$R *.lfm}

{ TfmInformes }

procedure TfmInformes.acGuardarPlanillasExecute(Sender: TObject);
var
  xls, odf: olevariant;
  gen_ok:boolean;
begin
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
        GenerarByCatchXLS;
        GenerarByCatch2XLS;
      end;
      if cbRaya.Checked then
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
    cbTallas.Checked or cbDanio.Checked or cbByCatch.Checked or cbRaya.Checked
    or cbDatosPuentePDF.Checked or cbSenasaPDF.Checked or cbMuestrasBiolPDF.Checked);
end;

procedure TfmInformes.dedCarpetaPlanillasAcceptDirectory(Sender: TObject;
  var Value: String);
begin
  LSSaveConfig(['destino_informes'],[dedCarpetaPlanillas.Directory]);
//  ipsPreferencias.WriteString('carpeta_destino', dedCarpetaPlanillas.Directory);
end;

procedure TfmInformes.dedCarpetaPlanillasChange(Sender: TObject);
begin
  LSSaveConfig(['destino_informes'],[dedCarpetaPlanillas.Directory]);
//  ipsPreferencias.WriteString('carpeta_destino', dedCarpetaPlanillas.Directory);
end;

procedure TfmInformes.dedCarpetaPlanillasExit(Sender: TObject);
begin
  LSSaveConfig(['destino_informes'],[dedCarpetaPlanillas.Directory]);
//  ipsPreferencias.WriteString('carpeta_destino', dedCarpetaPlanillas.Directory);
end;

procedure TfmInformes.FormShow(Sender: TObject);
var
  destino:String;
begin
  destino:='';
//  destino:= ipsPreferencias.ReadString('carpeta_destino', GetWindowsSpecialDir(CSIDL_PERSONAL));
  LSLoadConfig(['destino_informes'],[destino],[@destino]);
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
      sgResumen.Cells[1,15]:=FieldByName('cant_muestras_raya').AsString;
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
end;

procedure TfmInformes.zqCoccionBeforeOpen(DataSet: TDataSet);
begin
  zqCoccion.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
end;

procedure TfmInformes.zqDanioBeforeOpen(DataSet: TDataSet);
begin
  zqDanio.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
end;

procedure TfmInformes.zqDatosPuenteBeforeOpen(DataSet: TDataSet);
begin
  zqDatosPuente.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
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
end;

procedure TfmInformes.zqResumenBeforeOpen(DataSet: TDataSet);
begin
  zqResumen.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
end;

procedure TfmInformes.zqRindesBeforeOpen(DataSet: TDataSet);
begin
  zqRindes.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
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
  zqDetTallas.ParamByName('hora').AsDateTime := zqTallashora.AsDateTime;
  zqDetTallas.Open;
end;

procedure TfmInformes.zqTallasBeforeOpen(DataSet: TDataSet);
begin
  zqTallas.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
end;

procedure TfmInformes.ZQuery3BeforeOpen(DataSet: TDataSet);
begin
end;

procedure TfmInformes.GenerarDatosPuenteXLS;
var
  xls: olevariant;
  archivo_origen, archivo_destino, tmp: WideString;
  fila, columna: integer;
  relinga: integer;
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
      'PlanillasExcel' + DirectorySeparator + 'Datos puente.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + 'Datos puente.xls';
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
        Fila := 6;//Arranco en la fila 6 porque antes están los títulos
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
          if not FieldByName('comentarios').IsNull then
          begin
            tmp := UTF8Decode(FieldByName('comentarios').AsString);
            xls.Cells[fila, 20] := tmp;
          end;
          if not FieldByName('temperatura_superficie').IsNull then
             xls.Cells[fila, 21] := FieldByName('temperatura_superficie').AsFloat;
          if not FieldByName('temperatura_aire').IsNull then
             xls.Cells[fila, 23] := FieldByName('temperatura_aire').AsFloat;
          if not FieldByName('temperatura_fondo').IsNull then
             xls.Cells[fila, 24] := FieldByName('temperatura_fondo').AsFloat;
          if not FieldByName('cod_estado_mar').IsNull then
             xls.Cells[fila, 25] := FieldByName('cod_estado_mar').AsInteger;
          if not FieldByName('direccion_viento').IsNull then
             xls.Cells[fila, 26] := FieldByName('direccion_viento').AsInteger;
          if not FieldByName('nudos_viento').IsNull then
             xls.Cells[fila, 27] := FieldByName('nudos_viento').AsFloat;
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
      'PlanillasExcel' + DirectorySeparator + 'Rindes.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + 'Rindes.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      xls.Workbooks.Open(archivo_destino);
      //Pongo los datos de la marea
      tmp := UTF8Decode(dmGeneral.zqMareaActivaMareaStr.AsString);
      xls.Cells[1, 2] := tmp;
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
        Fila := 4;//Arranco en la fila 4 porque antes están los títulos
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
      DirectorySeparator + 'Cocción.xls';
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

procedure TfmInformes.GenerarTallasXLS;
var
  xls: olevariant;
  archivo_origen, archivo_destino, tmp: WideString;
  fila, columna, inc_col: integer;
  banda_captura, banda_retenido, banda_descarte: string;
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
      'PlanillasExcel' + DirectorySeparator + 'Tallas.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + 'Tallas.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      //Abro el archivo para guardar los datos
      xls.Workbooks.Open(archivo_destino);
      //Pongo los datos de la marea
      tmp := UTF8Decode(dmGeneral.zqMareaActivaMareaStr.AsString);
      xls.Cells[1, 2] := tmp;
      tmp := UTF8Decode(dmGeneral.zqMareaActivacapitan.AsString);
      xls.Cells[2, 2] := tmp;
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
        fila := 14;
        columna := 2;
        while not EOF do
        begin
          //Datos de encabezado de muestra (sólo en columna de captura)
          if zqTallaspeso_muestra_captura.AsFloat > 0 then
            xls.Cells[4, columna] := zqTallaspeso_muestra_captura.AsFloat;
          if zqTallaspeso_muestra_captura_comercial.AsFloat > 0 then
            xls.Cells[5, columna] := zqTallaspeso_muestra_captura_comercial.AsFloat;
          if zqTallaspeso_muestra_captura_no_comercial.AsFloat > 0 then
            xls.Cells[6, columna] := zqTallaspeso_muestra_captura_no_comercial.AsFloat;
          if zqTallasminutos_arrastre.AsFloat > 0 then
            xls.Cells[7, columna] := zqTallasminutos_arrastre.AsFloat;
          if zqTallasporcent_bolsa_captura.AsFloat > 0 then
            xls.Cells[8, columna] := zqTallasporcent_bolsa_captura.AsFloat;
          //Proceso las tallas
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
            //En la planilla, el detalle de tallas comienza en 1 en la fila 14, es decir, talla+13
            fila := zqDetTallastalla.AsInteger + 13;
            //Salteo los valores nulos o 0 (cero)
            if zqDetTallasnro_ejemplares.AsInteger > 0 then
              xls.Cells[fila, columna + inc_col] := zqDetTallasnro_ejemplares.AsInteger;
            zqDetTallas.Next;
          end;
          //Al finalizar el procesado de las tallas, coloco nro de lance y banda
          if banda_captura <> '' then
          begin
            tmp := UTF8Decode(zqTallasnrolance.AsString + ' ' + banda_captura);
            xls.Cells[10, columna] := tmp;
          end;
          if banda_retenido <> '' then
          begin
            tmp := UTF8Decode(zqTallasnrolance.AsString + ' ' + banda_retenido);
            xls.Cells[10, columna + 1] := tmp;
          end;
          if banda_descarte <> '' then
          begin
            tmp := UTF8Decode(zqTallasnrolance.AsString + ' ' + banda_descarte);
            xls.Cells[10, columna + 2] := tmp;
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
      'PlanillasExcel' + DirectorySeparator + 'dv_plantilla.xls';
    archivo_origen := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'Daño valvar.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + 'Daño valvar.xls';
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
      'PlanillasExcel' + DirectorySeparator + 'fa_plantilla.xls';
    archivo_origen := ExtractFilePath(Application.ExeName) +
      'PlanillasExcel' + DirectorySeparator + 'Fauna acompañante.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + 'Fauna acompañante.xls';
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
        xlp.Range('A1:D30').Copy;
        Sleep(1000);
        while not EOF do
        begin
          rango:=UTF8Decode('A'+IntToStr(fila)+':D'+IntToStr(fila+29));
          //Pego el texto
          xls.Range(rango).PasteSpecial(-4163);
          //Pego formatos
          xls.Range(rango).PasteSpecial(-4122);
          //Pongo los datos de la marea
          tmp := UTF8Decode(dmGeneral.zqMareaActivaMareaStr.AsString);
          xls.Cells[fila+1, 2] := tmp;
          //Completo los datos
          xls.Cells[fila+2, 3] := FieldByName('fecha').AsDateTime;
          xls.Cells[fila+2, 4] := FieldByName('hora').AsDateTime;
          tmp := UTF8Decode(FieldByName('lance_banda').AsString);
          xls.Cells[fila+3, 3] := tmp;
          if not FieldByName('latitud').IsNull then
             xls.Cells[fila+4, 3] := FieldByName('latitud').AsFloat*100;
          if not FieldByName('longitud').IsNull then
             xls.Cells[fila+5, 3] := FieldByName('longitud').AsFloat*100;

          if not FieldByName('profundidad').IsNull then
             xls.Cells[fila+6, 3] := FieldByName('profundidad').AsInteger;
          if not FieldByName('velocidad').IsNull then
             xls.Cells[fila+7, 3] := FieldByName('velocidad').AsFloat;
          if not FieldByName('largo_relinga_inferior').IsNull then
             xls.Cells[fila+8, 3] := FieldByName('largo_relinga_inferior').AsInteger;
          if not FieldByName('mallero_copo').IsNull then
             xls.Cells[fila+9, 3] := FieldByName('mallero_copo').AsInteger;
          if not FieldByName('tipo_malla').IsNull then
          begin
               tmp := UTF8Decode(FieldByName('tipo_malla').AsString);
               xls.Cells[fila+9, 4] := tmp;
          end;
          if not FieldByName('rinde_total').IsNull then
             xls.Cells[fila+10, 3] := FieldByName('rinde_total').AsFloat;
          if not FieldByName('porcent_bolsa_captura').IsNull then
             xls.Cells[fila+11, 3] := FieldByName('porcent_bolsa_captura').AsFloat;
          if not FieldByName('peso_muestra_captura').IsNull then
             xls.Cells[fila+12, 3] := FieldByName('peso_muestra_captura').AsFloat;
          if not FieldByName('peso_total_vieira').IsNull then
             xls.Cells[fila+13, 3] := FieldByName('peso_total_vieira').AsFloat;
          if not FieldByName('peso_valvas').IsNull then
             xls.Cells[fila+14, 3] := FieldByName('peso_valvas').AsFloat;
          if not FieldByName('peso_muestra_fauna_acomp').IsNull then
             xls.Cells[fila+15, 3] := FieldByName('peso_muestra_fauna_acomp').AsFloat;
          xls.Cells[fila+17, 3] := FieldByName('peso_esponjas').AsFloat;
          xls.Cells[fila+18, 3] := FieldByName('peso_ofiuras').AsFloat;
          xls.Cells[fila+19, 3] := FieldByName('peso_estrellas').AsFloat;
          xls.Cells[fila+19, 4] := FieldByName('nro_estrellas').AsInteger;
          xls.Cells[fila+20, 3] := FieldByName('peso_caracoles').AsFloat;
          xls.Cells[fila+20, 4] := FieldByName('nro_caracoles').AsInteger;
          xls.Cells[fila+21, 3] := FieldByName('peso_erizos').AsFloat;
          xls.Cells[fila+21, 4] := FieldByName('nro_erizos').AsInteger;
          xls.Cells[fila+22, 3] := FieldByName('peso_cangrejos').AsFloat;
          xls.Cells[fila+22, 4] := FieldByName('nro_cangrejos').AsInteger;
          xls.Cells[fila+23, 3] := FieldByName('peso_tubos_amarillentos').AsFloat;
          //Peces en captura
          tmp := UTF8Decode(FieldByName('peces1').AsString);
          xls.Cells[fila+25, 1] := tmp;
          tmp := UTF8Decode(FieldByName('peces2').AsString);
          xls.Cells[fila+26, 1] := tmp;
          tmp := UTF8Decode(FieldByName('peces3').AsString);
          xls.Cells[fila+27, 1] := tmp;
          tmp := UTF8Decode(FieldByName('peces4').AsString);
          xls.Cells[fila+28, 1] := tmp;
          tmp := UTF8Decode(FieldByName('peces5').AsString);
          xls.Cells[fila+29, 1] := tmp;
          tmp := UTF8Decode(FieldByName('peces6').AsString);
          xls.Cells[fila+25, 2] := tmp;
          tmp := UTF8Decode(FieldByName('peces7').AsString);
          xls.Cells[fila+26, 2] := tmp;
          tmp := UTF8Decode(FieldByName('peces8').AsString);
          xls.Cells[fila+27, 2] := tmp;
          tmp := UTF8Decode(FieldByName('peces9').AsString);
          xls.Cells[fila+28, 2] := tmp;
          tmp := UTF8Decode(FieldByName('peces10').AsString);
          xls.Cells[fila+29, 2] := tmp;

          pbProceso.Position := RecNo;
          Application.ProcessMessages;
          Next;
          Inc(fila,33);
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
      DirectorySeparator + 'Fauna acompañante detallada.xls';
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

procedure TfmInformes.GenerarRayaXLS;
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
      'PlanillasExcel' + DirectorySeparator + 'Rayas.xls';
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + 'Rayas.xls';
    if (not FileExistsUTF8(archivo_destino)) or (cbReemplazar.Checked) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
      archivo_destino:=UTF8Decode(archivo_destino);
      xls.Workbooks.Open(archivo_destino);
      xls.ActiveWorkBook.Sheets('planilla para completar').Activate;

      //Pongo los datos de la marea
      tmp := UTF8Decode(dmGeneral.zqMareaActivabuque.AsString);
      xls.Cells[2, 2] := tmp;
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
        xls.Cells[2, 10] := zqDatosPuente.RecordCount;
        xls.Cells[4, 10] := zqRaya.RecordCount;

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
          if not FieldByName('nro_bathyraja').IsNull then
             xls.Cells[fila, 7] := FieldByName('nro_bathyraja').AsInteger;
          if not FieldByName('nro_psammobatis').IsNull then
             xls.Cells[fila, 8] := FieldByName('nro_psammobatis').AsInteger;
          if not FieldByName('nro_amblyraja').IsNull then
             xls.Cells[fila, 9] := FieldByName('nro_amblyraja').AsInteger;

          if not FieldByName('lt_max_dipturus').IsNull then
             xls.Cells[fila, 10] := FieldByName('lt_max_dipturus').AsInteger;
          if not FieldByName('lt_min_dipturus').IsNull then
             xls.Cells[fila, 11] := FieldByName('lt_min_dipturus').AsInteger;
          if not FieldByName('lt_max_bathyraja').IsNull then
             xls.Cells[fila, 12] := FieldByName('lt_max_bathyraja').AsInteger;
          if not FieldByName('lt_min_bathyraja').IsNull then
             xls.Cells[fila, 13] := FieldByName('lt_min_bathyraja').AsInteger;
          if not FieldByName('lt_max_psammobatis').IsNull then
             xls.Cells[fila, 14] := FieldByName('lt_max_psammobatis').AsInteger;
          if not FieldByName('lt_min_psammobatis').IsNull then
             xls.Cells[fila, 15] := FieldByName('lt_min_psammobatis').AsInteger;
          if not FieldByName('lt_max_amblyraja').IsNull then
             xls.Cells[fila, 16] := FieldByName('lt_max_amblyraja').AsInteger;
          if not FieldByName('lt_min_amblyraja').IsNull then
             xls.Cells[fila, 17] := FieldByName('lt_min_amblyraja').AsInteger;

          tmp := UTF8Decode(FieldByName('comentarios').AsString);
          xls.Cells[fila, 18] := tmp;
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
