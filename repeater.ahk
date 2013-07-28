#include ../lib/config.ahk
#include ../lib/debug.ahk
#include ../lib/command.ahk

global gEdit
global kTitle := "Open Enso"

Enter::
	IfWinExist, %kTitle%
	{
		OnExecute()
	}
	Send, {Enter}
	return

!F2::
	IfWinNotExist, %kTitle%
	{
		CreateWindow()
	}
	else
	{
		WinClose, %kTitle%
	}
	return

CreateWindow()
{
	Gui, New
	Gui, Font, s16, Arial
	Gui, Add, Edit, x0 y2 w300 vgEdit
	Gui, Show, Restore w300 h28, %kTitle%
}


; Main Loop
while true
{
	Sleep 10
}