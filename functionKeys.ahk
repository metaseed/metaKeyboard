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
CapsLock & /:: Send ^/                        ;Toggle Line Comment
;-----------------------------------o
CapsLock & \:: Send +!a                       ;Toggle Block Comment
;-----------------------------------o

;=====================================================================
;                        Frequently Used Programs
;---------------------------------------------------------------------
CapsLock & c::                                ;VSCode
Run "C:\Program Files (x86)\Microsoft VS Code\Code.exe"
return
;-----------------------------------o
CapsLock & d:: Send, ^+!d                     ;Dictionary
;-----------------------------------o    Web Search
CapsLock & w::
if GetKeyState("alt") = 0 {
    Run http://www.google.com/
} else {
    Run http://global.bing.com/?FORM=HPCNEN&setmkt=en-us&setlang=en-us
}
return
;-----------------------------------o
CapsLock & r:: Run Powershell                ;Run Shell
;-----------------------------------o
CapsLock & s::
if GetKeyState("shift") = 0 {   ;Search
    Send, !+s                               ;Toggle Everything
} else {
    Send, ^+!s                              ;New Everything Window
}
return
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
    Run "M:\Software\_SoftwareGreen\ScreenToGif\ScreenToGif.exe"
} 
return
;-----------------------------------o

;=====================Win Function Key======================
;-----------------------------------o       Virtual machine
#v::
Run "C:\Users\jsong12\Desktop\RarelyUsed\Hyper-V Manager.lnk"
return
;-----------------------------------o       Task Manager
#t::
Run m:\Software\ProcessExplorer\procexp64.exe
return
;-----------------------------------o       Goto files pane
#f::
Send, ^f
Send, `t
Send, `t
return
;-----------------------------------o       Goto Navigation pane
#n::
Send, ^f
Send, `t
return
;-----------------------------------o       Goto Navigation pane
#d::
Run, "C:\Users\jsong12\Desktop"
return
