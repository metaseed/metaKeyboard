RefreshEnvironment()
{
	Path := ""
	PathExt := ""
	RegKeys := "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment,HKCU\Environment"
	Loop, Parse, RegKeys, CSV
	{
		Loop, Reg, %A_LoopField%, V
		{
			RegRead, Value
			If (A_LoopRegType == "REG_EXPAND_SZ" && !ExpandEnvironmentStrings(Value))
				Continue
			If (A_LoopRegName = "PATH")
				Path .= Value . ";" 
			Else If (A_LoopRegName = "PATHEXT")
				PathExt .= Value . ";"
			Else 
				EnvSet, %A_LoopRegName%, %Value%
		}
	}
	EnvSet, PATH, %Path%
	EnvSet, PATHEXT, %PathExt%
}
ExpandEnvironmentStrings(ByRef vInputString)
{
   ; get the required size for the expanded string
   vSizeNeeded := DllCall("ExpandEnvironmentStrings", "Str", vInputString, "Int", 0, "Int", 0)
   If (vSizeNeeded == "" || vSizeNeeded <= 0)
      return False ; unable to get the size for the expanded string for some reason

   vByteSize := vSizeNeeded + 1
   If (A_PtrSize == 8) { ; Only 64-Bit builds of AHK_L will return 8, all others will be 4 or blank
      vByteSize *= 2 ; need to expand to wide character sizes
   }
   VarSetCapacity(vTempValue, vByteSize, 0)

   ; attempt to expand the environment string
   If (!DllCall("ExpandEnvironmentStrings", "Str", vInputString, "Str", vTempValue, "Int", vSizeNeeded))
      return False ; unable to expand the environment string
   vInputString := vTempValue

   ; return success
   Return True
}