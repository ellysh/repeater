#include debug.ahk

;global kTitle := "II"
global kTitle := "Untitled - Notepad"
global kClass := "ahk_class Notepad"
global kUseClass := 0

#NoEnv
#Persistent
#SingleInstance, Force

SetKeyDelay, -1

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

LoopSend(Focus=0)
{
	WinGet, WinList, List, % GetWindow()
	Loop %WinList%
	{
		IfEqual, Focus, 1
		{
			WinActivate, % "ahk_id " . WinList%A_Index%
		}
		LogWrite("ControlSend -  key = " . x . " window = " . "ahk_id " . notepadWindows%A_Index%)			
		ControlSend, , % "{Blind}{" RegExReplace(A_ThisHotkey, "[*$~]") "}", % "ahk_id " WinList%A_Index%
	}
}

!F1::
	ExitApp
	return

IfWinActive, % GetWindow()
{
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
	LoopSend(0)
	Return
}
