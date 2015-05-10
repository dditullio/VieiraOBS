unit datBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil,datGeneral, ZDataset, ZStoredProcedure;

type

  { TDmBase }

  TDmBase = class(TDataModule)
    zspNuevoId: TZStoredProc;
  private
    { private declarations }
  public
    { public declarations }
    function NuevoID(tabla: string): longint;
  end;

var
  DmBase: TDmBase;

implementation

{$R *.lfm}

{ TDmBase }

function TDmBase.NuevoID(tabla: string): longint;
var
  ID: integer;
begin
  ID := -1;
  if tabla <> '' then
  begin
    zspNuevoId.ParamByName('p_nombre_tabla').AsString:=tabla;
    zspNuevoId.Prepare;
    zspNuevoId.ExecProc;
    ID := zspNuevoId.ParamByName('p_id').AsInteger;
    if ID < 1 then
      ID := -1;
  end;
  Result := ID;
end;

end.

