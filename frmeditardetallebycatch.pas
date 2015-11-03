unit frmeditardetallebycatch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Buttons, frmzedicionbase, datbycatch, ZDataset,
  SQLQueryGroup, zcontroladoredicion, zdatasetgroup, DB;

type

  { TfmEditarDetalleByCatch }

  TfmEditarDetalleByCatch = class(TZEdicionBase)
    dbedNroEjemp: TDBEdit;
    dbedPeso: TDBEdit;
    dblkEspecie: TDBLookupComboBox;
    dbmComentarios: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    procedure dblkEspecieExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarDetalleByCatch: TfmEditarDetalleByCatch;

implementation

{$R *.lfm}

{ TfmEditarDetalleByCatch }

procedure TfmEditarDetalleByCatch.dblkEspecieExit(Sender: TObject);
begin
  dbedPeso.Enabled:=dmByCatch.zqDetByCatchRegistraPeso.AsBoolean;
  dbedNroEjemp.Enabled:=dmByCatch.zqDetByCatchRegistraNumero.AsBoolean;
end;

procedure TfmEditarDetalleByCatch.FormShow(Sender: TObject);
begin
  if zcePrincipal.Accion=ED_MODIFICAR then
  begin
    dbedPeso.Enabled:=dmByCatch.zqDetByCatchRegistraPeso.AsBoolean;
    dbedNroEjemp.Enabled:=dmByCatch.zqDetByCatchRegistraNumero.AsBoolean;
  end;
end;

end.

