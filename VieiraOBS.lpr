program VieiraOBS;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  sysutils, Forms, pl_zeosdbo, pl_rx, pl_exsystem, lz_datetimectrls,
  frmPrincipal, datGeneral, frmbase, frmlistabase,
  frmmareas, frmzedicionbase, DefaultTranslator, frmEditarMarea, frmrindes,
  frmeditarrindes, frmcoccion, frmeditarcoccion, frmmuestrasbiologicas,
  frmeditarmuestrasbiologicas, frmdanio, frmeditardanio, frmbycatch, datbycatch,
  frmeditarbycatch, datBase, frmeditardetallebycatch, frmtallas, dattallas,
  frmeditartallas, frmeditardetalletallas, frmeditarlances, frmlances,
  funciones, frmInformes, frmmuestrassenasa, frmrptdatospuente,
  frmeditarproduccion, lr_pdfexp_reg, frmeditarsenasaentera,frmeditarsenasacallos,
  frmSplashScreenForm, frmproduccion, frmeditarrayas, frmbackup, 
frmimprimiretiquetas;

{$R *.res}

begin
  Application.Title:='Vieira OBS';
  RequireDerivedFormResource := True;
  DefaultFormatSettings.DecimalSeparator:='.';
  Application.Initialize;
  ShowSplashScreen;
  SetSplashScreenStatus( 'Iniciando...' );
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.CreateForm(TfmEditarCoccion, fmEditarCoccion);
  Application.CreateForm(TfmEditarDanio, fmEditarDanio);
  Application.CreateForm(TfmEditarMarea, fmEditarMarea);
  Application.CreateForm(TfmEditarMuestrasBiologicas, fmEditarMuestrasBiologicas
      );
  Application.CreateForm(TfmEditarRindes, fmEditarRindes);
  Application.CreateForm(TdmByCatch, dmByCatch);
  Application.CreateForm(TfmEditarByCatch, fmEditarByCatch);
  Application.CreateForm(TfmEditarDetalleByCatch, fmEditarDetalleByCatch);
  Application.CreateForm(TdmTallas, dmTallas);
  Application.CreateForm(TfmEditarTallas, fmEditarTallas);
  Application.CreateForm(TfmEditarDetalleTallas, fmEditarDetalleTallas);
  Application.CreateForm(TfmEditarLances, fmEditarLances);
  Application.CreateForm(TfmEditarProduccion, fmEditarProduccion);
  Application.CreateForm(TFmEditarSenasaEntera, FmEditarSenasaEntera);
  Application.CreateForm(TFmEditarSenasaCallos, FmEditarSenasaCallos);
  Application.CreateForm(TfmInformes, fmInformes);
  Application.CreateForm(TfmEditarRayas, fmEditarRayas);
  Application.Run;
end.

