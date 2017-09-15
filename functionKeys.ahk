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
;-----------------------------------o copy file full path to clipboard
Capslock & \::
#IfWinActive ahk_class CabinetWClass
SendInput, ^c
Sleep 100
Clipboard := Clipboard
Return
;=====================================================================
;                        Frequently Used Programs
;---------------------------------------------------------------------
CapsLock & c::                                ;VSCode
{
    if WinActive("ahk_class CabinetWClass") {
        folder := GetFolder()
        ShellRun(code,folder,A_WorkingDir)
    } else {
        ShellRun(code,,A_WorkingDir)
    }
    return
}

CapsLock & e::                                ;Editor
Run "%editor%"
return

CapsLock & t::                                ; terminal
{
    if WinActive("ahk_class CabinetWClass") {
        folder := GetFolder()
        if GetKeyState("shift") != 0 { 
            run "%cmd%" /start "%folder%"
        } else {
            run "%cmd%" /single %folder% -cur_console:d:%folder%
        }
    } else {
        if GetKeyState("shift") != 0 {   ;Search
           run "%cmd%" /start %userProfile%
        } else {
           run "%cmd%" /single %userProfile%
        }
    }
    return
}
; Run "%cmd%"
;-----------------------------------o
CapsLock & d:: Send, +!d                      ;Dictionary
;-----------------------------------o    Web Search
CapsLock & w::
if GetKeyState("alt") != 0 {
    ShellRun(searchEngineAlt)
} else {
    ShellRun(searchEngine)
}
return
;-----------------------------------o
CapsLock & r:: Run Powershell                ;Run Shell
;-----------------------------------o
#include %A_LineFile%\..\search-with-everything.ahk.
;-----------------------------------o
CapsLock & q::                              ; quick note
IfWinExist Untitled - Notepad 
    IfWinActive Untitled - Notepad
        WinMinimize
    else
        WinActivate
else 
    Run Notepad
return
;=====================Win Function Key======================
;-----------------------------------o       Virtual machine
#v::
Run "%virtualMachineManager%"
return
;-----------------------------------o       Task Manager
#t::
Run "%processExplorer%"
return


;-----------------------------------o       open desktop folder
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
;==================Debug Helper==============================
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
