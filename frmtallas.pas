unit frmtallas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TADbSource, TASeries, TASources,
  DateTimePicker, rxdbgrid, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ActnList, StdCtrls, DbCtrls, ValEdit, frmlistabase, db, ZDataset,
  zcontroladorgrilla, datGeneral, frmeditartallas;

type

  { TfmTallas }

  TfmTallas = class(TfmListaBase)
    Chart1: TChart;
    Chart1BarSeries1: TBarSeries;
    Chart1BarSeries2: TBarSeries;
    DbChartSource1: TDbChartSource;
    DbChartSource2: TDbChartSource;
    DBText1: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    dsMarcasTallas: TDataSource;
    dsDatosMuestra: TDataSource;
    dsTallasCompleto: TDataSource;
    dsDetalleTallas: TDataSource;
    dsTallas: TDataSource;
    dtFecha: TDateTimePicker;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    zqDatosMuestraarea: TStringField;
    zqDatosMuestrabanda: TStringField;
    zqDatosMuestracod_tipo_muestra: TStringField;
    zqDatosMuestracomentarios: TStringField;
    zqDatosMuestracuadrante_latitud: TStringField;
    zqDatosMuestracuadrante_longitud: TStringField;
    zqDatosMuestrafecha: TDateField;
    zqDatosMuestrahora: TTimeField;
    zqDatosMuestraidmarea: TLongintField;
    zqDatosMuestraidmuestras_talla: TLongintField;
    zqDatosMuestralatitud: TFloatField;
    zqDatosMuestralongitud: TFloatField;
    zqDatosMuestraminutos_arrastre: TFloatField;
    zqDatosMuestranrolance: TLongintField;
    zqDatosMuestranro_ejemplares: TLargeintField;
    zqDatosMuestranro_ejemp_comerciales: TLargeintField;
    zqDatosMuestranro_ejemp_men_35: TLargeintField;
    zqDatosMuestranro_ejemp_no_comerciales: TLargeintField;
    zqDatosMuestrapeso_muestra_captura: TFloatField;
    zqDatosMuestrapeso_muestra_captura_comercial: TFloatField;
    zqDatosMuestrapeso_muestra_captura_no_comercial: TFloatField;
    zqDatosMuestraporcent_bolsa_captura: TFloatField;
    zqDatosMuestraporc_ejemp_comerciales: TFloatField;
    zqDatosMuestraporc_ejemp_men_35: TFloatField;
    zqDatosMuestraporc_ejemp_no_comerciales: TFloatField;
    zqDatosMuestrarinde_comenrcial: TFloatField;
    zqDatosMuestrarinde_total: TFloatField;
    zqDatosMuestratipo_muestra: TStringField;
    zqDetallleTallascolor: TLargeintField;
    zqMarcasTallas: TZQuery;
    zqDetallleTallasiddetalle_muestras_talla: TLongintField;
    zqDetallleTallasidmuestras_talla: TLongintField;
    zqDetallleTallasnro_ejemplares: TLongintField;
    zqDetallleTallastalla: TLongintField;
    zqMarcasTallascolor: TLargeintField;
    zqMarcasTallasmedida: TLargeintField;
    zqMarcasTallasvalor: TLongintField;
    zqTallas: TZQuery;
    zqTallasarea: TStringField;
    zqTallasbanda: TStringField;
    zqTallascod_tipo_muestra: TStringField;
    zqTallascomentarios: TStringField;
    zqTallasCompletoarea: TStringField;
    zqTallasCompletobanda: TStringField;
    zqTallasCompletocod_tipo_muestra: TStringField;
    zqTallasCompletocomentarios: TStringField;
    zqTallasCompletocuadrante_latitud_ini: TStringField;
    zqTallasCompletocuadrante_longitud_ini: TStringField;
    zqTallasCompletofecha: TDateField;
    zqTallasCompletohora: TTimeField;
    zqTallasCompletoidmarea: TLongintField;
    zqTallasCompletoidmuestras_talla: TLongintField;
    zqTallasCompletolance_banda: TBytesField;
    zqTallasCompletolatitud: TFloatField;
    zqTallasCompletolongitud: TFloatField;
    zqTallasCompletominutos_arrastre: TFloatField;
    zqTallasCompletonrolance: TLongintField;
    zqTallasCompletonro_ejemplares: TLargeintField;
    zqTallasCompletonro_ejemp_comerciales: TLargeintField;
    zqTallasCompletonro_ejemp_men_35: TLargeintField;
    zqTallasCompletonro_ejemp_no_comerciales: TLargeintField;
    zqTallasCompletopeso_muestra_captura: TFloatField;
    zqTallasCompletopeso_muestra_captura_comercial: TFloatField;
    zqTallasCompletopeso_muestra_captura_no_comercial: TFloatField;
    zqTallasCompletoporcent_bolsa_captura: TFloatField;
    zqTallasCompletoporc_ejemp_comerciales: TFloatField;
    zqTallasCompletoporc_ejemp_men_35: TFloatField;
    zqTallasCompletoporc_ejemp_no_comerciales: TFloatField;
    zqTallasCompletorinde_comenrcial: TFloatField;
    zqTallasCompletorinde_total: TFloatField;
    zqTallasfecha: TDateField;
    zqTallashora: TTimeField;
    zqTallasidlance: TLongintField;
    zqTallasidmarea: TLongintField;
    zqTallasidmuestras_talla: TLongintField;
    zqTallaslance_banda: TBytesField;
    zqTallasnrolance: TLongintField;
    zqTallaspeso_muestra_captura: TFloatField;
    zqTallastipo_muestra: TStringField;
    zqTallasCompleto: TZQuery;
    zqDetallleTallas: TZQuery;
    zqDatosMuestra: TZQuery;
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure zqDatosMuestraBeforeOpen(DataSet: TDataSet);
    procedure zqDetallleTallasBeforeOpen(DataSet: TDataSet);
    procedure zqMarcasTallasBeforeOpen(DataSet: TDataSet);
    procedure zqTallasAfterOpen(DataSet: TDataSet);
    procedure zqTallasAfterScroll(DataSet: TDataSet);
    procedure zqTallasBeforeOpen(DataSet: TDataSet);
    procedure zqTallasCompletoBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmTallas: TfmTallas;

