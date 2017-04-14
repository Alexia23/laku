# Languages

LoadLanguageFile "${NSISDIR}\Contrib\Language files\English.nlf"

!define /date date "%H:%M %d %b, %Y"

# Program Details

Caption "${PORTABLEAPPNAME} | ${COMPANYNAME}"
VIProductVersion "${APPVER}"
VIAddVersionKey /LANG=1033 "ProductName" "${APPNAME}"
VIAddVersionKey /LANG=1033 "CompanyName" "${COMPANYNAME}"
VIAddVersionKey /LANG=1033 "LegalCopyright" "${COPYRIGHT}"
VIAddVersionKey /LANG=1033 "LegalTrademarks" "${LEGALTRADEMARKS}"
VIAddVersionKey /LANG=1033 "FileDescription" "${PORTABLEAPPNAME}"
VIAddVersionKey /LANG=1033 "FileVersion" "${APPVER}"
VIAddVersionKey /LANG=1033 "ProductVersion" "${VER}"
VIAddVersionKey /LANG=1033 "InternalName" "${APPNAME}"
VIAddVersionKey /LANG=1033 "OriginalFilename" "${APPNAME}.exe"
VIAddVersionKey /LANG=1033 "File Name" "${APPNAME}.exe"
VIAddVersionKey /LANG=1033 "Comments" "Allows ${APPNAME} to be run from a removable drive."
VIAddVersionKey /LANG=1033 "Last Compile" "${date}"
VIAddVersionKey /LANG=1033 "Language" "English"
VIAddVersionKey /LANG=1033 "PrivateBuild" "${COMPANYNAME}"
VIAddVersionKey /LANG=1033 "SpecialBuild" "${WEBSITE}"
VIAddVersionKey /LANG=1033 "BuildDate" "${__TIMESTAMP__}"
VIAddVersionKey /LANG=1033 "Publisher" "${COMPANYNAME}"

#  Runtime Switches

XPStyle on
CRCCheck On 
WindowIcon Off
!ifndef CUSTOMUI & NOUI
	SilentInstall silent
!endif
!ifdef CUSTOMUI & NOUI
	!error "both CUSTOMUI and NOUI are defined"
!endif
!ifdef CUSTOMUI | NOUI
	SubCaption 3 " "
	SubCaption 4 " "
	CompletedText " "
!endif
!ifdef CUSTOMUI
	ChangeUI all Include\customUI.bin
!endif
!ifdef NOUI
	ChangeUI all Include\noUI.bin
!endif
AutoCloseWindow true
!ifndef RUNASADMIN
	RequestExecutionLevel user
!else
	RequestExecutionLevel admin
!endif

#  Includes

!include "TextFunc.nsh"
!include "FileFunc.nsh"
!include "LogicLib.nsh"
!include "x64.nsh"
!include "Include\SystemMessageBox.nsh"

!insertmacro GetParameters
!insertmacro GetRoot 
!insertmacro GetDrives
!insertmacro GetOptions

#  Default Variables

Var PROGRAMDIR
!ifdef APPDIR64
	Var PROGRAMDIR64
!endif
Var PROGRAMEXE
!ifdef APPEXE64
	Var PROGRAMEXE64
!endif
Var PROGRAMSWITCH
Var DEFAULTDATA
Var SETTINGSDIR
var DATADIR
var SYSDIRECTORY
Var PARAMETERS
Var PARENTDIR
Var ROOTDIR
Var LASTDRIVE
Var LASTDIR
Var LANGID
Var TEMPDIR
Var ARCHITECTURE
Var COMPUTERID

