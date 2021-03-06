; Copyleft (c) n/a-n/a PortableRoApps
;
;      ***************	    ***************   ****************    ******************* *****************   ****************    *********            ******************** ***************       **************    *****************   ***************    ***************      ************
;      *::::::::::::::**    *:::::::::::::*   *:::::::::::::::**  *:::::::::::::::::* *:::::::::::::::*	  *:::::::::::::::**  *:::::::*            *::::::::::::::::::* *::::::::::::::**     *::::::::::::*    *:::::::::::::::*   *::::::::::::::**  *::::::::::::::**   **::::::::::***
;      **::::::***::::::*   *:::::***:::::*   **::::::***:::::::* *:*****:::::*****:* **:::::***:::::**	  **::::::***::::::*   *:::::*             *::::::::::::::::::* **::::::***:::::**    *::::****::::*    **:::::***:::::**   **::::::***:::::** *:::::::***:::::** **::::****:::::*
;	*:::::*   *:::::* **::::**   **::::**  *:::::*    *:::::* ***   *:::::*   ***  *::::*   *::::*     *:::::*   *:::::*   *:::::*             **:::::***********:*  *:::::*   *:::::*  **::::*    *::::**   *::::*   *::::*     *:::::*   *:::::*  *:::::*   *:::::* *::::*    *::::*
;	*:::::*   *:::::* *:::::*     *:::::*  *:::::*    *:::::*       *:::::*        *::::*   *::::*	   *:::::*   *:::::*   *:::::*              *:::::*         ***  *:::::*   *:::::*  *:::::*    *:::::*   *::::*   *::::*     *:::::*   *:::::*  *:::::*   *:::::* *::::*    ******
;	*:::::*   *:::::* *:::::*     *:::::*  *:::::*    *:::::*       *:::::*        *::::*   *::::*	   *:::::*   *::::**   *:::::*              *:::::*	***	 *:::::*   *:::::*  *:::::*    *:::::*   *::::*   *::::*     *:::::*   *:::::*  *:::::*   *:::::* *::::*    
;	*::::::***::::::* *:::::*     *:::::*  *::::::***:::::::*       *:::::*        *::::*   *::::*	   *::::::***:::::*    *:::::*              *:::::*******:*	 *::::::***::::**   *:::::*    *:::::*   *::::*   *::::*     *::::::***::::::*  *::::::***::::::* **:::::****
;	*:::::::::::::::* *:::::*     *:::::*  *:::::::::::::***        *:::::*       **:::::***:::::**	   *::::::::::::::*    *:::::*              *:::::::::::::*	 *:::::::::::**     *:::::*    *:::::*  **::::*   *::::**    *:::::::::::::::*  *:::::::::::::::*  **:::::::::***
;	*:::::::::::::**  *:::::*     *:::::*  *::::::::::::*           *:::::*       *:::::::::::::::*	   *::::::*****:::**   *:::::*              *:::::::::::::*	 *:::::::::::*      *:::::*    *:::::*  *::::::***::::::*    *:::::::::::::**   *:::::::::::::**     ***:::::::::*
;	*:::::********    *:::::*     *:::::*  *:::::**:::::*           *:::::*       *::::::***::::::*	   *:::::*     *::::** *:::::*              *:::::*******:*	 *:::::**:::::*     *:::::*    *:::::*  *:::::::::::::::*    *::::::*******     *:::::********          *****:::::*
;	*:::::*           *:::::*     *:::::*  *:::::**::::::*          *:::::*      **::::**   **::::**   *:::::*     *:::::* *:::::*              *:::::*	***	 *:::::**::::::*    *:::::*    *:::::* **::::::***::::::**   *:::::*            *:::::*                     *:::::*
;	*:::::*           *:::::*     *:::::*  *:::::* *::::::*         *:::::*      *::::*       *::::*   *:::::*     *:::::* *:::::*         ***  *:::::*         ***  *:::::* *::::::*   *:::::*    *:::::* *::::***   ***::::*   *:::::*            *:::::*            *******   *::::*
;	*:::::*           **::::**   **::::**  *:::::*  *::::::*        *:::::*      *::::*       *::::*   *:::::*     *:::::* *:::::***********:* **:::::***********:*  *:::::*  *::::::*  **:::::****:::::** *::::*       *::::*   *:::::*            *:::::*            *:::::*   *::::*
;	*:::::*             *:::::***:::::*    *:::::*   *::::::*       *:::::*      *::::*       *::::*   *::::::*****::::::* *:::::::::::::::::* *::::::::::::::::::*  *:::::*   *::::::*   *::::::::::::*   *::::*       *::::*   *:::::*            *:::::*            *::::::***:::::*
;      **:::::**            *:::::::::::::*   **:::::** **:::::::**   ***:::::***   **::::**     **::::** **::::::::::::::::** *:::::::::::::::::* *::::::::::::::::::* **:::::** **:::::::** *::::::::::::*  **::::**     **::::** **:::::**          **:::::**            **:::::::::::**
;      *********            ***************   ********* ***********   ***********   ********     ******** ******************   ******************* ******************** ********* *********** **************  ********     ******** *********          *********              ***********

# INFORMATION PROGRAM

!define PORTABLEAPPNAME 	"AnyCleaner Portable"
!define VER 			"1.6.0.0"
!define APPVER 			"1.6.0.0"
!define APPNAME 		"AnyCleaner Portable"
!define APP 			"AnyCleaner"
!define APPEXE 			"AnyCleaner.exe"
!define CLOSEEXE		"AnyCleaner.exe"
!define APPDIR 			"App\AnyCleaner"
!define WEBSITE			"http://free.pccaretools.com/softwares/anycleaner.html"
!define LEGALTRADEMARKS 	"Copyright (C) PCCareTools Software"
!define COPYRIGHT		"PCCareTools Software"
!define COMPANYNAME		"PCCareTools Software"
!define LAUNCHERLANGUAGE	"English"
!define APPPATH			"$PROGRAMDIR"
!define EXE			"${APPPATH}\${APPEXE}"
!define WAITFOREXE		""
!define APPSWITCH 	``	; some default Parameters
!define RUNASADMIN

# REGISTRY KEYS

!define REGKEY1 	"HKEY_LOCAL_MACHINE\SOFTWARE\AnyCleaner"

