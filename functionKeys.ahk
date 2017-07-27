;=====================================================================
;                                Function Keys
;---------------------------------------------------------------------
; After Alt-Tab, move mouse to center of newly activated window.
;~!Tab::
;KeyWait, Alt
;KeyWait, Tab
;moveMouseToWindowCenter()
;return
;-----------------------------------o
;CapsLock & /:: Send ^/                        ;Toggle Line Comment
;-----------------------------------o
;CapsLock & \:: Send +!a                       ;Toggle Block Comment
;-----------------------------------o

;=====================================================================
;                        Frequently Used Programs
;---------------------------------------------------------------------
CapsLock & e::                                ;VSCode
Run "%editor%"
return

CapsLock & c::                                ;cmd
{
    if WinActive("ahk_class CabinetWClass") {
        folder := GetFolder()
        if GetKeyState("shift") != 0 { 
            run "%cmd%" /single %folder% -cur_console:d:%folder%
        } else {
            run "%cmd%" /start "%folder%"
        }
    } else {
        if GetKeyState("shift") != 0 {   ;Search
            run "%cmd%" /single %userProfile%
        } else {
           run "%cmd%" /start %userProfile%
        }
    }
    return
}
; Run "%cmd%"
;-----------------------------------o
CapsLock & d:: Send, +!d                      ;Dictionary
;-----------------------------------o    Web Search
CapsLock & w::
if GetKeyState("alt") = 0 {
    Run "%searchEngine%"
} else {
    Run "%searchEngineAlt%"
}
return
;-----------------------------------o
CapsLock & r:: Run Powershell                ;Run Shell
;-----------------------------------o
#include %A_LineFile%\..\lib\search-with-everything.ahk.
;-----------------------------------o
CapsLock & t::                              ;Text Process App
IfWinExist Untitled - Notepad 
    IfWinActive Untitled - Notepad
        WinMinimize
    else
        WinActivate
else 
    Run Notepad
return
;-----------------------------------o
CapsLock & p::                              ;Print/Record Screen
     
if GetKeyState("alt") = 0 {   ;Search
    Run SnippingTool.exe                    ;Sniping
} else {
    Run "%gifTool%"
} 
return
;-----------------------------------o

;=====================Win Function Key======================
;-----------------------------------o       Virtual machine
#v::
Run "%virtualMachineManager%"
return
;-----------------------------------o       Task Manager
#t::
Run "%processExplorer%"
return
;-----------------------------------o       Goto files pane
;#f::
;Send, ^f
;Send, `t
;Send, `t
;return
#IfWinActive ahk_class CabinetWClass ; Windows Explorer
    #f::
        ControlFocus, DirectUIHWND3, A
        SendInput, {Space}
        return
#IfWinActive
;-----------------------------------o       Goto Navigation pane
;#n::
;Send, ^f
;Send, `t
;return
#IfWinActive ahk_class CabinetWClass ; Windows Explorer
    #n::
        ControlFocus, SysTreeView321, A
        SendInput, {Space}
        return
#IfWinActive
;-----------------------------------o       Goto Navigation pane
#d::
Run, "%desktopFolder%"
return
;----------------------------------o        Copy and search with google
^!c::
{
 Send, ^c
 Sleep 50
 Run, "%searchEngine%/search?q=%clipboard%"
 Return
}
;---------------------------------o
^#!l::
Send, ^s ; To save a changed script
Sleep, 300 ; give it time to save the script
Reload
Return

#!^c::
TrayTip, AutoHotKey, Exited, 1
Sleep 1000
ExitApp
return