; Copyleft (c) n/a-n/a CatsSoft

; color background : 0x3e4647 - http://www.color-hex.com/color/3e4647

; color background : 0xC5C4AC - http://www.color-hex.com/color/C5C4AC

; Copyleft (c) n/a-n/a CatsSoft

!addincludedir "Include"

Name "AnyCleaner"
Caption "AnyCleaner"
OutFile "AnyCleaner.exe"
InstallDir "$PROGRAMFILES\AnyCleaner"

!define APPNAME  "AnyCleaner"
!define NAME  "AnyCleaner"
!define DISPLAY_NAME  "AnyCleaner"
!define COMPANYNAME  "Pccaretools"

!define PAGE_WEBSITE_LINK 'Pccaretools.com'
!define HOMEPAGE 'http://free.pccaretools.com/'
!define WEBSITE_LINK 'www.free.pccaretools.com/'

# SOCIAL

!define FACEBOOK 'https://www.facebook.com/'
!define TWITTER 'https://twitter.com/'
!define GOOGLE 'https://plus.google.com/'
!define YOUTUBE 'http://www.youtube.com/'

!define COPYRIGHT "PCCareTools Software"
!define PUBLISHER "PCCareTools Software"
 
!define INPUTBOX
!define INPUTDIR
!define INPUTFIN
!define INIT
!define APPVER '1.6.0.0'
!define VER '1.6.0.0'
!define COMMENTS "Allow $(^Name) to be run from isnstall.For additional Details, visit ${PAGE_WEBSITE_LINK}"
!define /date date "%H:%M %d %b, %Y"

!define TTM_INFOICON 1

VIProductVersion "${APPVER}"
VIAddVersionKey /LANG=1048 "ProductName" "${APPNAME}"
VIAddVersionKey /LANG=1048 "CompanyName" "${PUBLISHER}"
VIAddVersionKey /LANG=1048 "LegalCopyright" "${PUBLISHER}"
VIAddVersionKey /LANG=1048 "LegalTrademarks" "${PUBLISHER}"
VIAddVersionKey /LANG=1048 "FileDescription" "${APPNAME}"
VIAddVersionKey /LANG=1048 "FileVersion" "${APPVER}"
VIAddVersionKey /LANG=1048 "ProductVersion" "${VER}"
VIAddVersionKey /LANG=1048 "InternalName" "${APPNAME}"
VIAddVersionKey /LANG=1048 "OriginalFilename" "${APPNAME}.exe"
VIAddVersionKey /LANG=1048 "File Name" "${APPNAME}.exe"
VIAddVersionKey /LANG=1048 "Comments" "${COMMENTS}"
VIAddVersionKey /LANG=1048 "Language" "English"

# COMPRESSION

SetCompressor /SOLID /FINAL lzma
SetCompress force
SetCompressorDictSize 32
SetDatablockOptimize on
SetDateSave on

# RUN

!define RUNASADMIN

!ifndef RUNASADMIN
   RequestExecutionLevel 'user'
!else
   RequestExecutionLevel 'admin'
!endif

!define CUSTOMUI

!ifdef CUSTOMUI
  !define MUI_UI "UI\mod.exe"
  ChangeUI all "UI\mod.exe"
!endif

# RUNTIME

ShowInstDetails Show ; hide
ShowInstDetails nevershow
ShowUninstDetails NeverShow

# INCLUDES

!include "MUI.nsh"
!include "WinCore.nsh"
!include "nsDialogs.nsh"
!include "LogicLib.nsh"
!include "WinMessages.nsh"
!include "FileFunc.nsh"
!include "LoadRTF.nsh"
!include 'x64.nsh'
!insertmacro GetFileName
!insertmacro GetParameters
!insertmacro DriveSpace
!insertmacro GetParent
!insertmacro GetOptions
!insertmacro GetDrives
!insertmacro GetRoot
!insertmacro GetSize

# Icon & Stye

BrandingText /TRIMRIGHT " "

# ICON

Icon "Icon\appicon.ico"
!define MUI_ICON "Icon\appicon.ico"
!define MUI_UNICON "Icon\Uninstall.ico"

# PAGE

!define MUI_CUSTOMFUNCTION_GUIINIT myGuiInit

!ifdef INPUTBOX 
  Page Custom "Page.Portable.Standard.Mode" "Page.Portable.Standard.Mode.Leave"
!endif

!ifdef INPUTDIR
  Page Custom "Page.Select.DestDir" "Page.Select.DestDir.Leave"
!endif

!define MUI_PAGE_CUSTOMFUNCTION_SHOW InstFilesPageShow
!insertmacro MUI_PAGE_INSTFILES

!ifdef INPUTFIN 
  Page Custom "Page.Finish.Install" "Page.Finish.Install.Leave"
!endif

# UNINSTALL

!define MUI_CUSTOMFUNCTION_UNGUIINIT un.GUIInit
!define MUI_PAGE_CUSTOMFUNCTION_SHOW un.ModifyUnConfirm 
!insertmacro MUI_UNPAGE_CONFIRM
!define MUI_PAGE_CUSTOMFUNCTION_SHOW Un.InstFilesPageShow
!insertmacro MUI_UNPAGE_INSTFILES
UninstPage custom un.FinishPage

# LANGUAGES

!insertmacro MUI_LANGUAGE 'English' # first language is the default language
!include 'Language\English.nsh'

!insertmacro MUI_LANGUAGE 'Romanian'
;!include 'Language\Romanian.nsh'

# LANGUAGE

LangString NSIS.LangDialog.Title '${LANG_ENGLISH}' 'Language'
;LangString NSIS.LangDialog.Title '${LANG_ROMANIAN}' 'Limbã''
 
LangString NSIS.LangDialog.Text '${LANG_ENGLISH}' 'Select your local language.'
;LangString NSIS.LangDialog.Text '${LANG_ROMANIAN}' 'Alege limba ta localã.'

# INIT

Var /global Lang

# LANGUAGE

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

ReserveFile `Images\BG1.bmp`
ReserveFile `Images\BG2.bmp`
ReserveFile `Images\BG3.bmp`
ReserveFile `Images\BG4.bmp`
ReserveFile "images\close.bmp"
ReserveFile "images\minimize.bmp"
ReserveFile "images\express.bmp"
ReserveFile "images\checkbox1.bmp"
ReserveFile "images\checkbox2.bmp"
ReserveFile "images\Browse.bmp"
ReserveFile "images\OK.ico"
ReserveFile "License\License.rtf"

ReserveFile `${NSISDIR}\Plugins\nsDialogs.dll`
ReserveFile `${NSISDIR}\Plugins\nsWindows.dll`
ReserveFile `${NSISDIR}\Plugins\SkinBtn.dll`
ReserveFile `${NSISDIR}\Plugins\SkinProgress.dll`
ReserveFile `${NSISDIR}\Plugins\System.dll`
ReserveFile `${NSISDIR}\Plugins\WndProc.dll`
ReserveFile `${NSISDIR}\Plugins\FindProcDLL.dll`

Var /global MAINPATH

Var /global NormalDestDir
Var /global PortableDestDir
Var /global PortableMode

!macro RequireAdmin
  UserInfo::GetAccountType
  pop $8
  ${If} $8 != "admin"
     MessageBox MB_ICONSTOP "$(NSIS.Admin.Rights)"
     setErrorLevel 740 ;ERROR_ELEVATION_REQUIRED
     quit
  ${EndIf}
!macroend

Function RequireAdmin
  setShellVarContext all
  !insertmacro RequireAdmin
FunctionEnd

!define DEFAULTNORMALDESTINATON "$ProgramFiles\${NAME}"
!define DEFAULTPORTABLEDESTINATON "$MAINPATH\${NAME} Portable"

Function .onInit
    	Call RequireAdmin

  	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "$(^Name)") i .r1 ?e'
  	System::Call 'kernel32::GetLastError() i() .r0'
  	Pop $R0
  	StrCmp $R0 0 done
  	${IfNot} $R0 == 0
  	  MessageBox MB_OK|MB_ICONEXCLAMATION "$(NSIS.Run.Warning)"
 	  Abort
 	${EndIf}
  	  MessageBox MB_OK|MB_ICONEXCLAMATION "$0"
  	done:

	# Language

	System::Call 'KERNEL32::GetUserDefaultLangID()i.r0'
	System::Call "kernel32::GetSystemDefaultLCID()i.R0"
	System::Call `kernel32::GetUserDefaultUILanguage() i.s`
	System::Call 'KERNEL32::GetUserDefaultLangID()i.r0'
	Pop $R0
	strcpy $LANGUAGE '$R0'
	System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SCOUNTRY},t.r1,i1000)'
	System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SENGCOUNTRY},t.r1,i1000)' 
	System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SENGLANGUAGE},t.r2,i1000)'
	StrCpy $Lang $2
	StrCpy $R0 '$(NSIS.LangDialog.Title): $Lang $1.$\n$(NSIS.LangDialog.Text)'
	StrCpy $R1 '$(^NAME)'
  	StrCmp $LANGUAGE "" 0 end

	End:
	!define MUI_LANGDLL_WINDOWTITLE '$R1'
	!define MUI_LANGDLL_INFO $R0
	;!insertmacro MUI_LANGDLL_DISPLAY

	# STANDARD / PORTABLE
 
	StrCpy $NormalDestDir "${DEFAULTNORMALDESTINATON}"
	StrCpy $PortableDestDir "${DEFAULTPORTABLEDESTINATON}"

	${GetParameters} $9

	ClearErrors
	${GetOptions} $9 "/?" $8
	${IfNot} ${Errors}
	    MessageBox MB_ICONINFORMATION|MB_SETFOREGROUND "\
	      /PORTABLE : Extract application to USB drive etc$\n\
	      /S : Silent install$\n\
	      /D=%directory% : Specify destination directory$\n"
	    Quit
	${EndIf}

	ClearErrors
	${GetOptions} $9 "/PORTABLE" $8
	${IfNot} ${Errors}
	    StrCpy $PortableMode 1
	    StrCpy $0 $PortableDestDir
	${Else}
	    StrCpy $PortableMode 0
	    StrCpy $0 $NormalDestDir
	    ${If} ${Silent}
	        Call RequireAdmin
	    ${EndIf}
	${EndIf}

	${If} $InstDir == ""
	    ; User did not use /D to specify a directory, 
	    ; we need to set a default based on the install mode
	    StrCpy $InstDir $0
	${EndIf}
	Call SetModeDestinationFromInstdir

	${GetDrives} "HDD+FDD" GetDrivesCallBack

 	InitPluginsDir
 	SetOverwrite try
 	AllowSkipFiles off
 	File `/ONAME=$PLUGINSDIR\BG1.bmp` `Images\BG1.bmp`
 	File `/ONAME=$PLUGINSDIR\BG2.bmp` `Images\BG2.bmp`
 	File `/ONAME=$PLUGINSDIR\BG3.bmp` `Images\BG3.bmp`
 	File `/ONAME=$PLUGINSDIR\BG4.bmp` `Images\BG4.bmp`

 	File `/oname=$PLUGINSDIR\Btn_Close.bmp` `Images\Close.bmp`
 	File `/oname=$PLUGINSDIR\Btn_Minimize.bmp` `Images\minimize.bmp`
 	File `/oname=$PLUGINSDIR\Btn_express.bmp`"images\express.bmp"
 	File `/oname=$PLUGINSDIR\Btn_Browse.bmp` `Images\Browse.bmp`

        File `/oname=$PLUGINSDIR\loading1.bmp` `images\loading1.bmp`
        File `/oname=$PLUGINSDIR\loading2.bmp` `images\loading2.bmp`

        File `/oname=$PLUGINSDIR\checkbox1.bmp` "images\checkbox1.bmp"
        File `/oname=$PLUGINSDIR\checkbox2.bmp` "images\checkbox2.bmp"

 	File `/oname=$PLUGINSDIR\OK.ico` `Images\OK.ico`

 	SkinBtn::Init "$PLUGINSDIR\Btn_Close.bmp"
 	SkinBtn::Init "$PLUGINSDIR\Btn_Minimize.bmp"
 	SkinBtn::Init "$PLUGINSDIR\Btn_express.bmp"
 	SkinBtn::Init "$PLUGINSDIR\Btn_Browse.bmp"

 	SkinBtn::Init "$PLUGINSDIR\checkbox1.bmp"
 	SkinBtn::Init "$PLUGINSDIR\checkbox2.bmp"

    	File `/oname=$PLUGINSDIR\License.rtf` `License\License.rtf`

        # FONT

        InitPluginsDir
        File '/oname=$PLUGINSDIR\BAARS.ttf' 'Fonts\BAARS.ttf'
        File '/oname=$PLUGINSDIR\Jura.ttf' 'Fonts\Jura.ttf'

        IfFileExists "$FONTS\BAARS.ttf" "NSIS.Continue.1" "NSIS.Install.Font.Baars"
        StrCmp $0 1 "NSIS.Continue.1" "NSIS.Install.Font.Baars"
        ${If} "$0" == "1"
	   NSIS.Continue.1:

        ${ElseIf} $0 == "0"
 	   NSIS.Install.Font.Baars:

	   setShellVarContext all

 	   SetOutPath "$FONTS"

	    CopyFiles /SILENT /FILESONLY "$PLUGINSDIR\BAARS.ttf" "$FONTS\BAARS.ttf"

 	   Push "$FONTS\BAARS.ttf"
 	   System::Call 'GDI32::AddFontResourceEx(t"$PLUGINSDIR\BAARS.ttf",i 0x30,i0)'
 	   System::Call "Gdi32::AddFontResource(t s) i .s"
 	   Pop $0
 	   IntCmp $0 0 0 +2 +2
 	   SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0
         ${EndIf}

        IfFileExists "$FONTS\Jura.ttf" "NSIS.Continue.2" "NSIS.Install.Font.Jura"
        StrCmp $0 1 "NSIS.Continue.2" "NSIS.Install.Font.Jura"
        ${If} "$0" == "1"
	   NSIS.Continue.2:

        ${ElseIf} $0 == "0"
 	   NSIS.Install.Font.Jura:

	   setShellVarContext all

 	   SetOutPath "$FONTS"

	   CopyFiles /SILENT /FILESONLY "$PLUGINSDIR\Jura.ttf" "$FONTS\Jura.ttf"

 	   Push "$FONTS\Jura.ttf"
 	   System::Call 'GDI32::AddFontResourceEx(t"$PLUGINSDIR\Jura.ttf",i 0x30,i0)'
 	   System::Call "Gdi32::AddFontResource(t s) i .s"
 	   Pop $0
 	   IntCmp $0 0 0 +2 +2
 	   SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0
         ${EndIf}

    	# INIT
 
    	!ifdef INIT
	   Call Init
    	!endif

  	Call UpdateFreeSpace
FunctionEnd

Function GetDrivesCallBack
    ;=== Skip usual floppy letters
    StrCmp $8 "FDD" "" CheckForPortableAppsPath
    StrCmp $9 "A:\" End
    StrCmp $9 "B:\" End
	
    CheckForPortableAppsPath:
    IfFileExists "$9PortableApps" "" End
	StrCpy $MAINPATH "$9PortableApps"
    End:
    Push $0
FunctionEnd

var FreeSpaceSize
var DESTDIR
var TotalSpace
var TotalSpaceSize
var UsedSpace
var UsedSpaceSize

