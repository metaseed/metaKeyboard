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
CapsLock & ':: keyWithCtrlAltShift("Del")	;Del
;-----------------------------------o
CapsLock & `;:: Send, { AppsKey } 			;Context Menu
;-----------------------------------o
CapsLock & ]:: Send, { Click Right }		;Click Right
;-----------------------------------o
CapsLock & [:: Send, { Click Left }		    ;Click Left
;-----------------------------------o
CapsLock & 1:: keyWithCtrlAltShift("F1")	;F1 - F12
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
;-----------------------------------o
*!i::keyWithCtrlAltShift("Up")				;Alt + Arrow
*!j::keyWithCtrlAltShift("Left")
*!l::keyWithCtrlAltShift("Right")
*!k::keyWithCtrlAltShift("Down")
;-----------------------------------o
*!u::keyWithCtrlAltShift("PgUp")
*!o::keyWithCtrlAltShift("PgDn")
*!h::keyWithCtrlAltShift("Home")
*!e::keyWithCtrlAltShift("End")
