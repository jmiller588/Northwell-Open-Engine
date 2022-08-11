import matplotlib.pyplot as plt
import numpy as np
from collections import Counter

x=np.loadtxt(fname = r"C:\Users\jmill\Documents\Northwell\Overlay research\updatedPatientScore.txt")

c = Counter(x)

c_keys_list = list(c.keys())

x = c_keys_list

c_values_list = list(c.values())

y = c_values_list

plt.scatter(x, y)
plt.title('Patient overlay analysis')
plt.xlabel('Match Score')
plt.ylabel('Number of Occurrences')
plt.savefig('ScatterPlot.png')
plt.show()