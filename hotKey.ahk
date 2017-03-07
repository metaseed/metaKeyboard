#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;=====================================================================
;                   Metasong's AHK Script
;                      CapsLock Enhancement
;---------------------------------------------------------------------
;                    Modified by Colin Tang
;---------------------------------------------------------------------
;Description:
;    This Script is wrote by Metasong via AutoHotKey Script. It
; Provides an enhancement towards the "Useless Key" CapsLock, and
; turns CapsLock into an useful function Key just like Ctrl and Alt
; by combining CapsLock with almost all other keys in the keyboard.
;
;Summary:
;o----------------------o---------------------------------------------
;|CapsLock;             | {ESC}
;|CaspLock + `          | {CapsLock}CapsLock Switcher as a Substituent
;|CapsLock + ikjl       | Cursor Mover
;|CaspLock + hnuo       | Convenient Home/End PageUp/PageDn
;|CaspLock + nm,.       | Convenient Delete Controller
;|CapsLock + zxcvay     | Windows-Style Editor
;|CapsLock + Direction  | Mouse Move
;|CapsLock + Enter      | Mouse Click
;|CaspLock + {F1}~{F6}  | Media Volume Controller
;|CapsLock + qs         | Windows & Tags Control
;|CapsLock + ;'[]       | Convenient Key Mapping
;|CaspLock + dfert      | Frequently Used Programs (Self Defined)
;|CaspLock + 123456     | Dev-Hotkey for Visual Studio (Self Defined)
;|CapsLock + 67890-=    | Shifter as Shift
;-----------------------o---------------------------------------------
;|Use it whatever and wherever you like. Hope it helps!
;=====================================================================
;=====================================================================
;                       CapsLock Initializer
;---------------------------------------------------------------------
SetCapsLockState, AlwaysOff
;---------------------------------------------------------------------
;=====================================================================
;                       CapsLock Switcher:
;---------------------------------o-----------------------------------
;                    CapsLock + ` | {CapsLock}
;---------------------------------o-----------------------------------
CapsLock & `::
GetKeyState, CapsLockState, CapsLock, T
if CapsLockState = D
    SetCapsLockState, AlwaysOff
else
    SetCapsLockState, AlwaysOn
KeyWait, ``
return

Capslock & w::AltTab
Capslock & Escape::ShiftAltTab

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
;---------------------------------------------------------------------
CapsLock::Send, {ESC}						;ESC
;---------------------------------------------------------------------
CapsLock & j::keyWithCtrlAltShift("Left")	;Left
;-----------------------------------o
CapsLock & k::keyWithCtrlAltShift("Down")	;Down
;-----------------------------------o
CapsLock & i::keyWithCtrlAltShift("Up")		;Up
;-----------------------------------o
CapsLock & l::keyWithCtrlAltShift("Right")	;Right
;---------------------------------------------------------------------
CapsLock & h::keyWithCtrlAltShift("Home")	;Home
;-----------------------------------o
CapsLock & n::keyWithCtrlAltShift("End") 	;End
;---------------------------------------------------------------------
CapsLock & u::keyWithCtrlAltShift("PgUp") 	;PageUp
;-----------------------------------o
CapsLock & o::keyWithCtrlAltShift("PgDn") 	;PageDown
;---------------------------------------------------------------------

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
;---------------------------------------------------------------------
CapsLock & `;:: keyWithCtrlAltShift("Del")	;Del
;-----------------------------------o
CapsLock & ':: Send, {AppsKey down}			;Context Menu
;-----------------------------------o
CapsLock & p:: Click Right					;Mouse Right Click
;-----------------------------------o
CapsLock & [:: Send, ^-
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
CapsLock & 2:: keyWithCtrlAltShift("F4")
CapsLock & 3:: keyWithCtrlAltShift("F4")
CapsLock & 4:: keyWithCtrlAltShift("F4")
CapsLock & 5:: keyWithCtrlAltShift("F5")
CapsLock & 6:: keyWithCtrlAltShift("F6")
CapsLock & 7:: keyWithCtrlAltShift("F7")
CapsLock & 8:: keyWithCtrlAltShift("F8")
CapsLock & 9:: keyWithCtrlAltShift("F9")
CapsLock & 0:: keyWithCtrlAltShift("F10")
Capslock & -::
>!-::keyWithCtrlAltShift("F11")
Capslock & =::
>!=::keyWithCtrlAltShift("F12")
;-----------------------------------o		;RAlt + Arrow
>!i::keyWithCtrlAltShift("Up")
>!j::keyWithCtrlAltShift("Left")
>!l::keyWithCtrlAltShift("Right")
>!k::keyWithCtrlAltShift("Down")
