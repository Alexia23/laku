# Copyright CatsSoft

Name "Photoscape"
Caption "Photoscape"
OutFile "Photoscape_setup.exe"
InstallDir "$PROGRAMFILES\Photoscape"

# ...:: DETAILS ::... #

!define /date date "%H:%M %d %b, %Y"
!define RUNASADMIN

VIProductVersion "3.7.0.0"
VIAddVersionKey /LANG=1048 "ProductName" "Photoscape"
VIAddVersionKey /LANG=1048 "CompanyName" "MOOII TECH"
VIAddVersionKey /LANG=1048 "LegalCopyright" "MOOII TECH"
VIAddVersionKey /LANG=1048 "LegalTrademarks" "MOOII TECH"
VIAddVersionKey /LANG=1048 "FileDescription" "Photoscape"
VIAddVersionKey /LANG=1048 "FileVersion" "3.7.0.0"
VIAddVersionKey /LANG=1048 "ProductVersion" "3.7.0.0"
VIAddVersionKey /LANG=1048 "InternalName" "Photoscape"
VIAddVersionKey /LANG=1048 "OriginalFilename" "Photoscape_setup.exe"
VIAddVersionKey /LANG=1048 "File Name" "Photoscape_setup.exe"
VIAddVersionKey /LANG=1048 "Comments" "$(^Name) udate your edit photos"
VIAddVersionKey /LANG=1048 "Last Compile" "${date}"
VIAddVersionKey /LANG=1048 "Language" "English"

# ...:: COMPRESS ::... #

SetCompressor /SOLID /FINAL lzma
SetCompress force
SetCompressorDictSize 32
SetDatablockOptimize on
SetDateSave on

# ...:: INCLUDE ::... #

!include "MUI2.nsh"
!include "WinCore.nsh"
!include "nsWindows.nsh"
!include "LogicLib.nsh"
!include "WinMessages.nsh"
!include "FileFunc.nsh"
!insertmacro GetFileName
!insertmacro GetParameters
!insertmacro DriveSpace
!insertmacro GetParent
!insertmacro GetOptions
!insertmacro GetDrives
!insertmacro GetRoot
!insertmacro GetSize

# ...:: RUN ::... #

!ifndef RUNASADMIN
  RequestExecutionLevel user
!else
  RequestExecutionLevel Admin
!endif

# ...:: UI ::... #

!ifndef CUSTOMUI
  !define MUI_UI "UI\UI.exe"
  ChangeUI all "UI\UI.exe"
!else
  !define MUI_UI "UI\UI.exe"
  ChangeUI all "UI\UI.exe"
!endif

# ...:: SHOW ::... #

ShowInstDetails hide
ShowInstDetails nevershow
ShowUnInstDetails nevershow
XPStyle off

# ...:: BRANDING ::... #

BrandingText /TRIMRIGHT " "

# ...:: ICON ::... #

Icon "Icons\appicon.ico"
!define MUI_ICON "Icons\appicon.ico"

# ...:: PAGE ::... #

!define MUI_CUSTOMFUNCTION_GUIINIT "onGuiInit"
Page custom "Page.Welcome.Photoscape" ""
Page custom "Page.Download.Photoscape" ""
Page instfiles "" ""

# ...:: ENGLISH ::... #

!insertmacro MUI_LANGUAGE "English"
!Include "Languages\English.nsh"

# ...:: ROMANIAN ::... #

!insertmacro MUI_LANGUAGE "Romanian"
!Include "Languages\Romanian.nsh"

# ...:: onInit ::... #

Var /global Lang

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
!define WM_IN_UPDATEMSG 0x40f

Function .onInit
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

  # ...:: Language ::... #

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
  # !insertmacro MUI_LANGDLL_DISPLAY

  InitPluginsDir
  SetOverwrite try
  AllowSkipFiles off
  File `/ONAME=$PLUGINSDIR\001.bmp` `Images\001.bmp`
  File `/oname=$PLUGINSDIR\loading1.bmp` `images\loading1.bmp`
  File `/oname=$PLUGINSDIR\loading2.bmp` `images\loading2.bmp`
  File `/oname=$PLUGINSDIR\Pict-1.png` `images\Pict-1.png`
  File `/oname=$PLUGINSDIR\Pict-2.png` `images\Pict-2.png`
  File `/oname=$PLUGINSDIR\btn_Close.bmp` `images\btn_Close.bmp`
  File `/oname=$PLUGINSDIR\btn_Min.bmp` `images\btn_Min.bmp`
  File `/oname=$PLUGINSDIR\btn_Strong.bmp` `images\btn_Strong.bmp`
  File `/oname=$PLUGINSDIR\btn_Cancel.bmp` `images\btn_Cancel.bmp`

  SkinBtn::Init "$PLUGINSDIR\btn_Close.bmp"
  SkinBtn::Init "$PLUGINSDIR\btn_Min.bmp"
  SkinBtn::Init "$PLUGINSDIR\btn_Strong.bmp"
  SkinBtn::Init "$PLUGINSDIR\btn_Cancel.bmp"

  InitPluginsDir
  File '/oname=$PLUGINSDIR\Expansiva.otf' 'Fonts\Expansiva.otf'
  Push "$FONTS\Expansiva.otf"
  System::Call 'GDI32::AddFontResourceEx(t"$PLUGINSDIR\Expansiva.otf",i 0x30,i0)'
  System::Call "Gdi32::AddFontResource(t s) i .s"
  Pop $0
  SendMessage ${HWND_BROADCAST} ${WM_FONTCHANGE} 0 0 /TIMEOUT=5000