Function UpdateFreeSpace
  ${GetRoot} $INSTDIR $0
  StrCpy $1 "Bytes"

  System::Call kernel32::GetDiskFreeSpaceEx(tr0,*l,*l,*l.r0)
   ${If} $0 > 1024
   ${OrIf} $0 < 0
      System::Int64Op $0 / 1024
      Pop $0
      StrCpy $1 "KB"
      ${If} $0 > 1024
      ${OrIf} $0 < 0
     System::Int64Op $0 / 1024
     Pop $0
     StrCpy $1 "MB"
     ${If} $0 > 1024
     ${OrIf} $0 < 0
        System::Int64Op $0 / 1024
        Pop $0
        StrCpy $1 "GB"
     ${EndIf}
      ${EndIf}
   ${EndIf}

   StrCpy $FreeSpaceSize  "$(NSIS.SP_Free) $0 $1"

   ${GetRoot} "$INSTDIR" $DESTDIR
   ${DriveSpace} '$DESTDIR' '/D=T /S=G' $TotalSpace
   StrCpy $TotalSpaceSize "$(NSIS.SP_Total) $TotalSpace $1"

   ${GetRoot} "$INSTDIR" $DESTDIR
   ${DriveSpace} '$DESTDIR' '/D=O /S=G' $UsedSpace
   StrCpy $UsedSpaceSize "$(NSIS.SP_Used) $UsedSpace $1"
FunctionEnd

!define NSIS_TRANSPARENT '!insertmacro CallTransparent'
!macro CallTransparent Transparent
   System::Store S
   System::Call "user32::GetParent(i$HWNDPARENT)i.R2"
   StrCmp $R2 0 +1 +2
   StrCpy $R2 $HWNDPARENT
   IntOp $R1 ${Transparent} * 255
   IntOp $R1 $R1 / 100
   System::call "user32::GetWindowLong(iR2, i-20) i.R0"
   System::call "user32::SetWindowLong(iR2, i-20, i$R0|0x00080000)"
   System::call "user32::SetLayeredWindowAttributes(iR2, i0, iR1, i2)"
   System::Store L
!macroend

Function myGuiInit
    ${NSIS_TRANSPARENT} 93 ; 93%

    System::Call `user32::SetWindowLong(i$HWNDPARENT,i${GWL_STYLE},0x9480084C)i.R0`
    GetDlgItem $0 $HWNDPARENT 1034
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1035
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1036
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1037
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1038
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1039
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1256
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1028
    ShowWindow $0 ${SW_HIDE}

    System::Call 'user32::GetSystemMetrics(i0)i.r1'
    System::Call 'user32::GetSystemMetrics(i1)i.r2'
    IntOp $1 $1 - 575
    IntOp $1 $1 / 2
    IntOp $2 $2 - 335
    IntOp $2 $2 / 2
    System::Call 'user32::MoveWindow(i$HWNDPARENT,i$1,i$2,i575,i335,1)'

    System::Alloc 16
    System::Call user32::GetWindowRect(i$HWNDPARENT,isR0)
    System::Call *$R0(i.R1,i.R2,i.R3,i.R4)
    IntOp $R3 $R3 - $R1
    IntOp $R4 $R4 - $R2
    System::Call gdi32::CreateRoundRectRgn(i0,i0,iR3,iR4,i4,i4)i.r0
    System::Call user32::SetWindowRgn(i$HWNDPARENT,ir0,i1)
    System::Free $R0
FunctionEnd

# WELCOME

!ifdef INPUTBOX

	Function SetModeDestinationFromInstdir
	    ${If} $PortableMode = 0
    		StrCpy $NormalDestDir $InstDir
	    ${Else}
    		StrCpy $PortableDestDir $InstDir
	    ${EndIf}
	FunctionEnd

	!define WS_BORDER 0x00800000

	!define AW_HOR_POSITIVE 0x00000001 
	!define AW_HOR_NEGATIVE 0x00000002 
	!define AW_VER_POSITIVE 0x00000004 
	!define AW_VER_NEGATIVE 0x00000008
	!define AW_CENTER 0x00000010 
	!define AW_HIDE  0x00010000 
	!define AW_ACTIVATE 0x00020000 
	!define AW_SLIDE 0x00040000 
	!define AW_BLEND 0x00080000 

	var /global btn_Close
	Var /global Btn_Minimize

	var /global BGImage
	var /global Image

	var /global dlg

	Var /global PC
	Var /global USB

	Var /global Lbl_Normal.Mode
	Var /global Lbl_Portable.Mode

	Var /global Btn_Next

	Var /global Txt.Welcome

	Var /global DETECT_PARTITION
	Var /global PARTITION
	Var /global SIZEPART
	Var /global DETECT_PLATFORM
	Var /global PLATFORM
	Var /global TransFree
	Var /global USB.USEDSPACE
	Var /global USB.TOTALSPACE

	Var /global Lbl_FreeSpace.Part
	Var /global Lbl_TotalSpace.Part
	Var /global Lbl_UsedSpace.Part

	Var /global USB.FreeSpace
	Var /global Lbl_FreeSpace.Usb
	Var /global Lbl_TotalSpace.Usb
	Var /global Lbl_UsedSpace.Usb

	Function Page.Portable.Standard.Mode

		Call SetModeDestinationFromInstdir

    		GetDlgItem $0 $HWNDPARENT 1
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 2
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 3
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 1990
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 1991
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 1992
    		ShowWindow $0 ${SW_HIDE}

  		System::Call user32::SetWindowPos(i$HWNDPARENT,i0,i0,i0,i575,i335,i0x0002)
  		nsDialogs::Create 1044
  		Pop $dlg
    		${If} $dlg == error
    		    Abort
    		${EndIf}
  		SetCtlColors $dlg "0xC5C4AC" "0x3E4647"

  		System::Call user32::SetWindowPos(i$Dlg,i0,i0,i0,i575,i335,i0x0002)

	# Minimize

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 350u 5u 24 20 "" ; minimize
		Pop $Btn_Minimize
		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Minimize.bmp $Btn_Minimize
		GetFunctionAddress $3 "On_Click_Minimized"
		SkinBtn::onClick $Btn_Minimize $3

		SetCtlColors $Btn_Minimize "0xC5C4AC" "0x3E4647"

		ToolTips::Classic $Btn_Minimize "$(NSIS.Minimize)"

	# Close

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 365u 2u 24 20 "" ; close
		Pop $btn_Close
		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Close.bmp $btn_Close
		GetFunctionAddress $3 "On_Click_Close"
		SkinBtn::onClick $btn_Close $3

		SetCtlColors $btn_Close "0xC5C4AC" "0x3E4647"

		ToolTips::Classic $btn_Close "$(NSIS.Close)"

	# WELCOME

        	nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 150u 3u 150u 17u "$(^Name)"
        	pop $Txt.Welcome
  		SetCtlColors $Txt.Welcome "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Jura" "16" "400"
		SendMessage $Txt.Welcome ${WM_SETFONT} $0 0 

	# DETECT PARTITION (C:\)

        	${GetRoot} "$INSTDIR" $PARTITION

    		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 45u 85u 105u 15u ""
        	Pop $DETECT_PARTITION

    		CreateFont $0 "Baar Sophia" "10" "100"
    		SendMessage $DETECT_PARTITION ${WM_SETFONT} $0 0

    		SetCtlColors $DETECT_PARTITION "0xC5C4AC" "0x3E4647"

		IfFileExists "$PARTITION\Program Files\*.*" "Partition_Detected" "Not_Detected"
		StrCmp $0 1 "Partition_Detected" "Not_Detected"
		${If} "$0" == "1"
		   Partition_Detected:
        	   ${GetRoot} "$INSTDIR" $PARTITION
        	   ${GetRoot} "$INSTDIR" $0
		   ${DriveSpace} "$0\" "/D=F /S=G" '$SIZEPART'  ; G = GiB
		   StrCpy $1 " bytes"

		   System::Call kernel32::GetDiskFreeSpaceEx(tr0,*l,*l,*l.r0)

		   ${If} $0 > 1024
		   ${OrIf} $0 < 0
			System::Int64Op $0 / 1024
			Pop $0
			StrCpy $1 "Kb"
			${If} $0 > 1024
			${OrIf} $0 < 0
				System::Int64Op $0 / 1024
				Pop $0
				StrCpy $1 "Mb"
				${If} $0 > 1024
				${OrIf} $0 < 0
					System::Int64Op $0 / 1024
					Pop $0
					StrCpy $1 "Gb"
				${EndIf}
			${EndIf}
		   ${EndIf}
		   SendMessage $DETECT_PARTITION '${WM_SETTEXT} '1' "STR:$(NSIS.Partition) $PARTITION $(NSIS.Device.Connected)"

		# Free Space

    		  nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 45u 100u 105u 15u ""
        	  Pop $Lbl_FreeSpace.Part

    		  CreateFont $0 "Baar Sophia" "10" "100"
    		  SendMessage $Lbl_FreeSpace.Part ${WM_SETFONT} $0 0

    		  SetCtlColors $Lbl_FreeSpace.Part "0xC5C4AC" "0x3E4647"

		  SendMessage $Lbl_FreeSpace.Part '${WM_SETTEXT} '1' "STR:$FreeSpaceSize"

		# Total Space

    		  nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 45u 115u 105u 15u ""
        	  Pop $Lbl_TotalSpace.Part

    		  CreateFont $0 "Baar Sophia" "10" "100"
    		  SendMessage $Lbl_TotalSpace.Part ${WM_SETFONT} $0 0

    		  SetCtlColors $Lbl_TotalSpace.Part "0xC5C4AC" "0x3E4647"

		  SendMessage $Lbl_TotalSpace.Part '${WM_SETTEXT} '1' "STR:$TotalSpaceSize"

		# Used Space

    		  nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 45u 130u 105u 15u ""
        	  Pop $Lbl_UsedSpace.Part

    		  CreateFont $0 "Baar Sophia" "10" "100"
    		  SendMessage $Lbl_UsedSpace.Part ${WM_SETFONT} $0 0

    		  SetCtlColors $Lbl_UsedSpace.Part "0xC5C4AC" "0x3E4647"

		  SendMessage $Lbl_UsedSpace.Part '${WM_SETTEXT} '1' "STR:$UsedSpaceSize"

	   	${ElseIf} $0 == "0"
	    	   Not_Detected:
		   SendMessage $DETECT_PARTITION '${WM_SETTEXT} '1' "STR:$(NSIS.Destination) $PARTITION"
	  	${EndIf}

	# DETECT PLATFORM (I:\)

    		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 250u 85u 115u 15u ""
        	Pop $DETECT_PLATFORM

    		CreateFont $0 "Baar Sophia" "10" "100"
    		SendMessage $DETECT_PLATFORM ${WM_SETFONT} $0 0

    		SetCtlColors $DETECT_PLATFORM "0xC5C4AC" "0x3E4647"

        	${GetRoot} "$MAINPATH" $PLATFORM

		IfFileExists "$PLATFORM\PortableApps\PortableApps.com\PortableAppsPlatform.exe" "Detect_PortableApps" "Failed_Detect"
		FindProcDLL::FindProc "PortableAppsPlatform.exe"
		POP $0
		StrCmp $0 1 "Detect_PortableApps" "Failed_Detect"
		${If} "$0" == "1"
		   Detect_PortableApps:
        	   ${GetRoot} "$MAINPATH" $PLATFORM
        	   ${GetRoot} "$MAINPATH" $0
		   ${DriveSpace} "$0\" "/D=F /S=G" '$TransFree' ; G = GiB
		   StrCpy $1 " bytes"

		   System::Call kernel32::GetDiskFreeSpaceEx(tr0,*l,*l,*l.r0)

		   ${If} $0 > 1024
		   ${OrIf} $0 < 0
			System::Int64Op $0 / 1024
			Pop $0
			StrCpy $1 "Kb"
			${If} $0 > 1024
			${OrIf} $0 < 0
				System::Int64Op $0 / 1024
				Pop $0
				StrCpy $1 "Mb"
				${If} $0 > 1024
				${OrIf} $0 < 0
					System::Int64Op $0 / 1024
					Pop $0
					StrCpy $1 "Gb"
				${EndIf}
			${EndIf}
		   ${EndIf}

		   Strcpy $USB.FreeSpace '$(NSIS.SP_Free) $0 $1'

		   ${DriveSpace} '$PLATFORM' '/D=O /S=G' $USB.USEDSPACE
		   System::Int64Op $USB.USEDSPACE / 1024

		   ${DriveSpace} '$PLATFORM' '/D=T /S=G' $USB.TOTALSPACE
		   System::Int64Op $USB.TOTALSPACE / 1024

		   SendMessage $DETECT_PLATFORM '${WM_SETTEXT} '1' "STR:$(NSIS.Device) $PLATFORM $(NSIS.Device.Connected)"

		# Free Space

    		   nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 250u 100u 105u 15u ""
        	   Pop $Lbl_FreeSpace.Usb

    		   CreateFont $0 "Baar Sophia" "10" "100"
    		   SendMessage $Lbl_FreeSpace.Usb ${WM_SETFONT} $0 0

    		   SetCtlColors $Lbl_FreeSpace.Usb "0xC5C4AC" "0x3E4647"

		   SendMessage $Lbl_FreeSpace.Usb '${WM_SETTEXT} '1' "STR:$USB.FreeSpace"

		# Total Space

    		   nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 250u 115u 105u 15u ""
        	   Pop $Lbl_TotalSpace.Usb

    		   CreateFont $0 "Baar Sophia" "10" "100"
    		   SendMessage $Lbl_TotalSpace.Usb ${WM_SETFONT} $0 0
  
    		   SetCtlColors $Lbl_TotalSpace.Usb "0xC5C4AC" "0x3E4647"

		   SendMessage $Lbl_TotalSpace.Usb '${WM_SETTEXT} '1' "STR:$(NSIS.SP_Total) $USB.TOTALSPACE $1"

		# Used Space

    		   nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 250u 130u 105u 15u ""
        	   Pop $Lbl_UsedSpace.Usb

    		   CreateFont $0 "Baar Sophia" "10" "100"
    		   SendMessage $Lbl_UsedSpace.Usb ${WM_SETFONT} $0 0

    		   SetCtlColors $Lbl_UsedSpace.Usb "0xC5C4AC" "0x3E4647"

		   SendMessage $Lbl_UsedSpace.Usb '${WM_SETTEXT} '1' "STR:$(NSIS.SP_Used) $USB.USEDSPACE $1"

	   	${ElseIf} $0 == "0"
	    	   Failed_Detect:

		   SendMessage $DETECT_PLATFORM '${WM_SETTEXT} '1' "STR:$(NSIS.Not.Connect)"

		   SendMessage $Lbl_FreeSpace.Usb '${WM_SETTEXT} '1' "STR:"
		   SendMessage $Lbl_TotalSpace.Usb '${WM_SETTEXT} '1' "STR:"
		   SendMessage $Lbl_UsedSpace.Usb '${WM_SETTEXT} '1' "STR:"

        	   ${NSD_CreateTimer} 'on.Click.Connect.Device' 1000
	  	${EndIf}

	# RadioButton

		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000|0x00000000|0x00000C00|0x00000009|0x00002000 0 85u 45u 12u 12u ""
		Pop $PC
		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000|0x00000000|0x00000C00|0x00000009|0x00002000 0 285u 45u 12u 12u ""
		Pop $USB
		${If} $PortableMode = 0
    		  SendMessage $PC ${BM_SETCHECK} ${BST_CHECKED} 0
		${Else}
    		  SendMessage $USB ${BM_SETCHECK} ${BST_CHECKED} 0
		${EndIf}

    		SetCtlColors $PC "0xC5C4AC" "0x3E4647"

    		SetCtlColors $USB "0xC5C4AC" "0x3E4647"

    		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 55u 65u 80u 15u "$(NSIS.Normal.Mode)"
		Pop $Lbl_Normal.Mode

    		CreateFont $0 "Jura" "12" "100"
    		SendMessage $Lbl_Normal.Mode ${WM_SETFONT} $0 0

    		SetCtlColors $Lbl_Normal.Mode "0xC5C4AC" "0x3E4647"

    		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 260u 65u 80u 15u "$(NSIS.Portable.Mode)"
		Pop $Lbl_Portable.Mode

    		CreateFont $0 "Jura" "12" "100"
    		SendMessage $Lbl_Portable.Mode ${WM_SETFONT} $0 0

    		SetCtlColors $Lbl_Portable.Mode "0xC5C4AC" "0x3E4647"

	# Next Page

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 215 170u 145 40 "$(NSIS.NextBtn)"
    		Pop $Btn_Next
		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Express.bmp $Btn_Next
		GetFunctionAddress $3 "on.Click.Next.Page"
		SkinBtn::onClick $Btn_Next $3

		CreateFont $0 "Jura" "15" "400"
		SendMessage $Btn_Next ${WM_SETFONT} $0 0 

    		SetCtlColors $Btn_Next "0xC5C4AC" "0x3E4647"

		ToolTips::Classic $Btn_Next "$(NSIS.NextBtn)"

	# Mouse

        	GetFunctionAddress $0 'on.Click.Mouse.Effect.1'
        	nsDialogs::CreateTimer $0 50

        	GetFunctionAddress $0 'on.Click.Mouse.Effect.2'
        	nsDialogs::KillTimer $0

    	# Background

    		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x0000000E|0x00000100 0 0 0 100% 100% ""
    		Pop $BGImage
   	 	${NSD_SetImage} $BGImage $PLUGINSDIR\BG1.bmp $Image

		ShowWindow $BGImage ${SW_SHOW}

		nsDialogs::Show

	# Back

    		GetFunctionAddress $0 onGUICallback
    		WndProc::onCallback $HWNDPARENT $0
    		;WndProc::onCallback $BGImage $0

 		nsDialogs::Show

		${NSD_FreeIcon} $R0
		${NSD_FreeImage} $IMAGE
		System::Call "user32::DestroyIcon(iR0)"
		System::Call 'user32::DestroyImage(iR0)'
		System::Call "gdi32::DeleteObject(i$IMAGE)"

  		Return
	FunctionEnd

	Function on.Click.Connect.Device
		SendMessage $DETECT_PLATFORM ${WM_SETTEXT} 0 "STR:$(NSIS.Search.Device) 15..."

		IntFmt $R1 "0x%08X" 15

		${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6
		Strcpy $R2 $6

		loop:

		${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6

		Strcmp $R2 $6 loop 0
		Strcpy $R2 $6
		IntOp $R1 $R1 - 1
		IntCmp $R1 0 +3 +3 0
		SendMessage $DETECT_PLATFORM ${WM_SETTEXT} 0 "STR:$(NSIS.Search.Device) $R1..."
		goto loop

		SendMessage $DETECT_PLATFORM ${WM_SETTEXT} 0 "STR:$(NSIS.Devive.Not.Connect)"

        	${NSD_KillTimer} 'on.Click.Connect.Device'

		Call Check.Usb.Device
	FunctionEnd

	Function Check.Usb.Device
		IfFileExists "$PLATFORM\PortableApps\PortableApps.com\PortableAppsPlatform.exe" "NSIS.Detect.Connected.Your.Platform" "NSIS.Not.Detect.Connected.Your.Platform"
		FindProcDLL::FindProc "PortableAppsPlatform.exe"
		POP $0
		StrCmp $0 1 "NSIS.Detect.Connected.Your.Platform" "NSIS.Not.Detect.Connected.Your.Platform"
		${If} "$0" == "1"
		   NSIS.Detect.Connected.Your.Platform:
        	   ${GetRoot} "$MAINPATH" $PLATFORM
        	   ${GetRoot} "$MAINPATH" $0
		   ${DriveSpace} "$0\" "/D=F /S=G" '$TransFree' ; G = GiB
		   StrCpy $1 " bytes"

		   System::Call kernel32::GetDiskFreeSpaceEx(tr0,*l,*l,*l.r0)

		   ${If} $0 > 1024
		   ${OrIf} $0 < 0
			System::Int64Op $0 / 1024
			Pop $0
			StrCpy $1 "Kb"
			${If} $0 > 1024
			${OrIf} $0 < 0
				System::Int64Op $0 / 1024
				Pop $0
				StrCpy $1 "Mb"
				${If} $0 > 1024
				${OrIf} $0 < 0
					System::Int64Op $0 / 1024
					Pop $0
					StrCpy $1 "Gb"
				${EndIf}
			${EndIf}
		   ${EndIf}

		  Strcpy $USB.FreeSpace '$(NSIS.SP_Free) $0 $1'

		  ${DriveSpace} '$PLATFORM' '/D=O /S=G' $USB.USEDSPACE
		  System::Int64Op $USB.USEDSPACE / 1024

		  ${DriveSpace} '$PLATFORM' '/D=T /S=G' $USB.TOTALSPACE
		  System::Int64Op $USB.TOTALSPACE / 1024

		  SendMessage $DETECT_PLATFORM '${WM_SETTEXT} '1' "STR:$(NSIS.Device) $PLATFORM $(NSIS.Device.Connected)"
		  SendMessage $Lbl_UsedSpace.Usb '${WM_SETTEXT} '1' "STR:$(NSIS.SP_Used) $USB.USEDSPACE $1"
		  SendMessage $Lbl_TotalSpace.Usb '${WM_SETTEXT} '1' "STR:$(NSIS.SP_Total) $USB.TOTALSPACE $1"
		  SendMessage $Lbl_FreeSpace.Usb '${WM_SETTEXT} '1' "STR:$USB.FreeSpace"

        	  ${NSD_KillTimer} 'on.Click.Connect.Device'

	   	${ElseIf} $0 == "0"
	    	   NSIS.Not.Detect.Connected.Your.Platform:

		   SendMessage $DETECT_PLATFORM '${WM_SETTEXT} '1' "STR:$(NSIS.Devive.Not.Connect)"

		   SendMessage $Lbl_FreeSpace.Usb '${WM_SETTEXT} '1' "STR:"
		   SendMessage $Lbl_TotalSpace.Usb '${WM_SETTEXT} '1' "STR:"
		   SendMessage $Lbl_UsedSpace.Usb '${WM_SETTEXT} '1' "STR:"

        	   ${NSD_KillTimer} 'on.Click.Connect.Device'
	  	${EndIf}
	FunctionEnd

	Function on.Click.Mouse.Effect.1
		# ${NSD_KillTimer} 'on.Click.Mouse.Effect.1'

		System::Alloc 16
		Pop $0
		System::Call USER32::GetCursorPos(ir0)
		System::Call *$0(i.r1,i.r2)
		System::Free $0
		System::Call USER32::WindowFromPoint(ir1,ir2)i.r1

	# Close

		${If} $1 = $btn_Close
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}

	# Minimize

		${If} $1 = $Btn_Minimize
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}

	# PC

		${If} $1 = $PC
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}

	# USB

		${If} $1 = $USB
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}

	# Next

		${If} $1 = $Btn_Next
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}
	FunctionEnd

	Function On_Click_Minimized
	        ShowWindow $HWNDPARENT ${SW_MINIMIZE}
	FunctionEnd

	Function On_Click_Close
	   	Push "$FONTS\BAARS.ttf"
 	   	System::Call 'Gdi32::RemoveFontResourceEx(t"$PLUGINSDIR\BAARS.ttf",i 0x30,i0)'
	   	System::Call "Gdi32::RemoveFontResource(t s) i .s"
	   	Pop $0
	   	IntCmp $0 0 0 +2 +2
	   	SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0

	   	Delete "$PLUGINSDIR\BAARS.ttf"
	   	Sleep 150

	   	Push "$FONTS\Jura.ttf"
 	   	System::Call 'Gdi32::RemoveFontResourceEx(t"$PLUGINSDIR\Jura.ttf",i 0x30,i0)'
	   	System::Call "Gdi32::RemoveFontResource(t s) i .s"
	   	Pop $0
	   	IntCmp $0 0 0 +2 +2
	   	SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0

	   	Delete "$PLUGINSDIR\Jura.ttf"
	   	Sleep 150

		SendMessage $HWNDPARENT ${WM_CLOSE} 0 0
	FunctionEnd

	Function on.Click.Next.Page
		SendMessage $HWNDPARENT 0x408 1 0
	FunctionEnd

	Function Page.Portable.Standard.Mode.Leave
		${NSD_GetState} $PC $0
		${If} $0 <> ${BST_UNCHECKED}
    		   StrCpy $PortableMode 0
    		   StrCpy $InstDir $NormalDestDir
    		   Call RequireAdmin
		${Else}
    		   StrCpy $PortableMode 1
    		   ;StrCpy $InstDir $PortableDestDir
    		   StrCpy $InstDir '$MAINPATH\$(^Name) Portable'
		${EndIf}
	FunctionEnd
