mklink "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\VSCode.vsk" "M:\Workspace\metaKeyboard\metaKeyboard\software\VisualStudioShortcut\VSCode.vsk"

robocopy C:\Users\jsong12\AppData\Roaming\Microsoft\VisualStudio\14.0  M:\Workspace\metaKeyboard\metaKeyboard\software\VisualStudioShortcut Cur rent.vsk /MOT:2 /save:"M:\Workspace\metaKeyboard\metaKeyboard\software\VisualStudioShortcut\vs2015ShortcutBackup.rcj"

sc create "vs2015 Shortcut Backup Service" binPath= "C:\Windows\system32\robocopy.exe /JOB:M:\Workspace\metaKeyboard\metaKeyboard\software\VisualStudioShortcut\VS2015SHORTCUTBACKUP.RCJ" start= auto

NOTE: the sc solution is not work on windows 10

and finally using the task scheduler
Note: need to run the task using the SYSTEM account, otherwise there will be a console window.
