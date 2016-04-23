unit frmimprimiretiquetas;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF MSWINDOWS}
    Windows,
    windirs,
  {$ENDIF}
  {$IFDEF UNIX}
    Unix,
  {$ENDIF}
  Classes, SysUtils, FileUtil, LR_Class, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DbCtrls, ExtCtrls, EditBtn, Buttons, ActnList, datGeneral, lr_e_pdf, LSConfig;

type

  { TfmImprimirEtiquetas }

  TfmImprimirEtiquetas = class(TForm)
    acGuardarPlanillas: TAction;
    alProceso: TActionList;
    bbGuardar: TBitBtn;
    ckInidepCallos: TCheckBox;
    ckEcologicas: TCheckBox;
    ckSenasaCallos: TCheckBox;
    ckSenasaEntera: TCheckBox;
    ckPlanillasSenasa: TCheckBox;
    ckControlMuestras: TCheckBox;
    dbtMareaActiva: TDBText;
    dedCarpetaPlanillas: TDirectoryEdit;
    frEtiquetasSenasaCallos: TfrReport;
    frEtiquetasInidepCallos: TfrReport;
    frEtiquetasSenasaEntera: TfrReport;
    frEtiquetasEcologica: TfrReport;
    frPlanillasSenasa: TfrReport;
    frMuestrasBiol: TfrReport;
    GroupBox1: TGroupBox;
    ilComando: TImageList;
    Label2: TLabel;
    procedure acGuardarPlanillasExecute(Sender: TObject);
    procedure dedCarpetaPlanillasAcceptDirectory(Sender: TObject;
      var Value: String);
    procedure dedCarpetaPlanillasChange(Sender: TObject);
    procedure dedCarpetaPlanillasExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frEtiquetasSenasaCallosBeginDoc;
    procedure frEtiquetasSenasaCallosBeginPage(pgNo: Integer);
    procedure frEtiquetasSenasaCallosGetValue(const ParName: String;
      var ParValue: Variant);
  private
    { private declarations }
    procedure GenerarEtiquetasInidepCallos;
    procedure GenerarEtiquetasEcologica;
    procedure GenerarEtiquetasSenasaCallos;
    procedure GenerarEtiquetasSenasaEntera;
    procedure GenerarPlanillasSenasa;
    procedure GenerarPlanillaControlMuestras;
  public
    { public declarations }
  end;

var
  fmImprimirEtiquetas: TfmImprimirEtiquetas;
  Pagina: integer;

implementation

{$R *.lfm}

{ TfmImprimirEtiquetas }

procedure TfmImprimirEtiquetas.acGuardarPlanillasExecute(Sender: TObject);
var
  gen_ok:boolean;