!endif

# WELCOME

!ifdef INPUTDIR
	!define /math PBM_SETRANGE32 ${WM_USER} + 6

	!define EM_SETBKGNDCOLOR 1091
	;!define /math EM_SETBKGNDCOLOR ${WM_USER} + 67
	!define /math EM_GETTEXTRANGE ${WM_USER} + 75
	!define /math EM_AUTOURLDETECT ${WM_USER} + 91
	!define /math EM_SETTEXTEX ${WM_USER} + 97
	!define EM_SETEVENTMASK 0x0445
	!define ES_NOOLEDRAGDROP 8
	!define ENM_LINK 0x4000000
	!define EN_LINK 0x70B
	!define NM_CLICK -2
	!define NM_RETURN -4

	Function SkinBtn_Checked
	  SkinBtn::Set /IMGID=$PLUGINSDIR\checkbox2.bmp $1
	FunctionEnd

	Function SkinBtn_UnChecked
	  SkinBtn::Set /IMGID=$PLUGINSDIR\checkbox1.bmp $1
	FunctionEnd

	var /global Sel.Dest.Dir
	var /global Path.Dest.Dir
	var /global Btn_Search

	var /global Txt.Size.Free
	var /global Txt.Size.Total
	var /global Txt.Size.Used
	var /global Lbl_Size.Estim
	var /global ESTIM.INST.SIZE

	var /global Link.Options
	var /global Sel.Options
	var /global Bool_Option.Installer

	var /global Btn_Install

	var /global Ck_ShortCut
	var /global Bool_ShortCut
	var /global Lbl_ShortCut
	var /global Ck_AutoRun
	var /global Bool_AutoRun
	var /global Lbl_AutoRun
	var /global Ck_FinishPage
	var /global Bool_FinishPage
	var /global Lbl_FinishPage

	var /global Btn_Back

	var /global rtf_License
	var /global Txt.License.1
	var /global Txt.License.2
	var /global Link.Open.License
	var /global Btn_Back.License

	var /global BGImage.License

	var /global SIZE.DESTDIR
	var /global DIR.FREE.SPACE
	var /global DIR.TOTAL.SPACE
	var /global DIR.USED.SPACE

	Function "Page.Select.DestDir"

    		GetDlgItem $0 $HWNDPARENT 1
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 2
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 3
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 1990
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 1991
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 1992
    		ShowWindow $0 ${SW_HIDE}

  		System::Call user32::SetWindowPos(i$HWNDPARENT,i0,i0,i0,i575,i335,i0x0002)
  		nsDialogs::Create 1044
  		Pop $dlg
    		${If} $dlg == error
    		    Abort
    		${EndIf}
  		SetCtlColors $dlg "0xC5C4AC" "0x3E4647"

  		System::Call user32::SetWindowPos(i$Dlg,i0,i0,i0,i575,i335,i0x0002)

	# Minimize

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 350u 5u 24 20 "" ; minimize
		Pop $Btn_Minimize
		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Minimize.bmp $Btn_Minimize
		GetFunctionAddress $3 "On_Click_Minimize.Dir"
		SkinBtn::onClick $Btn_Minimize $3

		SetCtlColors $Btn_Minimize "0xC5C4AC" "0x3E4647"

		ToolTips::Classic $Btn_Minimize "$(NSIS.Minimize)"

	# Close

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 365u 2u 24 20 "" ; close
		Pop $btn_Close
		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Close.bmp $btn_Close
		GetFunctionAddress $3 "On_Click_Close.Dir"
		SkinBtn::onClick $btn_Close $3

		SetCtlColors $btn_Close "0xC5C4AC" "0x3E4647"

		ToolTips::Classic $btn_Close "$(NSIS.Close)"

	# WELCOME

        	nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 150u 3u 150u 17u "$(^Name)"
        	pop $Txt.Welcome
  		SetCtlColors $Txt.Welcome "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Jura" "16" "400"
		SendMessage $Txt.Welcome ${WM_SETFONT} $0 0 

	# Options

        	nsDialogs::CreateControl LINK 0x40000000|0x10000000|0x04000000|0x00010000|0x0000000B 0 20u 30u 115u 15u "$(NSIS.Option.Inst.1)"
        	pop $Link.Options
    		StrCpy $1 $Link.Options
		GetFunctionAddress $3 "on.Click.Open.Options"
		nsDialogs::OnClick $Link.Options $3
    		StrCpy $Bool_Option.Installer 0 ;

  		SetCtlColors $Link.Options "0x009CB2" "0x3E4647"

		CreateFont $0 "Baar Sophia" "15" "400"
		SendMessage $Link.Options ${WM_SETFONT} $0 0 

    		ShowWindow $Link.Options ${SW_SHOW}

  		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 20u 50u 345u 12u ""
        	pop $Sel.Options

		SendMessage $Sel.Options '${WM_SETTEXT}' '0' "STR:$(NSIS.Option.Inst.3)"

  		SetCtlColors $Sel.Options "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Baar Sophia" "10" "100"
		SendMessage $Sel.Options ${WM_SETFONT} $0 0 

    		ShowWindow $Sel.Options ${SW_SHOW}

	# Path Destdir

  		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 20u 70u 145u 12u ""
		Pop $Sel.Dest.Dir

		SendMessage $Sel.Dest.Dir '${WM_SETTEXT}' '0' "STR:$(NSIS.GroupBox.Dest.Dir)"

		CreateFont $0 "Baar Sophia" "10" "100"
		SendMessage $Sel.Dest.Dir ${WM_SETFONT} $0 0 

    		SetCtlColors $Sel.Dest.Dir "0xC5C4AC" "0x3E4647"

    		ShowWindow $Sel.Dest.Dir ${SW_Hide}

		nsDialogs::CreateControl EDIT 0x40000000|0x10000000|0x04000000|0x00010000|0x00000080 0 20u 90u 285u 15u $INSTDIR
		Pop $Path.Dest.Dir
    		GetFunctionAddress $3 "On.Change_Dir"
		nsDialogs::OnChange $Path.Dest.Dir $3

		CreateFont $0 "Baar Sophia" "14" "100"
		SendMessage $Path.Dest.Dir ${WM_SETFONT} $0 0 

    		SetCtlColors $Path.Dest.Dir "0xC5C4AC" "0x515859"

    		ShowWindow $Path.Dest.Dir ${SW_Hide}

		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 310u 88u 55u 18u "$(NSIS.Search.Btn)"
		Pop $Btn_Search
    		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Browse.bmp $Btn_Search
    		GetFunctionAddress $3 "on.Click.Select.Path"
		SkinBtn::onClick $Btn_Search $3

		CreateFont $0 "Baar Sophia" "9" "200"
		SendMessage $Btn_Search ${WM_SETFONT} $0 0 

    		SetCtlColors $Btn_Search "0xC5C4AC" "0x3E4647"

    		ShowWindow $Btn_Search ${SW_Hide}

	# Size Dir

        	${GetRoot} "$INSTDIR" $0
		${DriveSpace} "$0\" "/D=F /S=G" '$SIZE.DESTDIR'  ; G = GiB
		StrCpy $1 "bytes"

		System::Call kernel32::GetDiskFreeSpaceEx(tr0,*l,*l,*l.r0)

		${If} $0 > 1024
		  ${OrIf} $0 < 0
		    System::Int64Op $0 / 1024
		    Pop $0
		    StrCpy $1 "Kb"
		     ${If} $0 > 1024
		       ${OrIf} $0 < 0
			 System::Int64Op $0 / 1024
			 Pop $0
			 StrCpy $1 "Mb"
			  ${If} $0 > 1024
			    ${OrIf} $0 < 0
			      System::Int64Op $0 / 1024
			      Pop $0
			      StrCpy $1 "Gb"
			  ${EndIf}
		      ${EndIf}
		${EndIf}

	# Calc Used Space

        	${GetRoot} "$INSTDIR" $0
		${DriveSpace} '$0' '/D=O /S=G' $DIR.FREE.SPACE
		# SendMessage $Txt.Size.Free '${WM_SETTEXT} '0' "STR:$(NSIS.SP_Used) $DIR.FREE.SPACE $1"

	# Calc Total Space

        	${GetRoot} "$INSTDIR" $0
		${DriveSpace} '$0' '/D=T /S=G' $DIR.TOTAL.SPACE
		# SendMessage $Txt.Size.Total '${WM_SETTEXT} '0' "STR:$(NSIS.SP_Total) $DIR.TOTAL.SPACE $1"

        	${GetRoot} "$INSTDIR" $0
        	${DriveSpace} '$0' '/D=O /S=G' $DIR.USED.SPACE
		# SendMessage $Txt.Size.Used '${WM_SETTEXT} '0' "STR:$(NSIS.SP_Used) $DIR.TOTAL.SPACE $1"

	# Space

  		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 20uu 115u 100u 10u ""
        	pop $Txt.Size.Free
  		SetCtlColors $Txt.Size.Free "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Baar Sophia" "9" "200"
		SendMessage $Txt.Size.Free ${WM_SETFONT} $0 0 

		SendMessage $Txt.Size.Free '${WM_SETTEXT}' '0' "STR:$(NSIS.SP_Used) $DIR.FREE.SPACE $1"

    		ShowWindow $Txt.Size.Free ${SW_Hide}

  		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 150u 115u 100u 10u ""
        	pop $Txt.Size.Total
  		SetCtlColors $Txt.Size.Total "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Baar Sophia" "9" "200"
		SendMessage $Txt.Size.Total ${WM_SETFONT} $0 0 

		SendMessage $Txt.Size.Total '${WM_SETTEXT}' '0' "STR:$(NSIS.SP_Total) $DIR.TOTAL.SPACE $1"

    		ShowWindow $Txt.Size.Total ${SW_Hide}

  		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 260u 115u 100u 10u ""
        	pop $Txt.Size.Used
  		SetCtlColors $Txt.Size.Used "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Baar Sophia" "9" "200"
		SendMessage $Txt.Size.Used ${WM_SETFONT} $0 0 

		SendMessage $Txt.Size.Used '${WM_SETTEXT}' '0' "STR:$(NSIS.SP_Used) $DIR.FREE.SPACE $1"

    		ShowWindow $Txt.Size.Used ${SW_Hide}

  		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 280u 190u 165 15 ""
  		Pop $Lbl_Size.Estim
  		SetCtlColors $Lbl_Size.Estim "0xC5C4AC" "0x3E4647"

		SendMessage $Lbl_Size.Estim '${WM_SETTEXT}' '0' "STR:$(NSIS.SP_Required) $ESTIM.INST.SIZE"

	# Next Page

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 215 170u 145 40 "$(NSIS.NextBtn)"
    		Pop $Btn_Install
    		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_express.bmp $Btn_Install
    		GetFunctionAddress $3 "on.Click.Install"
    		SkinBtn::onClick $Btn_Install $3

		CreateFont $0 "Baar Sophia" "15" "400"
		SendMessage $Btn_Install ${WM_SETFONT} $0 0 

    		SetCtlColors $Btn_Install "0xC5C4AC" "0x3E4647"

    		ShowWindow $Btn_Install ${SW_SHOW}

		ToolTips::Classic $Btn_Install "$(NSIS.NextBtn)"

	# Shortcut

    		${If} $PortableMode == 1

		   nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 20u 135u 15 15 ""
		   Pop $Ck_ShortCut
		   StrCpy $1 $Ck_ShortCut
		   Call SkinBtn_UnChecked
		   GetFunctionAddress $3 "OnClick_CheckShortCut"
    		   SkinBtn::onClick $1 $3
		   StrCpy $Bool_ShortCut 1

    		   SetCtlColors $Ck_ShortCut "0xC5C4AC" "0x3E4647"

    		   ShowWindow $Ck_ShortCut ${SW_HIDE}

	  	   EnableWindow $Ck_ShortCut 0
		${Else}

		   nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 20u 135u 15 15 ""
		   Pop $Ck_ShortCut
		   StrCpy $1 $Ck_ShortCut
		   Call SkinBtn_Checked
		   GetFunctionAddress $3 "OnClick_CheckShortCut"
    		   SkinBtn::onClick $1 $3
		   StrCpy $Bool_ShortCut 1

    		   SetCtlColors $Ck_ShortCut "0xC5C4AC" "0x3E4647"

    		   ShowWindow $Ck_ShortCut ${SW_HIDE}

	  	   EnableWindow $Ck_ShortCut 1
		${EndIf}

    		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 35u 135u 100 15 "$(NSIS.Create.Shortcut)"
    		Pop $Lbl_ShortCut
		GetFunctionAddress $3 "OnClick_CheckShortCut"
  		nsDialogs::OnClick $Lbl_ShortCut $3

    		SetCtlColors $Lbl_ShortCut "0xC5C4AC" "0x3E4647"

    		ShowWindow $Lbl_ShortCut ${SW_HIDE}

	# AutoRun

    		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 150u 135u 15 15 ""
		Pop $Ck_AutoRun
		StrCpy $1 $Ck_AutoRun
		Call SkinBtn_Checked
		GetFunctionAddress $3 "OnClick_CheckAutoRun"
    		SkinBtn::onClick $1 $3
		StrCpy $Bool_AutoRun 1

    		SetCtlColors $Ck_AutoRun "0xC5C4AC" "0x3E4647"

    		ShowWindow $Ck_AutoRun ${SW_HIDE}

    		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 165u 135u 100 15 "$(NSIS.Create.Autorun)"
    		Pop $Lbl_AutoRun
		GetFunctionAddress $3 "OnClick_CheckAutoRun"
  		nsDialogs::OnClick $Lbl_AutoRun $3

    		SetCtlColors $Lbl_AutoRun "0xC5C4AC" "0x3E4647"

    		ShowWindow $Lbl_AutoRun ${SW_HIDE}

	# FinishPage

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 260u 135u 15 15 ""
		Pop $Ck_FinishPage
		StrCpy $1 $Ck_FinishPage
		Call SkinBtn_Checked
		GetFunctionAddress $3 "OnClick_CheckFinishPage"
  		SkinBtn::onClick $1 $3
		StrCpy $Bool_FinishPage 1

  		SetCtlColors $Ck_FinishPage "0xC5C4AC" "0x3E4647"

    		ShowWindow $Ck_FinishPage ${SW_HIDE}

  		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 275u 135u 100 15 "$(NSIS.Create.Web)"
  		Pop $Lbl_FinishPage
		GetFunctionAddress $3 "OnClick_CheckFinishPage"
  		nsDialogs::OnClick $Lbl_FinishPage $3

  		SetCtlColors $Lbl_FinishPage "0xC5C4AC" "0x3E4647"

    		ShowWindow $Lbl_FinishPage ${SW_HIDE}

	# Btn Back

        	nsDialogs::CreateControl LINK 0x40000000|0x10000000|0x04000000|0x00010000|0x0000000B 0 20u 160u 35u 10u "$(NSIS.BackBtn)"
        	pop $Btn_Back
    		GetFunctionAddress $3 "on.Click.Back.Page"
    		nsDialogs::OnClick $Btn_Back $3

  		SetCtlColors $Btn_Back "0xC5C4AC" "0x181c1c"

		CreateFont $0 "Baar Sophia" "10" "300"
		SendMessage $Btn_Back ${WM_SETFONT} $0 0 

	# Btn Next

        	nsDialogs::CreateControl LINK 0x40000000|0x10000000|0x04000000|0x00010000|0x0000000B 0 330u 160u 35u 10u "$(NSIS.NextBtn)"
        	pop $Btn_Next
    		GetFunctionAddress $3 "on.Click.Install"
    		nsDialogs::OnClick $Btn_Next $3

  		SetCtlColors $Btn_Next "0xC5C4AC" "0x181c1c"

		CreateFont $0 "Baar Sophia" "10" "300"
		SendMessage $Btn_Next ${WM_SETFONT} $0 0 

	# License

        	nsDialogs::CreateControl LINK 0x40000000|0x10000000|0x04000000|0x00010000|0x0000000B 0 10u 190u 75u 12u "$(NSIS.License.Agreement.1)"
        	pop $Link.Open.License
    		GetFunctionAddress $3 "on.Click.Open.License"
    		nsDialogs::OnClick $Link.Open.License $3

  		SetCtlColors $Link.Open.License "0x009CB2" "0x3E4647"

		CreateFont $0 "Baar Sophia" "10" "300"
		SendMessage $Link.Open.License ${WM_SETFONT} $0 0 

    		ShowWindow $Link.Open.License ${SW_SHOW}

        	nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 130u 3u 155u 15u "$(NSIS.License.Agreement.1)"
        	pop $Txt.License.1
  		SetCtlColors $Txt.License.1 "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Jura" "15" "200"
		SendMessage $Txt.License.1 ${WM_SETFONT} $0 0 

    		ShowWindow $Txt.License.1 ${SW_HIDE}

        	nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 20u 33u 315u 15u "$(NSIS.License.Agreement.2)"
        	pop $Txt.License.2
  		SetCtlColors $Txt.License.2 "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Baar Sophia" "10" "300"
		SendMessage $Txt.License.2 ${WM_SETFONT} $0 0 

    		ShowWindow $Txt.License.2 ${SW_HIDE}

	; RichEdit20W

  		nsDialogs::CreateControl RichEdit20A 0x00000800|0x10000000|0x40000000|0x00010000|0x00200000|0x00000004|0x00001000 0x00020000 20u 50u 342u 100u ''
    		Pop $rtf_License
  		SendMessage $rtf_License 1115 1 0
  		SendMessage $rtf_License 0x0445 0 0x4000000

  		${NSD_OnNotify} $rtf_License 'on.Click.Notify.1'
    		${LoadRTF} '$PLUGINSDIR\license.rtf' $rtf_License

    		ShowWindow $rtf_License ${SW_HIDE}

	# Btn Back License

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 260 170u 60 35 "$(NSIS.BackBtn)"
        	pop $Btn_Back.License
  		SkinBtn::Set /IMGID=$PLUGINSDIR\Btn_Browse.bmp $Btn_Back.License
    		GetFunctionAddress $3 "on.Click.Back"
    		SkinBtn::onClick $Btn_Back.License $3

  		SetCtlColors $Btn_Back.License "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Baar Sophia" "10" "300"
		SendMessage $Btn_Back.License ${WM_SETFONT} $0 0 

    		ShowWindow $Btn_Back.License ${SW_HIDE}

	# Mouse

        	GetFunctionAddress $0 'on.Click.Mouse.Effect.2'
        	nsDialogs::CreateTimer $0 50

    	# Background

    		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x0000000E|0x00000100 0 0 0 100% 100% ""
    		Pop $BGImage.License
  		StrCpy $R0 $BGImage.License
  		System::Call "user32::LoadImage(i 0, ts, i 0, i0, i0, i0x0010) i.r0" $PLUGINSDIR\BG2.bmp
  		SendMessage $R0 0x0172 0 $0
  		Pop $R0

    		ShowWindow $BGImage.License ${SW_HIDE}

    		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x0000000E|0x00000100 0 0 0 100% 100% ""
    		Pop $BGImage
  		StrCpy $R0 $BGImage
  		System::Call "user32::LoadImage(i 0, ts, i 0, i0, i0, i0x0010) i.r0" $PLUGINSDIR\BG2.bmp
  		SendMessage $R0 0x0172 0 $0
  		Pop $R0

    		ShowWindow $BGImage ${SW_SHOW}

	# Back

    		GetFunctionAddress $0 onGUICallback
    		WndProc::onCallback $HWNDPARENT $0
    		WndProc::onCallback $BGImage $0

 		nsDialogs::Show

		${NSD_FreeIcon} $R0
		${NSD_FreeImage} $R0
		System::Call "user32::DestroyIcon(iR0)"
		System::Call 'user32::DestroyImage(iR0)'
		System::Call "gdi32::DeleteObject(i$R0)"

  		Return
	FunctionEnd

	Function on.Click.Open.Options
		${IF} $Bool_Option.Installer == 1

		   System::Call `user32::AnimateWindow(i$Lbl_FinishPage,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Ck_FinishPage,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Lbl_AutoRun,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Ck_AutoRun,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Lbl_ShortCut,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Ck_ShortCut,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Txt.Size.Used,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Txt.Size.Total,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Txt.Size.Free,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Btn_Search,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Path.Dest.Dir,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`
		   System::Call `user32::AnimateWindow(i$Sel.Dest.Dir,i500,i${AW_SLIDE}|${AW_VER_NEGATIVE}|${AW_HIDE})`

    		   ShowWindow $Txt.Size.Used ${SW_HIDE}
    		   ShowWindow $Txt.Size.Total ${SW_HIDE}
    		   ShowWindow $Txt.Size.Free ${SW_HIDE}
    		   ShowWindow $Btn_Search ${SW_HIDE}
    		   ShowWindow $Path.Dest.Dir ${SW_HIDE}
    		   ShowWindow $Sel.Dest.Dir ${SW_HIDE}

    		   ShowWindow $Ck_ShortCut ${SW_HIDE}
    		   ShowWindow $Lbl_ShortCut ${SW_HIDE}
    		   ShowWindow $Ck_AutoRun ${SW_HIDE}
    		   ShowWindow $Lbl_AutoRun ${SW_HIDE}
    		   ShowWindow $Ck_FinishPage ${SW_HIDE}
    		   ShowWindow $Lbl_FinishPage ${SW_HIDE}

			IntOp $Bool_Option.Installer $Bool_Option.Installer - 1
			StrCpy $1 $Link.Options
		 ${Else}

		   System::Call `user32::AnimateWindow(i$Sel.Dest.Dir,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`
		   System::Call `user32::AnimateWindow(i$Path.Dest.Dir,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`
		   System::Call `user32::AnimateWindow(i$Btn_Search,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`
		   System::Call `user32::AnimateWindow(i$Txt.Size.Free,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`
	   	   System::Call `user32::AnimateWindow(i$Txt.Size.Total,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`
		   System::Call `user32::AnimateWindow(i$Txt.Size.Used,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`

		   System::Call `user32::AnimateWindow(i$Ck_ShortCut,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`
		   System::Call `user32::AnimateWindow(i$Lbl_ShortCut,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`
		   System::Call `user32::AnimateWindow(i$Ck_AutoRun,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`
		   System::Call `user32::AnimateWindow(i$Lbl_AutoRun,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`
		   System::Call `user32::AnimateWindow(i$Ck_FinishPage,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`
		   System::Call `user32::AnimateWindow(i$Lbl_FinishPage,i500,i|${AW_SLIDE}|${AW_VER_POSITIVE})`

    		   ShowWindow $Txt.Size.Used ${SW_SHOW}
    		   ShowWindow $Txt.Size.Total ${SW_SHOW}
    		   ShowWindow $Txt.Size.Free ${SW_SHOW}
    		   ShowWindow $Btn_Search ${SW_SHOW}
    		   ShowWindow $Path.Dest.Dir ${SW_SHOW}
    		   ShowWindow $Sel.Dest.Dir ${SW_SHOW}

    		   ShowWindow $Ck_ShortCut ${SW_SHOW}
    		   ShowWindow $Lbl_ShortCut ${SW_SHOW}
    		   ShowWindow $Ck_AutoRun ${SW_SHOW}
    		   ShowWindow $Lbl_AutoRun ${SW_SHOW}
    		   ShowWindow $Ck_FinishPage ${SW_SHOW}
    		   ShowWindow $Lbl_FinishPage ${SW_SHOW}

			IntOp $Bool_Option.Installer $Bool_Option.Installer + 1
			StrCpy $1 $Link.Options
  		${EndIf}
	FunctionEnd

	Function OnClick_CheckShortCut
  		${IF} $Bool_ShortCut == 1
		  IntOp $Bool_ShortCut $Bool_ShortCut - 1
		  StrCpy $1 $Ck_ShortCut
		  Call SkinBtn_UnChecked
		${ELSE}
		  IntOp $Bool_ShortCut $Bool_ShortCut + 1
		  StrCpy $1 $Ck_ShortCut
		  Call SkinBtn_Checked
		${EndIf}
	FunctionEnd

	Function OnClick_CheckAutoRun
  		${IF} $Bool_AutoRun == 1
		  IntOp $Bool_AutoRun $Bool_AutoRun - 1
		  StrCpy $1 $Ck_AutoRun
		  Call SkinBtn_UnChecked
		${ELSE}
		  IntOp $Bool_AutoRun $Bool_AutoRun + 1
		  StrCpy $1 $Ck_AutoRun
		  Call SkinBtn_Checked
		${EndIf}
	FunctionEnd

	Function OnClick_CheckFinishPage
  		${IF} $Bool_FinishPage == 1
		  IntOp $Bool_FinishPage $Bool_FinishPage - 1
		  StrCpy $1 $Ck_FinishPage
		  Call SkinBtn_UnChecked
		${ELSE}
		  IntOp $Bool_FinishPage $Bool_FinishPage + 1
		  StrCpy $1 $Ck_FinishPage
		  Call SkinBtn_Checked
		${EndIf}
	FunctionEnd

	Function on.Click.Open.License

    		ShowWindow $BGImage ${SW_HIDE}
    		ShowWindow $BGImage.License ${SW_SHOW}
    		ShowWindow $Btn_Install ${SW_HIDE}

  		ShowWindow $Txt.Welcome ${SW_HIDE}

    		ShowWindow $Txt.License.1 ${SW_SHOW}
    		ShowWindow $Txt.License.2 ${SW_SHOW}
    		ShowWindow $rtf_License ${SW_SHOW}

    		ShowWindow $Btn_Back.License ${SW_SHOW}

    		ShowWindow $Link.Open.License ${SW_HIDE}

    		ShowWindow $Link.Options ${SW_HIDE}
    		ShowWindow $Sel.Options ${SW_HIDE}
    		ShowWindow $Sel.Dest.Dir ${SW_HIDE}
    		ShowWindow $Path.Dest.Dir ${SW_HIDE}
    		ShowWindow $Btn_Search ${SW_HIDE}
    		ShowWindow $Txt.Size.Free ${SW_HIDE}
    		ShowWindow $Txt.Size.Total ${SW_HIDE}
    		ShowWindow $Txt.Size.Used ${SW_HIDE}
    		ShowWindow $Lbl_Size.Estim ${SW_HIDE}

    		ShowWindow $Ck_ShortCut ${SW_HIDE}
    		ShowWindow $Lbl_ShortCut ${SW_HIDE}
    		ShowWindow $Ck_AutoRun ${SW_HIDE}
    		ShowWindow $Lbl_AutoRun ${SW_HIDE}
    		ShowWindow $Ck_FinishPage ${SW_HIDE}
    		ShowWindow $Lbl_FinishPage ${SW_HIDE}
	FunctionEnd

	Function on.Click.Back
    		ShowWindow $BGImage ${SW_SHOW}
    		ShowWindow $BGImage.License ${SW_HIDE}
    		ShowWindow $Btn_Install ${SW_SHOW}

  		ShowWindow $Txt.Welcome ${SW_SHOW}

    		ShowWindow $Txt.License.1 ${SW_HIDE}
    		ShowWindow $Txt.License.2 ${SW_HIDE}
    		ShowWindow $rtf_License ${SW_HIDE}

    		ShowWindow $Btn_Back.License ${SW_HIDE}

    		ShowWindow $Link.Open.License ${SW_SHOW}

    		ShowWindow $Ck_ShortCut ${SW_HIDE}
    		ShowWindow $Lbl_ShortCut ${SW_HIDE}
    		ShowWindow $Ck_AutoRun ${SW_HIDE}
    		ShowWindow $Lbl_AutoRun ${SW_HIDE}
    		ShowWindow $Ck_FinishPage ${SW_HIDE}
    		ShowWindow $Lbl_FinishPage ${SW_HIDE}

    		ShowWindow $Link.Options ${SW_SHOW}
    		ShowWindow $Sel.Options ${SW_SHOW}
    		ShowWindow $Sel.Dest.Dir ${SW_HIDE}
    		ShowWindow $Path.Dest.Dir ${SW_HIDE}
    		ShowWindow $Btn_Search ${SW_HIDE}
    		ShowWindow $Txt.Size.Free ${SW_HIDE}
    		ShowWindow $Txt.Size.Total ${SW_HIDE}
    		ShowWindow $Txt.Size.Used ${SW_HIDE}
    		ShowWindow $Lbl_Size.Estim ${SW_SHOW}
	FunctionEnd

	Function on.Click.Back.Page
   		SendMessage $HWNDPARENT "0x408" "-1" "0"
	FunctionEnd

	Function On.Change_Dir
	   ;Pop $0
	   ;System::Call `user32::GetWindowText(i$Path.Dest.Dir, t.r0, i${NSIS_MAX_STRLEN})`
	   ;StrCpy $INSTDIR $0
	FunctionEnd

	var /global spaceAvailable
	var /global DESTINATION
	var /global Space.Total
	var /global USED.SPACE
	var /global MYFOLDERTYPE
	var /global PARENTFOLDERDIR
	var /global GETFOLDERNAME
	var /global BASEFOLDERNAME
	var /global ROOTFOLDERS 
	var /global ERROR
	var /global SIZE

	Function on.Click.Select.Path
  		Pop $0

  		Push '$INSTDIR'
  		Call 'GetParent'
  		Pop $R0

  		Push '$INSTDIR'
  		Push "\"
  		Call 'GetLastPart'
  		Pop $R1

  		nsDialogs::SelectFolderDialog "$(NSIS.GroupBox.Dest.Dir)" "$R0"
  		Pop $0
  		${If} $0 == "error"
		  StrCmp $0 "error" +3
    		   Return
  		${EndIf}
  		${If} $0 != ""
		   StrCpy $ERROR "$(Err)"
		   StrCpy $MYFOLDERTYPE "$0\$R1"
		   ${NSD_SetText} $Path.Dest.Dir "$MYFOLDERTYPE"
		   StrCpy '$INSTDIR' "$0\$R1"
		   system::Call `user32::SetWindowText(i $Path.Dest.Dir, t "$INSTDIR")`
  		${EndIf}

     		${GetParent} "$MYFOLDERTYPE" $PARENTFOLDERDIR
     		${GetFileName} "$MYFOLDERTYPE" $GETFOLDERNAME 
     		${GetBaseName} "$MYFOLDERTYPE" $BASEFOLDERNAME
     		${GetRoot} "$MYFOLDERTYPE" $ROOTFOLDERS 

		${If} $MYFOLDERTYPE != ""

		   Strcpy $INSTDIR $MYFOLDERTYPE

  		   ${GetRoot} $INSTDIR $DESTINATION
  		   ${DriveSpace} "$DESTINATION" "/D=F /S=G" $spaceAvailable ; G = GiB

		   StrCpy $SIZE "$spaceAvailable"

  		   StrCpy $1 "Bytes"

		   ${If} $SIZE > 1024
		     ${OrIf} $SIZE < 0
		       System::Int64Op $SIZE / 1024
		       Pop $SIZE
		       StrCpy $1 "kb"
		       ${If} $SIZE > 1024
		         ${OrIf} $SIZE < 0
		           System::Int64Op $SIZE / 1024
		           Pop $SIZE
		           StrCpy $1 "mb"
		           ${If} $0 > 1024
		             ${OrIf} $SIZE < 0
		               System::Int64Op $SIZE / 1024
		               Pop $0
		               StrCpy $1 "gb"
		           ${EndIf}
		        ${EndIf}
		     ${EndIf}
		    SendMessage $Txt.Size.Free ${WM_SETTEXT} 0 "STR:$(NSIS.SP_Free) $SIZE $1"

        	   ${GetRoot} "$INSTDIR" $DESTINATION
		   ${DriveSpace} '$DESTINATION' '/D=T /S=G' $Space.Total
    		   SendMessage $Txt.Size.Total '${WM_SETTEXT}' '1' "STR:$(NSIS.SP_Total) $Space.Total $1"

        	   ${GetRoot} "$INSTDIR" $DESTINATION
		   ${DriveSpace} '$DESTINATION' '/D=O /S=G' $USED.SPACE
		   SendMessage $Txt.Size.Used '${WM_SETTEXT} '1' "STR:$(NSIS.SP_Used) $USED.SPACE $1"

		${ElseIf} $0 == "0"

		   StrCmp $ERROR "$(Err)" +3

    		   ${NSD_SetText} $Path.Dest.Dir "$(Err)"

		   System::Call "Kernel32::GetLastError() i() .r1"
		   Messagebox MB_OK|MB_USERICON '$(Err)$\n$\n$(Error_code) $1'
  		${EndIf}
	FunctionEnd

	Function 'GetParent'
  		Exch $R0
  		Push $R1
  		Push $R2
  		Push $R3
  		StrCpy $R1 0
  		StrLen $R2 $R0
  		loop:
    		  IntOp $R1 $R1 + 1
    		  IntCmp $R1 $R2 get 0 get
    		  StrCpy $R3 $R0 1 -$R1
    		  StrCmp $R3 "\" get
    		  Goto loop
  	     get:
    		StrCpy $R0 $R0 -$R1
    		Pop $R3
    		Pop $R2
    		Pop $R1
    		Exch $R0
	FunctionEnd

	Function 'GetLastPart'
  		Exch $0
  		Exch
  		Exch $1
  		Push $2
  		Push $3
  		StrCpy $2 0
  		loop:
    		 IntOp $2 $2 - 1
    		 StrCpy $3 $1 1 $2
    		 StrCmp $3 "" 0 +3
      		   StrCpy $0 ""
      		   Goto exit2
    		StrCmp $3 $0 exit1
    		Goto loop
  	    exit1:
    		IntOp $2 $2 + 1
    		StrCpy $0 $1 "" $2
  	    exit2:
    		Pop $3
    		Pop $2
    		Pop $1
    		Exch $0
	FunctionEnd

	var /global HWND

	Function on.Click.Notify.1
  		Pop $hwnd
  		Pop $1
  		Pop $2  
  		${If} $1 = ${EN_LINK}
  		  System::Call "*$2(i.r0, i.r1, i.r2, i.r3, i.r4, i.r5, i.r6, i.r7)"
  		   ${If} $3 = ${WM_LBUTTONUP}
  		     IntOp $0 $7 - $6
  		     IntOp $0 $0 + 1
  		     System::Call "*(&t$0) i.R0" 
  		     System::Call "*(i$6, i$7, i$R0) i.r1"

  		     SendMessage $rtf_License ${EM_GETTEXTRANGE} 0 $1 $2

  		     System::Call "*$R0(&t$0.r2)"

  		     SetCtlColors $2 "0x43B1F4" '0XFFFFFF'
  		     ExecShell "" "$2"
  		     Abort
  		     System::Free $1
  		     System::Free $0
  		  ${EndIf}
  		${EndIf}
	FunctionEnd

	Function on.Click.Mouse.Effect.2
		# ${NSD_KillTimer} 'on.Click.Mouse.Effect.2'

		System::Alloc 16
		Pop $0
		System::Call USER32::GetCursorPos(ir0)
		System::Call *$0(i.r1,i.r2)
		System::Free $0
		System::Call USER32::WindowFromPoint(ir1,ir2)i.r1

	# Close

		${If} $1 = $btn_Close
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}

	# Minimize

		${If} $1 = $Btn_Minimize
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}

	# Install

		${If} $1 = $btn_Install
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}

	# Search

		${If} $1 = $Btn_Search
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}

	# Back License

		${If} $1 = $Btn_Back.License
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}
	FunctionEnd

	Function on.Click.Install
    		${NSD_GetText} $Path.Dest.Dir $R0
    		ClearErrors
    		CreateDirectory "$R0"
    		IfErrors 0 +3
    		  MessageBox MB_ICONINFORMATION|MB_OK '"$(NSIS.Err.Create.Dest.Dir)'
    		Return

    		StrCpy $INSTDIR $R0

    		StrCpy $R9 1
		SendMessage $HWNDPARENT 0x408 1 0
    		Abort
	FunctionEnd

	Function On_Click_Minimize.Dir
	        ShowWindow $HWNDPARENT ${SW_MINIMIZE}
	FunctionEnd

	Function On_Click_Close.Dir
	   	Push "$FONTS\BAARS.ttf"
 	   	System::Call 'Gdi32::RemoveFontResourceEx(t"$PLUGINSDIR\BAARS.ttf",i 0x30,i0)'
	   	System::Call "Gdi32::RemoveFontResource(t s) i .s"
	   	Pop $0
	   	IntCmp $0 0 0 +2 +2
	   	SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0

	   	Delete "$PLUGINSDIR\BAARS.ttf"
	   	Sleep 150

	   	Push "$FONTS\Jura.ttf"
 	   	System::Call 'Gdi32::RemoveFontResourceEx(t"$PLUGINSDIR\Jura.ttf",i 0x30,i0)'
	   	System::Call "Gdi32::RemoveFontResource(t s) i .s"
	   	Pop $0
	   	IntCmp $0 0 0 +2 +2
	   	SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0

	   	Delete "$PLUGINSDIR\Jura.ttf"
	   	Sleep 150

		SendMessage $HWNDPARENT ${WM_CLOSE} 0 0
	FunctionEnd

	Function Page.Select.DestDir.Leave

	FunctionEnd
