unit frmeditarlances;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, DividerBevel, rxlookup, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, DBGrids,
  ComCtrls, frmzedicionbase, ZDataset, zcontroladoredicion, zdatasetgroup,
  SQLQueryGroup, DtDBTimeEdit, DB, datGeneral, funciones, dateutils,
  LSExpression, LSConsts, LSConfig, LCLType, Math;

type

  { TControlsArray }
  //Este objeto se usa para almacenar los controles de edición que son
  //equivalentes en las pestañas de los diferentes formatos.
  //De esta manera se puede hacer foco en el control correspondiente
  //según la pestaña activa. el parámetro "index" de las funciones
  //debe ser el TabIndex de la página activa del PageControl
  TControlsArray = class(TObject)
    FControls: array of TStringList;
  private
    FActiveIndex: integer;
    procedure SetActiveIndex(AValue: integer);
  public
    constructor Create;
    procedure AddControl(index: integer; Name: string; Control: TControl);
    function GetControl(index: integer; Name: string): TControl;
    function GetControl(Name: string): TControl;
    function CanFocus(index: integer; Name: string): boolean;
    function CanFocus(Name: string): boolean;
    procedure SetFocus(index: integer; Name: string);
    procedure SetFocus(Name: string);
    procedure SetColor(index: integer; Name: string; FontColor: TColor);
    procedure SetColor(Name: string; FontColor: TColor);
    procedure SetHint(index: integer; Name: string; Hint: string);
    procedure SetHint(Name: string; Hint: string);
    property ActiveIndex: integer read FActiveIndex write SetActiveIndex;
  end;

  { TfmEditarLances }

  TfmEditarLances = class(TZEdicionBase)
    bbBabor: TBitBtn;
    bbBabor1: TBitBtn;
    bbEstribor: TBitBtn;
    bbEstribor1: TBitBtn;
    bbIgualAnterior: TBitBtn;
    bbIgualAnterior1: TBitBtn;
    BlobField1: TBlobField;
    dbdtFecha: TDBDateTimePicker;
    dbdtFecha1: TDBDateTimePicker;
    dbdtHora: TDtDBTimeEdit;
    dbdtHora1: TDtDBTimeEdit;
    dbedCableBr: TDBEdit;
    dbedCableBr1: TDBEdit;
    dbedCableEr: TDBEdit;
    dbedCableEr1: TDBEdit;
    dbedCaptBr: TDBEdit;
    dbedCaptBr1: TDBEdit;
    dbedCaptEr: TDBEdit;
    dbedCaptEr1: TDBEdit;
    dbedDireccViento: TDBEdit;
    dbedEstadoMar: TDBEdit;
    dbedGradosLatFin: TDBEdit;
    dbedGradosLatFin1: TDBEdit;
    dbedGradosLatIni: TDBEdit;
    dbedGradosLatIni1: TDBEdit;
    dbedGradosLongFin: TDBEdit;
    dbedGradosLongFin1: TDBEdit;
    dbedGradosLongIni: TDBEdit;
    dbedGradosLongIni1: TDBEdit;
    dbedMinArrastre: TDBEdit;
    dbedMinArrastre1: TDBEdit;
    dbedMinutosLatFin: TDBEdit;
    dbedMinutosLatFin1: TDBEdit;
    dbedMinutosLatIni: TDBEdit;
    dbedMinutosLatIni1: TDBEdit;
    dbedMinutosLongFin: TDBEdit;
    dbedMinutosLongFin1: TDBEdit;
    dbedMinutosLongIni: TDBEdit;
    dbedMinutosLongIni1: TDBEdit;
    dbedProfund: TDBEdit;
    dbedProfund1: TDBEdit;
    dbedRumbo: TDBEdit;
    dbedRumbo1: TDBEdit;
    dbedTempAire: TDBEdit;
    dbedRelinga: TDBEdit;
    dbedTempFondo: TDBEdit;
    dbedTempSuperf: TDBEdit;
    dbedMallaCopo: TDBEdit;
    dbedVelocidad: TDBEdit;
    dbedVelocidad1: TDBEdit;
    dbedVelocViento: TDBEdit;
    DBImage1: TDBImage;
    DBLookupComboBox1: TDBLookupComboBox;
    dbmComentarios: TDBMemo;
    dbmComentarios1: TDBMemo;
    dbmDscEstadoMar: TDBMemo;
    dbgTipoMalla: TDBRadioGroup;
    dbtDistCalc1: TDBText;
    dbtDistDif1: TDBText;
    dbtDistRegist: TDBText;
    dbtDistCalc: TDBText;
    dbtDistDif: TDBText;
    dbtDistRegist1: TDBText;
    dbtRumboCalc: TDBText;
    dbtRumboDif: TDBText;
    dbtRumboRegist: TDBText;
    dbtTiempoCalc1: TDBText;
    dbtRumboCalc1: TDBText;
    dbtTiempoDif1: TDBText;
    dbtRumboDif1: TDBText;
    dbtTiempoRegist1: TDBText;
    dbtRumboRegist1: TDBText;
    dbtVelCalc1: TDBText;
    dbtVelDif1: TDBText;
    dbtVelRegist: TDBText;
    dbtVelCalc: TDBText;
    dbtVelDif: TDBText;
    dbtTiempoRegist: TDBText;
    dbtTiempoCalc: TDBText;
    dbtTiempoDif: TDBText;
    dbtVelRegist1: TDBText;
    dsEstadoMar: TDataSource;
    dsLkpEstadoMar: TDataSource;
    dsProxLance: TDataSource;
    dsAntLance: TDataSource;
    gbComentarios1: TGroupBox;
    gbDatosFin1: TGroupBox;
    gbDatosInicio: TGroupBox;
    gbDatosFin: TGroupBox;
    gbDatosInicio1: TGroupBox;
    gbInformacion1: TGroupBox;
    GroupBox3: TGroupBox;
    gbComentarios: TGroupBox;
    gbInformacion: TGroupBox;
    GroupBox6: TGroupBox;
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
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label7: TLabel;
    laDistancia: TLabel;
    laDistancia1: TLabel;
    laTiempo1: TLabel;
    laTiempo2: TLabel;
    laTiempo3: TLabel;
    laVelocidad: TLabel;
    laTiempo: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    laVelocidad1: TLabel;
    paFechaHora: TPanel;
    paFechaHora1: TPanel;
    pcFormatos: TPageControl;
    Panel1: TPanel;
    pcLances: TPageControl;
    StringField1: TStringField;
    tsAlternativo: TTabSheet;
    tsPredeterminado: TTabSheet;
    tsOtrosDatos: TTabSheet;
    tsGeneral: TTabSheet;
    zqAntLancecable_babor: TLongintField;
    zqAntLancecable_estribor: TLongintField;
    zqAntLancecomentarios: TStringField;
    zqAntLancefecha: TDateField;
    zqAntLancegrados_latitud_fin: TLongintField;
    zqAntLancegrados_latitud_ini: TLongintField;
    zqAntLancegrados_longitud_fin: TLongintField;
    zqAntLancegrados_longitud_ini: TLongintField;
    zqAntLancehora: TTimeField;
    zqAntLanceidlance: TLongintField;
    zqAntLanceidmarea: TLongintField;
    zqAntLancelargo_relinga_inferior: TLongintField;
    zqAntLancemallero_copo_mm: TLongintField;
    zqAntLanceminutos_arrastre: TFloatField;
    zqAntLanceminutos_latitud_fin: TFloatField;
    zqAntLanceminutos_latitud_ini: TFloatField;
    zqAntLanceminutos_longitud_fin: TFloatField;
    zqAntLanceminutos_longitud_ini: TFloatField;
    zqAntLancenro_lance: TLongintField;
    zqAntLanceprofundidad: TLongintField;
    zqAntLancetipo_malla: TStringField;
    zqEstadoMar: TZQuery;
    zqLkpEstadoMar: TZQuery;
    zqEstadoMaraltura_max_olas: TFloatField;
    zqEstadoMaraltura_media_olas: TFloatField;
    zqEstadoMarcod_estado_mar: TLongintField;
    zqEstadoMardescripcion: TStringField;
    zqEstadoMarnombre: TStringField;
    zqEstadoMarsimbolo: TBlobField;
    zqEstadoMarviento_max_nudos: TLongintField;
    zqEstadoMarviento_min_nudos: TLongintField;
    zqPrincipalcaptura_babor_buque: TStringField;
    zqPrincipalcaptura_estribor_buque: TStringField;
    zqPrincipalDifDistancia: TFloatField;
    zqPrincipalDifRumbo: TFloatField;
    zqPrincipalDifTiempo: TFloatField;
    zqPrincipalDifVelocidad: TFloatField;
    zqPrincipalDistanciaCalculada: TFloatField;
    zqPrincipalDistanciaMillas: TFloatField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalLatFin: TFloatField;
    zqPrincipalLatIni: TFloatField;
    zqPrincipalLongFin: TFloatField;
    zqPrincipalLongIni: TFloatField;
    zqPrincipalRumboCalculado: TFloatField;
    zqPrincipalRumboRegistrado: TFloatField;
    zqPrincipalTextoDistancia: TStringField;
    zqPrincipalTextoTiempo: TStringField;
    zqPrincipalTextoVelocidad: TStringField;
    zqPrincipalTiempoNecesario: TFloatField;
    zqPrincipalTiempoRegistrado: TFloatField;
    zqPrincipaltipo_malla: TStringField;
    zqPrincipalVelocidadRegistrada: TFloatField;
    zqPrincipalVelocNecesaria: TFloatField;
    zqProxLance: TZQuery;
    zqLkpEstadoMaraltura_max_olas: TFloatField;
    zqLkpEstadoMaraltura_media_olas: TFloatField;
    zqLkpEstadoMarcod_estado_mar: TLongintField;
    zqLkpEstadoMardescripcion: TStringField;
    zqLkpEstadoMarnombre: TStringField;
    zqLkpEstadoMarsimbolo: TBlobField;
    zqLkpEstadoMarviento_max_nudos: TLongintField;
    zqLkpEstadoMarviento_min_nudos: TLongintField;
    zqPrincipalcable_babor: TLongintField;
    zqPrincipalcable_estribor: TLongintField;
    zqPrincipalcaptura_babor: TFloatField;
    zqPrincipalcaptura_estribor: TFloatField;
    zqPrincipalcod_estado_mar: TLongintField;
    zqPrincipalcomentarios: TStringField;
    zqPrincipalcuadrante_latitud_fin: TStringField;
    zqPrincipalcuadrante_latitud_ini: TStringField;
    zqPrincipalcuadrante_longitud_fin: TStringField;
    zqPrincipalcuadrante_longitud_ini: TStringField;
    zqPrincipaldireccion_viento: TLongintField;
    zqPrincipalfecha: TDateField;
    zqPrincipalgrados_latitud_fin: TLongintField;
    zqPrincipalgrados_latitud_ini: TLongintField;
    zqPrincipalgrados_longitud_fin: TLongintField;
    zqPrincipalgrados_longitud_ini: TLongintField;
    zqPrincipalhora: TTimeField;
    zqPrincipalidlance: TLongintField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipallargo_relinga_inferior: TLongintField;
    zqPrincipalmallero_copo_mm: TLongintField;
    zqPrincipalminutos_arrastre: TFloatField;
    zqPrincipalminutos_latitud_fin: TFloatField;
    zqPrincipalminutos_latitud_ini: TFloatField;
    zqPrincipalminutos_longitud_fin: TFloatField;
    zqPrincipalminutos_longitud_ini: TFloatField;
    zqPrincipalnro_lance: TLongintField;
    zqPrincipalnudos_viento: TLongintField;
    zqPrincipalprofundidad: TLongintField;
    zqPrincipalrumbo: TLongintField;
    zqPrincipaltemperatura_aire: TFloatField;
    zqPrincipaltemperatura_fondo: TFloatField;
    zqPrincipaltemperatura_superficie: TFloatField;
    zqPrincipalvelocidad: TFloatField;
    zqAntLance: TZQuery;
    zqProxLanceprox_lance: TLargeintField;
    procedure bbBaborClick(Sender: TObject);
    procedure bbIgualAnteriorClick(Sender: TObject);
    procedure bbEstriborClick(Sender: TObject);
    procedure dbdtFechaEnter(Sender: TObject);
    procedure dbdtHoraEnter(Sender: TObject);
    procedure dbdtHoraExit(Sender: TObject);
    procedure dbedMinArrastreExit(Sender: TObject);
    procedure dbedMinutosLatFinExit(Sender: TObject);
    procedure dbedMinutosLatIniExit(Sender: TObject);
    procedure dbedMinutosLongFinExit(Sender: TObject);
    procedure dbedMinutosLongIniExit(Sender: TObject);
    procedure dbedVelocVientoChange(Sender: TObject);
    procedure dbedVelocVientoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gbDatosInicioExit(Sender: TObject);
    procedure paFechaHoraExit(Sender: TObject);
    procedure pcFormatosChange(Sender: TObject);
    procedure pcFormatosChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pcLancesChange(Sender: TObject);
    procedure zcePrincipalInitRecord(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject; var ValidacionOK: boolean);
    procedure zqAntLanceBeforeOpen(DataSet: TDataSet);
    procedure zqPrincipalAfterOpen(DataSet: TDataSet);
    procedure zqPrincipalcable_baborValidate(Sender: TField);
    procedure zqPrincipalcable_estriborValidate(Sender: TField);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalcaptura_babor_buqueChange(Sender: TField);
    procedure zqPrincipalcaptura_babor_buqueValidate(Sender: TField);
    procedure zqPrincipalcaptura_estribor_buqueChange(Sender: TField);
    procedure zqPrincipalcaptura_estribor_buqueValidate(Sender: TField);
    procedure zqPrincipalcod_estado_marValidate(Sender: TField);
    procedure zqPrincipaldireccion_vientoValidate(Sender: TField);
    procedure zqPrincipalfechaValidate(Sender: TField);
    procedure zqPrincipalgrados_latitud_finValidate(Sender: TField);
    procedure zqPrincipalgrados_latitud_iniValidate(Sender: TField);
    procedure zqPrincipalgrados_longitud_finValidate(Sender: TField);
    procedure zqPrincipalgrados_longitud_iniValidate(Sender: TField);
    procedure zqPrincipalhoraSetText(Sender: TField; const aText: string);
    procedure zqPrincipalminutos_arrastreValidate(Sender: TField);
    procedure zqPrincipalminutos_latitud_finValidate(Sender: TField);
    procedure zqPrincipalminutos_latitud_iniValidate(Sender: TField);
    procedure zqPrincipalminutos_longitud_finValidate(Sender: TField);
    procedure zqPrincipalminutos_longitud_iniValidate(Sender: TField);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqPrincipalprofundidadValidate(Sender: TField);
    procedure zqPrincipalrumboValidate(Sender: TField);
    procedure zqPrincipalvelocidadValidate(Sender: TField);
    procedure zqProxLanceBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
    FControlesEdicion: TControlsArray;
  public
    { public declarations }
  end;

