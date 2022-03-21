unit frmeditarsenasaentera;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase,
  ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup, DtDBTimeEdit,
  dtdbcoordedit, db, datGeneral, funciones, dateutils;

type

  { TFmEditarSenasaEntera }

  TFmEditarSenasaEntera = class(TZEdicionBase)
    dbdtFecha: TDBDateTimePicker;
    dbdtHora: TDtDBTimeEdit;
    dbedLatitud: TDtDBCoordEdit;
    dbedLongitud: TDtDBCoordEdit;
    dbedProfundidad: TDBEdit;
    dbesLabMdP: TDBEdit;
    dbedTempSuperf: TDBEdit;
    dbedNroMuestra: TDBEdit;
    dbedLabBsAs: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    paFechaHora: TPanel;
    zqPrincipalcuadrante_latitud: TStringField;
    zqPrincipalcuadrante_longitud: TStringField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalfecha: TDateField;
    zqPrincipalhora: TTimeField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidmuestras_senasa_entera: TLongintField;
    zqPrincipallab_bsas: TLongintField;
    zqPrincipallab_mdp: TLongintField;
    zqPrincipallatitud: TFloatField;
    zqPrincipallongitud: TFloatField;
    zqPrincipalnro_muestra: TLongintField;
    zqPrincipalprofundidad: TLongintField;
    zqPrincipaltemp_superficie: TFloatField;
    zqSenasaEnteraAnt: TZQuery;
    zqSenasaEnteraAntcontramuestra1: TLongintField;
    zqSenasaEnteraAntcontramuestra2: TLongintField;
    zqSenasaEnteraAntcuadrante_latitud: TStringField;
    zqSenasaEnteraAntcuadrante_longitud: TStringField;
    zqSenasaEnteraAntfecha: TDateField;
    zqSenasaEnteraAnthora: TTimeField;
    zqSenasaEnteraAntidmarea: TLongintField;
    zqSenasaEnteraAntidmuestras_senasa_callos: TLongintField;
    zqSenasaEnteraAntlab_bsas: TLongintField;
    zqSenasaEnteraAntlab_mdp: TLongintField;
    zqSenasaEnteraAntlatitud: TFloatField;
    zqSenasaEnteraAntlongitud: TFloatField;
    zqSenasaEnteraAntnro_muestra: TLongintField;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure paFechaHoraExit(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject;
      var ValidacionOK: boolean);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalhoraSetText(Sender: TField; const aText: string);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqSenasaEnteraAntBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FmEditarSenasaEntera: TFmEditarSenasaEntera;

implementation

{$R *.lfm}

{ TFmEditarSenasaEntera }

procedure TFmEditarSenasaEntera.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectDate;
  (Sender as TDBDateTimePicker).SelectTime;
end;

procedure TFmEditarSenasaEntera.FormCreate(Sender: TObject);
begin
  inherited;
  zcePrincipal.OnValidateForm:=@zcePrincipalValidateForm;
end;

procedure TFmEditarSenasaEntera.paFechaHoraExit(Sender: TObject);
begin
  if zqPrincipalhora.IsNull then
  begin
    MessageDlg('Debe indicar la hora de la muestra', mtWarning, [mbOK], 0);
    if dbdtHora.CanFocus then
      dbdtHora.SetFocus;
  end;
end;

procedure TFmEditarSenasaEntera.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
  if zqPrincipalLatitud.IsNull or zqPrincipallongitud.IsNull then
  begin
    ValidacionOK := False;
    MessageDlg('Debe indicar la posición donde se tomó la muestra',
      mtWarning, [mbClose], 0);
    if zqPrincipalLatitud.IsNull then
    begin
      if dbedLatitud.CanFocus then
        dbedLatitud.SetFocus;
    end
    else if zqPrincipallongitud.IsNull then
    begin
      if dbedLongitud.CanFocus then
        dbedLongitud.SetFocus;
    end;
  end
  else if zqPrincipalnro_muestra.IsNull then
  begin
    ValidacionOK := False;
    MessageDlg(
      'Debe indicar el número de muestra',
      mtWarning, [mbClose], 0);
    if dbedNroMuestra.CanFocus then
      dbedNroMuestra.SetFocus;
  end;
end;

procedure TFmEditarSenasaEntera.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  zqPrincipalEncabezado.Value := 'Muestra Nº ' + zqPrincipalnro_muestra.AsString;
end;

procedure TFmEditarSenasaEntera.zqPrincipalhoraSetText(Sender: TField;
  const aText: string);
begin
  if not HoraOK(aText) then
     MessageDlg('La hora ingresada no es correcta. Por favor verifique.', mtError, [mbClose],0)
  else
    sender.AsString:=aText;
end;

procedure TFmEditarSenasaEntera.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value := dmGeneral.IdMareaActiva;
  zqPrincipalidmuestras_senasa_entera.Value :=
    zcePrincipal.NuevoID('muestras_senasa_entera');
  zqPrincipalfecha.Value := Date;
  zqPrincipallab_mdp.Value := 1;
  zqPrincipallab_bsas.Value := 1;

  zqSenasaEnteraAnt.Close;
  zqSenasaEnteraAnt.Open;
  //Si se encuentra un registro anterior seteo algunos
  //valores predeterminados
  zqPrincipalfecha.Value := Date;

  if zqSenasaEnteraAnt.RecordCount>0 then
  begin
    zqPrincipalnro_muestra.Value:=zqSenasaEnteraAntnro_muestra.AsInteger+1;
  end else
  begin
    //Si no hay registro anterior, comienzo en 1
    zqPrincipalnro_muestra.Value := 1;
  end;

end;

procedure TFmEditarSenasaEntera.zqSenasaEnteraAntBeforeOpen(DataSet: TDataSet);
begin
  zqSenasaEnteraAnt.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

end.