!endif

# INSTALER

var /global UserName

!define PathMakeSystemFolder "!insertmacro PATH_MAKE_SYSTEM_FOLDER"
!macro PATH_MAKE_SYSTEM_FOLDER pszPath
    	System::Call    "shlwapi::PathMakeSystemFolder(t '${pszPath}') i."
!macroend

Section "$(^NAME)" Main

	${If} $PortableMode = 0

	  SetDetailsPrint textonly
	  DetailPrint `$(NSIS.Install.Progress)`
	  SetDetailsPrint listonly
	  SetDetailsView hide
	
	  SectionIn RO

	  FindWindow $0 "#32770" "" $HWNDPARENT
	  SendMessage $0 ${WM_SETICON} 1 1
	  SendMessage $0 ${WM_SETICON} 0 0
	  System::Call 'user32::UpdateWindow(i r0) i .r1'

	  IfFileExists "$INSTDIR\*.*" "Yes.Uninstall" "Skyp.Continue.Install"
	  StrCmp $0 1 "Yes.Uninstall" "Skyp.Continue.Install"
	  ${If} "$0" == "1"
	    Yes.Uninstall:

	     ReadRegStr $R0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" "InstallLocation"

	     StrCmp $R0 "" NO_Install YES_Install

	     YES_Install:

    	     SendMessage $R1 ${WM_SETTEXT} 0 "STR:$(NSIS.Uninstall.Print)"
    	     SendMessage $R3 ${WM_SETTEXT} 0 "STR:$(NSIS.Uninstall.Sub.Title)"

	     SetDetailsPrint textonly
	     DetailPrint "$(NSIS.Uninstall.Print)" 
	     SetDetailsPrint listonly
   
	     SetShellVarContext all
	     Delete "$DESKTOP\$(^Name).lnk"
	     RMDir /r "$SMPROGRAMS\$(^Name)"

	     ExecWait '"$INSTDIR\uninst-$(^Name).exe" /S _?=$INSTDIR'

	     RMDir /r '$INSTDIR'

	     Goto NSIS.Continue.Install

	     NO_Install:

    	     SendMessage $R1 ${WM_SETTEXT} 0 "STR:$(NSIS.Uninstall.Print)"
    	     SendMessage $R3 ${WM_SETTEXT} 0 "STR:$(NSIS.Uninstall.Sub.Title)"

	     SetDetailsPrint textonly
	     DetailPrint "$(NSIS.Uninstall.Print)" 
	     SetDetailsPrint listonly
   
	     SetShellVarContext all
	     Delete "$DESKTOP\$(^Name).lnk"
	     RMDir /r "$SMPROGRAMS\$(^Name)"

	     ExecWait '"$INSTDIR\uninst-$(^Name).exe" /S _?=$INSTDIR'

	     Goto NSIS.Continue.Install

	  ${ElseIf} $0 == "0"
	     Skyp.Continue.Install:

	     Goto NSIS.Continue.Install

	  ${EndIf}

	  NSIS.Continue.Install:

	  Sleep 1500

    	  SendMessage $R1 ${WM_SETTEXT} 0 "STR:$(NSIS.Install)"
    	  SendMessage $R3 ${WM_SETTEXT} 0 "STR:$(NSIS.Install.Sub.Title)"

	  SetDetailsPrint textonly
	  DetailPrint `$(NSIS.Install.Progress)`
	  SetDetailsPrint listonly
	  SetDetailsView hide

	# (1)

	  SetOverwrite on

	  CreateDirectory "$INSTDIR"
	  SetOutPath "$INSTDIR"
	  File /r /x thumbs.db "${APPNAME}\*.*"

	# (2)

	  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "DisplayName" "${DISPLAY_NAME}"
	  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "UninstallString" '"$INSTDIR\uninst-${NAME}.exe"' 
	  WriteUninstaller "$INSTDIR\uninst-${NAME}.exe"

	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "InstallLocation" "$INSTDIR"
	  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "DisplayName" "${NAME}"
	  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "DisplayIcon" "$INSTDIR\${NAME}.exe,0"
	  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "DisplayVersion" "${APPVER}"
	  WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "VersionMajor" "${APPVER}"
	  WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "VersionMinor" "${APPVER}"
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "Publisher" "${COMPANYNAME}"
	  ${GetSize} "$INSTDIR" "/S=0K" $0 $1 $2
 	  IntFmt $0 "0x%08X" $0
	  WriteRegDWord HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "EstimatedSize" "$0"
	  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "URLInfoAbout" "${WEBSITE_LINK}"
	  ${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6
	  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "InstallDate" "$0.$1.$2"

	  WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NoModify" "1"
	  WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NoRepair" "1"
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "Comments" "Cleaning your computer"

	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: App Path" "$INSTDIR"
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: Icon Group" "${NAME}"

	  System::Call 'KERNEL32::GetUserDefaultLangID()i.r0'
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: Language ID" "$0"
	  System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SENGCOUNTRY},t.r1,i1000)'
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: Country" "$1"
	  System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SCOUNTRY},t.r1,i1000)'
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: Locale Country" "$1"
	  System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SENGLANGUAGE},t.r1,i1000)'
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: Language" "$1"
	  System::Call 'KERNEL32::GetUserGeoID(i${GEOCLASS_NATION})i.r0'
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: Geo ID" "$0"
	  ${If} $0 <> ${GEOID_NOT_AVAILABLE} ; Only available if the user has set a country/location
	    ${AndIf} $0 != "error" ; GetUserGeoID is WinXP+
	    System::Call 'KERNEL32::GetGeoInfo(i$0,i${GEO_ISO2},t.r1,i1000,i0)'
	    WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: ISO2" "$1"
	    System::Call 'KERNEL32::GetGeoInfo(i$0,i${GEO_ISO3},t.r1,i1000,i0)'
	    WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: ISO3" "$1"
	    System::Call 'KERNEL32::GetGeoInfo(i$0,i${GEO_OFFICIALNAME},t.r1,i1000,i0)'
	    WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: OfficialName" "$1"
	    System::Call 'KERNEL32::GetGeoInfo(i$0,i${GEO_LATITUDE},t.r1,i1000,i0)'
	    WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: Latitude" "$1"
	    System::Call 'KERNEL32::GetGeoInfo(i$0,i${GEO_LONGITUDE},t.r1,i1000,i0)'
	    WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: Longitude" "$1"
	  ${EndIf}

	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: Setup Version" "${APPVER}"

	  System::Call "advapi32::GetUserName(t .r0, *i ${NSIS_MAX_STRLEN} r1) i.r2"
	  StrCpy $UserName "$0"
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "NSIS Setup: User" "$UserName"

	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "QuietUninstallString" '"$INSTDIR\uninst-${NAME}.exe" /SILENT'
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "HelpLink" "${WEBSITE_LINK}"
	  WriteRegExpandStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "URLUpdateInfo" "${WEBSITE_LINK}"

	  CreateDirectory "$INSTDIR\Menu\Images"
	  SetOutPath "$INSTDIR\Menu\Images"
	  File 'images\${NAME}.ico'

	  CreateDirectory "$INSTDIR\Menu\Images"
	  SetFileAttributes "$INSTDIR" SYSTEM
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "ConfirmFileOp" "0"
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "NoSharing" "1"
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "IconResource" "$INSTDIR\Menu\Images\${APPNAME}.ico,0"
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "IconFile" "$INSTDIR\Menu\Images\${APPNAME}.ico"
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "IconIndex" "2"
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "InfoTip" "Compiler script"
	  ${PathMakeSystemFolder} "$INSTDIR"
	  SetFileAttributes "$INSTDIR\desktop.ini" HIDDEN|SYSTEM 

          SetOverwrite off

	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 500
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 500
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 500
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 500
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50

	  Sleep 1500

	  Call GetInstalledSize

	  Sleep 1500

	  Call RefreshShellIcons

	  Sleep 1500

          SetAutoClose true

	${Else}

	  IfFileExists "$INSTDIR\*.*" "Yes.Uninstall.Portable" "Skyp.Continue.Install.Portable"
	  StrCmp $0 1 "Yes.Uninstall.Portable" "Skyp.Continue.Install.Portable"
	  ${If} "$0" == "1"
	    Yes.Uninstall.Portable:

    	    SendMessage $R1 ${WM_SETTEXT} 0 "STR:$(NSIS.Uninstall.Print)"
    	    SendMessage $R3 ${WM_SETTEXT} 0 "STR:$(NSIS.Uninstall.Sub.Title)"

	    RMDir /r '$INSTDIR'

	    Goto NSIS.Continue.Install.Portable

	  ${ElseIf} $0 == "0"
	    Skyp.Continue.Install.Portable:

	    Goto NSIS.Continue.Install.Portable

	  ${EndIf}

	  NSIS.Continue.Install.Portable:

	  Sleep 1500

    	  SendMessage $R1 ${WM_SETTEXT} 0 "STR:$(NSIS.Install)"
    	  SendMessage $R3 ${WM_SETTEXT} 0 "STR:$(NSIS.Install.Sub.Title)"

	  SetDetailsPrint textonly
	  DetailPrint `$(NSIS.Install.Progress)`
	  SetDetailsPrint listonly
	  SetDetailsView hide

	  SetOutPath "$INSTDIR"
	  File "${NAME} Portable\${APPNAME} Portable.exe"

	  SetOutPath "$INSTDIR\App\${APPNAME}"
	  File /r /x thumbs.db "${APPNAME}\*.*"

	  CreateDirectory "$INSTDIR\App\${APPNAME}\Menu\Images"
	  SetOutPath "$INSTDIR\App\${APPNAME}\Menu\Images"
	  File 'Images\${APPNAME}.ico'

	  CreateDirectory "$INSTDIR\App\${APPNAME}\Menu\Images"
	  SetFileAttributes "$INSTDIR" SYSTEM
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "ConfirmFileOp" "0"
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "NoSharing" "1"
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "IconResource" "$INSTDIR\App\${APPNAME}\Menu\Images\${APPNAME}.ico,0"
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "IconFile" "$INSTDIR\App\${APPNAME}\Menu\Images\${APPNAME}.ico"
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "IconIndex" "2"
	  WriteINIStr "$INSTDIR\desktop.ini" ".ShellClassInfo" "InfoTip" "Compiler script"
	  ${PathMakeSystemFolder} "$INSTDIR"
	  SetFileAttributes "$INSTDIR\desktop.ini" HIDDEN|SYSTEM 

	  FileOpen $0 "$INSTDIR\App\${APPNAME}\portable.dat" w
	  FileWrite $0 "PORTABLE"
	  FileClose $0

	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 500
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 500
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 500
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 500
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50
	  Sleep 50

	  Sleep 1500

	  Call GetInstalledSize

	  Sleep 1500

	  Call RefreshShellIcons

	  Sleep 1500

          SetAutoClose true
	${EndIf}