FunctionEnd

# ...:: onGuiInit ::... #

Function onGuiInit
  MoveAnywhere::Hook

  System::Call user32::SetWindowLong(i$HWNDPARENT,i-16,0x9480084C)i.R0
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

  System::Call user32::GetSystemMetrics(i0)i.r1
  System::Call user32::GetSystemMetrics(i1)i.r2
  IntOp $1 $1 - 620
  IntOp $1 $1 / 2
  IntOp $2 $2 - 345
  IntOp $2 $2 / 2
  System::Call user32::MoveWindow(i$HWNDPARENT,i$1,i$2,i620,i345,1)

  System::Alloc 16
  System::Call user32::GetWindowRect(i$HWNDPARENT,isR0)
  System::Call *$R0(i.R1,i.R2,i.R3,i.R4)
  IntOp $R3 $R3 - $R1
  IntOp $R4 $R4 - $R2
  System::Call gdi32::CreateRoundRectRgn(i0,i0,iR3,iR4,i5,i5)i.r0
  System::Call user32::SetWindowRgn(i$HWNDPARENT,ir0,i1)
  System::Free $R0
  System::Call User32::GetDesktopWindow()i.R0

  SetCtlColors $HWNDPARENT "0xFFFFFF" "0x2A3040"
FunctionEnd

# ...:: WELCOME ::... #

!define DM_SETDEFID 0x0401
;!define WM_KEYDOWN 0x0100
;!define VK_F5      0x74

!define /math PBM_SETRANGE32 ${WM_USER} + 6

!define /math EM_SETBKGNDCOLOR ${WM_USER} + 67
!define /math EM_GETTEXTRANGE ${WM_USER} + 75
!define /math EM_AUTOURLDETECT ${WM_USER} + 91
!define /math EM_SETTEXTEX ${WM_USER} + 97
!define EM_SETEVENTMASK 0x0445
!define ES_NOOLEDRAGDROP 8
!define ENM_LINK 0x4000000
!define EN_LINK 0x70B
!define NM_CLICK -2
!define NM_RETURN -4

!macro CheckInternetConnectionCall _URL _RESULT 
  !verbose push 
  Push `${_URL}` 
  ${CallArtificialFunction} CheckInternetConnection_ 
  Pop `${_RESULT}` 
  !verbose pop 
!macroend 

!define CheckInternetConnection `!insertmacro CheckInternetConnectionCall` 
!define un.CheckInternetConnection `!insertmacro CheckInternetConnectionCall` 

!macro CheckInternetConnection 
!macroend 

!macro un.CheckInternetConnection 
!macroend 

!define FLAG_ICC_FORCE_CONNECTION 1 

!macro CheckInternetConnection_ 
  !verbose push 
  Exch $0 
  System::Call "wininet::InternetCheckConnection(t '$0', i ${FLAG_ICC_FORCE_CONNECTION}, i 0) i .r0" 
  ${If} $0 == 1 
    StrCpy $0 "OK" 
  ${Else} 
    StrCpy $0 "FAILED" 
  ${EndIf} 
  Exch $0 
  !verbose pop 
!macroend 

