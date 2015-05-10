unit frmrptdatospuente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, RLReport,
  RLPrintDialog, RLPreviewForm, RLSaveDialog, Forms,
  Controls, Graphics, Dialogs, datGeneral;

type

  { TFmRptDatosPuente }

  TFmRptDatosPuente = class(TForm)
    dsDatosPuente: TDataSource;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLDBMemo1: TRLDBMemo;
    RLDBText1: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLImage1: TRLImage;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    rlrDatosPuente: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    zqDatosPuente: TZQuery;
    zqDatosPuentecable_babor: TLongintField;
    zqDatosPuentecable_estribor: TLongintField;
    zqDatosPuenteCapturaBabor: TLongintField;
    zqDatosPuenteCapturaEstribor: TLongintField;
    zqDatosPuentecaptura_babor: TFloatField;
    zqDatosPuentecaptura_estribor: TFloatField;
    zqDatosPuentecod_estado_mar: TLongintField;
    zqDatosPuentecomentarios: TStringField;
    zqDatosPuentecuadrante_latitud_fin: TStringField;
    zqDatosPuentecuadrante_latitud_ini: TStringField;
    zqDatosPuentecuadrante_longitud_fin: TStringField;
    zqDatosPuentecuadrante_longitud_ini: TStringField;
    zqDatosPuentedireccion_viento: TLongintField;
    zqDatosPuentefecha: TDateField;
    zqDatosPuentegrados_latitud_fin: TLongintField;
    zqDatosPuentegrados_latitud_ini: TLongintField;
    zqDatosPuentegrados_longitud_fin: TLongintField;
    zqDatosPuentegrados_longitud_ini: TLongintField;
    zqDatosPuentehora: TTimeField;
    zqDatosPuenteidlance: TLongintField;
    zqDatosPuenteidmarea: TLongintField;
    zqDatosPuentelargo_relinga_inferior: TLongintField;
    zqDatosPuentelatitud_fin: TStringField;
    zqDatosPuentelatitud_fin_fmt: TStringField;
    zqDatosPuentelatitud_ini: TStringField;
    zqDatosPuentelatitud_ini_fmt: TStringField;
    zqDatosPuentelongitud_fin: TStringField;
    zqDatosPuentelongitud_fin_fmt: TStringField;
    zqDatosPuentelongitud_ini: TStringField;
    zqDatosPuentelongitud_ini_fmt: TStringField;
    zqDatosPuentemallero_copo_mm: TLongintField;
    zqDatosPuenteminutos_arrastre: TFloatField;
    zqDatosPuenteminutos_latitud_fin: TFloatField;
    zqDatosPuenteminutos_latitud_ini: TFloatField;
    zqDatosPuenteminutos_longitud_fin: TFloatField;
    zqDatosPuenteminutos_longitud_ini: TFloatField;
    zqDatosPuentenro_lance: TLongintField;
    zqDatosPuentenudos_viento: TLongintField;
    zqDatosPuenteprofundidad: TLongintField;
    zqDatosPuenterinde_comercial_B: TFloatField;
    zqDatosPuenterinde_comercial_E: TFloatField;
    zqDatosPuenterinde_total_B: TFloatField;
    zqDatosPuenterinde_total_E: TFloatField;
    zqDatosPuenterumbo: TLongintField;
    zqDatosPuentetemperatura_aire: TFloatField;
    zqDatosPuentetemperatura_fondo: TFloatField;
    zqDatosPuentetemperatura_superficie: TFloatField;
    zqDatosPuentetipo_malla: TStringField;
    zqDatosPuentevelocidad: TFloatField;
    procedure zqDatosPuenteBeforeOpen(DataSet: TDataSet);
    procedure zqDatosPuenteCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FmRptDatosPuente: TFmRptDatosPuente;

implementation

{$R *.lfm}

{ TFmRptDatosPuente }

procedure TFmRptDatosPuente.zqDatosPuenteBeforeOpen(DataSet: TDataSet);
begin
  zqDatosPuente.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TFmRptDatosPuente.zqDatosPuenteCalcFields(DataSet: TDataSet);
begin
  if not zqDatosPuentecaptura_estribor.IsNull then
     zqDatosPuenteCapturaEstribor.AsInteger:=round(zqDatosPuentecaptura_estribor.Value*100);
  if not zqDatosPuentecaptura_babor.IsNull then
     zqDatosPuenteCapturaBabor.AsInteger:=round(zqDatosPuentecaptura_babor.Value*100);
end;

end.

