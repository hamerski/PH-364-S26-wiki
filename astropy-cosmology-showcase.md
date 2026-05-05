---
tags:
- astropy
- cosmology
- redshift
- lookback-time
- comoving-distance
---

# Library: Astropy
## Module: astropy.cosmology

## Overview of the Library and Module

Astropy is a Python library desgined for astronomy and astrophysics. It includes tools for units, coordinates, time, and cosmology. The module I used, $\textbf{astropy.cosmology}$, focuses on how the universe expands over time. Normally answering questions like, how long has light been traveling, hold old was the universe when the light was emitted, or how far away the source is today, would require long calculations and definining constanst such as dark energy densities, defining matter and more. NumPy itself cannot do this, however, astropy.cosmology already contains real cosmological models, so you can give it a redshift value, and it automatically computes ages, distances, and travel times.

## Physics Question

Given a redshift, how long has the light been traveling and how far away is the source now?

## How the Module Helps Answer It
The cosmology module uses real measurements of the univere's expansion history. When i give it a redshift value, it computes lookback time, which is how long the light has been traveling, age of the unviverse when teh light was emitted, and comoving distance, which is how far away the source is today.

## Code Example


```python
import numpy as np
import matplotlib.pyplot as plt
import astropy

# Import Astropy's unit system
import astropy.units as u

# Load the Planck18 cosmology model
from astropy.cosmology import Planck18 as cosmo

z = 1100 # Redshift of Cosmic microwave background (CMB)

# Computes how long the light has been traveling
lookback = cosmo.lookback_time(z)

# Computes how old the universe was when the light left the object
age = cosmo.age(z)

# Computes the distance today to the region that emitted the CMB, accounting for expansion
distance = cosmo.comoving_distance(z)

#Conversts the distance from megaparsecs to light years using Astropy's built in unit system
distance_ly = distance.to(u.lyr)

print("How long the light we see has traveled:", lookback)
print("Age of the universe when the light was emitted", age)
print("How far it is today after the universe expanded:", distance)
print("How far it is today after the universe expanded:", distance_ly)
```

    How long the light we see has traveled: 13.786518777284867 Gyr
    Age of the universe when the light was emitted 0.0003665245339833242 Gyr
    How far it is today after the universe expanded: 13886.327957431413 Mpc
    How far it is today after the universe expanded: 45291144263.82573 lyr


## Explanation
To answer my physics question, I chose to model the CMB which has a redshift of z=1100. I used the $\textbf{astropy.cosmology}$ module with the Planck18 cosmology model. This model already contains the measured expansion history of the universe, so I can choose a redshift value and directly compute values like lookbacktime, the age of the universe at emission, and the comoving distance.

In the code above, I imported the Planck18 model (a predfined cosmology model from measured values from the Planck 2018 satellite results), and then called three fucntions: $\textbf{lookback_time(z)}$ which computes how long the light we see has been traveling for, $\textbf{age(z)}$ which computes how old the universe was when the light was emitted, and $\textbf{comoving_distance(z)}$, which computes the distance between us and the region that emitted the CMB. Then using Astropy's unit system, I used $\textbf{distance.to(u.lyr)}$ to convert the comoving distance from megaparsecs to light years.

## Interpretation of the Results and How the Module Helps

The numbers from the code match whats cosmologists measure about the early universe. A redshift of 1100 corresponds to the CMB, which is the oldest light we can observe. A lookback time of about 13.8 bilion years means these photons have been traveling toward us for almost the entire age of the universe. The age value shows that the universe was around 367,000 years when this light was released which lines up with what we know. The comoving distance is roughly 45 billion light years, which us shows how far away the region that emitted the CMB is today, and how much the universe has expanded since that time. Even though the light has been traveling for 13.8 billion years, the region that emitted it is now much further away because space itself stretched while the photons were traveling, this also lines up with known data. Overall, the output from astropy.cosmology produces simiilar quantities that observational cosmology uses to describe the early universe.

Answering this question without Astropy would require building the entire cosmology model myself. To compute thing such as lookback time or comoving distance without Astropy, I would need to write the Friedmann equation, define matter, radiation, and dark energy densities, and then integrate expressions involving the expansion rate and also handle all unit conversions myself, which could take many hours to do by hand. So instead of spending hours rebuilding the expansion history of the universe, Astropy already includes these models and equations, so i can give it a redshift and quickly get meaningful results.


```python

```