Function "Page.Welcome.Photoscape"

  # ...:: variables ::... #
 
  var /GLOBAL Dialog
  var /GLOBAL BGImage
  var /GLOBAL Btn_Close
  var /GLOBAL Btn_Min
  var /GLOBAL Lbl.Welcome
  var /GLOBAL Lbl.Sub.Welcome

  var /GLOBAL TickCount
  var /GLOBAL Time

  var /GLOBAL TOTALESTIMATEDSIZE
  var /GLOBAL ESTIMATEDSIZE

  var /GLOBAL Downloading.Status
  var /GLOBAL Downloading.ProgressBar
  var /GLOBAL Downloading.Percent

  var /GLOBAL Btn.Download
  var /GLOBAL Btn.Install
  var /GLOBAL Btn.Abort

  var /GLOBAL Lbl.Settings
  var /GLOBAL Lbl.Sub.Settings
  var /GLOBAL Lbl.Sub.Settings1

  var /GLOBAL ICON
  var /GLOBAL Lnk.About

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

  System::Call "user32::SetWindowPos(i$HWNDPARENT,i,i,i,i 620,i 345,i 0x16)"
  nsDialogs::Create /NOUNLOAD 1044
  Pop $Dialog
  ${If} $Dialog == error
   Abort
  ${EndIf}
  SetCtlColors $Dialog "0x313131" "0x2A3040"

  System::Call "user32::MoveWindow(i$Dialog,i0,i0,i 620,i 345,i0)"

  # ...:: ICON ::... #

  System::Call 'shell32::ExtractIcon(i $HWNDPARENT, t "$EXEDIR\Photoscape.exe", i 0) i.R0'
  nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000003|0x00000100 0 215u 22u 32 32 ""
  Pop $ICON
  SendMessage $ICON ${STM_SETIMAGE} ${IMAGE_ICON} $R0

  SetCtlColors $ICON "0xFFFFFF" "0x2A3040"

  # ...:: ABOUT ::... #

  nsDialogs::CreateControl /NOUNLOAD LINK 0x40000000|0x10000000|0x04000000|0x00010000|0x0000000B 0 5% 190u 85u 15u ""
  pop $Lnk.About
  StrCpy $1 $Lnk.About
  GetFunctionAddress $3 "On.Click.About"
  nsDialogs::onClick /NOUNLOAD $1 $3

  SendMessage $Lnk.About ${WM_SETTEXT} 0 "STR:MOOII TECH"

  CreateFont $0 "Lucida Sans Unicode" "12" "100"
  SendMessage $Lnk.About ${WM_SETFONT} $0 0 

  SetCtlColors $Lnk.About "0xFFFFFF" "0x2A3040"

  # ...:: Close ::... #

  nsDialogs::CreateControl /NOUNLOAD BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 395u 2u 24 20 ""
  Pop $Btn_Close
  StrCpy $1 $Btn_Close
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Close.bmp $1
  GetFunctionAddress $3 "on.click.Close"
  SkinBtn::onClick /NOUNLOAD $1 $3

  SendMessage $HWNDPARENT ${DM_SETDEFID} $btn_Close 0
  SendMessage $HWNDPARENT ${WM_NEXTDLGCTL} $btn_Close 1

  ToolTips::Classic $btn_Close "$(^CloseBtn)"

  SetCtlColors $btn_Close "0xFFFFFF" "0x2A3040"

  # ...:: Minimize ::... #

  nsDialogs::CreateControl /NOUNLOAD BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 382u 2u 24 20 ""
  Pop $Btn_Min
  StrCpy $1 $Btn_Min
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Min.bmp $1
  GetFunctionAddress $3 "on.click.Minimize"
  SkinBtn::onClick /NOUNLOAD $1 $3

  ToolTips::Classic $btn_Min "$(NSIS.Btn.Minimize)"

  SetCtlColors $btn_Min "0xFFFFFF" "0x2A3040"

  # ...:: WELCOME ::... #

  nsDialogs::CreateControl /NOUNLOAD STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 5% 20u 200u 22u "Photoscape"
  Pop $Lbl.Welcome

  CreateFont $0 "Expansiva" 22 500
  SendMessage $Lbl.Welcome ${WM_SETFONT} $0 0

  SetCtlColors $Lbl.Welcome "0xFFFFFF" "0x2A3040"

  nsDialogs::CreateControl /NOUNLOAD STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 5% 45u 220u 15u "$(NSIS.Welcome.Sub.Title)"
  Pop $Lbl.Sub.Welcome

  CreateFont $0 "$(^Font)" 12 200
  SendMessage $Lbl.Sub.Welcome ${WM_SETFONT} $0 0

  SetCtlColors $Lbl.Sub.Welcome "0xFFFFFF" "0x2A3040"

  # ...:: SETTINGS ::... #

  nsDialogs::CreateControl /NOUNLOAD STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 5% 65u 380u 20u "$(NSIS.Photoscape.Settings)"
  Pop $Lbl.Settings

  CreateFont $0 "Expansiva" 20 400
  SendMessage $Lbl.Settings ${WM_SETFONT} $0 0

  SetCtlColors $Lbl.Settings "0xFFFFFF" "0x2A3040"

  nsDialogs::CreateControl /NOUNLOAD STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 5% 90u 380u 15u "$(NSIS.Photoscape.Settings1)"
  Pop $Lbl.Sub.Settings

  CreateFont $0 "$(^Font)" 12 200
  SendMessage $Lbl.Sub.Settings ${WM_SETFONT} $0 0

  SetCtlColors $Lbl.Sub.Settings "0xFFFFFF" "0x2A3040"

  nsDialogs::CreateControl /NOUNLOAD STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 5% 105u 380u 15u "$(NSIS.Photoscape.Settings2)"
  Pop $Lbl.Sub.Settings1

  CreateFont $0 "$(^Font)" 12 200
  SendMessage $Lbl.Sub.Settings1 ${WM_SETFONT} $0 0

  SetCtlColors $Lbl.Sub.Settings1 "0xFFFFFF" "0x2A3040"

  # ...:: Download ::... #

  nsDialogs::CreateControl /NOUNLOAD BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 5% 130u 121u 47u "$(NSIS.Btn.Download)"
  Pop $Btn.Download
  StrCpy $1 $Btn.Download
  SkinButton::SetSkin $1 $PLUGINSDIR\Pict-1.png
  GetFunctionAddress $3 "on.Click.Next"
  nsDialogs::onClick /NOUNLOAD $1 $3

  CreateFont $0 "Lucida Sans Unicode" "15" "200"
  SendMessage $Btn.Download ${WM_SETFONT} $0 0

  SetCtlColors $Btn.Download "0xFFFFFF" "0x2A3040"

  # ...:: Install ::... #

  nsDialogs::CreateControl /NOUNLOAD BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 146u 130u 121u 47u "$(NSIS.Btn.Install)"
  Pop $Btn.Install
  StrCpy $1 $Btn.Install
  SkinButton::SetSkin $1 $PLUGINSDIR\Pict-1.png
  GetFunctionAddress $3 "on.Click.Install"
  nsDialogs::onClick /NOUNLOAD $1 $3

  CreateFont $0 "Lucida Sans Unicode" "15" "200"
  SendMessage $Btn.Install ${WM_SETFONT} $0 0

  SetCtlColors $Btn.Install "0xFFFFFF" "0x2A3040"

  EnableWindow $Btn.Install 0

  # ...:: Abort ::... #

  nsDialogs::CreateControl /NOUNLOAD BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 271u 130u 121u 47u "$(NSIS.Btn.Abort)"
  Pop $Btn.Abort
  StrCpy $1 $Btn.Abort
  SkinButton::SetSkin $1 $PLUGINSDIR\Pict-1.png
  GetFunctionAddress $3 "on.Click.Abort"
  nsDialogs::onClick /NOUNLOAD $1 $3

  CreateFont $0 "Lucida Sans Unicode" "15" "200"
  SendMessage $Btn.Abort ${WM_SETFONT} $0 0

  SetCtlColors $Btn.Abort "0xFFFFFF" "0x2A3040"

  # ...:: BACKGROUND ::... #

  nsDialogs::CreateControl /NOUNLOAD STATIC 0x10000000|0x40000000|0x04000000|0x0000000E 0 0 0 100% 100% ""
  Pop $BGImage
  Push $0
  Push $R0
  StrCpy $R0 $BGImage
  System::Call "user32::LoadImage(i 0, ts, i 0, i0, i0, i0x0010) i.r0" $PLUGINSDIR\001.bmp
  SendMessage $R0 0x0172 0 $0
  Pop $R0
  Exch $0

  # ...:: Back ::... #

  GetFunctionAddress $0 "onGUICallback"
  WndProc::onCallback $HWNDPARENT $0
  WndProc::onCallback $BGImage $0

  nsDialogs::Show

  System::Call "user32::DestroyIcon(iR0)"
  System::Call 'user32::DestroyImage(iR0)'
  System::Call "gdi32::DeleteObject(i$R0)"
  System::Call 'user32::DestroyImage(i$R0)'
  Return
