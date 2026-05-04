---
tags: 
 - Model Fitting
---


Jack Seely

What would you consider to be the main concepts or themes from PH 264 or from your own experience programming/doing physics?
    How to represent data in a manner that is easily readable and understood. (ie. adding labels, legends, displaying multiple functions on the same graph so they can be more easily compared)
    
    (something I just came up with as an example of some main/fundamental concepts)
    This code could model how much energy my apartment uses throughout a 12 hour period over the course of a day where I spend most of the time on campus vs when I'm home for the whole day.
    
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(8, 20, 180)

plt.plot(x, np.cos(x/3-1)+1.15, label = 'gone for the day')
plt.plot(x, 0.2*np.cos(x/3-1)+1.75, label = 'home for the day')
plt.title('My Apartment energy usage rate throughout the day')
plt.ylabel('energy usage rate in kWHrs')
plt.xlabel('Hours of the day 8 am through 8 pm')
plt.legend()




What is an example that represents one of those concepts/themes, or what is skill needed to fully understand those concepts?
    An example might be comparing two models for a set of data. For our final we had to compare the fit of a single variable and multivariable model and choose which model best represented the data through some statistical analysis. You'd need some significant understanding of statistics, we used chi-square related statistics in the course to determine probabilities.
    
    
How can you explain that example or skill?
    A low chi-square value was preffered over a higher chi-square value, and the reduced chi-square could be used to signal whether one model is more accurately representing the data than some other model.  

In the example above modeling energy usage rate of my apartment throughout the day, I could potentially find or take some data recording the energy usage rate throughout the day, then apply and compare both models 'gone for the day' and 'home for the day' to the data collected, to see which model fits better. Or maybe neither model would fit and we would need to rethink how that relationship could be modeled mathematically.
