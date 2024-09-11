#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%



#ifWinActive, ahk_exe Illustrator.exe

;! Mouse button (2) -- with Hotkeys ( This what I wish I could do with AutoHotInterception)

+SC003::
{
    app := ComObjActive("Illustrator.Application.26")
    doc := app.activeDocument
    options := ComObjCreate("Illustrator.Application.26")
    app.DoScript("MK_Add_Fill", "MK")
    Return
}

^+SC003::
    Send, ^{NumpadDiv}

^+!SC003::Send, +{F6}



;! mouse button (2) -- with Morse pattern 

SC003::

p := morse(250)


;^================================================= Press One 

    if(p == "0")  
    { 


        app := ComObjActive("Illustrator.Application.26")
        doc := app.activeDocument
        options := ComObjCreate("Illustrator.Application.26")
        app.DoScript("MK_Select_Fill", "MK")
        Return
    }


;^=================================================== Press Two 
    
   else if(p == "00")    
    { 
        app := ComObjActive("Illustrator.Application.26")
        doc := app.activeDocument
        options := ComObjCreate("Illustrator.Application.26")
        app.DoScript("MK_Stroke_Black", "MK")
        Return

    }



;^=================================================== Press Three 
         
   else if(p == "000")    
    {

    }



;^==================================================== Press Long 


    else if(p == "1")  
    {
        app := ComObjActive("Illustrator.Application.26")
        doc := app.activeDocument
        options := ComObjCreate("Illustrator.Application.26")
        app.DoScript("MK_Fill_Black", "MK")
        Return
    }
;^================================================== Press 1 - Long  

    else if(p == "01")              
    { 
        MsgBox, Press_1_Long
    }
    else
    {
        MsgBox, [ Options, Title, allllll, Timeout]
    }
return





;^=================================================== Morse_function 
Morse(timeout = 400) { ;
    tout := timeout/1000
    key := RegExReplace(A_ThisHotKey,"[\*\~\$\#\+\!\^]")
    Loop {
        t := A_TickCount
        KeyWait %key%
        Pattern .= A_TickCount-t > timeout
        KeyWait %key%,DT%tout%
        If (ErrorLevel)
            Return Pattern
    }
}

tt(txt){
    ToolTip %txt%
    sleep 1000
    ToolTip
}

^Escape::Reload
^+Escape::Suspend
