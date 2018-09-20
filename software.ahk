
;=====================================================================
;                        Frequently Used Softwares
;---------------------------------------------------------------------
CapsLock & c::                                ;VSCode
{
    if WinActive("ahk_class CabinetWClass") {
        selectedFilePath := Explorer_GetSelection()
        ShellRun(code,selectedFilePath,A_WorkingDir)
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
        run "%cmd%" /start %folder%
    } else {
        ; not work run "%cmd%" /single "%folder%" -cur_console:d:%folder%
        run "%cmd%" /start %folder%
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
if GetKeyState("shift") != 0 {
    ShellRun(searchEngineSecondary)
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

CapsLock & m:: 
Input Key, L1 M
If Key = r
{
    Run, "%ruler%"                              ;screen ruler
    return
}
else if Key= s
{
    if GetKeyState("alt") = 0
        Run "%snippingTool%"                    ;Sniping
    else
        Run "%gifTool%"                         ;screen to gif
    return
}
else if Key = v                                  ;visualStudio
{
    if WinActive("ahk_class CabinetWClass")
        folder := GetFolder()
        Loop Files, %folder%\*.sln 
            Run,"%visualStudio%" %A_LoopFileFullPath%, %folder%
    return
}
else if Key = t
{
    Run "%processExplorer%"                     ;Task Manager
    return
}
return