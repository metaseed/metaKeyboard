
CapsLock & f:: 
{
    if WinActive("ahk_class CabinetWClass") {
        folder := GetFolder()
        if GetKeyState("shift") = 0 { 
            run "%everythingPath%" -path "%folder%"
        } else {
            run "%everythingPath%" -path "%folder%" -newwindow
        }
    } else {
        ;MsgBox "%everythingPath%"
        if GetKeyState("shift") = 0 {   ;Search
            run "%everythingPath%" -toggle-window
            ; Send, +!f                               ;Toggle Everything
        } else {
            run "%everythingPath%" -newwindow
            ; Send, ^+!f                              ;New Everything Window
        }
    }
    return
}

#IfWinActive ahk_class CabinetWClass ; Windows Explorer
    *^f::
    *f3::
    CapsLock & 3::
        folder := GetFolder()
        if GetKeyState("shift") = 0 { 
            run "%everythingPath%" -path "%folder%"
        } else {
            run "%everythingPath%" -path "%folder%" -newwindow
        }
        return
#IfWinActive
