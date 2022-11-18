#auto-qc

import pyperclip as p
import subprocess
import tkinter as tk

user = "invalid input"
env = "invalid input"
passw = "invalid input"

copiedText = pyperclip.paste()
splitText = copiedText.splitlines()
for i in splitText:
    if i[0:6] == "Enviro":
        env = (i.split('=')[1]).strip()
    elif i[0:6] == "LogonU":
        user = (i.split('=')[1]).strip()
    elif i[0:6] == "LogonP":
        passw = (i.split('=')[1]).strip()
    else:
        pass
		
command = ('qc -mb - u' + user + ' d' + env + ' p' + passw)

p.copy(command)