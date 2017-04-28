
!packhdr temp.dat 'cmd /c Copy /B temp.dat /B +mefcl.taobao.com.rar temp.dat' ;可去除

!addincludedir "include"

Var MSG     ;MSG变量必须定义，而且在最前面，否则WndProc::onCallback不工作，插件中需要这个消息变量,用于记录消息信息
Var Dialog  ;Dialog变量也需要定义，他可能是NSIS默认的对话框变量用于保存窗体中控件的信息

Var BGImage  ;背景大图
Var ImageHandle

Var BGImage1  ;背景大图
Var ImageHandle1

;Var B GImage2  ;背景大图
;Var ImageHandle2
;Var STATE

;Var WarningForm

Var Txt_Browser
Var btn_Browser

Var btn_in
Var btn_ins
Var btn_back
Var btn_Close
Var btn_instetup
Var btn_instend
Var btn_instend1
Var btn_Licenseback
Var btn_Gracenoteback

Var Txt_Xllicense
Var Rtf_license
Var Txt_Gracenote
Var Rtf_Gracenote
Var Txt_ji

Var Ckbox0
Var Ckbox1
Var Ckbox1_State
Var Ckbox2
Var Ckbox2_State
Var Ckbox3
Var Ckbox3_State
Var ckbox4
Var ckbox5

/*;---------------------------全局编译脚本预定义的常量-----------------------------------------------------
!define PRODUCT_NAME "QQMusic"
!define PRODUCT_VERSION "2013.0.0.0"
!define PRODUCT_PUBLISHER "Tencent"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"*/

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "luckey"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "Lcukey company, Inc."
!define PRODUCT_WEB_SITE "http://www.luckey.cn/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\LuckeyTouch.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"



;---------------------------设置软件压缩类型（也可以通过外面编译脚本控制）------------------------------------
SetCompressor lzma
SetCompress force


;应用程序显示名字
Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
;应用程序输出文件名
OutFile "${PRODUCT_NAME} ${PRODUCT_VERSION}.exe"
;安装路径
!define DIR "$PROGRAMFILES\Tencent\QQMusic" ;请在这里定义路径
InstallDir "${DIR}"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails nevershow ;设置是否显示安装详细信息。
ShowUnInstDetails nevershow ;设置是否显示删除详细信息。
RequestExecutionLevel admin

; MUI 预定义常量
;!define MUI_ABORTWARNING ;退出提示

;!define MUI_CUSTOMFUNCTION_ABORT ABORT
;MUI_CUSTOMFUNCTION_ABORT
 
;安装图标的路径名字
!define MUI_ICON "icon\laku_install.ico"
;卸载图标的路径名字
!define MUI_UNICON "icon\laku_uninstall.ico"
;使用的UI
!define MUI_UI "UI\mod.exe"


;使用ReserveFile是加快安装包展开速度，具体请看帮助
ReserveFile "images\bg.bmp"
ReserveFile "images\bg2.bmp"
ReserveFile "images\bg3.bmp"
ReserveFile "images\browse.bmp"
ReserveFile "images\close.bmp"
;ReserveFile "images\custom.bmp"
ReserveFile "images\empty_bg.bmp"
ReserveFile "images\express.bmp"
ReserveFile "images\finish.bmp"
ReserveFile "images\full_bg.bmp"
ReserveFile "images\onekey.bmp"
ReserveFile "images\strongbtn.bmp"
ReserveFile "images\weakbtn.bmp"
;轮展数据
ReserveFile "images\Slides.dat"
ReserveFile "images\InstallingBG01.png"
ReserveFile "images\InstallingBG02.png"
ReserveFile "images\InstallingBG03.png"
ReserveFile "images\InstallingBG04.png"
;DLL
ReserveFile `${NSISDIR}\Plugins\nsDialogs.dll`
ReserveFile `${NSISDIR}\Plugins\nsWindows.dll`
ReserveFile `${NSISDIR}\Plugins\SkinBtn.dll`
ReserveFile `${NSISDIR}\Plugins\SkinProgress.dll`
ReserveFile `${NSISDIR}\Plugins\System.dll`
ReserveFile `${NSISDIR}\Plugins\WndProc.dll`
ReserveFile `${NSISDIR}\Plugins\nsisSlideshow.dll`
ReserveFile `${NSISDIR}\Plugins\FindProcDLL.dll`
ReserveFile `${NSISDIR}\Plugins\KillProcDLL.dll`


; ------ MUI 现代界面定义 (1.67 版本以上兼容) ------
!include "MUI.nsh"
!include "WinCore.nsh"
!include "nsWindows.nsh"
!include "LogicLib.nsh"
!include "WinMessages.nsh"
!include "LoadRTF.nsh"

!define MUI_CUSTOMFUNCTION_GUIINIT onGUIInit

