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
#f::
if WinActive("ahk_class CabinetWClass") { ; Windows Explorer
    ControlFocus, DirectUIHWND3, A
    SendInput, {Space}
    return
}
;-----------------------------------o       Goto Navigation pane
#n::
if WinActive("ahk_class CabinetWClass") { ; Windows Explorer
    ControlFocus, SysTreeView321, A
    SendInput, {Space}
    return
}
;-----------------------------------o copy file full path to clipboard
Capslock & \::
if WinActive("ahk_class CabinetWClass") {
    SendInput, ^c
    Sleep 100
    Clipboard := Clipboard
    return
}
;=====================================================================
;                        Frequently Used Programs
;---------------------------------------------------------------------
CapsLock & c::                                ;VSCode
{
    if WinActive("ahk_class CabinetWClass") {
        folder := GetFolder()
        ShellRun(code,folder,A_WorkingDir)
    } 
    else {
        ShellRun(code,,A_WorkingDir)
    }
    return
}

CapsLock & e::                                ;Editor
selectedFilePath := Explorer_GetSelection()
Run "%editor%" "%selectedFilePath%"
return

CapsLock & t::                                ; terminal
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

