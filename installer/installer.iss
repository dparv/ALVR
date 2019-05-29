; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define Launcher "..\ALVR\bin\Release\ALVR.exe"
#define ApplicationVersion GetStringFileInfo(Launcher, "ProductVersion")

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{1CF58A59-F188-42FA-ADE3-D58A50AE7149}
AppName=ALVR
AppVersion={#ApplicationVersion}
AppVerName=ALVR
AppPublisher=polygraphene
AppPublisherURL=https://github.com/polygraphene/ALVR
AppSupportURL=https://github.com/polygraphene/ALVR
AppUpdatesURL=https://github.com/polygraphene/ALVR
DefaultDirName={pf}\ALVR
DefaultGroupName=ALVR
LicenseFile=..\LICENSE
OutputDir=..\release-files
OutputBaseFilename=ALVR-setup-{#ApplicationVersion}
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x64
UninstallDisplayIcon={app}\ALVR.exe

[Dirs]
Name: "{app}"; 
Name: "{app}\logs"; Permissions: everyone-full

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\ALVR\bin\Release\ALVR.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\ALVR\bin\Release\MetroFramework.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\ALVR\bin\Release\MetroFramework.Fonts.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\ALVRFreePIE\bin\Release\ALVRFreePIE.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\CrashReport\bin\Release\CrashReport.exe"; DestDir: "{app}"; Flags: ignoreversion

Source: "..\driver\*"; DestDir: "{app}\driver\"; Flags: ignoreversion recursesubdirs createallsubdirs   

Source: "..\libswresample\lib\avutil-56.dll"; DestDir: "{app}\driver\bin\win64"; Flags: ignoreversion
Source: "..\libswresample\lib\swresample-3.dll"; DestDir: "{app}\driver\bin\win64"; Flags: ignoreversion

Source: "..\freepie-samples\*"; DestDir: "{app}\freepie-samples\"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "..\ALVRFreePIE\bin\Release\ALVRFreePIE.dll"; DestDir: "{pf32}\FreePIE\plugins"; Flags: ignoreversion; Check: DirExists(ExpandConstant('{pf32}\FreePIE\plugins'))
Source: "..\add_firewall_rules.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\remove_firewall_rules.bat"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\ALVR"; Filename: "{app}\ALVR.exe"

[UninstallDelete]
;This works only if it is installed in default location
Type: filesandordirs; Name: "{pf}\ALVR"

;This works if it is installed in custom location
Type: files; Name: "{app}\*"; 
Type: filesandordirs; Name: "{app}"

Type: files; Name: "{pf32}\FreePIE\plugins\ALVRFreePIE.dll"; 

[Run]
Filename: {app}\add_firewall_rules.bat; Parameters: "/s"; Flags: runhidden

[UninstallRun]
Filename: {app}\driver\driver_uninstall.bat; Parameters: "/s"; Flags: runhidden
Filename: {app}\remove_firewall_rules.bat; Parameters: "/s"; Flags: runhidden
