from time import time
import pyperclip
import pyautogui
import time

copiedText = pyperclip.paste()

formattedText = ('select c.create_dt_tm,c.*' + '\r\n' + 'from cqm_fsieso_que c' + '\r\n' + 
'where c.queue_id in (' + '\r\n' + 'select f.queue_id' + '\r\n' + 
'from fsieso_que_details f' + '\r\n' + 'where f.parent_entity_id = ' + copiedText + ')' + '\r\n' + 
'order by c.create_dt_tm' + '\r\n' + 'with format(date,";;")' + '\r\n')

pyperclip.copy(formattedText)
