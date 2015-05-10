unit frmmareas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ActnList, StdCtrls, DBGrids, DbCtrls, frmlistabase, datGeneral,
  zcontroladorgrilla, frmEditarMarea;

type

  { TfmMareas }

  TfmMareas = class(TfmListaBase)
    bbEstablecerActiva: TBitBtn;
    dbedCapitan: TDBEdit;
    dbedOficial: TDBEdit;
    dbedBuque: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure bbEstablecerActivaClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmMareas: TfmMareas;

implementation

{$R *.lfm}

{ TfmMareas }

procedure TfmMareas.bbEstablecerActivaClick(Sender: TObject);
var
  msg: string;
begin
  msg:='¿Desea activar la marea: '+dmGeneral.zqMareasMarea.AsString+'?';
  if MessageDlg(msg, mtConfirmation, mbYesNo,0) = mrYes then
     dmGeneral.IdMareaActiva:=dmGeneral.zqMareasidmarea.Value;
end;

end.