implementation

{$R *.lfm}

{ TfmTallas }

procedure TfmTallas.zqTallasBeforeOpen(DataSet: TDataSet);
begin
  zqTallas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if dtFecha.Checked then
     zqTallas.ParamByName('fecha').AsDateTime:=dtFecha.Date
  else
    zqTallas.ParamByName('fecha').AsString:='';
end;

procedure TfmTallas.zqTallasAfterScroll(DataSet: TDataSet);
begin
  zqTallasCompleto.Close;
  zqTallasCompleto.Open;
  zqDetallleTallas.Close;
  zqDetallleTallas.Open;
  zqMarcasTallas.Close;
  zqMarcasTallas.Open;
  zqDatosMuestra.Close;
  zqDatosMuestra.Open;
  Chart1.Refresh;
end;

procedure TfmTallas.zqDetallleTallasBeforeOpen(DataSet: TDataSet);
begin
  zqDetallleTallas.ParamByName('idmuestras_talla').Value:=zqTallasidmuestras_talla.Value;
end;

procedure TfmTallas.zqDatosMuestraBeforeOpen(DataSet: TDataSet);
begin
  zqDatosMuestra.ParamByName('idmuestras_talla').Value:=zqTallasidmuestras_talla.Value;
end;

procedure TfmTallas.Label15Click(Sender: TObject);
begin

end;

procedure TfmTallas.dtFechaCheckBoxChange(Sender: TObject);
begin
  if dtFecha.Checked then
     dtFecha.Date:=Date
  else
    dtFecha.Date:=NullDate;
  zcgLista.Buscar;
end;

procedure TfmTallas.FormShow(Sender: TObject);
begin
  dtFecha.Date:=Date;
  inherited;
end;

procedure TfmTallas.dtFechaChange(Sender: TObject);
begin
  zcgLista.Buscar;
end;

procedure TfmTallas.zqMarcasTallasBeforeOpen(DataSet: TDataSet);
begin
  zqMarcasTallas.ParamByName('idmuestras_talla').Value:=zqTallasidmuestras_talla.Value;
end;

procedure TfmTallas.zqTallasAfterOpen(DataSet: TDataSet);
begin
  zqTallasCompleto.Close;
  zqTallasCompleto.Open;
  zqDetallleTallas.Close;
  zqDetallleTallas.Open;
  zqMarcasTallas.Close;
  zqMarcasTallas.Open;
  zqDatosMuestra.Close;
  zqDatosMuestra.Open;
  Chart1.Refresh;
end;

procedure TfmTallas.zqTallasCompletoBeforeOpen(DataSet: TDataSet);
begin
  zqTallasCompleto.ParamByName('idmuestras_talla').Value:=zqTallasidmuestras_talla.Value;
end;

end.

