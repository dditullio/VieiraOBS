unit frmeditarsenasacallos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, frmzedicionbase,
  ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup, DtDBTimeEdit,
  dtdbcoordedit, DB, datGeneral, funciones, dateutils;

type

  { TfmEditarSenasaCallos }

  TfmEditarSenasaCallos = class(TZEdicionBase)
    dbdtFecha: TDBDateTimePicker;
    dbdtHora: TDtDBTimeEdit;
    dbedCM1: TDBEdit;
    dbedCM2: TDBEdit;
    dbedLatitud: TDtDBCoordEdit;
    dbedLongitud: TDtDBCoordEdit;
    dbedNroMuestra: TDBEdit;
    dbedLabMDP: TDBEdit;
    dbedLabBsAs: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    paFechaHora: TPanel;
    zqPrincipalcontramuestra1: TLongintField;
    zqPrincipalcontramuestra2: TLongintField;
    zqPrincipalcuadrante_latitud: TStringField;
    zqPrincipalcuadrante_longitud: TStringField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalfecha: TDateField;
    zqPrincipalhora: TTimeField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidmuestras_senasa_callos: TLongintField;
    zqPrincipallab_bsas: TLongintField;
    zqPrincipallab_mdp: TLongintField;
    zqPrincipallatitud: TFloatField;
    zqPrincipallongitud: TFloatField;
    zqPrincipalnro_muestra: TLongintField;
    zqSenasaCallosAnt: TZQuery;
    zqSenasaCallosAntcontramuestra1: TLongintField;
    zqSenasaCallosAntcontramuestra2: TLongintField;
    zqSenasaCallosAntcuadrante_latitud: TStringField;
    zqSenasaCallosAntcuadrante_longitud: TStringField;
    zqSenasaCallosAntfecha: TDateField;
    zqSenasaCallosAnthora: TTimeField;
    zqSenasaCallosAntidmarea: TLongintField;
    zqSenasaCallosAntidmuestras_senasa_callos: TLongintField;
    zqSenasaCallosAntlab_bsas: TLongintField;
    zqSenasaCallosAntlab_mdp: TLongintField;
    zqSenasaCallosAntlatitud: TFloatField;
    zqSenasaCallosAntlongitud: TFloatField;
    zqSenasaCallosAntnro_muestra: TLongintField;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure paFechaHoraExit(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject; var ValidacionOK: boolean);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalhoraSetText(Sender: TField; const aText: string);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqSenasaCallosAntBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarSenasaCallos: TfmEditarSenasaCallos;

implementation

{$R *.lfm}

{ TfmEditarSenasaCallos }

procedure TfmEditarSenasaCallos.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value := dmGeneral.IdMareaActiva;
  zqPrincipalidmuestras_senasa_callos.Value :=
    zcePrincipal.NuevoID('muestras_senasa_callos');
  zqPrincipalcontramuestra1.Value := 1;
  zqPrincipalcontramuestra2.Value := 1;
  zqPrincipallab_mdp.Value := 1;
  zqPrincipallab_bsas.Value := 1;

  zqSenasaCallosAnt.Close;
  zqSenasaCallosAnt.Open;
  //Si se encuentra un registro anterior seteo algunos
  //valores predeterminados
  if zqSenasaCallosAnt.RecordCount>0 then
  begin
    zqPrincipalfecha.Value:=IncDay(zqSenasaCallosAntfecha.Value);
    zqPrincipalnro_muestra.Value:=zqSenasaCallosAntnro_muestra.AsInteger+1;
  end else
  begin
    //Si no hay registro anterior, comienzo por la banda de estribor
    zqPrincipalfecha.Value := Date;
    zqPrincipalnro_muestra.Value := 1;
  end;
end;

procedure TfmEditarSenasaCallos.zqSenasaCallosAntBeforeOpen(DataSet: TDataSet);
begin
  zqSenasaCallosAnt.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmEditarSenasaCallos.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  zqPrincipalEncabezado.Value := 'Muestra de callos Nº ' + zqPrincipalnro_muestra.AsString;
end;

procedure TfmEditarSenasaCallos.zqPrincipalhoraSetText(Sender: TField;
  const aText: string);
begin
  if not HoraOK(aText) then
     MessageDlg('La hora ingresada no es correcta. Por favor verifique.', mtError, [mbClose],0)
  else
    sender.AsString:=aText;
end;

procedure TfmEditarSenasaCallos.zcePrincipalValidateForm(Sender: TObject;
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

procedure TfmEditarSenasaCallos.paFechaHoraExit(Sender: TObject);
begin
  if zqPrincipalhora.IsNull then
  begin
    MessageDlg('Debe indicar la hora de la muestra', mtWarning, [mbOK], 0);
    if dbdtHora.CanFocus then
      dbdtHora.SetFocus;
  end;
end;

procedure TfmEditarSenasaCallos.FormCreate(Sender: TObject);
begin
  inherited;
  zcePrincipal.OnValidateForm:=@zcePrincipalValidateForm;
end;

procedure TfmEditarSenasaCallos.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectDate;
  (Sender as TDBDateTimePicker).SelectTime;
end;

end.

