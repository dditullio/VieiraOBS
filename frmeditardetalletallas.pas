unit frmeditardetalletallas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase, ZDataset,
  zcontroladoredicion, zdatasetgroup, db, dattallas;

type

  { TfmEditarDetalleTallas }

  TfmEditarDetalleTallas = class(TZEdicionBase)
    dbedTalla: TDBEdit;
    dbedNroEjemp: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure dbedNroEjempEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarDetalleTallas: TfmEditarDetalleTallas;

implementation

{$R *.lfm}

{ TfmEditarDetalleTallas }

procedure TfmEditarDetalleTallas.FormShow(Sender: TObject);
begin
  //if (zcePrincipal.Accion=ED_AGREGAR) and (dbedTalla.Text<>'') then
  //begin
  //  zcePrincipal.ControlInicial:=dbedNroEjemp;
  //end;
end;

procedure TfmEditarDetalleTallas.dbedNroEjempEnter(Sender: TObject);
begin
  if (dbedTalla.Text='') and dbedTalla.CanFocus then
     dbedTalla.SetFocus;
end;

end.