Function DefaultVar
	# Set Program Directory

	StrCpy $PROGRAMDIR "$EXEDIR\${APPDIR}"

	# Set Program Directory (x64)

	!ifdef APPDIR64
		StrCpy $PROGRAMDIR64 "$EXEDIR\${APPDIR64}"
	!endif

	# Set Program Executable

	StrCpy $PROGRAMEXE "${APPEXE}"

	# Set Program Executable (x64)

	!ifdef APPEXE64
		StrCpy $PROGRAMEXE64 "${APPEXE64}"
	!endif

	# Set Program Switch

	!ifdef APPSWITCH
		StrCpy $PROGRAMSWITCH "${APPSWITCH}"
	!else
		StrCpy $PROGRAMSWITCH ""
	!endif

	# Set Default Data

	StrCpy $DEFAULTDATA "$EXEDIR\App\DefaultData"

	# Set Settings Directory

	StrCpy $SETTINGSDIR "$EXEDIR\Data\Settings"
	StrCpy $DATADIR "$EXEDIR\Data"
	StrCpy $SYSDIRECTORY '$EXEDIR\App\SysDir'

	# Get any passed parameters and set Parameters

	${GetParameters} $PARAMETERS

	# Get and set Parent Directory

	${GetParent} "$EXEDIR" $PARENTDIR

	# Get root directory and set Root Directory and Last Drive

	${GetRoot} "$EXEDIR" $ROOTDIR
	ReadINIStr $LASTDRIVE "$EXEDIR\Data\${APP} Portable.ini" "${APP} Portable" "LastDrive"

	# Set Last Directory

	ReadINIStr $LASTDIR "$EXEDIR\Data\${APP} Portable.ini" "${APP} Portable" "LastDirectory"

	# Set User Default Lang

	System::Call `kernel32::GetUserDefaultLangID() i .r0`
	StrCpy $LANGID $0

	# Set Portable App Temp

	StrCpy $TEMPDIR "$TEMP\${APP}PortableTemp"

	# Set Architecture

	System::Call `kernel32::GetCurrentProcess()i.s`
	System::Call `kernel32::IsWow64Process(is,*i.s)`
	Pop $0
	StrCmp $0 "0" "" +2
		StrCpy $ARCHITECTURE "x86"
	StrCmp $0 "1" "" +2
		StrCpy $ARCHITECTURE "x64"

	# Set Computer ID 

	${GetRoot} "$WINDIR" $0
	System::Call `kernel32::GetVolumeInformation(t,t,i,*i,*i,*i,t,i) i("$0\",,${NSIS_MAX_STRLEN},.r1,,,,${NSIS_MAX_STRLEN})` ; get computer id
	StrCpy $COMPUTERID $1

	# Set Program Switch

	!ifdef APPSWITCH
		StrCpy $PROGRAMSWITCH `${APPSWITCH}`
	!else
		StrCpy $PROGRAMSWITCH ""
	!endif

	!ifdef CUSTOMUI
		w7tbp::Start
	!endif
FunctionEnd

Var RUNTIMEDATA
Function RuntimeData
	CreateDirectory "$DATADIR"

		FileOpen $0 "$DATADIR\${APP} Portable RuntimeData.ini" w 
		FileWriteWord $0 0xfeff ; Write the BOM
		FileWriteUTF16LE $0 `[Launcher]`
		FileWriteWord $0 "13"
		FileWriteWord $0 "10"
		FileWriteUTF16LE $0 `$\r$\n[Activate]`
		FileWriteWord $0 "13"
		FileWriteWord $0 "10"
		FileWriteUTF16LE $0 `$\r$\n[FilesMove]`
		FileWriteWord $0 "13"
		FileWriteWord $0 "10"
		FileWriteUTF16LE $0 `$\r$\n[DirectoryMove]`
		FileWriteWord $0 "13"
		FileWriteWord $0 "10"
		FileWriteUTF16LE $0 `$\r$\n[FilesCleanup]`
		FileWriteWord $0 "13"
		FileWriteWord $0 "10"
		FileWriteUTF16LE $0 `$\r$\n[RemoveIfEmptyDirectory]`
		FileWriteWord $0 "13"
		FileWriteWord $0 "10"
		FileWriteUTF16LE $0 `$\r$\n[RemoveIfEmptyFiles]`
		FileClose $0

		WriteINIStr "$DATADIR\${APP} Portable.ini" "${APP} Portable" "LastDrive" "$ROOTDIR" ; store current drive letter
		WriteINIStr "$DATADIR\${APP} Portable.ini" "${APP} Portable" "LastDirectory" "$EXEDIR" ; store current directory
	SetFileAttributes "$DATADIR\${APP} Portable.ini" HIDDEN
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Launcher" "PluginsDir" "$PLUGINSDIR" ; store plugins dir
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Launcher" "Status" "running" ; store status

		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Launcher" "ProgramExecutable" "${APPDIR}\${APPEXE}"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Launcher" "WorkingDirectory" "${APPDIR}"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Launcher" "SinglePortableAppInstance" "true"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Launcher" "DirectoryMoveOK" "yes"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Launcher" "SupportsUNC" "yes"

		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Activate" "Registry" "true"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Activate" "RegistryCopyKeys" "true"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Activate" "RegistryCleanupForce" "true"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Activate" "RegistryCleanupIfEmpty" "true"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Activate" "RegistryValueBackupDelete" "true"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "FilesMove" "FilesMove" "true"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "DirectoryMove" "DirectoryMove" "true"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "FilesCleanup" "FilesCleanup" "true"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "RemoveIfEmptyDirectory" "RemoveIfEmptyDirectory" "true"
		WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "RemoveIfEmptyFiles" "RemoveIfEmptyFiles" "true"
	FileOpen $RUNTIMEDATA "$DATADIR\${APP} Portable RuntimeData.ini" r ; lock file!
