unit frmbackup;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, UTF8Process, AbZipper, AbBrowse, Forms, Controls,
  Graphics, Dialogs, StdCtrls, EditBtn, Buttons, ActnList, ComCtrls, LSConfig,
  datGeneral, db, sqldb, sqldblib, mysql56conn, ZSqlMetadata,
  ZDataset, ExSystemUtils, process, LCLIntf, ExtCtrls, AbArcTyp, AbUnzper, math;

type

  { TfmBackup }

  TfmBackup = class(TForm)
    auzBackup: TAbUnZipper;
    acRestaurar: TAction;
    azBackup: TAbZipper;
    acBackup: TAction;
    alBackup: TActionList;
    bbEjecutar: TBitBtn;
    ckIncluirAplicacion: TCheckBox;
    ckRestaurarEstructura: TCheckBox;
    ckRestaurarDatos: TCheckBox;
    ckCopiaTXT: TCheckBox;
    ckEstructura: TCheckBox;
    ckDatos: TCheckBox;
    conRestaurar: TMySQL56Connection;
    dedCarpetaArchivo: TDirectoryEdit;
    edArchivoSQL: TEdit;
    gbDestino: TGroupBox;
    gbDestino1: TGroupBox;
    GroupBox1: TGroupBox;
    gbOpcRestauracion: TGroupBox;
    ilBackup: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    laVistaPreliminar: TLabel;
    meSQL: TMemo;
    odRestaurar: TOpenDialog;
    paEncabezado: TPanel;
    paMensajeEspera: TPanel;
    Panel1: TPanel;
    pcBackup: TPageControl;
    paProceso: TPanel;
    prBackup: TProcessUTF8;
    pbProceso: TProgressBar;
    sbCargarArchivo: TSpeedButton;
    scRestaurar: TSQLScript;
    dblRestaurar: TSQLDBLibraryLoader;
    trRestaurar: TSQLTransaction;
    tsRestaurar: TTabSheet;
    tsBackup: TTabSheet;
    zqGetCreate: TZQuery;
    zqRutinasroutine_definition: TMemoField;
    zqRutinasroutine_name: TStringField;
    zqRutinasroutine_type: TStringField;
    zqTablasYVistas: TZQuery;
    zqCampos: TZQuery;
    zqDatosTabla: TZQuery;
    zqRutinas: TZQuery;
    zqDefRutina: TZQuery;
    zqTriggers: TZQuery;
    procedure acBackupExecute(Sender: TObject);
    procedure acRestaurarExecute(Sender: TObject);
    procedure ckDatosChange(Sender: TObject);
    procedure ckEstructuraChange(Sender: TObject);
    procedure ckRestaurarDatosChange(Sender: TObject);
    procedure ckRestaurarEstructuraChange(Sender: TObject);
    procedure dedCarpetaArchivo1AcceptFileName(Sender: TObject;
      var Value: String);
    procedure dedCarpetaArchivoAcceptDirectory(Sender: TObject;
      var Value: String);
    procedure dedCarpetaArchivoChange(Sender: TObject);
    procedure dedCarpetaArchivoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pcBackupChange(Sender: TObject);
    procedure sbCargarArchivoClick(Sender: TObject);
    function EjecutarRestauracion(proc_tablas, proc_datos, proc_rutinas:Boolean): Boolean;
    procedure zqRutinasBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
    Procedure HabilitarAcciones;
    procedure ExportarDB_SQL(archivo_tablas, archivo_datos, archivo_rutinas: string);
    procedure ExportarDB_TXT(carpeta: string);
    procedure ExportarDB_Global(archivo_datos: string);
    function SentenciaCreateTable(tabla:string):string;
    function SentenciaCreateView(vista:string):string;
    function SentenciaInsert(tabla:string; PrefijoTabla: string=''; FiltroMarea: string=''):string;
    function FormatField(f: TField):string;
    function CrearEstructuraVista(vista:string):string;
    procedure CrearTablasYDatos(var str_sql_tablas, str_sql_datos: TStringList; crear_estructura:Boolean=True;incluir_datos:Boolean=True);
    procedure CrearEncabezadoTablas(var str_sql: TStringList);
    procedure CrearPieTablas(var str_sql: TStringList);
    procedure GenerarEstructuraVistas(var str_sql: TStringList);
    procedure CrearRutinas(var str_sql: TStringList);
    procedure CrearTriggers(var str_sql: TStringList);
    procedure CrearVistasReales(var str_sql: TStringList);
    procedure CrearEncabezadoRutinas(var str_sql: TStringList);
    procedure CrearPieRutinas(var str_sql: TStringList);
    procedure CrearDatosDBGlobal(var str_sql: TStringList);
  public
    { public declarations }
  end;