SectionEnd

Var GetInstalledSize.total
Function GetInstalledSize
	Push $0
	Push $1
	StrCpy $GetInstalledSize.total 0
	${ForEach} $1 0 256 + 1
		${if} ${SectionIsSelected} $1
			SectionGetSize $1 $0
			IntOp $GetInstalledSize.total $GetInstalledSize.total + $0
		${Endif}
 
		; Error flag is set when an out-of-bound section is referenced
		${if} ${errors}
			${break}
		${Endif}
	${Next}
 
	ClearErrors
	Pop $1
	Pop $0
	IntFmt $GetInstalledSize.total "0x%08X" $GetInstalledSize.total
	Push $GetInstalledSize.total
FunctionEnd

Section -Post
	${GetSize} "$INSTDIR" "/S=0K" $0 $1 $2
 	IntFmt $0 "0x%08X" $0
  	DetailPrint `EstimatedSize $0` 
SectionEnd

Function RefreshShellIcons
	System::Call "shell32::SHChangeNotify(i 0x08000000, i 0, i 0, i 0)"
FunctionEnd

!ifdef INIT
	Function Init
		; === Destroy size lol ===
		StrCpy $0 0
		${If} ${SectionIsSelected} $0
	    	  SectionGetSize $${Main} $1
		  IntOp $0 $0 + $1
		${EndIf}	
		InTop $0 $0 * 1024 ; KBytes -> Bytes
		IntOp $1 $0 / 1000000
		IntOp $2 $0 % 1000000
		StrCpy $2 $2 2 0
		IntOp $3 $0 / 1048576
		IntOp $4 $0 % 1048576
		StrCpy $4 $4 2 0
		SectionSetSize $${Main} "0" ;use ($1,$2 MB) ;or ($3,$4 MB)
		Strcpy $ESTIM.INST.SIZE '$3,$4 MB'
	FunctionEnd
