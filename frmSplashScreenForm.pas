{ ----------------------------------------------------------------------------
    Copyright (C) 2005-2010 Jeroen Commandeur and Paul-Jan Pauptit

    This file is part of DeleD CE (Community Edition)

    DeleD CE is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Deled CE is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Deled CE. If not, see <http://www.gnu.org/licenses/>.
  ---------------------------------------------------------------------------- }
unit frmSplashScreenForm;

{$MODE Delphi}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type

  { TSplashScreenForm }

  TSplashScreenForm = class(TForm)
    imgSplash: TImage;
    lblInfo: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    procedure FadeOut;
  public
    procedure Hide;
  end;

// Convenience methods for hiding the actual splash screen handling (conditional on defines) from any user code
procedure ShowSplashScreen;
procedure HideSplashScreen;
procedure SetSplashScreenStatus(const aMessage: string);

implementation

{$R *.lfm}

//uses
//    unit_VersionInfo;

var
    splashScreen: TSplashScreenForm;

procedure ShowSplashScreen;
begin
    splashScreen := TSplashScreenForm.Create(Application);
    splashScreen.Show;
    splashScreen.Update;
end;

procedure HideSplashScreen;
begin
    if Assigned(splashScreen) then begin
        splashScreen.Hide;
        splashScreen := nil;
    end;
end;

procedure SetSplashScreenStatus(const aMessage: string);
begin
    if Assigned(splashScreen) then begin
        splashScreen.lblInfo.Caption := 'Vieira OBS ' + ' - ' + aMessage;
        splashScreen.Update;
    end;
end;

// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------

procedure TSplashScreenForm.FormCreate(Sender: TObject);
begin
    lblInfo.Caption :='Iniciando...';

    ClientWidth := imgSplash.Width;
    ClientHeight := imgSplash.Height;

    AlphaBlend := TRUE;
end;

procedure TSplashScreenForm.FadeOut;
var startTime: cardinal;
    difference: integer;
    value: integer;
    isVisible: Boolean;

begin
    startTime := GetTickCount;
    isVisible := TRUE;
    while isVisible do begin
        difference := GetTickCount - startTime;
        value := 255 - difference div 2;

        if value < 0 then begin
            isVisible := FALSE;
            value := 0;
        end;

        AlphaBlendValue := value;
    end;
end;

procedure TSplashScreenForm.hide;
begin
    FadeOut;
    inherited Hide;
    Release;
end;


end.
