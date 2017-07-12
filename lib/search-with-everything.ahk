
CapsLock & f:: 
{
    if WinActive("ahk_class CabinetWClass") {
        folder := GetFolder()
        if GetKeyState("shift") = 0 { 
            run, %comspec% /k ""%everythingPath%" -path "%folder%""
        } else {
            run, %comspec% /k ""%everythingPath%" -path "%folder%" -newwindow"
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


