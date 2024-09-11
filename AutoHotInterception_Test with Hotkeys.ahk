
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


