unit frLances;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, DBGrids, frBase, SQLQueryGroup,
  ControladorGrilla, sqldb, db, datGeneral;

type

  { TfLances }

  TfLances = class(TfBase)
    bbAgregarLance: TBitBtn;
    bbBuscarLance: TBitBtn;
    bbEditarLance: TBitBtn;
    bbEliminarLance: TBitBtn;
    cgLances: TControladorGrilla;
    dsLances: TDataSource;
    dbgLances: TDBGrid;
    edBuscarLance: TEdit;
    qgLances: TSQLQueryGroup;
    sqLances: TSQLQuery;
    sqLancescable_babor: TLongintField;
    sqLancescable_estribor: TLongintField;
    sqLancescaptura_babor: TBCDField;
    sqLancescaptura_estribor: TBCDField;
    sqLancescomentarios: TStringField;
    sqLancesdireccion_viento: TLongintField;
    sqLancesfecha: TDateField;
    sqLanceshora: TStringField;
    sqLancesidlance: TLongintField;
    sqLanceslargo_relinga_inferior: TLongintField;
    sqLanceslatitud_fin: TLongintField;
    sqLanceslatitud_ini: TLongintField;
    sqLanceslongitud_fin: TLongintField;
    sqLanceslongitud_ini: TLongintField;
    sqLancesmallero_copo_mm: TLongintField;
    sqLancesmareas_idmarea: TLongintField;
    sqLancesmar_beaufort: TLongintField;
    sqLancesminutos_arrastre: TBCDField;
    sqLancesnro_lance: TStringField;
    sqLancesnudos_viento: TLongintField;
    sqLancesprofundidad: TLongintField;
    sqLancesrumbo: TLongintField;
    sqLancestemperatura_aire: TBCDField;
    sqLancestemperatura_fondo: TBCDField;
    sqLancestemperatura_superficie: TBCDField;
    sqLancestipos_malla_tipo_malla: TStringField;
    sqLancesvelocidad: TBCDField;
    procedure sqLancesBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

implementation

{$R *.lfm}

{ TfLances }

procedure TfLances.sqLancesBeforeOpen(DataSet: TDataSet);
begin
  sqLances.ParamByName('mareas_idmarea').Value:=dmGeneral.qMareasidmarea.Value;
end;

end.

