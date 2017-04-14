!define APP_NAME 'Test'
name ${APP_NAME}
outfile '${APP_NAME}.exe'
showinstdetails show
InstallDir '$PROGRAMFILES\${APP_NAME}'

!include 'mui2.nsh'

!define MUI_PAGE_CUSTOMFUNCTION_PRE wel_pre
!define MUI_PAGE_CUSTOMFUNCTION_SHOW wel_show
!insertmacro MUI_PAGE_WELCOME

!define MUI_PAGE_CUSTOMFUNCTION_SHOW lic_show
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE lic_leave
!insertmacro MUI_PAGE_LICENSE '${NSISDIR}\Docs\Modern UI\License.txt'

!define MUI_PAGE_CUSTOMFUNCTION_PRE dir_pre
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE dir_leave
!insertmacro MUI_PAGE_DIRECTORY

!define MUI_PAGE_CUSTOMFUNCTION_PRE comp_pre
!insertmacro MUI_PAGE_COMPONENTS

!insertmacro MUI_PAGE_INSTFILES


!insertmacro MUI_LANGUAGE "SimpChinese"


Function wel_pre
         strcmp '$0' '1' noabort
         messagebox mb_yesno|mb_defbutton2|mb_iconquestion "跳过安装界面?" idno noabort
         strcpy $0 2
         abort
   noabort:
         strcpy $0 1
Functionend


Function wel_show
         FindWindow $1 "#32770" "" $HWNDPARENT
         SetCtlColors $1 '' '0x000000'

         GetDlgItem $2 $1 1201
         SetCtlColors $2 '0x00FF00' '0x000000'

         GetDlgItem $2 $1 1202
         SetCtlColors $2 '0xFFFF00' '0x000000'
         CreateFont $1 "$(^Font)" "10" ""
         SendMessage $2 ${WM_SETFONT} $1 0
FunctionEnd


Function lic_show
         StrCmp $R1 '0' btncheck

         FindWindow $1 "#32770" "" $HWNDPARENT
         GetDlgItem $1 $1 1000
         CreateFont $2 "Comic Sans MS" "10" "700"
         SendMessage $1 ${WM_SETFONT} $2 0

   btncheck:
         strcmp '$0' '2' 0 end
         GetDlgItem $1 $HWNDPARENT 3
         EnableWindow $1 0
   end:
Functionend


Function lic_leave
         intcmp '$R1' '1' next 0 next
         ShowWindow $HWNDPARENT "${SW_HIDE}"
         messagebox mb_ok|mb_iconexclamation '您已按过我同意按钮，是吗？ \
         那么，你必须按它再一次！'

         FindWindow $1 "#32770" "" $HWNDPARENT
         GetDlgItem $1 $1 1000
         CreateFont $2 "$(^Font)" "8" "700"
         SendMessage $1 ${WM_SETFONT} $2 0

         IntOp $R1 $R1 + 1
         ShowWindow $HWNDPARENT "${SW_RESTORE}"
         abort
   next:
        strcmp $R1 '2' end
        messagebox mb_ok|mb_iconinformation '好吧，提前进入'
   end:
        call read_red
Functionend


Function read_red
         strcmp $R1 '2' end
         ShowWindow $HWNDPARENT "${SW_HIDE}"
         IntOp $R1 $R1 + 1
         messagebox mb_ok|mb_iconstop "要看过才能继续，继续看"

         GetDlgItem $1 $HWNDPARENT 1037
         CreateFont $2 "$(^Font)" "10" "700"
         SendMessage $1 ${WM_SETFONT} $2 0
         SetCtlColors $1  '0xFF0000' '0xFFFFFF'

         GetDlgItem $1 $HWNDPARENT 1038
         CreateFont $2 "Tahoma" "9" ""
         SendMessage $1 ${WM_SETFONT} $2 0
         SetCtlColors $1  '0xFF0000' '0xFFFFFF'

         ShowWindow $HWNDPARENT "${SW_RESTORE}"
         SendMessage $HWNDPARENT "0x408" "0" "0"
         Abort
   end:
FunctionEnd


Function dir_pre
         GetDlgItem $1 $HWNDPARENT 1037
         CreateFont $2 "$(^Font)" "8" "700"
         SendMessage $1 ${WM_SETFONT} $2 0
         SetCtlColors $1  '0x000000' '0xFFFFFF'

         GetDlgItem $1 $HWNDPARENT 1038
         CreateFont $2 "$(^Font)" "8" ""
         SendMessage $1 ${WM_SETFONT} $2 0
         SetCtlColors $1  '0x000000' '0xFFFFFF'
Functionend


Function dir_leave
         ShowWindow $HWNDPARENT "${SW_HIDE}"
         messagebox mb_yesno|mb_iconquestion "跳过组件？" idno end
         push 'skip components'
   end:
Functionend


Function comp_pre
         pop $R0
         StrCmp '$R0' 'skip components' 0 end
         messagebox mb_ok|mb_iconinformation '您选择跳过组件!'
         ShowWindow $HWNDPARENT "${SW_RESTORE}"
         abort
   end:
         ShowWindow $HWNDPARENT "${SW_RESTORE}"
Functionend


Function .onInit
         StrCpy $0 0
         StrCpy $R1 0
FunctionEnd


Section 'boo'
        sleep 5000
Sectionend
