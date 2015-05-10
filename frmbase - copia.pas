unit frmbase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, ZDataset, Forms, Controls,
  Graphics, Dialogs, StdCtrls, ExtCtrls, Buttons, ActnList, ComCtrls, LSForms,
  ZAbstractDataset
  ;

type

  { TfmBase }

  TfmBase = class(TForm)
    acCerrar: TAction;
    alComando: TActionList;
    ilComando: TImageList;
    paBase: TPanel;
    paComando: TPanel;
    paContenido: TPanel;
    sbCerrar: TSpeedButton;
    procedure acCerrarExecute(Sender: TObject);
    procedure CerrarForm;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmBase: TfmBase;

implementation

{$R *.lfm}

{ TfmBase }

procedure TfmBase.acCerrarExecute(Sender: TObject);
begin
  CerrarForm;
end;

procedure TfmBase.CerrarForm;
begin
  if Parent is TTabSheet then
    Parent.Free
  else
    Close;
end;

end.