FunctionEnd

# ...:: NEXT ::... #

Function "on.Click.Next"
  SendMessage $HWNDPARENT 0x408 1 0
FunctionEnd

# ...:: DOWNLOAD ::... #

Function "Page.Download.Photoscape"

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

  System::Call "user32::SetWindowPos(i$HWNDPARENT,i,i,i,i 620,i 345,i 0x16)"
  nsDialogs::Create /NOUNLOAD 1044
  Pop $Dialog
  ${If} $Dialog == error
   Abort
  ${EndIf}
  SetCtlColors $Dialog "0x313131" "0x2A3040"

  System::Call "user32::MoveWindow(i$Dialog,i0,i0,i 620,i 345,i0)"

  # ...:: TickCount ::... #

  System::Call "kernel32::GetTickCount()l .s"
  Pop $TickCount

  # ...:: ICON ::... #

  System::Call 'shell32::ExtractIcon(i $HWNDPARENT, t "$EXEDIR\Photoscape.exe", i 0) i.R0'
  nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000003|0x00000100 0 215u 22u 32 32 ""
  Pop $ICON
  SendMessage $ICON ${STM_SETIMAGE} ${IMAGE_ICON} $R0

  SetCtlColors $ICON "0xFFFFFF" "0x2A3040"

  # ...:: ABOUT ::... #

  nsDialogs::CreateControl /NOUNLOAD LINK 0x40000000|0x10000000|0x04000000|0x00010000|0x0000000B 0 5% 190u 85u 15u ""
  pop $Lnk.About
  StrCpy $1 $Lnk.About
  GetFunctionAddress $3 "On.Click.About"
  nsDialogs::onClick /NOUNLOAD $1 $3

  SendMessage $Lnk.About ${WM_SETTEXT} 0 "STR:MOOII TECH"

  CreateFont $0 "Lucida Sans Unicode" "12" "100"
  SendMessage $Lnk.About ${WM_SETFONT} $0 0 

  SetCtlColors $Lnk.About "0xFFFFFF" "0x2A3040"

  # ...:: Close ::... #

  nsDialogs::CreateControl /NOUNLOAD BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 395u 2u 24 20 ""
  Pop $Btn_Close
  StrCpy $1 $Btn_Close
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Close.bmp $1
  GetFunctionAddress $3 "on.click.Close"
  SkinBtn::onClick /NOUNLOAD $1 $3

  SendMessage $HWNDPARENT ${DM_SETDEFID} $btn_Close 0
  SendMessage $HWNDPARENT ${WM_NEXTDLGCTL} $btn_Close 1

  ToolTips::Classic $btn_Close "$(^CloseBtn)"

  SetCtlColors $btn_Close "0xFFFFFF" "0x2A3040"

  # ...:: Minimize ::... #

  nsDialogs::CreateControl /NOUNLOAD BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 382u 2u 24 20 ""
  Pop $Btn_Min
  StrCpy $1 $Btn_Min
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Min.bmp $1
  GetFunctionAddress $3 "on.click.Minimize"
  SkinBtn::onClick /NOUNLOAD $1 $3

  ToolTips::Classic $btn_Min "$(NSIS.Btn.Minimize)"

  SetCtlColors $btn_Min "0xFFFFFF" "0x2A3040"

  # ...:: WELCOME ::... #

  nsDialogs::CreateControl /NOUNLOAD STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 5% 20u 200u 22u "Photoscape"
  Pop $Lbl.Welcome

  CreateFont $0 "Expansiva" 22 500
  SendMessage $Lbl.Welcome ${WM_SETFONT} $0 0

  SetCtlColors $Lbl.Welcome "0xFFFFFF" "0x2A3040"

  nsDialogs::CreateControl /NOUNLOAD STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 5% 45u 260u 15u "$(NSIS.Info.Download)"
  Pop $Lbl.Sub.Welcome

  CreateFont $0 "$(^Font)" 12 200
  SendMessage $Lbl.Sub.Welcome ${WM_SETFONT} $0 0

  SetCtlColors $Lbl.Sub.Welcome "0xFFFFFF" "0x2A3040"

  # ...:: SETTINGS ::... #

  nsDialogs::CreateControl /NOUNLOAD STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 5% 65u 380u 20u "$(NSIS.Photoscape.Settings)"
  Pop $Lbl.Settings

  CreateFont $0 "Expansiva" 20 400
  SendMessage $Lbl.Settings ${WM_SETFONT} $0 0

  SetCtlColors $Lbl.Settings "0xFFFFFF" "0x2A3040"

  # ...:: Progress Status ::... #

  nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 5% 90u 80% 10u ""
  Pop $Downloading.Status

  CreateFont $0 "$(^Font)" "10" "100"
  SendMessage $Downloading.Status ${WM_SETFONT} $0 0 

  ShowWindow $Downloading.Status ${SW_SHOW}

  SetCtlColors $Downloading.Status "0xFFFFFF" "0x2A3040"

  # ...:: ProgressBar ::... #

  nsDialogs::CreateControl msctls_progress32 0x40000000|0x10000000|0x04000000 0x00000100|0x00000200 5% 110u 82% 4u ""
  Pop $Downloading.ProgressBar

  SetCtlColors $Downloading.ProgressBar "0xFFFFFF" "0x2A3040"

  FindWindow $R2 "#32770" "" $HWNDPARENT
  GetDlgItem $5 $R2 1004
  Strcpy $5 $Downloading.ProgressBar
  SkinProgress::Set $5 "$PLUGINSDIR\loading1.bmp" "$PLUGINSDIR\loading2.bmp"

  ShowWindow $Downloading.ProgressBar ${SW_SHOW}

  # ...:: Percent ::... #

  nsDialogs::CreateControl STATIC 0x40000000|0x10000000|0x04000000|0x00000100 0x00000020 91% 106u 22u 10u ""
  Pop $Downloading.Percent

  CreateFont $0 "$(^Font)" "10" "100"
  SendMessage $Downloading.Percent ${WM_SETFONT} $0 0 

  ShowWindow $Downloading.Percent ${SW_SHOW}

  SetCtlColors $Downloading.Percent "0xFFFFFF" "0x2A3040"

  # ...:: Check Internet Connection ::... #

  ${CheckInternetConnection} "http://www.google.com/" $0 
  ${If} $0 == "OK" 

     SendMessage $Downloading.Status '${WM_SETTEXT}' '0' "STR:$(NSIS.Connect.Server)"

     ClearErrors

     SetShellVarContext "all"

     RMDir /R "$TEMP\Photoscape"

     ClearErrors

     SetShellVarContext "all"

     System::Call 'kernel32::CreateDirectoryW(w "$TEMP\Photoscape", i0)i.r0?e'

     GetFunctionAddress $0 'myProgress'
     nsDialogs::CreateTimer $0 1000

     GetFunctionAddress $0 'ClockTime'
     nsDialogs::CreateTimer $0 1000

     GetFunctionAddress $0 'myTimer'
     nsDialogs::CreateTimer $0 1000
     InetBgDL::Get /RESET "http://download-software.ru/downloads/PhotoScape_V3.7.exe" "$TEMP\Photoscape\PhotoScape_V3.7.exe" /END

  ${Else} 

    ShowWindow $Downloading.ProgressBar ${SW_HIDE}
    ShowWindow $Downloading.Percent ${SW_HIDE}

     SendMessage $Downloading.Status '${WM_SETTEXT}' '0' "STR:$(NSIS.No.Internet.Connection)"

  ${EndIf} 

  # ...:: Download ::... #

  nsDialogs::CreateControl /NOUNLOAD BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 5% 130u 121u 47u "$(NSIS.Btn.Download)"
  Pop $Btn.Download
  StrCpy $1 $Btn.Download
  SkinButton::SetSkin $1 $PLUGINSDIR\Pict-1.png
  GetFunctionAddress $3 "on.Click.Abort"
  nsDialogs::onClick /NOUNLOAD $1 $3

  CreateFont $0 "Lucida Sans Unicode" "15" "200"
  SendMessage $Btn.Download ${WM_SETFONT} $0 0

  SetCtlColors $Btn.Download "0xFFFFFF" "0x2A3040"

  EnableWindow $Btn.Download 0

  # ...:: Install ::... #

  nsDialogs::CreateControl /NOUNLOAD BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 146u 130u 121u 47u "$(NSIS.Btn.Install)"
  Pop $Btn.Install
  StrCpy $1 $Btn.Install
  SkinButton::SetSkin $1 $PLUGINSDIR\Pict-1.png
  GetFunctionAddress $3 "on.Click.Install"
  nsDialogs::onClick /NOUNLOAD $1 $3

  CreateFont $0 "Lucida Sans Unicode" "15" "200"
  SendMessage $Btn.Install ${WM_SETFONT} $0 0

  SetCtlColors $Btn.Install "0xFFFFFF" "0x2A3040"

  EnableWindow $Btn.Install 0

  # ...:: Abort ::... #

  nsDialogs::CreateControl /NOUNLOAD BUTTON 0x40000000|0x10000000|0x04000000|0x00010000 0 271u 130u 121u 47u "$(NSIS.Btn.Abort)"
  Pop $Btn.Abort
  StrCpy $1 $Btn.Abort
  SkinButton::SetSkin $1 $PLUGINSDIR\Pict-1.png
  GetFunctionAddress $3 "on.Click.Abort"
  nsDialogs::onClick /NOUNLOAD $1 $3

  CreateFont $0 "Lucida Sans Unicode" "15" "200"
  SendMessage $Btn.Abort ${WM_SETFONT} $0 0

  SetCtlColors $Btn.Abort "0xFFFFFF" "0x2A3040"

  # ...:: BACKGROUND ::... #

  nsDialogs::CreateControl /NOUNLOAD STATIC 0x10000000|0x40000000|0x04000000|0x0000000E 0 0 0 100% 100% ""
  Pop $BGImage
  Push $0
  Push $R0
  StrCpy $R0 $BGImage
  System::Call "user32::LoadImage(i 0, ts, i 0, i0, i0, i0x0010) i.r0" $PLUGINSDIR\001.bmp
  SendMessage $R0 0x0172 0 $0
  Pop $R0
  Exch $0

  # ...:: Back ::... #

  GetFunctionAddress $0 "onGUICallback"
  WndProc::onCallback $HWNDPARENT $0
  WndProc::onCallback $BGImage $0

  nsDialogs::Show

  GetFunctionAddress $0 'myTimer'
  nsDialogs::KillTimer $0

  GetFunctionAddress $0 'ClockTime'
  nsDialogs::KillTimer $0

  GetFunctionAddress $0 'myProgress'
  nsDialogs::KillTimer $0

  System::Call "user32::DestroyIcon(iR0)"
  System::Call 'user32::DestroyImage(iR0)'
  System::Call "gdi32::DeleteObject(i$R0)"
  System::Call 'user32::DestroyImage(i$R0)'
  Return