FunctionEnd

# Registry 

!ifdef REGKEY1 | REGKEYVALUE1
!define registry::BackupKey `!insertmacro registry::BackupKey`
!macro registry::BackupKey _PATH
	registry::_DeleteKey /NOUNLOAD `${_PATH}-BackupBy${APP} Portable`
	Pop $R0
	registry::_KeyExists /NOUNLOAD `${_PATH}-BackupBy${APP} Portable`
	Pop $R0
	StrCmp $R0 "0" -2 +1
	registry::_MoveKey /NOUNLOAD `${_PATH}` `${_PATH}-BackupBy${APP} Portable`
	Pop $R0
	registry::_KeyExists /NOUNLOAD `${_PATH}`
	Pop $R0
	StrCmp $R0 "0" -2 +1
!macroend

!define registry::RestoreBackupKey `!insertmacro registry::RestoreBackupKey`
!macro registry::RestoreBackupKey _PATH
	registry::_DeleteKey /NOUNLOAD `${_PATH}`
	Pop $R0
	registry::_KeyExists /NOUNLOAD `${_PATH}`
	Pop $R0
	StrCmp $R0 "0" -2 +1
	registry::_MoveKey /NOUNLOAD `${_PATH}-BackupBy${APP} Portable` `${_PATH}`
	Pop $R0
	registry::_KeyExists /NOUNLOAD `${_PATH}-BackupBy${APP} Portable`
	Pop $R0
	StrCmp $R0 "0" -2 +1
!macroend

!define registry::BackupValue `!insertmacro registry::BackupValue`
!macro registry::BackupValue _PATH _VALUE
	registry::_DeleteValue /NOUNLOAD `${_PATH}` `${_VALUE}-BackupBy${APP} Portable`
	Pop $R0
	registry::_MoveValue /NOUNLOAD `${_PATH}` `${_VALUE}` `${_PATH}` `${_VALUE}-BackupBy${APP} Portable`
	Pop $R0
!macroend

!define registry::RestoreBackupValue `!insertmacro registry::RestoreBackupValue`
!macro registry::RestoreBackupValue _PATH _VALUE
	registry::_DeleteValue /NOUNLOAD `${_PATH}` `${_VALUE}`
	Pop $R0
	registry::_MoveValue /NOUNLOAD `${_PATH}` `${_VALUE}-BackupBy${APP} Portable` `${_PATH}` `${_VALUE}`
	Pop $R0
!macroend
!include Registry.nsh
!endif

#  Directories

!ifdef LOCALDIR1
!define directory::BackupLocal `!insertmacro directory::BackupLocal`
!macro directory::BackupLocal _LOCALDIR _SUBDIR
	RMDir "/r" "${_LOCALDIR}${_SUBDIR}-BackupBy${APP} Portable"
	Rename "${_LOCALDIR}${_SUBDIR}" "${_LOCALDIR}${_SUBDIR}-BackupBy${APP} Portable"
!macroend

