GetScanCode:
SetFormat, Integer, Hex
Gui +ToolWindow -SysMenu +AlwaysOnTop
Gui, Font, s14 Bold, Arial
Gui, Add, Text, w100 h33 vSC 0x201 +Border, {SC000}
Gui, Show,, % "// ScanCode //////////"
Loop 9
  OnMessage( 255+A_Index, "ScanCode" ) ; 0x100 to 0x108
Return

ScanCode( wParam, lParam ) {
 Clipboard := "SC" SubStr((((lParam>>16) & 0xFF)+0xF000),-2) 
 GuiControl,, SC, %Clipboard%
}