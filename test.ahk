#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


SetCapsLockState, AlwaysOff
;-----------------------------------o
CapsLock & `::                                  ;CapsLock + ` | {CapsLock}
GetKeyState, CapsLockState, CapsLock, T
if CapsLockState = D
    SetCapsLockState, AlwaysOff
else
    SetCapsLockState, AlwaysOn
KeyWait, ``
return
Hotkey, CapsLock, MyLabel,on
return

MyLabel:
MsgBox You pressed %A_ThisHotkey%.
return

F4::
Hotkey, CapsLock, Off 
return

GetFolder()
{
    WinGetClass,var,A
    If var in CabinetWClass,ExplorerWClass,Progman
    {
        IfEqual,var,Progman
            v := A_Desktop
        else
        {
            winGetText,Fullpath,A
            loop,parse,Fullpath,`r`n
            {
                IfInString,A_LoopField,:\
                {
                    StringGetPos,pos,A_Loopfield,:\,L
                    Stringtrimleft,v,A_loopfield,(pos - 1)
                    break
                }
            }
        }
    return, v
    }
}
CapsLock & s:: 
{
    if WinActive("ahk_class CabinetWClass") {
        folder := GetFolder()
        if GetKeyState("shift") = 0 { 
            run, "C:\Program Files (x86)\Everything\Everything.exe" -path "%folder%"
        } else {
            run, "C:\Program Files (x86)\Everything\Everything.exe" -path "%folder%" -newwindow
        }
    } else {
        if GetKeyState("shift") = 0 {   ;Search
            Send, +!s                               ;Toggle Everything
        } else {
            Send, ^+!s                              ;New Everything Window
        }
    }
}
return