!define directory::RestorePortable `!insertmacro directory::RestorePortable`
!macro directory::RestorePortable _PORTABLEDIR _DEFAULTPORTABLEDIR _LOCALDIR _SUBDIR
	IfFileExists "${_PORTABLEDIR}\*.*" +4
	IfFileExists "${_DEFAULTPORTABLEDIR}\*.*" 0 +5
	CreateDirectory "${_PORTABLEDIR}"
	CopyFiles /SILENT "${_DEFAULTPORTABLEDIR}\*.*" "${_PORTABLEDIR}"
	CreateDirectory "${_LOCALDIR}${_SUBDIR}"
	CopyFiles /SILENT "${_PORTABLEDIR}\*.*" "${_LOCALDIR}${_SUBDIR}"
!macroend

!define directory::BackupPortable `!insertmacro directory::BackupPortable`
!macro directory::BackupPortable _PORTABLEDIR _LOCALDIR _SUBDIR
	RMDir "/r" "${_PORTABLEDIR}"
	CreateDirectory "${_PORTABLEDIR}"
	CopyFiles /SILENT "${_LOCALDIR}${_SUBDIR}\*.*" "${_PORTABLEDIR}"
!macroend

!define directory::RestoreLocal `!insertmacro directory::RestoreLocal`
!macro directory::RestoreLocal _LOCALDIR _SUBDIR
	RMDir "/r" "${_LOCALDIR}${_SUBDIR}"
	Rename "${_LOCALDIR}${_SUBDIR}-BackupBy${APP} Portable" "${_LOCALDIR}${_SUBDIR}"
	RMDir "${_LOCALDIR}"
!macroend
!endif

#  Files

!ifdef LOCALFILE1 | LOCALSYSTEMFILE1 | PORTABLESYSTEMFILE1
!define file::BackupLocal `!insertmacro file::BackupLocal`
!macro file::BackupLocal _LOCALFILE
	Delete "${_LOCALFILE}.BackupBy${APP} Portable"
	Rename "${_LOCALFILE}" "${_LOCALFILE}.BackupBy${APP} Portable"
!macroend

!define file::RestorePortable `!insertmacro file::RestorePortable`
!macro file::RestorePortable _PORTABLEFILE _DEFAULTPORTABLEFILE _LOCALFILE
	IfFileExists "${_PORTABLEFILE}" +4
	IfFileExists "${_DEFAULTPORTABLEFILE}" 0 +4
CreateDirectory "$EXEDIR\Data" ;bug if not root
	CopyFiles /SILENT "${_DEFAULTPORTABLEFILE}" "${_PORTABLEFILE}"
	Rename  "${_PORTABLEFILE}" "${_LOCALFILE}"
!macroend

!define file::BackupPortable `!insertmacro file::BackupPortable`
!macro file::BackupPortable _PORTABLEFILE _LOCALFILE
CreateDirectory "$EXEDIR\Data"
	Delete "${_PORTABLEFILE}" 
	Rename "${_LOCALFILE}" "${_PORTABLEFILE}"
!macroend

!define file::RestoreLocal `!insertmacro file::RestoreLocal`
!macro file::RestoreLocal _LOCALFILE
	Delete "${_LOCALFILE}"
	Rename "${_LOCALFILE}.BackupBy${APP} Portable" "${_LOCALFILE}"
!macroend

# Files Move

!define file::Move `!insertmacro file::Move`
!macro file::Move _PORTABLEFILE _DEFAULTFILE _LOCALFILE
	IfFileExists `${_PORTABLEFILE}` +4
	IfFileExists `${_DEFAULTFILE}` 0 +4
	CreateDirectory `$EXEDIR\Data`
	CopyFiles /Silent `${_DEFAULTFILE}` `${_PORTABLEFILE}`
	Rename `${_PORTABLEFILE}` `${_LOCALFILE}`
!macroend
!define file::RestoreMove `!insertmacro file::RestoreMove`
!macro file::RestoreMove _PORTABLEFILE _LOCALFILE
	Delete `${_PORTABLEFILE}` 
	Rename `${_LOCALFILE}` `${_PORTABLEFILE}`
!macroend

# System Files

!define file::CopyPortable `!insertmacro file::CopyPortable`
!macro file::CopyPortable _PORTABLEFILE _LOCALFILE
	CopyFiles /SILENT "${_PORTABLEFILE}" "${_LOCALFILE}"
!macroend

!define file::Share `!insertmacro file::Share`
!macro file::Share _FILE
	WriteRegDWORD HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDlls" "${_FILE}" 0x1
