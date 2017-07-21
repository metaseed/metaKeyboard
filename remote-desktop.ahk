; https://superuser.com/questions/397257/how-to-fix-ahk-to-send-keys-to-rdp-fullscreen
; http://tahirhassan.blogspot.co.uk/2012/11/autohotkey-scripts_19.html

; this line should be put on top (auto-exec) section of ahk script
SetTimer, SuspendOnRDPMaximized, 500

;Hotkey, *CapsLock, capsHotKeyAction, On
return
; this actual code label and the fn can be put anywhere in the script file
SuspendOnRDPMaximized:
If WinActive("ahk_class TscShellContainerClass") {
    WinGet, maxOrMin, MinMax, ahk_class TscShellContainerClass
    if (maxOrMin = 0) {
        WinGetPos, PosX, PosY, WinWidth, WinHeight, ahk_class TscShellContainerClass
        if (PosY <= 0) {  ; it is fully maximized
            ;Hotkey, *CapsLock, Off
            Suspend, On
            WinWaitNotActive, ahk_class TscShellContainerClass
            Suspend, Off
            ;Hotkey, *CapsLock, On
        }
       ; MsgBox, PosY: %PosY%, PosX: %PosX%
    }
}
return



; capsHotKeyAction:
; Send, { ESC }
; ;MsgBox You pressed %A_ThisHotkey%.
; return