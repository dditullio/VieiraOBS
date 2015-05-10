unit dattallas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, datBase, db,
  ZDataset, datGeneral, math, funciones;

type

  { TdmTallas }

  TdmTallas = class(TDmBase)
    dsBandas: TDataSource;
    dsTallas: TDataSource;
    dsDetalleTallas: TDataSource;
    dsTiposMuestra: TDataSource;
    zqDetalleTallasEncabezado: TStringField;
    zqTallasDscTipoMuestra: TStringField;
    zqDetalleTallasiddetalle_muestras_talla: TLongintField;
    zqDetalleTallasidmuestras_talla: TLongintField;
    zqDetalleTallasnro_ejemplares: TLongintField;
    zqDetalleTallastalla: TLongintField;
    zqTallasDscBanda: TStringField;
    zqBandas: TZQuery;
    zqBandasbanda: TStringField;
    zqBandasdescripcion: TStringField;
    zqTallas: TZQuery;
    zqDetalleTallas: TZQuery;
    zqTallasbanda: TStringField;
    zqTallascod_tipo_muestra: TStringField;
    zqTallascomentarios: TStringField;
    zqTallasEncabezado: TStringField;
    zqTallasfecha: TDateField;
    zqTallashora: TTimeField;
    zqTallasidlance: TLongintField;
    zqTallasidmarea: TLongintField;
    zqTallasidmuestras_talla: TLongintField;
    zqTallaspeso_total: TFloatField;
    zqTiposMuestra: TZQuery;
    zqTiposMuestracod_tipo_muestra: TStringField;
    zqTiposMuestradescripcion: TStringField;
    zqTiposMuestraorden: TLongintField;
    zqTiposMuestratipo_muestra: TStringField;
    procedure zqDetalleTallasApplyUpdateError(DataSet: TDataSet;
      E: EDatabaseError; var DataAction: TDataAction);
    procedure zqDetalleTallasBeforeApplyUpdates(Sender: TObject);
    procedure zqDetalleTallasBeforeOpen(DataSet: TDataSet);
    procedure zqDetalleTallasBeforePost(DataSet: TDataSet);
    procedure zqDetalleTallasCalcFields(DataSet: TDataSet);
    procedure zqDetalleTallasNewRecord(DataSet: TDataSet);
    procedure zqDetalleTallasnro_ejemplaresValidate(Sender: TField);
    procedure zqTallasCalcFields(DataSet: TDataSet);
    procedure zqTallashoraSetText(Sender: TField; const aText: string);
    procedure zqTallasNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
  end;

var
  dmTallas: TdmTallas;
  max_talla: integer=-1;

implementation

{$R *.lfm}

{ TdmTallas }

procedure TdmTallas.zqDetalleTallasBeforeOpen(DataSet: TDataSet);
begin
  zqDetalleTallas.ParamByName('idmuestras_talla').Value:=zqTallasidmuestras_talla.Value;
end;

procedure TdmTallas.zqDetalleTallasBeforeApplyUpdates(Sender: TObject);
begin
  //Elimino registros sin ejemplares indicados
  with dmTallas do
  begin
    if zqDetalleTallas.RecordCount>0 then
    begin
      zqDetalleTallas.DisableControls;
      zqDetalleTallas.First;
      while not zqDetalleTallas.EOF do
      begin
        if (zqDetalleTallasnro_ejemplares.IsNull) or (zqDetalleTallasnro_ejemplares.AsInteger=0) then
           zqDetalleTallas.Delete;
        zqDetalleTallas.Next;
      end;
      zqDetalleTallas.EnableControls;
    end;
  end;
end;

procedure TdmTallas.zqDetalleTallasApplyUpdateError(DataSet: TDataSet;
  E: EDatabaseError; var DataAction: TDataAction);
begin
end;

procedure TdmTallas.zqDetalleTallasBeforePost(DataSet: TDataSet);
begin
  if (zqDetalleTallas.State in [dsInsert]) and
     (zqDetalleTallastalla.Value>max_talla) then
  begin
     max_talla:=zqDetalleTallastalla.Value;
  end;
end;

procedure TdmTallas.zqDetalleTallasCalcFields(DataSet: TDataSet);
begin
  zqDetalleTallasEncabezado.Value:='Talla '+zqDetalleTallastalla.AsString;
end;

procedure TdmTallas.zqDetalleTallasNewRecord(DataSet: TDataSet);
begin
  zqDetalleTallasidmuestras_talla.Value:=zqTallasidmuestras_talla.Value;
  zqDetalleTallasiddetalle_muestras_talla.Value:=NuevoID('detalle_muestras_talla');
  if max_talla>0 then
     zqDetalleTallastalla.Value:=max_talla+1;
//  zqDetalleTallastalla.Value:=BuscarMaxTalla;
end;

procedure TdmTallas.zqDetalleTallasnro_ejemplaresValidate(Sender: TField);
begin
//  if sender.AsInteger=0 then
//     DatabaseError('Debe indicar el número de ejemplares para la talla correspondiente');
end;

procedure TdmTallas.zqTallasCalcFields(DataSet: TDataSet);
begin
  zqTallasEncabezado.Value:=zqTallasDscTipoMuestra.AsString+
    ' '+FormatDateTime('dd/mm/yyyy',zqTallasfecha.Value)+
    ' '+FormatDateTime('hh:mm',zqTallashora.Value)+
    ' '+zqTallasDscBanda.Value;
end;

procedure TdmTallas.zqTallashoraSetText(Sender: TField; const aText: string);
begin
  if not HoraOK(aText) then
     MessageDlg('La hora ingresada no es correcta. Por favor verifique.', mtError, [mbClose],0)
  else
    sender.AsString:=aText;
end;

procedure TdmTallas.zqTallasNewRecord(DataSet: TDataSet);
var
i: integer;
begin
  zqTallasidmarea.Value:=dmGeneral.IdMareaActiva;
  zqTallasidmuestras_talla.Value:=NuevoID('muestras_talla');
  zqTallasfecha.Value:=Date;
end;

end.

