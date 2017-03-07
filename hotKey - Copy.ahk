#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Capslock & 1::Send, {F1}
>!1::Send, {F1}

Capslock & 2::Send, {F2}
>!2::Send, {F2}

Capslock & 3::Send, {F3}
>!3::Send, {F3}

Capslock & 4::Send, {F4}
>!4::Send, {F4}

Capslock & 5::Send, {F5}
>!5::Send, {F5}

Capslock & 6::Send, {F6}
>!6::Send, {F6}

Capslock & 7::Send, {F7}
>!7::Send, {F7}

Capslock & 8::Send, {F8}
>!8::Send, {F8}

Capslock & 9::Send, {F9}
>!9::Send, {F9}

Capslock & 0::Send, {F10}
>!0::Send, {F10}
+>!0:: Click Right

Capslock & -::Send, {F11}
>!-::Send, {F11}

Capslock & =::Send, {F12}
>!=::Send, {F12}

Capslock & i::Send, {Up}
Capslock & k::Send, {Down}
Capslock & j::Send, {Left}
Capslock & l::Send, {Right}

Capslock & e::Send, {Up}
Capslock & d::Send, {Down}
Capslock & s::Send, {Left}
Capslock & f::Send, {Right}