/*
!define REGKEY1 	""
!define REGKEY2 	""
!define REGKEY3 	""
!define REGKEY4 	""
!define REGKEY5 	""
!define REGKEY6 	""
!define REGKEY7 	""
!define REGKEY8 	""
!define REGKEY9 	""
!define REGKEY10 	""
!define REGKEY11 	""
!define REGKEY12 	""
!define REGKEY13 	""
!define REGKEY14 	""
!define REGKEY15 	""
!define REGKEY16 	""
!define REGKEY17 	""
!define REGKEY18 	""
!define REGKEY19 	""
!define REGKEY20 	""
!define REGKEY21 	""
!define REGKEY22 	""
!define REGKEY23 	""
!define REGKEY24 	""
!define REGKEY25 	""
!define REGKEY26 	""
!define REGKEY27 	""
!define REGKEY28 	""
!define REGKEY29 	""
!define REGKEY30 	""
!define REGKEY31 	""
!define REGKEY32 	""
!define REGKEY33 	""
!define REGKEY34 	""
!define REGKEY35 	""

# DIRECTORY

!define LOCALDIR1 "$LOCALAPPDATA\MeuProg"
!define SUBDIR1 "" ; beginning with back-slash
!define PORTABLEDIR1 "$DATADIR\LocalAppdata\MeuProg"
!define DEFAULTPORTABLEDIR1 "$DEFAULTDATA\MeuProg"

!define LOCALDIR2 "$%PROGRAMFILES%\Common Files\MeuProg"
!define SUBDIR2 "" ; beginning with back-slash
!define PORTABLEDIR2 "$DATADIR\Common Files\MeuProg"
!define DEFAULTPORTABLEDIR2 "$DEFAULTDATA\Common Files\MeuProg"

!define LOCALDIR3 "$%PROGRAMDATA%\MeuProg"
!define SUBDIR3 "" ; beginning with back-slash
!define PORTABLEDIR3 "$DATADIR\Allusersdata\MeuProg"
!define DEFAULTPORTABLEDIR3 "$DEFAULTDATA\Common\MeuProg"

# FILES

!define LOCALFILE1 "$WINDIR\system32\MeuProg.cpl"
!define PORTABLEFILE1 "$DATADIR\MeuProg.cpl"
!define DEFAULTPORTABLEFILE1 "$SYSDIRECTORY\MeuProg.cpl"

*/

# PRIVILIGES

!ifndef RUNASADMIN
	RequestExecutionLevel user
!else
	RequestExecutionLevel admin
!endif

# COMPRESSION
SetCompress auto
SetCompressor /SOLID lzma
SetCompressorDictSize 32
SetDatablockOptimize on
SetCompress force

# INCLUDE

!include "Include\Launcher.nsh" 
!include "LogicLib.nsh"
; Custom:
;!include "Include\CopyMoveFiles.nsh"

# BASIC INFORMATION

Name                         `${APPNAME}`
OutFile                      `${APP} Portable.exe`
Icon                         `Include\appicon.ico`

# MAIN

Section "Main" SEC01
	Call DefaultVar

	Call CheckStart

	Call BackupLocalKeys
	Call BackupPortableKeys
/*
	Call BackupLocalDirs
	Call RestorePortableDirs

	Call BackupLocalFiles
	Call RestorePortableFiles
*/
	Call Init

	Call RefreshShellIcons

	Call MultiLang

	Call RuntimeData

	Call SplashLogo

	Call Launch

	Call CreateGUID
	Pop $0
	WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "IDs" "Identifier" "$0"

	Call Restore
SectionEnd
Function Restore
	Call RestoreLocalKeys
	Call RestorePortableKeys
/*
	Call BackupPortableDirs
	Call RestoreLocalDirs

	Call BackupPortableFiles
	Call RestoreLocalFiles
*/
	Call Close 

	Call CleanUp

	Call CleanUpRegistry

	Call RefreshShellIcons

	Call TheEnd
FunctionEnd

# INIT

!define LOCALE_SCOUNTRY 6
!define LOCALE_SENGCOUNTRY 4098
!define LOCALE_SENGLANGUAGE 0x00001001
!define GEOCLASS_NATION 16
!define GEOID_NOT_AVAILABLE -1
!define GEO_ISO2 4
!define GEO_ISO3 5
!define GEO_OFFICIALNAME 9
!define GEO_LATITUDE 2
!define GEO_LONGITUDE 3

!define ASSOCSTR_COMMAND 1
!define ASSOCSTR_EXECUTABLE 2
!define ASSOCF_NOTRUNCATE 0x00000020
!define ASSOCF_REMAPRUNDLL 0x00000080
!define ASSOCF_NOFIXUPS 0x00000100
!define ASSOCF_ISPROTOCOL 0x00001000
!define ASSOCSTR_FRIENDLYAPPNAME 4

