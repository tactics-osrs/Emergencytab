#Persistent
#SingleInstance force
#NoEnv
#MaxHotkeysPerInterval 9900
#HotkeyInterval 9900
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1


MsgBox, 68,Roat Pkz Emergency Teleport and Tab,
(
This script will attempt to teleport you to safety using seed pod/tab in 28th inventory slot after activating F1 hotkey to open your backpack.


This script works by monitoring your health orb and activates at approximately 50 health and anything lower. 


There is a 25 second cool down on the automated emergency teleport.


Alternatively you can use Numpad 0 to activate the same script regardless of Health points.
This option has a no cooldown.


You can close this script at anytime by pressing Numpad 9.


You can pause this script at anytime by pressing F12.



Do you want to proceed with this script?
)

IfMsgBox No, exitapp ;pressing cancel will exit your program. using "Msgbox, 65,(Title), (text)
buttonOK:

;Exit conditions
f12::
Suspend, Toggle
return
Numpad9::exitapp

CoordMode, Pixel, Window
SetTitleMatchMode, 2
CoordMode, Mouse, Window
tt = Roat Pkz ahk_class SunAwtFrame
WinWait, %tt%
IfWinNotActive, %tt%,, WinActivate, %tt%






SetTimer, CheckColor, 100 ; Set a timer to run the CheckColor subroutine every 100 milliseconds (0.1 second)

Return ; End of auto-execute section

CheckColor:
    PixelSearch, FoundX, FoundY, 553, 88, 553, 88, 0x131313, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        SoundBeep
        BlockInput On
        MouseGetPos, StartX, StartY
		Sleep, 10
        SendInput, {F1}
        MouseClick, L, 710, 475
        Sleep, 10
        MouseMove, StartX, StartY
        BlockInput Off
		ToolTip, Low Health detected! ; Adds a tool tip indicating low health
		Sleep, 5000
		ToolTip ; Remove the tooltip after the sleep
        Sleep, 20000 ; Sleeps for 20,000 milliseconds. (20 seconds.)
		
	}
Return

Numpad0::
{
    SoundBeep
    BlockInput On
    MouseGetPos, StartX, StartY
    SendInput, {F1}
    MouseClick, L, 710, 475
    MouseClick, L, 710, 475
    MouseClick, L, 710, 475
    Sleep, 2
    MouseMove, StartX, StartY
    BlockInput Off
	Tooltip, Attempting to Escape... ; Adds a tool tip indicating the script is attempting to escape
	Sleep,500
	Tooltip ; Remove the tooltip after the sleep
}
Return