!macroend

!define file::UnShare `!insertmacro file::UnShare`
!macro file::UnShare _FILE
	IfFileExists "${_FILE}.BackupBy${APP} Portable" +2
	DeleteRegValue HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDlls" "${_FILE}"
!macroend

!endif

# DLL

!ifdef LOCALDLL1 | PORTABLEDLL1
!define dll::UnRegLocal `!insertmacro dll::UnRegLocal`
!macro dll::UnRegLocal _LOCALDLL
	IfFileExists "${_LOCALDLL}" 0 +2
	UnRegDLL "${_LOCALDLL}"
!macroend

!define dll::RegPortable `!insertmacro dll::RegPortable`
!macro dll::RegPortable _PORTABLEDLL
	RegDLL "${_PORTABLEDLL}"
	WriteRegDWORD HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDlls" "${_PORTABLEDLL}" 0x1
!macroend

!define dll::UnRegPortable `!insertmacro dll::UnRegPortable`
!macro dll::UnRegPortable _PORTABLEDLL
	DeleteRegValue HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDlls" "${_PORTABLEDLL}"
	UnRegDLL "${_PORTABLEDLL}"
!macroend

!define dll::RegLocal `!insertmacro dll::RegLocal`
!macro dll::RegLocal _LOCALDLL
	IfFileExists "${_LOCALDLL}" 0 +2
	RegDLL "${_LOCALDLL}"
!macroend
!endif

# Services

!ifdef SRC1
!define src::DelLocal `!insertmacro src::DelLocal`
!macro src::DelLocal _SRC _LOCALSRC
	IfFileExists "${_LOCALSRC}" 0 +3
	SimpleSC::StopService "${_SRC}"
	SimpleSC::RemoveService "${_SRC}"
!macroend

!define src::CreatePortable `!insertmacro src::CreatePortable`
!macro src::CreatePortable _SRC _SRCNAME _TYPESRC _STARTSRC _PORTABLESRC
	  SimpleSC::InstallService "${_SRC}" "${_SRCNAME}" "${_TYPESRC}" "${_STARTSRC}" "${_PORTABLESRC}" "" "" ""
	  SimpleSC::StartService "${_SRC}" ""
!macroend

!define src::DelPortable `!insertmacro src::DelPortable`
!macro src::DelPortable _SRC
	SimpleSC::StopService "${_SRC}"
	SimpleSC::RemoveService "${_SRC}"
!macroend

!define src::CreateLocal `!insertmacro src::CreateLocal`
!macro src::CreateLocal _SRC _SRCNAME _TYPESRC _STARTSRC _LOCALSRC
	IfFileExists "${_LOCALSRC}" 0 +2
	  SimpleSC::InstallService "${_SRC}" "${_SRCNAME}" "${_TYPESRC}" "${_STARTSRC}" "${_LOCALSRC}" "" "" ""
!macroend
!endif

# VC

!ifdef VC1
!define vc::CopyLocal `!insertmacro vc::CopyLocal`
!macro vc::CopyLocal _VC _VCP
	IfFileExists "$WINDIR\WinSxS\${_VC}\*.*" +8
	WriteINIStr "$EXEDIR\Data\${APP} Portable.ini" "${APP} Portable" "${_VC}" "false"
	CopyFiles /SILENT "$EXEDIR\App\WinSxS\Manifests\${_VC}.manifest" "$WINDIR\WinSxS\Manifests"
	CopyFiles /SILENT "$EXEDIR\App\WinSxS\Manifests\${_VC}.cat" "$WINDIR\WinSxS\Manifests"
	CreateDirectory "$WINDIR\WinSxS\${_VC}"
	CopyFiles /SILENT "$EXEDIR\App\WinSxS\${_VC}\*.*" "$WINDIR\WinSxS\${_VC}"
	CreateDirectory "$WINDIR\WinSxS\Policies\${_VCP}"
	CopyFiles /SILENT "$EXEDIR\App\WinSxS\Policies\${_VCP}\*.*" "$WINDIR\WinSxS\Policies\${_VCP}"
!macroend