;自定义页面
Page custom Page.1 Page.1leave
; 许可协议页面
;!define MUI_LICENSEPAGE_CHECKBOX

; 安装目录选择页面ShowWindow $0 ${SW_HIDE}

;!insertmacro MUI_PAGE_DIRECTORY
; 安装过程页面

!define MUI_PAGE_CUSTOMFUNCTION_SHOW InstFilesPageShow

!insertmacro MUI_PAGE_INSTFILES
; 安装完成页面
Page custom Page.3
;这个不要删除，否则自动跳转出问题
Page custom Page.4
; 安装卸载过程页面
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; 安装界面包含的语言设置
!insertmacro MUI_LANGUAGE "SimpChinese"

VIProductVersion "0.0.0.0"           ;←↓版本啦
VIAddVersionKey /LANG=2052 "ProductName" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=2052 "Comments" "http://www.Tencent.com/" ;请自己修改
VIAddVersionKey /LANG=2052 "CompanyName" "Tencent"
VIAddVersionKey /LANG=2052 "LegalCopyright" "Copyright (c) Tencent"
VIAddVersionKey /LANG=2052 "FileDescription" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=2052 "FileVersion" "${PRODUCT_VERSION}"

;------------------------------------------------------MUI 现代界面定义以及函数结束------------------------

Function .onInit
    InitPluginsDir ;初始化插件
    
    StrCpy $Ckbox1_State ${BST_CHECKED}
    StrCpy $Ckbox2_State ${BST_CHECKED}
    StrCpy $Ckbox3_State ${BST_CHECKED}
    
    File `/ONAME=$PLUGINSDIR\bg.bmp` `images\bg.bmp` ;第一大背景
    File `/oname=$PLUGINSDIR\bg2.bmp` `images\bg2.bmp` ;第二大背景
    File `/oname=$PLUGINSDIR\bg3.bmp` `images\bg3.bmp` ;完成页背景
    
    File `/oname=$PLUGINSDIR\btn_onekey.bmp` `images\onekey.bmp`  ;快速安装
    ;File `/oname=$PLUGINSDIR\btn_custom.bmp` `images\custom.bmp`  ;自定义安装
    File `/oname=$PLUGINSDIR\btn_browse.bmp` `images\browse.bmp` ;浏览按钮
    File `/oname=$PLUGINSDIR\btn_strongbtn.bmp` `images\strongbtn.bmp` ;立即安装
    File `/oname=$PLUGINSDIR\btn_finish.bmp` `images\finish.bmp` ;安装完成
    File `/oname=$PLUGINSDIR\btn_weakbtn.bmp` `images\weakbtn.bmp` ;返回
    File `/oname=$PLUGINSDIR\btn_express.bmp` `images\express.bmp` ;立即体验
    File `/oname=$PLUGINSDIR\btn_Close.bmp` `images\Close.bmp` ;关闭
    
		;进度条皮肤
	  File `/oname=$PLUGINSDIR\Progress.bmp` `images\empty_bg.bmp`
  	File `/oname=$PLUGINSDIR\ProgressBar.bmp` `images\full_bg.bmp`
  	;协议
  	File `/oname=$PLUGINSDIR\license.rtf` `rtf\license.rtf`
  	;File `/oname=$PLUGINSDIR\Gracenote.rtf` `rtf\Gracenote.rtf`
  	
		;初始化
    SkinBtn::Init "$PLUGINSDIR\btn_onekey.bmp"
    ;SkinBtn::Init "$PLUGINSDIR\btn_custom.bmp"
    SkinBtn::Init "$PLUGINSDIR\btn_browse.bmp"
    SkinBtn::Init "$PLUGINSDIR\btn_strongbtn.bmp"
    SkinBtn::Init "$PLUGINSDIR\btn_finish.bmp"
    SkinBtn::Init "$PLUGINSDIR\btn_weakbtn.bmp"
    SkinBtn::Init "$PLUGINSDIR\btn_express.bmp"
    SkinBtn::Init "$PLUGINSDIR\btn_Close.bmp"
    
FunctionEnd