FunctionEnd

# ...:: Show Info Update ::... #

Function "myTimer"
  InetBgDL::GetStats
    ${If} $2 = 0
      GetFunctionAddress $0 'myTimer'
      nsDialogs::KillTimer $0

      GetFunctionAddress $0 'ClockTime'
      nsDialogs::KillTimer $0

      GetFunctionAddress $0 'myProgress'
      nsDialogs::KillTimer $0

      SendMessage $Downloading.Status '${WM_SETTEXT}' '0' "STR:$(NSIS.Complete) $1 $(NSIS.Of) $2 $(NSIS.Files)"

      IfFileExists "$TEMP\Photoscape\PhotoScape_V3.7.exe" "NSIS.Done.Download" "NSIS.Failed.Download"
      StrCmp $0 1 "NSIS.Done.Download" "NSIS.Failed.Download"
      ${If} $0 == "1"
        NSIS.Done.Download:

          EnableWindow $Btn.Install 1

          SendMessage $Downloading.Status '${WM_SETTEXT}' '0' "STR:$(NSIS.Download.Succesfully)"

      ${ElseIf} $0 == "0"
        NSIS.Failed.Download:

          EnableWindow $Btn.Install 0

          SendMessage $Downloading.Status '${WM_SETTEXT}' '0' "STR:$(NSIS.Download.Failed)!"

          GetFunctionAddress $0 'on.Click.Close.Installer'
          nsDialogs::CreateTimer $0 100

          Abort
       ${EndIf}
      SendMessage $Downloading.ProgressBar ${PBM_SETRANGE32} 0 100
      SendMessage $Downloading.ProgressBar ${PBM_SETPOS} 100 0
      SendMessage $Downloading.Percent '${WM_SETTEXT}' '0' "STR:100%"
      Return
    ${EndIf}
     IntOp $2 $2 + $1
     StrCmp $4 "" 0 +2
     StrCpy $4 "?"

     SendMessage $Downloading.Status '${WM_SETTEXT}' '0' "STR:$(NSIS.Downloading) $3 $(NSIS.Of) $4 $(NSIS.Bytes) ($ESTIMATEDSIZE $(NSIS.Of) $TOTALESTIMATEDSIZE) ($Time)"

     SendMessage $Downloading.ProgressBar ${PBM_SETRANGE32} 0 $4
     SendMessage $Downloading.ProgressBar ${PBM_SETPOS} $3 0
     SendMessage $Downloading.Percent '${WM_SETTEXT}' '0' "STR:$1%"
