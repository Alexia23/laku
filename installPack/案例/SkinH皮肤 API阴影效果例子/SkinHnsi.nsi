	######## 本例由星空不寂寞编写|2015/7/18 #####
	
RequestExecutionLevel user
!include "MUI2.nsh"
!define MUI_ABORTWARNING
Page custom MUI_Welcome
Page instfiles ""
!insertmacro MUI_LANGUAGE "SimpChinese"

Name "Shinh皮肤例子"
OutFile "shinh例子.exe"

Section
	Sleep 1000
	Sleep 1000
	Sleep 1000
	Sleep 1000
	Sleep 1000
SectionEnd

Function MUI_Welcome
    System::Call `user32::SetClassLong(i$HWNDPARENT,i-26,i0x00020000)` ;添加阴影效果
		nsDialogs::Create 1044
				Pop $0
				${NSD_CreateBitmap} 0 0 100% 100% ""
				Pop $1
				${NSD_SetImage} $1 $PLUGINSDIR\bg.bmp $2
				GetDlgItem $0 $HWNDPARENT 1028
				System::Call User32::DestroyWindow(i$0)
				GetDlgItem $0 $HWNDPARENT 1034
				System::Call User32::DestroyWindow(i$0)
				GetDlgItem $0 $HWNDPARENT 1035
				System::Call User32::DestroyWindow(i$0)
				GetDlgItem $0 $HWNDPARENT 1036
				System::Call User32::DestroyWindow(i$0)
				GetDlgItem $0 $HWNDPARENT 1037
				System::Call User32::DestroyWindow(i$0)
				GetDlgItem $0 $HWNDPARENT 1038
				System::Call User32::DestroyWindow(i$0)
				GetDlgItem $0 $HWNDPARENT 1039
				System::Call User32::DestroyWindow(i$0)
				GetDlgItem $0 $HWNDPARENT 1256
				System::Call User32::DestroyWindow(i$0)
		nsDialogs::Show
		${NSD_FreeImage} $2
FunctionEnd

Function .onInit
		InitPluginsDir
		SetOutPath $PLUGINSDIR
		File 'SkinH.dll'
		File 'skinh.she'
		File 'bg.bmp'
		System::Call SkinH::SkinH_Attach()
FunctionEnd

Function .onGUIEnd
		System::Call Kernel32::GetModuleHandle(t$\"SkinH.dll$\")i.s
		System::Call Kernel32::FreeLibrary(is)$\"
		System::Call Kernel32::SetCurrentDirectory(t$\"$EXEDIR\$\")
FunctionEnd