Function Init
	UserInfo::GetAccountType
	pop $0
	${If} $0 != "admin" ;Require admin rights on NT4+
    	  MessageBox mb_iconstop "Administrator rights required!"
    	  SetErrorLevel 740 ;ERROR_ELEVATION_REQUIRED
    	 Quit
	${EndIf}

	CreateDirectory "$DATADIR"
	CreateDirectory "$SETTINGSDIR"

	# WriteRegStr HKEY_CURRENT_USER "" "" ''
	# WriteRegBin HKEY_LOCAL_MACHINE "" "" ''
	# WriteRegDWORD HKEY_LOCAL_MACHINE "" "" ''
	# WriteRegExpandStr HKEY_LOCAL_MACHINE "" "" ''

	FileOpen $0 "$SETTINGSDIR\${APP} Portable Settings.ini" w 
	FileWriteWord $0 0xfeff ; Write the BOM
	FileWriteUTF16LE $0 `[Settings]`
	FileWriteWord $0 "13"
	FileWriteWord $0 "10"
	FileWriteUTF16LE $0 `$\r$\n[LastDrive]`
	FileWriteWord $0 "13"
	FileWriteWord $0 "10"
	FileWriteUTF16LE $0 `$\r$\n[IDs]`
	FileWriteWord $0 "13"
	FileWriteWord $0 "10"
	FileWriteUTF16LE $0 `$\r$\n[InfoPC]`
	FileWriteWord $0 "13"
	FileWriteWord $0 "10"
	FileWriteUTF16LE $0 `$\r$\n[Launcher]`
	FileWriteWord $0 "13"
	FileWriteWord $0 "10"
	FileWriteUTF16LE $0 `$\r$\n[Browser]`
	FileWriteWord $0 "13"
	FileWriteWord $0 "10"
	FileWriteUTF16LE $0 `$\r$\n[Language]`
	FileWriteWord $0 "13"
	FileWriteWord $0 "10"
	FileWriteUTF16LE $0 `$\r$\n[SaveKey]`
	FileWriteWord $0 "13"
	FileWriteWord $0 "10"
	FileWriteUTF16LE $0 `$\r$\n[RegistryCleanupIfEmpty]`
	FileWriteWord $0 "13"
	FileWriteWord $0 "10"
	FileWriteUTF16LE $0 `$\r$\n[RemoveTempDir]`
	FileClose $0

	${If} $SETTINGSDIR != true
	  ${If} $SETTINGSDIR == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Settings" "SettingsDir"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Settings" "SettingsDir" "$SETTINGSDIR"
	  ${EndIf}

	  ${If} $LASTDRIVE == "0"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "LastDrive" "LastDrive"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "LastDrive" "LastDrive" "$ROOTDIR"
	    System::Call "kernel32::GetCurrentDirectory(i ${NSIS_MAX_STRLEN}, t .r0)"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "LastDrive" "CurrentDirectory" "$0"
	  ${EndIf}

	  ${If} $LASTDRIVE == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "LastDrive" "LastDirectory"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "LastDrive" "LastDirectory" "$EXEDIR"
	  ${EndIf}

	  GetVersion::WindowsPlatformArchitecture
	  Pop $0
	  ${if} $0 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "InfoPC" "Architecture"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "InfoPC" "Architecture" "$0 bit"
	  ${EndIf}

	  System::Call "kernel32.dll::GetVersion() i .r0"
	  IfFileExists "C:\Windows\System32\systeminfo.exe" "IsYesVersionSys" "IsNotVesionSys"
	  FindProcDLL::FindProc "systeminfo.exe"
	  POP $0
	  StrCmp $0 1 "IsYesVersionSys" IsNotVesionSys
	  ${If} "$0" == "1"
	     IsYesVersionSys:
	       ClearErrors
		 ReadRegStr $R0 HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion" "ProductName"
		 ReadRegStr $R1 HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion" "CurrentVersion"
	  	${if} $R0 == "1"
	    	   ReadINIStr $R0 "$SETTINGSDIR\${APP} Portable Settings.ini" "InfoPC" "OSVersion"
	  	${Else}
	   	  WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "InfoPC" "OSVersion" "$R0 Version: $R1"
	  	${EndIf}
	  ${ElseIf} $0 == "0"
	     IsNotVesionSys:

	  ${EndIf}

  	    GetDLLVersion "$EXEDIR\${PORTABLEAPPNAME}.exe" $R0 $R1
  	    IntOp $R2 $R0 / 0x00010000
  	    IntOp $R3 $R0 & 0x0000FFFF
  	    IntOp $R4 $R1 / 0x00010000
  	    IntOp $R5 $R1 & 0x0000FFFF
  	    StrCpy $0 "$R2.$R3.$R4.$R5"
	  ${if} $0 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Launcher" "Version"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Launcher" "Version" "$0"
	  ${EndIf}

	# LANGUAGE

	  System::Call 'KERNEL32::GetUserDefaultLangID()i.r0'
	  ${if} $0 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "LANGID"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "LANGID" "$0"
	  ${EndIf}

	  System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SENGCOUNTRY},t.r1,i1000)' 
	  ${if} $1 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "SENGCOUNTRY"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "SENGCOUNTRY" "$1"
	  ${EndIf}

	  System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SCOUNTRY},t.r1,i1000)'
	  ${if} $1 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "LOCALE_SCOUNTRY"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "LOCALE_SCOUNTRY" "$1"
	  ${EndIf}

	  System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SENGLANGUAGE},t.r1,i1000)'
	  ${if} $1 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "SENGLANGUAGE"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "SENGLANGUAGE" "$1"
	  ${EndIf}

	  System::Call 'KERNEL32::GetUserGeoID(i${GEOCLASS_NATION})i.r0'
	  ${if} $0 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "GEOID"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "GEOID" "$0"
	  ${EndIf}

	  ${If} $0 <> ${GEOID_NOT_AVAILABLE} ; Only available if the user has set a country/location
	  ${AndIf} $0 != "error" ; GetUserGeoID is WinXP+

	  System::Call 'KERNEL32::GetGeoInfo(i$0,i${GEO_ISO2},t.r1,i1000,i0)'
	  ${if} $1 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "ISO2"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "ISO2" "$1"
	  ${EndIf}

	  System::Call 'KERNEL32::GetGeoInfo(i$0,i${GEO_ISO3},t.r1,i1000,i0)'
	  ${if} $1 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "ISO3"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "ISO3" "$1"
	  ${EndIf}

	  System::Call 'KERNEL32::GetGeoInfo(i$0,i${GEO_OFFICIALNAME},t.r1,i1000,i0)'
	  ${if} $1 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "OFFICIALNAME"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "OFFICIALNAME" "$1"
	  ${EndIf}

	  System::Call 'KERNEL32::GetGeoInfo(i$0,i${GEO_LATITUDE},t.r1,i1000,i0)'
	  ${if} $1 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "LATITUDE"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "LATITUDE" "$1"
	  ${EndIf}

	  System::Call 'KERNEL32::GetGeoInfo(i$0,i${GEO_LONGITUDE},t.r1,i1000,i0)'
	  ${if} $1 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "LONGITUDE"
	  ${Else}
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "LONGITUDE" "$1"
	  ${EndIf}
	  ${EndIf}

	# DEFAULT BROWSER

	  System::Call 'SHLWAPI::AssocQueryString(i ${ASSOCF_NOTRUNCATE}|${ASSOCF_REMAPRUNDLL}|${ASSOCF_NOFIXUPS}|${ASSOCF_ISPROTOCOL}, i ${ASSOCSTR_FRIENDLYAPPNAME}, t ".htm", t "open", t.r1, *i ${NSIS_MAX_STRLEN})i.r0'
	  ${if} $1 != "1"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Browser" "Your_Default_Browser" "$1"
	  ${EndIf}
	${EndIf}

	; === Backup local registry key if we have administrator privileges ===
	UserInfo::GetAccountType
	Pop $0
	StrCmp $0 "Guest" KeyExists
	StrCmp $0 "User" KeyExists
	  ${registry::KeyExists} "${REGKEY1}" $R0
