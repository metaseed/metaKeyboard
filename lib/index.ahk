RemoveToolTip(){
	SetTimer, RemoveToolTip, Off
	ToolTip
}

RemoveTrayTip(){
	SetTimer, RemoveTrayTip, Off
	TrayTip
}

moveMouseToWindowCenter() {
    WinGetPos,x,y,width,height,A
    While (x < 0 Or y < 0)
    {
        Sleep,100
        WinGetPos,x,y,width,height,A
        IfGreater,A_Index,2,Break
    }
    MouseMove,width/2,height/2
	Tooltip, Smile every day!
	SetTimer, RemoveToolTip, 2000
}

keyWithCtrlAltShift(key)
{
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