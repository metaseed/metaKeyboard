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

isRemoteDesktopFullScreen() {
    If WinActive("ahk_class TscShellContainerClass") {
        WinGet, maxOrMin, MinMax, ahk_class TscShellContainerClass
        if (maxOrMin = 0) {
            WinGetPos, PosX, PosY, WinWidth, WinHeight, ahk_class TscShellContainerClass
            if (PosY = 0) {  ; it is fully maximized
                return true
            }
        }
    }
    return false
}

GetFolder()
{
    WinGetClass,var,A
    If var in CabinetWClass,ExplorerWClass,Progman
    {
        IfEqual,var,Progman
            v := A_Desktop
        else
        {
            winGetText,Fullpath,A
            loop,parse,Fullpath,`r`n
            {
                IfInString,A_LoopField,:\
                {
                    StringGetPos,pos,A_Loopfield,:\,L
                    Stringtrimleft,v,A_loopfield,(pos - 1)
                    break
                }
            }
        }
    return, v
    }
}

#include %A_LineFile%\..\key.ahk.
#Include %A_LineFile%\..\shellRun.ahk.
#Include, %A_LineFile%\..\fileExplorer.ahk.