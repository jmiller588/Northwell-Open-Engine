#auto-qc

import pyperclip as p
import subprocess
import tkinter as tk

user = "invalid input"
domain = "invalid input"
passw = "invalid input"

copiedText = p.paste()
splitText = copiedText.splitlines()

user = splitText[0]
domain = splitText[1]
passw = splitText[2]

command = ('qc -mb -u' + user + ' -d' + domain + ' -p' + passw)

p.copy(command)