unit frmrindes;

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
  Classes, SysUtils, FileUtil, LR_Class, LR_DBSet, DateTimePicker, rxdbgrid,
  Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons, ActnList, StdCtrls,
  DBGrids, DbCtrls, frmlistabase, db, ZDataset, zcontroladorgrilla, datGeneral,
  frmeditarrindes, lr_e_pdf, LSConfig, LCLIntf;

type

  { TfmRindes }

  TfmRindes = class(TfmListaBase)
    bbExportarExcelRindes: TBitBtn;
    bbExportarResumen: TBitBtn;
    bbExportarExcel: TBitBtn;
    cbIncluirSinTallas: TCheckBox;
    cbMostrarResumen: TCheckBox;
    dbgResumen: TRxDBGrid;
    dbtDscResumen: TDBText;
    dsRindes: TDataSource;
    dsResumen: TDataSource;
    dtFecha: TDateTimePicker;
    frDBdsResumenRindes: TfrDBDataSet;
    frResumenRindes: TfrReport;
    frResumenRindes1: TfrReport;
    Label1: TLabel;
    paResumen: TPanel;
    sdGuardarPDF: TSaveDialog;
    sdCarpetaRindes: TSelectDirectoryDialog;
    zcgResumen: TZControladorGrilla;
    zqResumencapt_nro_ejemp_comerciales: TLargeintField;
    zqResumencapt_nro_ejemp_no_comerciales: TLargeintField;
    zqResumencapt_porc_ejemp_no_comerciales: TFloatField;
    zqResumenfecha: TDateField;
    zqResumenhora: TTimeField;
    zqResumenidmarea: TLongintField;
    zqResumenmoda_captura: TLargeintField;
    zqResumenpeso_bycatch: TFloatField;
    zqResumenpeso_mayor_55: TFloatField;
    zqResumenpeso_vieira: TFloatField;
    zqResumenret_nro_ejemp_comerciales: TLargeintField;
    zqResumenret_nro_ejemp_no_comerciales: TLargeintField;
    zqResumenret_porc_ejemp_no_comerciales: TFloatField;
    zqResumenrinde_comercial: TFloatField;
    zqResumenrinde_total: TFloatField;
    zqRindes: TZQuery;
    zqResumen: TZQuery;
    zqRindesbanda: TStringField;
    zqRindescomentarios: TStringField;
    zqRindesDscResumen: TStringField;
    zqRindesfecha: TDateField;
    zqRindeshora: TTimeField;
    zqRindesidmarea: TLongintField;
    zqRindesidmuestras_rinde: TLongintField;
    zqRindeslance_banda: TBytesField;
    zqRindesnrolance: TLongintField;
    zqRindespeso_comercial: TFloatField;
    zqRindespeso_fauna_acomp: TFloatField;
    zqRindespeso_no_comercial: TFloatField;
    zqRindespeso_total: TFloatField;
    zqRindesrinde_comercial: TFloatField;
    zqRindesrinde_total: TFloatField;
    procedure bbExportarResumenClick(Sender: TObject);
    procedure cbIncluirSinTallasChange(Sender: TObject);
    procedure cbMostrarResumenChange(Sender: TObject);
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqResumenAfterOpen(DataSet: TDataSet);
    procedure zqResumenBeforeOpen(DataSet: TDataSet);
    procedure zqRindesAfterOpen(DataSet: TDataSet);
    procedure zqRindesAfterScroll(DataSet: TDataSet);
    procedure zqRindesBeforeOpen(DataSet: TDataSet);
    procedure zqRindesCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmRindes: TfmRindes;

implementation

{$R *.lfm}

{ TfmRindes }

procedure TfmRindes.zqRindesBeforeOpen(DataSet: TDataSet);
begin
  zqRindes.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if dtFecha.Checked then
     zqRindes.ParamByName('fecha').AsDateTime:=dtFecha.Date
  else
    zqRindes.ParamByName('fecha').AsString:='';
end;

procedure TfmRindes.zqRindesCalcFields(DataSet: TDataSet);
begin
  zqRindesDscResumen.Value:=' del día '+FormatDateTime('dd/mm/yyyy', zqRindesfecha.Value);
end;