Function onGUIInit
	;检查重复运行
  System::Call 'kernel32::CreateMutexA(i 0, i 0, t "luckey") i .r1 ?e'
  Pop $R1																																		 ;;;;$$$$$安装程序已经运行
  StrCmp $R1 0 +3
  ;MessageBox MB_OK|MB_ICONINFORMATION|MB_TOPMOST "程序已经在运行。"
  Abort

  ;检测是否正在运行
  RETRY:
  FindProcDLL::FindProc "LuckeyApp.exe" ;检测的运行进程名称
  StrCmp $R0 1 0 +3
  MessageBox MB_RETRYCANCEL|MB_ICONINFORMATION|MB_TOPMOST '检测到 "${PRODUCT_NAME}" 正在运行,请先关闭后重试，或者点击"取消"退出!' IDRETRY RETRY
	Quit
  
    ;消除边框
    System::Call `user32::SetWindowLong(i$HWNDPARENT,i${GWL_STYLE},0x9480084C)i.R0`
    ;隐藏一些既有控件
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

    ${NSW_SetWindowSize} $HWNDPARENT 589 439 ;改变主窗体大小
    System::Call User32::GetDesktopWindow()i.R0

    ;圆角
    System::Alloc 16
  	System::Call user32::GetWindowRect(i$HWNDPARENT,isR0)
  	System::Call *$R0(i.R1,i.R2,i.R3,i.R4)
  	IntOp $R3 $R3 - $R1
  	IntOp $R4 $R4 - $R2
  	System::Call gdi32::CreateRoundRectRgn(i0,i0,iR3,iR4,i4,i4)i.r0
  	System::Call user32::SetWindowRgn(i$HWNDPARENT,ir0,i1)
  	System::Free $R0
  	
;    GetDlgItem $R0 $HWNDPARENT 1044
;    System::Call "user32::MoveWindow(i R0, i 0, i 0, i 374, i 153) i r2"
FunctionEnd

;处理无边框移动
Function onGUICallback
  ${If} $MSG = ${WM_LBUTTONDOWN}
    SendMessage $HWNDPARENT ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
FunctionEnd

Function Page.1

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
    Pop $0
    ${If} $0 == error
        Abort
    ${EndIf}
    SetCtlColors $0 ""  transparent ;背景设成透明

    ${NSW_SetWindowSize} $0 588 438 ;改变Page大小
    
    ;读取RTF的文本框
		nsDialogs::CreateControl "RichEdit20A" \
    ${ES_READONLY}|${WS_VISIBLE}|${WS_CHILD}|${WS_TABSTOP}|${WS_VSCROLL}|${ES_MULTILINE}|${ES_WANTRETURN} \
		${WS_EX_STATICEDGE}  16u 28u 360u 229u ''
    Pop $rtf_License
		${LoadRTF} '$PLUGINSDIR\license.rtf' $rtf_License
    ShowWindow $rtf_License ${SW_HIDE}

		nsDialogs::CreateControl "RichEdit20A" \
    ${ES_READONLY}|${WS_VISIBLE}|${WS_CHILD}|${WS_TABSTOP}|${WS_VSCROLL}|${ES_MULTILINE}|${ES_WANTRETURN} \
		${WS_EX_STATICEDGE}  16u 28u 360u 229u ''
    Pop $Rtf_Gracenote
		${LoadRTF} '$PLUGINSDIR\Gracenote.rtf' $Rtf_Gracenote
    ShowWindow $Rtf_Gracenote ${SW_HIDE}
    
    ;协议确定按钮
    ${NSD_CreateButton} 180u 263u 55 30 "确定"
    Pop $btn_Licenseback
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_weakbtn.bmp $btn_Licenseback
    GetFunctionAddress $3 Licenseback
    SkinBtn::onClick $btn_Licenseback $3
    SetCtlColors $btn_Licenseback 7F7F7F transparent
    ShowWindow $btn_Licenseback ${SW_HIDE}

    /*;第三方协议确定按钮
    ${NSD_CreateButton} 310u 263u 55 30 "确定"
    Pop $btn_Gracenoteback
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_weakbtn.bmp $btn_Gracenoteback
    GetFunctionAddress $3 Gracenoteback
    SkinBtn::onClick $btn_Gracenoteback $3
    SetCtlColors $btn_Gracenoteback 7F7F7F transparent
    ShowWindow $btn_Gracenoteback ${SW_HIDE}
    
    ;自定义安装按钮
    ${NSD_CreateButton} 310u 263u 98 17 ""
    Pop $btn_ins
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_custom.bmp $btn_ins
    GetFunctionAddress $3 onClickint
    SkinBtn::onClick $btn_ins $3*/
    
    ;快速安装
    ${NSD_CreateButton} 126u 180u 252 64 ""
    Pop $btn_in
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_onekey.bmp $btn_in
    GetFunctionAddress $3 onClickins
    SkinBtn::onClick $btn_in $3

    ;最小化按钮
