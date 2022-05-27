unit frmbycatch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, DbCtrls, frmlistabase, db, ZDataset,
  zcontroladorgrilla, datGeneral, frmeditarbycatch;

type

  { TfmByCatch }

  TfmByCatch = class(TfmListaBase)
    dbgLista1: TRxDBGrid;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    dsByCatch: TDataSource;
    dsDetByCatch: TDataSource;
    dsDatosMuestra: TDataSource;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    paDatos: TPanel;
    Panel1: TPanel;
    paBaseDatos: TPanel;
    paBaseDetalle: TPanel;
    Splitter1: TSplitter;
    zqByCatch: TZQuery;
    zqByCatchbanda: TStringField;
    zqByCatchcomentarios: TStringField;
    zqByCatchfecha: TDateField;
    zqByCatchhora: TTimeField;
    zqByCatchidmarea: TLongintField;
    zqByCatchidmuestras_bycatch: TLongintField;
    zqByCatchlance_banda: TBytesField;
    zqByCatchnrolance: TLongintField;
    zqByCatchpeces: TStringField;
    zqDatosMuestraarea: TStringField;
    zqDatosMuestrabanda: TStringField;
    zqDatosMuestracomentarios: TStringField;
    zqDatosMuestracuadrante_latitud: TStringField;
    zqDatosMuestracuadrante_longitud: TStringField;
    zqDatosMuestrafecha: TDateField;
    zqDatosMuestrahora: TTimeField;
    zqDatosMuestraidmarea: TLongintField;
    zqDatosMuestraidmuestras_bycatch: TLongintField;
    zqDatosMuestralance_banda: TBytesField;
    zqDatosMuestralargo_relinga_inferior: TLongintField;
    zqDatosMuestralatitud: TFloatField;
    zqDatosMuestralongitud: TFloatField;
    zqDatosMuestramallero_copo: TLongintField;
    zqDatosMuestraminutos_arrastre: TFloatField;
    zqDatosMuestranrolance: TLongintField;
    zqDatosMuestrapeso_muestra_captura: TFloatField;
    zqDatosMuestrapeso_muestra_captura_comercial: TFloatField;
    zqDatosMuestrapeso_muestra_captura_no_comercial: TFloatField;
    zqDatosMuestrapeso_muestra_fauna_acomp: TFloatField;
    zqDatosMuestrapeso_organismos_muestra: TFloatField;
    zqDatosMuestrapeso_otros: TFloatField;
    zqDatosMuestrapeso_total_vieira: TFloatField;
    zqDatosMuestraporcent_bolsa_captura: TFloatField;
    zqDatosMuestraprofundidad: TLongintField;
    zqDatosMuestrarinde_comercial: TFloatField;
    zqDatosMuestrarinde_total: TFloatField;
    zqDatosMuestratipo_malla: TStringField;
    zqDatosMuestraunidad_manejo: TStringField;
    zqDatosMuestravelocidad: TFloatField;
    zqDetByCatch: TZQuery;
    zqDatosMuestra: TZQuery;
    zqDetByCatchcomentarios: TStringField;
    zqDetByCatchDescripcion: TStringField;
    zqDetByCatchidcomponentes_bycatch: TLongintField;
    zqDetByCatchidcomponentes_bycatch_1: TLongintField;
    zqDetByCatchiddetalle_muestras_bycatch: TLongintField;
    zqDetByCatchidmuestras_bycatch: TLongintField;
    zqDetByCatchNombre: TStringField;
    zqDetByCatchnumero: TLongintField;
    zqDetByCatchpeso: TFloatField;
    zqDetByCatchregistra_numero: TSmallintField;
    zqDetByCatchregistra_peso: TSmallintField;
    procedure Label2Click(Sender: TObject);
    procedure zqByCatchAfterScroll(DataSet: TDataSet);
    procedure zqByCatchBeforeOpen(DataSet: TDataSet);
    procedure zqDatosMuestraCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmByCatch: TfmByCatch;

implementation

{$R *.lfm}

{ TfmByCatch }

procedure TfmByCatch.zqByCatchAfterScroll(DataSet: TDataSet);
begin
  zqDetByCatch.Close;
  zqDetByCatch.ParamByName('idmuestras_bycatch').Value:=zqByCatchidmuestras_bycatch.Value;
  zqDetByCatch.Open;
  zqDatosMuestra.Close;
  zqDatosMuestra.ParamByName('idmuestras_bycatch').Value:=zqByCatchidmuestras_bycatch.Value;
  zqDatosMuestra.Open;
end;

procedure TfmByCatch.Label2Click(Sender: TObject);
begin

end;

procedure TfmByCatch.zqByCatchBeforeOpen(DataSet: TDataSet);
begin
  zqByCatch.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmByCatch.zqDatosMuestraCalcFields(DataSet: TDataSet);
begin
  if not zqDatosMuestrapeso_muestra_fauna_acomp.IsNull then
  begin
     zqDatosMuestrapeso_otros.Value:=zqDatosMuestrapeso_muestra_fauna_acomp.Value
       -zqDatosMuestrapeso_organismos_muestra.Value;
  end;
end;

end.

