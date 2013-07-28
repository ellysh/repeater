global kTitle := "Untitled - Notepad"
global kClass := "ahk_class Notepad"
global kUseClass := 0

#Persistent
#SingleInstance, Force

SetTimer, WatchKeyboard, 10

GetWindow()
{
	if %kUseClass%
	{
		return %kClass%
	}
	else
	{
		return %kTitle%
	}
}

WatchKeyboard:
	loop
	{
		IfWinActive, % GetWindow()
		{
			Input, SingleKey, L1 *
			SendToAll(SingleKey)
		}
	}
return

SendToAll(x)
{
	WinGet, notepadWindows, List, % GetWindow()
	Loop %notepadWindows%
	{
		ControlSend, , %x%, % "ahk_id " . notepadWindows%A_Index%
	}
}