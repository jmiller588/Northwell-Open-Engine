import pyperclip

copiedText = pyperclip.paste()
splitText = copiedText.splitlines()

print(splitText)

joinedString = "\n,".join(splitText)

print(joinedString)

pyperclip.copy(joinedString)