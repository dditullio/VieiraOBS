unit frmrindes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, rxdbgrid, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, ActnList, StdCtrls, DBGrids, DbCtrls,
  frmlistabase, db, ZDataset, zcontroladorgrilla, datGeneral, frmeditarrindes;

type

  { TfmRindes }

  TfmRindes = class(TfmListaBase)
    dbgLista1: TRxDBGrid;
    dbtDscResumen: TDBText;
    dsRindes: TDataSource;
    dsResumen: TDataSource;
    dtFecha: TDateTimePicker;
    Label1: TLabel;
    paResumen: TPanel;
    zqResumenfecha: TDateField;
    zqResumenhora: TTimeField;
    zqResumenidmarea: TLongintField;
    zqResumenpeso_bycatch: TFloatField;
    zqResumenpeso_mayor_55: TFloatField;
    zqResumenpeso_vieira: TFloatField;
    zqResumenrinde_comercial: TFloatField;
    zqResumenrinde_total: TFloatField;
    zqRindes: TZQuery;
    zqResumen: TZQuery;
    zqRindesbanda: TStringField;
    zqRindescomentarios: TStringField;
    zqRindesDscResumen: TStringField;
    zqRindesfecha: TDateField;
    zqRindeshora: TTimeField;
    zqRindesidmarea: TLongintField;
    zqRindesidmuestras_rinde: TLongintField;
    zqRindeslance_banda: TBytesField;
    zqRindesnrolance: TLongintField;
    zqRindespeso_comercial: TFloatField;
    zqRindespeso_fauna_acomp: TFloatField;
    zqRindespeso_no_comercial: TFloatField;
    zqRindespeso_total: TFloatField;
    zqRindesrinde_comercial: TFloatField;
    zqRindesrinde_total: TFloatField;
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqResumenBeforeOpen(DataSet: TDataSet);
    procedure zqRindesAfterOpen(DataSet: TDataSet);
    procedure zqRindesAfterScroll(DataSet: TDataSet);
    procedure zqRindesBeforeOpen(DataSet: TDataSet);
    procedure zqRindesCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmRindes: TfmRindes;

implementation

{$R *.lfm}

{ TfmRindes }

procedure TfmRindes.zqRindesBeforeOpen(DataSet: TDataSet);
begin
  zqRindes.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if dtFecha.Checked then
     zqRindes.ParamByName('fecha').AsDateTime:=dtFecha.Date
  else
    zqRindes.ParamByName('fecha').AsString:='';
end;

procedure TfmRindes.zqRindesCalcFields(DataSet: TDataSet);
begin
  zqRindesDscResumen.Value:=' del día '+FormatDateTime('dd/mm/yyyy', zqRindesfecha.Value);
end;

procedure TfmRindes.dtFechaCheckBoxChange(Sender: TObject);
begin
  if dtFecha.Checked then
     dtFecha.Date:=Date
  else
    dtFecha.Date:=NullDate;
  zcgLista.Buscar;
end;

procedure TfmRindes.FormShow(Sender: TObject);
begin
  dtFecha.Date:=Date;
  inherited;
end;

procedure TfmRindes.zqResumenBeforeOpen(DataSet: TDataSet);
begin
  zqResumen.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmRindes.zqRindesAfterOpen(DataSet: TDataSet);
begin
  zqResumen.ParamByName('fecha').Value:=zqRindesfecha.Value;
  zqResumen.Close;
  zqResumen.Open;
end;

procedure TfmRindes.zqRindesAfterScroll(DataSet: TDataSet);
begin
  zqResumen.ParamByName('fecha').Value:=zqRindesfecha.Value;
  zqResumen.Close;
  zqResumen.Open;

end;

procedure TfmRindes.dtFechaChange(Sender: TObject);
begin
  zcgLista.Buscar;
end;

end.