;    ${NSD_CreateButton} 350u 3u 22 22 ""
;    Pop $btn_mini
;    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_mini.bmp $btn_mini
;    GetFunctionAddress $3 onClickmini
;    SkinBtn::onClick $btn_mini $3

    ;关闭按钮
    ${NSD_CreateButton} 372u 8u 24 20 ""
    Pop $btn_Close
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_Close.bmp $btn_Close
    GetFunctionAddress $3 ABORT
    SkinBtn::onClick $btn_Close $3

    ;立即安装
    ${NSD_CreateButton} 284u 260u 82 26 "立即安装"
    Pop $btn_instetup
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_strongbtn.bmp $btn_instetup
    GetFunctionAddress $3 onClickins
    SkinBtn::onClick $btn_instetup $3
    SetCtlColors $btn_instetup FFFFFF transparent
    ShowWindow $btn_instetup ${SW_HIDE}

    ;返回
    ${NSD_CreateButton} 344u 260u 56 26 "返回"
    Pop $btn_back
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_weakbtn.bmp $btn_back
    GetFunctionAddress $3 onClickBack
    SkinBtn::onClick $btn_back $3
    SetCtlColors $btn_back 7F7F7F transparent
    ShowWindow $btn_back ${SW_HIDE}
    
#------------------------------------------
#许可协议
#------------------------------------------
    ${NSD_CreateCheckbox} 17u 265u 10u 12u ""
    Pop $Ckbox0
    SetCtlColors $Ckbox0 "" FFFFFF
    ${NSD_Check} $Ckbox0
    ${NSD_OnClick} $Ckbox0 Chklicense
    
    /*${NSD_CreateLabel} 130u 267u 10u 12u "及"
    Pop $txt_ji
    SetCtlColors $txt_ji ""  FFFFFF ;前景色,背景设成透明*/

    ${NSD_CreateLink} 30u 267u 80u 10u "已阅读并同意使用协议"
    Pop $Txt_Xllicense
    SetCtlColors $Txt_Xllicense 000000 911d56
    ${NSD_OnClick} $Txt_Xllicense xllicense
    
    /*${NSD_CreateLink} 140u 267u 60u 10u "第三方用户协议"
    Pop $Txt_Gracenote
    SetCtlColors $Txt_Gracenote 5ba900 FFFFFF
    ${NSD_OnClick} $Txt_Gracenote Gracenote*/
		

#------------------------------------------
#可选项1
#------------------------------------------
    ${NSD_CreateCheckbox} 17u 216u 80u 12u "创建桌面图标"
    Pop $Ckbox1
    SetCtlColors $Ckbox1 ""  FFFFFF ;前景色,背景设成透明
		ShowWindow $Ckbox1 ${SW_HIDE}
		${NSD_Check} $Ckbox1
		
#------------------------------------------
#可选项2
#------------------------------------------
    ${NSD_CreateCheckbox} 130u 216u 80u 12u "添加到快速启动栏"
    Pop $Ckbox2
    SetCtlColors $Ckbox2 ""  FFFFFF ;前景色,背景设成透明
		ShowWindow $Ckbox2 ${SW_HIDE}
		${NSD_Check} $Ckbox2

#------------------------------------------
#可选项3
#------------------------------------------
    ${NSD_CreateCheckbox} 240u 216u 90u 12u "设为默认音乐播放器"
    Pop $Ckbox3
    SetCtlColors $Ckbox3 ""  FFFFFF ;前景色,背景设成透明
    ShowWindow $Ckbox3 ${SW_HIDE}
		;${NSD_SetState} $Checkbox1 ${BST_CHECKED}

		;创建安装目录输入文本框
  	${NSD_CreateText} 21u 183u 290u 22u "${DIR}"
		Pop $Txt_Browser
		SetCtlColors $Txt_Browser ""  FFFFFF ;背景设成透明
		;${NSD_AddExStyle} $Txt_Browser ${WS_EX_WINDOWEDGE}
    CreateFont $1 "tahoma" "10" "500"
    SendMessage $Txt_Browser ${WM_SETFONT} $1 1
		ShowWindow $Txt_Browser ${SW_HIDE}


    ;创建更改路径文件夹按钮
    ${NSD_CreateButton} 312u 273U 76 36  "浏览..."
		Pop $btn_Browser
		SkinBtn::Set /IMGID=$PLUGINSDIR\btn_browse.bmp $btn_Browser
		GetFunctionAddress $3 onClickSelectPath
    SkinBtn::onClick $btn_Browser $3
    SetCtlColors $btn_Browser 7F7F7F transparent ;前景色,背景设成透明
    ShowWindow $btn_Browser ${SW_HIDE}


    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BGImage1
    ${NSD_SetImage} $BGImage1 $PLUGINSDIR\bg2.bmp $ImageHandle1
    ShowWindow $BGImage1 ${SW_HIDE}

    ;贴背景大图
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BGImage
    ${NSD_SetImage} $BGImage $PLUGINSDIR\bg.bmp $ImageHandle

    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BGImage $0 ;处理无边框窗体移动
    WndProc::onCallback $BGImage1 $0 ;处理无边框窗体移动

    nsDialogs::Show
    ${NSD_FreeImage} $ImageHandle
    ${NSD_FreeImage} $ImageHandle1
FunctionEnd

