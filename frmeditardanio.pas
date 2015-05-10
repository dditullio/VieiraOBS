unit frmeditardanio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, ComCtrls,
  frmzedicionbase, ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup,
  DtDBTimeEdit, db, datGeneral, funciones;

type

  { TfmEditarDanio }

  TfmEditarDanio = class(TZEdicionBase)
    dbdtFecha: TDBDateTimePicker;
    dbdtHora: TDtDBTimeEdit;
    dbed_DA_0120_D: TDBEdit;
    dbed_DA_2140_D: TDBEdit;
    dbed_DA_4154_D: TDBEdit;
    dbed_DA_MAS54_D: TDBEdit;
    dbed_DB_0120_D: TDBEdit;
    dbed_DB_2140_D: TDBEdit;
    dbed_DB_4154_D: TDBEdit;
    dbed_DB_MAS54_D: TDBEdit;
    dbed_DC_0120_A: TDBEdit;
    dbed_DC_0120_D: TDBEdit;
    dbed_DC_2140_D: TDBEdit;
    dbed_DC_4154_D: TDBEdit;
    dbed_DC_MAS54_D: TDBEdit;
    dbed_DD_0120_A: TDBEdit;
    dbed_DC_2140_A: TDBEdit;
    dbed_DD_0120_D: TDBEdit;
    dbed_DD_2140_A: TDBEdit;
    dbed_DC_4154_A: TDBEdit;
    dbed_DD_2140_D: TDBEdit;
    dbed_DD_4154_A: TDBEdit;
    dbed_DC_MAS54_A: TDBEdit;
    dbed_DD_4154_D: TDBEdit;
    dbed_DD_MAS54_A: TDBEdit;
    dbed_DD_MAS54_D: TDBEdit;
    dbed_SD_0120_A: TDBEdit;
    dbed_DA_0120_A: TDBEdit;
    dbed_DB_0120_A: TDBEdit;
    dbed_SD_0120_D: TDBEdit;
    dbed_SD_2140_A: TDBEdit;
    dbed_DA_2140_A: TDBEdit;
    dbed_DB_2140_A: TDBEdit;
    dbed_SD_2140_D: TDBEdit;
    dbed_SD_4154_A: TDBEdit;
    dbed_DA_4154_A: TDBEdit;
    dbed_DB_4154_A: TDBEdit;
    dbed_SD_4154_D: TDBEdit;
    dbed_SD_MAS54_A: TDBEdit;
    dbed_DA_MAS54_A: TDBEdit;
    dbed_DB_MAS54_A: TDBEdit;
    dbed_SD_MAS54_D: TDBEdit;
    dblkBanda: TDBLookupComboBox;
    dbmComentarios: TDBMemo;
    dsBandas: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    paFechaHora: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    zqPrincipalDscBanda: TStringField;
    zqBandas: TZQuery;
    zqBandasbanda: TStringField;
    zqBandasdescripcion: TStringField;
    zqPrincipalbanda: TStringField;
    zqPrincipalcant_ejemp_da_01_20_antes: TLongintField;
    zqPrincipalcant_ejemp_da_01_20_despues: TLongintField;
    zqPrincipalcant_ejemp_da_21_40_antes: TLongintField;
    zqPrincipalcant_ejemp_da_21_40_despues: TLongintField;
    zqPrincipalcant_ejemp_da_41_54_antes: TLongintField;
    zqPrincipalcant_ejemp_da_41_54_despues: TLongintField;
    zqPrincipalcant_ejemp_da_mas_54_antes: TLongintField;
    zqPrincipalcant_ejemp_da_mas_54_despues: TLongintField;
    zqPrincipalcant_ejemp_db_01_20_antes: TLongintField;
    zqPrincipalcant_ejemp_db_01_20_despues: TLongintField;
    zqPrincipalcant_ejemp_db_21_40_antes: TLongintField;
    zqPrincipalcant_ejemp_db_21_40_despues: TLongintField;
    zqPrincipalcant_ejemp_db_41_54_antes: TLongintField;
    zqPrincipalcant_ejemp_db_41_54_despues: TLongintField;
    zqPrincipalcant_ejemp_db_mas_54_antes: TLongintField;
    zqPrincipalcant_ejemp_db_mas_54_despues: TLongintField;
    zqPrincipalcant_ejemp_dc_01_20_antes: TLongintField;
    zqPrincipalcant_ejemp_dc_01_20_despues: TLongintField;
    zqPrincipalcant_ejemp_dc_21_40_antes: TLongintField;
    zqPrincipalcant_ejemp_dc_21_40_despues: TLongintField;
    zqPrincipalcant_ejemp_dc_41_54_antes: TLongintField;
    zqPrincipalcant_ejemp_dc_41_54_despues: TLongintField;
    zqPrincipalcant_ejemp_dc_mas_54_antes: TLongintField;
    zqPrincipalcant_ejemp_dc_mas_54_despues: TLongintField;
    zqPrincipalcant_ejemp_dd_01_20_antes: TLongintField;
    zqPrincipalcant_ejemp_dd_01_20_despues: TLongintField;
    zqPrincipalcant_ejemp_dd_21_40_antes: TLongintField;
    zqPrincipalcant_ejemp_dd_21_40_despues: TLongintField;
    zqPrincipalcant_ejemp_dd_41_54_antes: TLongintField;
    zqPrincipalcant_ejemp_dd_41_54_despues: TLongintField;
    zqPrincipalcant_ejemp_dd_mas_54_antes: TLongintField;
    zqPrincipalcant_ejemp_dd_mas_54_despues: TLongintField;
    zqPrincipalcant_ejemp_sd_01_20_antes: TLongintField;
    zqPrincipalcant_ejemp_sd_01_20_despues: TLongintField;
    zqPrincipalcant_ejemp_sd_21_40_antes: TLongintField;
    zqPrincipalcant_ejemp_sd_21_40_despues: TLongintField;
    zqPrincipalcant_ejemp_sd_41_54_antes: TLongintField;
    zqPrincipalcant_ejemp_sd_41_54_despues: TLongintField;
    zqPrincipalcant_ejemp_sd_mas_54_antes: TLongintField;
    zqPrincipalcant_ejemp_sd_mas_54_despues: TLongintField;
    zqPrincipalcomentarios: TStringField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalfecha: TDateField;
    zqPrincipalhora: TTimeField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidmuestras_danio: TLongintField;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure dbdtHoraExit(Sender: TObject);
    procedure dblkBandaExit(Sender: TObject);
    procedure paFechaHoraExit(Sender: TObject);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalhoraSetText(Sender: TField; const aText: string);
    procedure zqPrincipalhoraValidate(Sender: TField);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarDanio: TfmEditarDanio;

