#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force
#MaxHotkeysPerInterval 500

; Using the keyboard hook to implement the Numpad hotkeys prevents
; them from interfering with the generation of ANSI characters such
; as à.  This is because AutoHotkey generates such characters
; by holding down ALT and sending a series of Numpad keystrokes.
; Hook hotkeys are smart enough to ignore such keystrokes.
#UseHook

; solve problem: ahk not work in win10 in some applications
; https://stackoverflow.com/questions/31839062/autohotkey-in-windows-10-hotkeys-not-working-in-some-applications
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   ExitApp
}

TrayTip, AutoHotKey, Started, 1
SoundBeep, 300, 150
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
#include %A_LineFile%\..\config.ahk.
#Include %A_LineFile%\..\lib\index.ahk.
;#Include %A_LineFile%\..\mouse.ahk.
#include %A_LineFile%\..\keyboard.ahk.
#include %A_LineFile%\..\functionKeys.ahk.
#include %A_LineFile%\..\create-new-file.ahk.
;---------------------------------------------------------------------