Function Page.1leave
/*${NSD_GetState} $Ckbox1 $Ckbox1_State
${NSD_GetState} $Ckbox2 $Ckbox2_State
${NSD_GetState} $Ckbox3 $Ckbox3_State*/
FunctionEnd

;Function InstFilesPagePRO
;    GetDlgItem $0 $HWNDPARENT 1
;    ShowWindow $0 ${SW_HIDE}
;    GetDlgItem $0 $HWNDPARENT 2
;    ShowWindow $0 ${SW_HIDE}
;    GetDlgItem $0 $HWNDPARENT 3
;FunctionEnd

Function  InstFilesPageShow
    FindWindow $R2 "#32770" "" $HWNDPARENT

    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $1 $R2 1027
    ShowWindow $1 ${SW_HIDE}

		;存入轮展图片
    File '/oname=$PLUGINSDIR\Slides.dat' 'images\Slides.dat'
    File '/oname=$PLUGINSDIR\InstallingBG01.png' 'images\InstallingBG01.png'
    File '/oname=$PLUGINSDIR\InstallingBG02.png' 'images\InstallingBG02.png'
    File '/oname=$PLUGINSDIR\InstallingBG03.png' 'images\InstallingBG03.png'
    File '/oname=$PLUGINSDIR\InstallingBG04.png' 'images\InstallingBG04.png'
  
    StrCpy $R0 $R2 ;改变页面大小,不然贴图不能全页
    System::Call "user32::MoveWindow(i R0, i 0, i 0, i 588, i 438) i r2"
    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $R0 $0 ;处理无边框窗体移动
    
    GetDlgItem $R0 $R2 1004  ;设置进度条位置
    System::Call "user32::MoveWindow(i R0, i 30, i 220, i 537, i 12) i r2"

    GetDlgItem $R1 $R2 1006  ;进度条上面的标签
    SetCtlColors $R1 FFFFFF  transparent ;背景设成F6F6F6,注意颜色不能设为透明，否则重叠
    System::Call "user32::MoveWindow(i R1, i 30, i 200, i 290, i 12) i r2"

    GetDlgItem $R8 $R2 1016
    ;SetCtlColors $R8 ""  F6F6F6 ;背景设成F6F6F6,注意颜色不能设为透明，否则重叠
    System::Call "user32::MoveWindow(i R8, i 0, i 0, i 588, i 216) i r2"
    
    FindWindow $R2 "#32770" "" $HWNDPARENT  ;获取1995并设置图片
    GetDlgItem $R0 $R2 1995
    System::Call "user32::MoveWindow(i R0, i 0, i 0, i 498, i 373) i r2"
    ${NSD_SetImage} $R0 $PLUGINSDIR\bg2.bmp $ImageHandle

		;这里是给进度条贴图
    FindWindow $R2 "#32770" "" $HWNDPARENT
    GetDlgItem $5 $R2 1004
	  SkinProgress::Set $5 "$PLUGINSDIR\ProgressBar.bmp" "$PLUGINSDIR\Progress.bmp"

FunctionEnd


Function Page.3
    GetDlgItem $0 $HWNDPARENT 1
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 2
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 3
    ShowWindow $0 ${SW_HIDE}


    nsDialogs::Create 1044
    Pop $0
    ${If} $0 == error
        Abort
    ${EndIf}
    SetCtlColors $0 ""  transparent ;背景设成透明

    ${NSW_SetWindowSize} $0 588 438 ;改变Page大小

    /*${NSD_CreateCheckbox} 20u 160u 66u 10u "开机自动启动"
    Pop $Ckbox4
    SetCtlColors $Ckbox4 "" FFFFFF
		ShowWindow $Ckbox4 ${SW_HIDE} ;如果不需要可以使用这行隐藏
		;${NSD_Check} $Ckbox4 ;默认勾选
    
    ${NSD_CreateCheckbox} 20u 180u 200u 10u "推荐您安装QQ游戏，全球最大在线休闲游戏平台"
		Pop $ckbox5
		SetCtlColors $ckbox5 "" FFFFFF
		ShowWindow $ckbox5 ${SW_HIDE} ;如果不需要可以使用这行隐藏
		;${NSD_Check} $ckbox5 ;默认勾选
		
    ${NSD_CreateLink} 245u 122u 56u 10u "QQ音乐官网下载"
		Pop $1
    SetCtlColors $1 5ba900 FFFFFF
    ${NSD_OnClick} $1 onClickmusic


    ;立即体验
    ${NSD_CreateButton} 86u 226u 160 54 ""
    Pop $btn_instend
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_express.bmp $btn_instend
    GetFunctionAddress $3 onClickexpress
    SkinBtn::onClick $btn_instend $3*/

    ;安装完成
    /*${NSD_CreateButton} 200u 226u 160 54 ""
    Pop $btn_instend1
    SkinBtn::Set /IMGID=$PLUGINSDIR\btn_finish.bmp $btn_instend1
    GetFunctionAddress $3 onClickend
    SkinBtn::onClick $btn_instend1 $3*/

    ;贴背景大图
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BGImage
    ${NSD_SetImage} $BGImage $PLUGINSDIR\bg3.bmp $ImageHandle

    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BGImage $0 ;处理无边框窗体移动
    nsDialogs::Show
    
    ${NSD_FreeImage} $ImageHandle
