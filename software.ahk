

CapsLock & m:: 
Input Key, L1 M
IfEqual Key, r
    Run, "%ruler%"
IfEqual Key, s
    if GetKeyState("alt") = 0
        Run SnippingTool.exe                    ;Sniping
    else
        Run "%gifTool%"
IfEqual Key, v
    if WinActive("ahk_class CabinetWClass")
        folder := GetFolder()
        Loop Files, %folder%\*.sln 
            Run,"%visualStudio%" %A_LoopFileFullPath%
return