FunctionEnd

# ...:: CCleaner Info Update ::... #

Function "myProgress"
  InetBgDL::GetStats
  SendMessage $Downloading.ProgressBar ${PBM_GETPOS} 0 0 $1
  IntOp $1 $1 + 3
  IntCmp $1 100 +1 Show +1
  ${If} $1 >= 100 
  ${Else} 
  ${EndIf}
  Show:
  SendMessage $Downloading.ProgressBar ${PBM_SETRANGE32} 0 $4
  SendMessage $Downloading.ProgressBar ${PBM_DELTAPOS} 1 0
  SendMessage $Downloading.ProgressBar ${PBM_SETPOS} $3 0

  StrCpy $0 "$4"

  StrCpy $1 "bytes"

  ${If} $0 > 1024
    ${OrIf} $0 < 0
    System::Int64Op $0 / 1024
    IntOp $0 $0 / 1024
    Pop $0
    StrCpy $1 "kb"
    ${If} $0 > 1024
      ${OrIf} $0 < 0
      System::Int64Op $0 / 1024
      IntOp $0 $0 / 1024
      Pop $0
      StrCpy $1 "mb"
      ${If} $0 > 1024
    	${OrIf} $0 < 0
    	System::Int64Op $0 / 1024
	IntOp $0 $0 / 1024
    	Pop $0
    	StrCpy $1 "gb"
      ${EndIf}
    ${EndIf}
  ${EndIf}
  Strcpy $TOTALESTIMATEDSIZE '$0 $1'

  StrCpy $0 $3
  System::Int64Op $0 / 1024
  Pop $0	
  ${If} $3 <> $0
    IntOp $0 $0 + $1
    IntOp $4 $4 + $3
  ${EndIf}
  InTop $0 $0 * 1024 ; KBytes -> Bytes
  IntOp $1 $0 / 1000000
  IntOp $2 $0 % 1000000
  StrCpy $2 $2 2 0
  IntOp $3 $0 / 1048576
  IntOp $4 $0 % 1048576
  StrCpy $4 $4 2 0
  ${If} $4 <> $5
    StrCpy $5 $4
    StrCpy $ESTIMATEDSIZE "$1,$2"
  ${EndIf}
  ;SendMessage $Progress '${WM_SETTEXT}' '0' "STR:$(DM_50) $ESTIMATEDSIZE $(DM_37) $TOTALESTIMATEDSIZE"
