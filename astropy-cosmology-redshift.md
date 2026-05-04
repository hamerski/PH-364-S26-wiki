---
tags:
 - astrophysics
 - python library
 - numpy
 - plotting
 - data-analysis
---

# Exploring Cosmology with Astropy (`astropy.cosmology`)

Library: Astropy

Module: astropy.cosmology

## Sources
Astropy Cosmology Documentation: https://docs.astropy.org/en/stable/cosmology/index.html

Astropy Documentation: https://docs.astropy.org/en/stable/

Astropy paper: https://arxiv.org/abs/1307.6212

Built in models: https://docs.astropy.org/en/latest/cosmology/realizations.html

## Overview 
The astropy.cosmology module is used to model the large scale structure and the expansion of the universe. It has built in cosmological models that are based off of real observational data, like Planck measurements. This module can be used to compute important quantities like: expansion rate of the universe, the distance to galaxies at redshifts, as well as the age of the universe at different times. Redshift itself is one of the biggest observables since it tells us how much expansion has happened since light was emitted. But, converting redshift to distance or time is not easy. The built in models use things like the Hubble constant as parameters, and the module does all the math numerically, instead of having to do super complicated integrals by hand, which makes it much easier to take on these kinds of real astrophysics problems.

## Example
```python
import astropy
import numpy as np
import matplotlib.pyplot as plt
from astropy.cosmology import Planck18,WMAP9

z=np.linspace(0,5,100) #creating a range of redshift values

d_planck=Planck18.luminosity_distance(z) #luminosity distance for 2 cosmological models
d_wmap=WMAP9.luminosity_distance(z)

age_planck=Planck18.age(z) #age of universe at each redshift
age_wmap=WMAP9.age(z)

H_planck=Planck18.H(z) #Hubble parameter at each redshift
H_wmap=WMAP9.H(z)

plt.figure() #luminosty distance vs redshift
plt.plot(z,d_planck,label="Planck18")
plt.plot(z,d_wmap, "--",label="WMAP9")
plt.xlabel("Redshift(z)")
plt.ylabel("Luminosity Distance")
plt.title("Luminosity Distance vs Redshift")
plt.legend()
plt.show()

plt.figure() #age of universe vs redshift
plt.plot(z,age_planck,label="Planck18")
plt.plot(z,age_wmap, "--",label="WMAP9")
plt.xlabel("Redshift(z)")
plt.ylabel("Age of Universe")
plt.title("Age of Universe vs Redshift")
plt.legend()
plt.show()

plt.figure() #Hubble parameter vs redshift
plt.plot(z,H_planck,label="Planck18")
plt.plot(z,H_wmap, "--",label="WMAP9")
plt.xlabel("Redshift(z)")
plt.ylabel("Hubble Parameter")
plt.title("Expansion Rate vs Redshift")
plt.legend()
plt.show()
```
## Explanation
I used Planck18 and WMAP9 since they are 2 different built in cosmological models within astropy. They are both based off of real observational data, but they use different values for parameters. So, you can compare how changing the model changes the physical relationship of redshift. I first made an array of redshift values from 0 to 5, 0 represents current universe, and higher than that represents objects further away and back in time. I then calculated three things. First, the luminosity distance, which tells us how far away an object seems to be based on the brightness. The plot shows that as redshift increases, the luminosity distance increases quickly. The second thing was the age of the universe. This tells us how old the universe was when the light was emitted, and as the redshift increases, the age decreases. So, we are looking into the history of the universe. The last thing was the Hubble parameter. This tells us the expansion rate of the universe at different redshifts, and the plot shows higher expansion rate at high redshift.

So overall, this shows that redshift itself is not enough to know the age or distance of a galaxy. We also need some kind of cosmological model to relate redshift to some kind of physical quantity. Since I compared Planck18 and WMAP9, I saw that the different models gave me similar trends, but not the same values. This is important to note because differences in parameters, even if small, like the Hubble constant, can change the estimate of how far away a galaxy is or how old the universe was when light was emitted. This library and module helped me connect redshift to things like cosmic expansion and history of the universe.

## Key Takeaways
- Redshift alone doesn't determine distance or age  
- Cosmological models are needed to interpret observations  
- Different models give similar trends but different values  