!define vc::DelLocal `!insertmacro vc::DelLocal`
!macro vc::DelLocal _VC _VCP
	ReadINIStr $0 "$EXEDIR\Data\${APP} Portable.ini" "${APP} Portable" "${_VC}"
	StrCmp $0 "false" 0 +6
	Delete "$WINDIR\WinSxS\Manifests\${_VC}.manifest"
	Delete "$WINDIR\WinSxS\Manifests\${_VC}.cat"
	RMDir "/r" "$WINDIR\WinSxS\${_VC}"
	RMDir "/r" "$WINDIR\WinSxS\Policies\${_VCP}"
	DeleteINIStr "$EXEDIR\Data\${APP} Portable.ini" "${APP} Portable" "${_VC}"
!macroend

!endif

# Read / Write Settings

!define WriteSettings `!insertmacro WriteSettings`
!macro WriteSettings _KEY _VALUE
	IfFileExists `${SETTINGSDIR}` +2
	CreateDirectory `${SETTINGSDIR}`
	WriteINIStr `${RUNTIMESETTINGS}` `${RUNTIMESECTION}` `${_KEY}` `${_VALUE}`
!macroend
!define ReadSettings `!insertmacro ReadSettings`
!macro ReadSettings _KEY _OUTPUT
	IfFileExists `${RUNTIMESETTINGS}` +2
	CreateDirectory `${SETTINGSDIR}`
	ReadINIStr `${_OUTPUT}` `${RUNTIMESETTINGS}` `${RUNTIMESECTION}` `${_KEY}`
!macroend
!define WriteConfig `!insertmacro WriteConfig`
!macro WriteConfig _KEY _VALUE
	IfFileExists `${CONFIGINI}` +2
	CopyFiles /Silent `${SETTINGSFILE}` `$EXEDIR`
	WriteINIStr `${CONFIGINI}` `${APP}` `${_KEY}` `${_VALUE}`
!macroend
!define ReadConfig `!insertmacro ReadConfig`
!macro ReadConfig _KEY _OUTPUT
	IfFileExists `${CONFIGINI}` +2
	CopyFiles /Silent `${SETTINGSFILE}` `$EXEDIR`
	ReadINIStr `${_OUTPUT}` `${CONFIGINI}` `${APP}` `${_KEY}`
!macroend

# Start

Function CheckDirExe
	IfFileExists "$EXEDIR\${APPDIR}\${APPEXE}" +3
	MessageBox MB_OK|MB_ICONEXCLAMATION `${APPEXE} was not found in $EXEDIR\${APPDIR}`
	Abort
FunctionEnd

Function CheckRunExe
	ReadINIStr $0 "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "AllowMultipleInstances"
	StrCmp $0 "" 0 +2
	WriteINIStr "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "AllowMultipleInstances" "false"
	FindProcDLL::FindProc "${APPEXE}"
		Pop $R0
		StrCmp $R0 "1" 0 CheckRunEnd
	ReadINIStr $0 "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "AllowMultipleInstances"
	StrCmp $0 "true" SecondLaunch
		MessageBox MB_OK|MB_ICONINFORMATION `Another ${APPNAME} is running. Close ${APPNAME} before running ${APPNAME}.`
	Abort
	SecondLaunch:
	SetOutPath "$EXEDIR\${APPDIR}"
	${GetParameters} $0
		ClearErrors
			ReadINIStr $0 "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "ExecAsAdmin"
			IfErrors +5
			StrCmp $0 "" +4
			StrCmp $0 "true" +3
				StdUtils::ExecShellAsUser /NOUNLOAD `$PROGRAMSWITCH $PARAMETERS` "" "$PROGRAMDIR\$PROGRAMEXE"
				Goto +2
			Exec `"$EXEDIR\${APPDIR}\${APPEXE}"${APPSWITCH} $0`
		Abort
	CheckRunEnd:
FunctionEnd

Function CheckRegWrite
!ifdef REGKEY1
ReadINIStr $0 "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "CheckRegWrite"
StrCmp $0 "false" +8
WriteINIStr "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "CheckRegWrite" "true"
	${registry::CreateKey} "HKEY_CURRENT_USER\Software\${APP}" "$R7"
	${registry::CreateKey} "HKEY_LOCAL_MACHINE\SOFTWARE\${APP}" "$R7"
	StrCmp "$R7" "-1" "" +4
		;MessageBox MB_OKCANCEL 'You are not allowed to write to the registry!!$\nContinue anyway?' IDOK +3 IDCANCEL 0
		${registry::Unload}
		;Abort
	${registry::DeleteKey} "HKEY_CURRENT_USER\Software\${APP}" "$R7"
	${registry::DeleteKey} "HKEY_LOCAL_MACHINE\SOFTWARE\${APP}" "$R7"