begin
  gen_ok:=False;
  if dedCarpetaPlanillas.Directory <> '' then
  begin
    if ckInidepCallos.Checked then
      GenerarEtiquetasInidepCallos;
    if ckEcologicas.Checked then
      GenerarEtiquetasEcologica;
    if ckSenasaCallos.Checked then
      GenerarEtiquetasSenasaCallos;
    if ckSenasaEntera.Checked then
      GenerarEtiquetasSenasaEntera;
    if ckPlanillasSenasa.Checked then
      GenerarPlanillasSenasa;
    if ckControlMuestras.Checked then
      GenerarPlanillaControlMuestras;
    gen_ok:=True;
  end;
  if gen_ok and (MessageDlg('Los archivos PDF para imprimir han sido guarados en la carpeta indicada. ¿Desea abrir la carpeta para ver los archivos?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
  begin
    {$IFDEF MSWINDOWS}
      ShellExecute(Handle, 'open', PChar(dedCarpetaPlanillas.Directory), nil, nil, SW_SHOWNORMAL)
    {$ENDIF}
    {$IFDEF UNIX}
      Shell(format('gv %s',[ExpandFileNameUTF8(dedCarpetaPlanillas.Directory)]));
    {$ENDIF}
  end;
end;

procedure TfmImprimirEtiquetas.dedCarpetaPlanillasAcceptDirectory(
  Sender: TObject; var Value: String);
begin
  LSSaveConfig(['destino_etiquetas'],[dedCarpetaPlanillas.Directory]);
end;

procedure TfmImprimirEtiquetas.dedCarpetaPlanillasChange(Sender: TObject);
begin
  LSSaveConfig(['destino_etiquetas'],[dedCarpetaPlanillas.Directory]);
end;

procedure TfmImprimirEtiquetas.dedCarpetaPlanillasExit(Sender: TObject);
begin
  LSSaveConfig(['destino_etiquetas'],[dedCarpetaPlanillas.Directory]);
end;

procedure TfmImprimirEtiquetas.FormShow(Sender: TObject);
var
  destino:String;
begin
  destino:='';
  LSLoadConfig(['destino_etiquetas'],[destino],[@destino]);
  {$IFDEF MSWINDOWS}
  if destino='' then
     destino:=GetWindowsSpecialDir(CSIDL_PERSONAL);
  {$ENDIF}
  dedCarpetaPlanillas.Directory := destino;
end;

procedure TfmImprimirEtiquetas.frEtiquetasSenasaCallosBeginDoc;
begin
  Pagina:=0;
end;

procedure TfmImprimirEtiquetas.frEtiquetasSenasaCallosBeginPage(pgNo: Integer);
begin
  Inc(Pagina);
end;

procedure TfmImprimirEtiquetas.frEtiquetasSenasaCallosGetValue(
  const ParName: String; var ParValue: Variant);
begin
  if ParName='TEXTO_SENASA_CALLOS' then
   ParValue:=dmGeneral.zqMareaActiva.FieldByName('txt_senasa_'+IntToStr(Pagina)).AsString;
  if ParName='TEXTO_SENASA_ENTERA' then
   ParValue:=dmGeneral.zqMareaActivatxt_senasa_5.AsString;
end;

procedure TfmImprimirEtiquetas.GenerarEtiquetasSenasaCallos;
var
  archivo_destino: string;
begin
  archivo_destino := dedCarpetaPlanillas.Directory +
    DirectorySeparator + 'Etiquetas SENASA Callos.pdf';
  if (not FileExistsUTF8(archivo_destino)) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
  begin
    frEtiquetasSenasaCallos.PrepareReport;
    frEtiquetasSenasaCallos.ExportTo(TfrTNPDFExportFilter, archivo_destino);
  end;
end;

procedure TfmImprimirEtiquetas.GenerarEtiquetasSenasaEntera;
var
    archivo_destino: string;
begin
    archivo_destino := dedCarpetaPlanillas.Directory +
      DirectorySeparator + 'Etiquetas SENASA Entera.pdf';
    if (not FileExistsUTF8(archivo_destino)) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      frEtiquetasSenasaEntera.PrepareReport;
      frEtiquetasSenasaEntera.ExportTo(TfrTNPDFExportFilter, archivo_destino);
    end;
end;

procedure TfmImprimirEtiquetas.GenerarPlanillasSenasa;
var
  archivo_destino: string;
begin
  archivo_destino := dedCarpetaPlanillas.Directory +
    DirectorySeparator + 'Registro de muestras de SENASA.pdf';
  if (not FileExistsUTF8(archivo_destino)) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
  begin
    frPlanillasSenasa.PrepareReport;
    frPlanillasSenasa.ExportTo(TfrTNPDFExportFilter, archivo_destino);
  end;
end;

procedure TfmImprimirEtiquetas.GenerarPlanillaControlMuestras;
var
  archivo_destino: string;
begin
  archivo_destino := dedCarpetaPlanillas.Directory +
    DirectorySeparator + 'Planilla de control de muestras.pdf';
  if (not FileExistsUTF8(archivo_destino)) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
  begin
    frMuestrasBiol.PrepareReport;
    frMuestrasBiol.ExportTo(TfrTNPDFExportFilter, archivo_destino);
  end;
end;

procedure TfmImprimirEtiquetas.GenerarEtiquetasInidepCallos;
var
  archivo_destino: string;
begin
  archivo_destino := dedCarpetaPlanillas.Directory +
    DirectorySeparator + 'Etiquetas INIDEP Callos.pdf';
  if (not FileExistsUTF8(archivo_destino)) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
  begin
    frEtiquetasInidepCallos.PrepareReport;
    frEtiquetasInidepCallos.ExportTo(TfrTNPDFExportFilter, archivo_destino);
  end;
end;

procedure TfmImprimirEtiquetas.GenerarEtiquetasEcologica;
var
  archivo_destino: string;
begin
  archivo_destino := dedCarpetaPlanillas.Directory +
    DirectorySeparator + 'Etiquetas Muestra Ecológica.pdf';
  if (not FileExistsUTF8(archivo_destino)) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
  begin
    frEtiquetasEcologica.PrepareReport;
    frEtiquetasEcologica.ExportTo(TfrTNPDFExportFilter, archivo_destino);
  end;
end;

end.