/*
	  ${registry::KeyExists} "${REGKEY2}" $R0
	  ${registry::KeyExists} "${REGKEY3}" $R0
	  ${registry::KeyExists} "${REGKEY4}" $R0
	  ${registry::KeyExists} "${REGKEY5}" $R0
	  ${registry::KeyExists} "${REGKEY6}" $R0
	  ${registry::KeyExists} "${REGKEY7}" $R0
	  ${registry::KeyExists} "${REGKEY8}" $R0
	  ${registry::KeyExists} "${REGKEY9}" $R0
	  ${registry::KeyExists} "${REGKEY10}" $R0
	  ${registry::KeyExists} "${REGKEY11}" $R0
	  ${registry::KeyExists} "${REGKEY12}" $R0
	  ${registry::KeyExists} "${REGKEY13}" $R0
	  ${registry::KeyExists} "${REGKEY14}" $R0
	  ${registry::KeyExists} "${REGKEY15}" $R0
	  ${registry::KeyExists} "${REGKEY16}" $R0
	  ${registry::KeyExists} "${REGKEY17}" $R0
	  ${registry::KeyExists} "${REGKEY18}" $R0
	  ${registry::KeyExists} "${REGKEY19}" $R0
	  ${registry::KeyExists} "${REGKEY20}" $R0
	  ${registry::KeyExists} "${REGKEY21}" $R0
	  ${registry::KeyExists} "${REGKEY22}" $R0
	  ${registry::KeyExists} "${REGKEY23}" $R0
	  ${registry::KeyExists} "${REGKEY24}" $R0
	  ${registry::KeyExists} "${REGKEY25}" $R0
	  ${registry::KeyExists} "${REGKEY26}" $R0
	  ${registry::KeyExists} "${REGKEY27}" $R0
	  ${registry::KeyExists} "${REGKEY28}" $R0
	  ${registry::KeyExists} "${REGKEY29}" $R0
	  ${registry::KeyExists} "${REGKEY30}" $R0
	  ${registry::KeyExists} "${REGKEY31}" $R0
	  ${registry::KeyExists} "${REGKEY32}" $R0
	  ${registry::KeyExists} "${REGKEY33}" $R0
	  ${registry::KeyExists} "${REGKEY34}" $R0
	  ${registry::KeyExists} "${REGKEY35}" $R0
*/
	  ${If} $R0 != true
	    StrCmp $R0 1 KeyExists KeyExistsEnd
	    StrCmp $R0 "1" +3
	  ${EndIf}
	      ${If} "$R0" == "1"
	        KeyExists:
	         CreateDirectory "$DATADIR"
	         ReadINIStr $R0 "$DATADIR\${APP} Portable RuntimeData.ini" "Activate" "Registry"
	         StrCpy $R0 "true"
	         WriteINIStr "$DATADIR\${APP} Portable RuntimeData.ini" "Activate" "Registry" '$R0'
	      ${EndIf}
	KeyExistsEnd:
FunctionEnd

# LANGUAGE

Var LNG
Function MultiLang
	; === UserDefaultLang ===
	; Launcher will change app language according Windows language,
	; see also: http://www.science.co.il/language/Locale-codes.asp
	StrCpy $LNG ""
	System::Call 'kernel32::GetUserDefaultLangID() i .r0'
	StrCmp $0 "1078" 0 +2
		StrCpy $LNG "Afrikaans"
	StrCmp $0 "1052" 0 +2
		StrCpy $LNG "Albanian"
	StrCmp $0 "1025" 0 +2
		StrCpy $LNG "Arabic"
	StrCmp $0 "1067" 0 +2
		StrCpy $LNG "Armenian"
	StrCmp $0 "1069" 0 +2
		StrCpy $LNG "Basque"
	StrCmp $0 "1059" 0 +2
		StrCpy $LNG "Belarusian"
	StrCmp $0 "5146" 0 +2
		StrCpy $LNG "Bosnian"
	StrCmp $0 "1150" 0 +2
		StrCpy $LNG "Breton"
	StrCmp $0 "1026" 0 +2
		StrCpy $LNG "Bulgarian"
	StrCmp $0 "1027" 0 +2
		StrCpy $LNG "Catalan"
	StrCmp $0 "1050" 0 +2
		StrCpy $LNG "Croatian"
	StrCmp $0 "1029" 0 +2
		StrCpy $LNG "Czech"
	StrCmp $0 "1030" 0 +2
		StrCpy $LNG "Danish"
	StrCmp $0 "1043" 0 +2
		StrCpy $LNG "Dutch"
	StrCmp $0 "1033" 0 +2
		StrCpy $LNG "English"
	StrCmp $0 "1061" 0 +2
		StrCpy $LNG "Estonian"
	StrCmp $0 "1065" 0 +2
		StrCpy $LNG "Farsi"
	StrCmp $0 "1035" 0 +2
		StrCpy $LNG "Finnish"
	StrCmp $0 "1036" 0 +2
		StrCpy $LNG "French"
	StrCmp $0 "1079" 0 +2
		StrCpy $LNG "Georgian"
	StrCmp $0 "1031" 0 +2
		StrCpy $LNG "German"
	StrCmp $0 "1032" 0 +2
		StrCpy $LNG "Greek"
	StrCmp $0 "1037" 0 +2
		StrCpy $LNG "Hebrew"
	StrCmp $0 "1081" 0 +2
		StrCpy $LNG "Hindi"
	StrCmp $0 "1038" 0 +2
		StrCpy $LNG "Hungarian"
	StrCmp $0 "1057" 0 +2
		StrCpy $LNG "Indonesian"
	StrCmp $0 "1040" 0 +2
		StrCpy $LNG "Italian"
	StrCmp $0 "1041" 0 +2
		StrCpy $LNG "Japanese"
	StrCmp $0 "1042" 0 +2
		StrCpy $LNG "Korean"
	StrCmp $0 "1062" 0 +2
		StrCpy $LNG "Latvian"
	StrCmp $0 "1063" 0 +2
		StrCpy $LNG "Lithuanian"
	StrCmp $0 "1071" 0 +2
		StrCpy $LNG "Macedonian"
	StrCmp $0 "1086" 0 +2
		StrCpy $LNG "Malaysian"
	StrCmp $0 "1104" 0 +2
		StrCpy $LNG "Mongolian"
	StrCmp $0 "1121" 0 +2
		StrCpy $LNG "Nepali"
	StrCmp $0 "1044" 0 +2
		StrCpy $LNG "Norwegian"
	StrCmp $0 "1065" 0 +2
		StrCpy $LNG "Persian"
	StrCmp $0 "1045" 0 +2
		StrCpy $LNG "Polish"
	StrCmp $0 "2070" 0 +2
		StrCpy $LNG "Portuguese"
	StrCmp $0 "1046" "" +2
		StrCpy $LNG "Portuguese-Brazilian"
	StrCmp $0 "1048" 0 +2
		StrCpy $LNG "Romanian"
	StrCmp $0 "1049" 0 +2
		StrCpy $LNG "Russian"
	StrCmp $0 "2074" 0 +2
		StrCpy $LNG "Serbian (Latin)"
	StrCmp $0 "3098" 0 +2
		StrCpy $LNG "Serbian (Cyrillic)"
	StrCmp $0 "2052" 0 +2
		StrCpy $LNG "SimpChinese"
	StrCmp $0 "1060" 0 +2
		StrCpy $LNG "Slovenian"
	StrCmp $0 "1051" 0 +2
		StrCpy $LNG "Slovak"
	StrCmp $0 "1034" 0 +2
		StrCpy $LNG "Spanish"
	StrCmp $0 "1053" 0 +2
		StrCpy $LNG "Swedish"
	StrCmp $0 "1028" 0 +2
		StrCpy $LNG "TradChinese"
	StrCmp $0 "1054" 0 +2
		StrCpy $LNG "Thai"
	StrCmp $0 "1055" 0 +2
		StrCpy $LNG "Turkish"
	StrCmp $0 "1058" 0 +2
		StrCpy $LNG "Ukrainian"
	StrCmp $0 "1066" 0 +2
		StrCpy $LNG "Vietnamese"
	ReadINIStr $0 "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "UserDefaultLang"
	StrCmp $0 "" "" +3
	WriteINIStr "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "UserDefaultLang" "true"
	StrCpy $0 "true"
	WriteINIStr "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "Language" "$LNG"
	StrCmp $0 "true" CheckLanguage UserDefaultLangEnd
	CheckLanguage:
		StrCmp $LNG "" UserDefaultLangEnd ; use last used language if no supported language on host computer
		StrCmp $LNG "english" ChangeLanguage ; change language without checking existence of language files if language is English
		IfFileExists "$PROGRAMDIR\languages\$LNG.ini" ChangeLanguage UserDefaultLangEnd
	ChangeLanguage:
		WriteINIStr "$PROGRAMDIR\config.ini" "General" "Language" "$LNG"
	UserDefaultLangEnd:
		WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Language" "PAL:LanguageCustom" "$LNG"
