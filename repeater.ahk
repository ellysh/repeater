#include debug.ahk

global kTitle := "II"
;global kTitle := "Untitled - Notepad"
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
			LogWrite("WatchKeyboard -  key = " . SingleKey)
			SendToAll(SingleKey)
		}
	}
return

SendToAll(x)
{
	WinGet, notepadWindows, List, % GetWindow()
	Loop %notepadWindows%
	{
		LogWrite("SendToAll -  key = " . x . " window = " . "ahk_id " . notepadWindows%A_Index%)	
		ControlSend, , %x%, % "ahk_id " . notepadWindows%A_Index%
	}
}