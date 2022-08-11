import pyperclip

credentialString = (
r'nodename=`hostname | cut -d "'
+ r'." -f -1`'
+ '\n'
+ r"milluser=`${cer_exe}/lreg -getp \\\node\\\\${nodename}\\\domain\\\\${environment} LogonUser 2>/dev/null`" 
+ '\n'
+ r"millpass=`${cer_exe}/lreg -getp \\\node\\\\${nodename}\\\domain\\\\${environment} LogonPassword 2>/dev/null`"
+ '\n'
+ r'echo ${milluser}"\\n"${environment}"\\n"${millpass}\\n'
+ '\n')

pyperclip.copy(credentialString)
