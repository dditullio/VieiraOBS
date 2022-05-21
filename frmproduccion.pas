unit frmproduccion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, rxdbgrid, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, ActnList, StdCtrls, frmlistabase, db,
  ZDataset, zcontroladorgrilla, frmeditarrayas, datGeneral;

type

  { TfmProduccion }

  TfmProduccion = class(TfmListaBase)
    dsMuestrasRayas: TDataSource;
    zqProduccion: TZQuery;
    zqProduccionfecha: TDateField;
    zqProduccionidmarea: TLongintField;
    zqProduccionidproduccion: TLongintField;
    zqProduccionpeso_total_produccion: TFloatField;
    procedure zqProduccionBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmProduccion: TfmProduccion;

implementation

{$R *.lfm}

{ TfmProduccion }

procedure TfmProduccion.zqProduccionBeforeOpen(DataSet: TDataSet);
begin
  zqProduccion.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

end.

