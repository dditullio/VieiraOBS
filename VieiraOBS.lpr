program VieiraOBS;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  sysutils, Forms, lazcontrols, datetimectrls, pl_zeosdbo, pl_rx,
  tachartlazaruspkg, pl_fortesreport, frmPrincipal, frLances, datGeneral,
  frmbase, frmlistabase, frmmareas, frmzedicionbase, DefaultTranslator,
  frmEditarMarea, frmrindes, frmeditarrindes, frmcoccion, frmeditarcoccion,
  frmmuestrasbiologicas, frmeditarmuestrasbiologicas, frmdanio, frmeditardanio,
  frmbycatch, datbycatch, frmeditarbycatch, datBase, frmeditardetallebycatch,
  frmtallas, dattallas, frmeditartallas, frmeditardetalletallas,
  frmeditarlances, frmlances, funciones, frmInformes, frmmuestrassenasa,
  frmrptdatospuente, frmeditarsenasacallos, lr_pdfexport, frmeditarsenasaentera,
  frmSplashScreenForm, UHojaCalc, frmmuestrasrayas, frmeditarrayas;

{$R *.res}

begin
  Application.Title:='Vieira OBS';
  RequireDerivedFormResource := True;
  DecimalSeparator:='.';
  Application.Initialize;
  ShowSplashScreen;
  SetSplashScreenStatus( 'Iniciando...' );
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.CreateForm(TdmGeneral, dmGeneral);
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
  Application.CreateForm(TfmEditarSenasaCallos, fmEditarSenasaCallos);
  Application.CreateForm(TFmEditarSenasaEntera, FmEditarSenasaEntera);
  Application.CreateForm(TfmInformes, fmInformes);
  Application.CreateForm(TfmEditarRayas, fmEditarRayas);
  Application.Run;
end.

