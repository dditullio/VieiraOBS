unit frmeditarcondrictios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase,
  ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup, DtDBTimeEdit, db,
  datGeneral;

type

  { TfmEditarCondrictios }

  TfmEditarCondrictios = class(TZEdicionBase)
    dbdtFecha: TDBDateTimePicker;
    dbdtHora: TDtDBTimeEdit;
    dbedLTMaxSqualus: TDBEdit;
    dbedLTMaxBathyrajas: TDBEdit;
    dbedLTMaxAmblyraja: TDBEdit;
    dbedLTMaxPsammobatis: TDBEdit;
    dbedLTMaxSchroederichthys: TDBEdit;
    dbedLTMinSqualus: TDBEdit;
    dbedLTMinBathyrajas: TDBEdit;
    dbedLTMinAmblyraja: TDBEdit;
    dbedLTMinPsammobatis: TDBEdit;
    dbedLTMinSchroederichthys: TDBEdit;
    dbedNroCaptAmblyraja: TDBEdit;
    dbedNroCaptSqualus: TDBEdit;
    dbedNroCaptDipturus: TDBEdit;
    dbedLTMaxDipturus: TDBEdit;
    dbedLTMinDipturus: TDBEdit;
    dbedNroCaptBathyrajas: TDBEdit;
    dbedNroCaptPsammobatis: TDBEdit;
    dbedNroCaptSchroederichthys: TDBEdit;
    dbmComentarios: TDBMemo;
    gbAmblyraja: TGroupBox;
    gbSqualus: TGroupBox;
    gbDipturus: TGroupBox;
    gbBathyrajas: TGroupBox;
    gbPsammobatis: TGroupBox;
    gbSchroederichthys: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    paFechaHora: TPanel;
    zqPrincipalcomentarios: TStringField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalfecha: TDateField;
    zqPrincipalhora: TTimeField;
    zqPrincipalidlance: TLongintField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidmuestra_condrictios: TLongintField;
    zqPrincipalidmuestra_rayas: TLongintField;
    zqPrincipallt_max_amblyraja: TLongintField;
    zqPrincipallt_max_bathyraja: TLongintField;
    zqPrincipallt_max_dipturus: TLongintField;
    zqPrincipallt_max_psammobatis: TLongintField;
    zqPrincipallt_max_schroederichthys: TLongintField;
    zqPrincipallt_max_squalus: TLongintField;
    zqPrincipallt_min_amblyraja: TLongintField;
    zqPrincipallt_min_bathyraja: TLongintField;
    zqPrincipallt_min_dipturus: TLongintField;
    zqPrincipallt_min_psammobatis: TLongintField;
    zqPrincipallt_min_schroederichthys: TLongintField;
    zqPrincipallt_min_squalus: TLongintField;
    zqPrincipalnro_amblyraja: TLongintField;
    zqPrincipalnro_bathyraja: TLongintField;
    zqPrincipalnro_dipturus: TLongintField;
    zqPrincipalnro_psammobatis: TLongintField;
    zqPrincipalnro_schroederichthys: TLongintField;
    zqPrincipalnro_squalus: TLongintField;
    procedure gbAmblyrajaExit(Sender: TObject);
    procedure gbBathyrajasExit(Sender: TObject);
    procedure gbDipturusExit(Sender: TObject);
    procedure gbPsammobatisExit(Sender: TObject);
    procedure gbSchroederichthysClick(Sender: TObject);
    procedure gbSchroederichthysExit(Sender: TObject);
    procedure gbSqualusExit(Sender: TObject);
    procedure paFechaHoraExit(Sender: TObject);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarCondrictios: TfmEditarCondrictios;

implementation

{$R *.lfm}

{ TfmEditarCondrictios }

procedure TfmEditarCondrictios.paFechaHoraExit(Sender: TObject);
begin
  if zqPrincipalhora.IsNull then
  begin
    MessageDlg('Debe indicar la hora de la muestra', mtWarning, [mbOK], 0);
    if dbdtHora.CanFocus then
      dbdtHora.SetFocus;
  end;
end;

