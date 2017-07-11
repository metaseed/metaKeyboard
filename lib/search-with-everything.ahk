;specify the path here
EverythingPath :=  "C:\Program Files (x86)\Everything\Everything.exe"

CapsLock & f:: 
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