procedure TfmRindes.dtFechaCheckBoxChange(Sender: TObject);
begin
  if dtFecha.Checked then
     dtFecha.Date:=Date
  else
    dtFecha.Date:=NullDate;
  zcgLista.Buscar;
end;

procedure TfmRindes.FormCreate(Sender: TObject);
var
  bool_conf: Boolean;
begin
  bool_conf := dmGeneral.LeerBooleanConfig('RindesIncluirSinTallas', False);
    cbIncluirSinTallas.Checked := bool_conf;
end;

procedure TfmRindes.FormShow(Sender: TObject);
begin
  dtFecha.Date:=Date;
  inherited;
end;

procedure TfmRindes.zqResumenAfterOpen(DataSet: TDataSet);
begin
  bbExportarResumen.Enabled:=zqResumen.RecordCount>0;
end;

procedure TfmRindes.zqResumenBeforeOpen(DataSet: TDataSet);
begin
  zqResumen.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  zqResumen.ParamByName('fecha').Value:=zqRindesfecha.Value;
//  zqResumen.ParamByName('IncluirSinTallas').AsInteger:= cbIncluirSinTallas.Checked?1:0
  if cbIncluirSinTallas.Checked then
       zqResumen.ParamByName('IncluirSinTallas').AsInteger:=1
    else
      zqResumen.ParamByName('IncluirSinTallas').AsInteger:=0;
end;

procedure TfmRindes.zqRindesAfterOpen(DataSet: TDataSet);
begin
  if cbMostrarResumen.Checked then
    zcgResumen.Buscar;
//  zqResumen.Close;
//  zqResumen.Open;
end;

procedure TfmRindes.zqRindesAfterScroll(DataSet: TDataSet);
begin
  zqResumen.ParamByName('fecha').Value:=zqRindesfecha.Value;
  if cbMostrarResumen.Checked then
    zcgResumen.Buscar;

end;

procedure TfmRindes.dtFechaChange(Sender: TObject);
begin
  zcgLista.Buscar;
end;

procedure TfmRindes.bbExportarResumenClick(Sender: TObject);
var
  archivo_destino: string;
  destino:String;
begin
  destino:=dmGeneral.LeerStringConfig('destino_pdf_rindes', '');
//  LSLoadConfig(['destino_pdf_rindes'],[destino],[@destino]);
  {$IFDEF MSWINDOWS}
  if (destino='') or (not DirectoryExistsUTF8(destino)) then
     destino:=GetWindowsSpecialDir(CSIDL_PERSONAL);
  {$ENDIF}
  sdCarpetaRindes.InitialDir := destino;
  if sdCarpetaRindes.Execute then
  begin
      archivo_destino:=IncludeTrailingPathDelimiter(sdCarpetaRindes.FileName)+'Rindes '+FormatDateTime('yyyy-mm-dd', zqResumenfecha.AsDateTime)+'.pdf';

      if (not FileExistsUTF8(archivo_destino)) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
      begin
          dmGeneral.GuardarStringConfig('destino_pdf_rindes',IncludeTrailingPathDelimiter(sdCarpetaRindes.FileName));
//          LSSaveConfig(['destino_pdf_rindes'],[IncludeTrailingPathDelimiter(sdCarpetaRindes.FileName)]);
          frResumenRindes.PrepareReport;
          //frResumenRindes.ShowReport;
          frResumenRindes.ExportTo(TfrTNPDFExportFilter, archivo_destino);
          if MessageDlg('El informe ha sido guardado en la carpeta indicada. ¿Desea visualizarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
          begin
            OpenDocument(archivo_destino);
          end;
      end;
  end;
end;

procedure TfmRindes.cbIncluirSinTallasChange(Sender: TObject);
begin
    // Guardo la selección de planillas a guardar
  dmGeneral.GuardarBooleanConfig('RindesIncluirSinTallas', cbIncluirSinTallas.Checked);
  if cbMostrarResumen.Checked then
    zcgResumen.Buscar;
end;

procedure TfmRindes.cbMostrarResumenChange(Sender: TObject);
begin
  zqResumen.Close;
  if cbMostrarResumen.Checked then
    zcgResumen.Buscar;
end;

end.