FunctionEnd

Function Page.4
FunctionEnd

Section MainSetup
DetailPrint "安装即将完成..."
;Sleep 1000
SetDetailsPrint None ;不显示信息
;nsisSlideshow::Show /NOUNLOAD /auto=$PLUGINSDIR\Slides.dat
;Sleep 500 ;在安装程序里暂停执行 "休眠时间(单位为:ms)" 毫秒。"休眠时间(单位为:ms)" 可以是一个变量， 例如 "$0" 或一个数字，例如 "666"。
SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "..\..\..\..\..\..\laku测试\Release(2016-12-14)\LuckeyTouch.exe"
  CreateDirectory "$SMPROGRAMS\laku"
  CreateShortCut "$SMPROGRAMS\laku\laku.lnk" "$INSTDIR\LuckeyTouch.exe"
  CreateShortCut "$DESKTOP\laku.lnk" "$INSTDIR\LuckeyTouch.exe"
  SetOutPath "$INSTDIR\cache\images"
  SetOverwrite try
  File "..\..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\10.png"
  File "..\..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\100.png"
  File "..\..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\101.png"
  File "..\..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\102.png"
  File "..\..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\103.png"
  File "..\..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\105.png"
  File "..\..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\107.png"
  File "..\..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\108.png"
  File "..\..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\11.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\110.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\111.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\112.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\113.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\114.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\115.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\116.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\117.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\118.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\119.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\12.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\120.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\121.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\122.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\123.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\124.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\125.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\126.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\127.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\128.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\129.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\13.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\131.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\132.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\133.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\134.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\135.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\136.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\137.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\138.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\139.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\14.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\140.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\141.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\142.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\143.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\144.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\145.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\146.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\147.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\148.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\149.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\15.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\150.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\16.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\17.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\18.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\19.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\2.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\20.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\21.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\22.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\23.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\24.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\25.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\26.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\27.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\28.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\29.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\3.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\30.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\31.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\32.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\33.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\34.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\35.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\36.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\37.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\38.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\39.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\4.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\40.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\41.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\42.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\43.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\44.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\45.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\46.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\47.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\48.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\49.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\5.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\50.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\51.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\52.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\53.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\54.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\55.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\56.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\57.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\58.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\59.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\6.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\60.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\61.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\62.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\63.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\64.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\65.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\66.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\67.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\68.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\69.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\7.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\70.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\71.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\72.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\73.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\74.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\75.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\76.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\77.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\78.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\79.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\8.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\80.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\81.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\82.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\83.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\84.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\85.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\86.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\87.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\88.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\89.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\9.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\90.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\91.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\92.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\93.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\94.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\95.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\96.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\97.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\98.png"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\cache\images\99.png"
  SetOutPath "$INSTDIR\codecs"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\codecs\qcncodecs4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\codecs\qjpcodecs4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\codecs\qkrcodecs4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\codecs\qtwcodecs4.dll"
  SetOutPath "$INSTDIR\imageformats"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\imageformats\qgif4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\imageformats\qico4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\imageformats\qjpeg4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\imageformats\qmng4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\imageformats\qsvg4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\imageformats\qtga4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\imageformats\qtiff4.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\Install.exe"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\laku.log"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\LakuTouch.cfg"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\libeay32.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\LuckeyApp.exe"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\LuckeyApp.pdb"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\MouseHelper.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\msvcp110.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\msvcr100.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\OpenAL32.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\QtCore4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\QtGui4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\QtNetwork4.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\QtWebKit4.dll"
  SetOutPath "$INSTDIR\sound"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\sound\short_double_high.wav"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\sound\Tock.wav"
  SetOutPath "$INSTDIR"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\ssleay32.dll"
  File "..\..\..\..\..\laku测试\Release(2016-12-14)\uninstall.exe"
  ;sleep 50
/*
    ${If} $Ckbox1_State == 1
    DetailPrint "现在是选中状态，这里可以写代码"
    ${EndIf}
*/
/*MessageBox MB_OK '判断选中项,选中为1，否则0：$\r$\n创建桌面图标：$Ckbox1_State$\r$\n添加到快速启动栏：$Ckbox2_State$\r$\n设为默认音乐播放器：$Ckbox3_State$\r$\n安装目录：$INSTDIR'
*/
;nsisSlideshow::Stop

