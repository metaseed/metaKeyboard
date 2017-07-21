; solve problem: ahk not work in win10 in some applications
; https://stackoverflow.com/questions/31839062/autohotkey-in-windows-10-hotkeys-not-working-in-some-applications
if not A_IsAdmin
{
    try{
        Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
    } Catch e{
        ExitApp
    }
}

TrayTip, AutoHotKey, Started, 1
SoundBeep, 300, 150

TRY_startup = Runs at startup
TRY_options = Options
Menu, tray, DeleteAll
menu, tray, add ; separator
Menu, Options_Tray, add, % TRY_startup, startup
Menu, tray, add, % TRY_options, :Options_Tray