---
 - libraries
 - loops
 - plotting
---
Computational physics uses computer code to create and/or test theoretical models for experimental data. For example, this might involve creating single or multidimensional arrays of model prediction data using the Numpy library and plotting this data with the experimental data using functions in the matplotlib package. To allow operations to be performed on a large set of values at once, it is necessary to work with loops or similar algorithms. Due to the often large size of datasets dealt with, considering the efficiency of a program can become an important consideration. Efficiency constraints might lead to the need to make further assumptions or simplifications of a system or require a more coarse model value spacing. An simple example that brings all of these concepts together might be creating a model for the position of an object in freefall, with some assumptions made being that the acceleration due to gravity is approximately constant and that there is no air resistance.


```python
import numpy as np
import matplotlib.pyplot as plt

g = 9.8

pos = np.zeros(100)
deltat = 0.1
v = 0

#Loop function performs many calculations of a kinematic equation to determine the position over time
for i in range(pos.size-1):
    v = v - g*deltat
    pos[i+1] = pos[i] + v*deltat

time = np.arange(0,10,0.1)

#Matplotlib library is used to graph the model result
plt.plot(time, pos)
plt.xlabel("Time (s)")
plt.ylabel("Vertical Position (m)")
```




    Text(0, 0.5, 'Vertical Position (m)')




    
![png](output_1_1.png)
    


If a dataset containing experimental position data for a falling object was collected, this dataset and the theoretical one could be compared statistically to determine the accuracy of the model. For example, the chi-square value for the model could be determined, providing information about how closely the model values match the experimental values.
