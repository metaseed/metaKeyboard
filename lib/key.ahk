keyWithCtrlAltShift(key, originalKey)
{
    if GetKeyState("control") = 0 {
        if GetKeyState("LAlt") = 0 {
            if GetKeyState("shift") = 0 {
                if GetKeyState("LWin") = 0 {
                    if GetKeyState("RAlt") = 0 {
                        Send, { %key% }
                    } else {
                        Send, !{ %originalKey%}
                    }
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
                    ;Send, !{ %key% }
                    Send, {Alt down}{ %key% }
                }else {
                    Send, !#{ %key% }
                }
            } else {
                if GetKeyState("LWin") = 0 {
                    Send, !+{ %key% }
                } else {
                    Send, !+#{ %key% }
                }
            }
        }
    } else {
        if GetKeyState("LAlt") = 0 {
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