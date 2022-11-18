#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#.:: run python C:\Users\jmill\Documents\Northwell\Northwell-Open-Engine\Utilities\specialPaste.py

#/:: run python C:\Users\jmill\Documents\Northwell\Northwell-Open-Engine\Utilities\autoQC.py

#s::
send, jm024001{tab}
sendraw, Fall*2021
send, {enter}


#u::
send, uar_get_code_display(


:*?:cqm_details::
run python C:\Users\jmill\Documents\Northwell\Northwell-Open-Engine\Utilities\cqmDetails.py
Return

;QC command
:*?:creds::
run python C:\Users\jmill\Documents\Northwell\Northwell-Open-Engine\Utilities\credentials.py

;;;;Python executes;;;;;;;
#;:: run python C:\Python\Scripts\entityQuery.py

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;Investigations;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force

^!i::
{

global fLineBreak = "================================================================="
global tLineBreak = "==============================================================================================="

Gui, new, ,Create investigation
Gui, +AlwaysOnTop
Gui, Font, S10, Arial

Gui, Add, Text, x410 y10, Environment:
Gui, Add, Edit, vSREnviron w150

Gui, Add, Text, x10 y70, Contact:
Gui, Add, Edit, vSRContact w150

Gui, Add, Text, x210 y70, Phone Number:
Gui, Add, Edit, vSRPhone w150

Gui, Add, Text, x410 y70, Email:
Gui, Add, Edit, vSREmail w150

Gui, Add, Text, x10 y130, Summary:
Gui, Add, Edit, vSRSumm w550 h80

Gui, Add, Text, x10 y250, Description:
Gui, Add, Edit, vSRDesc w550 h200

Gui, Add, Button, x410 y240 w75, PHI
Gui, Add, Button, x485 y240 w75, HL7
Gui, Add, Button, x335 y240 w75, ======

Gui, Add, Button, x335 y480 h50 w75, Cancel
Gui, Add, Button, x410 y480 h50 w150, Create investigation

Gui, show
Return

ButtonCancel:
	gui, Destroy
	return

ButtonCreateSR:
	gui, Submit, noHide
	 
	myFile = %SRmnemonic% %SRNum%.txt
	
	FormatTime, TimeString,, MM.yyyy
	mypath = C:\Users\jmill\Documents\Northwell\Investigations\%TimeString%
	
	FileRead, a_template, C:\Users\jm024001\Documents\Investigations\a_template.txt
	
	IfNotExist, %myPath%
		FileCreateDir, %mypath%
	
	newfile = %mypath%\%myFile%
	
	IfExist, %newfile%
	{
		MsgBox, 0x42004, , File already exists, open existing file?
		
		IfMsgBox Yes
		{
			Run, %newfile%
			gui, Destroy
		}
		else
			gui, Destroy
		return
	}
	
	FileAppend, %myFile%, %newfile%
	FileAppend, `nEnvironment: %SREnviron%, %newfile%
	FileAppend, `nContact: %SRContact%, %newfile%
	FileAppend, `nPH: %SRPhone%, %newfile%
	FileAppend, `nEmail: %SREmail%, %newfile%
	FileAppend, `n%tLineBreak%`nIssue:`n-------`n%SRSumm%, %newfile%
	FileAppend, `n`n%SRDesc%, %newfile%
	FileAppend, `n%a_template%, %newfile%
	MsgBox, 0x42000, , File created at location:`n%newfile%
	Run, %newfile%
	gui, Destroy
	Return
	
Button======:
	ControlGetText, oldSRDesc, Edit8
	newSRDesc = %oldSRDesc%`n%fLineBreak%`n
	ControlSetText, Edit8, %newSRDesc%
	ControlFocus, Edit8
	Return
	
ButtonPHI:
	ControlGetText, oldSRDesc, Edit8
	newSRDesc = %oldSRDesc%`n%fLineBreak%`nIdentifier:`r`n----------`n
	ControlSetText, Edit8, %newSRDesc%
	ControlFocus, Edit8
	Return
	
ButtonHL7:
	ControlGetText, oldSRDesc, Edit8
	newSRDesc = %oldSRDesc%`n%fLineBreak%`nHL7:`r`n-------`n
	ControlSetText, Edit8, %newSRDesc%
	ControlFocus, Edit8
	Return
}

return

;nodename=`hostname | cut -d "." -f -1`
;milluser=`${cer_exe}/lreg -getp \\\node\\\\${nodename}\\\domain\\\\${environment} LogonUser 2>/dev/null`
;millpass=`${cer_exe}/lreg -getp \\\node\\\\${nodename}\\\domain\\\\${environment} LogonPassword 2>/dev/null`
;echo ${milluser}"\n"${environment}"\n"${millpass}

;qc -mb -t5 -u${milluser} -d${environment} -p${millpass} | grep 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;LREGVIEW PROGRAM;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#i::
Winactivate, CWxPuTTY
Sleep, 200
send, lregview
Sleep, 200
send, {enter}
Sleep, 200
send, cd node
send, {enter}
Sleep, 200
send, dir
send, {enter}
KeyWait, LButton, D
KeyWait, LButton, U
KeyWait, LButton, D T0.5
sleep, 50
sleep, 200
Send, cd
sleep, 100
Send, {space} 
sleep, 100
Send, {shift down}
Sleep, 25
Send, {insert}
Sleep, 25
Send, {shift up}
sleep, 50
Send, {enter}
send, cd domain
send, {enter}
send, dir
send, {enter}
KeyWait, LButton, D
KeyWait, LButton, U
KeyWait, LButton, D T0.5
sleep, 200
Send, cd
sleep, 100
Send, {space} 
sleep, 100
Send, {shift down}
Sleep, 25
Send, {insert}
Sleep, 25
Send, {shift up}
Sleep, 50
ToolTip
Sleep, 50
Send, {enter}
Send, dir
Send, {enter}
Sleep, 50
Send, exit
Send, {enter}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;QC PROGRAM;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^!g::
run, Notepad.exe, C:\My Documents,, notePadPID
WinWait, ahk_pid %notepadPID%WinActivate
Sleep, 100
WinMove, ahk_class Notepad,,,,700, 200
SendInput, qc -mb -usystem -d
Sleep, 50
Text = Please double-click the environment.
Start := A_TickCount
loop
{
mousegetpos, x, y
tooltip, %Text%, (x + 20), (y + 20), 1
If ((A_TickCount - Start) > 1200)
	{
	Break
		}
	}
tooltip
KeyWait, LButton, D
KeyWait, LButton, U
KeyWait, LButton, D T0.5
Sleep, 200
Winactivate, *Untitled - Notepad
Send, %clipboard%{Space}
Sleep, 100
Winactivate, mRemoteNG
Text = Please double-click the password.
Start := A_TickCount
loop
{
mousegetpos, x, y
tooltip, %Text%, (x + 20), (y + 20), 1
If ((A_TickCount - Start) > 1200)
	{
	Break
		}
	}
tooltip
KeyWait, LButton, D
KeyWait, LButton, U
KeyWait, LButton, D T0.5
Sleep, 200
Winactivate, *Untitled - Notepad
Send, -p%clipboard%{Space}|{Space}grep{Space}
ToolTip
return

#o::
send, select *
send, {enter}
send, from code_value
send, {enter}
send, where code_value = 
return


f12::reload

^!c::Run calc.exe