!else
	DeleteRegKey HKEY_CURRENT_USER "Software\${APP}"
	DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\${APP}"
!endif
FunctionEnd

Function CheckGoodExit
	ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "${APP} Portable Settings" "GoodExit"
	StrCmp $0 "false" 0 CheckExitEnd
		WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "${APP} Portable Settings" "GoodExit" "false"
	StrCmp $0 "true" 0 +4
	FindProcDLL::FindProc "${APPEXE}"
		Pop $R0
		StrCmp $R0 "1" CheckExitEnd
	MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION `Last exit of ${APP} Portable did'nt restore settings.$\nWould you try to restore local and backup portable settings now?` IDOK RestoreNow IDCANCEL CheckExitEnd
	RestoreNow:
	Call Restore
	CheckExitEnd:
FunctionEnd

Function CheckBadExit
	; === Check good or bad exit ===
	ReadINIStr $0 "$EXEDIR\Data\${APP} Portable RuntimeData.ini" "${APP} Portable" "Status"
	StrCmp $0 "running" "" CheckGoodOrBadExitEnd
		${System::MessageBox} "${MB_OKCANCEL}|${MB_ICONEXCLAMATION}" "Bad exit | ${APPNAME}" "Last exit of ${APPNAME} did not restore settings.$\nWould you try to restore local and backup portable settings now?" $0
		StrCmp $0 "1" "" CheckGoodOrBadExitEnd ; if user click OK
			ReadINIStr $0 "$EXEDIR\Data\${APP} Portable RuntimeData.ini" "${APP} Portable" "PluginsDir"
				RMDir "/r" "$0"
			Call Close
	CheckGoodOrBadExitEnd:
FunctionEnd

Function CheckStart
	Call CheckDirExe
	Call CheckRegWrite
	Call CheckRunExe
	Call CheckGoodExit
	Call CheckBadExit
FunctionEnd

#  Before Launching

Function SplashLogo
	StrCmp $1 "Guest" SplashScreenEnd
	StrCmp $1 "User" SplashScreenEnd
	ReadINIStr $0 "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "DisableSplashScreen"
	StrCmp $0 "" "" +2
	WriteINIStr "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "DisableSplashScreen" "false"
	ClearErrors
	ReadINIStr $1 "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "SplashScreenName"
	StrCmp $1 "" 0 +3
	WriteINIStr "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "SplashScreenName" ""
	Pop $1
	StrCmp $0 "true" SplashScreenEnd ; skip splash screen
	StrCmp $1 "" ShowDefaultSplashScreen CustomSplashScreen
	ShowDefaultSplashScreen:
        	InitPluginsDir
		File '/oname=$PLUGINSDIR\splash.bmp' 'Include\Splash.bmp'
	!ifdef CUSTOMUI | NOUI
		newadvsplash::show /NOUNLOAD 1000 300 200 0xFF00FF '$PLUGINSDIR\Splash.bmp'
	!else
		newadvsplash::show /NOUNLOAD 1000 300 200 0xFF00FF /L "$PLUGINSDIR\Splash.bmp"
	!endif
	StrCmp $1 "-1" SplashScreenEnd
	Delete "$PLUGINSDIR\Splash.bmp"
	Goto SplashScreenEnd
	CustomSplashScreen:
		IfFileExists "$DATADIR\$1.bmp" ShowCustomSplashScreen ShowDefaultSplashScreen
		ShowCustomSplashScreen:
		!ifdef CUSTOMUI | NOUI
			newadvsplash::show /NOUNLOAD 1000 300 200 0xFF00FF "$DATADIR\$1.bmp"
		!else
			newadvsplash::show /NOUNLOAD 1000 300 200 0xFF00FF /L "$DATADIR\$1.bmp"
		!endif
	SplashScreenEnd:
FunctionEnd