FunctionEnd

# LAUNCH

Function Launch
	;=== Copy the default settings files
	CreateDirectory "$SETTINGSDIR"
	SetOutPath "$PROGRAMDIR"
	${GetParameters} $0
		Goto LaunchProgramParameters
			StrCmp "'$0'" "''" "" LaunchProgramParameters
				LaunchProgramParameters:
					ClearErrors
					ExecWait `"$PROGRAMDIR\${APPEXE}" ${APPSWITCH} $0`
				IfErrors 0 noError
			noError:
		Goto AdditionalParameters
	AdditionalParameters:
	${If} $PARAMETERS == "$0"
	  ReadINIStr $0 "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "AdditionalParameters"
	${Else}
	  WriteINIStr "$EXEDIR\${APP} Portable.ini" "${APP} Portable" "AdditionalParameters" ""
	${EndIf}

	System::Call "kernel32::GetCurrentProcess() i .s"

	System::Call "kernel32::IsWow64Process(i s, *i .r0)"

	StrCmp $0 "0" is32bit is64bit
	${If} $0 == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Launcher" "Process"
	is64bit:
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Launcher" "Process" "64 bit"
	is32bit:
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Launcher" "Process" "32 bit"
	${EndIf}

	System::Call setupapi::IsUserAdmin()i.r0
	StrCmp $0 1 "isadmin" notadmin
	${If} $0 == "1"
	  ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "Launcher" "IsAdmin"
	${ElseIf} $0 == "1"
	  StrCmp $0 "1" 0 +2
	  isadmin:
	  WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Launcher" "IsAdmin" "true"
	${ElseIf} $0 == "1"
	  StrCmp $0 "0" 0 +2
	  notadmin:
	  WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Launcher" "IsAdmin" "false"
	${EndIf}

	  System::Call "advapi32::GetUserName(t .r0, *i ${NSIS_MAX_STRLEN} r1) i.r2"
	  WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "InfoPC" "UserName" "$0"
	  WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Launcher" "Launcher" "${PORTABLEAPPNAME}.exe"

	!define Running
	   ExecWait `${WAITFOREXE}`
	   Call ProcessWait
	!undef Running
FunctionEnd

# PROCESS WAIT

Function ProcessWait
	Running:
	 Sleep 1000
	  FindProcDLL::FindProc `${WAITFOREXE}`
	  IntCmp $R0 1 Running 0 0
	  StrCmp $R0 "1" Running
	  FindProcDLL::FindProc `${APPEXE}`
	  IntCmp $R0 1 Running 0 0
	  StrCmp $R0 "1" Running
	 Goto LaunchAndExit
	LaunchAndExit:
       WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "Launcher" "GoodExit" "true"
      newadvsplash::stop
FunctionEnd

Function CreateGUID
  System::Alloc 16
  System::Call 'ole32::CoCreateGuid(i sR0)'
  System::Call 'ole32::StringFromGUID2(i R0, w .s, i ${NSIS_MAX_STRLEN})'
  System::Free $R0
FunctionEnd

# ACTION REGISTRY

Function BackupLocalKeys
SetRegView 64
SetRegView 32
  ${registry::BackupKey} "${REGKEY1}"
/*
  ${registry::BackupKey} "${REGKEY2}"
  ${registry::BackupKey} "${REGKEY3}"
  ${registry::BackupKey} "${REGKEY4}"
  ${registry::BackupKey} "${REGKEY5}"
  ${registry::BackupKey} "${REGKEY6}"
  ${registry::BackupKey} "${REGKEY7}"
  ${registry::BackupKey} "${REGKEY8}"
  ${registry::BackupKey} "${REGKEY9}"
  ${registry::BackupKey} "${REGKEY10}"
  ${registry::BackupKey} "${REGKEY11}"
  ${registry::BackupKey} "${REGKEY12}"
  ${registry::BackupKey} "${REGKEY13}"
  ${registry::BackupKey} "${REGKEY14}"
  ${registry::BackupKey} "${REGKEY15}"
  ${registry::BackupKey} "${REGKEY16}"
  ${registry::BackupKey} "${REGKEY17}"
  ${registry::BackupKey} "${REGKEY18}"
  ${registry::BackupKey} "${REGKEY19}"
  ${registry::BackupKey} "${REGKEY20}"
  ${registry::BackupKey} "${REGKEY21}"
  ${registry::BackupKey} "${REGKEY22}"
  ${registry::BackupKey} "${REGKEY23}"
  ${registry::BackupKey} "${REGKEY24}"
  ${registry::BackupKey} "${REGKEY25}"
  ${registry::BackupKey} "${REGKEY26}"
  ${registry::BackupKey} "${REGKEY27}"
  ${registry::BackupKey} "${REGKEY28}"
  ${registry::BackupKey} "${REGKEY29}"
  ${registry::BackupKey} "${REGKEY30}"
  ${registry::BackupKey} "${REGKEY31}"
  ${registry::BackupKey} "${REGKEY32}"
  ${registry::BackupKey} "${REGKEY33}"
  ${registry::BackupKey} "${REGKEY34}"
  ${registry::BackupKey} "${REGKEY35}"
*/
  ; Value:
  ;${registry::BackupValue} "${REGKEYVALUE1}" "${REGVALUE1}"
  Sleep 100
FunctionEnd

Function RestorePortableKeys
  IfFileExists "$DATADIR\${APP}.reg" +4
  IfFileExists "$DEFAULTDATA\${APP}.reg" 0 +5
  CreateDirectory "$DATADIR"
  CopyFiles  /SILENT "$DEFAULTDATA\${APP}.reg" "$DATADIR"
  ${registry::RestoreKey} "$DATADIR\${APP}.reg" $R0
  Sleep 200
FunctionEnd

