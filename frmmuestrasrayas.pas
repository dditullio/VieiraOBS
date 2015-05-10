unit frmmuestrasrayas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, frmlistabase, db, ZDataset,
  zcontroladorgrilla;

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
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmMuestrasRayas: TfmMuestrasRayas;

implementation

{$R *.lfm}

end.

