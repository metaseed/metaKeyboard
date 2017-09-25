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

;-----------------------------------o       Virtual machine
#v::
Run "%virtualMachineManager%"
return

;-----------------------------------o       Goto Navigation pane
#d::
Run, %A_Desktop%
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
RefreshEnvironment()
Send, ^s ; To save a changed script
Sleep, 300 ; give it time to save the script
Reload
Return

#!^c::
TrayTip, AutoHotKey, Exited, 1
Sleep 1000
ExitApp
return

#include %A_LineFile%\..\create-new-file.ahk.