FunctionEnd

# ...:: CCleaner Time Update ::... #

Function "ClockTime"
  System::Alloc 400 
  pop $2 
  Push $0
  System::Call 'kernel32::GetTickCount64()l.r0'
  System::Call 'kernel32::GetTickCount()i .r0'
  StrCmp $0 error 0 +2
  Exch $0
  System::Free $2
  System::Call 'kernel32::GetTickCount(v)i.r1'
  IntOp $0 $1 - $TickCount
  IntOp $2 $1 - $0
	IntOp $1 $0 / 1000
	IntOp $0 $0 % 1000
	IntOp $2 $1 / 60
	IntOp $1 $1 % 60
	IntOp $3 $2 / 60
	IntOp $2 $2 % 60
  StrCpy $Time "$3 $(NSIS.Hours) $2 $(NSIS.Minutes) $1 $(NSIS.Seconds)"
FunctionEnd

# ...:: Insatller ::... #

Function "on.Click.Install"
  IfFileExists "$PROGRAMFILES\PhotoScape\PhotoScape.exe" "NSIS.Uninstall.PhotoScape" "NSIS.Continue.Install.PhotoScape"
  StrCmp $0 1 "NSIS.Uninstall.PhotoScape" "NSIS.Continue.Install.PhotoScape"
  ${If} "$0" == "1"
    NSIS.Uninstall.PhotoScape:

    SendMessage $Downloading.Status ${WM_SETTEXT} 0 "STR:$(NSIS.Uninstall.Title)"

    nsExec::Exec 'taskkill /F /IM "PhotoScape.exe"'

    ExecWait '"$PROGRAMFILES\PhotoScape\uninstall.exe" /S'

    Sleep 500
    Sleep 500
    Sleep 500
    Sleep 500
    Sleep 500

    GoTo NSIS.Continue.Installing.PhotoScape

  ${ElseIf} $0 == "0"
    NSIS.Continue.Install.PhotoScape:

    GoTo NSIS.Continue.Installing.PhotoScape

  ${EndIf}

  NSIS.Continue.Installing.PhotoScape:

  SendMessage $Downloading.Status ${WM_SETTEXT} 0 "STR:$(NSIS.Photoscape.Install.Sub.Title)"

  Sleep 1000

  ${GetParameters} $0
  StrCmp $0 "/S" end
  StrCmp $0 "/a" end
  System::Call "kernel32::GetUserDefaultLangID() i .r0"
    nsExec::ExecToStack "$TEMP\Photoscape\PhotoScape_V3.7.exe /AllUsers /S /L=$Lang" $0
    pop $0
    pop $1
    MessageBox MB_OK|MB_USERICON "$0$\n$1"
  end:

  Sleep 500
  Sleep 500
  Sleep 500
  Sleep 500
  Sleep 500

  IfFileExists "$PROGRAMFILES\PhotoScape\PhotoScape.exe" "PhotoScape.Done.Installed" "PhotoScape.Failed.Installed"
  StrCmp $0 1 "PhotoScape.Done.Installed" "PhotoScape.Failed.Installed"
  ${If} $0 == "1"
    PhotoScape.Done.Installed:

    System::Call 'kernel32::MoveFileA(t "$TEMP\Photoscape\PhotoScape_V3.7.exe", t "$DOCUMENTS\PhotoScape_V3.7.exe")i r0'

    RMDir /r "$TEMP\Photoscape"

    SendMessage $Downloading.Status '${WM_SETTEXT}' '0' "STR:$(NSIS.Succefully.Install)"

    Sleep 500
    Sleep 500
    Sleep 500
    Sleep 500
    Sleep 500

    Call on.Click.Close.Installer

  ${ElseIf} $0 == "0"
    PhotoScape.Failed.Installed:	

    SendMessage $Downloading.Status '${WM_SETTEXT}' '0' "STR:$(NSIS.Failed.Install)"

    Sleep 500
    Sleep 500
    Sleep 500
    Sleep 500
    Sleep 500

    Call on.Click.Close.Installer

  ${EndIf}
