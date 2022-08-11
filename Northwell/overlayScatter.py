import matplotlib.pyplot as plt
import numpy as np

A=np.loadtxt(fname = r"C:\Users\jmill\Documents\Northwell\Overlay research\scatterplot.txt")

x = A
y = A

plt.scatter(x, y)

plt.title('Patient overlay analysis')
plt.xlabel('x')
plt.ylabel('y')
plt.savefig('ScatterPlot_03.png')
plt.show()