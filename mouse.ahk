/*
o------------------------------------------------------------o
|Using Keyboard Numpad as a Mouse                            |
(------------------------------------------------------------)
| By deguix/modified by metasog       for AutoHotkey 1.0.22+ |
|                    ----------------------------------------|
|                                                            |
|    This script is an example of use of AutoHotkey. It uses |
| the remapping of numpad keys of a keyboard to transform it |
| into a mouse. Some features are the acceleration which     |
| enables you to increase the mouse movement when holding    |
| a key for a long time, and the rotation which makes the    |
| numpad mouse to "turn". I.e. k as i        |
| and vice-versa. See the list of keys used below:           |
|                                                            |
|------------------------------------------------------------|
| Keys                  | Description                        |
|------------------------------------------------------------|
| Tab (toggle on)       | Activates numpad mouse mode.       |
|-----------------------|------------------------------------|
| h                     | Left mouse button click.           |
| ,                     | Middle mouse button click.         |
| ;                     | Right mouse button click.          |
| p//                   | X1/X2 mouse button click. (Win 2k+)|
| y/n                   | Moves up/down the mouse wheel.     |
|                       |                                    |
|-----------------------|------------------------------------|
|-----------------------|------------------------------------|
| u/i/o/                | Mouse movement.                    |
| j/k/l/                |                                    |
| m/</>                 |                                    |
|                       |                                    |
|-----------------------|------------------------------------|
|-----------------------|------------------------------------|
| w/x                   | Inc./dec. acceleration per         |
|                       | button press.                      |
| e/c                   | Inc./dec. initial speed per        |
|                       | button press.                      |
| r/v                   | Inc./dec. maximum speed per        |
|                       | button press.                      |
| !w/!x                 | Inc./dec. wheel acceleration per   |
|                       | button press*.                     |
| !e/!c                 | Inc./dec. wheel initial speed per  |
|                       | button press*.                     |
| !r/!v                 | Inc./dec. wheel maximum speed per  |
|                       | button press*.                     |
| s/f                   | Inc./dec. rotation angle to        |
|                       | right in degrees. (i.e. 180° =     |
|                       | = inversed controls).              |
|------------------------------------------------------------|
| * = These options are affected by the mouse wheel speed    |
| adjusted on Control Panel. If you don't have a mouse with  |
| wheel, the default is 3 +/- lines per option button press. |
o------------------------------------------------------------o
*/

;START OF CONFIG SECTION

#SingleInstance force
#MaxHotkeysPerInterval 500

; Using the keyboard hook to implement the Numpad hotkeys prevents
; them from interfering with the generation of ANSI characters such
; as à.  This is because AutoHotkey generates such characters
; by holding down ALT and sending a series of Numpad keystrokes.
; Hook hotkeys are smart enough to ignore such keystrokes.
#UseHook

MouseSpeed = 3
MouseAccelerationSpeed = 8
MouseMaxSpeed = 30

;Mouse wheel speed is also set on Control Panel. As that
;will affect the normal mouse behavior, the real speed of
;these three below are times the normal mouse wheel speed.
MouseWheelSpeed = 1
MouseWheelAccelerationSpeed = 1
MouseWheelMaxSpeed = 5

MouseRotationAngle = 0

;END OF CONFIG SECTION

;This is needed or key presses would faulty send their natural
;actions. Like p would send sometimes "/" to the
;screen.
#InstallKeybdHook

Temp = 0
Temp2 = 0

MouseRotationAnglePart = %MouseRotationAngle%
;Divide by 45º because MouseMove only supports whole numbers,
;and changing the mouse rotation to a number lesser than 45º
;could make strange movements.
;
;For example: 22.5º when pressing i:
;  First it would move upwards until the speed
;  to the side reaches 1.
MouseRotationAnglePart /= 45

MouseCurrentAccelerationSpeed = 0
MouseCurrentSpeed = %MouseSpeed%

MouseWheelCurrentAccelerationSpeed = 0
MouseWheelCurrentSpeed = %MouseSpeed%

