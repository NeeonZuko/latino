﻿; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

<<<<<<< HEAD
#define   MyAppName                   "Latino"
; #define   MyAppVersion                "1.3.0"
#define   MyAppVersion                GetFileVersion ("..\..\build\src\Release\latino.exe")
#define   MyAppPublisher              "LenguajeLatino.org"
#define   MyAppURL                    "http://lenguajelatino.org/"
#define   MyAppSupURL                 "https://manual-latino.readthedocs.io/es/latest/"
#define   MyAppUpURL                  "https://github.com/lenguaje-latino/latino"
#define   MyAppExeName                "latino.exe"
=======
#define MyAppName "Latino"
#define MyAppVersion "1.3.0"
;#define MyAppVersion GetFileVersion ("..\..\build\src\Debug\latino.exe")
#define MyAppPublisher "LenguajeLatino.org"
#define MyAppURL "http://lenguajelatino.org/"
#define MyAppSupURL "https://manual-latino.readthedocs.io/es/latest/"
#define MyAppUpURL "https://github.com/lenguaje-latino/latino"
#define MyAppExeName "latino.exe"
>>>>>>> origin/master

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
;AppId={{AEE516F8-BE55-4E38-987C-16C66C02DA82}
AppId                             =   {{887BAB8B-D5EC-4D62-8224-DC99F3629CB4}
AppName                           =   {#MyAppName}
AppVersion                        =   {#MyAppVersion}
AppVerName                        =   {#MyAppName} {#MyAppVersion}
AppPublisher                      =   {#MyAppPublisher}
AppPublisherURL                   =   {#MyAppURL}
AppSupportURL                     =   {#MyAppSupURL}
AppUpdatesURL                     =   {#MyAppSupURL}
AppComments                       =   Lenguaje de Programación con sintaxis en Español
AppCopyright                      =   Copyleft (ɔ) 2015-2020 Lenguaje Latino
DefaultDirName                    =   {autopf}\{#MyAppName}
DisableProgramGroupPage           =   yes
DefaultGroupName                  =   {#MyAppName}
LicenseFile                       =   ..\Win32\bin\licencia.rtf
InfoBeforeFile                    =   ..\Win32\bin\leeme.rtf
OutputDir                         =   ..\Win32
OutputBaseFilename                =   {#MyAppName}-{#MyAppVersion}-Win
SetupIconFile                     =   ..\Win32\bin\latinoInstaller.ico
Compression                       =   lzma
; SignTool                          =
SolidCompression                  =   yes
ChangesEnvironment                =   yes
VersionInfoVersion                =   {#MyAppVersion}
VersionInfoDescription            =   "Instalador de Latino" 
DisableWelcomePage                =   no
; WizardStyle                       =   modern
WizardImageFile                   =   ..\Win32\bin\startSetup.bmp
WizardSmallImageFile              =   ..\Win32\bin\SmallImg.bmp
ArchitecturesInstallIn64BitMode   =   x64

[Messages]
BeveledLabel                      =   Instalador Lenguaje Latino

[CustomMessages]
AppAddPath                        =   Agregar aplicacion a la variable de entorno PATH (requerido)
WebHint                           =   Pagína Web
GitHubHint                        =   Repositorio de Latino
ManualHint                        =   Manual Latino

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Files]
<<<<<<< HEAD
Source: "..\Win32\bin\web-icon.bmp";                                                      Flags: dontcopy
Source: "..\Win32\bin\github-icon.bmp";                                                   Flags: dontcopy
Source: "..\Win32\bin\manual-icon.bmp";                                                   Flags: dontcopy
; Source: "..\Win32\bin\isdonate.bmp";                                                      Flags: dontcopy
Source: "..\..\build\src\Release\*";                    DestDir: "{app}\bin";             Flags: ignoreversion
Source: "..\..\build\src\regex-2.7-src\src\Release\*";  DestDir: "{app}\lib";             Flags: ignoreversion
Source: "..\..\build\src\linenoise\Release\*";          DestDir: "{app}\lib";             Flags: ignoreversion
Source: "..\..\include\*.h";                            DestDir: "{app}\include";         Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\Win32\bin\latino.ico";                      DestDir: "{app}\bin";             Flags: ignoreversion
Source: "..\Win32\bin\*.rtf";                           DestDir: "{app}";                 Flags: ignoreversion
Source: "..\Win32\bin\manual.url";                      DestDir: "{app}";                 Flags: ignoreversion
Source: "..\Win32\lib\*";                               DestDir: "{app}\lib";             Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\Win32\System32\*.dll";                      DestDir: "C:\Windows\System32";   Flags: onlyifdoesntexist recursesubdirs
Source: "..\Win32\sysWow64\*.dll";                      DestDir: "C:\Windows\SysWOW64";   Flags: onlyifdoesntexist recursesubdirs
=======
Source: "..\Win32\bin\web-icon.bmp"; Flags: dontcopy
Source: "..\Win32\bin\github-icon.bmp"; Flags: dontcopy
Source: "..\Win32\bin\manual-icon.bmp"; Flags: dontcopy
;Source: "..\Win32\bin\isdonate.bmp"; Flags: dontcopy
Source: "..\..\build\src\Debug\*"; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "..\..\build\src\regex-2.7-src\src\Debug\*"; DestDir: "{app}\lib"; Flags: ignoreversion
Source: "..\..\build\src\linenoise\Debug\*"; DestDir: "{app}\lib"; Flags: ignoreversion
Source: "..\..\include\*.h"; DestDir: "{app}\include"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\Win32\bin\latino.ico"; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "..\Win32\bin\*.rtf"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Win32\bin\manual.url"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Win32\lib\*"; DestDir: "{app}\lib"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\Win32\System32\*.dll"; DestDir: "C:\Windows\System32"; Flags: onlyifdoesntexist recursesubdirs
Source: "..\Win32\sysWow64\*.dll"; DestDir: "C:\Windows\SysWOW64"; Flags: onlyifdoesntexist recursesubdirs
>>>>>>> origin/master
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}";                           Filename: "{app}\bin\{#MyAppExeName}"; IconFilename: "{app}\bin\latino.ico"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}";     Filename: "{uninstallexe}"
Name: "{group}\Manual Latino";                          Filename: "{app}\manual.url"

[Run]
Filename: "{app}\bin\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\bin;{app}\lib"
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "LATINO_PATH";  ValueData: "{app}";         Flags: preservestringtype
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "LATINO_LIBC";  ValueData: "{app}\lib\";    Flags: preservestringtype
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "LATINO_LIB";   ValueData: "{app}\stdlib\"; Flags: preservestringtype

[Tasks]
Name: modifypath; Description:{cm:AppAddPath};

[Code]
//procedure InitializeWizard();
//begin
//  MsgBox('Hola mundo', mbConfirmation, MB_OK);
//  if FileExists(ExpandConstant('{app}\bin\latino.exe')) then begin
//    MsgBox('Ya existe una versión de Latino en su sistema, ¿Desea continuar?', mbConfirmation, MB_YESNO);
//  end;
//end;
function NextButtonClick(PageId: Integer): Boolean;
begin
  Result := True;
  if (PageId = wpSelectDir) and FileExists(ExpandConstant('{app}\bin\latino.exe')) then begin
    Result :=False;
    if MsgBox('Latino ya se encuentra instalado en su sistema. Si prosigue con la instalación, la versión de Latino instalada será reemplazada.', mbConfirmation, MB_YESNO) = IDYES then begin
      Result := True;
    end;
  end;
end;
//------------
const
    ModPathName = 'modifypath';
    ModPathType = 'system';

function ModPathDir(): TArrayOfString;
begin
    setArrayLength(Result, 1)
    Result[0] := ExpandConstant('{app}');
end;

#include "modpath.iss"
#include "iconos.iss"