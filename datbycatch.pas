unit datbycatch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, datGeneral,
  zcontroladoredicion, datBase, funciones, Dialogs;

type

  { TdmByCatch }

  TdmByCatch = class(TDmBase)
    dsBandas: TDataSource;
    dsByCatch: TDataSource;
    dsDetByCatch: TDataSource;
    dsCompByCatch: TDataSource;
    zqDetByCatchRegistraNumero: TSmallintField;
    zqDetByCatchRegistraPeso: TSmallintField;
    zqByCatchDscBanda: TStringField;
    zqBandas: TZQuery;
    zqBandasbanda: TStringField;
    zqBandasdescripcion: TStringField;
    zqByCatchEncabezado: TStringField;
    zqDetByCatchEspecie: TStringField;
    zqByCatch: TZQuery;
    zqByCatchbanda: TStringField;
    zqByCatchcomentarios: TStringField;
    zqByCatchfecha: TDateField;
    zqByCatchhora: TTimeField;
    zqByCatchidmarea: TLongintField;
    zqByCatchidmuestras_bycatch: TLongintField;
    zqByCatchpeces: TStringField;
    zqDetByCatch: TZQuery;
    zqCompByCatch: TZQuery;
    zqDetByCatchcomentarios: TStringField;
    zqDetByCatchidcomponentes_bycatch: TLongintField;
    zqDetByCatchiddetalle_muestras_bycatch: TLongintField;
    zqDetByCatchidmuestras_bycatch: TLongintField;
    zqDetByCatchnumero: TLongintField;
    zqDetByCatchpeso: TFloatField;
    zupDetByCatch: TZUpdateSQL;
    procedure zqByCatchCalcFields(DataSet: TDataSet);
    procedure zqByCatchhoraSetText(Sender: TField; const aText: string);
    procedure zqByCatchNewRecord(DataSet: TDataSet);
    procedure zqDetByCatchBeforeOpen(DataSet: TDataSet);
    procedure zqDetByCatchidcomponentes_bycatchValidate(Sender: TField);
    procedure zqDetByCatchNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  dmByCatch: TdmByCatch;

implementation

{$R *.lfm}

{ TdmByCatch }

procedure TdmByCatch.zqByCatchNewRecord(DataSet: TDataSet);
begin
  zqByCatchidmuestras_bycatch.Value:=NuevoID('muestras_bycatch');
  zqByCatchidmarea.Value:=dmGeneral.IdMareaActiva;
  zqByCatchfecha.Value:=Date;
end;

procedure TdmByCatch.zqDetByCatchBeforeOpen(DataSet: TDataSet);
begin
  zqDetByCatch.ParamByName('idmuestras_bycatch').Value:=zqByCatchidmuestras_bycatch.Value;
end;

procedure TdmByCatch.zqDetByCatchidcomponentes_bycatchValidate(Sender: TField);
begin
  if not zqDetByCatchRegistraPeso.AsBoolean then
     zqDetByCatchpeso.AsVariant:=Null;
  if not zqDetByCatchRegistraNumero.AsBoolean then
     zqDetByCatchnumero.AsVariant:=Null;
end;

procedure TdmByCatch.zqByCatchCalcFields(DataSet: TDataSet);
begin
  zqByCatchEncabezado.Value:=FormatDateTime('dd/mm/yyyy',zqByCatchfecha.Value)+
    ' '+FormatDateTime('hh:mm',zqByCatchhora.Value)+
    ' '+zqByCatchDscBanda.Value;
end;

procedure TdmByCatch.zqByCatchhoraSetText(Sender: TField; const aText: string);
begin
  if not HoraOK(aText) then
     MessageDlg('La hora ingresada no es correcta. Por favor verifique.', mtError, [mbClose],0)
  else
    sender.AsString:=aText;
end;

procedure TdmByCatch.zqDetByCatchNewRecord(DataSet: TDataSet);
begin
  zqDetByCatchiddetalle_muestras_bycatch.Value:=NuevoID('detalle_muestras_bycatch');
  zqDetByCatchidmuestras_bycatch.Value:=zqByCatchidmuestras_bycatch.Value;
end;

end.