const
    NEWLINE=#13#10;
    PREFIJO_BKP='BKP_DB_VIEIRA_';
    CARPETA_TEMP='VieiraOBS';
    CADENA_TABLAS='TABLAS';
    CADENA_DATOS='DATOS';
    CADENA_RUTINAS='RUTINAS';
    EXTENSION_ARCH_BACKUP='.obk';
    INSERT_SIMPLE=0;
    INSERT_MULTIPLE=1;
    GEN_DATOS_GLOB=False;


     SET_VAR_ENCABEZADO=
{                '-- -----------------------------------------------------'+NEWLINE+
                '-- Esquema <ESQUEMA>'+NEWLINE+
                '-- -----------------------------------------------------'+NEWLINE+
                ''+NEWLINE+
                'CREATE SCHEMA IF NOT EXISTS `<ESQUEMA>` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;'+NEWLINE+
                ''+NEWLINE+
                'USE `<ESQUEMA>` ;'+NEWLINE+
                ''+NEWLINE+
                ''+NEWLINE+
}                'SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT ;'+NEWLINE+
                 'SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS ;'+NEWLINE+
                 'SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION ;'+NEWLINE+
                 'SET NAMES utf8 ;'+NEWLINE+
                 'SET @OLD_TIME_ZONE=@@TIME_ZONE ;'+NEWLINE+
                 'SET TIME_ZONE=''+00:00'' ;'+NEWLINE+
                 'SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 ;'+NEWLINE+
                 'SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 ;'+NEWLINE+
                 'SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' ;'+NEWLINE+
                 'SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 ;'+NEWLINE;

      SET_VAR_PIE=
                 'SET TIME_ZONE=@OLD_TIME_ZONE ;'+NEWLINE+
                 'SET SQL_MODE=@OLD_SQL_MODE ;'+NEWLINE+
                 'SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS ;'+NEWLINE+
                 'SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS ;'+NEWLINE+
                 'SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT ;'+NEWLINE+
                 'SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS ;'+NEWLINE+
                 'SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION ;'+NEWLINE+
                 'SET SQL_NOTES=@OLD_SQL_NOTES ;'+NEWLINE;

      CREATE_TABLE_TEMPLATE=
                 '--'+NEWLINE+
                 '-- Estructura de la tabla `<TABLA>`'+NEWLINE+
                 '--'+NEWLINE+
                 ''+NEWLINE+
                 'DROP TABLE IF EXISTS `<TABLA>`;'+NEWLINE+
                 'SET @saved_cs_client     = @@character_set_client ;'+NEWLINE+
                 'SET character_set_client = utf8 ;'+NEWLINE+
                 '<SENTENCIA_CREATE_TABLE>;'+NEWLINE+
                 'SET character_set_client = @saved_cs_client ;'+NEWLINE;

      //Se utiliza la sentencia REPLACE en lugar de INSERT, así, si se ejecuta
      //varias veces no da error de registros duplicados, sino que se reemplazan
      //los existentes y se agregan los nuevos
      INSERT_SINGLE_TEMPLATE=
                 '--'+NEWLINE+
                 '-- Volcado de datos de la tabla `<TABLA>`'+NEWLINE+
                 '--'+NEWLINE+
                 ''+NEWLINE+
                 'LOCK TABLES `<TABLA>` WRITE;'+NEWLINE+
                 'ALTER TABLE `<TABLA>` DISABLE KEYS ;'+NEWLINE+
                 '<SENTENCIAS_INSERT>;'+NEWLINE+
                 'ALTER TABLE `<TABLA>` ENABLE KEYS ;'+NEWLINE+
                 'UNLOCK TABLES;'+NEWLINE;

      INSERT_SINGLE_LINE_TEMPLATE=
                 'REPLACE INTO `<TABLA>` (<CAMPOS>) VALUES <INSERT_VALUES>;'+NEWLINE;

      INSERT_MULTI_TEMPLATE=
                 '--'+NEWLINE+
                 '-- Volcado de datos de la tabla `<TABLA>`'+NEWLINE+
                 '--'+NEWLINE+
                 ''+NEWLINE+
                 'LOCK TABLES `<TABLA>` WRITE;'+NEWLINE+
                 'ALTER TABLE `<TABLA>` DISABLE KEYS ;'+NEWLINE+
                 'REPLACE INTO `<TABLA>` (<CAMPOS>) VALUES <INSERT_VALUES>;'+NEWLINE+
                 'ALTER TABLE `<TABLA>` ENABLE KEYS ;'+NEWLINE+
                 'UNLOCK TABLES;'+NEWLINE;

      //Por compatibilidad con la ejecución del script en Lazarus, se utiliza el
      //mismo delimitador que en las funciones y stored procedures
      CREATE_VIEW_STRUCTURE_TEMPLATE=
                 '--'+NEWLINE+
                 '-- Estructura temporaria para vista `<VISTA>`'+NEWLINE+
                 '--'+NEWLINE+
                 ''+NEWLINE+
                 'DELIMITER $$'+NEWLINE+
                 'DROP TABLE IF EXISTS `<VISTA>` $$'+NEWLINE+
                 'DROP VIEW IF EXISTS `<VISTA>` $$'+NEWLINE+
                 'SET @saved_cs_client     = @@character_set_client $$'+NEWLINE+
                 'SET character_set_client = utf8 $$'+NEWLINE+
                 'CREATE VIEW `<VISTA>` AS SELECT <VIEW_FIELDS> $$'+NEWLINE+
                 'SET character_set_client = @saved_cs_client $$'+NEWLINE+
                 'DELIMITER ;'+NEWLINE;

      CREATE_VIEW_TEMPLATE=
                 '--'+NEWLINE+
                 '-- Estructura final para la vista `<VISTA>`'+NEWLINE+
                 '--'+NEWLINE+
                 ''+NEWLINE+
                 'DELIMITER $$'+NEWLINE+
                 'DROP VIEW IF EXISTS `<VISTA>` $$'+NEWLINE+
                 'SET @saved_cs_client          = @@character_set_client $$'+NEWLINE+
                 'SET @saved_cs_results         = @@character_set_results $$'+NEWLINE+
                 'SET @saved_col_connection     = @@collation_connection $$'+NEWLINE+
                 'SET character_set_client      = utf8 $$'+NEWLINE+
                 'SET character_set_results     = utf8 $$'+NEWLINE+
                 'SET collation_connection      = utf8_general_ci $$'+NEWLINE+
                 '<SENTENCIA_CREATE_VIEW> $$'+NEWLINE+
                 'SET character_set_client      = @saved_cs_client $$'+NEWLINE+
                 'SET character_set_results     = @saved_cs_results $$'+NEWLINE+
                 'SET collation_connection      = @saved_col_connection $$'+NEWLINE+
                 'DELIMITER ;'+NEWLINE;

      CREATE_TRIGGER_TEMPLATE=
                 'DELIMITER $$'+NEWLINE+
                 'DROP TRIGGER IF EXISTS <TRIGGER> $$'+NEWLINE+
                 ''+NEWLINE+
                 '<SENTENCIA_CREATE_TRIGGER> $$'+NEWLINE+
                 'DELIMITER ;'+NEWLINE;

var
  fmBackup: TfmBackup;
  sl_tablas, sl_datos, sl_rutinas, sl_expglob: TStringList;

implementation

{$R *.lfm}

{ TfmBackup }

procedure TfmBackup.dedCarpetaArchivoAcceptDirectory(Sender: TObject;
  var Value: String);