function CapturaAStrNum(s_captura: string): string;

var
  fmEditarLances: TfmEditarLances;
  distancia_lance: double = -1;
  FormatosChanging:Boolean=False;


implementation

function CapturaAStrNum(s_captura: string): string;
var
  Expr: string;
  Decimal: string;
  OLD_DC: char;
begin
  OLD_DC := DecimalSeparator;
  DecimalSeparator := '.';
  //Si es una expresión fraccional, los '+' no se aplican, así que los borro
  if Pos('/', s_captura) > 0 then
  begin
    Expr := StringReplace(s_captura, '+', '', [rfReplaceAll]);
  end
  else if Pos('+', s_captura) > 0 then
  begin
    //    Expr:=copy(s_captura,Pos('+',s_captura),Length(s_captura)-Pos('+',s_captura)+1);
    Expr := s_captura;
    //Si hay más de 3 '+' lo cambio por '+++'
    if RightStr(Expr, 4) = '++++' then
    begin
      Expr := StringReplace(Expr, '+', '', [rfReplaceAll]) + '+++';
    end;
    //Busco +++, ++ o + y lo reemplazo por ',75', '.50' o '.25' respectivamente
    Expr := StringReplace(Expr, '+++', '.75', [rfReplaceAll]);
    Expr := StringReplace(Expr, '++', '.50', [rfReplaceAll]);
    Expr := StringReplace(Expr, '+', '.25', [rfReplaceAll]);
  end
  else
  begin
    Expr := s_captura;
  end;
  Result := Expr;
  DecimalSeparator := OLD_DC;
end;

{$R *.lfm}

{ TControlsArray }

procedure TControlsArray.SetActiveIndex(AValue: integer);
var
  i: integer;
begin
  i := FActiveIndex;
  if FActiveIndex = AValue then
    Exit;
  if AValue + 1 > Length(FControls) then
    SetLength(FControls, AValue + 1);
  FActiveIndex := AValue;
end;

constructor TControlsArray.Create;
begin
  inherited;
  FActiveIndex := 0;
  SetLength(FControls, 1);
end;

procedure TControlsArray.AddControl(index: integer; Name: string; Control: TControl);
begin
  //Si es necesario, redimensiono el array
  if index + 1 > Length(FControls) then
    SetLength(FControls, index + 1);
  // si no está inicializado, creo el stringlist
  if not Assigned(FControls[index]) then
    FControls[index] := TStringList.Create;
  // Si no se encuentra el nombre, lo agrego. Si no, no hago nada
  if FControls[index].IndexOf(Name) = -1 then
    FControls[index].AddObject(Name, Control);
end;

function TControlsArray.GetControl(index: integer; Name: string): TControl;
var
  i: integer;
begin
  Result := nil;
  if Assigned(FControls[index]) then
  begin
    i := FControls[index].IndexOf(Name);
    // Si encontró el nombre, devuelvo el control
    if i <> -1 then
    begin
      if (FControls[index].Objects[i] is TWinControl) then
        Result := (FControls[index].Objects[i] as TWinControl)
      else if (FControls[index].Objects[i] is TGraphicControl) then
        Result := (FControls[index].Objects[i] as TGraphicControl)
      else
        Result := nil;
    end;
  end;
end;

function TControlsArray.GetControl(Name: string): TControl;
var
  ai: integer;
begin
  ai:=ActiveIndex;
  Result := GetControl(ActiveIndex, Name);
end;

function TControlsArray.CanFocus(index: integer; Name: string): boolean;
var
  i: integer;
begin
  Result := False;
  if Assigned(FControls[index]) then
  begin
    i := FControls[index].IndexOf(Name);
    // Si encontró el nombre, devuelvo el control
    if i <> -1 then
    begin
      if (FControls[index].Objects[i] is TWinControl) then
        Result := (FControls[index].Objects[i] as TWinControl).CanFocus
      else
        Result := False;
    end;
  end;
end;

function TControlsArray.CanFocus(Name: string): boolean;
begin
  Result := CanFocus(FActiveIndex, Name);
end;

procedure TControlsArray.SetFocus(index: integer; Name: string);
var
  i: integer;
begin
  if Assigned(FControls[index]) then
  begin
    i := FControls[index].IndexOf(Name);
    // Si encontró el nombre, devuelvo el control
    if i <> -1 then
    begin
      if (FControls[index].Objects[i] is TWinControl) then
      begin
        if (FControls[index].Objects[i] as TWinControl).CanFocus then
          (FControls[index].Objects[i] as TWinControl).SetFocus;
      end;
    end;
  end;
end;

