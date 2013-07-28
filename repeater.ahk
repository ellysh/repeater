global kUseClass := 0

#Persistent
#SingleInstance, Force

SetTimer, WatchKeyboard, 10

GetWindow()
{
	if %kUseClass%
	{
		return "ahk_class Notepad"
	}
	else
	{
		return "Untitled - Notepad"
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