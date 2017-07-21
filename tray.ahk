
; Portable Startup
IfExist, %A_Startup%/metaKeyboard.lnk
{
	FileDelete, %A_Startup%/metaKeyboard.lnk
	FileCreateShortcut, % H_Compiled ? A_AhkPath : A_ScriptFullPath, %A_Startup%/metaKeyboard.lnk
	Menu, Options_Tray, Check, % TRY_startup
}

startup:
	Menu, Options_Tray, Togglecheck, % TRY_startup
	IfExist, %A_Startup%/metaKeyboard.lnk
		FileDelete, %A_Startup%/metaKeyboard.lnk
	else FileCreateShortcut, % H_Compiled ? A_AhkPath : A_ScriptFullPath, %A_Startup%/metaKeyboard.lnk
	return

