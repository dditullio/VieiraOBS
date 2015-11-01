unit frmeditarcoccion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase,
  datGeneral, ZDataset, zcontroladoredicion, zdatasetgroup,
  DtDBTimeEdit, db, funciones;

type

  { TfmEditarCoccion }

  TfmEditarCoccion = class(TZEdicionBase)
    dbdtFecha: TDBDateTimePicker;
    dbdtHora: TDtDBTimeEdit;
    dbedAntesValvas: TDBEdit;
    dbedDespuesValvas: TDBEdit;
    dbedAntesVivos: TDBEdit;
    dbedDespuesCarnes: TDBEdit;
    dblkBanda: TDBLookupComboBox;
    dbmComentarios: TDBMemo;
    dsBandas: TDataSource;
    gbAntes: TGroupBox;
    gbDespues: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    paFechaHora: TPanel;
    zqPrincipalDscBanda: TStringField;
    zqBandas: TZQuery;
    zqBandasbanda: TStringField;
    zqBandasdescripcion: TStringField;
    zqPrincipalantes_valvas_vacias: TLongintField;
    zqPrincipalantes_vivos: TLongintField;
    zqPrincipalbanda: TStringField;
    zqPrincipalcomentarios: TStringField;
    zqPrincipaldespues_carnes: TLongintField;
    zqPrincipaldespues_valvas_vacias: TLongintField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalfecha: TDateField;
    zqPrincipalhora: TTimeField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidmuestras_coccion: TLongintField;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure dbdtHoraChange(Sender: TObject);
    procedure paFechaHoraExit(Sender: TObject);
    procedure zcePrincipalInitRecord(Sender: TObject);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalhoraSetText(Sender: TField; const aText: string);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarCoccion: TfmEditarCoccion;

implementation

{$R *.lfm}

{ TfmEditarCoccion }

procedure TfmEditarCoccion.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  zqPrincipalEncabezado.Value:=FormatDateTime('dd/mm/yyyy',zqPrincipalfecha.Value)+
    ' '+FormatDateTime('hh:mm',zqPrincipalhora.Value)+
    ' '+zqPrincipalDscBanda.Value;
end;

procedure TfmEditarCoccion.zqPrincipalhoraSetText(Sender: TField;
  const aText: string);
begin
  if not HoraOK(aText) then
     MessageDlg('La hora ingresada no es correcta. Por favor verifique.', mtError, [mbClose],0)
  else
    sender.AsString:=aText;
end;

procedure TfmEditarCoccion.dbdtHoraChange(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectDate;
  (Sender as TDBDateTimePicker).SelectTime;
end;

procedure TfmEditarCoccion.paFechaHoraExit(Sender: TObject);
begin
  if zqPrincipalhora.IsNull then
  begin
    MessageDlg('Debe indicar la hora de la muestra', mtWarning, [mbOK], 0);
    if dbdtHora.CanFocus then
      dbdtHora.SetFocus;
  end;
end;

procedure TfmEditarCoccion.zcePrincipalInitRecord(Sender: TObject);
begin

end;

procedure TfmEditarCoccion.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarCoccion.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmuestras_coccion.Value:=zcePrincipal.NuevoID('muestras_coccion');
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalfecha.Value:=Date;
end;

end.

