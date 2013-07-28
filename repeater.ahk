#Persistent
#SingleInstance, Force

SetTimer, WatchKeyboard, 10

WatchKeyboard:
	loop
	{
		IfWinActive, Untitled - Notepad
		{
			Input, SingleKey, L1 *
			SendToAll(SingleKey)
		}
	}
return

SendToAll(x)
{
	WinGet, notepadWindows, List, Untitled - Notepad
	Loop %notepadWindows%
	{
		ControlSend, , %x%, % "ahk_id " . notepadWindows%A_Index%
	}
}