#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;Win+U for the uar function
#u::
send, uar_get_code_display(

;;;;Python executes;;;;;;;

#.:: run python C:\Users\xxxxxxx\Documents\Northwell\Northwell-Open-Engine\Utilities\specialPaste.py

:*?:cqm_details::
run python C:\Users\xxxxxxx\Documents\Northwell\Northwell-Open-Engine\Utilities\cqmDetails.py
Return

:*?:creds::
run python C:\Users\xxxxxxx\Documents\Northwell\Northwell-Open-Engine\Utilities\credentials.py

f12::reload