procedure TControlsArray.SetFocus(Name: string);
begin
  SetFocus(ActiveIndex, Name);
end;

procedure TControlsArray.SetColor(index: integer; Name: string; FontColor: TColor);
var
  i: integer;
begin
  if Assigned(FControls[index]) then
  begin
    i := FControls[index].IndexOf(Name);
    // Si encontró el nombre, seteo el FontColor del Font
    if i <> -1 then
    begin
      if (FControls[index].Objects[i] is TWinControl) then
        (FControls[index].Objects[i] as TWinControl).Font.Color := FontColor
      else if (FControls[index].Objects[i] is TGraphicControl) then
        (FControls[index].Objects[i] as TGraphicControl).Font.Color := FontColor;
    end;
  end;
end;

procedure TControlsArray.SetColor(Name: string; FontColor: TColor);
var
  C: TControl;
begin
  C := GetControl(Name);
  if Assigned(C) then
    if (C is TWinControl) then
      (C as TWinControl).Font.Color := FontColor
    else if (C is TGraphicControl) then
      (C as TGraphicControl).Font.Color := FontColor;
end;

procedure TControlsArray.SetHint(index: integer; Name: string; Hint: string);
var
  i: integer;
begin
  if Assigned(FControls[index]) then
  begin
    i := FControls[index].IndexOf(Name);
    // Si encontró el nombre, seteo el Hint
    if i <> -1 then
    begin
      if (FControls[index].Objects[i] is TWinControl) then
        (FControls[index].Objects[i] as TWinControl).Hint := Hint
      else if (FControls[index].Objects[i] is TGraphicControl) then
        (FControls[index].Objects[i] as TGraphicControl).Hint := Hint;
    end;
  end;
end;

procedure TControlsArray.SetHint(Name: string; Hint: string);
var
  C: TControl;
begin
  C := GetControl(Name);
  if Assigned(C) then
    if (C is TWinControl) then
      (C as TWinControl).Hint := Hint
    else if (C is TGraphicControl) then
      (C as TGraphicControl).Hint := Hint;
end;

{ TfmEditarLances }

procedure TfmEditarLances.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarLances.bbEstriborClick(Sender: TObject);
var
  dbm: TDBMemo;
begin
  if not (dsPrincipal.State in [dsInsert, dsEdit]) then
    dsPrincipal.Edit;
  dbm := (FControlesEdicion.GetControl('Comentarios') as TDBMemo);
  dbm.Text := dbm.Text + 'Estribor: ';
  FControlesEdicion.SetFocus('Comentarios');
  if dbm <> nil then
    dbm.SelStart := 500;
end;

procedure TfmEditarLances.bbBaborClick(Sender: TObject);
var
  dbm: TDBMemo;
begin
  if not (dsPrincipal.State in [dsInsert, dsEdit]) then
    dsPrincipal.Edit;
  dbm := (FControlesEdicion.GetControl('Comentarios') as TDBMemo);
  dbm.Text := dbm.Text + 'Babor: ';
  FControlesEdicion.SetFocus('Comentarios');
  if dbm <> nil then
    dbm.SelStart := 500;
end;

procedure TfmEditarLances.bbIgualAnteriorClick(Sender: TObject);
var
  dbm: TDBMemo;
begin
  if not (dsPrincipal.State in [dsInsert, dsEdit]) then
    dsPrincipal.Edit;
  dbm := (FControlesEdicion.GetControl('Comentarios') as TDBMemo);
  dbm.Text := dbm.Text + zqAntLancecomentarios.Value;
  FControlesEdicion.SetFocus('Comentarios');
  if dbm <> nil then
    dbm.SelStart := 500;
end;

procedure TfmEditarLances.dbdtHoraEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  //18/9/14: Ya no es necesario porque se cambia por un DBEdit y se pone máscara al campo
  //(Sender as TDBDateTimePicker).SelectDate;
  //(Sender as TDBDateTimePicker).SelectTime;
end;

