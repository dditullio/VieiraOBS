unit frmeditartallas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, rxdbgrid, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, DBGrids,
  frmzedicionbase, dattallas, ZDataset, zcontroladoredicion,
  zdatasetgroup, zcontroladorgrilla, DtDBTimeEdit, DB, frmeditardetalletallas,
  Math;

type

  { TfmEditarTallas }

  TfmEditarTallas = class(TZEdicionBase)
    bbAgregar: TBitBtn;
    bbEditar: TBitBtn;
    bbEliminar: TBitBtn;
    dbdtFecha: TDBDateTimePicker;
    dbdtHora: TDtDBTimeEdit;
    dbedPesoMuestra: TDBEdit;
    dbgDetalle: TRxDBGrid;
    dblkBanda: TDBLookupComboBox;
    dblkTipo: TDBLookupComboBox;
    dbmComentarios: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    paFechaHora: TPanel;
    zcgLista: TZControladorGrilla;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure dbgDetalleEnter(Sender: TObject);
    procedure dblkBandaExit(Sender: TObject);
    procedure dblkTipoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure paFechaHoraExit(Sender: TObject);
    procedure zcePrincipalInitRecord(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject; var ValidacionOK: boolean);
    procedure zcgListaAntesAgregar(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarTallas: TfmEditarTallas;

implementation

{$R *.lfm}

{ TfmEditarTallas }

procedure TfmEditarTallas.dbgDetalleEnter(Sender: TObject);
begin
  if dmTallas.zqDetalleTallastalla.AsInteger = 0 then
    dbgDetalle.SelectedIndex := 0
  else
    dbgDetalle.SelectedIndex := 1;
end;

procedure TfmEditarTallas.dblkBandaExit(Sender: TObject);
begin
  if dblkBanda.Text='' then
  begin
    MessageDlg('Debe indicar la banda desde la cual se tomó la muestra', mtWarning, [mbOK], 0);
    if dblkBanda.CanFocus then
    dblkBanda.SetFocus;
  end;
end;

procedure TfmEditarTallas.dblkTipoExit(Sender: TObject);
begin
  if dblkTipo.Text='' then
  begin
    MessageDlg('Debe indicar el tipo de muestra que está registrando', mtWarning, [mbOK], 0);
    if dblkTipo.CanFocus then
    dblkTipo.SetFocus;
  end;
end;

procedure TfmEditarTallas.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarTallas.FormShow(Sender: TObject);
var
  bm: TBookMark;
  mt: integer;
begin
  //Busco la última talla cargada y la guardo en dmTallas
  with dmTallas do
  begin
    mt := 0;
    if zqDetalleTallas.RecordCount > 0 then
    begin
      zqDetalleTallas.DisableControls;
      bm := zqDetalleTallas.GetBookmark;
      zqDetalleTallas.First;
      while not zqDetalleTallas.EOF do
      begin
        mt := Max(mt, zqDetalleTallastalla.AsInteger);
        zqDetalleTallas.Next;
      end;
      zqDetalleTallas.GotoBookmark(bm);
      zqDetalleTallas.EnableControls;
    end;
    max_talla := mt;
  end;
  zcgLista.HabilitarAcciones;
end;

procedure TfmEditarTallas.paFechaHoraExit(Sender: TObject);
begin
  if dmTallas.zqTallashora.IsNull then
  begin
    MessageDlg('Debe indicar la hora de la muestra', mtWarning, [mbOK], 0);
    if dbdtHora.CanFocus then
      dbdtHora.SetFocus;
  end;
end;

procedure TfmEditarTallas.zcePrincipalInitRecord(Sender: TObject);
begin
  max_talla:=-1;
end;

procedure TfmEditarTallas.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
var
  t: integer;
  bm: TBookMark;
begin
  //Valido que no haya tallas duplicadas
  if dmTallas.zqDetalleTallas.RecordCount > 0 then
  begin
    dmTallas.zqDetalleTallas.DisableControls;
    dmTallas.zqDetalleTallas.First;
    t := -1;
    while not dmTallas.zqDetalleTallas.EOF do
    begin
      if t = dmTallas.zqDetalleTallastalla.AsInteger then
      begin
        ValidacionOK := False;
        bm := dmTallas.zqDetalleTallas.GetBookmark;
        dmTallas.zqDetalleTallas.Last;
      end else
      begin
        t:=dmTallas.zqDetalleTallastalla.AsInteger;
      end;
      dmTallas.zqDetalleTallas.Next;
    end;
    dmTallas.zqDetalleTallas.EnableControls;
    if not ValidacionOK then
    begin
      dmTallas.zqDetalleTallas.GotoBookmark(bm);
      MessageDlg('Atención', 'hay múltiples registros para la talla ' +
        IntToStr(t) + '. Verifique', mtWarning, [mbOK], 0);
    end;
  end;

end;

procedure TfmEditarTallas.zcgListaAntesAgregar(Sender: TObject);
var
  bm: TBookMark;
  mt: integer;
begin
  //Busco la última talla cargada y la guardo en dmTallas
  with dmTallas do
  begin
    mt := 0;
    if zqDetalleTallas.RecordCount > 0 then
    begin
      zqDetalleTallas.DisableControls;
      bm := zqDetalleTallas.GetBookmark;
      zqDetalleTallas.First;
      while not zqDetalleTallas.EOF do
      begin
        mt := Max(mt, zqDetalleTallastalla.AsInteger);
        zqDetalleTallas.Next;
      end;
      zqDetalleTallas.GotoBookmark(bm);
      zqDetalleTallas.EnableControls;
    end;
    max_talla := mt;
  end;
end;

end.