procedure TfmEditarCondrictios.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  zqPrincipalEncabezado.Value:=FormatDateTime('dd/mm/yyyy',zqPrincipalfecha.Value)+
    ' '+FormatDateTime('hh:mm',zqPrincipalhora.Value);
end;

procedure TfmEditarCondrictios.gbDipturusExit(Sender: TObject);
begin
  if (not zqPrincipallt_max_dipturus.IsNull)
     and (not zqPrincipallt_min_dipturus.IsNull)
     and (zqPrincipallt_max_dipturus.Value < zqPrincipallt_min_dipturus.Value) then
  begin
    MessageDlg('La talla máxima no puede ser menor a la mínima.', mtWarning, [mbOK], 0);
    if dbedLTMaxDipturus.CanFocus then
      dbedLTMaxDipturus.SetFocus;
  end;
end;

procedure TfmEditarCondrictios.gbPsammobatisExit(Sender: TObject);
begin
  if (not zqPrincipallt_max_psammobatis.IsNull)
     and (not zqPrincipallt_min_psammobatis.IsNull)
     and (zqPrincipallt_max_psammobatis.Value < zqPrincipallt_min_psammobatis.Value) then
  begin
    MessageDlg('La talla máxima no puede ser menor a la mínima.', mtWarning, [mbOK], 0);
    if dbedLTMaxPsammobatis.CanFocus then
      dbedLTMaxPsammobatis.SetFocus;
  end;
end;

procedure TfmEditarCondrictios.gbSchroederichthysClick(Sender: TObject);
begin

end;

procedure TfmEditarCondrictios.gbSchroederichthysExit(Sender: TObject);
begin
  if (not zqPrincipallt_max_schroederichthys.IsNull)
     and (not zqPrincipallt_min_schroederichthys.IsNull)
     and (zqPrincipallt_max_schroederichthys.Value < zqPrincipallt_min_schroederichthys.Value) then
  begin
    MessageDlg('La talla máxima no puede ser menor a la mínima.', mtWarning, [mbOK], 0);
    if dbedLTMaxSchroederichthys.CanFocus then
      dbedLTMaxSchroederichthys.SetFocus;
  end;
end;

procedure TfmEditarCondrictios.gbSqualusExit(Sender: TObject);
begin
  if (not zqPrincipallt_max_squalus.IsNull)
     and (not zqPrincipallt_min_squalus.IsNull)
     and (zqPrincipallt_max_squalus.Value < zqPrincipallt_min_squalus.Value) then
  begin
    MessageDlg('La talla máxima no puede ser menor a la mínima.', mtWarning, [mbOK], 0);
    if dbedLTMaxSqualus.CanFocus then
      dbedLTMaxSqualus.SetFocus;
  end;
end;

procedure TfmEditarCondrictios.gbBathyrajasExit(Sender: TObject);
begin
  if (not zqPrincipallt_max_bathyraja.IsNull)
     and (not zqPrincipallt_min_bathyraja.IsNull)
     and (zqPrincipallt_max_bathyraja.Value < zqPrincipallt_min_bathyraja.Value) then
  begin
    MessageDlg('La talla máxima no puede ser menor a la mínima.', mtWarning, [mbOK], 0);
    if dbedLTMaxBathyrajas.CanFocus then
      dbedLTMaxBathyrajas.SetFocus;
  end;
end;

procedure TfmEditarCondrictios.gbAmblyrajaExit(Sender: TObject);
begin
  if (not zqPrincipallt_max_amblyraja.IsNull)
     and (not zqPrincipallt_min_amblyraja.IsNull)
     and (zqPrincipallt_max_amblyraja.Value < zqPrincipallt_min_amblyraja.Value) then
  begin
    MessageDlg('La talla máxima no puede ser menor a la mínima.', mtWarning, [mbOK], 0);
    if dbedLTMaxAmblyraja.CanFocus then
      dbedLTMaxAmblyraja.SetFocus;
  end;
end;

procedure TfmEditarCondrictios.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalidmuestra_rayas.Value:=zcePrincipal.NuevoID('muestras_rayas');
  zqPrincipalfecha.Value:=Date;
end;

end.

