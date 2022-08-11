from re import S
from turtle import color
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import legend, pie, axis, savefig, show
from matplotlib import cm


df = pd.read_csv(r'C:\Users\jmill\Documents\Northwell\Northwell-Open-Engine\Utilities\sample_data.csv')

data  = df['Number of Patients']
source = df['Source']

fig, ax = plt.subplots(figsize=(6, 3), subplot_kw=dict(aspect="equal"))

wedges, autotexts = ax.pie(data, textprops=dict(color="w"))

ax.legend(wedges, source,
            labels=source,
            title="Source",
            loc="center left",
            bbox_to_anchor=(1, 0, 0.5, 1))

plt.setp(autotexts, size=8, weight="bold")

ax.set_title = "Patient Admits by Source"

#theme = plt.get_cmap('jet')
#ax.set_prop_cycle("color", [theme(1. * )])

#axis('equal');
plt.pie(data, startangle=90);

plt.show()