SetKeyDelay, -1
SetMouseDelay, -1

Hotkey, *h, ButtonLeftClick
Hotkey, *a, ButtonLeftClickIns
Hotkey, *`,, ButtonMiddleClick
Hotkey, *b, ButtonMiddleClickClear
Hotkey, *;, ButtonRightClick
Hotkey, *g, ButtonRightClickDel
Hotkey, *p, ButtonX1Click
Hotkey, */, ButtonX2Click

Hotkey, *y, ButtonWheelUp
Hotkey, *n, ButtonWheelDown

Hotkey, *i, ButtonUp
Hotkey, *k, ButtonDown
Hotkey, *j, ButtonLeft
Hotkey, *l, ButtonRight
Hotkey, *u, ButtonUpLeft
Hotkey, *m, ButtonUpRight
Hotkey, *o, ButtonDownLeft
Hotkey, *., ButtonDownRight

Hotkey, e, ButtonSpeedUp
Hotkey, c, ButtonSpeedDown
Hotkey, w, ButtonAccelerationSpeedUp
Hotkey, x, ButtonAccelerationSpeedDown
Hotkey, r, ButtonMaxSpeedUp
Hotkey, v, ButtonMaxSpeedDown

Hotkey, f, ButtonRotationAngleUp
Hotkey, s, ButtonRotationAngleDown

Hotkey, !e, ButtonWheelSpeedUp
Hotkey, !c, ButtonWheelSpeedDown
Hotkey, !w, ButtonWheelAccelerationSpeedUp
Hotkey, !x, ButtonWheelAccelerationSpeedDown
Hotkey, !r, ButtonWheelMaxSpeedUp
Hotkey, !v, ButtonWheelMaxSpeedDown
ScrollLockState = 0
Gosub, CapsLock & Tab  ; Initialize based on current Tab state.
return

;Key activation support

CapsLock & Tab::
; Wait for it to be released because otherwise the hook state ;gets reset
; while the key is down, which causes the up-event to get suppressed,
; which in turn prevents toggling of the Tab state/light:
;KeyWait, Tab
;GetKeyState, ScrollLockState, Tab, T

If ScrollLockState = 1
{
    ScrollLockState = 0
    Hotkey, *h, on
    Hotkey, *a, on
    Hotkey, *`,, on
    Hotkey, *b, on
    Hotkey, *;, on
    Hotkey, *g, on
    Hotkey, *p, on
    Hotkey, */, on

    Hotkey, *y, on
    Hotkey, *n, on

    Hotkey, *i, on
    Hotkey, *k, on
    Hotkey, *j, on
    Hotkey, *l, on
    Hotkey, *u, on
    Hotkey, *m, on
    Hotkey, *o, on
    Hotkey, *., on

    Hotkey, e, on
    Hotkey, c, on
    Hotkey, w, on
    Hotkey, x, on
    Hotkey, r, on
    Hotkey, v, on

    Hotkey, f, on
    Hotkey, s, on

    Hotkey, !e, on
    Hotkey, !c, on
    Hotkey, !w, on
    Hotkey, !x, on
    Hotkey, !r, on
    Hotkey, !v, on
}
else
{
    ScrollLockState = 1
    Hotkey, *h, off
    Hotkey, *a, off
    Hotkey, *`,, off
    Hotkey, *b, off
    Hotkey, *;, off
    Hotkey, *g, off
    Hotkey, *p, off
    Hotkey, */, off

    Hotkey, *y, off
    Hotkey, *n, off

    Hotkey, *i, off
    Hotkey, *k, off
    Hotkey, *j, off
    Hotkey, *l, off
    Hotkey, *u, off
    Hotkey, *m, off
    Hotkey, *o, off
    Hotkey, *., off

    Hotkey, e, off
    Hotkey, c, off
    Hotkey, w, off
    Hotkey, x, off
    Hotkey, r, off
    Hotkey, v, off

    Hotkey, f, off
    Hotkey, s, off

    Hotkey, !e, off
    Hotkey, !c, off
    Hotkey, !w, off
    Hotkey, !x, off
    Hotkey, !r, off
    Hotkey, !v, off
}
return

;Mouse click support

ButtonLeftClick:
GetKeyState, already_down_state, LButton
If already_down_state = D
    return
Button2 = h
ButtonClick = Left
Goto ButtonClickStart
ButtonLeftClickIns:
GetKeyState, already_down_state, LButton
If already_down_state = D
    return
Button2 = a
ButtonClick = Left
Goto ButtonClickStart

ButtonMiddleClick:
GetKeyState, already_down_state, MButton
If already_down_state = D
    return
Button2 = `,
ButtonClick = Middle
Goto ButtonClickStart
ButtonMiddleClickClear:
GetKeyState, already_down_state, MButton
If already_down_state = D
    return
Button2 = NumPadClear
ButtonClick = Middle
Goto ButtonClickStart

ButtonRightClick:
GetKeyState, already_down_state, RButton
If already_down_state = D
    return
Button2 = ;
ButtonClick = Right
Goto ButtonClickStart
ButtonRightClickDel:
GetKeyState, already_down_state, RButton
If already_down_state = D
    return
Button2 = g
ButtonClick = Right
Goto ButtonClickStart

ButtonX1Click:
GetKeyState, already_down_state, XButton1
If already_down_state = D
    return
Button2 = p
ButtonClick = X1
Goto ButtonClickStart

ButtonX2Click:
GetKeyState, already_down_state, XButton2
If already_down_state = D
    return
Button2 = /
ButtonClick = X2
Goto ButtonClickStart

ButtonClickStart:
MouseClick, %ButtonClick%,,, 1, 0, D
SetTimer, ButtonClickEnd, 10
return

ButtonClickEnd:
GetKeyState, kclickstate, %Button2%, P
if kclickstate = D
    return

SetTimer, ButtonClickEnd, off
MouseClick, %ButtonClick%,,, 1, 0, U
return

;Mouse movement support

ButtonSpeedUp:
MouseSpeed++
ToolTip, Mouse speed: %MouseSpeed% pixels
SetTimer, RemoveToolTip, 1000
return
ButtonSpeedDown:
If MouseSpeed > 1
    MouseSpeed--
If MouseSpeed = 1
    ToolTip, Mouse speed: %MouseSpeed% pixel
else
    ToolTip, Mouse speed: %MouseSpeed% pixels
SetTimer, RemoveToolTip, 1000
return
ButtonAccelerationSpeedUp:
MouseAccelerationSpeed++
ToolTip, Mouse acceleration speed: %MouseAccelerationSpeed% pixels
SetTimer, RemoveToolTip, 1000
return
ButtonAccelerationSpeedDown:
If MouseAccelerationSpeed > 1
    MouseAccelerationSpeed--
If MouseAccelerationSpeed = 1
    ToolTip, Mouse acceleration speed: %MouseAccelerationSpeed% pixel
else
    ToolTip, Mouse acceleration speed: %MouseAccelerationSpeed% pixels
SetTimer, RemoveToolTip, 1000
return

ButtonMaxSpeedUp:
MouseMaxSpeed++
ToolTip, Mouse maximum speed: %MouseMaxSpeed% pixels
SetTimer, RemoveToolTip, 1000
return
ButtonMaxSpeedDown:
If MouseMaxSpeed > 1
    MouseMaxSpeed--
If MouseMaxSpeed = 1
    ToolTip, Mouse maximum speed: %MouseMaxSpeed% pixel
else
    ToolTip, Mouse maximum speed: %MouseMaxSpeed% pixels
SetTimer, RemoveToolTip, 1000
return

ButtonRotationAngleUp:
MouseRotationAnglePart++
If MouseRotationAnglePart >= 8
    MouseRotationAnglePart = 0
MouseRotationAngle = %MouseRotationAnglePart%
MouseRotationAngle *= 45
ToolTip, Mouse rotation angle: %MouseRotationAngle%°
SetTimer, RemoveToolTip, 1000
return
ButtonRotationAngleDown:
MouseRotationAnglePart--
If MouseRotationAnglePart < 0
    MouseRotationAnglePart = 7
MouseRotationAngle = %MouseRotationAnglePart%
MouseRotationAngle *= 45
ToolTip, Mouse rotation angle: %MouseRotationAngle%°
SetTimer, RemoveToolTip, 1000
return

ButtonUp:
ButtonDown:
ButtonLeft:
ButtonRight:
ButtonUpLeft:
ButtonUpRight:
ButtonDownLeft:
ButtonDownRight:
If Button <> 0
{
    IfNotInString, A_ThisHotkey, %Button%
    {
        MouseCurrentAccelerationSpeed = 0
        MouseCurrentSpeed = %MouseSpeed%
    }
}
StringReplace, Button, A_ThisHotkey, *

ButtonAccelerationStart:
If MouseAccelerationSpeed >= 1
{
    If MouseMaxSpeed > %MouseCurrentSpeed%
    {
        Temp = 0.001
        Temp *= %MouseAccelerationSpeed%
        MouseCurrentAccelerationSpeed += %Temp%
        MouseCurrentSpeed += %MouseCurrentAccelerationSpeed%
    }
}

;MouseRotationAngle convertion to speed of button direction
{
    MouseCurrentSpeedToDirection = %MouseRotationAngle%
    MouseCurrentSpeedToDirection /= 90.0
    Temp = %MouseCurrentSpeedToDirection%

    if Temp >= 0
    {
        if Temp < 1
        {
            MouseCurrentSpeedToDirection = 1
            MouseCurrentSpeedToDirection -= %Temp%
            Goto EndMouseCurrentSpeedToDirectionCalculation
        }
    }
    if Temp >= 1
    {
        if Temp < 2
        {
            MouseCurrentSpeedToDirection = 0
            Temp -= 1
            MouseCurrentSpeedToDirection -= %Temp%
            Goto EndMouseCurrentSpeedToDirectionCalculation
        }
    }
    if Temp >= 2
    {
        if Temp < 3
        {
            MouseCurrentSpeedToDirection = -1
            Temp -= 2
            MouseCurrentSpeedToDirection += %Temp%
            Goto EndMouseCurrentSpeedToDirectionCalculation
        }
    }
    if Temp >= 3
    {
        if Temp < 4
        {
            MouseCurrentSpeedToDirection = 0
            Temp -= 3
            MouseCurrentSpeedToDirection += %Temp%
            Goto EndMouseCurrentSpeedToDirectionCalculation
        }
    }
}
EndMouseCurrentSpeedToDirectionCalculation:

;MouseRotationAngle convertion to speed of 90 degrees to right
{
    MouseCurrentSpeedToSide = %MouseRotationAngle%
    MouseCurrentSpeedToSide /= 90.0
    Temp = %MouseCurrentSpeedToSide%
    Transform, Temp, mod, %Temp%, 4

    if Temp >= 0
    {
        if Temp < 1
        {
            MouseCurrentSpeedToSide = 0
            MouseCurrentSpeedToSide += %Temp%
            Goto EndMouseCurrentSpeedToSideCalculation
        }
    }
    if Temp >= 1
    {
        if Temp < 2
        {
            MouseCurrentSpeedToSide = 1
            Temp -= 1
            MouseCurrentSpeedToSide -= %Temp%
            Goto EndMouseCurrentSpeedToSideCalculation
        }
    }
    if Temp >= 2
    {
        if Temp < 3
        {
            MouseCurrentSpeedToSide = 0
            Temp -= 2
            MouseCurrentSpeedToSide -= %Temp%
            Goto EndMouseCurrentSpeedToSideCalculation
        }
    }
    if Temp >= 3
    {
        if Temp < 4
        {
            MouseCurrentSpeedToSide = -1
            Temp -= 3
            MouseCurrentSpeedToSide += %Temp%
            Goto EndMouseCurrentSpeedToSideCalculation
        }
    }
}
EndMouseCurrentSpeedToSideCalculation:

MouseCurrentSpeedToDirection *= %MouseCurrentSpeed%
MouseCurrentSpeedToSide *= %MouseCurrentSpeed%

Temp = %MouseRotationAnglePart%
Transform, Temp, Mod, %Temp%, 2

If Button = i
{
    if Temp = 1
    {
        MouseCurrentSpeedToSide *= 2
        MouseCurrentSpeedToDirection *= 2
    }

    MouseCurrentSpeedToDirection *= -1
    MouseMove, %MouseCurrentSpeedToSide%, %MouseCurrentSpeedToDirection%, 0, R
}
else if Button = k
{
    if Temp = 1
    {
        MouseCurrentSpeedToSide *= 2
        MouseCurrentSpeedToDirection *= 2
    }

    MouseCurrentSpeedToSide *= -1
    MouseMove, %MouseCurrentSpeedToSide%, %MouseCurrentSpeedToDirection%, 0, R
}
else if Button = j
{
    if Temp = 1
    {
        MouseCurrentSpeedToSide *= 2
        MouseCurrentSpeedToDirection *= 2
    }

    MouseCurrentSpeedToSide *= -1
    MouseCurrentSpeedToDirection *= -1

    MouseMove, %MouseCurrentSpeedToDirection%, %MouseCurrentSpeedToSide%, 0, R
}
else if Button = l
{
    if Temp = 1
    {
        MouseCurrentSpeedToSide *= 2
        MouseCurrentSpeedToDirection *= 2
    }

    MouseMove, %MouseCurrentSpeedToDirection%, %MouseCurrentSpeedToSide%, 0, R
}
else if Button = u
{
    Temp = %MouseCurrentSpeedToDirection%
    Temp -= %MouseCurrentSpeedToSide%
    Temp *= -1
    Temp2 = %MouseCurrentSpeedToDirection%
    Temp2 += %MouseCurrentSpeedToSide%
    Temp2 *= -1
    MouseMove, %Temp%, %Temp2%, 0, R
}
else if Button = o
{
    Temp = %MouseCurrentSpeedToDirection%
    Temp += %MouseCurrentSpeedToSide%
    Temp2 = %MouseCurrentSpeedToDirection%
    Temp2 -= %MouseCurrentSpeedToSide%
    Temp2 *= -1
    MouseMove, %Temp%, %Temp2%, 0, R
}
else if Button = m
{
    Temp = %MouseCurrentSpeedToDirection%
    Temp += %MouseCurrentSpeedToSide%
    Temp *= -1
    Temp2 = %MouseCurrentSpeedToDirection%
    Temp2 -= %MouseCurrentSpeedToSide%
    MouseMove, %Temp%, %Temp2%, 0, R
}
else if Button = .
{
    Temp = %MouseCurrentSpeedToDirection%
    Temp -= %MouseCurrentSpeedToSide%
    Temp2 *= -1
    Temp2 = %MouseCurrentSpeedToDirection%
    Temp2 += %MouseCurrentSpeedToSide%
    MouseMove, %Temp%, %Temp2%, 0, R
}

SetTimer, ButtonAccelerationEnd, 10
return

ButtonAccelerationEnd:
GetKeyState, kstate, %Button%, P
if kstate = D
    Goto ButtonAccelerationStart

SetTimer, ButtonAccelerationEnd, off
MouseCurrentAccelerationSpeed = 0
MouseCurrentSpeed = %MouseSpeed%
Button = 0
return

;Mouse wheel movement support

ButtonWheelSpeedUp:
MouseWheelSpeed++
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
MouseWheelSpeedReal = %MouseWheelSpeed%
MouseWheelSpeedReal *= %MouseWheelSpeedMultiplier%
ToolTip, Mouse wheel speed: %MouseWheelSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return
ButtonWheelSpeedDown:
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
If MouseWheelSpeedReal > %MouseWheelSpeedMultiplier%
{
    MouseWheelSpeed--
    MouseWheelSpeedReal = %MouseWheelSpeed%
    MouseWheelSpeedReal *= %MouseWheelSpeedMultiplier%
}
If MouseWheelSpeedReal = 1
    ToolTip, Mouse wheel speed: %MouseWheelSpeedReal% line
else
    ToolTip, Mouse wheel speed: %MouseWheelSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return

ButtonWheelAccelerationSpeedUp:
MouseWheelAccelerationSpeed++
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
MouseWheelAccelerationSpeedReal = %MouseWheelAccelerationSpeed%
MouseWheelAccelerationSpeedReal *= %MouseWheelSpeedMultiplier%
ToolTip, Mouse wheel acceleration speed: %MouseWheelAccelerationSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return
ButtonWheelAccelerationSpeedDown:
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
If MouseWheelAccelerationSpeed > 1
{
    MouseWheelAccelerationSpeed--
    MouseWheelAccelerationSpeedReal = %MouseWheelAccelerationSpeed%
    MouseWheelAccelerationSpeedReal *= %MouseWheelSpeedMultiplier%
}
If MouseWheelAccelerationSpeedReal = 1
    ToolTip, Mouse wheel acceleration speed: %MouseWheelAccelerationSpeedReal% line
else
    ToolTip, Mouse wheel acceleration speed: %MouseWheelAccelerationSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return

ButtonWheelMaxSpeedUp:
MouseWheelMaxSpeed++
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
MouseWheelMaxSpeedReal = %MouseWheelMaxSpeed%
MouseWheelMaxSpeedReal *= %MouseWheelSpeedMultiplier%
ToolTip, Mouse wheel maximum speed: %MouseWheelMaxSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return
ButtonWheelMaxSpeedDown:
RegRead, MouseWheelSpeedMultiplier, HKCU, Control Panel\Desktop, WheelScrollLines
If MouseWheelSpeedMultiplier <= 0
    MouseWheelSpeedMultiplier = 1
If MouseWheelMaxSpeed > 1
{
    MouseWheelMaxSpeed--
    MouseWheelMaxSpeedReal = %MouseWheelMaxSpeed%
    MouseWheelMaxSpeedReal *= %MouseWheelSpeedMultiplier%
}
If MouseWheelMaxSpeedReal = 1
    ToolTip, Mouse wheel maximum speed: %MouseWheelMaxSpeedReal% line
else
    ToolTip, Mouse wheel maximum speed: %MouseWheelMaxSpeedReal% lines
SetTimer, RemoveToolTip, 1000
return

ButtonWheelUp:
ButtonWheelDown:

If Button <> 0
{
    If Button <> %A_ThisHotkey%
    {
        MouseWheelCurrentAccelerationSpeed = 0
        MouseWheelCurrentSpeed = %MouseWheelSpeed%
    }
}
StringReplace, Button, A_ThisHotkey, *

ButtonWheelAccelerationStart:
If MouseWheelAccelerationSpeed >= 1
{
    If MouseWheelMaxSpeed > %MouseWheelCurrentSpeed%
    {
        Temp = 0.001
        Temp *= %MouseWheelAccelerationSpeed%
        MouseWheelCurrentAccelerationSpeed += %Temp%
        MouseWheelCurrentSpeed += %MouseWheelCurrentAccelerationSpeed%
    }
}

If Button = y
    MouseClick, wheelup,,, %MouseWheelCurrentSpeed%, 0, D
else if Button = n
    MouseClick, wheeldown,,, %MouseWheelCurrentSpeed%, 0, D

SetTimer, ButtonWheelAccelerationEnd, 100
return

ButtonWheelAccelerationEnd:
GetKeyState, kstate, %Button%, P
if kstate = D
    Goto ButtonWheelAccelerationStart

MouseWheelCurrentAccelerationSpeed = 0
MouseWheelCurrentSpeed = %MouseWheelSpeed%
Button = 0
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return
