import matplotlib.pyplot as plt
import numpy as np
from collections import Counter

x=np.loadtxt(fname = r"C:\Users\jmill\Documents\Northwell\Overlay research\updatedPatientScore.txt")

c = Counter(x)

c_keys_list = list(c.keys())

x = c_keys_list

c_values_list = list(c.values())

y = c_values_list

print(c_keys_list)
print(c_values_list)

plt.scatter(x, y)


#print(c.items())
#print(c)

#print(x)
#print(y)

plt.show()
