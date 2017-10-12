; send 'key' with modifier keys
; if right Alt is pressed, send 'originalKey' with modifiers

; so the left Alt could be used as a function key:
; for example:
; *!h::keyWithCtrlAltShift("Left","h")
; when user press left Alt, actual generate Alt and Left arrow, but
; when user press right Alt, actual generate Alt and 'h'.

; The LAlt(left Alt) key combined with the keys in this table gives you a shortcut: 
; i.e. if you want to press Alt+Up you could just press LAlt+k, no need to press Alt+CL+k together.
keyWithCtrlAltShift(key, originalKey)
{
    if GetKeyState("control") = 0 {
        if GetKeyState("Alt") = 0 {
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
                    ;Send, !{ %key% }
                    if GetKeyState("RAlt") = 0 {
                        Send, {Alt down}{ %key% }
                    } else {
                        Send, {Blind}!{ %originalKey% }
                        ;Send, {Alt down} {%originalKey%}
                    }
                } else {
                    if GetKeyState("RAlt") = 0 {
                        Send, !#{ %key% }
                    } else {
                        Send, !#{%originalKey%}
                    }
                }
            } else {
                if GetKeyState("LWin") = 0 {
                    if GetKeyState("RAlt") = 0 {
                        Send, !+{ %key% }
                    } else {
                        Send, !+{%originalKey%}
                    }
                } else {
                    if GetKeyState("RAlt") = 0 {
                        Send, !+#{ %key% }
                    } else {
                        Send, !+#{%originalKey%}
                    }
                }
            }
        }
    } else {
        if GetKeyState("Alt") = 0 {
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
                    if GetKeyState("RAlt") = 0 {
                        Send, ^!{ %key% }
                    } else {
                        Send, ^!{%originalKey%}
                    }
                }else {
                    if GetKeyState("RAlt") = 0 {
                        Send, ^!#{ %key% }
                    } else {
                        Send, ^!#{%originalKey%}
                    }
                }
            } else {
                if GetKeyState("LWin") = 0 {
                    if GetKeyState("RAlt") = 0 {
                        Send, ^!+{ %key% }
                    } else {
                        Send, ^!+{%originalKey%}
                    }
                }else {
                    if GetKeyState("RAlt") = 0 {
                        Send, ^!+#{ %key% }
                    } else {
                        Send, ^!+#{%originalKey%}
                    }
                }
            }
        }
    }
}