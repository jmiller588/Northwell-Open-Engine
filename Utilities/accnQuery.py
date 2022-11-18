########################
#accession query program
########################

import pyperclip as p

baseAccn = "Blank Accession"

#use copied text to grab unformatted accession
baseAccn = p.paste()
#replace hyphens with asteriks for the query
newAccn = baseAccn.replace("-","*")
#assemble query from the accession
accnQuery = ('select * from accession_order_r where accession = "*' + newAccn + '*" go')

p.copy(accnQuery)