Function BackupPortableKeys
  Delete "$DATADIR\${APP}.reg"
  CreateDirectory "$DATADIR"
  ${registry::SaveKey} "${REGKEY1}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
/*
  ${registry::SaveKey} "${REGKEY2}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY3}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY4}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY5}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY6}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY7}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY8}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY9}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY10}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY11}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY12}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY13}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY14}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY15}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY16}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY17}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY18}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY19}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY20}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY21}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY22}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY23}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY24}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY25}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY26}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY27}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY28}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY29}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY30}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY31}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY32}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY33}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY34}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
  ${registry::SaveKey} "${REGKEY35}" "$DATADIR\${APP}.reg" "/G=1 /D=2" $R0
*/
  Sleep 100
FunctionEnd

Function RestoreLocalKeys
SetRegView 64
SetRegView 32
  ${registry::RestoreBackupKey} "${REGKEY1}"
/*
  ${registry::RestoreBackupKey} "${REGKEY2}"
  ${registry::RestoreBackupKey} "${REGKEY3}"
  ${registry::RestoreBackupKey} "${REGKEY4}"
  ${registry::RestoreBackupKey} "${REGKEY5}"
  ${registry::RestoreBackupKey} "${REGKEY6}"
  ${registry::RestoreBackupKey} "${REGKEY7}"
  ${registry::RestoreBackupKey} "${REGKEY8}"
  ${registry::RestoreBackupKey} "${REGKEY9}"
  ${registry::RestoreBackupKey} "${REGKEY10}"
  ${registry::RestoreBackupKey} "${REGKEY11}"
  ${registry::RestoreBackupKey} "${REGKEY12}"
  ${registry::RestoreBackupKey} "${REGKEY13}"
  ${registry::RestoreBackupKey} "${REGKEY14}"
  ${registry::RestoreBackupKey} "${REGKEY15}"
  ${registry::RestoreBackupKey} "${REGKEY16}"
  ${registry::RestoreBackupKey} "${REGKEY17}"
  ${registry::RestoreBackupKey} "${REGKEY18}"
  ${registry::RestoreBackupKey} "${REGKEY19}"
  ${registry::RestoreBackupKey} "${REGKEY20}"
  ${registry::RestoreBackupKey} "${REGKEY21}"
  ${registry::RestoreBackupKey} "${REGKEY22}"
  ${registry::RestoreBackupKey} "${REGKEY23}"
  ${registry::RestoreBackupKey} "${REGKEY24}"
  ${registry::RestoreBackupKey} "${REGKEY25}"
  ${registry::RestoreBackupKey} "${REGKEY26}"
  ${registry::RestoreBackupKey} "${REGKEY27}"
  ${registry::RestoreBackupKey} "${REGKEY28}"
  ${registry::RestoreBackupKey} "${REGKEY29}"
  ${registry::RestoreBackupKey} "${REGKEY30}"
  ${registry::RestoreBackupKey} "${REGKEY31}"
  ${registry::RestoreBackupKey} "${REGKEY32}"
  ${registry::RestoreBackupKey} "${REGKEY33}"
  ${registry::RestoreBackupKey} "${REGKEY34}"
  ${registry::RestoreBackupKey} "${REGKEY35}"
*/
  ; Value:
  ;${registry::RestoreBackupValue} "${REGKEYVALUE1}" "${REGVALUE1}"
  Sleep 100
  ${registry::Unload}
  registry::_Unload
FunctionEnd

/*

# ACTION FOLDERS

Function BackupLocalDirs
  ${directory::BackupLocal} "${LOCALDIR1}" "${SUBDIR1}"
  ${directory::BackupLocal} "${LOCALDIR2}" "${SUBDIR2}"
  ${directory::BackupLocal} "${LOCALDIR3}" "${SUBDIR3}"
FunctionEnd

Function RestorePortableDirs
  ${directory::RestorePortable} "${PORTABLEDIR1}" "${DEFAULTPORTABLEDIR1}" "${LOCALDIR1}" "${SUBDIR1}"
  ${directory::RestorePortable} "${PORTABLEDIR2}" "${DEFAULTPORTABLEDIR2}" "${LOCALDIR2}" "${SUBDIR2}"
  ${directory::RestorePortable} "${PORTABLEDIR3}" "${DEFAULTPORTABLEDIR3}" "${LOCALDIR3}" "${SUBDIR3}"
FunctionEnd

Function BackupPortableDirs
  ${directory::BackupPortable} "${PORTABLEDIR1}" "${LOCALDIR1}" "${SUBDIR1}"
  ${directory::BackupPortable} "${PORTABLEDIR2}" "${LOCALDIR2}" "${SUBDIR2}"
  ${directory::BackupPortable} "${PORTABLEDIR3}" "${LOCALDIR3}" "${SUBDIR3}"
FunctionEnd

Function RestoreLocalDirs
  ${directory::RestoreLocal} "${LOCALDIR1}" "${SUBDIR1}"
  ${directory::RestoreLocal} "${LOCALDIR2}" "${SUBDIR2}"
  ${directory::RestoreLocal} "${LOCALDIR3}" "${SUBDIR3}"
FunctionEnd

# ACTION FILES

Function BackupLocalFiles
  Delete "${LOCALFILE1}.BackupBy${APP} Portable"
  Rename "${LOCALFILE1}" "${LOCALFILE1}.BackupBy${APP} Portable"
FunctionEnd

Function RestorePortableFiles
  IfFileExists "${PORTABLEFILE1}" +4
  IfFileExists "${DEFAULTPORTABLEFILE1}" 0 +4

  CreateDirectory "$DATADIR"
  CopyFiles /SILENT "${DEFAULTPORTABLEFILE1}" "${PORTABLEFILE1}"
  Rename  "${PORTABLEFILE1}" "${LOCALFILE1}"
FunctionEnd

Function BackupPortableFiles
  CreateDirectory "$DATADIR"
  Rename "${LOCALFILE1}" "${PORTABLEFILE1}"
FunctionEnd

Function RestoreLocalFiles
  Delete "${LOCALFILE1}"
  Rename "${LOCALFILE1}.BackupBy${APP} Portable" "${LOCALFILE1}"
FunctionEnd

*/

# CLOSE

var /global UserName

Function Close
	; === Save registry keys ===
        IfFileExists "$DATADIR\Settings\${APP} Portable Settings.ini" "Save_Registry_Key" "Skyp_Save_Registry_Key"
        StrCmp $0 1 "Save_Registry_Key" "Skyp_Save_Registry_Key"
	  ${If} "$0" == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "SaveKey" "SaveKey"
	    StrCmp $0 "" "" +3
	    Save_Registry_Key:
	    StrCpy $0 "True"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "SaveKey" "SaveKey" "$0"

	    ${registry::SaveKey} "${REGKEY1}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0

