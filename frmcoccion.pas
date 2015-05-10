unit frmcoccion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, rxdbgrid, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, ActnList, StdCtrls, DBGrids,
  frmlistabase, db, ZDataset, zcontroladorgrilla, datGeneral, frmeditarcoccion;

type

  { TfmCoccion }

  TfmCoccion = class(TfmListaBase)
    dtFecha: TDateTimePicker;
    dsCoccion: TDataSource;
    zqCoccion: TZQuery;
    zqCoccionantes_valvas_vacias: TLongintField;
    zqCoccionantes_vivos: TLongintField;
    zqCoccionbanda: TStringField;
    zqCoccioncomentarios: TStringField;
    zqCocciondespues_carnes: TLongintField;
    zqCocciondespues_valvas_vacias: TLongintField;
    zqCoccionfecha: TDateField;
    zqCoccionhora: TTimeField;
    zqCoccionidmarea: TLongintField;
    zqCoccionidmuestras_coccion: TLongintField;
    zqCoccionlance_banda: TBytesField;
    zqCoccionnrolance: TLongintField;
    zqCoccionperdida: TFloatField;
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqCoccionBeforeOpen(DataSet: TDataSet);
    procedure zqCoccionCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmCoccion: TfmCoccion;

implementation

{$R *.lfm}

{ TfmCoccion }

procedure TfmCoccion.zqCoccionBeforeOpen(DataSet: TDataSet);
begin
  zqCoccion.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if dtFecha.Checked then
     zqCoccion.ParamByName('fecha').AsDateTime:=dtFecha.Date
  else
    zqCoccion.ParamByName('fecha').AsString:='';
end;

procedure TfmCoccion.dtFechaCheckBoxChange(Sender: TObject);
begin
  if dtFecha.Checked then
     dtFecha.Date:=Date
  else
    dtFecha.Date:=NullDate;
  zcgLista.Buscar;
end;

procedure TfmCoccion.FormShow(Sender: TObject);
begin
  dtFecha.Date:=Date;
  inherited;
end;

procedure TfmCoccion.dtFechaChange(Sender: TObject);
begin
  zcgLista.Buscar;
end;

procedure TfmCoccion.zqCoccionCalcFields(DataSet: TDataSet);
begin

end;

end.

