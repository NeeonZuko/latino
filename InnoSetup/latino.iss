<<<<<<< HEAD
; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Latino"
#define MyAppVersion "1.1.0"
#define MyAppPublisher "Lenguaje Latino"
#define MyAppURL "http://lenguaje-latino.org/"
#define MyAppManual "https://manuallatino.blogspot.com"
=======
﻿; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Latino"
#define MyAppVersion "1.2.0"
#define MyAppPublisher "Lenguaje-Latino.org"
#define MyAppURL "http://lenguaje-latino.org/"
#define MyAppSupURL "http://manuallatino.blogspot.com"
#define MyAppUpURL "https://github.com/lenguaje-latino/latino"
>>>>>>> 11336ac9485c6d839841852720d6c6d0098511a2
#define MyAppExeName "latino.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{887BAB8B-D5EC-4D62-8224-DC99F3629CB4}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
<<<<<<< HEAD
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppManual}
AppUpdatesURL={#MyAppURL}
=======
AppVerName={#MyAppName}-{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppSupURL}
AppUpdatesURL={#MyAppUpURL}
AppComments=Lenguaje de Programacion Latino
AppCopyright=copyleft (ɔ) 2020 {#MyAppName} {#MyAppPublisher}
>>>>>>> 11336ac9485c6d839841852720d6c6d0098511a2
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile="..\LICENSE.txt"
OutputDir="..\InnoSetup"
<<<<<<< HEAD
OutputBaseFilename=setup
=======
OutputBaseFilename={#MyAppName}-{#MyAppVersion}-Win
>>>>>>> 11336ac9485c6d839841852720d6c6d0098511a2
SetupIconFile="..\InnoSetup\bin\latino.ico"
Compression=lzma
SolidCompression=yes
ChangesEnvironment=yes

[CustomMessages]
AppAddPath=Agregar aplicacion a la variable de entorno PATH (requerido)

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\InnoSetup\bin\*"; DestDir: "{app}\bin\"; Flags: ignoreversion
Source: "..\InnoSetup\lib\*"; DestDir: "{app}\lib\"; Flags: ignoreversion
<<<<<<< HEAD
Source: "..\build\src\Release\*"; DestDir: "{app}\bin\"; Flags: ignoreversion
Source: "..\build\src\regex-2.7-src\src\Release\*"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\build\src\linenoise\Release\*"; DestDir: "{app}\lib\"; Flags: ignoreversion
=======
Source: "..\visualstudio\src\Debug\*"; DestDir: "{app}\bin\"; Flags: ignoreversion
Source: "..\visualstudio\src\regex-2.7-src\src\Debug\*"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\visualstudio\src\linenoise\Debug\*"; DestDir: "{app}\lib\"; Flags: ignoreversion
>>>>>>> 11336ac9485c6d839841852720d6c6d0098511a2
Source: "..\include\*.h"; DestDir: "{app}\include\"; Flags: ignoreversion
;Source: "..\ejemplos\*"; DestDir: "{app}\ejemplos\"; Flags: ignoreversion recursesubdirs createallsubdirs

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\bin\{#MyAppExeName}"; IconFilename: "{app}\bin\latino.ico"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\bin\{#MyAppExeName}"; IconFilename: "{app}\bin\latino.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\bin\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\bin;{app}\lib"
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "LATINO_PATH"; ValueData: "{app}"; Flags: preservestringtype
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "LATINO_LIBC"; ValueData: "{app}\lib\"; Flags: preservestringtype
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "LATINO_LIB"; ValueData: "{app}\stdlib\"; Flags: preservestringtype

[Tasks]
Name: modifypath; Description:{cm:AppAddPath};

[Code]
const
    ModPathName = 'modifypath';
    ModPathType = 'system';

function ModPathDir(): TArrayOfString;
begin
    setArrayLength(Result, 1)
    Result[0] := ExpandConstant('{app}');
end;

#include "modpath.iss"
