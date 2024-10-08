;NSIS Modern User Interface
;Start Menu Folder Selection Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "Vieira OBS"
  OutFile "InstalarVieiraOBS.exe"

  ;Default installation folder
  InstallDir "$DOCUMENTS\INIDEP\Vieira OBS"
  
  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\INIDEP\Vieira OBS" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel highest

;--------------------------------
;Variables

  Var StartMenuFolder

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
;Para insertar un aviso de licencia descomentar la siguiente línea y configurar la ruta del txt
;  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
;  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  
  ;Start Menu Folder Page Configuration
  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\INIDEP" 
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"
  
  !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder
  
  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

Function .onInit
  MessageBox MB_YESNO|MB_ICONEXCLAMATION "ATENCIÓN$\nSi usted está actualizando la aplicación a una nueva versión, recuerde haber realizado previamente una copia de seguridad.$\nLa instalación eliminará todo el contenido de la base de datos. Al finalizar la instalación usted podrá restaurar la copia de seguridad.$\n$\n¿Desea continuar con la instalación en este momento?" IDYES true IDNO false
  true:
	Goto next
  false:
  Quit
  next:  
FunctionEnd
 
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "Spanish"
;  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "Aplicación" SecApp

  SetOutPath "$INSTDIR"
  
  ;ADD YOUR OWN FILES HERE...
  File "VieiraOBS.exe"
  File "libmysql.dll"
  File "libmysqld.dll"
  File "libmysqlclient.so.18.0.0"
  File "Manual\Vieira OBS V1.0 - Manual de usuario.pdf"
  File /r "es"
  File /r "PlanillasExcel"
  
  ;Store installation folder
  WriteRegStr HKCU "Software\INIDEP\Vieira OBS" "" $INSTDIR
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    
  !ifndef NO_STARTMENUSHORTCUTS
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Vieira OBS.lnk" "$INSTDIR\VieiraOBS.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Desinstalar Vieira OBS.lnk" "$INSTDIR\Uninstall.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Vieira OBS.lnk" "$INSTDIR\VieiraOBS.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Vieira OBS - Manual.lnk" "$INSTDIR\Vieira OBS V1.0 - Manual de usuario.pdf"
  !endif
    CreateShortCut "$DESKTOP\Vieira OBS - Manual.lnk" "$INSTDIR\Vieira OBS V1.0 - Manual de usuario.pdf"
    CreateShortCut "$DESKTOP\Vieira OBS.lnk" "$INSTDIR\VieiraOBS.exe"
  
  !insertmacro MUI_STARTMENU_WRITE_END
 
SectionEnd

Section "Base de datos" SecDB

  SetOutPath "$INSTDIR"
  
  RMDir /r "$INSTDIR\DB_Vieira"

  ;ADD YOUR OWN FILES HERE...
  File /r DB_Vieira

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecApp ${LANG_SPANISH} "Aplicación"
  LangString DESC_SecDB ${LANG_SPANISH} "Base de datos"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecApp} $(DESC_SecApp)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDB} $(DESC_SecDB)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
 
;--------------------------------

;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...
  Delete /REBOOTOK "$INSTDIR\VieiraOBS.exe"
  Delete /REBOOTOK "$INSTDIR\Vieira OBS V1.0 - Manual de usuario.pdf"
  Delete /REBOOTOK "$INSTDIR\libmysql.dll"
  Delete /REBOOTOK "$INSTDIR\libmysqld.dll"
  Delete /REBOOTOK "$INSTDIR\libmysqlclient.so.18.0.0"
  RMDir /r /REBOOTOK "$INSTDIR\PlanillasExcel"
  RMDir /r /REBOOTOK "$INSTDIR\es"
  RMDir /r /REBOOTOK "$LOCALAPPDATA\Vieira OBS"
  RMDir /r /REBOOTOK "$LOCALAPPDATA\VieiraOBS"

  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"
  
  RMDir "$INSTDIR"
  
  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder
    
  Delete "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk"
  Delete "$SMPROGRAMS\$StartMenuFolder\Vieira OBS.lnk"
  Delete "$DESKTOP\Vieira OBS.lnk"
  Delete "$DESKTOP\Vieira OBS - Manual.lnk"
  RMDir /r "$SMPROGRAMS\$StartMenuFolder"
  
;  DeleteRegKey /ifempty HKCU "Software\INIDEP\Vieira OBS"
  DeleteRegKey  HKCU "Software\INIDEP\Vieira OBS"

SectionEnd
