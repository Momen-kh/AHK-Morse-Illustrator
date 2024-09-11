#SingleInstance force
#include <AutoHotInterception>
#Include <TapHOldManager>
#Include <InterceptionTapHold>

AHI := new AutoHotInterception()

keyboard1Id := AHI.GetKeyboardId(0x25A7, 0xFA07)
ITH1 := new InterceptionTapHold(AHI, keyboard1Id)
ITH1.Add("1", Func("Func1"))
; Turn off InterceptionTapHold
ITH1.SetState(0)
ctrlHeld := 0
return

; Here where I wish to make pressing: ctrl + (Button 1 in my mouse ) executes another function or something else - Please if you could help ( Thanks )

LCtrl::
   if (ctrlHeld)
      return ; Filter key repeat
   ctrlHeld := 1
   ITH.SetState(1) ; Turn on ITH while ctrl is held
   return

LCtrl up::
   ctrlHeld := 0
   ITH.SetState(0) ; Turn off ITH when CTRL is released
   return

Func1(isHold, taps, state){

		if (isHold=0) & (taps=1)& (state)
		{
			MsgBox, 1
		}

		if (isHold=0) & (taps=2)& (state)
		{
			MsgBox, 2
		}

		if (isHold=0) & (taps=3)& (state)
		{
			MsgBox, 3
		}

		if (isHold=1) & (taps=1)& (state)
		{
			MsgBox, 4
		}

		if (isHold=1) & (taps=2)& (state)
		{
			MsgBox, 5
		}
	}
^Esc::
	ExitApp


