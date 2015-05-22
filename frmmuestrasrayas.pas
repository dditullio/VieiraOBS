unit frmmuestrasrayas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, rxdbgrid, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, ActnList, StdCtrls, frmlistabase, db,
  ZDataset, zcontroladorgrilla, frmeditarrayas, datGeneral;

type

  { TfmMuestrasRayas }

  TfmMuestrasRayas = class(TfmListaBase)
    dsMuestrasRayas: TDataSource;
    zqMuestrasRayas: TZQuery;
    zqMuestrasRayascomentarios: TStringField;
    zqMuestrasRayasfecha: TDateField;
    zqMuestrasRayashora: TTimeField;
    zqMuestrasRayasidlance: TLongintField;
    zqMuestrasRayasidmarea: TLongintField;
    zqMuestrasRayasidmuestra_rayas: TLongintField;
    zqMuestrasRayaslatitud_fin: TStringField;
    zqMuestrasRayaslatitud_fin_fmt: TStringField;
    zqMuestrasRayaslongitud_fin: TStringField;
    zqMuestrasRayaslongitud_fin_fmt: TStringField;
    zqMuestrasRayaslt_max_amblyraja: TLongintField;
    zqMuestrasRayaslt_max_bathyraja: TLongintField;
    zqMuestrasRayaslt_max_dipturus: TLongintField;
    zqMuestrasRayaslt_max_psammobatis: TLongintField;
    zqMuestrasRayaslt_min_amblyraja: TLongintField;
    zqMuestrasRayaslt_min_bathyraja: TLongintField;
    zqMuestrasRayaslt_min_dipturus: TLongintField;
    zqMuestrasRayaslt_min_psammobatis: TLongintField;
    zqMuestrasRayasnrolance: TLongintField;
    zqMuestrasRayasnro_amblyraja: TLongintField;
    zqMuestrasRayasnro_bathyraja: TLongintField;
    zqMuestrasRayasnro_dipturus: TLongintField;
    zqMuestrasRayasnro_psammobatis: TLongintField;
    zqMuestrasRayasprofundidad: TLongintField;
    procedure zqMuestrasRayasBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmMuestrasRayas: TfmMuestrasRayas;

implementation

{$R *.lfm}

{ TfmMuestrasRayas }

procedure TfmMuestrasRayas.zqMuestrasRayasBeforeOpen(DataSet: TDataSet);
begin
  zqMuestrasRayas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

end.

