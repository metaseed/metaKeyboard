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
                    ; only key
                    Send, { %key% }
                }else {
                    ; lwin
                    Send, #{ %key% }
                }
            } else {
                ; shift
                if GetKeyState("LWin") = 0 {
                    ; shift
                    Send, +{ %key% }
                }else {
                    ; shift+lwin
                    Send, +#{ %key% }
                }
            }
        } else {
            ; alt
            if GetKeyState("shift") = 0 {
                if GetKeyState("LWin") = 0 {
                    ;IfWinExist ahk_class #32771
                    ;Send, !{ %key% }
                    if GetKeyState("RAlt") = 0 {
                        ; lalt
                        Send, {Alt down}{ %key% }
                    } else {
                        ; ralt
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
                ; alt+shift
                if GetKeyState("LWin") = 0 {
                    if GetKeyState("RAlt") = 0 {
                        ; ralt+shift
                        Send, !+{ %key% }
                    } else {
                        ; ralt+shift
                        Send, !+{%originalKey%}
                    }
                } else {
                    ; alt+shift+lwin
                    if GetKeyState("RAlt") = 0 {
                        ; lalt+shift+LWin
                        Send, !+#{ %key% }
                    } else {
                        ; ralt+shift+lwin
                        Send, !+#{%originalKey%}
                    }
                }
            }
        }
    } else {
        ; ctrl
        if GetKeyState("Alt") = 0 {
            if GetKeyState("shift") = 0 {
                if GetKeyState("LWin") = 0 {
                    ; ctrl
                    Send, ^{ %key% }
                }else {
                    ; ctrl+lwin
                    Send, ^#{ %key% }
                }
            } else {
                ; ctrl+shift
                if GetKeyState("LWin") = 0 {
                    ; ctrl+shift
                    Send, ^+{ %key% }
                }else {
                    ; ctrl+shift+lwin
                    Send, ^+#{ %key% }
                }
            }
        } else {
            ; ctrl+alt
            if GetKeyState("shift") = 0 {
                if GetKeyState("LWin") = 0 {
                    if GetKeyState("RAlt") = 0 {
                        ; ctrl+lalt
                        Send, ^!{ %key% }
                    } else {
                        ; ctrl+ralt
                        Send, ^!{%originalKey%}
                    }
                } else {
                    ; ctrl+alt+lwin
                    if GetKeyState("RAlt") = 0 {
                        ; ctrl+lalt+lwin
                        Send, ^!#{ %key% }
                    } else {
                        ; ctrl+ralt+lwin
                        Send, ^!#{%originalKey%}
                    }
                }
            } else {
                ; ctrl+alt+shift
                if GetKeyState("LWin") = 0 {
                    if GetKeyState("RAlt") = 0 {
                        ; ctrl+lalt+shift
                        Send, ^!+{ %key% }
                    } else {
                        ; ctrl+ralt+shift
                        Send, ^!+{%originalKey%}
                    }
                } else {
                    ; ctrl+alt+shift+lwin
                    if GetKeyState("RAlt") = 0 {
                        ; ctrl+lalt+shift+lwin
                        Send, ^!+#{ %key% }
                    } else {
                        ; ctrl+ralt+shift+lwin
                        Send, ^!+#{%originalKey%}
                    }
                }
            }
        }
    }
}