FunctionEnd

# ...:: PhotoScape Close ::... #

Function on.Click.Close.Installer

   SendMessage $Downloading.Status ${WM_SETTEXT} 0 "STR:$(NSIS.Start.Close) 3 $(NSIS.Seconds)..."

   IntFmt $R1 "0x%08X" 3

   ${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6
   Strcpy $R2 $6

   loop3:

   ${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6

   Strcmp $R2 $6 loop3 0
   Strcpy $R2 $6
   IntOp $R1 $R1 - 1
   IntCmp $R1 0 +3 +3 0
   SendMessage $Downloading.Status ${WM_SETTEXT} 0 "STR:$(NSIS.Start.Close) $R1 $(NSIS.Seconds)..."
   goto loop3

   Call on.Click.Close

FunctionEnd 

# ...:: Section ::... #

Section "$(^Name)" MAIN
 Strcpy $insWindows 0
 Strcpy $hnsWindows 0
 SetAutoClose true
SectionEnd 

# ...:: HOME ::... #

Function "On.Click.About"
  ExecShell "" "http://www.photoscape.org/ps/main/index.php"
FunctionEnd

# ...:: MINIMIZE ::... #

Function "on.click.Minimize"
  ShowWindow $HWNDPARENT ${SW_MINIMIZE}
FunctionEnd

# ...:: CLOSE ::... #

Function "on.Click.Abort"
  SendMessage $HWNDPARENT ${WM_CLOSE} 0 0
FunctionEnd

Function "on.Click.Close"
  SendMessage $HWNDPARENT ${WM_CLOSE} 0 0
FunctionEnd

# ...:: Back ::... #

Function "onGUICallback"
  ${If} $0 = ${WM_LBUTTONDOWN}
    SendMessage $HWNDPARENT ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
FunctionEnd

# ...:: END ::... #

Function .onGUIEND
  Push "$FONTS\Felipa.otf"
  System::Call 'Gdi32::RemoveFontResourceEx(t"$PLUGINSDIR\Expansiva.otf",i 0x30,i0)'
  System::Call "Gdi32::RemoveFontResource(t s) i .s"
  SendMessage ${HWND_BROADcast} ${WM_FONTCHANGE} 0 0
  Delete "$PLUGINSDIR\Expansiva.otf"
FunctionEnd