/*
	    ${registry::SaveKey} "${REGKEY2}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY3}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY4}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY5}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY6}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY7}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY8}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY9}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY10}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY11}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY12}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY13}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY14}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY15}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY16}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY17}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY18}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY19}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY20}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY21}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY22}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY23}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY24}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY25}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY26}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY27}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY28}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY29}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY30}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY31}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY32}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY33}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY34}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::SaveKey} "${REGKEY35}" "$DATADIR\${APP}.reg" "/G=1 /A=1" $R0
	    ${registry::Unload}
*/
	  ${ElseIf} $0 == "0"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "SaveKey" "SaveKey"
	    StrCmp $0 "" "" +3
	    Skyp_Save_Registry_Key:
	    StrCpy $0 "False"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "SaveKey" "SaveKey" "$0"
	  ${EndIf}

	; === Delete registry keys ===
        IfFileExists "$DATADIR\Settings\${APP} Portable Settings.ini" "Remove_Registry_HKCU" "Skyp_Remove_Registry_HKCU"
        StrCmp $0 1 "Remove_Registry_HKCU" "Skyp_Remove_Registry_HKCU"
        ${If} "$0" == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "HKEY_CURRENT_USER"
	    StrCmp $0 "" "" +3
	    Remove_Registry_HKCU:
	    StrCpy $0 "True"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "HKEY_CURRENT_USER" "$0"

	    DeleteRegKey HKEY_CURRENT_USER "Software\${APP}"
	    ${registry::DeleteKey} "HKEY_CURRENT_USER\Software\${APP}" $R0

        ${ElseIf} $0 == "0"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "HKEY_CURRENT_USER"
	    StrCmp $0 "" "" +3
	    Skyp_Remove_Registry_HKCU:
	    StrCpy $0 "False"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "HKEY_CURRENT_USER" "$0"
        ${EndIf}

	; === Delete registry keys ===
        IfFileExists "$DATADIR\Settings\${APP} Portable Settings.ini" "Remove_Registry_HKLM" "Skyp_Remove_Registry_HKLM"
        StrCmp $0 1 "Remove_Registry_HKLM" "Skyp_Remove_Registry_HKLM"
        ${If} "$0" == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "HKEY_LOCAL_MACHINE"
	    StrCmp $0 "" "" +3
	    Remove_Registry_HKLM:
	    StrCpy $0 "True"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "HKEY_LOCAL_MACHINE" "$0"

	    DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\${APP}"
	    ${registry::DeleteKey} "HKEY_LOCAL_MACHINE\Software\${APP}" $R0

        ${ElseIf} $0 == "0"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "HKEY_LOCAL_MACHINE"
	    StrCmp $0 "" "" +3
	    Skyp_Remove_Registry_HKLM:
	    StrCpy $0 "False"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "HKEY_LOCAL_MACHINE" "$0"
        ${EndIf}

	; === Restore local registry key if we have administrator privileges ===
	UserInfo::GetAccountType
	Pop $0
	StrCmp $0 "Guest" CleanUp
	StrCmp $0 "User" CleanUp
	  ${registry::DeleteKey} "${REGKEY1}" $R0
/*
	  ${registry::DeleteKey} "${REGKEY2}" $R0
	  ${registry::DeleteKey} "${REGKEY3}" $R0
	  ${registry::DeleteKey} "${REGKEY4}" $R0
	  ${registry::DeleteKey} "${REGKEY5}" $R0
	  ${registry::DeleteKey} "${REGKEY6}" $R0
	  ${registry::DeleteKey} "${REGKEY7}" $R0
	  ${registry::DeleteKey} "${REGKEY8}" $R0
	  ${registry::DeleteKey} "${REGKEY9}" $R0
	  ${registry::DeleteKey} "${REGKEY10}" $R0
	  ${registry::DeleteKey} "${REGKEY11}" $R0
	  ${registry::DeleteKey} "${REGKEY12}" $R0
	  ${registry::DeleteKey} "${REGKEY13}" $R0
	  ${registry::DeleteKey} "${REGKEY14}" $R0
	  ${registry::DeleteKey} "${REGKEY15}" $R0
	  ${registry::DeleteKey} "${REGKEY16}" $R0
	  ${registry::DeleteKey} "${REGKEY17}" $R0
	  ${registry::DeleteKey} "${REGKEY18}" $R0
	  ${registry::DeleteKey} "${REGKEY19}" $R0
	  ${registry::DeleteKey} "${REGKEY20}" $R0
	  ${registry::DeleteKey} "${REGKEY21}" $R0
	  ${registry::DeleteKey} "${REGKEY22}" $R0
	  ${registry::DeleteKey} "${REGKEY23}" $R0
	  ${registry::DeleteKey} "${REGKEY24}" $R0
	  ${registry::DeleteKey} "${REGKEY25}" $R0
	  ${registry::DeleteKey} "${REGKEY26}" $R0
	  ${registry::DeleteKey} "${REGKEY27}" $R0
	  ${registry::DeleteKey} "${REGKEY28}" $R0
	  ${registry::DeleteKey} "${REGKEY29}" $R0
	  ${registry::DeleteKey} "${REGKEY30}" $R0
	  ${registry::DeleteKey} "${REGKEY31}" $R0
	  ${registry::DeleteKey} "${REGKEY32}" $R0
	  ${registry::DeleteKey} "${REGKEY33}" $R0
	  ${registry::DeleteKey} "${REGKEY34}" $R0
	  ${registry::DeleteKey} "${REGKEY35}" $R0
*/
	  Sleep 50
	  StrCmp $R0 "-1" CleanUp
	 Goto CleanUp
	CleanUp:

	; === Delete Configuration File ===

	 System::Call "advapi32::GetUserName(t .r0, *i ${NSIS_MAX_STRLEN} r1) i.r2"
	 StrCpy $UserName "$0"

        IfFileExists "$DATADIR\Settings\${APP} Portable Settings.ini" "Remove_IfEmpty_Files" "Skyp_Remove_IfEmpty_Files"
        StrCmp $9 1 "Remove_IfEmpty_Files" "Skyp_Remove_IfEmpty_Files"
        ${If} "$9" == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "InfoPC" "NamePC"
	    StrCmp $0 "" "" +3
	    Remove_IfEmpty_Files:
	    StrCpy $0 "True"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "InfoPC" "NamePC" "$UserName"

	    RMDir /r "$APPDATA\${APP}"
	    RMDir /r "$LOCALAPPDATA\${APP}"
	    RMDir /r "$%PROGRAMFILES%\Common Files\${APP}"
	    RMDir /r "$%PROGRAMDATA%\${APP}"

	    Delete "$DATADIR\${APP} Portable RuntimeData.ini"
	    Delete "$EXEDIR\${APP} Portable.ini"
        ${ElseIf} $0 == "0"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "InfoPC" "NamePC"
	    StrCmp $0 "" "" +3
	    Skyp_Remove_IfEmpty_Files:
	    StrCpy $0 "False"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "InfoPC" "NamePC" "$UserName"
        ${EndIf}
