;=====================================================================
;								Function Keys
;---------------------------------------------------------------------
; After Alt-Tab, move mouse to center of newly activated window.
~!Tab::
KeyWait, Alt
KeyWait, Tab
moveMouseToWindowCenter()
return
;-----------------------------------o
CapsLock & /:: Send ^/						;Toggle Line Comment
;-----------------------------------o
CapsLock & \:: Send +!a						;Toggle Block Comment
;-----------------------------------o

;=====================================================================
;						Frequently Used Programs
;---------------------------------------------------------------------
CapsLock & c::								;VSCode
Run "C:\Program Files (x86)\Microsoft VS Code\Code.exe"
return
;-----------------------------------o
CapsLock & d:: Send, ^+!d 					;Dictionary
;-----------------------------------o
CapsLock & w::								;Web Search
if GetKeyState("alt") = 0 {
    Run http://www.google.com/
} else {
	Run http://global.bing.com/?FORM=HPCNEN&setmkt=en-us&setlang=en-us
}
return
;-----------------------------------o
CapsLock & r:: Run Powershell				;Run Shell
;-----------------------------------o
CapsLock & s:: Send, ^+!s					;Search With Everything
;-----------------------------------o
CapsLock & t::								;Text Process App
IfWinExist Untitled - Notepad 
	IfWinActive Untitled - Notepad
		WinMinimize
	else
		WinActivate
else 
	Run Notepad
return
;-----------------------------------o
CapsLock & p::								;Print/Record Screen
 	Run SnippingTool.exe
return
;-----------------------------------o
CapsLock & m::								;Print/Record Screen
 	Run G:\Software\ProcessExplorer\procexp64.exe
return
