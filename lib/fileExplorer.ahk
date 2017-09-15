Explorer_GetSelection(hwnd="") {
	hwnd := hwnd ? hwnd : WinExist("A")
	WinGetClass class, ahk_id %hwnd%
	if (class="CabinetWClass" or class="ExploreWClass" or class="Progman")
		for window in ComObjCreate("Shell.Application").Windows
			if (window.hwnd==hwnd)
    sel := window.Document.SelectedItems
	for item in sel
	ToReturn .= item.path "`n"
	return Trim(ToReturn,"`n")
}