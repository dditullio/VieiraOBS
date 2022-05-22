unit frmeditarproduccion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, frmzedicionbase,
  ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup, DtDBTimeEdit,
  dtdbcoordedit, DB, datGeneral, funciones, dateutils;

type

  { TfmEditarProduccion }

  TfmEditarProduccion = class(TZEdicionBase)
    dbdtFecha: TDBDateTimePicker;
    dbedProduccion: TDBEdit;
    Label1: TLabel;
    Label5: TLabel;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalfecha: TDateField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidproduccion: TLongintField;
    zqPrincipalpeso_total_produccion: TFloatField;
    zqProduccionAnt: TZQuery;
    zqProduccionAntfecha: TDateField;
    zqProduccionAntidmarea: TLongintField;
    zqProduccionAntidproduccion: TLongintField;
    zqProduccionAntpeso_total_produccion: TFloatField;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject; var ValidacionOK: boolean);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqProduccionAntBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarProduccion: TfmEditarProduccion;

implementation

{$R *.lfm}

{ TfmEditarProduccion }

procedure TfmEditarProduccion.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value := dmGeneral.IdMareaActiva;
  zqPrincipalidproduccion.Value :=
    zcePrincipal.NuevoID('produccion');

  zqProduccionAnt.Close;
  zqProduccionAnt.Open;
  //Si se encuentra un registro anterior seteo algunos
  //valores predeterminados
  if zqProduccionAnt.RecordCount>0 then
  begin
    zqPrincipalfecha.Value:=IncDay(zqProduccionAntfecha.Value);
  end else
  begin
    //Si no hay registro anterior, comienzo en 1
    zqPrincipalfecha.Value := Date;
  end;
end;

procedure TfmEditarProduccion.zqProduccionAntBeforeOpen(DataSet: TDataSet);
begin
  zqProduccionAnt.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmEditarProduccion.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  zqPrincipalEncabezado.Value := 'Producción del ' + zqPrincipalfecha.AsString;
end;

procedure TfmEditarProduccion.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
  if zqPrincipalfecha.IsNull then
  begin
    ValidacionOK := False;
    MessageDlg('Debe indicar la fecha',
      mtWarning, [mbClose], 0);
      if dbdtFecha.CanFocus then
        dbdtFecha.SetFocus;
  end
  else if zqPrincipalpeso_total_produccion.IsNull then
  begin
    ValidacionOK := False;
    MessageDlg(
      'Debe indicar los Kg. de produccion',
      mtWarning, [mbClose], 0);
    if dbedProduccion.CanFocus then
      dbedProduccion.SetFocus;
  end;
end;


procedure TfmEditarProduccion.FormCreate(Sender: TObject);
begin
  inherited;
  zcePrincipal.OnValidateForm:=@zcePrincipalValidateForm;
end;

procedure TfmEditarProduccion.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectDate;
  (Sender as TDBDateTimePicker).SelectTime;
end;

end.

