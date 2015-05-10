unit frmeditarrindes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase,
  ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup, DtDBTimeEdit, db,
  datGeneral, funciones;

type

  { TfmEditarRindes }

  TfmEditarRindes = class(TZEdicionBase)
    dbdtFecha: TDBDateTimePicker;
    dbdtHora: TDtDBTimeEdit;
    dbedComercial: TDBEdit;
    dbedNoComercial: TDBEdit;
    dbedByCatch: TDBEdit;
    dblkBanda: TDBLookupComboBox;
    dbmComentarios: TDBMemo;
    dsBandas: TDataSource;
    dsRindeAnt: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    paFechaHora: TPanel;
    zqRindeAnt: TZQuery;
    zqPrincipalDscBanda: TStringField;
    zqBandas: TZQuery;
    zqBandasbanda: TStringField;
    zqBandasdescripcion: TStringField;
    zqPrincipalbanda: TStringField;
    zqPrincipalcomentarios: TStringField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalfecha: TDateField;
    zqPrincipalhora: TTimeField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidmuestras_rinde: TLongintField;
    zqPrincipalpeso_comercial: TFloatField;
    zqPrincipalpeso_fauna_acomp: TFloatField;
    zqPrincipalpeso_no_comercial: TFloatField;
    zqRindeAntbanda: TStringField;
    zqRindeAntcomentarios: TStringField;
    zqRindeAntfecha: TDateField;
    zqRindeAnthora: TTimeField;
    zqRindeAntidlance: TLongintField;
    zqRindeAntidmarea: TLongintField;
    zqRindeAntidmuestras_rinde: TLongintField;
    zqRindeAntpeso_comercial: TFloatField;
    zqRindeAntpeso_fauna_acomp: TFloatField;
    zqRindeAntpeso_no_comercial: TFloatField;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure dblkBandaExit(Sender: TObject);
    procedure paFechaHoraExit(Sender: TObject);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalhoraSetText(Sender: TField; const aText: string);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqRindeAntBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarRindes: TfmEditarRindes;

implementation

{$R *.lfm}

{ TfmEditarRindes }

procedure TfmEditarRindes.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  zqPrincipalEncabezado.Value:=FormatDateTime('dd/mm/yyyy',zqPrincipalfecha.Value)+
    ' '+FormatDateTime('hh:mm',zqPrincipalhora.Value)+
    ' '+zqPrincipalDscBanda.Value;
end;

procedure TfmEditarRindes.zqPrincipalhoraSetText(Sender: TField;
  const aText: string);
begin
  if not HoraOK(aText) then
     MessageDlg('La hora ingresada no es correcta. Por favor verifique.', mtError, [mbClose],0)
  else
    sender.AsString:=aText;
end;

procedure TfmEditarRindes.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarRindes.dblkBandaExit(Sender: TObject);
begin
  if dblkBanda.Text='' then
  begin
    MessageDlg('Debe indicar la banda desde la cual se tomó la muestra', mtWarning, [mbOK], 0);
    if dblkBanda.CanFocus then
    dblkBanda.SetFocus;
  end;
end;

procedure TfmEditarRindes.paFechaHoraExit(Sender: TObject);
begin
  if zqPrincipalhora.IsNull then
  begin
    MessageDlg('Debe indicar la hora de la muestra', mtWarning, [mbOK], 0);
    if dbdtHora.CanFocus then
      dbdtHora.SetFocus;
  end;
end;

procedure TfmEditarRindes.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalidmuestras_rinde.Value:=zcePrincipal.NuevoID('muestras_rinde');
  zqPrincipalfecha.Value:=Date;
  zqRindeAnt.Close;
  zqRindeAnt.Open;
  //Si se encuentra un registro anterior seteo algunos
  //valores predeterminados
  if zqRindeAnt.RecordCount>0 then
  begin
    // Se considera que siempre se carga primero la banda de estribor
    if zqRindeAntbanda.AsString='E' then
    begin
      zqPrincipalfecha.Value:=zqRindeAntfecha.Value;
      zqPrincipalhora.Value:=zqRindeAnthora.Value;
      zqPrincipalbanda.AsString:='B';
    end else
    begin
      zqPrincipalbanda.AsString:='E';
    end;
  end else
  begin
    //Si no hay registro anterior, comienzo por la banda de estribor
    zqPrincipalbanda.AsString:='E';
  end;
end;

procedure TfmEditarRindes.zqRindeAntBeforeOpen(DataSet: TDataSet);
begin
  zqRindeAnt.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

end.

