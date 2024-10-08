unit frmlistabase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, DBGrids, frmbase, zcontroladorgrilla;

type

  { TfmListaBase }

  TfmListaBase = class(TfmBase)
    bbAgregar: TBitBtn;
    bbBuscar: TBitBtn;
    bbEditar: TBitBtn;
    bbEliminar: TBitBtn;
    dbgLista: TRxDBGrid;
    edBuscar: TEdit;
    laBuscar: TLabel;
    paLista: TPanel;
    paDetalles: TPanel;
    paBuscador: TPanel;
    paGrilla: TPanel;
    zcgLista: TZControladorGrilla;
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmListaBase: TfmListaBase;

implementation

{$R *.lfm}

{ TfmListaBase }

procedure TfmListaBase.FormShow(Sender: TObject);
begin
  zcgLista.Buscar;
  zcgLista.HabilitarAcciones;
  if edBuscar.CanFocus then
     edBuscar.SetFocus;
end;

end.

