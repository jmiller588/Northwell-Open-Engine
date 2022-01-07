import pyperclip
import os

copiedText = pyperclip.paste()
splitText = copiedText.splitlines()
splitText = [x.strip(' ') for x in splitText]

listQuestion = print("""How do you want to separate your list? 
1. Commas
2. Quotes""")
question = input()

if question == "1":
    newDelim = "\n,"
    joinedString = newDelim.join(splitText)
elif question == "2":
    joinedString = '\n,'.join(f'"{w}"' for w in splitText)

pyperclip.copy(joinedString)