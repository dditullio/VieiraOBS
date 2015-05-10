unit frmmuestrassenasa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, frmbase, db, ZDataset,
  zcontroladorgrilla, datGeneral, frmeditarsenasacallos, frmeditarsenasaentera;

type

  { TfmMuestrasSenasa }

  TfmMuestrasSenasa = class(TfmBase)
    bbAgregar: TBitBtn;
    bbAgregar1: TBitBtn;
    bbBuscar: TBitBtn;
    bbBuscar1: TBitBtn;
    bbEditar: TBitBtn;
    bbEditar1: TBitBtn;
    bbEliminar: TBitBtn;
    bbEliminar1: TBitBtn;
    dsSenasaEntera: TDataSource;
    dsSenasaCallos: TDataSource;
    dbgLista: TRxDBGrid;
    dbgLista1: TRxDBGrid;
    edBuscar: TEdit;
    edBuscar1: TEdit;
    laBuscar: TLabel;
    laBuscar1: TLabel;
    paBuscador: TPanel;
    paBuscador1: TPanel;
    paGrilla: TPanel;
    paGrilla1: TPanel;
    paCallos: TPanel;
    paEntera: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    zcgCallos: TZControladorGrilla;
    zcgEntera: TZControladorGrilla;
    zqSenasaCallos: TZQuery;
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
    zqSenasaCalloslongitud: TFloatField;
    zqSenasaCallosnro_muestra: TLongintField;
    zqSenasaCallosstr_latitud: TStringField;
    zqSenasaCallosstr_longitud: TStringField;
    zqSenasaEntera: TZQuery;
    zqSenasaEnteracuadrante_latitud: TStringField;
    zqSenasaEnteracuadrante_longitud: TStringField;
    zqSenasaEnterafecha: TDateField;
    zqSenasaEnterahora: TTimeField;
    zqSenasaEnteraidmarea: TLongintField;
    zqSenasaEnteraidmuestras_senasa_entera: TLongintField;
    zqSenasaEnteralatitud: TFloatField;
    zqSenasaEnteralongitud: TFloatField;
    zqSenasaEnteranro_muestra: TLongintField;
    zqSenasaEnteraprofundidad: TLongintField;
    zqSenasaEnterastr_latitud: TStringField;
    zqSenasaEnterastr_longitud: TStringField;
    zqSenasaEnteratemp_superficie: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure zqSenasaCallosBeforeOpen(DataSet: TDataSet);
    procedure zqSenasaCallosCalcFields(DataSet: TDataSet);
    procedure zqSenasaEnteraBeforeOpen(DataSet: TDataSet);
    procedure zqSenasaEnteraCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmMuestrasSenasa: TfmMuestrasSenasa;

implementation

{$R *.lfm}

{ TfmMuestrasSenasa }

procedure TfmMuestrasSenasa.zqSenasaCallosCalcFields(DataSet: TDataSet);
begin
  zqSenasaCallosstr_latitud.Value:=FormatFloat('00º 00´', zqSenasaCalloslatitud.Value)+zqSenasaCalloscuadrante_latitud.Value;
  zqSenasaCallosstr_longitud.Value:=FormatFloat('00º 00´', zqSenasaCalloslongitud.Value)+zqSenasaCalloscuadrante_longitud.Value;
end;

procedure TfmMuestrasSenasa.zqSenasaEnteraBeforeOpen(DataSet: TDataSet);
begin
  zqSenasaEntera.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMuestrasSenasa.zqSenasaCallosBeforeOpen(DataSet: TDataSet);
begin
  zqSenasaCallos.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMuestrasSenasa.FormShow(Sender: TObject);
begin
  zcgCallos.Buscar;
  zcgCallos.HabilitarAcciones;
  zcgEntera.Buscar;
  zcgEntera.HabilitarAcciones;
  if edBuscar.CanFocus then
     edBuscar.SetFocus;
end;

procedure TfmMuestrasSenasa.zqSenasaEnteraCalcFields(DataSet: TDataSet);
begin
  zqSenasaEnterastr_latitud.Value:=FormatFloat('00º 00.00´', zqSenasaEnteralatitud.Value)+zqSenasaEnteracuadrante_latitud.Value;
  zqSenasaEnterastr_longitud.Value:=FormatFloat('00º 00.00´', zqSenasaEnteralongitud.Value)+zqSenasaEnteracuadrante_longitud.Value;
end;

end.