!endif

var ImageHandle

Function InstFilesPageShow
  FindWindow $R2 "#32770" "" $HWNDPARENT

  ShowWindow $0 ${SW_HIDE}
  GetDlgItem $1 $R2 1027
  ShowWindow $1 ${SW_HIDE}

  StrCpy $R0 $R2
  System::Call "user32::MoveWindow(i R0, i 0, i 0, i 575, i 335) i r2"
  GetFunctionAddress $0 onGUICallback
  WndProc::onCallback $R0 $0

  GetDlgItem $R0 $R2 1004
  SetCtlColors $R2 "0xC5C4AC" "0x3E4647"
  System::Call "user32::MoveWindow(i R0, i 15, i 300, i 540, i 6) i r2"

  GetDlgItem $R1 $R2 1006
  SetCtlColors $R1 "0xC5C4AC" "0x3E4647"
  System::Call "user32::MoveWindow(i R1, i 15, i 270, i 535, i 15) i r2"
  CreateFont $1 "Baar Sophia" "10" "100"
  SendMessage $R1 ${WM_SETFONT} $1 0

  GetDlgItem $R8 $R2 1016
  ;SetCtlColors $R8 "" F6F6F6
  System::Call "user32::MoveWindow(i R8, i 0, i 0, i 588, i 216) i r2"

  FindWindow $R2 "#32770" "" $HWNDPARENT
  GetDlgItem $R0 $R2 1995
  System::Call "user32::MoveWindow(i R0, i 0, i 0, i 498, i 373) i r2"
  ${NSD_SetImage} $R0 $PLUGINSDIR\BG3.bmp $ImageHandle

  FindWindow $R2 "#32770" "" $HWNDPARENT
  GetDlgItem $5 $R2 1004
  SkinProgress::Set $5 "$PLUGINSDIR\loading2.bmp" "$PLUGINSDIR\loading1.bmp"

  SendMessage $HWNDPARENT ${WM_SETTEXT} 0 "STR:$(NSIS.Install)"

  FindWindow $R0 "#32770" "" $HWNDPARENT
  System::Call 'User32::CreateWindowEx(i 0, t "STATIC", t "$(NSIS.Install)", i ${WS_CHILD}|${WS_VISIBLE}|${WS_EX_TRANSPARENT}, i 5, i 5, i 200, i 25, i R0, i 0, i 0, i 0) i.R1'
  CreateFont $1 "Baar Sophia" "17" "400"
  SendMessage $R1 ${WM_SETFONT} $1 0
  SetCtlColors $R1 "0xC5C4AC" "0x3E4647"

  w7tbp::Start

  StrCpy $R9 1
  Call RelGotoPage
FunctionEnd

Function 'RelGotoPage'
  IntCmp $R9 0 0 Move Move
  StrCmp $R9 "X" 0 Move
  StrCpy $R9 "120"
 
  Move:
   SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd 

# FINISH