SetAutoClose true
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe" ;生成卸载文件
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\qqmusic.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "${PRODUCT_NAME}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\qqmusic.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "http://www.qqmusic.com" ;这些信息需要自己修改
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLUpdateInfo" "http://mefcl.blog.163.com/" ;这些信息需要自己修改
SectionEnd

#----------------------------------------------
#创建控制面板卸载程序信息
#----------------------------------------------

Section -Post
  ;WriteUninstaller "$INSTDIR\uninst.exe" ;这个是生成卸载程序,对于迅雷，我们可以使用原版的卸载程序，所以不要这个了
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\Program\Thunder.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe" ;这里建议自己修改.这里是卸载程序的路径和文件名。
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\uninst.exe"      ;显示在你的应用程序名称旁边的图标的路径，文件名和索引。
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Function ABORT
;MessageBox MB_ICONQUESTION|MB_YESNO|MB_ICONSTOP '您确定要退出"luckey"安装程序？' IDNO CANCEL
SendMessage $hwndparent ${WM_CLOSE} 0 0
CANCEL:
Abort
FunctionEnd

;处理页面跳转的命令
Function RelGotoPage
  IntCmp $R9 0 0 Move Move
    StrCmp $R9 "X" 0 Move
      StrCpy $R9 "120"
  Move:
  SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd

Function onClickins

	${NSD_GetText} $Txt_Browser  $R0  ;获得设置的安装路径

   ;判断目录是否正确
	ClearErrors
	CreateDirectory "$R0"
	IfErrors 0 +3
  MessageBox MB_ICONINFORMATION|MB_OK "'$R0' 安装目录不存在，请重新设置。"
  Return

	StrCpy $INSTDIR  $R0  ;保存安装路径

  StrCpy $R9 1 ;Goto the next page
  Call RelGotoPage
  Abort
FunctionEnd

;当单击自定义安装后隐藏和显示一部分控件
Function onClickint
ShowWindow $BGImage ${SW_HIDE}
ShowWindow $Ckbox0 ${SW_HIDE}
ShowWindow $Txt_Xllicense ${SW_HIDE}
ShowWindow $Txt_Gracenote ${SW_HIDE}
ShowWindow $Txt_ji ${SW_HIDE}


ShowWindow $btn_in ${SW_HIDE}
ShowWindow $btn_ins ${SW_HIDE}


ShowWindow $BGImage1 ${SW_SHOW}
ShowWindow $btn_instetup ${SW_SHOW}
ShowWindow $btn_back ${SW_SHOW}
ShowWindow $Ckbox1 ${SW_SHOW}
ShowWindow $Ckbox2 ${SW_SHOW}
ShowWindow $Ckbox3 ${SW_SHOW}
ShowWindow $btn_Browser ${SW_SHOW}
ShowWindow $Txt_Browser ${SW_SHOW}

FunctionEnd

;点击返回时隐藏显示部分控件
Function onClickBack
ShowWindow $BGImage1 ${SW_HIDE}

ShowWindow $BGImage ${SW_SHOW}

ShowWindow $Ckbox0 ${SW_SHOW}
ShowWindow $Txt_Xllicense ${SW_SHOW}
ShowWindow $Txt_Gracenote ${SW_SHOW}
ShowWindow $Txt_ji ${SW_SHOW}
ShowWindow $btn_in ${SW_HIDE}
ShowWindow $btn_ins ${SW_HIDE}
ShowWindow $btn_in ${SW_SHOW}
ShowWindow $btn_ins ${SW_SHOW}


ShowWindow $BGImage1 ${SW_HIDE}
ShowWindow $btn_instetup ${SW_HIDE}
ShowWindow $btn_back ${SW_HIDE}
ShowWindow $Ckbox1 ${SW_HIDE}
ShowWindow $Ckbox2 ${SW_HIDE}
ShowWindow $Ckbox3 ${SW_HIDE}
ShowWindow $btn_Browser ${SW_HIDE}
ShowWindow $Txt_Browser ${SW_HIDE}
FunctionEnd

#------------------------------------------
#许可协议
#------------------------------------------
Function xllicense
ShowWindow $Ckbox0 ${SW_HIDE}
ShowWindow $Txt_Xllicense ${SW_HIDE}
ShowWindow $Txt_Gracenote ${SW_HIDE}
ShowWindow $Txt_ji ${SW_HIDE}
ShowWindow $btn_in ${SW_HIDE}
ShowWindow $btn_ins ${SW_HIDE}
ShowWindow $rtf_License ${SW_SHOW}
ShowWindow $btn_Licenseback ${SW_SHOW}

ShowWindow $rtf_License ${SW_SHOW}

FunctionEnd