FunctionEnd

# CLEAN UP

Function 'CleanUp'
        IfFileExists "$DATADIR\Settings\${APP} Portable Settings.ini" "Skyp_Remove_Registry_Cleanup_IfEmpty" +4
        StrCmp $0 1 "Remove_Registry_Cleanup_IfEmpty" "Skyp_Remove_Registry_Cleanup_IfEmpty"
        ${If} "$0" == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "RegistryCleanupIfEmpty"
	    StrCmp $0 "" "" +3
	    Remove_Registry_Cleanup_IfEmpty:
	    StrCpy $0 "True"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "RegistryCleanupIfEmpty" "$0"

	    ; === Remove registry key if empty ===
	    registry::_DeleteKeyEmpty /NOUNLOAD "HKEY_CURRENT_USER\Software\MeuProg"
	    registry::_DeleteKeyEmpty /NOUNLOAD "HKEY_LOCAL_MACHINE\SOFTWARE\MeuProg"

        ${ElseIf} $0 == "0"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "RegistryCleanupIfEmpty"
	    StrCmp $0 "" "" +3
	    Skyp_Remove_Registry_Cleanup_IfEmpty:
	    StrCpy $0 "False"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "RegistryCleanupIfEmpty" "$0"
        ${EndIf}
FunctionEnd

# Clean ifempty registri keys

Function CleanUpRegistry
        IfFileExists "$DATADIR\Settings\${APP} Portable Settings.ini" "Remove_Registry_Trash_Key" "Skyp_Remove_Registry_Trash_Key"
        StrCmp $0 1 "Remove_Registry_Trash_Key" "Skyp_Remove_Registry_Trash_Key"
	${If} "$0" == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "RegistryCleanupIfEmpty"
	    StrCmp $0 "" "" +3
	    Remove_Registry_Trash_Key:
	    StrCpy $0 "True"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "RegistryCleanupIfEmpty" "$0"

	    ; === Remove registry key if empty ===
	     DeleteRegKey /ifempty HKCU "Software\${APP}"
	     DeleteRegKey /ifempty HKLM "SOFTWARE\${APP}"

	${ElseIf} $0 == "0"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "RegistryCleanupIfEmpty"
	    StrCmp $0 "" "" +3
	    Skyp_Remove_Registry_Trash_Key:
	    StrCpy $0 "False"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RegistryCleanupIfEmpty" "RegistryCleanupIfEmpty" "$0"
	${EndIf}
FunctionEnd

# REFRESH ICONS

Function RefreshShellIcons
	System::Call /NOUNLOAD "shell32::SHChangeNotify(i, i, i, i) v (0x08000000, 0, 0, 0)"
	#System::Call `shell32::SHChangeNotify(i 0x08000000, i 0, i 0, i 0)`
FunctionEnd

# THE END

Function 'TheEnd'
    	;=== Remove temporary directory ===
        IfFileExists "$DATADIR\Settings\${APP} Portable Settings.ini" "Stop_Splash" "Skyp_Stop_Splash"
        StrCmp $0 1 "Stop_Splash" "Skyp_Stop_Splash"
	${If} "$0" == "1"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "RemoveTempDir" "RemoveTempDir"
	    StrCmp $0 "" "" +3
	    Stop_Splash:
	    StrCpy $0 "True"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RemoveTempDir" "RemoveTempDir" "$0"

    	    System::Call 'Kernel32::GetTempFileName(t "$TEMP", t "$PLUGINSDIR", i 0, t.r0) i.r1'
	    Strcpy $0 "$PLUGINSDIR"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RemoveTempDir" "TempFileName" "$0"

	    newadvsplash::stop ; unload splash screen
	    registry::_Unload ; unload registry plug-in

    	    SetShellVarContext all

    	    System::Call 'kernel32::DeleteFile(t "$PLUGINSDIR\*.dll")i r0'
    	    System::Call 'kernel32::DeleteFileW(t "$PLUGINSDIR\*.dll")i r0'
    	    System::Call 'kernel32::DeleteFileA(t "$PLUGINSDIR\*.dll")i r0'
    	    System::Call 'kernel32::DeleteFileEx(t "$PLUGINSDIR\*.dll")i r0'

    	    System::Call 'kernel32::RemoveDirectory(t "$PLUGINSDIR" )i r0'
    	    System::Call 'kernel32::RemoveDirectoryW(t "$PLUGINSDIR" )i r0'
    	    System::Call 'kernel32::RemoveDirectoryA(t "$PLUGINSDIR" )i r0'
    	    System::Call 'kernel32::RemoveDirectoryEx(t "$PLUGINSDIR" )i r0'

    	    FileClose $RUNTIMEDATA ; unlock file
    	    Delete "$DATADIR\${APP} Portable RuntimeData.ini"

	${ElseIf} $0 == "0"
	    ReadINIStr $0 "$SETTINGSDIR\${APP} Portable Settings.ini" "RemoveTempDir" "RemoveTempDir"
	    StrCmp $0 "" "" +3
	    Skyp_Stop_Splash:
	    StrCpy $0 "False"
	    WriteINIStr "$SETTINGSDIR\${APP} Portable Settings.ini" "RemoveTempDir" "RemoveTempDir" "$0"

	    newadvsplash::stop ; unload splash screen
	    registry::_Unload ; unload registry plug-in

    	    SetShellVarContext all

    	    System::Call 'kernel32::DeleteFile(t "$PLUGINSDIR\*.dll")i r0'
    	    System::Call 'kernel32::DeleteFileW(t "$PLUGINSDIR\*.dll")i r0'
    	    System::Call 'kernel32::DeleteFileA(t "$PLUGINSDIR\*.dll")i r0'
    	    System::Call 'kernel32::DeleteFileEx(t "$PLUGINSDIR\*.dll")i r0'

    	    System::Call 'kernel32::RemoveDirectory(t "$PLUGINSDIR" )i r0'
    	    System::Call 'kernel32::RemoveDirectoryW(t "$PLUGINSDIR" )i r0'
    	    System::Call 'kernel32::RemoveDirectoryA(t "$PLUGINSDIR" )i r0'
    	    System::Call 'kernel32::RemoveDirectoryEx(t "$PLUGINSDIR" )i r0'

    	    FileClose $RUNTIMEDATA ; unlock file
    	    Delete "$DATADIR\${APP} Portable RuntimeData.ini"
	${EndIf}
FunctionEnd
