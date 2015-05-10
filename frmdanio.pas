unit frmdanio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, DbCtrls, frmlistabase, db, ZDataset,
  zcontroladorgrilla, datGeneral;

type

  { TfmDanio }

  TfmDanio = class(TfmListaBase)
    dbgDetalleDanio: TRxDBGrid;
    DBMemo1: TDBMemo;
    dsDanio: TDataSource;
    dsDetalleDanio: TDataSource;
    Label1: TLabel;
    Panel1: TPanel;
    zqDanio: TZQuery;
    zqDetalleDanio: TZQuery;
    zqDaniobanda: TStringField;
    zqDaniocomentarios: TStringField;
    zqDaniofecha: TDateField;
    zqDaniohora: TTimeField;
    zqDanioidmarea: TLongintField;
    zqDanioidmuestras_danio: TLongintField;
    zqDaniolance_banda: TBytesField;
    zqDanionrolance: TLongintField;
    zqDetalleDanioidmuestras_danio: TLongintField;
    zqDetalleDanioLongintField01_20_antes: TLongintField;
    zqDetalleDanioLongintField01_20_despues: TLongintField;
    zqDetalleDanioLongintField21_40_antes: TLongintField;
    zqDetalleDanioLongintField21_40_despues: TLongintField;
    zqDetalleDanioLongintField41_54_antes: TLongintField;
    zqDetalleDanioLongintField41_54_despues: TLongintField;
    zqDetalleDaniomas_54_antes: TLongintField;
    zqDetalleDaniomas_54_despues: TLongintField;
    zqDetalleDaniotipo_danio: TStringField;
    procedure zqDanioAfterScroll(DataSet: TDataSet);
    procedure zqDanioBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmDanio: TfmDanio;

implementation

{$R *.lfm}

{ TfmDanio }

procedure TfmDanio.zqDanioBeforeOpen(DataSet: TDataSet);
begin
  zqDanio.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmDanio.zqDanioAfterScroll(DataSet: TDataSet);
begin
  zqDetalleDanio.Close;
  zqDetalleDanio.ParamByName('idmuestras_danio').Value:=zqDanioidmuestras_danio.Value;
  zqDetalleDanio.Open;
end;

end.