!ifdef INPUTFIN
	var /global Btn_Terminate
	var /global ICON
	var /global Txt.Finish.1
	var /global Txt.Finish.2

	Function 'Page.Finish.Install'

    		GetDlgItem $0 $HWNDPARENT 1
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 2
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 3
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 1990
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 1991
    		ShowWindow $0 ${SW_HIDE}
    		GetDlgItem $0 $HWNDPARENT 1992
    		ShowWindow $0 ${SW_HIDE}

  		System::Call user32::SetWindowPos(i$HWNDPARENT,i0,i0,i0,i575,i335,i0x0002)
  		nsDialogs::Create 1044
  		Pop $dlg
    		${If} $dlg == error
    		    Abort
    		${EndIf}
  		SetCtlColors $dlg "0xC5C4AC" "0x3E4647"

  		System::Call user32::SetWindowPos(i$Dlg,i0,i0,i0,i575,i335,i0x0002)

	# Minimize

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 350u 5u 24 20 "" ; minimize
		Pop $Btn_Minimize
		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Minimize.bmp $Btn_Minimize
		GetFunctionAddress $3 "On_Click_Minimize.Fin"
		SkinBtn::onClick $Btn_Minimize $3

		SetCtlColors $Btn_Minimize "0xC5C4AC" "0x3E4647"

		ToolTips::Classic $Btn_Minimize "$(NSIS.Minimize)"

	# Close

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 365u 2u 24 20 "" ; close
		Pop $btn_Close
		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Close.bmp $btn_Close
		GetFunctionAddress $3 "On_Click_Close.Fin"
		SkinBtn::onClick $btn_Close $3

		SetCtlColors $btn_Close "0xC5C4AC" "0x3E4647"

		ToolTips::Classic $btn_Close "$(NSIS.Close)"

	# WELCOME

        	nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 150u 3u 150u 17u "$(^Name)"
        	pop $Txt.Welcome
  		SetCtlColors $Txt.Welcome "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Jura" "16" "400"
		SendMessage $Txt.Welcome ${WM_SETFONT} $0 0 

	# Finish

        	nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 100u 110u 200u 15u "$(NSIS.Finish.Title)"
        	pop $Txt.Finish.1
  		SetCtlColors $Txt.Finish.1 "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Baar Sophia" "15" "500"
		SendMessage $Txt.Finish.1 ${WM_SETFONT} $0 0 

        	nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 155u 135u 105u 15u "$(NSIS.Installed.Succefurly)"
        	pop $Txt.Finish.2
  		SetCtlColors $Txt.Finish.2 "0xC5C4AC" "0x3E4647"

		CreateFont $0 "Baar Sophia" "10" "100"
		SendMessage $Txt.Finish.2 ${WM_SETFONT} $0 0 

		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000003|0x00000100 0 150u 30u 128u 128u "" ; icon
		Pop $ICON
		SetCtlColors $ICON "0xC5C4AC" "0x3E4647"

		System::Call 'user32::LoadImage(i 0, t "$PLUGINSDIR\Ok.ico", i ${IMAGE_ICON}, i 0, i 0, i ${LR_CREATEDIBSECTION}|${LR_LOADFROMFILE}) i.s'
		Pop $R0
		SendMessage $ICON ${STM_SETIMAGE} ${IMAGE_ICON} "$R0"
		${NSD_AddStyle} $ICON "${IMAGE_ICON}"

	# Terminate

  		nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 215 170u 145 40 ""
    		Pop $Btn_Terminate
    		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_express.bmp $Btn_Terminate
    		GetFunctionAddress $3 "On.Click.Finish.App"
    		SkinBtn::onClick $Btn_Terminate $3

		SendMessage $Btn_Terminate '${WM_SETTEXT}' '0' "STR:$(NSIS.Close)"

    		SetCtlColors $Btn_Terminate "0xC5C4AC" "0x3E4647"

		ToolTips::Classic $Btn_Terminate "$(NSIS.Close)"

		CreateFont $0 "Baar Sophia" "15" "400"
		SendMessage $Btn_Terminate ${WM_SETFONT} $0 0 

	# Mouse

        	GetFunctionAddress $0 'on.Click.Mouse.Effect.3'
        	nsDialogs::CreateTimer $0 50

    	# Background

    		nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x0000000E|0x00000100 0 0 0 100% 100% ""
    		Pop $BGImage
  		StrCpy $R0 $BGImage
  		System::Call "user32::LoadImage(i 0, ts, i 0, i0, i0, i0x0010) i.r0" $PLUGINSDIR\BG4.bmp
  		SendMessage $R0 0x0172 0 $0
  		Pop $R0

    		ShowWindow $BGImage ${SW_SHOW}

	# Back

    		GetFunctionAddress $0 onGUICallback
    		WndProc::onCallback $HWNDPARENT $0
    		WndProc::onCallback $BGImage $0

 		nsDialogs::Show

		${NSD_FreeIcon} $R0
		${NSD_FreeImage} $R0
		System::Call "user32::DestroyIcon(iR0)"
		System::Call 'user32::DestroyImage(iR0)'
		System::Call "gdi32::DeleteObject(i$R0)"

  		Return
	FunctionEnd

	Function On.Click.Finish.App
		SendMessage $Txt.Finish.2 ${WM_SETTEXT} 0 "STR:$(NSIS.Close.In) 5 $(NSIS.Seconds)..."

		IntFmt $R1 "0x%08X" 5

		${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6
		Strcpy $R2 $6

		loop:

		${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6

		Strcmp $R2 $6 loop 0
		Strcpy $R2 $6
		IntOp $R1 $R1 - 1
		IntCmp $R1 0 +3 +3 0
		SendMessage $Txt.Finish.2 ${WM_SETTEXT} 0 "STR:$(NSIS.Close.In) $R1 $(NSIS.Seconds)..."
		goto loop

		SendMessage $Txt.Finish.2 ${WM_SETTEXT} 0 "STR:$(NSIS.Close.Now)"

		Call On_Click_Close.Fin
	FunctionEnd 

	Function on.Click.Mouse.Effect.3
		# ${NSD_KillTimer} 'on.Click.Mouse.Effect.3'

		System::Alloc 16
		Pop $0
		System::Call USER32::GetCursorPos(ir0)
		System::Call *$0(i.r1,i.r2)
		System::Free $0
		System::Call USER32::WindowFromPoint(ir1,ir2)i.r1

	# Close

		${If} $1 = $btn_Close
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}

	# Minimize

		${If} $1 = $btn_Minimize
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}

	# Terminate

		${If} $1 = $Btn_Terminate
		  System::Call USER32::LoadCursor(i,i32649)i.s
		  System::Call USER32::SetCursor(is) 
		${Else}
		  System::Call 'USER32::IsWindowVisible(ir3)i.r0'
		${EndIf}
	FunctionEnd 

	Function On_Click_Minimize.Fin
	        ShowWindow $HWNDPARENT ${SW_MINIMIZE}
	FunctionEnd

	Function On_Click_Close.Fin
		Push "$FONTS\BAARS.ttf"
 		System::Call 'Gdi32::RemoveFontResourceEx(t"$PLUGINSDIR\BAARS.ttf",i 0x30,i0)'
		System::Call "Gdi32::RemoveFontResource(t s) i .s"
		Pop $0
		IntCmp $0 0 0 +2 +2
		SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0

		Delete "$PLUGINSDIR\BAARS.ttf"
		Sleep 150

	   	Push "$FONTS\Jura.ttf"
 	   	System::Call 'Gdi32::RemoveFontResourceEx(t"$PLUGINSDIR\Jura.ttf",i 0x30,i0)'
	   	System::Call "Gdi32::RemoveFontResource(t s) i .s"
	   	Pop $0
	   	IntCmp $0 0 0 +2 +2
	   	SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0

	   	Delete "$PLUGINSDIR\Jura.ttf"
	   	Sleep 150

		SendMessage $HWNDPARENT 0x408 1 0
	FunctionEnd

	Function 'Page.Finish.Install.Leave'
    		${If} $PortableMode == 1

    		${Else}
    		  ${If} $Bool_ShortCut == 1
	  	     SetShellVarContext all
	  	     CreateShortCut "$DESKTOP\$(^Name).lnk" "$INSTDIR\$(^Name).exe"
		  ${EndIf}
		${EndIf}

    		${If} $Bool_AutoRun == 1
	  	   ExecShell "open" '$INSTDIR\$(^Name).exe'
	  	   ExecShell "open" '$INSTDIR\$(^Name) Portable.exe'
		${EndIf}

    		${If} $Bool_FinishPage == 1
        	   ExecShell open "http://www.portableroapps.blogspot.com/"
    		${EndIf}
	FunctionEnd
!endif

# BACK

Function 'onGUICallback'
  ${If} $Dlg = ${WM_LBUTTONDOWN}
    	SendMessage $HWNDPARENT ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
FunctionEnd

# CHECK

Function .onVerifyInstDir
  IfFileExists $INSTDIR\*.* 0 invalid
  StrLen $0 $INSTDIR
  IntCmpU $0 3 0 0 invalid
  Return
  invalid:
  Abort
FunctionEnd 

# SUCCES

Function .onInstSuccess
  ;Messagebox MB_OK|MB_ICONINFORMATION "$(NSIS.Succes.Install)"
  Abort
Quit
FunctionEnd

# FAILED

Function .onInstFailed
  MessageBox MB_OK "$(NSIS.Failed.Install)"
  RMDir "/r" $INSTDIR ; remove directory if empty
  Abort
  Quit
FunctionEnd

# THE END

Function .onGUIEnd
  System::Call `gdi32:DeleteObject(i s)` $IMAGE
  System::Call "user32::DestroyIcon(iR0)"
  System::Call 'user32::DestroyImage(iR0)'
FunctionEnd

# UNINSTALL

Function 'un.onInit'
    # Language

    System::Call 'KERNEL32::GetUserDefaultLangID()i.r0'
    System::Call 'kernel32::GetSystemDefaultLCID()i.R0'
    System::Call `kernel32::GetUserDefaultUILanguage() i.s`
    System::Call 'KERNEL32::GetUserDefaultLangID()i.r0'
    Pop $R0
    strcpy $LANGUAGE '$R0'
    System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SCOUNTRY},t.r1,i1000)'
    System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SENGCOUNTRY},t.r1,i1000)' 
    System::Call 'KERNEL32::GetLocaleInfo(i$0,i${LOCALE_SENGLANGUAGE},t.r2,i1000)'
    StrCpy $Lang $2
    StrCmp $LANGUAGE "" 0 Un.End
    Un.End:

    SetShellVarContext all
    IfSilent 0 +3 
     MessageBox MB_ICONQUESTION|MB_YESNO|MB_TOPMOST "$(NSIS.Msg.Uninstall)" IDYES next IDNO +2 
    Abort 
    HideWindow
    next:
    !insertmacro RequireAdmin

    InitPluginsDir
    File `/ONAME=$PLUGINSDIR\BG5.bmp` `Images\BG5.bmp`
    File `/ONAME=$PLUGINSDIR\BG3.bmp` `Images\BG3.bmp`
    File `/ONAME=$PLUGINSDIR\BG4.bmp` `Images\BG4.bmp`

    File `/ONAME=$PLUGINSDIR\Btn_Minimize.bmp` `Images\Minimize.bmp`
    File `/oname=$PLUGINSDIR\btn_Close.bmp` `Images\Close.bmp`
    File `/oname=$PLUGINSDIR\btn_Express.bmp` `Images\Express.bmp`

    File `/oname=$PLUGINSDIR\Trash.ico` `Images\Trash.ico`
    File `/oname=$PLUGINSDIR\OK.ico` `images\OK.ico`

    SkinBtn::Init "$PLUGINSDIR\btn_Close.bmp"
    SkinBtn::Init "$PLUGINSDIR\btn_Minimize.bmp"
    SkinBtn::Init "$PLUGINSDIR\btn_Express.bmp"

    # FONT

    InitPluginsDir
    File '/oname=$PLUGINSDIR\BAARS.ttf' 'Fonts\BAARS.ttf'

    IfFileExists "$FONTS\BAARS.ttf" "Un.Continue" "Un.InstallFont"
    StrCmp $0 1 "Un.Continue" "Un.InstallFont"
    ${If} "$0" == "1"
      Un.Continue:

    ${ElseIf} $0 == "0"
      Un.InstallFont:

      setShellVarContext all

      SetOutPath "$FONTS"

      CopyFiles /SILENT /FILESONLY "$PLUGINSDIR\BAARS.ttf" "$FONTS\BAARS.ttf"

      Push "$FONTS\BAARS.ttf"
      System::Call 'GDI32::AddFontResourceEx(t"$PLUGINSDIR\BAARS.ttf",i 0x30,i0)'
      System::Call "Gdi32::AddFontResource(t s) i .s"
      Pop $0
      IntCmp $0 0 0 +2 +2
      SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0
    ${EndIf}
FunctionEnd

Function un.GUIInit
    System::Call `user32::SetWindowLong(i$HWNDPARENT,i${GWL_STYLE},0x9480084C)i.R0`
    GetDlgItem $0 $HWNDPARENT 1034
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1035
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1036
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1037
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1038
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1039
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1256
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1028
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 2
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 3
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1990
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1991
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1992
    ShowWindow $0 ${SW_HIDE}

    System::Call 'user32::GetSystemMetrics(i0)i.r1'
    System::Call 'user32::GetSystemMetrics(i1)i.r2'
    IntOp $1 $1 - 575
    IntOp $1 $1 / 2
    IntOp $2 $2 - 335
    IntOp $2 $2 / 2
    System::Call 'user32::MoveWindow(i$HWNDPARENT,i$1,i$2,i575,i335,1)'

    System::Alloc 16
    System::Call user32::GetWindowRect(i$HWNDPARENT,isR0)
    System::Call *$R0(i.R1,i.R2,i.R3,i.R4)
    IntOp $R3 $R3 - $R1
    IntOp $R4 $R4 - $R2
    System::Call gdi32::CreateRoundRectRgn(i0,i0,iR3,iR4,i4,i4)i.r0
    System::Call user32::SetWindowRgn(i$HWNDPARENT,ir0,i1)
    System::Free $R0
FunctionEnd

# Welcome Uninstall Page

var Un_Btn_Close
var Un_Btn_Minimize
var Un.Btn_Next
var Un.BGImage
var Un.IMAGE
var Un.dlg
var Un.Msg.Leave.1
var Un.Msg.Leave.2
var Un.Txt.Welcome
var Un.ICON

Function un.ModifyUnConfirm

    GetDlgItem $0 $HWNDPARENT 1
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 2
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 3
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1990
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1991
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1992
    ShowWindow $0 ${SW_HIDE}

    System::Call 'user32::SetWindowPos(i$hwndparent,i,i,i,i 575,i 335,i 0x16)'
    nsDialogs::Create 1044
    Pop $Un.dlg
    ${If} $Un.dlg == error
    	Abort
    ${EndIf}
    SetCtlColors $Un.dlg "0xC5C4AC" "0x3E4647"

    System::Call 'user32::MoveWindow(i$Un.dlg,i0,i0,i 575,i 335,i0)'

    System::Alloc 16
    System::Call user32::GetWindowRect(i$HWNDPARENT,isR0)
    System::Call *$R0(i.R1,i.R2,i.R3,i.R4)
    IntOp $R3 $R3 - $R1
    IntOp $R4 $R4 - $R2
    System::Call gdi32::CreateRoundRectRgn(i0,i0,iR3,iR4,i4,i4)i.r0
    System::Call user32::SetWindowRgn(i$HWNDPARENT,ir0,i1)
    System::Free $R0

    SendMessage $HWNDPARENT ${WM_SETTEXT} 0 "STR:$(NSIS.Uninstall)"

    # Minimize

    nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 350u 5u 24 20 "" ; minimize
    Pop $Un_Btn_Minimize
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Minimize.bmp $Un_Btn_Minimize
    GetFunctionAddress $3 "Un.On_Click_Minimize"
    SkinBtn::onClick $Un_Btn_Minimize $3

    SetCtlColors $Un_Btn_Minimize "0xC5C4AC" "0x3E4647"

    ToolTips::Classic $Un_Btn_Minimize "$(NSIS.Minimize)"

    # Close

    nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 365u 2u 24 20 "" ; close
    Pop $Un_Btn_Close
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_close.bmp $Un_Btn_Close
    GetFunctionAddress $3 "un.On_Click_Close.App"
    SkinBtn::onClick $Un_Btn_Close $3

    SetCtlColors $Un_Btn_Close "0xC5C4AC" "0x3E4647"

    ToolTips::Classic $Un_Btn_Close "$(NSIS.Close)"

    # WELCOME

    nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 150u 3u 300u 15u "$(^Name)"
    pop $Un.Txt.Welcome
    SetCtlColors $Un.Txt.Welcome "0xC5C4AC" "0x3E4647"

    CreateFont $0 "Baar Sophia" "15" "500"
    SendMessage $Un.Txt.Welcome ${WM_SETFONT} $0 0 

    # WELCOME

    nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 100u 110u 200u 15u "$(NSIS.Sore.Uninstall)"
    pop $Un.Msg.Leave.1
    SetCtlColors $Un.Msg.Leave.1 "0xC5C4AC" "0x3E4647"

    CreateFont $0 "Baar Sophia" "15" "500"
    SendMessage $Un.Msg.Leave.1 ${WM_SETFONT} $0 0 

    nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 100u 135u 200u 15u "$(NSIS.Sure.Uninstall)"
    pop $Un.Msg.Leave.2
    SetCtlColors $Un.Msg.Leave.2 "0xC5C4AC" "0x3E4647"

    CreateFont $0 "Baar Sophia" "10" "100"
    SendMessage $Un.Msg.Leave.2 ${WM_SETFONT} $0 0 

    nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000003|0x00000100 0 165u 50u 128u 128u "" ; icon
    Pop $Un.ICON
    SetCtlColors $Un.ICON "0xC5C4AC" "0x3E4647"

    System::Call 'user32::LoadImage(i 0, t "$PLUGINSDIR\Trash.ico", i ${IMAGE_ICON}, i 0, i 0, i ${LR_CREATEDIBSECTION}|${LR_LOADFROMFILE}) i.s'
    Pop $R0
    SendMessage $Un.ICON ${STM_SETIMAGE} ${IMAGE_ICON} "$R0"
    ${NSD_AddStyle} $Un.ICON "${IMAGE_ICON}"

    # Next

    nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 215 170u 145 40 ""
    Pop $Un.Btn_Next
    SkinBtn::Set /IMGID=$PLUGINSDIR\Btn_GO.bmp $Un.Btn_Next
    GetFunctionAddress $3 "un.onClick.Next.Page"
    SkinBtn::onClick $Un.Btn_Next $3

    CreateFont $0 "Baar Sophia" "15" "400"
    SendMessage $Un.Btn_Next ${WM_SETFONT} $0 0 

    SendMessage $Un.Btn_Next '${WM_SETTEXT}' '0' "STR:$(NSIS.NextBtn)"

    SetCtlColors $Un.Btn_Next "0xC5C4AC" "0x3E4647"

    ToolTips::Classic $Un.Btn_Next "$(NSIS.NextBtn)"

    # Mouse

    GetFunctionAddress $0 'Un.on.Click.Mouse.Effect.1'
    nsDialogs::CreateTimer $0 50

    nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x0000000E|0x00000100 0 0 0 100% 100% ""
    Pop $Un.BGImage
    ${NSD_SetImage} $Un.BGImage "$PLUGINSDIR\BG4.bmp" $Un.IMAGE

    GetFunctionAddress $0 un.onGUICallback
    WndProc::onCallback $Un.BGImage $0

    nsDialogs::Show

    ${NSD_FreeIcon} $R0
    ${NSD_FreeImage} $Un.IMAGE
    System::Call "user32::DestroyIcon(iR0)"
    System::Call 'user32::DestroyImage(iR0)'
    System::Call "gdi32::DeleteObject(i$Un.IMAGE)"
