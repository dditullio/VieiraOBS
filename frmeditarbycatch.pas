unit frmeditarbycatch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, rxdbgrid, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons,
  frmzedicionbase, datGeneral, datbycatch, ZDataset, SQLQueryGroup,
  zcontroladoredicion, zdatasetgroup, zcontroladorgrilla, DtDBTimeEdit, db,
  frmeditardetallebycatch;

type

  { TfmEditarByCatch }

  TfmEditarByCatch = class(TZEdicionBase)
    bbAgregar: TBitBtn;
    bbEditar: TBitBtn;
    bbEliminar: TBitBtn;
    dbdtFecha: TDBDateTimePicker;
    dbdtHora: TDtDBTimeEdit;
    dbgDetByCatch: TRxDBGrid;
    dblkBanda: TDBLookupComboBox;
    dbmPeces: TDBMemo;
    dbmComentarios1: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    paFechaHora: TPanel;
    zcgDetByCatch: TZControladorGrilla;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure dblkBandaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure paFechaHoraExit(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarByCatch: TfmEditarByCatch;

implementation

{$R *.lfm}

{ TfmEditarByCatch }

procedure TfmEditarByCatch.FormShow(Sender: TObject);
begin
  zcgDetByCatch.HabilitarAcciones;
end;

procedure TfmEditarByCatch.paFechaHoraExit(Sender: TObject);
begin
  if dmByCatch.zqByCatchhora.IsNull then
  begin
    MessageDlg('Debe indicar la hora de la muestra', mtWarning, [mbOK], 0);
    if dbdtHora.CanFocus then
      dbdtHora.SetFocus;
  end;
end;

procedure TfmEditarByCatch.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarByCatch.dblkBandaExit(Sender: TObject);
begin
  if dblkBanda.Text='' then
  begin
    MessageDlg('Debe indicar la banda desde la cual se tomó la muestra', mtWarning, [mbOK], 0);
    if dblkBanda.CanFocus then
    dblkBanda.SetFocus;
  end;
end;

end.

