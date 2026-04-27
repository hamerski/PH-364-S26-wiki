---
tags:
-Plotting
---

PH264_Overview -

I would say that the main themes of computional physics is statistics and coding. A lot of the coding that we went over in PH264 was centered around the numpy and matplotlib libraries. These libraries allow mathmatical calculations and plotting. Combining these two libraries we were able to do a lot of statistics with Chi-Sqaure values to find the best approximations.Example code might look like the following:

import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(0, 100, 1000)
y = np.sin(t)

plt.figure()
plt.plot(t, y)
plt.title("Sin(x) Graph")
plt.xlabel("Time (s)")

etc...