procedure TfmEditarLances.dbdtHoraExit(Sender: TObject);
begin
{  if (zqPrincipal.State in [dsInsert,dsEdit]) and
  (zqAntLance.RecordCount>0) and
  (not zqPrincipalhora.IsNull) and
  (zqPrincipalhora.Value<zqAntLancehora.Value) then
  begin
    if MessageDlg('Ha ingresado una hora menor a la hora de inicio del lance anterior, lo cual sugiere un cambio de fecha. Se comenzarán a registrar los lances del día '+FormatDateTime('dd/mm/yyyy',IncDay(zqAntLancefecha.Value,1))+' ¿Está de acuerdo?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    begin
        zqPrincipalfecha.Value:=IncDay(zqAntLancefecha.Value,1);
    end else
    begin
      MessageDlg('Verifique si ingresó correctamente la hora de inicio, y si la fecha y hora del lance anterior son las correctas.', mtInformation, [mbClose],0);
      FControlesEdicion.SetFocus('Fecha');
    end;
  end; }
end;

procedure TfmEditarLances.dbedMinArrastreExit(Sender: TObject);
begin
  //if zqPrincipalgrados_latitud_fin.Value>0 then
  //   if dbedMinutosLatFin.CanFocus then
  //      dbedMinutosLatFin.SetFocus;
end;

procedure TfmEditarLances.dbedMinutosLatFinExit(Sender: TObject);
var
  minutos_tiempo: double;
  veloc_prom: double;
begin
  //Valido contra la posición inicial por si cambió de grado
  //a) Calculo los minutos entre el inicio y fin del lance actual
  minutos_tiempo := MinutesBetween(zqPrincipalfecha.AsDateTime +
    zqPrincipalhora.AsDateTime, IncMinute(zqPrincipalfecha.AsDateTime +
    zqPrincipalhora.AsDateTime, zqPrincipalminutos_arrastre.AsInteger));
  //b) Calculo velocidad promedio necesaria (solo en latitud, no cosidero
  //diferencia de longitud
  veloc_prom := VelocidadEnNudos(zqPrincipalgrados_latitud_ini.Value *
    100 + zqPrincipalminutos_latitud_ini.Value, 0,
    zqPrincipalgrados_latitud_fin.Value * 100 + zqPrincipalminutos_latitud_fin.Value,
    0, minutos_tiempo);
  //c) Si la velocidad promedio es mayor a 15 nudos, hay un problema,
  // Entonces veo si parece que cambió el grado
  if veloc_prom > 15 then
  begin
    if (zqPrincipalminutos_latitud_ini.Value < 10) and
      (zqPrincipalminutos_latitud_fin.Value > 50) then
    begin
      zqPrincipalgrados_latitud_fin.Value := zqPrincipalgrados_latitud_fin.Value - 1;
    end
    else if (zqPrincipalminutos_latitud_ini.Value > 50) and
      (zqPrincipalminutos_latitud_fin.Value < 10) then
    begin
      zqPrincipalgrados_latitud_fin.Value := zqPrincipalgrados_latitud_fin.Value + 1;
    end
    else if (((zqPrincipalminutos_latitud_ini.Value > 50) and
      (zqPrincipalminutos_latitud_fin.Value > 50)) or
      ((zqPrincipalminutos_latitud_ini.Value < 10) and
      (zqPrincipalminutos_latitud_fin.Value < 10))) and
      (zqPrincipalgrados_latitud_ini.Value <>
      zqPrincipalgrados_latitud_fin.Value) then
    begin
      zqPrincipalgrados_latitud_fin.Value := zqPrincipalgrados_latitud_ini.Value;
    end
    else //Ante otra condición, se intenta corregir colocando el mismo grado que al inicio
    begin
      zqPrincipalgrados_latitud_fin.Value := zqPrincipalgrados_latitud_ini.Value;
    end;
  end;
  //if zqPrincipalgrados_latitud_fin.Value>0 then
  //   if dbedMinutosLatFin.CanFocus then
  //      dbedMinutosLatFin.SetFocus;
end;

procedure TfmEditarLances.dbedMinutosLatIniExit(Sender: TObject);
var
  minutos_tiempo: double;
  veloc_prom: double;
begin
  if zqAntLance.RecordCount > 0 then
  begin
    //Valido contra el lance anterior por si cambió de grado
    //a) Calculo los minutos entre el fin del lance anterior y el
    //inicio del actual
    minutos_tiempo := MinutesBetween(zqPrincipalfecha.AsDateTime +
      zqPrincipalhora.AsDateTime, IncMinute(zqAntLancefecha.AsDateTime +
      zqAntLancehora.AsDateTime, zqAntLanceminutos_arrastre.AsInteger));
    //b) Calculo velocidad promedio necesaria (solo en latitud, no cosidero
    //diferencia de longitud
    veloc_prom := VelocidadEnNudos(zqAntLancegrados_latitud_fin.Value *
      100 + zqAntLanceminutos_latitud_fin.Value, 0,
      zqPrincipalgrados_latitud_ini.Value * 100 + zqPrincipalminutos_latitud_ini.Value,
      0, minutos_tiempo);
    //c) Si la velocidad promedio es mayor a 15 nudos, hay un problema,
    // Entonces veo si parece que cambió el grado
    if veloc_prom > 15 then
    begin
      if (zqAntLanceminutos_latitud_fin.Value < 10) and
        (zqPrincipalminutos_latitud_ini.Value > 50) then
      begin
        zqPrincipalgrados_latitud_ini.Value := zqPrincipalgrados_latitud_ini.Value - 1;
      end
      else if (zqAntLanceminutos_latitud_fin.Value > 50) and
        (zqPrincipalminutos_latitud_ini.Value < 10) then
      begin
        zqPrincipalgrados_latitud_ini.Value := zqPrincipalgrados_latitud_ini.Value + 1;
      end
      else if (((zqAntLanceminutos_latitud_fin.Value > 50) and
        (zqPrincipalminutos_latitud_ini.Value > 50)) or
        ((zqAntLanceminutos_latitud_fin.Value < 10) and
        (zqPrincipalminutos_latitud_ini.Value < 10))) and
        (zqAntLanceminutos_latitud_fin.Value <>
        zqPrincipalminutos_latitud_ini.Value) then
      begin
        zqPrincipalgrados_latitud_ini.Value := zqAntLancegrados_latitud_ini.Value;
      end;
    end;
  end;
  //if zqPrincipalgrados_longitud_ini.Value>0 then
  //   if dbedMinutosLongIni.CanFocus then
  //      dbedMinutosLongIni.SetFocus;
end;

procedure TfmEditarLances.dbedMinutosLongFinExit(Sender: TObject);
var
  minutos_tiempo: double;
  veloc_prom: double;
begin
  //Valido contra la posición inicial por si cambió de grado
  //a) Calculo los minutos entre el inicio y fin del lance actual
  minutos_tiempo := MinutesBetween(zqPrincipalfecha.AsDateTime +
    zqPrincipalhora.AsDateTime, IncMinute(zqPrincipalfecha.AsDateTime +
    zqPrincipalhora.AsDateTime, zqPrincipalminutos_arrastre.AsInteger));
  //b) Calculo velocidad promedio necesaria (solo en longitud, no cosidero
  //diferencia de latitud
  veloc_prom := VelocidadEnNudos(zqPrincipalgrados_longitud_ini.Value *
    100 + zqPrincipalminutos_longitud_ini.Value, 0,
    zqPrincipalgrados_longitud_fin.Value * 100 + zqPrincipalminutos_longitud_fin.Value,
    0, minutos_tiempo);
  //c) Si la velocidad promedio es mayor a 15 nudos, hay un problema,
  // Entonces veo si parece que cambió el grado
  if veloc_prom > 15 then
  begin
    if (zqPrincipalminutos_longitud_ini.Value < 10) and
      (zqPrincipalminutos_longitud_fin.Value > 50) then
    begin
      zqPrincipalgrados_longitud_fin.Value := zqPrincipalgrados_longitud_fin.Value - 1;
    end
    else if (zqPrincipalminutos_longitud_ini.Value > 50) and
      (zqPrincipalminutos_longitud_fin.Value < 10) then
    begin
      zqPrincipalgrados_longitud_fin.Value := zqPrincipalgrados_longitud_fin.Value + 1;
    end
    else if (((zqPrincipalminutos_longitud_ini.Value > 50) and
      (zqPrincipalminutos_longitud_fin.Value > 50)) or
      ((zqPrincipalminutos_longitud_ini.Value < 10) and
      (zqPrincipalminutos_longitud_fin.Value < 10))) and
      (zqPrincipalgrados_longitud_ini.Value <>
      zqPrincipalgrados_longitud_fin.Value) then
    begin
      zqPrincipalgrados_longitud_fin.Value := zqPrincipalgrados_longitud_ini.Value;
    end
    else //Ante otra condición, se intenta corregir colocando el mismo grado que al inicio
    begin
      zqPrincipalgrados_longitud_fin.Value := zqPrincipalgrados_longitud_ini.Value;
    end;
  end;
end;

procedure TfmEditarLances.dbedMinutosLongIniExit(Sender: TObject);
var
  minutos_tiempo: double;
  veloc_prom: double;
begin
  if (zqAntLance.RecordCount > 0)
  and (not zqAntLancegrados_latitud_fin.IsNull)
  and (not zqAntLanceminutos_latitud_fin.IsNull)
  and (not zqAntLancegrados_longitud_fin.IsNull)
  and (not zqAntLanceminutos_longitud_fin.IsNull) then
  begin
    //Valido contra el lance anterior por si cambió de grado
    //a) Calculo los minutos entre el fin del lance anterior y el
    //inicio del actual
    minutos_tiempo := MinutesBetween(zqPrincipalfecha.AsDateTime +
      zqPrincipalhora.AsDateTime, IncMinute(zqAntLancefecha.AsDateTime +
      zqAntLancehora.AsDateTime, zqAntLanceminutos_arrastre.AsInteger));
    //b) Calculo velocidad promedio necesaria (solo en longitud, no cosidero
    //diferencia de latitud
    veloc_prom := VelocidadEnNudos(zqAntLancegrados_longitud_fin.Value *
      100 + zqAntLanceminutos_longitud_fin.Value, 0,
      zqPrincipalgrados_longitud_ini.Value * 100 + zqPrincipalminutos_longitud_ini.Value,
      0, minutos_tiempo);
    //c) Si la velocidad promedio es mayor a 15 nudos, hay un problema,
    // Entonces veo si parece que cambió el grado
    if veloc_prom > 15 then
    begin
      if (zqAntLanceminutos_longitud_fin.Value < 10) and
        (zqPrincipalminutos_longitud_ini.Value > 50) then
      begin
        zqPrincipalgrados_longitud_ini.Value := zqPrincipalgrados_longitud_ini.Value - 1;
      end
      else if (zqAntLanceminutos_longitud_fin.Value > 50) and
        (zqPrincipalminutos_longitud_ini.Value < 10) then
      begin
        zqPrincipalgrados_longitud_ini.Value := zqPrincipalgrados_longitud_ini.Value + 1;
      end
      else if (((zqAntLanceminutos_longitud_fin.Value > 50) and
        (zqPrincipalminutos_longitud_ini.Value > 50)) or
        ((zqAntLanceminutos_longitud_fin.Value < 10) and
        (zqPrincipalminutos_longitud_ini.Value < 10))) and
        (zqAntLanceminutos_longitud_fin.Value <>
        zqPrincipalminutos_longitud_ini.Value) then
      begin
        zqPrincipalgrados_longitud_ini.Value := zqAntLancegrados_longitud_ini.Value;
      end;
    end;
  end;
end;

procedure TfmEditarLances.dbedVelocVientoChange(Sender: TObject);
begin
end;

procedure TfmEditarLances.dbedVelocVientoExit(Sender: TObject);
begin
  if dbedVelocViento.Text <> '' then
  begin
    zqLkpEstadoMar.Close;
    zqLkpEstadoMar.ParamByName('nudos_viento').Value := dbedVelocViento.Text;
    zqLkpEstadoMar.Open;
    if zqPrincipal.State in [dsEdit, dsInsert] then
      zqPrincipalcod_estado_mar.Value := zqLkpEstadoMarcod_estado_mar.Value;
  end
  else
  begin
    if zqPrincipal.State in [dsEdit, dsInsert] then
      zqPrincipalcod_estado_mar.AsString := '';
  end;
end;

procedure TfmEditarLances.FormClose(Sender: TObject;
    var CloseAction: TCloseAction);
begin
  LSSaveConfig(['formato_planilla_puente'], [pcFormatos.TabIndex]);
  //Vuelvo a sacar los TabStop de los grados, en caso de que se hubiesen puesto
  //por la validación de la hora
  dbedGradosLatIni.TabStop := False;
  dbedGradosLongIni.TabStop := False;
  dbedGradosLatIni1.TabStop := False;
  dbedGradosLongIni1.TabStop := False;
end;

procedure TfmEditarLances.FormCreate(Sender: TObject);
var
  formato: string;
begin
  FControlesEdicion := TControlsArray.Create;

  inherited;
  pcLances.ActivePage := tsGeneral;
  zcePrincipal.ControlInicial := dbdtHora;
  //Creo elvector con los controles de edición para cada pestaña de formato
  //Controles del formato predeterminado (TabIndex=0)
  FControlesEdicion.AddControl(0, 'Comentarios', dbmComentarios);
  FControlesEdicion.AddControl(0, 'Fecha', dbdtFecha);
  FControlesEdicion.AddControl(0, 'Hora', dbdtHora);
  FControlesEdicion.AddControl(0, 'CableBr', dbedCableBr);
  FControlesEdicion.AddControl(0, 'CableEr', dbedCableEr);
  FControlesEdicion.AddControl(0, 'CaptBr', dbedCaptBr);
  FControlesEdicion.AddControl(0, 'CaptEr', dbedCaptEr);
  FControlesEdicion.AddControl(0, 'GradosLatFin', dbedGradosLatFin);
  FControlesEdicion.AddControl(0, 'GradosLatIni', dbedGradosLatIni);
  FControlesEdicion.AddControl(0, 'GradosLongFin', dbedGradosLongFin);
  FControlesEdicion.AddControl(0, 'GradosLongIni', dbedGradosLongIni);
  FControlesEdicion.AddControl(0, 'MinArrastre', dbedMinArrastre);
  FControlesEdicion.AddControl(0, 'MinutosLatFin', dbedMinutosLatFin);
  FControlesEdicion.AddControl(0, 'MinutosLatIni', dbedMinutosLatIni);
  FControlesEdicion.AddControl(0, 'MinutosLongFin', dbedMinutosLongFin);
  FControlesEdicion.AddControl(0, 'MinutosLongIni', dbedMinutosLongIni);
  FControlesEdicion.AddControl(0, 'Profund', dbedProfund);
  FControlesEdicion.AddControl(0, 'Rumbo', dbedRumbo);
  FControlesEdicion.AddControl(0, 'Velocidad', dbedVelocidad);
  //Textos de verificación
  FControlesEdicion.AddControl(0, 'DistRegist', dbtDistRegist);
  FControlesEdicion.AddControl(0, 'VelRegist', dbtVelRegist);
  FControlesEdicion.AddControl(0, 'TiempoRegist', dbtTiempoRegist);
  FControlesEdicion.AddControl(0, 'RumboRegist', dbtRumboRegist);
  FControlesEdicion.AddControl(0, 'DistCalc', dbtDistCalc);
  FControlesEdicion.AddControl(0, 'VelCalc', dbtVelCalc);
  FControlesEdicion.AddControl(0, 'TiempoCalc', dbtTiempoCalc);
  FControlesEdicion.AddControl(0, 'RumboCalc', dbtRumboCalc);
  FControlesEdicion.AddControl(0, 'DistDif', dbtDistDif);
  FControlesEdicion.AddControl(0, 'VelDif', dbtVelDif);
  FControlesEdicion.AddControl(0, 'TiempoDif', dbtTiempoDif);
  FControlesEdicion.AddControl(0, 'RumboDif', dbtRumboDif);

  //Controles del formato alternativo (TabIndex=1)
  FControlesEdicion.AddControl(1, 'Comentarios', dbmComentarios1);
  FControlesEdicion.AddControl(1, 'Fecha', dbdtFecha1);
  FControlesEdicion.AddControl(1, 'Hora', dbdtHora1);
  FControlesEdicion.AddControl(1, 'CableBr', dbedCableBr1);
  FControlesEdicion.AddControl(1, 'CableEr', dbedCableEr1);
  FControlesEdicion.AddControl(1, 'CaptBr', dbedCaptBr1);
  FControlesEdicion.AddControl(1, 'CaptEr', dbedCaptEr1);
  FControlesEdicion.AddControl(1, 'GradosLatFin', dbedGradosLatFin1);
  FControlesEdicion.AddControl(1, 'GradosLatIni', dbedGradosLatIni1);
  FControlesEdicion.AddControl(1, 'GradosLongFin', dbedGradosLongFin1);
  FControlesEdicion.AddControl(1, 'GradosLongIni', dbedGradosLongIni1);
  FControlesEdicion.AddControl(1, 'MinArrastre', dbedMinArrastre1);
  FControlesEdicion.AddControl(1, 'MinutosLatFin', dbedMinutosLatFin1);
  FControlesEdicion.AddControl(1, 'MinutosLatIni', dbedMinutosLatIni1);
  FControlesEdicion.AddControl(1, 'MinutosLongFin', dbedMinutosLongFin1);
  FControlesEdicion.AddControl(1, 'MinutosLongIni', dbedMinutosLongIni1);
  FControlesEdicion.AddControl(1, 'Profund', dbedProfund1);
  FControlesEdicion.AddControl(1, 'Rumbo', dbedRumbo1);
  FControlesEdicion.AddControl(1, 'Velocidad', dbedVelocidad1);
  //Textos de verificación
  FControlesEdicion.AddControl(1, 'DistRegist', dbtDistRegist1);
  FControlesEdicion.AddControl(1, 'VelRegist', dbtVelRegist1);
  FControlesEdicion.AddControl(1, 'TiempoRegist', dbtTiempoRegist1);
  FControlesEdicion.AddControl(1, 'RumboRegist', dbtRumboRegist1);
  FControlesEdicion.AddControl(1, 'DistCalc', dbtDistCalc1);
  FControlesEdicion.AddControl(1, 'VelCalc', dbtVelCalc1);
  FControlesEdicion.AddControl(1, 'TiempoCalc', dbtTiempoCalc1);
  FControlesEdicion.AddControl(1, 'RumboCalc', dbtRumboCalc1);
  FControlesEdicion.AddControl(1, 'DistDif', dbtDistDif1);
  FControlesEdicion.AddControl(1, 'VelDif', dbtVelDif1);
  FControlesEdicion.AddControl(1, 'TiempoDif', dbtTiempoDif1);
  FControlesEdicion.AddControl(1, 'RumboDif', dbtRumboDif1);

  LSLoadConfig(['formato_planilla_puente'], [formato], [@formato]);
  if formato = '' then
    pcFormatos.TabIndex := 0
  else
    pcFormatos.TabIndex := StrToInt(formato);

  //FControlesEdicion.ActiveIndex := pcFormatos.TabIndex;

  //Asigno el evento acá, porque por algún motivo se desengancha.
  //Hay que averiguar por qué y solucionarlo
  if zcePrincipal.OnValidateForm = nil then
    zcePrincipal.OnValidateForm := @zcePrincipalValidateForm;
end;

procedure TfmEditarLances.FormShow(Sender: TObject);
begin
  pcLances.ActivePage:=tsGeneral;
  Application.ProcessMessages;
  FControlesEdicion.SetFocus('Hora');
end;

procedure TfmEditarLances.gbDatosInicioExit(Sender: TObject);
var
  dist_entre_lances: double;
  minutos_entre_lances: double;
  lat_fin_ant, long_fin_ant: double;
  velocidad_entre_lances: double;
begin
  //Evito que se ejecute la validación si está cambiando el tab de formatos
  if not FormatosChanging then
  begin
      dist_entre_lances := -1;
      minutos_entre_lances := -1;
      //Verifico también que la posición final no sea nula
      if (zqAntLance.RecordCount > 0) and (not zqAntLancegrados_latitud_fin.IsNull) and
        (not zqAntLancegrados_longitud_fin.IsNull) and
        (not zqAntLanceminutos_latitud_fin.IsNull) and
        (not zqAntLanceminutos_longitud_fin.IsNull) then
      begin
        lat_fin_ant := zqAntLancegrados_latitud_fin.Value * 100 +
          zqAntLanceminutos_latitud_fin.Value;
        long_fin_ant := zqAntLancegrados_longitud_fin.Value * 100 +
          zqAntLanceminutos_longitud_fin.Value;
        //Calculo la distancia entre el fin del lance anterior y el inicio del actual
        if (lat_fin_ant > 0) and (long_fin_ant > 0) and (not zqPrincipalLatIni.IsNull) and
          (not zqPrincipalLongIni.IsNull) then
        begin
          dist_entre_lances :=
            DistanciaEnMillas(lat_fin_ant, long_fin_ant, zqPrincipalLatIni.Value,
            zqPrincipalLongIni.Value);
        end;

        if dist_entre_lances <> -1 then
        begin
          //Calculo los minutos entre el fin del lance anterior y el inicio del actual
          minutos_entre_lances := MinutesBetween(
            IncMinute(zqAntLancefecha.AsDateTime + zqAntLancehora.AsDateTime,
            zqAntLanceminutos_arrastre.AsInteger), zqPrincipalfecha.AsDateTime +
            zqPrincipalhora.AsDateTime);

          velocidad_entre_lances :=
            dist_entre_lances * 60 / minutos_entre_lances;
          //Si la velocidad calculada entre lances es mayor a 15 nudos, hay un error en los datos
          if velocidad_entre_lances > 15 then
          begin
            if MessageDlg('Advertencia',
              'El tiempo entre el fin del lance anterior y el inicio del actual no concuerda con la distancia entre ambos lances. El buque debería haber recorrido ' + FormatFloat('0.00', dist_entre_lances) + ' millas en ' + FormatFloat('0', minutos_entre_lances) + ' minutos, a una velocidad de ' + FormatFloat('0.0', velocidad_entre_lances) + ' nudos, lo cual no es posible. Verifique la hora y las posiciones del lance actual y del anterior. ¿Desea continuar igualmente con este error?', mtError, mbYesNo, 0, mbNo) = mrNo then
            begin
              FControlesEdicion.SetFocus('GradosLatIni');
            end;
          end;
        end;
      end;
  end;
end;

procedure TfmEditarLances.paFechaHoraExit(Sender: TObject);
var
  minutos_entre_lances: double;
  msg_dif_horas: string;
  hay_error: boolean;
begin
  hay_error:=False;
  //Evito que se ejecute la validación si está cambiando el tab de formatos
  if not FormatosChanging then
  begin
      if zqPrincipalhora.IsNull then
      begin
        MessageDlg('Debe indicar la hora de inicio del lance', mtError, [mbOK], 0);
        FControlesEdicion.SetFocus('Hora');
        hay_error:=True;
      end
      else //Si la hora es mayor o igual al inicio del lance anterior
      //pero menor a la hora de virada, es error
      if (zqAntLance.RecordCount > 0) and ((int(zqPrincipalfecha.AsDateTime) +
        zqPrincipalhora.AsDateTime) >= (int(zqAntLancefecha.AsDateTime) +
        zqAntLancehora.AsDateTime)) and ((int(zqPrincipalfecha.AsDateTime) +
        zqPrincipalhora.AsDateTime) <= IncMinute(int(zqAntLancefecha.AsDateTime) +
        zqAntLancehora.AsDateTime, zqAntLanceminutos_arrastre.AsInteger)) then
      begin
        MessageDlg('EL inicio del lance debe ser mayor a la finalización del lance anterior: '
          + FormatDateTime('dd/mm/yyyy  hh:mm',
          IncMinute(int(zqAntLancefecha.AsDateTime) + zqAntLancehora.AsDateTime,
          zqAntLanceminutos_arrastre.AsInteger)), mtError, [mbOK], 0);
        FControlesEdicion.SetFocus('Fecha');
        hay_error:=True;
      end
      else
      //Si la hora es anterior al inicio del lance anterior, sugiero
      //cambio de fecha
      if (zqAntLance.RecordCount > 0) and ((int(zqPrincipalfecha.AsDateTime) +
        zqPrincipalhora.AsDateTime) < (int(zqAntLancefecha.AsDateTime) +
        zqAntLancehora.AsDateTime)) then
      begin
        if MessageDlg(
          'Ha ingresado una hora menor a la hora de inicio del lance anterior, lo cual sugiere un cambio de fecha. Se comenzarán a registrar los lances del día ' + FormatDateTime('dd/mm/yyyy', IncDay(zqAntLancefecha.Value, 1)) + ' ¿Está de acuerdo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          zqPrincipalfecha.Value := IncDay(zqAntLancefecha.Value, 1);
        end
        else
        begin
          MessageDlg(
            'Verifique si ingresó correctamente la hora de inicio, y si la fecha y hora del lance anterior son las correctas.',
            mtError, [mbClose], 0);
          FControlesEdicion.SetFocus('Fecha');
          hay_error:=True;
        end;
      end;

      if (not hay_error) and (zqAntLance.RecordCount > 0) then
      begin
          //Calculo los minutos entre el fin del lance anterior y el inicio del actual
          minutos_entre_lances := MinutesBetween(
            IncMinute(zqAntLancefecha.AsDateTime + zqAntLancehora.AsDateTime,
            zqAntLanceminutos_arrastre.AsInteger), zqPrincipalfecha.AsDateTime +
            zqPrincipalhora.AsDateTime);

          msg_dif_horas := '';
          //Si la diferencia entre el lance anterior es de más de 2 horas, habilito
          //los campos de grado para que se confirme la posición
          if (minutos_entre_lances / 60) >= 48 then //si la diferencia es > 2 días, mensaje en días
          begin
            msg_dif_horas :=
              'Hay una diferencia de varios días respecto al último lance registrado. Por favor verifique que los grados de latitud y longitud ingresados sean correctos';
          end
          else
          if (minutos_entre_lances / 60) > 2 then //si la diferencia es > 2 horas, mensaje en horas
          begin
            msg_dif_horas :=
              'Hay una diferencia de varias horas respecto al último lance registrado. Por favor verifique que los grados de latitud y longitud ingresados sean correctos';
          end;

          if (minutos_entre_lances / 60) > 2 then
          begin
            MessageDlg(msg_dif_horas, mtInformation, [mbOK], 0);
            //Habilito el TabStop en los campos de grado. Se deshabilitarán nuevamente en el próximo registro
            //Solo habilito el inicial, ya que el final se corrige automáticamente
            dbedGradosLatIni.TabStop := True;
            dbedGradosLongIni.TabStop := True;

            dbedGradosLatIni1.TabStop := True;
            dbedGradosLongIni1.TabStop := True;
            FControlesEdicion.SetFocus('GradosLatIni');
          end;

          if (zqAntLancegrados_latitud_fin.IsNull) or
             (zqAntLancegrados_longitud_fin.IsNull) or
             (zqAntLanceminutos_latitud_fin.IsNull) or
             (zqAntLanceminutos_longitud_fin.IsNull) then
          begin
            MessageDlg('Los datos de posición final del lance anterior están incompletos, por lo tanto no se puede validar la posición incial de este lance. Por favor asegúrese de que los datos ingresados sean correctos.', mtInformation, [mbOK], 0);
          end;
      end;
  end;
end;

procedure TfmEditarLances.pcFormatosChange(Sender: TObject);
begin
  FormatosChanging:=False;
  FControlesEdicion.ActiveIndex := pcFormatos.TabIndex;
//  LSSaveConfig(['formato_planilla_puente'], [pcFormatos.TabIndex]);
  FControlesEdicion.SetFocus('Hora');
  //Seteo el control predeterminado en el controlador
  if pcFormatos.TabIndex = 0 then
    zcePrincipal.ControlInicial := dbdtHora
  else
    zcePrincipal.ControlInicial := dbdtHora1;
end;

procedure TfmEditarLances.pcFormatosChanging(Sender: TObject;
    var AllowChange: Boolean);
begin
  FormatosChanging:=True;
end;

procedure TfmEditarLances.pcLancesChange(Sender: TObject);
begin
  if pcLances.ActivePage = tsOtrosDatos then
  begin
    if dbedTempSuperf.CanFocus then
      dbedTempSuperf.SetFocus;
  end;
end;

procedure TfmEditarLances.zcePrincipalInitRecord(Sender: TObject);
var
  formato: string;
begin
  pcLances.PageIndex := 0;
  LSLoadConfig(['formato_planilla_puente'], [formato], [@formato]);
  if formato = '' then
    pcFormatos.PageIndex := 0
  else
    pcFormatos.PageIndex := StrToInt(formato);

  FControlesEdicion.ActiveIndex := pcFormatos.PageIndex;
end;

procedure TfmEditarLances.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
  if (not zqPrincipalcable_babor.IsNull) and ((zqPrincipalcable_babor.AsInteger < 200) or (zqPrincipalcable_babor.AsInteger > 800)) then
  begin
    MessageDlg('Ingrese los metros de cable filado', mtError, [mbOK], 0);
    ValidacionOK := False;
    FControlesEdicion.SetFocus('CableBr');
  end;

  if (not zqPrincipalcable_estribor.IsNull) and ((zqPrincipalcable_estribor.AsInteger < 200) or (zqPrincipalcable_estribor.AsInteger > 800)) then
  begin
    MessageDlg('Ingrese los metros de cable filado', mtError, [mbOK], 0);
    ValidacionOK := False;
    FControlesEdicion.SetFocus('CableEr');
  end;

  if (zqPrincipallargo_relinga_inferior.IsNull) then
  begin
    MessageDlg('En la pestaña de datos complementarios debe indicar los datos del equipo de pesca', mtError, [mbOK], 0);
    ValidacionOK := False;
  end;

  if (zqPrincipalLatIni.Value > 0) and (zqPrincipalLongIni.Value > 0) and
    (zqPrincipalLatFin.Value > 0) and (zqPrincipalLongFin.Value > 0) then
  begin
    if (zqPrincipalDistanciaMillas.Value > 3) or
      (zqPrincipalVelocNecesaria.Value > 5.8) or
      (zqPrincipalVelocNecesaria.Value < 3) or
      (zqPrincipalTiempoNecesario.Value > 40) or
      (zqPrincipalDifRumbo.Value>15) then
    begin
      if MessageDlg('Advertencia',
        'Parece que algo no está bien con las posiciones, el tiempo de arrastre, el rumbo o la velocidad. ¿Desea guardar igualmente estos datos con error?', mtWarning, [mbYes, mbNo], 0, mbNo) = mrNo then
      begin
        ValidacionOK := False;
      end
      else
      begin
        ValidacionOK := (ValidacionOK and True);
        //Hago foco en la hora para que quede posicionado para el siguiente registro (alta continua)
      end;
    end;
  end;
  LSSaveConfig(['formato_planilla_puente'], [pcFormatos.TabIndex]);
end;

procedure TfmEditarLances.zqAntLanceBeforeOpen(DataSet: TDataSet);
begin
  zqAntLance.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
  zqAntLance.ParamByName('nro_lance').Value := zqPrincipalnro_lance.Value;
end;

procedure TfmEditarLances.zqPrincipalAfterOpen(DataSet: TDataSet);
begin
  zqAntLance.Close;
  zqAntLance.Open;

end;

procedure TfmEditarLances.zqPrincipalcable_baborValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 200) or (Sender.AsInteger > 800)) then
  begin
    MessageDlg('Ingrese los metros de cable filado', mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('CableBr');
  end;
end;

procedure TfmEditarLances.zqPrincipalcable_estriborValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 200) or (Sender.AsInteger > 800)) then
  begin
    MessageDlg('Ingrese los metros de cable filado', mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('CableEr');
  end;
end;

procedure TfmEditarLances.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  FControlesEdicion.SetHint('DistCalc', '');
  FControlesEdicion.SetHint('VelCalc', '');
  FControlesEdicion.SetHint('TiempoCalc', '');
  zqPrincipalEncabezado.Value := 'Lance Nº ' + zqPrincipalnro_lance.AsString;
  if (zcePrincipal.Accion = ED_AGREGAR) and (zqAntLance.RecordCount > 0) then
    zqPrincipalEncabezado.Value :=
      zqPrincipalEncabezado.Value + ' (Lance anterior: ' + FormatDateTime(
      'dd/mm/yyyy', zqAntLancefecha.AsDateTime) + ' a las ' +
      FormatDateTime('hh:mm', zqAntLancehora.AsDateTime) + ')';
  zqPrincipalLatIni.Value := zqPrincipalgrados_latitud_ini.Value *
    100 + zqPrincipalminutos_latitud_ini.Value;
  zqPrincipalLongIni.Value := zqPrincipalgrados_longitud_ini.Value *
    100 + zqPrincipalminutos_longitud_ini.Value;
  zqPrincipalLatFin.Value := zqPrincipalgrados_latitud_fin.Value *
    100 + zqPrincipalminutos_latitud_fin.Value;
  zqPrincipalLongFin.Value := zqPrincipalgrados_longitud_fin.Value *
    100 + zqPrincipalminutos_longitud_fin.Value;
  //Verifico por no nulo, ya que cero puede ser un valor válido
  //if (zqPrincipalminutos_latitud_ini.Value > 0) and
  //  (zqPrincipalminutos_longitud_ini.Value > 0) and
  //  (zqPrincipalminutos_latitud_fin.Value > 0) and
  //  (zqPrincipalminutos_longitud_fin.Value > 0) then
  if (not zqPrincipalminutos_latitud_ini.IsNull) and
    (not zqPrincipalminutos_longitud_ini.IsNull) and
    (not zqPrincipalminutos_latitud_fin.IsNull) and
    (not zqPrincipalminutos_longitud_fin.IsNull) then
  begin
    //Calculo distancia
    zqPrincipalDistanciaMillas.Value :=
      DistanciaEnMillas(zqPrincipalLatIni.Value, zqPrincipalLongIni.Value,
      zqPrincipalLatFin.Value, zqPrincipalLongFin.Value);
    // Pongo en rojo valores dudosos
    if (zqPrincipalDistanciaMillas.Value > 3) or
      (zqPrincipalDistanciaMillas.Value = 0) then
      FControlesEdicion.SetColor('DistRegist', clRed)
    else
      FControlesEdicion.SetColor('DistRegist', clDefault);

    //Calculo rumbo
    zqPrincipalRumboCalculado.Value :=
      Rumbo(zqPrincipalLatIni.Value, zqPrincipalLongIni.Value,
      zqPrincipalLatFin.Value, zqPrincipalLongFin.Value);

    //Calculo diferencia > 15°
    zqPrincipalDifRumbo.Value:=abs(zqPrincipalRumboCalculado.Value-zqPrincipalrumbo.Value);
    //Me aseguro de que la diferencia no sea mayor a 180°
    if zqPrincipalDifRumbo.Value>180 then
       zqPrincipalDifRumbo.Value:=360-zqPrincipalDifRumbo.Value;

    // Pongo en rojo valores dudosos
    if zqPrincipalDifRumbo.Value > 15 then
      FControlesEdicion.SetColor('RumboRegist', clRed)
    else
      FControlesEdicion.SetColor('RumboRegist', clDefault);
  end
  else
  begin
    zqPrincipalDistanciaMillas.AsVariant := Null;
    zqPrincipalRumboCalculado.AsVariant := Null;
  end;

  if (not zqPrincipalDistanciaMillas.IsNull) and
    (zqPrincipalminutos_arrastre.Value > 0) and
    (zqPrincipalDistanciaMillas.Value > 0) then
  begin
    zqPrincipalTextoVelocidad.Value :=
      'Velocidad necesaria para navegar ' + FormatFloat('0.00',
      zqPrincipalDistanciaMillas.Value) + ' millas en ' +
      FormatFloat('0.#', zqPrincipalminutos_arrastre.Value) + ' minutos';
    zqPrincipalVelocNecesaria.Value :=
      zqPrincipalDistanciaMillas.Value * 60 / zqPrincipalminutos_arrastre.Value;
    FControlesEdicion.SetHint('VelCalc', zqPrincipalTextoVelocidad.Value);
    // Pongo en rojo valores dudosos
    if (zqPrincipalVelocNecesaria.Value > 5.8) or
      (zqPrincipalVelocNecesaria.Value < 3) then
      FControlesEdicion.SetColor('VelCalc', clRed)
    else
      FControlesEdicion.SetColor('VelCalc', clDefault);
  end
  else
    zqPrincipalTextoVelocidad.Value := '';

  if (not zqPrincipalDistanciaMillas.IsNull) and
    (zqPrincipalDistanciaMillas.Value > 0) and (zqPrincipalvelocidad.Value > 0) then
  begin
    zqPrincipalTextoTiempo.Value :=
      'Minutos necesarios para navegar ' + FormatFloat('0.00',
      zqPrincipalDistanciaMillas.Value) + ' millas a ' +
      FormatFloat('0.0#', zqPrincipalvelocidad.Value) + ' nudos';
    zqPrincipalTiempoNecesario.Value :=
      zqPrincipalDistanciaMillas.Value * 60 / zqPrincipalvelocidad.Value;
    FControlesEdicion.SetHint('TiempoCalc', zqPrincipalTextoTiempo.Value);
    // Pongo en rojo valores dudosos
    if zqPrincipalTiempoNecesario.Value > 40 then
      FControlesEdicion.SetColor('TiempoCalc', clRed)
    else
      FControlesEdicion.SetColor('TiempoCalc', clDefault);
  end
  else
    zqPrincipalTextoTiempo.Value := '';

  if (zqPrincipalvelocidad.Value > 0) and (zqPrincipalminutos_arrastre.Value > 0) then
  begin
    zqPrincipalTextoDistancia.Value :=
      'Distancia recorrida al navegar ' + FormatFloat('0.#',
      zqPrincipalminutos_arrastre.Value) + ' minutos a ' +
      FormatFloat('0.0#', zqPrincipalvelocidad.Value) + ' nudos';
    zqPrincipalDistanciaCalculada.Value :=
      (zqPrincipalvelocidad.Value * zqPrincipalminutos_arrastre.Value) / 60;
    FControlesEdicion.SetHint('DistCalc', zqPrincipalTextoDistancia.Value);
    // Pongo en rojo valores dudosos
    if zqPrincipalDistanciaCalculada.Value > 3 then
      FControlesEdicion.SetColor('DistCalc', clRed)
    else
      FControlesEdicion.SetColor('DistCalc', clDefault);
  end
  else
    zqPrincipalTextoVelocidad.Value := '';

  //Calculo las diferencias
  if (not zqPrincipalDistanciaMillas.IsNull) and
    (zqPrincipalDistanciaMillas.Value > 0) and
    (not zqPrincipalDistanciaCalculada.IsNull) then
  begin
    zqPrincipalDifDistancia.Value :=
      Abs(100 - (zqPrincipalDistanciaCalculada.Value * 100 /
      zqPrincipalDistanciaMillas.Value));
    if zqPrincipalDifDistancia.Value > 10 then
      FControlesEdicion.SetColor('DistDif', clRed)
    else if zqPrincipalDifDistancia.Value > 5 then
      FControlesEdicion.SetColor('DistDif', clBlue)
    else
      FControlesEdicion.SetColor('DistDif', clDefault);
  end;
  if (not zqPrincipalvelocidad.IsNull) and (not zqPrincipalVelocNecesaria.IsNull) then
  begin
    zqPrincipalDifVelocidad.Value :=
      Abs(100 - (zqPrincipalVelocNecesaria.Value * 100 / zqPrincipalvelocidad.Value));
    if zqPrincipalDifVelocidad.Value > 10 then
      FControlesEdicion.SetColor('VelDif', clRed)
    else if zqPrincipalDifDistancia.Value > 5 then
      FControlesEdicion.SetColor('VelDif', clBlue)
    else
      FControlesEdicion.SetColor('VelDif', clDefault);
  end;
  if (not zqPrincipalminutos_arrastre.IsNull) and
    (not zqPrincipalTiempoNecesario.IsNull) then
  begin
    zqPrincipalDifTiempo.Value :=
      Abs(100 - (zqPrincipalminutos_arrastre.Value * 100 /
      zqPrincipalTiempoNecesario.Value));
    if zqPrincipalDifVelocidad.Value > 10 then
      FControlesEdicion.SetColor('TiempoDif', clRed)
    else if zqPrincipalDifDistancia.Value > 5 then
      FControlesEdicion.SetColor('TiempoDif', clBlue)
    else
      FControlesEdicion.SetColor('TiempoDif', clDefault);
  end;
  if (not zqPrincipalrumbo.IsNull) and
    (not zqPrincipalRumboCalculado.IsNull) then
  begin
    if zqPrincipalDifRumbo.Value > 15 then
      FControlesEdicion.SetColor('RumboDif', clRed)
    else
      FControlesEdicion.SetColor('RumboDif', clDefault);
  end;

  //Los siguientes dos campos se crean para poder formatearlos independientemente del campo original
  if not zqPrincipalminutos_arrastre.IsNull then
    zqPrincipalTiempoRegistrado.Value := zqPrincipalminutos_arrastre.Value;
  if not zqPrincipalvelocidad.IsNull then
    zqPrincipalVelocidadRegistrada.Value := zqPrincipalvelocidad.Value;
  if not zqPrincipalrumbo.IsNull then
    zqPrincipalRumboRegistrado.Value := zqPrincipalrumbo.Value;

  zqPrincipal.DisableControls;
  zqPrincipal.EnableControls;
end;

procedure TfmEditarLances.zqPrincipalcaptura_babor_buqueChange(Sender: TField);
var
  FLSExpression: TLSExpression;
  Expr: string;
  OLD_DC: char;
begin
  OLD_DC := DecimalSeparator;
  DecimalSeparator := ',';
  FLSExpression := TLSExpression.Create;
  if (not Sender.IsNull) and (Sender.AsString <> '') then
  begin
    Expr := CapturaAStrNum(Sender.AsString);
    Expr := '0' + StringReplace(Expr, '.', ',', [rfReplaceAll]);
    FLSExpression.Calculate(Expr);
    if FLSExpression.Error = CLSExpressionNoError then
    begin
      zqPrincipalcaptura_babor.Value :=
        round(FLSExpression.Result / dmGeneral.zqMareaActivafactor_calc_captura.Value *
        100) / 100;
    end;
  end
  else
  begin
    zqPrincipalcaptura_babor.AsString := '';
  end;
  FLSExpression.Free;
  DecimalSeparator := OLD_DC;
end;

procedure TfmEditarLances.zqPrincipalcaptura_babor_buqueValidate(Sender: TField);
var
  FLSExpression: TLSExpression;
  factor: integer;
  Expr: string;
  OLD_DC: char;
begin
  OLD_DC := DecimalSeparator;
  DecimalSeparator := ',';
  FLSExpression := TLSExpression.Create;
  if (not Sender.IsNull) then
  begin
    Expr := CapturaAStrNum(Sender.AsString);
    Expr := '0' + StringReplace(Expr, '.', ',', [rfReplaceAll]);
    FLSExpression.Calculate(Expr);
    if FLSExpression.Error <> CLSExpressionNoError then
    begin
      MessageDlg('El valor de captura indicado no es correcto. Verifique',
        mtError, [mbOK], 0);
      FControlesEdicion.SetFocus('CaptBr');
    end
    else
    begin
      //Valido el rango
      factor := dmGeneral.zqMareaActivafactor_calc_captura.AsInteger;
      if (Sender.AsString <> '') and ((FLSExpression.Result < 0) or
        (FLSExpression.Result > factor)) then
      begin
        MessageDlg('El valor de captura debe estar comprendido entre 0 y ' +
          IntToStr(factor), mtError, [mbOK], 0);
        FControlesEdicion.SetFocus('CaptBr');
      end;
    end;
  end;
  FLSExpression.Free;
  DecimalSeparator := OLD_DC;
end;

procedure TfmEditarLances.zqPrincipalcaptura_estribor_buqueChange(Sender: TField);
var
  FLSExpression: TLSExpression;
  Expr: string;
  OLD_DC: char;
begin
  OLD_DC := DecimalSeparator;
  DecimalSeparator := ',';
  FLSExpression := TLSExpression.Create;
  if (not Sender.IsNull) and (Sender.AsString <> '') then
  begin
    Expr := CapturaAStrNum(Sender.AsString);
    Expr := '0' + StringReplace(Expr, '.', ',', [rfReplaceAll]);
    FLSExpression.Calculate(Expr);
    if FLSExpression.Error = CLSExpressionNoError then
    begin
      zqPrincipalcaptura_estribor.Value :=
        round(FLSExpression.Result / dmGeneral.zqMareaActivafactor_calc_captura.Value *
        100) / 100;
    end;
  end
  else
  begin
    zqPrincipalcaptura_estribor.AsString := '';
  end;
  FLSExpression.Free;
  DecimalSeparator := OLD_DC;
end;

procedure TfmEditarLances.zqPrincipalcaptura_estribor_buqueValidate(Sender: TField);
var
  FLSExpression: TLSExpression;
  factor: integer;
  Expr: string;
  OLD_DC: char;
begin
  OLD_DC := DecimalSeparator;
  DecimalSeparator := ',';
  FLSExpression := TLSExpression.Create;
  if (not Sender.IsNull) then
  begin
    Expr := CapturaAStrNum(Sender.AsString);
    Expr := '0' + StringReplace(Expr, '.', ',', [rfReplaceAll]);
    FLSExpression.Calculate(Expr);
    if FLSExpression.Error <> CLSExpressionNoError then
    begin
      MessageDlg('El valor de captura indicado no es correcto. Verifique',
        mtError, [mbOK], 0);
      FControlesEdicion.SetFocus('CaptEr');
    end
    else
    begin
      //Valido el rango
      factor := dmGeneral.zqMareaActivafactor_calc_captura.AsInteger;
      if (Sender.AsString <> '') and ((FLSExpression.Result < 0) or
        (FLSExpression.Result > factor)) then
      begin
        MessageDlg('El valor de captura debe estar comprendido entre 0 y ' +
          IntToStr(factor), mtError, [mbOK], 0);
        FControlesEdicion.SetFocus('CaptEr');
      end;
    end;
  end;
  FLSExpression.Free;
  DecimalSeparator := OLD_DC;
end;

procedure TfmEditarLances.zqPrincipalcod_estado_marValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 0) or (Sender.AsInteger > 12)) then
  begin
    MessageDlg('Indique el estado del mar según la escala Beaufort (de 0 a 12)',
      mtError, [mbOK], 0);
    if dbedEstadoMar.CanFocus then
      dbedEstadoMar.SetFocus;
  end;
