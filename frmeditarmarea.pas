unit frmEditarMarea;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase,
  ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup, db, datGeneral;

type

  { TfmEditarMarea }

  TfmEditarMarea = class(TZEdicionBase)
    dbdtInicio: TDBDateTimePicker;
    dbdtZarpada: TDBDateTimePicker;
    dbdtArribo: TDBDateTimePicker;
    dbdtFinalizacion: TDBDateTimePicker;
    dbedAnio: TDBEdit;
    dbedMareaBuque: TDBEdit;
    dbedMareaInidep: TDBEdit;
    dbedCapitan: TDBEdit;
    dbedOficial: TDBEdit;
    dbedObservador: TDBEdit;
    dblkBuque: TDBLookupComboBox;
    dsBuques: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    zqPrincipalNombreBuque: TStringField;
    zqBuques: TZQuery;
    zqBuquesidbuque: TLongintField;
    zqBuquesnombre: TStringField;
    zqPrincipalanio_marea: TLongintField;
    zqPrincipalcapitan: TStringField;
    zqPrincipalDscMarea: TStringField;
    zqPrincipalfecha_arribo: TDateField;
    zqPrincipalfecha_finalizacion: TDateField;
    zqPrincipalfecha_inicio: TDateField;
    zqPrincipalfecha_zarpada: TDateField;
    zqPrincipalidbuque: TLongintField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalmarea_buque: TStringField;
    zqPrincipalnro_marea_inidep: TLongintField;
    zqPrincipalobservador: TStringField;
    zqPrincipaloficial: TStringField;
    procedure dbdtArriboEnter(Sender: TObject);
    procedure dbdtFinalizacionEnter(Sender: TObject);
    procedure dbdtInicioEnter(Sender: TObject);
    procedure dbdtZarpadaEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarMarea: TfmEditarMarea;

implementation

{$R *.lfm}

{ TfmEditarMarea }

procedure TfmEditarMarea.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  if (zqPrincipalanio_marea.AsString<>'') and (zqPrincipalmarea_buque.AsString<>'') and (zqPrincipalnro_marea_inidep.AsString<>'') and (not zqPrincipalidbuque.IsNull) then
     zqPrincipalDscMarea.AsString:='Marea '+zqPrincipalnro_marea_inidep.AsString+'/'+
     zqPrincipalanio_marea.AsString+', '+zqPrincipalNombreBuque.AsString+' '+zqPrincipalmarea_buque.AsString;
end;

procedure TfmEditarMarea.dbdtInicioEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMarea.dbdtZarpadaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMarea.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  // Si la está dando de alta, la establezco inmediatamente como activa
  if zcePrincipal.Accion=ED_AGREGAR then
     dmGeneral.IdMareaActiva:=zqPrincipalidmarea.Value;
  dmGeneral.zqMareaActiva.Close;
  dmGeneral.zqMareaActiva.Open;
end;

procedure TfmEditarMarea.dbdtArriboEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMarea.dbdtFinalizacionEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMarea.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value:=zcePrincipal.NuevoID('mareas');
end;

end.