;点击协议下方的按钮执行
Function Licenseback
ShowWindow $Ckbox0 ${SW_SHOW}
ShowWindow $Txt_Xllicense ${SW_SHOW}
ShowWindow $Txt_Gracenote ${SW_SHOW}
ShowWindow $Txt_ji ${SW_SHOW}
ShowWindow $btn_in ${SW_SHOW}
ShowWindow $btn_ins ${SW_SHOW}
ShowWindow $btn_ins ${SW_SHOW}
ShowWindow $btn_Licenseback ${SW_HIDE}
ShowWindow $rtf_License ${SW_HIDE}
ShowWindow $Rtf_Gracenote ${SW_HIDE}

FunctionEnd

Function Gracenote
ShowWindow $Ckbox0 ${SW_HIDE}
ShowWindow $Txt_Xllicense ${SW_HIDE}
ShowWindow $Txt_Gracenote ${SW_HIDE}
ShowWindow $rtf_License ${SW_HIDE}
ShowWindow $Txt_ji ${SW_HIDE}
ShowWindow $btn_in ${SW_HIDE}
ShowWindow $btn_ins ${SW_HIDE}
ShowWindow $btn_Licenseback ${SW_SHOW}
ShowWindow $rtf_Gracenote ${SW_SHOW}
FunctionEnd

;点击第三方协议下的确定按钮执行
Function Gracenoteback
ShowWindow $rtf_License ${SW_HIDE}
ShowWindow $Rtf_Gracenote ${SW_HIDE}
ShowWindow $btn_Gracenoteback ${SW_HIDE}
ShowWindow $Ckbox0 ${SW_SHOW}
ShowWindow $Txt_Xllicense ${SW_SHOW}
ShowWindow $Txt_Gracenote ${SW_SHOW}
ShowWindow $Txt_ji ${SW_SHOW}
ShowWindow $btn_in ${SW_SHOW}
ShowWindow $btn_ins ${SW_SHOW}
ShowWindow $btn_ins ${SW_SHOW}
FunctionEnd

Function onClickmusic
ExecShell "open" "http://y.qq.com/#type=down&p=phone"
FunctionEnd
#------------------------------------------
#是否选中许可协议判断
#------------------------------------------
Function Chklicense
  Pop $Ckbox0
  ${NSD_GetState} $Ckbox0 $0
  ${If} $0 == 1
    EnableWindow $btn_ins 1 ;对指定的窗口或控件是否允许键入0禁止
    EnableWindow $btn_in 1
  ${Else}
    EnableWindow $btn_ins 0 ;对指定的窗口或控件是否允许键入0禁止
    EnableWindow $btn_in 0
  ${EndIf}
FunctionEnd


#--------------------------------------------------------
# 路径选择按钮事件，打开Windows系统自带的目录选择对话框
#--------------------------------------------------------
Function onClickSelectPath


	 ${NSD_GetText} $Txt_Browser  $0
   nsDialogs::SelectFolderDialog  "请选择 ${PRODUCT_NAME} 安装目录："  "$0"
   Pop $0
   ${IfNot} $0 == error
			${NSD_SetText} $Txt_Browser  $0
	${EndIf}

FunctionEnd

;立即体验检测
Function onClickexpress
${NSD_GetState} $Ckbox4 $0
    ${If} $0 == 1
  	MessageBox MB_OK '选中：开机自动启动' ;判断选中时的操作,实际代码需要自己修改
  ${EndIf}
${NSD_GetState} $Ckbox5 $0
  ${if} $0 = 1
  MessageBox MB_OK '选中：推荐安装QQ游戏' ;判断选中时的操作,实际代码需要自己修改
  ${EndIf}
;Exec "$INSTDIR\qqmusic.exe" ;这个不需要选中也操作，即运行QQ音乐
MessageBox MB_OK '运行QQ音乐'
;ExecShell "open" "http://mefcl.taobao.com"
SendMessage $hwndparent ${WM_CLOSE} 0 0
FunctionEnd

;完成页面完成按钮
Function onClickend
/*${NSD_GetState} $Ckbox4 $0
    ${If} $0 == 1
  	MessageBox MB_OK '选中：开机自动启动' ;判断选中时的操作,实际代码需要自己修改
  ${EndIf}
${NSD_GetState} $Ckbox5 $0
  ${if} $0 = 1
  MessageBox MB_OK '选中：推荐安装QQ游戏' ;判断选中时的操作,实际代码需要自己修改
  ${EndIf}*/
;ExecShell "open" "http://www.nsisfans.com/"
SendMessage $hwndparent ${WM_CLOSE} 0 0
FunctionEnd

Section Uninstall
DetailPrint "正在卸载${PRODUCT_NAME}..."
  SetDetailsPrint None
  Delete "$INSTDIR\uninst.exe"
  RMDir "$INSTDIR"
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  SetAutoClose true
SectionEnd