FunctionEnd

Function Un.on.Click.Mouse.Effect.1
   # ${NSD_KillTimer} 'Un.on.Click.Mouse.Effect.1'

   System::Alloc 16
   Pop $0
   System::Call USER32::GetCursorPos(ir0)
   System::Call *$0(i.r1,i.r2)
   System::Free $0
   System::Call USER32::WindowFromPoint(ir1,ir2)i.r1

   # Close

   ${If} $1 = $Un_Btn_Close
     System::Call USER32::LoadCursor(i,i32649)i.s
     System::Call USER32::SetCursor(is) 
   ${Else}
     System::Call 'USER32::IsWindowVisible(ir3)i.r0'
   ${EndIf}

   # Next

   ${If} $1 = $Un.Btn_Next
     System::Call USER32::LoadCursor(i,i32649)i.s
     System::Call USER32::SetCursor(is) 
   ${Else}
     System::Call 'USER32::IsWindowVisible(ir3)i.r0'
   ${EndIf}
FunctionEnd

Function Un.On_Click_Minimize
   ShowWindow $HWNDPARENT ${SW_MINIMIZE}
FunctionEnd

Function un.On_Click_Close.App
    Push "$FONTS\BAARS.ttf"
    System::Call 'Gdi32::RemoveFontResourceEx(t"$PLUGINSDIR\BAARS.ttf",i 0x30,i0)'
    System::Call "Gdi32::RemoveFontResource(t s) i .s"
    Pop $0
    IntCmp $0 0 0 +2 +2
    SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0

    Delete "$PLUGINSDIR\BAARS.ttf"
    Sleep 150

    SendMessage $HWNDPARENT ${WM_CLOSE} 0 0
FunctionEnd

Function un.onClick.Next.Page
    SendMessage $HWNDPARENT 0x408 1 0
FunctionEnd

Section Uninstall
    SetShellVarContext all

   SetDetailsPrint textonly
   DetailPrint `$(NSIS.Remove.Files)`
   SetDetailsPrint listonly
   SetDetailsView hide

    RMDir /r "$SMPROGRAMS\$(^Name)"

    Delete "$DESKTOP\$(^Name).lnk"
    Delete "$DESKTOP\$(^Name).lnk"

    DeleteRegKey HKEY_CURRENT_USER "Software\$(^Name)"
    DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\$(^Name)"
    DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)"

    Delete "$INSTDIR\$(^Name).exe"
    Delete "$INSTDIR\settings.ini"
    Delete "$INSTDIR\Update.ini"
    Delete "$INSTDIR\DESKTOP.ini"

    Delete "$DESKTOP\$(^Name).lnk"
    Delete "$DESKTOP\$(^Name).lnk"

    RMDir /r "$INSTDIR\RegScanBackup"
    Delete "$INSTDIR\\Menu\Images\$(^Name).ico"
    RMDir /r "$INSTDIR\Menu\Images"
    RMDir /r "$INSTDIR\Menu"

    Delete "$INSTDIR\uninst-$(^Name).exe"

    RMDir /r "$INSTDIR\$(^Name)"
    RMDir /r "$INSTDIR"
    RMDir "$InstDir"

   Sleep 50
   Sleep 50

   SetDetailsPrint textonly
   DetailPrint `$(NSIS.Succes.Remove)...`
   SetDetailsPrint listonly
   SetDetailsView hide

   System::Call /NOUNLOAD "shell32::SHChangeNotify(i, i, i, i) v (0x08000000, 0, 0, 0)"

   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 1500
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 1500
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 500
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 500
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 500
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50
   Sleep 50

   ;Quit
   SetAutoClose true
SectionEnd

var un.ImageHandle

Function Un.InstFilesPageShow
    FindWindow $R2 "#32770" "" $HWNDPARENT

    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $1 $R2 1027
    ShowWindow $1 ${SW_HIDE}

    StrCpy $R0 $R2
    System::Call "user32::MoveWindow(i R0, i 0, i 0, i 575, i 335) i r2"
    GetFunctionAddress $0 un.onGUICallback
    WndProc::onCallback $R0 $0
    
    GetDlgItem $R0 $R2 1004
    SetCtlColors $R2 "0xC5C4AC" "0x3E4647"
    System::Call "user32::MoveWindow(i R0, i 15, i 300, i 540, i 6) i r2"

    GetDlgItem $R1 $R2 1006
    SetCtlColors $R1 "0xC5C4AC" "0x3E4647"
    System::Call "user32::MoveWindow(i R1, i 15, i 270, i 535, i 17) i r2"
    CreateFont $1 "Baar Sophia" "12" "400"
    SendMessage $R1 ${WM_SETFONT} $1 0

    GetDlgItem $R8 $R2 1016
    SetCtlColors $R8 "0x4A766E" "0xFFFFFF"
    System::Call "user32::MoveWindow(i R8, i 0, i 0, i 588, i 216) i r2"

    FindWindow $R2 "#32770" "" $HWNDPARENT
    GetDlgItem $R0 $R2 1995
    System::Call "user32::MoveWindow(i R0, i 0, i 0, i 498, i 373) i r2"
    ${NSD_SetImage} $R0 "$PLUGINSDIR\BG5.bmp" $un.ImageHandle

    FindWindow $R2 "#32770" "" $HWNDPARENT
    GetDlgItem $5 $R2 1004
    SkinProgress::Set $5 "$PLUGINSDIR\loading2.bmp" "$PLUGINSDIR\loading1.bmp"

    FindWindow $R0 "#32770" "" $HWNDPARENT
    System::Call 'User32::CreateWindowEx(i 0, t "STATIC", t "$(NSIS.Uninstall.Print)", i ${WS_CHILD}|${WS_VISIBLE}|${WS_EX_TRANSPARENT}, i 5, i 5, i 200, i 25, i R0, i 0, i 0, i 0) i.R1'
    CreateFont $1 "Baar Sophia" "17" "400"
    SendMessage $R1 ${WM_SETFONT} $1 0
    SetCtlColors $R1 "0xC5C4AC" "0x3E4647"

    SendMessage $HWNDPARENT ${WM_SETTEXT} 0 "STR:$(NSIS.Uninstall)"

    w7tbp::Start
FunctionEnd

# Finish Page Uninstall

var Un_Btn_Finish

Function un.FinishPage
    GetDlgItem $0 $HWNDPARENT 1
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 2
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 3
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1990
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1991
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1992
    ShowWindow $0 ${SW_HIDE}

    nsDialogs::Create 1044
    Pop $Un.Dlg
    ${If} $Un.Dlg == 'error'
   	Abort
    ${EndIf}
    SetCtlColors $Un.Dlg "0xC5C4AC" "0x3E4647"

    System::Call user32::SetWindowPos(i$HWNDPARENT,i0,i0,i0,i575,i335,i0x0002)
    System::Call user32::SetWindowPos(i$Un.Dlg,i0,i0,i0,i575,i335,i0x0002)

    SendMessage $HWNDPARENT ${WM_SETTEXT} 0 "STR:Finish Uninstall"

    # Minimize

    nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 350u 5u 24 20 "" ; minimize
    Pop $Un_Btn_Minimize
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Minimize.bmp $Un_Btn_Minimize
    GetFunctionAddress $3 "Un.On_Click_Minimize.Fin"
    SkinBtn::onClick $Un_Btn_Minimize $3

    SetCtlColors $Un_Btn_Minimize "0xC5C4AC" "0x3E4647"

    ToolTips::Classic $Un_Btn_Minimize "$(NSIS.Minimize)"

    # Close

    nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 365u 2u 24 20 "" ; close
    Pop $Un_Btn_Close
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_close.bmp $Un_Btn_Close
    GetFunctionAddress $3 "un.On_Click_Finish_Uninstaller"
    SkinBtn::onClick $Un_Btn_Close $3

    SetCtlColors $Un_Btn_Close "0xC5C4AC" "0x3E4647"

    ToolTips::Classic $Un_Btn_Close "$(NSIS.Close)"

    # WELCOME

    nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 150u 3u 300u 15u "$(^Name)"
    pop $Un.Txt.Welcome
    SetCtlColors $Un.Txt.Welcome "0xC5C4AC" "0x3E4647"

    CreateFont $0 "Baar Sophia" "15" "500"
    SendMessage $Un.Txt.Welcome ${WM_SETFONT} $0 0 

    # WELCOME

    nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 130u 110u 160u 15u "$(NSIS.Finish.Remove)"
    pop $Un.Msg.Leave.1
    SetCtlColors $Un.Msg.Leave.1 "0xC5C4AC" "0x3E4647"

    CreateFont $0 "Baar Sophia" "15" "500"
    SendMessage $Un.Msg.Leave.1 ${WM_SETFONT} $0 0 

    nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 145u 130u 100u 15u "$(NSIS.Succes.Remove)"
    pop $Un.Msg.Leave.2
    SetCtlColors $Un.Msg.Leave.2 "0xC5C4AC" "0x3E4647"

    CreateFont $0 "Baar Sophia" "10" "100"
    SendMessage $Un.Msg.Leave.2 ${WM_SETFONT} $0 0 

    nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000003|0x00000100 0 140u 30u 128u 128u "" ; icon
    Pop $Un.ICON
    SetCtlColors $Un.ICON "0xC5C4AC" "0x3E4647"

    System::Call 'user32::LoadImage(i 0, t "$PLUGINSDIR\OK.ico", i ${IMAGE_ICON}, i 0, i 0, i ${LR_CREATEDIBSECTION}|${LR_LOADFROMFILE}) i.s'
    Pop $R0
    SendMessage $Un.ICON ${STM_SETIMAGE} ${IMAGE_ICON} "$R0"
    ${NSD_AddStyle} $Un.ICON "${IMAGE_ICON}"

    # Next

    nsDialogs::CreateControl BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 215 170u 145 40 ""
    Pop $Un_Btn_Finish
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_OFF.bmp $Un_Btn_Finish
    GetFunctionAddress $3 "un.On_Click_Finish_Uninstaller"
    SkinBtn::onClick $Un_Btn_Finish $3

    SendMessage $Un_Btn_Finish '${WM_SETTEXT}' '0' "STR:$(NSIS.Close)"

    CreateFont $0 "Baar Sophia" "15" "400"
    SendMessage $Un_Btn_Finish ${WM_SETFONT} $0 0 

    SetCtlColors $Un_Btn_Finish "0xC5C4AC" "0x3E4647"

    ToolTips::Classic $Un_Btn_Finish "$(NSIS.Close)"

    # Mouse

    GetFunctionAddress $0 'Un.on.Click.Mouse.Effect.2'
    nsDialogs::CreateTimer $0 50

    # Background

    nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x0000000E|0x00000100 0 0 0 100% 100% ""
    Pop $Un.BGImage
    ${NSD_SetImage} $Un.BGImage "$PLUGINSDIR\BG4.bmp" $Un.IMAGE

    GetFunctionAddress $0 un.onGUICallback
    WndProc::onCallback $Un.BGImage $0

    nsDialogs::Show

    ${NSD_FreeIcon} $R0
    ${NSD_FreeImage} $Un.IMAGE
    System::Call "user32::DestroyIcon(iR0)"
    System::Call 'user32::DestroyImage(iR0)'
    System::Call "gdi32::DeleteObject(i$Un.IMAGE)"
FunctionEnd

Function un.On_Click_Finish_Uninstaller
   SendMessage $Un.Msg.Leave.2 ${WM_SETTEXT} 0 "STR:$(NSIS.Close.In) 5 $(NSIS.Seconds)"

   IntFmt $R1 "0x%08X" 5

   ${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6
   Strcpy $R2 $6

   loop:

   ${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6

   Strcmp $R2 $6 loop 0
   Strcpy $R2 $6
   IntOp $R1 $R1 - 1
   IntCmp $R1 0 +3 +3 0
   SendMessage $Un.Msg.Leave.2 ${WM_SETTEXT} 0 "STR:$(NSIS.Close.In) $R1 $(NSIS.Seconds)"
   goto loop

   SendMessage $Un.Msg.Leave.2 ${WM_SETTEXT} 0 "STR:$(NSIS.Close.Now)"

   Call un.On_Click_Finish_Uninst
FunctionEnd

Function Un.On_Click_Minimize.Fin
   ShowWindow $HWNDPARENT ${SW_MINIMIZE}
FunctionEnd

Function un.On_Click_Finish_Uninst
   Push "$FONTS\BAARS.ttf"
   System::Call 'Gdi32::RemoveFontResourceEx(t"$PLUGINSDIR\BAARS.ttf",i 0x30,i0)'
   System::Call "Gdi32::RemoveFontResource(t s) i .s"
   Pop $0
   IntCmp $0 0 0 +2 +2
   SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0

   Delete "$PLUGINSDIR\BAARS.ttf"
   Sleep 150

   SendMessage $HWNDPARENT 0x408 1 0
FunctionEnd

Function Un.on.Click.Mouse.Effect.2
   # ${NSD_KillTimer} 'Un.on.Click.Mouse.Effect.2'

   System::Alloc 16
   Pop $0
   System::Call USER32::GetCursorPos(ir0)
   System::Call *$0(i.r1,i.r2)
   System::Free $0
   System::Call USER32::WindowFromPoint(ir1,ir2)i.r1

   # Close

   ${If} $1 = $Un_Btn_Close
     System::Call USER32::LoadCursor(i,i32649)i.s
     System::Call USER32::SetCursor(is) 
   ${Else}
     System::Call 'USER32::IsWindowVisible(ir3)i.r0'
   ${EndIf}

   # Finish

   ${If} $1 = $Un_Btn_Finish
     System::Call USER32::LoadCursor(i,i32649)i.s
     System::Call USER32::SetCursor(is) 
   ${Else}
     System::Call 'USER32::IsWindowVisible(ir3)i.r0'
   ${EndIf}
FunctionEnd

Function un.onGUICallback
   ${If} $Un.dlg = ${WM_LBUTTONDOWN}
    SendMessage $HWNDPARENT ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
   ${EndIf}
FunctionEnd

Function "un.onUninstSuccess"
   ;MessageBox MB_OK|MB_ICONQUESTION  "$(NSIS.Succes.Remove)"
   Abort
FunctionEnd

Function "un.onUninstFailed"
   ;MessageBox MB_OK "$(NSIS.Uninst.Failed)$\n$\n$(NSIS.Retry)"
   Quit
FunctionEnd

Function "un.onGUIEnd"
   Setoutpath $TEMP
   Sleep 150
   System::Call `gdi32:DeleteObject(i s)` $Un.IMAGE
   System::Call "user32::DestroyIcon(iR0)"
   System::Call 'user32::DestroyImage(iR0)'
   System::Free
FunctionEnd
