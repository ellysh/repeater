#include debug.ahk

global kTitle := "II"
;global kTitle := "Untitled - Notepad"

global kClass := "ahk_class Notepad"
;global kClass := "ahk_class l2UnrealWWindowsViewportWindow"
global kUseClass := 0

#NoEnv
#Persistent
#SingleInstance, Force

SetKeyDelay, -1
LogWrite("Configuration - kTitle = " . kTitle . " Class = " . kClass . " kUseClass = " . kUseClass)

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

LoopSend(Focus = 0)
{
	WinGet, WinList, List, % GetWindow()
	Loop %WinList%
	{
		IfEqual, Focus, 1
		{
			WinActivate, % "ahk_id " . WinList%A_Index%
		}
		LogWrite("ControlSend -  key = " . A_ThisHotkey . " window = " . "ahk_id " . WinList%A_Index%)
		ControlSend, , % "{Blind}{" RegExReplace(A_ThisHotkey, "[*$~]") "}", % "ahk_id " WinList%A_Index%
	}
}

!F1::
	ExitApp
	return
$*F1::
$*F2::
$*F3::
$*F4::
$*F5::
$*F6::
$*F7::
$*F8::
$*F9::
$*F10::
$*F11::
$*F12::
$*0::
$*1::
$*2::
$*3::
$*4::
$*5::
$*6::
$*7::
$*8::
$*9::
$*a::
$*b::
$*c::
$*d::
$*e::
$*f::
$*g::
$*h::
$*i::
$*j::
$*k::
$*l::
$*m::
$*n::
$*o::
$*p::
$*q::
$*r::
$*s::
$*t::
$*u::
$*v::
$*w::
$*x::
$*y::
$*z::
$*Space::
$*Left::
$*Right::
$*Up::
$*Down::
$*Backspace::
$*=::
$*-::
$*[::
$*]::
$*\::
$*;::
$*'::
$*Enter::
$*`::
$*Tab::
$*.::
$*,::
$*/::
$*Delete::
$*Home::
$*End::
$*PgUp::
$*PgDn::
$*ESC::
	LogWrite("Catch -  key = " . A_ThisHotkey)
	IfWinActive, % GetWindow()
	{
		LoopSend(0)
		Return
	}
	else
		Send % "{Blind}{" RegExReplace(A_ThisHotkey, "[*$~]") "}"
	