implementation

{$R *.lfm}

{ TfmEditarDanio }

procedure TfmEditarDanio.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  zqPrincipalEncabezado.Value:=FormatDateTime('dd/mm/yyyy',zqPrincipalfecha.Value)+
    ' '+FormatDateTime('hh:mm',zqPrincipalhora.Value)+
    ' '+zqPrincipalDscBanda.Value;
end;

procedure TfmEditarDanio.zqPrincipalhoraSetText(Sender: TField;
  const aText: string);
begin
  if not HoraOK(aText) then
     MessageDlg('La hora ingresada no es correcta. Por favor verifique.', mtError, [mbClose],0)
  else
    sender.AsString:=aText;
end;

procedure TfmEditarDanio.zqPrincipalhoraValidate(Sender: TField);
begin
end;

procedure TfmEditarDanio.dblkBandaExit(Sender: TObject);
begin
  if dblkBanda.Text='' then
  begin
    MessageDlg('Debe indicar la banda desde la cual se tomó la muestra', mtWarning, [mbOK], 0);
    if dblkBanda.CanFocus then
    dblkBanda.SetFocus;
  end;
end;

procedure TfmEditarDanio.paFechaHoraExit(Sender: TObject);
begin
  if zqPrincipalhora.IsNull then
  begin
    MessageDlg('Debe indicar la hora de la muestra', mtWarning, [mbOK], 0);
    if dbdtHora.CanFocus then
      dbdtHora.SetFocus;
  end;
end;

procedure TfmEditarDanio.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarDanio.dbdtHoraExit(Sender: TObject);
begin
end;

procedure TfmEditarDanio.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmuestras_danio.Value:=zcePrincipal.NuevoID('muestras_danio');
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalfecha.Value:=Date;
end;

end.

