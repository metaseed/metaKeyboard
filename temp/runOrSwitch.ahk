; ===========================================================================
; Run a program or switch to it if already running.
;    Target - Program to run. E.g. Calc.exe or C:\Progs\Bobo.exe
;    WinTitle - Optional title of the window to activate.  Programs like
;       MS Outlook might have multiple windows open (main window and email
;       windows).  This parm allows activating a specific window.
; ===========================================================================
RunOrActivate(Target, WinTitle = "")
{
	; Get the filename without a path
	SplitPath, Target, TargetNameOnly

	Process, Exist, %TargetNameOnly%
	If ErrorLevel > 0
		PID = %ErrorLevel%
	Else
		Run, %Target%, , , PID

	; At least one app (Seapine TestTrack wouldn't always become the active
	; window after using Run), so we always force a window activate.
	; Activate by title if given, otherwise use PID.
	If WinTitle <> 
	{
		SetTitleMatchMode, 2
		WinWait, %WinTitle%, , 3
		TrayTip, , Activating Window Title "%WinTitle%" (%TargetNameOnly%)
		WinActivate, %WinTitle%
	}
	Else
	{
		WinWait, ahk_pid %PID%, , 3
		TrayTip, , Activating PID %PID% (%TargetNameOnly%)
		WinActivate, ahk_pid %PID%
	}


	SetTimer, RunOrActivateTrayTipOff, 1500
}

; Turn off the tray tip
RunOrActivateTrayTipOff:
	SetTimer, RunOrActivateTrayTipOff, off
	TrayTip
Return




; Example uses...
#b::RunOrActivate("C:\Program Files\Seapine\TestTrack Pro\TestTrack Pro Client.exe")
#c::RunOrActivate("control panel")
#d::RunOrActivate("cmd.exe")
#g::RunOrActivate("regedit.exe")
#i::Run, iexplore.exe
#n::RunOrActivate("uedit32.exe")

; Outlook can have multiple child windows, so specify which window to activate
#o::RunOrActivate("C:\Program Files\Microsoft Office\OFFICE11\OUTLOOK.EXE", "Microsoft Outlook")

#p::RunOrActivate("C:\Program Files\Perforce\P4Win.exe")
#q::RunOrActivate("C:\Program Files\Microsoft Visual Studio\COMMON\MSDev98\Bin\MSDEV.EXE", "Microsoft Visual")
#t::RunOrActivate("C:\Program Files\totalcmd\totalcmd.exe")
#y::RunOrActivate("wmplayer.exe")
#-::RunOrActivate("mspaint.exe")
#=::RunOrActivate("calc.exe")
