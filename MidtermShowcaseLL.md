---
tags: 
 - model fitting
---
The library I have chosen is Astropy and the module I will be focusing on is the model and fitting module using astropy.modeling.

The documentation can be found here https://docs.astropy.org/en/stable/modeling/index.html.

Astropy is a python library developed by and for astronomy (hence the name) and has many uses for astrophysics but can also be applied to other branches of physics. The motivation behind creating this library is that before it existed many researchers and groups used and maintained their own tools for tasks often seen in astrophysics such as unit mapping and conversions, coordinate tranformations, and data structure and reading tools that are relevant to physics. Astropy consolidates all these scattered pieces to one library where different groups can share and collaborate their code using the same conventions creating a standard for the field. Within this libray is the modelling and fitting module used by astropy.modeling. The idea behind the astropy.modeling module is to first introduce a model, a paramaterized mathematical function (something you define yourself); then match it to a fitter, an algorithm that adjusts the parameters from the model to best fit it to a dataset. The module comes pre installed with many predefined models that are common in physics but it also makes it straightforward to define and use custom models whenever needed.

Below is an example of using the modeling function to find a value for the gravitational constant on earth.
import numpy as np
import matplotlib.pyplot as plt
from astropy.modeling import custom_model #custom_model is a function that allows us to initialize our own model rather then use a predefined one
from astropy.modeling.fitting import LevMarLSQFitter #This imports one of the predefined fitters that uses a least squares approach

# First I'll create a dataset to simulate measurements taken from a free falling object
rng = np.random.default_rng()
heights = np.linspace(1,10,10)   # meters
true_times = np.sqrt(2 * heights / 9.81)              # seconds
measured_times = true_times + rng.normal(0, 0.05, size=heights.size) 

# Define the model: t = sqrt(2h/g), with g as the fittable parameter
def FreeFall(h, g=9.0): 
    return np.sqrt(2 * h / g)
FreeFall=custom_model(FreeFall) #By using custom_model it passes the first variable as independent variable and the rest are to be fitted
# use the fitter
fitter = LevMarLSQFitter() #This initializes the fitter
fitted = fitter(FreeFall(), heights, measured_times)

print("Fitted g = ",fitted.g.value," m/s²")
print("True g   = 9.810 m/s²")

# Plot
h = np.linspace(0.5, 11, 200)
plt.errorbar(heights, measured_times, yerr=0.05, fmt='o')
plt.plot(h , fitted(h))
plt.xlabel('Height (m)')
plt.ylabel('Fall time (s)')
plt.show()