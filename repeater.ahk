#Persistent
#SingleInstance, Force

SetTimer, WatchKeyboard, 10

WatchKeyboard:
	loop
	{
		IfWinActive, ahk_class Notepad
		{
			Input, SingleKey, L1 *
			SendToAll(SingleKey)
		}
	}
return

SendToAll(x)
{
	WinGet, notepadWindows, List, ahk_class Notepad
	Loop %notepadWindows%
	{
		ControlSend, , %x%, % "ahk_id " . notepadWindows%A_Index%
	}
}