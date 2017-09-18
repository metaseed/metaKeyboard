;VimLikeArrows = 0

SetCapsLockState, AlwaysOff
#include %A_LineFile%\..\remote-desktop.ahk.
; diable the NumLock so as to only use the number pad for numbers
SetNumlockState, AlwaysOn

;-----------------------------------o
CapsLock & `::                                  ;CapsLock + ` | {CapsLock}
GetKeyState, CapsLockState, CapsLock, T
if CapsLockState = D
    SetCapsLockState, AlwaysOff
else
    SetCapsLockState, AlwaysOn
KeyWait, ``
return
;-----------------------------------o
CapsLock:: Send, { ESC }           ;ESC
;-----------------------------------o

;========== Directional Keys==============
CapsLock & h::keyWithCtrlAltShift("Left","h")       ;Left
;-----------------------------------o
CapsLock & j::keyWithCtrlAltShift("Down","j")       ;Down
;-----------------------------------o
CapsLock & k::keyWithCtrlAltShift("Up","k")         ;Up
;-----------------------------------o
CapsLock & l::keyWithCtrlAltShift("Right","l")      ;Right
;-----------------------------------o
CapsLock & i::keyWithCtrlAltShift("Home","i")       ;Home
;-----------------------------------o
CapsLock & o::keyWithCtrlAltShift("End","o")        ;End
;-----------------------------------o
;CapsLock & j::keyWithCtrlAltShift("Left")      ;Left
;-----------------------------------o
;CapsLock & k::keyWithCtrlAltShift("Down")      ;Down
;-----------------------------------o
;CapsLock & i::keyWithCtrlAltShift("Up")        ;Up
;-----------------------------------o
;CapsLock & l::keyWithCtrlAltShift("Right")     ;Right
;-----------------------------------o
;CapsLock & ,::keyWithCtrlAltShift("Home")      ;Home
;-----------------------------------o
;;CapsLock & .::keyWithCtrlAltShift("End")      ;End
;-----------------------------------o
CapsLock & u::keyWithCtrlAltShift("PgUp","u")       ;PageUp
;-----------------------------------o
CapsLock & n::keyWithCtrlAltShift("PgDn","n")       ;PageDown
;-----------------------------------o
;*!i::keyWithCtrlAltShift("Up")                 ;Alt + Arrow
;*!j::keyWithCtrlAltShift("Left")
;*!l::keyWithCtrlAltShift("Right")
;*!k::keyWithCtrlAltShift("Down")

*!k::keyWithCtrlAltShift("Up","k")                  ;Alt + Arrow
*!h::keyWithCtrlAltShift("Left","h")
*!l::keyWithCtrlAltShift("Right","l")
*!j::keyWithCtrlAltShift("Down","j")
;-----------------------------------o
*!u::keyWithCtrlAltShift("PgUp","u")
*!n::keyWithCtrlAltShift("PgDn","n")
*!i::keyWithCtrlAltShift("Home","i")
*!o::keyWithCtrlAltShift("End","o")

;========== Function Keys=================
;-----------------------------------o
CapsLock & BackSpace:: keyWithCtrlAltShift("Del","BackSpace")       ;Del
Capslock & p:: keyWithCtrlAltShift("PrintScreen","p")           ;PrintScreen
CapsLock & b:: keyWithCtrlAltShift("Pause","b")             ;Pause/Break
;-----------------------------------o
CapsLock & `;:: Send, { AppsKey }    ;Context Menu
;-----------------------------------o
CapsLock & ]:: Send, { Click Right }            ;Click Right
;-----------------------------------o
CapsLock & [:: Send, { Click Left }             ;Click Left
;-----------------------------------o
CapsLock & 1:: keyWithCtrlAltShift("F1","1")        ;F1 - F12
CapsLock & 2:: keyWithCtrlAltShift("F2","2")
CapsLock & 3:: keyWithCtrlAltShift("F3","3")
CapsLock & 4:: keyWithCtrlAltShift("F4","4")
CapsLock & 5:: keyWithCtrlAltShift("F5","5")
CapsLock & 6:: keyWithCtrlAltShift("F6","6")
CapsLock & 7:: keyWithCtrlAltShift("F7","7")
CapsLock & 8:: keyWithCtrlAltShift("F8","8")
CapsLock & 9:: keyWithCtrlAltShift("F9","9")
CapsLock & 0:: keyWithCtrlAltShift("F10","0")
Capslock & -:: keyWithCtrlAltShift("F11","-")
Capslock & =:: keyWithCtrlAltShift("F12","=")
