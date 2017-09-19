; This is part of my AutoHotKey [1] script. When you are in Windows Explorer it
; allows you to press Ctrl+Alt+N and type a filename, and that file is created
; in the current directory and opened in the appropriate editor (usually
; [gVim](http://www.vim.org/) in my case, but it will use whatever program is
; associated with the file in Windows Explorer).

; This is much easier than the alternative that I have been using until now:
; Right click > New > Text file, delete default filename and extension (which
; isn't highlighted in Windows 7), type the filename, press enter twice.
; (Particularly for creating dot files like ".htaccess".)

; Credit goes to aubricus [2] who wrote most of this - I just added the
; 'IfWinActive' check and 'Run %UserInput%' at the end.

; [1]: http://www.autohotkey.com/
; [2]: https://gist.github.com/1148174


; Only run when Windows Explorer or Desktop is active
; Ctrl+Alt+N

^!n::
#IfWinActive, ahk_class ExploreWClass||ahk_class Progman||ahk_class WorkerW ||ahk_class CabinetWclass
{
    ; Get full path from open Explorer window
    WinGetText, FullPath, A
    ; Clean up result
    StringReplace, FullPath, FullPath, `r, , all
    FullPath := RegExReplace(FullPath, "^.*`nAddress: ([^`n]+)`n.*$", "$1")
    ; Change working directory
    SetWorkingDir, %FullPath%
    ; An error occurred with the SetWorkingDir directive
    If ErrorLevel
        Return

    ; Display input box for filename
    InputBox, UserInput, New File (example: foo.txt), , , 400, 100
    ; User pressed cancel
    If ErrorLevel
        Return

    ; Create file
    FileAppend, , %UserInput%
    ; Open the file in the appropriate editor
    ;Run %UserInput%
    Return
}
#IfWinActive
