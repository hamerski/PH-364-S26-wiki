---
tags:
 - Plotting
---
# Plotting Interactive Scatter Plots in 3D

## Overview
If your data is best represented as points in 3 dimensional space, the plotly express scatter_3d function is a simple way to display it visually.
To add the function to your notebook or code, install the plotly module to your workspace using:
>pip install plotly

in the terminal for your directory. Then, once plotly is installed, add the express function to your notebook by using:
```python
import plotly.express as px
```
Now, the scatter plot function can be used as:
```python
fig = px.scatter_3d()
```
Information reguarding the function can be found on the plotly website, or https://plotly.com/python-api-reference/generated/plotly.express.scatter_3d

---
## Example
Here is an example of using px.scatter_3d() to plot 3d grid of equally spaced points that is N units in length.

``` python
import plotly.express as px
import pandas as pd
import numpy as np

N=5
grid = np.zeros([N**3,3])

n = 0
for i in range(N):
    for j in range(N):
        for k in range(N):
            grid[n, 0:3] = (i, j, k)
            n += 1
            
df = pd.DataFrame(grid, columns=['x','y','z'])

fig = px.scatter_3d(df, x='x', y='y', z='z')

fig.update_layout(
    scene=dict(
        xaxis=dict(range=[-1, N]),
        yaxis=dict(range=[-1, N]),
        zaxis=dict(range=[-1, N]),
        aspectmode='cube'
    )
)

fig.show()
```
The function takes specific data types to understand the points correctly, so in this example I use pandas to label each column of my array so that the plot can understand where to put each point on the graph. If you have positional 3d data, you can label the columns as x, y, z for plotly to interepret.

update_layout is used to change the axis and aspect ratio of the plot. I chose a range of -1 to N so that the grid of points does not lay on the axis planes to improve visibility.