end;

procedure TfmEditarLances.zqPrincipaldireccion_vientoValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 1) or (Sender.AsInteger > 360)) then
  begin
    MessageDlg('Indique la dirección del viento en grados, de 1 a 360',
      mtError, [mbOK], 0);
    if dbedDireccViento.CanFocus then
      dbedDireccViento.SetFocus;
  end;
end;

procedure TfmEditarLances.zqPrincipalfechaValidate(Sender: TField);
begin
  //if (not Sender.IsNull) and (sender.AsDateTime<zqAntLancefecha.Value) then
  //begin
  //  MessageDlg('La fecha ('+zqPrincipalfecha.AsString+') debe ser igual o mayor a la del lance anterior: '+zqAntLancefecha.AsString, mtWarning, [mbOK],0);
  //  if dbdtFecha.CanFocus then
  //     dbdtFecha.SetFocus;
  //end;
end;

procedure TfmEditarLances.zqPrincipalgrados_latitud_finValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 37) or (Sender.AsInteger > 55)) then
  begin
    MessageDlg('Los grados de latitud (' + Sender.AsString +
      ') no corresponden a una zona de pesca de vieira', mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('GradosLatFin');
  end;
end;

procedure TfmEditarLances.zqPrincipalgrados_latitud_iniValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 37) or (Sender.AsInteger > 55)) then
  begin
    MessageDlg('Los grados de latitud (' + Sender.AsString +
      ') no corresponden a una zona de pesca de vieira', mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('GradosLatIni');
  end;
end;

procedure TfmEditarLances.zqPrincipalgrados_longitud_finValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 53) or (Sender.AsInteger > 68)) then
  begin
    MessageDlg('Los grados de longitud (' + Sender.AsString +
      ') no corresponden a una zona de pesca de vieira', mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('GradosLongFin');
  end;
end;

procedure TfmEditarLances.zqPrincipalgrados_longitud_iniValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 53) or (Sender.AsInteger > 68)) then
  begin
    MessageDlg('Los grados de longitud (' + Sender.AsString +
      ') no corresponden a una zona de pesca de vieira', mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('GradosLongIni');
  end;
end;

procedure TfmEditarLances.zqPrincipalhoraSetText(Sender: TField; const aText: string);
begin
  if not HoraOK(aText) then
    MessageDlg('La hora ingresada no es correcta. Por favor verifique.',
      mtError, [mbClose], 0)
  else
    Sender.AsString := aText;
end;

procedure TfmEditarLances.zqPrincipalminutos_arrastreValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 1) or (Sender.AsInteger > 45)) then
  begin
    MessageDlg('Indique la duración del lance en minutos', mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('MinArrastre');
  end;
end;

procedure TfmEditarLances.zqPrincipalminutos_latitud_finValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsFloat < 0) or (Sender.AsFloat >= 60)) then
  begin
    MessageDlg('Ingrese los minutos con dos decimales (de 00.00 a 59.99)',
      mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('MinutosLatFin');
  end;
end;

procedure TfmEditarLances.zqPrincipalminutos_latitud_iniValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsFloat < 0) or (Sender.AsFloat >= 60)) then
  begin
    MessageDlg('Ingrese los minutos con dos decimales (de 00.00 a 59.99)',
      mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('MinutosLatIni');
  end;
end;

procedure TfmEditarLances.zqPrincipalminutos_longitud_finValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsFloat < 0) or (Sender.AsFloat >= 60)) then
  begin
    MessageDlg('Ingrese los minutos con dos decimales (de 00.00 a 59.99)',
      mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('MinutosLongFin');
  end;
end;

procedure TfmEditarLances.zqPrincipalminutos_longitud_iniValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsFloat < 0) or (Sender.AsFloat >= 60)) then
  begin
    MessageDlg('Ingrese los minutos con dos decimales (de 00.00 a 59.99)',
      mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('MinutosLongIni');
  end;
end;

procedure TfmEditarLances.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value := dmGeneral.IdMareaActiva;
  zqPrincipalidlance.Value := zcePrincipal.NuevoID('lances');
  zqPrincipalnro_lance.Value := zqProxLanceprox_lance.Value;
  zqAntLance.Close;
  zqAntLance.Open;
  if zqAntLance.RecordCount > 0 then
  begin
    zqPrincipalfecha.Value := zqAntLancefecha.Value;
    //Establezco el grado inicial igual al grado final del lance anterior
    zqPrincipalgrados_latitud_ini.Value := zqAntLancegrados_latitud_fin.Value;
    zqPrincipalgrados_longitud_ini.Value := zqAntLancegrados_longitud_fin.Value;
    zqPrincipalgrados_latitud_fin.Value := zqAntLancegrados_latitud_fin.Value;
    zqPrincipalgrados_longitud_fin.Value := zqAntLancegrados_longitud_fin.Value;
    if not zqAntLancecable_estribor.IsNull then
      zqPrincipalcable_estribor.Value := zqAntLancecable_estribor.Value;
    if not zqAntLancecable_babor.IsNull then
      zqPrincipalcable_babor.Value := zqAntLancecable_babor.Value;
    zqPrincipalprofundidad.Value := zqAntLanceprofundidad.Value;
    zqPrincipalminutos_arrastre.Value := zqAntLanceminutos_arrastre.Value;
    zqPrincipalmallero_copo_mm.Value := zqAntLancemallero_copo_mm.Value;
    zqPrincipaltipo_malla.Value := zqAntLancetipo_malla.Value;
    zqPrincipallargo_relinga_inferior.Value := zqAntLancelargo_relinga_inferior.Value;
    //Saco el el TabStop de los grados para que los saltee
    //en los dos tabs (predeterminado y alternativo)
    dbedGradosLatIni.TabStop := False;
    dbedGradosLongIni.TabStop := False;
    dbedGradosLatFin.TabStop := False;
    dbedGradosLongFin.TabStop := False;

    dbedGradosLatIni1.TabStop := False;
    dbedGradosLongIni1.TabStop := False;
    dbedGradosLatFin1.TabStop := False;
    dbedGradosLongFin1.TabStop := False;
  end
  else
  begin
    dbedGradosLatIni.TabStop := True;
    dbedGradosLongIni.TabStop := True;
    dbedGradosLatFin.TabStop := True;
    dbedGradosLongFin.TabStop := True;

    dbedGradosLatIni1.TabStop := True;
    dbedGradosLongIni1.TabStop := True;
    dbedGradosLatFin1.TabStop := True;
    dbedGradosLongFin1.TabStop := True;
  end;
end;

procedure TfmEditarLances.zqPrincipalprofundidadValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 40) or (Sender.AsInteger > 250)) then
  begin
    MessageDlg('Ingrese la profundidad en metros', mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('Profund');
  end;
end;

procedure TfmEditarLances.zqPrincipalrumboValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsInteger < 1) or (Sender.AsInteger > 360)) then
  begin
    MessageDlg('Ingrese el rumbo en grados, de 1 a 360', mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('Rumbo');
  end;
end;

procedure TfmEditarLances.zqPrincipalvelocidadValidate(Sender: TField);
begin
  if (not Sender.IsNull) and ((Sender.AsFloat < 2.5) or (Sender.AsFloat > 5.8)) then
  begin
    MessageDlg('Indique la velocidad promedio de arrastre en nudos',
      mtError, [mbOK], 0);
    FControlesEdicion.SetFocus('Velocidad');
  end;
end;

procedure TfmEditarLances.zqProxLanceBeforeOpen(DataSet: TDataSet);
begin
  zqProxLance.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
end;

end.
