unit datGeneral;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, DB, mysql50conn, mysql55conn, FileUtil, ZConnection,
  ZDataset, ZSqlMonitor, Forms, ActnList, LSConfig, Dialogs, Controls,
  IniPropStorage, frmSplashScreenForm;

type

  { TdmGeneral }

  TdmGeneral = class(TDataModule)
    acDmGeneral: TActionList;
    acEstablecerActiva: TAction;
    dsMareaActiva: TDataSource;
    dsMareas: TDatasource;
    ipsConfig: TIniPropStorage;
    qMareasanio_marea: TLongintField;
    qMareascapitan: TStringField;
    qMareasidbuque: TLongintField;
    qMareasidmarea: TLongintField;
    qMareasmarea_buque: TStringField;
    qMareasnro_marea_inidep: TLongintField;
    qMareasoficial: TStringField;
    zcDB: TZConnection;
    zqMareaActivaanio_marea: TLongintField;
    zqMareaActivabuque: TStringField;
    zqMareaActivacapitan: TStringField;
    zqMareaActivafactor_calc_captura: TLongintField;
    zqMareaActivafecha_arribo: TDateField;
    zqMareaActivafecha_zarpada: TDateField;
    zqMareaActivaidmarea: TLongintField;
    zqMareaActivaMarea: TBytesField;
    zqMareaActivaMareaBuqueStr: TStringField;
    zqMareaActivaMareaStr: TStringField;
    zqMareaActivamarea_buque: TStringField;
    zqMareaActivanro_lance_inicial: TLongintField;
    zqMareaActivanro_marea_inidep: TLongintField;
    zqMareaActivaobservador: TStringField;
    zqMareaActivapuerto_registro: TStringField;
    zqMareaActivatxt_senasa_1: TStringField;
    zqMareaActivatxt_senasa_2: TStringField;
    zqMareaActivatxt_senasa_3: TStringField;
    zqMareaActivatxt_senasa_4: TStringField;
    zqMareaActivatxt_senasa_5: TStringField;
    zqMareas: TZQuery;
    zqMareasanio_marea: TLongintField;
    zqMareasBuque: TStringField;
    zqMareascant_lances: TLargeintField;
    zqMareascant_muestras_biologicas: TLargeintField;
    zqMareascant_muestras_bycatch: TLargeintField;
    zqMareascant_muestras_coccion: TLargeintField;
    zqMareascant_muestras_danio: TLargeintField;
    zqMareascant_muestras_rinde: TLargeintField;
    zqMareascant_muestras_talla: TLargeintField;
    zqMareascapitan: TStringField;
    zqMareasdias_pesca: TLargeintField;
    zqMareasfecha_arribo: TDateField;
    zqMareasfecha_finalizacion: TDateField;
    zqMareasfecha_inicio: TDateField;
    zqMareasfecha_zarpada: TDateField;
    zqMareasidbuque: TLongintField;
    zqMareasidmarea: TLongintField;
    zqMareasMarea: TBytesField;
    zqMareasMareaBuqueStr: TStringField;
    zqMareasMareaStr: TStringField;
    zqMareasmarea_buque: TStringField;
    zqMareasnro_marea_inidep: TLongintField;
    zqMareasoficial: TStringField;
    zqMareaActiva: TZQuery;
    sqlmLog: TZSQLMonitor;
    procedure acEstablecerActivaExecute(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure zqMareaActivaBeforeOpen(DataSet: TDataSet);
    procedure zqMareaActivaCalcFields(DataSet: TDataSet);
    procedure zqMareasAfterApplyUpdates(Sender: TObject);
    procedure zqMareasAfterScroll(DataSet: TDataSet);
    procedure zqMareasCalcFields(DataSet: TDataSet);
  private
    { private declarations }
    FIdMareaActiva: integer;
    function GetDscMareaActiva: string;
    function GetFactorCalcCaptura: double;
    procedure SetIdMareaActiva(AValue: integer);
    procedure InicializarDB;
  public
    property IdMareaActiva: integer read FIdMareaActiva write SetIdMareaActiva;
    property DscMareaActiva: string read GetDscMareaActiva;
    property FactorCalculoCaptura: double read GetFactorCalcCaptura;
    procedure GuardarBooleanConfig(const Clave: String; Valor: Boolean; const Seccion: String='');
    procedure GuardarIntegerConfig(const Clave: String; Valor: LongInt; const Seccion: String='');
    procedure GuardarStringConfig(const Clave: String; Valor: String; const Seccion: String='');
    function LeerBooleanConfig(const Clave: String; ValorPredeterminado: Boolean; const Seccion: String=''): Boolean;
    function LeerIntegerConfig(const Clave: String; ValorPredeterminado: LongInt; const Seccion: String=''): LongInt;
    function LeerStringConfig(const Clave: String; ValorPredeterminado: String; const Seccion: String=''): String;
    procedure AccionesPostRestauracion;
  end;

const
  APP_VERSION='1.12.1';

var
  dmGeneral: TdmGeneral;

implementation

{$R *.lfm}

{ TdmGeneral }

procedure TdmGeneral.DataModuleCreate(Sender: TObject);
var
  tmp_MareaActiva: integer;
  lib_standard, lib_embedded: string;
  servidor_local: string;
begin

  //Inicializo archivo de configuraciones
  if not DirectoryExistsUTF8(GetAppConfigDir(False)) then
     CreateDirUTF8(GetAppConfigDir(False));
  ipsConfig.IniFileName:=GetAppConfigDir(False)+ExtractFileNameOnly(Application.ExeName)+'.conf';
  ipsConfig.IniSection:='General';

  zcDB.Connected := False;
  {$IFDEF MSWINDOWS}
  lib_standard := ExtractFilePath(Application.ExeName) + 'libmysql.dll';
  lib_embedded := ExtractFilePath(Application.ExeName) + 'libmysqld.dll';
  if DirectoryExistsUTF8(GetAppConfigDir(False) + DirectorySeparator + 'DB_Vieira') then
    sqlmLog.FileName := GetAppConfigDir(False) + DirectorySeparator +
      'DB_Vieira' + DirectorySeparator + 'VieiraOBS_log.txt'
  else
    sqlmLog.FileName := ExtractFilePath(Application.ExeName) + 'VieiraOBS_log.txt';
  {$ENDIF}
  {$IFDEF UNIX}
  lib_standard := ExtractFilePath(Application.ExeName) + 'libmysqlclient.so.18.0.0';
  sqlmLog.FileName := ExtractFilePath(Application.ExeName) + 'VieiraOBS_log.txt';
  {$ENDIF}
  sqlmLog.Active:=True;
  try
    SetSplashScreenStatus('Conectando a la base de datos...');
    zcDB.LibraryLocation := lib_standard;
    zcDB.Connected := True;
  except
    {$IFDEF MSWINDOWS}
    try
      zcDB.Connected := False;
      //No se pudo conectar con el servidor, intento abrir en modo "embedded"
      //Primero en la carpeta actual, y si no en LocalData
      SetSplashScreenStatus('Iniciando base de datos local...');
      //Lo siguiente es sólo para windows:
      servidor_local:='';
      if DirectoryExistsUTF8(ExtractFilePath(Application.ExeName) + 'DB_Vieira' +
        DirectorySeparator + 'server') then
      begin
        servidor_local := StringReplace(ExtractFilePath(Application.ExeName) + 'DB_Vieira' +
          DirectorySeparator + 'server' + DirectorySeparator, DirectorySeparator, '/', [rfReplaceAll]);
      end
      else if DirectoryExistsUTF8(GetAppConfigDir(False) + 'DB_Vieira' +
        DirectorySeparator + 'server') then
      begin
        servidor_local := StringReplace(GetAppConfigDir(False) + 'DB_Vieira' +
          DirectorySeparator + 'server' + DirectorySeparator, DirectorySeparator, '/', [rfReplaceAll]);
      end;

      if servidor_local='' then
      begin
        MessageDlg(
          'No se encuentra la carpeta de instalación de la base de datos. Informe de este error al desarrollador de la aplicación, o pruebe reainstalando la misma (perderá todos los datos cargados!!!)', mtError, [mbClose], 0);
        exit;
      end;

      zcDB.Properties.Add('ServerArgument1=--basedir=' + servidor_local);
      zcDB.Properties.Add('ServerArgument2=--datadir=' + servidor_local + 'data');
      zcDB.Properties.Add('ServerArgument3=--character-sets-dir=' +
        servidor_local + 'share/charsets');
      zcDB.Properties.Add('ServerArgument4=--language=' + servidor_local + 'share/spanish');
      zcDB.Properties.Add('ServerArgument5=--lc-messages-dir=' + servidor_local + 'share');
      zcDB.Properties.Add('ServerArgument6=--lc-messages=es_AR');
      zcDB.Properties.Add('ServerArgument7=--lc-time-names=es_AR');
      zcDB.Properties.Add('ServerArgument8=--basedir=' + servidor_local);
      zcDB.Properties.Add('ServerArgument9=--key_buffer_size=32M');

      zcDB.LibraryLocation := lib_embedded;
      zcDB.Protocol := 'mysqld-5';
      zcDB.Connected := True;
    except
      MessageDlg(
        'No se puede conectar con la base de datos. Informe de este error al desarrollador de la aplicación, o pruebe reainstalando la misma (perderá todos los datos cargados!!!)', mtError, [mbClose], 0);
      Application.MainForm.Close;
    end;
    {$ENDIF}
    {$IFDEF UNIX}
    MessageDlg(
      'No se puede conectar con la base de datos. Informe de este error al desarrollador de la aplicación, o pruebe reainstalando la misma (perderá todos los datos cargados!!!)', mtError, [mbClose], 0);
    Application.MainForm.Close;
    {$ENDIF}
  end;
  SetSplashScreenStatus('Estableciendo marea activa...');

  zqMareas.Close;
  zqMareas.Open;

  tmp_MareaActiva:=LeerIntegerConfig('idMareaActiva', -1);
//  LSLoadConfig(['idMareaActiva'], [tmp_MareaActiva], [@tmp_MareaActiva]);
  if tmp_MareaActiva > 0 then
  begin
    IdMareaActiva := tmp_MareaActiva;
    zqMareaActiva.Close;
    zqMareaActiva.Open;
    //    if zqMareas.Locate('idmarea',tmp_MareaActiva, []) then
    if (zqMareaActiva.RecordCount = 1) and
      (zqMareas.Locate('idmarea', tmp_MareaActiva, [])) then
    begin
      acEstablecerActiva.Enabled := False;
      IdMareaActiva := tmp_MareaActiva;
    end
    else
    begin
      MessageDlg(
        'No se ha seleccionado una marea para registrar los datos. Por favor seleccione una marea existente y establézcala como activa, o cree una nueva marea.', mtWarning, [mbClose], 0);
      acEstablecerActiva.Enabled := True;
      IdMareaActiva := -1;
    end;
  end
  else
  begin
    MessageDlg(
      'No se ha seleccionado una marea para registrar los datos. Por favor seleccione una marea existente y establézcala como activa, o cree una nueva marea.', mtWarning, [mbClose], 0);
    acEstablecerActiva.Enabled := True;
    IdMareaActiva := -1;
  end;
  SetSplashScreenStatus('Iniciando aplicación...');
end;


procedure TdmGeneral.zqMareaActivaBeforeOpen(DataSet: TDataSet);
begin
  zqMareaActiva.ParamByName('idmarea').Value := FIdMareaActiva;
end;

procedure TdmGeneral.zqMareaActivaCalcFields(DataSet: TDataSet);
begin
  if not zqMareaActivaMarea.IsNull then
  begin
     zqMareaActivaMareaStr.AsString:=zqMareaActivaMarea.AsString;
     zqMareaActivaMareaBuqueStr.AsString:='B/P '+zqMareaActivabuque.AsString+' - Marea '+zqMareaActivamarea_buque.AsString;
  end;
end;

procedure TdmGeneral.zqMareasAfterApplyUpdates(Sender: TObject);
begin
end;

procedure TdmGeneral.zqMareasAfterScroll(DataSet: TDataSet);
begin
  zqMareaActiva.Close;
  zqMareaActiva.Open;
  acEstablecerActiva.Enabled := (zqMareas.RecordCount>0) and (IdMareaActiva <> zqMareasidmarea.Value);
end;

procedure TdmGeneral.zqMareasCalcFields(DataSet: TDataSet);
begin
  if not zqMareasMarea.IsNull then
  begin
    zqMareasMareaStr.AsString:=zqMareasMarea.AsString;
  end;
end;

procedure TdmGeneral.acEstablecerActivaExecute(Sender: TObject);
var
  msg: string;
begin
  msg := '¿Desea activar la marea: ' + zqMareasMareaStr.AsString + '?';
  if MessageDlg(msg, mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    IdMareaActiva := zqMareasidmarea.Value;
    acEstablecerActiva.Enabled := False;
  end;
end;

function TdmGeneral.GetDscMareaActiva: string;
begin
  if (zqMareaActiva.RecordCount=1) and (zqMareaActivaMarea.AsString <> '') then
    Result := zqMareaActivaMarea.AsString
  else
    Result := '<Ninguna>';
end;

function TdmGeneral.GetFactorCalcCaptura: double;
begin
  if zqMareaActivafactor_calc_captura.AsFloat <> 0 then
    Result := zqMareaActivafactor_calc_captura.AsFloat
  else
    Result := 0;
end;

procedure TdmGeneral.SetIdMareaActiva(AValue: integer);
begin
  if FIdMareaActiva = AValue then
    Exit;
  FIdMareaActiva := AValue;
  GuardarIntegerConfig('idMareaActiva', FIdMareaActiva);
  //  LSSaveConfig(['idMareaActiva'], [FIdMareaActiva]);
  if zqMareaActiva.Active then
    zqMareaActiva.Close;
  zqMareaActiva.Open;
end;

procedure TdmGeneral.InicializarDB;
begin
//  zcDB.ExecuteDirect('SET lc_time_names = '''es_AR'''');
end;

procedure TdmGeneral.GuardarBooleanConfig(const Clave: String; Valor: Boolean;
  const Seccion: String);
var
  OldSection: string;
begin
  if Trim(Clave)='' then
  begin
    MessageDlg(
      'No se indicó la identificación (clave) del valor a guardar', mtError, [mbClose], 0);
  end else
  begin
    OldSection:=ipsConfig.IniSection;
    if Trim(Seccion)<>'' then
       ipsConfig.IniSection:=Seccion;
    ipsConfig.WriteBoolean(Clave, Valor);
    ipsConfig.IniSection:=OldSection;
  end;
end;

procedure TdmGeneral.GuardarIntegerConfig(const Clave: String; Valor: LongInt;
  const Seccion: String);
var
  OldSection: string;
begin
  if Trim(Clave)='' then
  begin
    MessageDlg(
      'No se indicó la identificación (clave) del valor a guardar', mtError, [mbClose], 0);
  end else
  begin
    OldSection:=ipsConfig.IniSection;
    if Trim(Seccion)<>'' then
       ipsConfig.IniSection:=Seccion;
    ipsConfig.WriteInteger(Clave, Valor);
    ipsConfig.IniSection:=OldSection;
  end;
end;

procedure TdmGeneral.GuardarStringConfig(const Clave: String; Valor: String;
  const Seccion: String);
var
  OldSection: string;
begin
  if Trim(Clave)='' then
  begin
    MessageDlg(
      'No se indicó la identificación (clave) del valor a guardar', mtError, [mbClose], 0);
  end else
  begin
    OldSection:=ipsConfig.IniSection;
    if Trim(Seccion)<>'' then
       ipsConfig.IniSection:=Seccion;
    ipsConfig.WriteString(Clave, Valor);
    ipsConfig.IniSection:=OldSection;
  end;
end;

function TdmGeneral.LeerBooleanConfig(const Clave: String;
  ValorPredeterminado: Boolean; const Seccion: String): Boolean;
var
  OldSection: string;
  Resultado: Boolean;
begin
  Resultado:=ValorPredeterminado;
  if Trim(Clave)='' then
  begin
    MessageDlg(
      'No se indicó la identificación (clave) del valor a recuperar', mtError, [mbClose], 0);
  end else
  begin
    OldSection:=ipsConfig.IniSection;
    if Trim(Seccion)<>'' then
       ipsConfig.IniSection:=Seccion;
    Resultado:=ipsConfig.ReadBoolean(Clave, ValorPredeterminado);
    ipsConfig.IniSection:=OldSection;
    Result:=Resultado;
  end;
end;

function TdmGeneral.LeerIntegerConfig(const Clave: String;
  ValorPredeterminado: LongInt; const Seccion: String): LongInt;
var
  OldSection: string;
  Resultado: LongInt;
begin
  Resultado:=ValorPredeterminado;
  if Trim(Clave)='' then
  begin
    MessageDlg(
      'No se indicó la identificación (clave) del valor a recuperar', mtError, [mbClose], 0);
  end else
  begin
    OldSection:=ipsConfig.IniSection;
    if Trim(Seccion)<>'' then
       ipsConfig.IniSection:=Seccion;
    Resultado:=ipsConfig.ReadInteger(Clave, ValorPredeterminado);
    ipsConfig.IniSection:=OldSection;
    Result:=Resultado;
  end;
end;

function TdmGeneral.LeerStringConfig(const Clave: String;
  ValorPredeterminado: String; const Seccion: String): String;
var
  OldSection: string;
  Resultado: String;
begin
  Resultado:=ValorPredeterminado;
  if Trim(Clave)='' then
  begin
    MessageDlg(
      'No se indicó la identificación (clave) del valor a recuperar', mtError, [mbClose], 0);
  end else
  begin
    OldSection:=ipsConfig.IniSection;
    if Trim(Seccion)<>'' then
       ipsConfig.IniSection:=Seccion;
    Resultado:=ipsConfig.ReadString(Clave, ValorPredeterminado);
    ipsConfig.IniSection:=OldSection;
    Result:=Resultado;
  end;
end;

procedure TdmGeneral.AccionesPostRestauracion;
begin
  // Ejecutar acá cualquier acción a realizar luego de restaurar una copia de seguridad

end;

end.
