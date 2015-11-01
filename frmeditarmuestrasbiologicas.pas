unit frmeditarmuestrasbiologicas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, frmzedicionbase,
  datGeneral, ZDataset, zcontroladoredicion, zdatasetgroup,
  DtDBTimeEdit, dtdbcoordedit, DB, funciones;

type

  { TfmEditarMuestrasBiologicas }

  TfmEditarMuestrasBiologicas = class(TZEdicionBase)
    dbdtFecha: TDBDateTimePicker;
    dbdtHora: TDtDBTimeEdit;
    dbedLatitud: TDtDBCoordEdit;
    dbedCaja: TDBEdit;
    dbedLongitud: TDtDBCoordEdit;
    dblkTipo: TDBLookupComboBox;
    dbmContenido: TDBMemo;
    dsTiposMuestra: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    paFechaHora: TPanel;
    zqPrincipalrequiere_posicion: TSmallintField;
    zqPrincipaltipo_muestra: TStringField;
    zqPrincipalcontenido: TStringField;
    zqPrincipalcuadrante_latitud: TStringField;
    zqPrincipalcuadrante_longitud: TStringField;
    zqPrincipalfecha: TDateField;
    zqPrincipalhora: TTimeField;
    zqPrincipalidlance: TLongintField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidmuestras_biologicas: TLongintField;
    zqPrincipalidtipos_muestras_biol: TLongintField;
    zqPrincipalLatitud: TFloatField;
    zqPrincipallongitud: TFloatField;
    zqPrincipalnro_caja: TLongintField;
    zqTiposMuestra: TZQuery;
    zqTiposMuestradescripcion: TStringField;
    zqTiposMuestraidtipos_muestras_biol: TLongintField;
    zqTiposMuestrarequiere_posicion: TSmallintField;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure dblkTipoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure paFechaHoraExit(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject; var ValidacionOK: boolean);
    procedure zqPrincipalhoraSetText(Sender: TField; const aText: string);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarMuestrasBiologicas: TfmEditarMuestrasBiologicas;

implementation

{$R *.lfm}

{ TfmEditarMuestrasBiologicas }

procedure TfmEditarMuestrasBiologicas.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value := dmGeneral.IdMareaActiva;
  zqPrincipalidmuestras_biologicas.Value := zcePrincipal.NuevoID('muestras_biologicas');
  zqPrincipalfecha.Value := Date;
end;

procedure TfmEditarMuestrasBiologicas.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMuestrasBiologicas.dblkTipoExit(Sender: TObject);
begin
  dbedLatitud.Enabled:=zqPrincipalrequiere_posicion.AsBoolean;
  dbedLongitud.Enabled:=zqPrincipalrequiere_posicion.AsBoolean;
end;

procedure TfmEditarMuestrasBiologicas.FormShow(Sender: TObject);
begin
  if zcePrincipal.Accion=ED_MODIFICAR then
  begin
    dbedLatitud.Enabled:=zqPrincipalrequiere_posicion.AsBoolean;
    dbedLongitud.Enabled:=zqPrincipalrequiere_posicion.AsBoolean;
  end;
end;

procedure TfmEditarMuestrasBiologicas.paFechaHoraExit(Sender: TObject);
begin
  if zqPrincipalhora.IsNull then
  begin
    MessageDlg('Debe indicar la hora de la muestra o la hora en que se preparó y numeró la caja', mtWarning, [mbOK], 0);
    if dbdtHora.CanFocus then
      dbdtHora.SetFocus;
  end;
end;

procedure TfmEditarMuestrasBiologicas.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
  if zqPrincipalLatitud.IsNull or zqPrincipallongitud.IsNull then
  begin
    if MessageDlg('No se ha indicado la posición (latitud y longitud) donde se tomó la muestra. En caso de cajas con muestras de callo esto no es necesario. ¿Desea continuar igualmente?',
      mtWarning, mbYesNo, 0)=mrNo then
    begin
      ValidacionOK := False;
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
    end;
  end;

  if zqPrincipalnro_caja.IsNull then
  begin
    ValidacionOK := False;
    MessageDlg(
      'Debe numerar la caja con la muestra e indicar aquí dicho número para una correcta identificación en el momento de desembarque',
      mtWarning, [mbClose], 0);
    if dbedCaja.CanFocus then
      dbedCaja.SetFocus;
  end
  else if zqPrincipalcontenido.IsNull then
  begin
    ValidacionOK := False;
    MessageDlg('Por favor escriba una breve descripción del contenido de la caja',
      mtWarning, [mbClose], 0);
    if dbmContenido.CanFocus then
      dbmContenido.SetFocus;
  end;
end;

procedure TfmEditarMuestrasBiologicas.zqPrincipalhoraSetText(Sender: TField;
  const aText: string);
begin
  inherited;
  if not HoraOK(aText) then
     MessageDlg('La hora ingresada no es correcta. Por favor verifique.', mtError, [mbClose],0)
  else
    sender.AsString:=aText;
end;

end.
