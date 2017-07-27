

CapsLock & m::
Input Key, L1 M
if Key = r 
    Run, "%ruler%"
else if Key = s 
    if GetKeyState("alt") = 0 
        Run SnippingTool.exe                    ;Sniping
    else 
        Run "%gifTool%"
return