---
tags:
 - plotting
 - python features
---

One of the main themes of computional physics is statistics and coding, and a lot of the coding that we went over in PH264 was centered around the numpy and matplotlib libraries. These libraries allow mathmatical calculations and plotting. Combining these two libraries we were able to do a lot of statistics with Chi-Sqaure values to find the best approximations. Example code might look like the following:
``` python
import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(0, 100, 1000)
y = np.sin(t)

plt.figure()
plt.plot(t, y)
plt.title("Sin(x) Graph")
plt.xlabel("Time (s)")
```
To import a library you might want to use that isn't already integrated into Jupyter Notebook, simply access your home directories terminal and enter the command 

 pip install package_name

This will allow you to call the libraries in your code similarly as before:
``` python
 import package_name as nickname
```
Sometimes, certain libraries require another method of unpacking such as cobra or mamba. These functionally work the same as pip, and the installation process will typically be described in the libraries website.
