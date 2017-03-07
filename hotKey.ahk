#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;=====================================================================
;                   		Metasong's AHK Script
;---------------------------------------------------------------------
;Description:
;    This Script is wrote by Metasong via AutoHotKey Script. It
; Provides an enhancement towards the "Useless Key" CapsLock, and
; turns CapsLock into an useful function Key just like Ctrl and Alt
; by combining CapsLock with almost other keys in the keyboard.
;
;---------------------------------------------------------------------
; Use it whatever and wherever you like. Hope it helps!
;=====================================================================
; 								Functions
;---------------------------------------------------------------------
keyWithCtrlAltShift(key){
	if GetKeyState("control") = 0 {
		if GetKeyState("alt") = 0 {
			if GetKeyState("shift") = 0 {
				if GetKeyState("LWin") = 0 {
					Send, { %key% }
				}else {
					Send, #{ %key% }
				}
			} else {
				if GetKeyState("LWin") = 0 {
					Send, +{ %key% }
				}else {
					Send, +#{ %key% }
				}
			}
		} else {
			if GetKeyState("shift") = 0 {
				if GetKeyState("LWin") = 0 {
					;IfWinExist ahk_class #32771
					Send, {Alt down}{ %key% }
					;Send, !{ %key% }
				}else {
					Send, !#{ %key% }
				}
			} else {
				if GetKeyState("LWin") = 0 {
					Send, !+{ %key% }
				}else {
					Send, !+#{ %key% }
				}
			}
		}
	} else {
		if GetKeyState("alt") = 0 {
			if GetKeyState("shift") = 0 {
				if GetKeyState("LWin") = 0 {
					Send, ^{ %key% }
				}else {
					Send, ^#{ %key% }
				}
			} else {
				if GetKeyState("LWin") = 0 {
					Send, ^+{ %key% }
				}else {
					Send, ^+#{ %key% }
				}
			}
		} else {
		if GetKeyState("shift") = 0 {
				if GetKeyState("LWin") = 0 {
					Send, ^!{ %key% }
				}else {
					Send, ^!#{ %key% }
				}
			} else {
				if GetKeyState("LWin") = 0 {
					Send, ^!+{ %key% }
				}else {
					Send, ^!+#{ %key% }
				}
			}
		}
	}
}
;=====================================================================
;								Function Keys
;---------------------------------------------------------------------
SetCapsLockState, AlwaysOff
;-----------------------------------o
CapsLock & `::								;CapsLock + ` | {CapsLock}
GetKeyState, CapsLockState, CapsLock, T
if CapsLockState = D
    SetCapsLockState, AlwaysOff
else
    SetCapsLockState, AlwaysOn
KeyWait, ``
return
;-----------------------------------o
;Capslock & w::AltTab
;Capslock & Escape::ShiftAltTab
;-----------------------------------o
CapsLock::Send, {ESC}						;ESC
;-----------------------------------o
CapsLock & j::keyWithCtrlAltShift("Left")	;Left
;-----------------------------------o
CapsLock & k::keyWithCtrlAltShift("Down")	;Down
;-----------------------------------o
CapsLock & i::keyWithCtrlAltShift("Up")		;Up
;-----------------------------------o
CapsLock & l::keyWithCtrlAltShift("Right")	;Right
;-----------------------------------o
CapsLock & h::keyWithCtrlAltShift("Home")	;Home
;-----------------------------------o
CapsLock & n::keyWithCtrlAltShift("End") 	;End
;-----------------------------------o
CapsLock & u::keyWithCtrlAltShift("PgUp") 	;PageUp
;-----------------------------------o
CapsLock & o::keyWithCtrlAltShift("PgDn") 	;PageDown
;-----------------------------------o
CapsLock & `;:: keyWithCtrlAltShift("Del")	;Del
;-----------------------------------o
CapsLock & ':: Send, {AppsKey down}			;Context Menu
;-----------------------------------o
CapsLock & p:: Click Right					;Mouse Right Click
;-----------------------------------o
CapsLock & /::								;Comment
Send, ^k
Send, ^c
return
;-----------------------------------o
CapsLock & \::								;Uncomment
Send, ^k
Send, ^u
return
;-----------------------------------o		;F1 - F12
CapsLock & 1:: keyWithCtrlAltShift("F1")
CapsLock & 2:: keyWithCtrlAltShift("F2")
CapsLock & 3:: keyWithCtrlAltShift("F3")
CapsLock & 4:: keyWithCtrlAltShift("F4")
CapsLock & 5:: keyWithCtrlAltShift("F5")
CapsLock & 6:: keyWithCtrlAltShift("F6")
CapsLock & 7:: keyWithCtrlAltShift("F7")
CapsLock & 8:: keyWithCtrlAltShift("F8")
CapsLock & 9:: keyWithCtrlAltShift("F9")
CapsLock & 0:: keyWithCtrlAltShift("F10")
Capslock & -:: keyWithCtrlAltShift("F11")
Capslock & =:: keyWithCtrlAltShift("F12")
;-----------------------------------o		;Alt + Arrow
*!i::keyWithCtrlAltShift("Up")
*!j::keyWithCtrlAltShift("Left")
*!l::keyWithCtrlAltShift("Right")
*!k::keyWithCtrlAltShift("Down")
;=====================================================================
;						Frequently Used Programs
;---------------------------------------------------------------------
CapsLock & c::								;VSCode
Run "C:\Program Files (x86)\Microsoft VS Code\Code.exe"
return
;-----------------------------------o
CapsLock & d:: Send, ^+!d 					;Dictionary
;-----------------------------------o
CapsLock & e::								;Web Search
if GetKeyState("alt") = 0 {
    Run http://www.google.com/
} else {
	Run http://global.bing.com/?FORM=HPCNEN&setmkt=en-us&setlang=en-us
}
return
;-----------------------------------o
CapsLock & r:: Run Powershell				;Shell
;-----------------------------------o
CapsLock & s:: Send, ^+!s					;Search With Everything
;-----------------------------------o
CapsLock & t::								;Notepad
 	Run notepad.exe
return