begin
  LSSaveConfig(['destino_backup'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TfmBackup.acBackupExecute(Sender: TObject);
var
  temp_dir: string;
  str_fecha: string;
  nombre_base, archivo_backup_tablas, archivo_backup_datos, archivo_backup_rutinas, archivo_zip, archivo_txt, tabla, archivo_expglob: string;
begin

    temp_dir:=GetTempDir;
    if not DirectoryExistsUTF8(temp_dir+DirectorySeparator+CARPETA_TEMP) then
       CreateDirUTF8(temp_dir+DirectorySeparator+CARPETA_TEMP);
    temp_dir:=temp_dir+DirectorySeparator+CARPETA_TEMP;

    str_fecha:=FormatDateTime('yyyy-mm-dd-hhmm', Now);
    nombre_base:=temp_dir+DirectorySeparator+PREFIJO_BKP;
    archivo_backup_tablas:=nombre_base+CADENA_TABLAS+EXTENSION_ARCH_BACKUP;
    archivo_backup_datos:=nombre_base+CADENA_DATOS+EXTENSION_ARCH_BACKUP;
    archivo_backup_rutinas:=nombre_base+CADENA_RUTINAS+EXTENSION_ARCH_BACKUP;
    //Armo el nombre del archivo destino con año y número de marea
    archivo_expglob := temp_dir + DirectorySeparator
      + dmGeneral.zqMareaActivamarea_buque.AsString + '.expg';

    paProceso.Visible:=True;

    //Generar archivos SQL
    ExportarDB_SQL(archivo_backup_tablas, archivo_backup_datos, archivo_backup_rutinas);

    //Generar archivos para importar en DB global
    if (GEN_DATOS_GLOB=True) and (ckDatos.Checked) then
    begin
         ExportarDB_Global(archivo_expglob);
    end;

    if ckCopiaTXT.Checked then
    begin
      //Generar archivos TXT
      ExportarDB_TXT(temp_dir);
    end;
    paProceso.Visible:=False;

    //Comprimir en ZIP
    if FileExistsUTF8(archivo_backup_tablas) or FileExistsUTF8(archivo_backup_datos) then
    begin
      archivo_zip:=dedCarpetaArchivo.Directory+DirectorySeparator+PREFIJO_BKP+str_fecha+'.zip';
      if FileExistsUTF8(archivo_zip) then
         DeleteFileUTF8(archivo_zip);
      azBackup.BaseDirectory:=dedCarpetaArchivo.Directory;
      azBackup.FileName:=archivo_zip;

      //Agego los archivos de script
      if FileExistsUTF8(archivo_backup_tablas) then
         azBackup.AddFiles(archivo_backup_tablas,0);
      if FileExistsUTF8(archivo_backup_datos) then
         azBackup.AddFiles(archivo_backup_datos,0);
      if FileExistsUTF8(archivo_backup_rutinas) then
         azBackup.AddFiles(archivo_backup_rutinas,0);
      if FileExistsUTF8(archivo_expglob) then
         azBackup.AddFiles(archivo_expglob,0);

      //Borro los archivos porque ya no se necesitan
      if FileExistsUTF8(archivo_backup_tablas) then
         DeleteFileUTF8(archivo_backup_tablas);
      if FileExistsUTF8(archivo_backup_datos) then
         DeleteFileUTF8(archivo_backup_datos);
      if FileExistsUTF8(archivo_backup_rutinas) then
         DeleteFileUTF8(archivo_backup_rutinas);
      if FileExistsUTF8(archivo_expglob) then
         DeleteFileUTF8(archivo_expglob);

      if ckCopiaTXT.Checked then
      begin
        //Agrego los TXT. Busco cada una de las tablas del sistema
        zqTablasYVistas.Close;
        zqTablasYVistas.ParamByName('tipo').Value:='BASE TABLE';
        zqTablasYVistas.Open;

        with zqTablasYVistas do
        begin
          First;
          while not EOF do
          begin
            tabla:=zqTablasYVistas.FieldByName('Tables_in_'+dmGeneral.zcDB.Database).AsString;
            archivo_txt:=temp_dir+DirectorySeparator+tabla+'.txt';
            if FileExistsUTF8(archivo_txt) then
            begin
              //A medida que se van agregando al zip, se borran los originales
               azBackup.AddFiles(archivo_txt,0);
               DeleteFileUTF8(archivo_txt);
            end;
            Next;
          end;
        end;
      end;

      //Incluyo el ejecutable si así se indicó
      if ckIncluirAplicacion.Checked then
      begin
        azBackup.AddFiles(Application.ExeName,0);
      end;

      azBackup.CloseArchive;

      if MessageDlg('La copia de seguridad ha sido guardada en la carpeta indicada. ¿Desea abrir esta carpeta?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      begin
           OpenDocument(dedCarpetaArchivo.Directory);
      end;
      Close;
    end else
    begin
      MessageDlg('Ocurrió un error al realizar la copia de seguridad', mtError, [mbOK],0);
    end;

end;

procedure TfmBackup.acRestaurarExecute(Sender: TObject);
var
  str_confirm: string;
  proc_tablas, proc_datos, proc_rutinas: Boolean;
begin
    if MessageDlg('ATENCIÓN!!!','La restauración de una copia de seguridad es una operación que destruye toda la información actual registrada en la aplicación, y la reemplaza por los datos contenidos en la copia de seguridad. ¿Está seguro de que desea perder los datos actuales?', mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
    begin
         //
      if InputQuery('Confirmación de proceso', 'Escriba la siguiente frase: "Voy a perder mis datos actuales"', str_confirm) = True then
      begin
        if LowerCase(str_confirm)=LowerCase('Voy a perder mis datos actuales') then
        begin
          //Se inicia la restauración
          proc_tablas:=ckRestaurarEstructura.Checked and Assigned(sl_tablas) and (sl_tablas.Count>0);
          proc_datos:=ckRestaurarDatos.Checked and Assigned(sl_datos) and (sl_datos.Count>0);
          proc_rutinas:=ckRestaurarEstructura.Checked and Assigned(sl_rutinas) and (sl_rutinas.Count>0);

          if EjecutarRestauracion (proc_tablas, proc_datos, proc_rutinas) then
          begin
             MessageDlg('El proceso de restauración ha finalizado.', mtInformation, [mbOK],0);
             Close;
          end;
        end else
        begin
          MessageDlg('La frase de confirmación es incorrecta. La restauración se ha cancelado.', mtError, [mbOK],0);
        end;
      end else
      begin
        MessageDlg('Usted ha decidido no continuar. La restauración se ha cancelado.', mtConfirmation, [mbOK],0);
      end;

    end;
end;

procedure TfmBackup.ckDatosChange(Sender: TObject);
begin
  ckCopiaTXT.Enabled:=ckDatos.Checked;
  if ckDatos.Checked=False then
     ckCopiaTXT.Checked:=False;
  HabilitarAcciones;
end;

procedure TfmBackup.ckEstructuraChange(Sender: TObject);
begin
    HabilitarAcciones;
end;

procedure TfmBackup.ckRestaurarDatosChange(Sender: TObject);
begin
    HabilitarAcciones;
end;

procedure TfmBackup.ckRestaurarEstructuraChange(Sender: TObject);
begin
    HabilitarAcciones;
end;

procedure TfmBackup.dedCarpetaArchivo1AcceptFileName(Sender: TObject;
  var Value: String);
begin
end;

procedure TfmBackup.dedCarpetaArchivoChange(Sender: TObject);
begin
  LSSaveConfig(['destino_backup'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TfmBackup.dedCarpetaArchivoExit(Sender: TObject);
begin
  LSSaveConfig(['destino_backup'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TfmBackup.FormCreate(Sender: TObject);
begin
  inherited;
end;

procedure TfmBackup.FormDestroy(Sender: TObject);
begin
   sl_tablas.Free;
   sl_datos.Free;
   sl_rutinas.Free;
   sl_expglob.Free;
end;

procedure TfmBackup.FormShow(Sender: TObject);
var
  destino:String;
begin
  if not Assigned(sl_tablas) then
     sl_tablas:=TStringList.Create;
  if not Assigned(sl_datos) then
     sl_datos:=TStringList.Create;
  if not Assigned(sl_rutinas) then
     sl_rutinas:=TStringList.Create;
  if not Assigned(sl_expglob) then
     sl_expglob:=TStringList.Create;

    LSLoadConfig(['destino_backup'],[destino],[@destino]);
  if destino='' then
  begin
     destino:=ExtractFilePath(Application.ExeName) + 'backup';
     if not DirectoryExistsUTF8(destino) then
        CreateDirUTF8(destino);
  end;
  dedCarpetaArchivo.Directory := destino;
  pcBackup.ActivePage:=tsBackup;
  odRestaurar.Filter:='Archivos de copia de seguridad|'+PREFIJO_BKP+'*.zip';
  HabilitarAcciones;
end;

procedure TfmBackup.pcBackupChange(Sender: TObject);
begin
  if pcBackup.ActivePage=tsBackup then
     bbEjecutar.Action:=acBackup
  else
     bbEjecutar.Action:=acRestaurar;
end;

procedure TfmBackup.sbCargarArchivoClick(Sender: TObject);
var
  i:Integer;
  temp_dir: string;
  script_tablas, script_datos, script_rutinas:string;
  version_script, msg_version:string;
begin
  odRestaurar.InitialDir:=dedCarpetaArchivo.Directory;
  if odRestaurar.Execute then
  begin
    edArchivoSQL.Text:=odRestaurar.FileName;
    HabilitarAcciones;

    //Para verificar que sea un archivo de copia de seguridad aceptable,
    //Extraigo los archivos, verifico que exista alguno de los 2 SQLS de tablas(.obk), y que la
    //cabecera sea correcta
    temp_dir:=GetTempDir;
     if not DirectoryExistsUTF8(temp_dir+DirectorySeparator+CARPETA_TEMP) then
        CreateDirUTF8(temp_dir+DirectorySeparator+CARPETA_TEMP);
     temp_dir:=temp_dir+DirectorySeparator+CARPETA_TEMP;

     auzBackup.BaseDirectory:=temp_dir;
    auzBackup.FileName:=odRestaurar.FileName;
    auzBackup.ExtractFiles('*'+EXTENSION_ARCH_BACKUP);

    script_tablas:=temp_dir+DirectorySeparator+PREFIJO_BKP+CADENA_TABLAS+EXTENSION_ARCH_BACKUP;
    script_datos:=temp_dir+DirectorySeparator+PREFIJO_BKP+CADENA_DATOS+EXTENSION_ARCH_BACKUP;
    script_rutinas:=temp_dir+DirectorySeparator+PREFIJO_BKP+CADENA_RUTINAS+EXTENSION_ARCH_BACKUP;

    if FileExistsUTF8(script_tablas) or FileExistsUTF8(script_datos) or FileExistsUTF8(script_rutinas) then
    begin
      //Se oculta el memo para acelerar la carga del texto
      meSQL.Visible:=False;

      if FileExistsUTF8(script_tablas) then
      begin
        sl_tablas.LoadFromFile(script_tablas);
        meSQL.Text:=sl_tablas.Text;
      end;
      if FileExistsUTF8(script_datos) then
      begin
        sl_datos.LoadFromFile(script_datos);
        if meSQL.Lines.Count=0 then
          meSQL.Text:=sl_datos.Text;
      end;
      if FileExistsUTF8(script_rutinas) then
      begin
        sl_rutinas.LoadFromFile(script_rutinas);
        if meSQL.Lines.Count=0 then
          meSQL.Text:=sl_rutinas.Text;
      end;

      meSQL.SelStart:=0;
      meSQL.Visible:=True;

      //Intento obtener el número de version de la aplicación
      if (sl_tablas.Count>5) and(LeftStr(sl_tablas[3],10)='-- Version') then
      begin
        version_script:=Copy(sl_tablas[3],12,5);
      end else
      if (sl_datos.Count>5) and(LeftStr(sl_datos[3],10)='-- Version') then
      begin
        version_script:=Copy(sl_datos[3],12,5);
      end else
      begin
        version_script:='';
      end;

      //Leo sólo uno de los archivos para verificar
      if ((sl_tablas.Count>5) and((sl_tablas[0] <> '-- ---------------------------------------------')
         or (sl_tablas[1] <> '-- Tablas y datos de la base de datos "'+dmGeneral.zcDB.Database+'"')
         or (sl_tablas[2] <> '-- Generado desde la aplicación "'+ApplicationName+'"'))) or
      ((sl_datos.Count>5) and((sl_datos[0] <> '-- ---------------------------------------------')
         or (sl_datos[1] <> '-- Tablas y datos de la base de datos "'+dmGeneral.zcDB.Database+'"')
         or (sl_datos[2] <> '-- Generado desde la aplicación "'+ApplicationName+'"'))) then
      begin
        if MessageDlg('Advertencia','El archivo seleccionado no parece ser una copia de seguridad generada por esta aplicación. Pueden generarse daños en los datos, perderse toda la información registrada, o inutilizar totalmente esta aplicación. ¿Está seguro de que desea utilizar este archivo?', mtWarning, [mbYes, mbNo],0, mbNo) = mrNo then
        begin
          meSQL.Clear;
          edArchivoSQL.Text:='';
          sl_tablas.Clear;
          sl_datos.Clear;
          sl_rutinas.Clear;
          sl_expglob.Clear;
          HabilitarAcciones;
        end;
      end;

      if version_script<>APP_VERSION then
      begin
        if version_script<>'' then
           msg_version:=NEWLINE+NEWLINE+'Versión de la aplicación: '+APP_VERSION+NEWLINE+'Versión de la copia de seguridad: '+version_script
        else
             msg_version:='';
        if MessageDlg('Advertencia','El archivo de copia de seguridad seleccionado fue generado con una versión diferente de la aplicación. Es posible que falle la restauracion, que los datos se restauren incompletos, o que la aplicación no funcione correctamente. ¿Está seguro de que desea utilizar este archivo?'+msg_version, mtWarning, [mbYes, mbNo],0, mbNo) = mrNo then
        begin
          meSQL.Clear;
          edArchivoSQL.Text:='';
          sl_tablas.Clear;
          sl_datos.Clear;
          sl_rutinas.Clear;
          sl_expglob.Clear;
          HabilitarAcciones;
        end;
      end;


      if FileExistsUTF8(script_tablas) then
         DeleteFileUTF8(script_tablas);
      if FileExistsUTF8(script_datos) then
         DeleteFileUTF8(script_datos);
      if FileExistsUTF8(script_rutinas) then
         DeleteFileUTF8(script_rutinas);
    end else
    begin
      MessageDlg('El archivo seleccionado no parece ser una copia de seguridad realizada por esta aplicación. No se puede procesar el archivo', mtError, [mbOK],0);
      meSQL.Clear;
      edArchivoSQL.Text:='';
      sl_tablas.Clear;
      sl_datos.Clear;
      sl_rutinas.Clear;
      sl_expglob.Clear;
      HabilitarAcciones;
    end;
    ckRestaurarEstructura.Enabled:=(sl_tablas.Count>0) or (sl_rutinas.Count>0);
    ckRestaurarEstructura.Checked:=ckRestaurarEstructura.Enabled;
    ckRestaurarDatos.Enabled:=(sl_datos.Count>0);
    ckRestaurarDatos.Checked:=ckRestaurarDatos.Enabled;
  end;
end;

function TfmBackup.EjecutarRestauracion(proc_tablas, proc_datos,
    proc_rutinas: Boolean): Boolean;
var
  restOK: boolean;
  linea: string;
  i:Integer;
  oldCursor: TCursor;
begin
   acRestaurar.Enabled:=False;
   meSQL.Visible:=False;
   oldCursor:=paMensajeEspera.Cursor;
   paMensajeEspera.Cursor:=crHourGlass;
   edArchivoSQL.Text:='';
   ckRestaurarEstructura.Enabled:=False;
   ckRestaurarDatos.Enabled:=False;
   Application.ProcessMessages;
   restOK:=False;
   if (proc_tablas or proc_datos or proc_rutinas) then
   begin
       //Se utilizan los componentes de SQLdb ya que los de ZeosDB no permiten la ejecución de un script
       //Se copian los datos de conección desde la base de datos general
       conRestaurar.HostName:=dmGeneral.zcDB.HostName;
       conRestaurar.Port:=dmGeneral.zcDB.Port;
       conRestaurar.UserName:=dmGeneral.zcDB.User;
       conRestaurar.Password:=dmGeneral.zcDB.Password;
       conRestaurar.DatabaseName:=dmGeneral.zcDB.Database;
       dblRestaurar.LibraryName:=dmGeneral.zcDB.LibraryLocation;
       dblRestaurar.Enabled:=True;
       try
         conRestaurar.Connected:= True;

         trRestaurar.StartTransaction;

         if proc_tablas then
         begin
             scRestaurar.Terminator:=';';
             scRestaurar.Script.Text:=sl_tablas.Text;
             scRestaurar.ExecuteScript;
         end;

         if proc_datos then
         begin
             scRestaurar.Terminator:=';';
             scRestaurar.Script.Text:=sl_datos.Text;
             scRestaurar.ExecuteScript;
         end;

         //Por un problema de compatibilidad con el componente de script,
         //debe eliminarse el "DELIMITER" y configurarlo directamente
         //en el componente

         if proc_rutinas then
         begin
             for i:=0 to sl_rutinas.Count-1 do
             begin
               sl_rutinas[i]:=StringReplace(sl_rutinas[i], 'DELIMITER $$', '', [rfReplaceAll, rfIgnoreCase]);
               sl_rutinas[i]:=StringReplace(sl_rutinas[i], 'DELIMITER ;', '', [rfReplaceAll, rfIgnoreCase]);
             end;
             sl_rutinas.SaveToFile('d:\tmp\rutinas.sql');
             scRestaurar.Terminator:='$$';
             scRestaurar.Script.Text:=sl_rutinas.Text;
             scRestaurar.ExecuteScript;
         end;

         trRestaurar.Commit;

         restOK:=True;
       except
         on E:ESQLDatabaseError do
         begin
           trRestaurar.Rollback;
           MessageDlg('Ocurrió un error al realizar la restauración de la copia de seguridad: '+NEWLINE+NEWLINE+E.Message, mtError, [mbOK],0);
         end;
       end;
       conRestaurar.Connected:=False;

       //Desconecto y reconecto la base de datos principal
       dmGeneral.zcDB.Connected:=False;
       dblRestaurar.Enabled:=False;
       dmGeneral.zcDB.Connect;

       meSQL.Visible:=True;
       paMensajeEspera.Cursor:=oldCursor;
       HabilitarAcciones;
   end;
   edArchivoSQL.Text:='';
   meSQL.Lines.Clear;
   sl_tablas.Clear;
   sl_datos.Clear;
   sl_rutinas.Clear;
   sl_expglob.Clear;

   ckRestaurarEstructura.Checked:=False;
   ckRestaurarEstructura.Enabled:=False;
   ckRestaurarDatos.Checked:=False;
   ckRestaurarDatos.Enabled:=False;

   Result:=restOK;
end;

procedure TfmBackup.zqRutinasBeforeOpen(DataSet: TDataSet);
begin
    zqRutinas.ParamByName('db').Value:=dmGeneral.zcDB.Database;
end;

procedure TfmBackup.HabilitarAcciones;
begin
   acBackup.Enabled:=((dedCarpetaArchivo.Directory<>'') and DirectoryExistsUTF8(dedCarpetaArchivo.Directory)
   and(ckDatos.Checked or ckEstructura.Checked));
   acRestaurar.Enabled:=(ckRestaurarEstructura.Checked or ckRestaurarDatos.Checked) and ((edArchivoSQL.Text<>'') and FileExistsUTF8(edArchivoSQL.Text));
end;

procedure TfmBackup.ExportarDB_SQL(archivo_tablas, archivo_datos,
    archivo_rutinas: string);
var
   str_sql_tablas: TStringList;
   str_sql_datos: TStringList;
   str_sql_rutinas: TStringList;
begin

  //Genera un archivo str_sql_tablas con la estructura de tablas y vistas, y los datos correspondientes

   //Se utiliza un StringList para almacenar el código del script
   str_sql_tablas:=TStringList.Create;
   str_sql_datos:=TStringList.Create;

   //Se arma un encabezado con las variables de inicio del script
   if ckEstructura.Checked then
      CrearEncabezadoTablas(str_sql_tablas);
   if ckDatos.Checked then
      CrearEncabezadoTablas(str_sql_datos);

   CrearTablasYDatos(str_sql_tablas, str_sql_datos, ckEstructura.Checked, ckDatos.Checked);

   //Se agrega el seteo de variables al final
   if ckEstructura.Checked then
      CrearPieTablas(str_sql_tablas);
   if ckDatos.Checked then
      CrearPieTablas(str_sql_datos);

   if (archivo_tablas <> '') and (str_sql_tablas.Count>0) then
    begin
      str_sql_tablas.SaveToFile(archivo_tablas);
    end;

   if (archivo_datos <> '') and (str_sql_datos.Count>0) then
   begin
     str_sql_datos.SaveToFile(archivo_datos);
   end;

  str_sql_tablas.Free;
  str_sql_datos.Free;

   if ckEstructura.Checked then
   begin
       //Generación del script de rutinas (vistas, stored procedures, funciones y triggers
       str_sql_rutinas:=TStringList.Create;

       CrearEncabezadoRutinas(str_sql_rutinas);

       //Las vistas las creo en dos pasadas. Primero creo una estructura falsa
       //para que las vistas que usan otras vistas no den error.
       //Luego creo las funciones y procedimientos
       //En la segunda pasada, borro la estructura falsa y creo la vista
       GenerarEstructuraVistas(str_sql_rutinas);

       //Antes de crear la vista final, creo las funciones. Primero creo una "fachada"
       //para que la función exista si es requerida por otra cuando se cree la versión
       //final en la segunda pasada

       CrearRutinas(str_sql_rutinas);

       //Segunda pasada de vistas: Para cada vista, creo la estructura final
       CrearVistasReales(str_sql_rutinas);

       //Creación de Triggers
       CrearTriggers(str_sql_rutinas);

       //Finalizo con las variables de cierre
       CrearPieRutinas(str_sql_rutinas);

     if archivo_rutinas <> '' then
     begin
          str_sql_rutinas.SaveToFile(archivo_rutinas);
     end;

     str_sql_rutinas.Free;
  end;
end;

procedure TfmBackup.ExportarDB_TXT(carpeta: string);
var
  tabla: string;
  str_datos: TStringList;
  linea: string;
  i: Integer;
  primero: Boolean;
begin
   str_datos:=TStringList.Create;

   //Obtengo las tablas de la base de datos
   zqTablasYVistas.Close;
   zqTablasYVistas.ParamByName('tipo').Value:='BASE TABLE';
   zqTablasYVistas.Open;

   //Para cada tabla, creo la estructura y armo el insert con los datos
   with zqTablasYVistas do
   begin
     First;
     while not EOF do
     begin
       tabla:=zqTablasYVistas.FieldByName('Tables_in_'+dmGeneral.zcDB.Database).AsString;
       zqDatosTabla.Close;
       zqDatosTabla.SQL.Text:='SELECT * FROM '+tabla;
       zqDatosTabla.Open;

       str_datos.Clear;
       //Genero la cabecera con los nombre de campo
       linea:='';
       primero:=True;
       for i:=0 to  zqDatosTabla.FieldCount-1 do
       begin
         if primero then
         begin
           primero:=False;
           linea:='"'+zqDatosTabla.Fields[i].DisplayLabel+'"';
         end else
         begin
              linea:=linea+';'+'"'+zqDatosTabla.Fields[i].DisplayLabel+'"';
         end;
       end;
       str_datos.Add(linea);

       //Si no hay datos, no hago nada mas
       if zqDatosTabla.RecordCount>0 then
       begin
          with zqDatosTabla do
          begin
            First;
            while not EOF do
            begin
              linea:='';
              primero:=True;
              for i := 0 to FieldCount-1 do
              begin
                if primero then
                begin
                  primero:=False;
                  linea:='"'+Fields[i].AsString+'"';
                end else
                begin
                  linea:=linea+';'+'"'+Fields[i].AsString+'"';
                end;
              end;
              str_datos.Add(linea);
              Next;
            end;
          end;
       end;
       str_datos.SaveToFile(carpeta+DirectorySeparator+tabla+'.txt');
       Next;
     end;
   end;
end;

procedure TfmBackup.ExportarDB_Global(archivo_datos: string);
var
   str_sql_datos: TStringList;
begin

    //Genera un archivo str_sql_datos con los datos necesarios
    //para ser importados en la base de datos global

    //Se utiliza un StringList para almacenar el código del script
    str_sql_datos:=TStringList.Create;

    //Se arma un encabezado con las variables de inicio del script
    CrearEncabezadoTablas(str_sql_datos);

    CrearDatosDBGlobal(str_sql_datos);

    //Se agrega el seteo de variables al final
    CrearPieTablas(str_sql_datos);

    if (archivo_datos <> '') and (str_sql_datos.Count>0) then
    begin
     str_sql_datos.SaveToFile(archivo_datos);
    end;

    str_sql_datos.Free;

end;

function TfmBackup.SentenciaCreateTable(tabla: string): string;
var
  sentencia:String;
begin
  zqGetCreate.Close;
  zqGetCreate.SQL.Text:='SHOW CREATE TABLE '+tabla;
  zqGetCreate.Open;
  sentencia:=StringReplace(CREATE_TABLE_TEMPLATE, '<TABLA>', tabla, [rfReplaceAll, rfIgnoreCase]);
  sentencia:=StringReplace(sentencia, '<SENTENCIA_CREATE_TABLE>', zqGetCreate.FieldByName('Create Table').AsString, [rfReplaceAll, rfIgnoreCase]);
  result := sentencia;
end;

function TfmBackup.SentenciaCreateView(vista: string): string;
var
  sentencia:String;
begin
  zqGetCreate.Close;
  zqGetCreate.SQL.Text:='SHOW CREATE VIEW '+vista;
  zqGetCreate.Open;
  sentencia:=StringReplace(CREATE_VIEW_TEMPLATE, '<VISTA>', vista, [rfReplaceAll, rfIgnoreCase]);
  sentencia:=StringReplace(sentencia, '<SENTENCIA_CREATE_VIEW>', zqGetCreate.FieldByName('Create View').AsString, [rfReplaceAll, rfIgnoreCase]);
  result := sentencia;
end;

function TfmBackup.SentenciaInsert(tabla: string; PrefijoTabla: string;
    FiltroMarea: string): string;
var
   str_sql: string;
   sentencia: string;
   insert_values_reg:string;
   insert_values_gral:string;
   paquete_insert: string;
   campos:string;
   i: integer;
   first_record:boolean;
   first_field:boolean;
   primero:boolean;
   nro_reg_paquete:Integer;
   max_reg_paquete: integer=1000;
begin
     zqDatosTabla.Close;
     str_sql:='SELECT * FROM '+tabla;
     if FiltroMarea<>'' then
        str_sql:=str_sql+ ' WHERE idmarea_original = '+FiltroMarea;
     zqDatosTabla.SQL.Text:=str_sql;
     zqDatosTabla.Open;

     //Para optimizar el rendimiento y evitar errores en tablas con muchos registros,
     //hago varios grupos de inserts haciendo paquetes de a <max_reg_paquete> registros

     //Si no hay datos, no se genera la sentencia INSERT, se devuelve una cadena vacía
     if zqDatosTabla.RecordCount>0 then
     begin

       //Genero la lista de los nombres de campo
       campos:='';
       primero:=True;
       paquete_insert:='';
       sentencia:='';

       //Armo la lista con los nombres de campo
       for i:=0 to  zqDatosTabla.FieldCount-1 do
       begin
         if primero then
         begin
           primero:=False;
           campos:=zqDatosTabla.Fields[i].DisplayLabel;
         end else
         begin
              campos:=campos+','+zqDatosTabla.Fields[i].DisplayLabel;
         end;
       end;
        with zqDatosTabla do
        begin
          First;
          insert_values_gral:='';
          first_record:=True;
          while not EOF do
          begin
            first_field:=True;
            insert_values_reg:='(';
            for i := 0 to FieldCount-1 do
            begin
              if first_field then
              begin
                first_field:=False;
                insert_values_reg:=insert_values_reg+FormatField(Fields[i]);
              end else
              begin
                //Si no es el primer campo, agrego una coma antes para separar
                insert_values_reg:=insert_values_reg+','+FormatField(Fields[i]);
              end;
            end;
            insert_values_reg:=insert_values_reg+')';

            if first_record then
            begin
              first_record:=False;
              nro_reg_paquete:=1;
              insert_values_gral:=insert_values_reg;
            end else
            begin
              insert_values_gral:=insert_values_gral+','+insert_values_reg;
              inc(nro_reg_paquete);
            end;

            //Si alcanzo los <max_reg_paquete> registros, armo un paquete y vuelvo a empezar
            if nro_reg_paquete>=max_reg_paquete then
            begin
              paquete_insert:=StringReplace(INSERT_MULTI_TEMPLATE, '<TABLA>', PrefijoTabla+tabla, [rfReplaceAll, rfIgnoreCase]);
              paquete_insert:=StringReplace(paquete_insert, '<CAMPOS>', campos, [rfReplaceAll, rfIgnoreCase]);
              paquete_insert:=StringReplace(paquete_insert, '<INSERT_VALUES>', insert_values_gral, [rfReplaceAll, rfIgnoreCase]);
              sentencia:=sentencia+paquete_insert;
              insert_values_gral:='';
              first_record:=True;
            end;

            Next;
          end;
          //Si quedan registros en el paquete, los agrego a la sentencia
          if insert_values_gral<>'' then
          begin
            paquete_insert:=StringReplace(INSERT_MULTI_TEMPLATE, '<TABLA>', PrefijoTabla+tabla, [rfReplaceAll, rfIgnoreCase]);
            paquete_insert:=StringReplace(paquete_insert, '<CAMPOS>', campos, [rfReplaceAll, rfIgnoreCase]);
            paquete_insert:=StringReplace(paquete_insert, '<INSERT_VALUES>', insert_values_gral, [rfReplaceAll, rfIgnoreCase]);
            sentencia:=sentencia+paquete_insert;
          end;
        end;
     end;
     result := sentencia;
end;

function TfmBackup.FormatField(f: TField): string;
var
   valor: string;
begin
  //Según el tipo de campo, lo formateo como corresponde
     if f.IsNull then
     begin
       valor:='NULL';
     end else
     if (f is TIntegerField) or(f is TLongintField) or (f is TLargeintField) then
     begin
       valor:=IntToStr(f.Value);
     end else
     if f is TFloatField then
     begin
       valor:=FloatToStr(f.Value);
     end else
     if f is TDateField then
     begin
       //Las fechas son una cadena entre comillas
       valor:=''''+FormatDateTime('yyyy-mm-dd', f.AsDateTime)+'''';
     end else
     if f is TDateTimeField then
     begin
       //Las fechas son una cadena entre comillas
       valor:=''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', f.AsDateTime)+'''';
     end else
     if f is TTimeField then
     begin
       //Las horas son una cadena entre comillas
       valor:=''''+FormatDateTime('hh:mm:ss', f.AsDateTime)+'''';
     end else
     if f is TBooleanField then
     begin
       valor:=IntToStr(f.AsInteger);
     end else
     if f is TMemoField then
     begin
       valor:=AnsiQuotedStr(f.AsString,'''');
     end else
     if f is TStringField then
     begin
       //Las cadenas deben ir encerradas entre comillas
       valor:=''''+f.AsString+'''';
     end else  //Cualquier otro tipo no contemplado se formatea como cadena
     if f is TBlobField then
     begin
       //Por ahora no sé como convertir los campos binarios a texto
       valor:='NULL';
     end else
     begin
       valor:=''''+f.AsString+'''';
     end;

     result := valor;
end;

function TfmBackup.CrearEstructuraVista(vista: string): string;
var
   sentencia: string;
   str_todos: string;
   str_campo:string;
   first_record:boolean;
begin
     str_todos:='';

     zqDatosTabla.Close;
     zqDatosTabla.SQL.Text:='SHOW COLUMNS FROM '+vista;
     zqDatosTabla.Open;

     with zqDatosTabla do
     begin
       First;
       first_record:=True;
       while not EOF do
       begin
         str_campo:='1 AS `'+zqDatosTabla.FieldByName('Field').AsString+'`';
         if first_record then
         begin
           first_record:=False;
           str_todos:=str_campo;
         end else
         begin
           str_todos:=str_todos+','+NEWLINE+str_campo;
         end;
         Next;
       end;
     end;
     sentencia:=StringReplace(CREATE_VIEW_STRUCTURE_TEMPLATE, '<VISTA>', vista, [rfReplaceAll, rfIgnoreCase]);
     sentencia:=StringReplace(sentencia, '<VIEW_FIELDS>', str_todos, [rfReplaceAll, rfIgnoreCase]);
     result:=sentencia;
end;

procedure TfmBackup.CrearTablasYDatos(var str_sql_tablas,
    str_sql_datos: TStringList; crear_estructura: Boolean;
    incluir_datos: Boolean);
var
   tabla: string;
begin
   //Obtengo las tablas de la base de datos
   zqTablasYVistas.Close;
   zqTablasYVistas.ParamByName('tipo').Value:='BASE TABLE';
   zqTablasYVistas.Open;


   //Para cada tabla, creo la estructura y armo el insert con los datos
   with zqTablasYVistas do
   begin
     First;
     while not EOF do
     begin
       tabla:=zqTablasYVistas.FieldByName('Tables_in_'+dmGeneral.zcDB.Database).AsString;
       if crear_estructura then
       begin
              str_sql_tablas.Add(SentenciaCreateTable(tabla));
       end;
       if incluir_datos then
       begin
            str_sql_datos.Add(SentenciaInsert(tabla));
       end;
       Application.ProcessMessages;
       Next;
     end;
   end;

    if crear_estructura then
       str_sql_tablas.Add(NEWLINE);
    if incluir_datos then
       str_sql_datos.Add(NEWLINE);
end;

procedure TfmBackup.CrearEncabezadoTablas(var str_sql: TStringList);
var
   var_encabezado:string;
begin
    str_sql.Add('-- ---------------------------------------------');
    str_sql.Add('-- Tablas y datos de la base de datos "'+dmGeneral.zcDB.Database+'"');
    str_sql.Add('-- Generado desde la aplicación "'+ApplicationName+'"');
    str_sql.Add('-- Version '+APP_VERSION);
    str_sql.Add('-- Fecha y hora de resguardo: '+FormatDateTime('dd/mm/yyyy hh:mm', Now));
    str_sql.Add('-- ---------------------------------------------');
    str_sql.Add('');
    //Seteo las variables globales del script
    var_encabezado:=StringReplace(SET_VAR_ENCABEZADO,'<ESQUEMA>',dmGeneral.zcDB.Database,[rfReplaceAll, rfIgnoreCase]);
    str_sql.Add(var_encabezado);
    str_sql.Add(NEWLINE);
    str_sql.Add('-- ------------------ --');
    str_sql.Add('-- Tablas del sistema --');
    str_sql.Add('-- ------------------ --');
    str_sql.Add('');
end;

procedure TfmBackup.CrearPieTablas(var str_sql: TStringList);
begin
   str_sql.Add(NEWLINE);
   str_sql.Add(SET_VAR_PIE);
   str_sql.Add(NEWLINE);
   str_sql.Add('-- ----------------------------------------------------');
   str_sql.Add('-- Fin de la copia de seguridad: '+FormatDateTime('dd/mm/yyyy hh:mm', Now));
   str_sql.Add('-- ----------------------------------------------------');
   str_sql.Add(NEWLINE);
end;

procedure TfmBackup.GenerarEstructuraVistas(var str_sql: TStringList);
var
   vista: string;
begin
   str_sql.Add('-- -------------------------------- --');
   str_sql.Add('-- Estructura de vistas del sistema --');
   str_sql.Add('-- -------------------------------- --');
   //Obtengo las vistas de la base de datos
   zqTablasYVistas.Close;
   zqTablasYVistas.ParamByName('tipo').Value:='VIEW';
   zqTablasYVistas.Open;

   //Para cada vista, creo la estructura vacía
   with zqTablasYVistas do
   begin
     First;
     while not EOF do
     begin
       vista:=zqTablasYVistas.FieldByName('Tables_in_'+dmGeneral.zcDB.Database).AsString;
       str_sql.Add(CrearEstructuraVista(vista));
       Application.ProcessMessages;
       Next;
     end;
   end;
end;

procedure TfmBackup.CrearRutinas(var str_sql: TStringList);
var
   def_rutina:string;
   drop_rutina: string;
begin
   zqRutinas.Close;
   zqRutinas.Open;

   str_sql.Add('');
   str_sql.Add('-- ------------------------------------------------------- --');
   str_sql.Add('-- Definición de Funciones y Stored Procedures del sistema --');
   str_sql.Add('-- ------------------------------------------------------- --');
   str_sql.Add('');
   str_sql.Add('-- --------------------- --');
   str_sql.Add('-- Creación de cabeceras --');
   str_sql.Add('-- --------------------- --');

   while not zqRutinas.EOF do
   begin
     //Busco la sentencia de creación
     zqDefRutina.Close;
     if zqRutinasroutine_type.AsString='PROCEDURE' then
        zqDefRutina.SQL.Text:='SHOW CREATE PROCEDURE '+zqRutinasroutine_name.AsString
     else
        zqDefRutina.SQL.Text:='SHOW CREATE FUNCTION '+zqRutinasroutine_name.AsString;
     zqDefRutina.Open;

     //Extraigo sólo la linea de definición (quito el código)
     if zqRutinasroutine_type.AsString='PROCEDURE' then
     begin
       drop_rutina:='DELIMITER $$'+NEWLINE+'DROP PROCEDURE IF EXISTS '+zqRutinasroutine_name.AsString+'$$'+NEWLINE+'DELIMITER ;';
          def_rutina:=zqDefRutina.FieldByName('Create Procedure').AsString;
          def_rutina:=StringReplace(def_rutina, zqRutinasroutine_definition.AsString, 'BEGIN'+NEWLINE+'END $$', [rfReplaceAll, rfIgnoreCase]);;
     end
     else
     begin
       drop_rutina:='DELIMITER $$'+NEWLINE+'DROP FUNCTION IF EXISTS '+zqRutinasroutine_name.AsString+'$$'+NEWLINE+'DELIMITER ;';
          def_rutina:=zqDefRutina.FieldByName('Create Function').AsString;
          def_rutina:=StringReplace(def_rutina, zqRutinasroutine_definition.AsString, 'BEGIN'+NEWLINE+'RETURN NULL;'+NEWLINE+'END $$', [rfReplaceAll, rfIgnoreCase]);;
     end;

     //por una cuestión estética, fuerzo el nombre de la rutina a minúsculas
     def_rutina:=StringReplace(def_rutina, zqRutinasroutine_name.AsString, LowerCase(zqRutinasroutine_name.AsString), [rfReplaceAll, rfIgnoreCase]);;


     str_sql.Add('');
     str_sql.Add('--');
     str_sql.Add('-- Estructura base de Rutina '+zqRutinasroutine_name.AsString);
     str_sql.Add('--');
     str_sql.Add('');
     str_sql.Add(drop_rutina);
     str_sql.Add('DELIMITER $$'+NEWLINE+def_rutina+NEWLINE+'DELIMITER ;');
     zqRutinas.Next;
   end;

   //Segunda pasada: creo las rutinas con su código real
   str_sql.Add(NEWLINE);
   str_sql.Add('-- ---------------------------------------------------- --');
   str_sql.Add('-- Definición completa de Funciones y Stored Procedures --');
   str_sql.Add('-- ---------------------------------------------------- --');
   zqRutinas.First;
   while not zqRutinas.EOF do
   begin
     //Busco la sentencia de creación
     zqDefRutina.Close;
     if zqRutinasroutine_type.AsString='PROCEDURE' then
     begin
        drop_rutina:='DELIMITER $$'+NEWLINE+'DROP PROCEDURE IF EXISTS '+zqRutinasroutine_name.AsString+'$$'+NEWLINE+'DELIMITER ;';
        zqDefRutina.SQL.Text:='SHOW CREATE PROCEDURE '+zqRutinasroutine_name.AsString
     end
     else
     begin
        drop_rutina:='DELIMITER $$'+NEWLINE+'DROP FUNCTION IF EXISTS '+zqRutinasroutine_name.AsString+'$$'+NEWLINE+'DELIMITER ;';
        zqDefRutina.SQL.Text:='SHOW CREATE FUNCTION '+zqRutinasroutine_name.AsString;
     end;
     zqDefRutina.Open;

     if zqRutinasroutine_type.AsString='PROCEDURE' then
          def_rutina:=zqDefRutina.FieldByName('Create Procedure').AsString+'$$'
     else
          def_rutina:=zqDefRutina.FieldByName('Create Function').AsString+'$$';

     //por una cuestión estética, fuerzo el nombre de la rutina a minúsculas
     def_rutina:=StringReplace(def_rutina, zqRutinasroutine_name.AsString, LowerCase(zqRutinasroutine_name.AsString), [rfReplaceAll, rfIgnoreCase]);;

     str_sql.Add(NEWLINE);
     str_sql.Add('--');
     str_sql.Add('-- Definición completa de Rutina '+zqRutinasroutine_name.AsString);
     str_sql.Add('--');
     str_sql.Add('');
     str_sql.Add(drop_rutina);
     str_sql.Add('DELIMITER $$'+NEWLINE+def_rutina+NEWLINE+'DELIMITER ;');
     zqRutinas.Next;
   end;
end;

procedure TfmBackup.CrearTriggers(var str_sql: TStringList);
var
   trigger: string;
   sentencia: string;
begin
   //Obtengo los triggers de la base de datos
   zqTriggers.Close;
   zqTriggers.Open;

   str_sql.Add(NEWLINE);
   str_sql.Add('-- -------- --');
   str_sql.Add('-- Triggers --');
   str_sql.Add('-- -------- --');
   str_sql.Add('');

   //Para cada trigger, armo la sentencia de creación
   with zqTriggers do
   begin
     First;
     while not EOF do
     begin

       trigger:=zqTriggers.FieldByName('Trigger').AsString;

       zqGetCreate.Close;
       zqGetCreate.SQL.Text:='SHOW CREATE TRIGGER '+trigger;
       zqGetCreate.Open;
       sentencia:=StringReplace(CREATE_TRIGGER_TEMPLATE, '<TRIGGER>', trigger, [rfReplaceAll, rfIgnoreCase]);
       sentencia:=StringReplace(sentencia, '<SENTENCIA_CREATE_TRIGGER>', zqGetCreate.FieldByName('SQL Original Statement').AsString, [rfReplaceAll, rfIgnoreCase]);
       str_sql.Add(sentencia);

       Application.ProcessMessages;
       Next;
     end;
   end;
   str_sql.Add(NEWLINE);
end;

procedure TfmBackup.CrearVistasReales(var str_sql: TStringList);
var
   vista: string;
begin
   with zqTablasYVistas do
   begin
     First;
     while not EOF do
     begin
       vista:=zqTablasYVistas.FieldByName('Tables_in_'+dmGeneral.zcDB.Database).AsString;
       //Las funciones GIS no son del todo compatibles, así que las salteo
       if (LowerCase(LeftStr(vista, 5))<>'v_gis') and (LowerCase(LeftStr(vista, 6))<>'v_geom') then
       begin
         str_sql.Add(SentenciaCreateView(vista));
         str_sql.Add('');
         Application.ProcessMessages;
       end;
       Next;
     end;
   end;
end;

procedure TfmBackup.CrearEncabezadoRutinas(var str_sql: TStringList);
var
   variables: string;
begin
   str_sql.Add('DELIMITER $$');
   str_sql.Add('-- ---------------------------------------------');
   str_sql.Add('-- Rutinas de la base de datos "'+dmGeneral.zcDB.Database+'"');
   str_sql.Add('-- realizada desde la aplicación "'+ApplicationName+'"');
   str_sql.Add('-- Fecha y hora de resguardo: '+FormatDateTime('dd/mm/yyyy hh:mm', Now));
   str_sql.Add('-- ---------------------------------------------');
   str_sql.Add('');

   //Seteo las variables globales del script
   //Por compatibilidad con la ejecución del script en Lazarus, se utiliza el
   //mismo delimitador que en las funciones y stored procedures
   variables:=StringReplace(SET_VAR_ENCABEZADO,';','$$',[rfReplaceAll, rfIgnoreCase]);
   variables:=StringReplace(variables,'<ESQUEMA>',dmGeneral.zcDB.Database,[rfReplaceAll, rfIgnoreCase]);
   str_sql.Add(variables);
   str_sql.Add('DELIMITER ;');
   str_sql.Add(NEWLINE);
end;

procedure TfmBackup.CrearPieRutinas(var str_sql: TStringList);
var
   variables: string;
begin
   str_sql.Add(NEWLINE);
   //Seteo las variables globales del script
   //Por compatibilidad con la ejecución del script en Lazarus, se utiliza el
   //mismo delimitador que en las funciones y stored procedures
   str_sql.Add('DELIMITER $$');
   variables:=StringReplace(SET_VAR_PIE,';','$$',[rfReplaceAll, rfIgnoreCase]);
   str_sql.Add(variables);
   str_sql.Add('DELIMITER ;');
   str_sql.Add(NEWLINE);
   str_sql.Add('-- ----------------------------------------------------');
   str_sql.Add('-- Fin de la copia de seguridad: '+FormatDateTime('dd/mm/yyyy hh:mm', Now));
   str_sql.Add('-- ----------------------------------------------------');
   str_sql.Add(NEWLINE);
end;

procedure TfmBackup.CrearDatosDBGlobal(var str_sql: TStringList);
const
      PREFIJO_VISTAS='v_expg_';
var
   vista: string;
begin
   //Obtengo las tablas de la base de datos
   zqTablasYVistas.Close;
   zqTablasYVistas.ParamByName('tipo').Value:='VIEW';
   zqTablasYVistas.Open;


   //Para cada vista, creo la estructura y armo el insert con los datos
   with zqTablasYVistas do
   begin
     First;
     while not EOF do
     begin
       vista:=zqTablasYVistas.FieldByName('Tables_in_'+dmGeneral.zcDB.Database).AsString;
       if LeftStr(LowerCase(vista),7)=PREFIJO_VISTAS then
       begin
            str_sql.Add(SentenciaInsert(vista, 'tmp_', IntToStr(dmGeneral.IdMareaActiva)));
       end;
       Application.ProcessMessages;
       Next;
     end;
   end;
   str_sql.Add(NEWLINE);
end;

end.

