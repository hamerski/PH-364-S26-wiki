----
tags:
 - Astropy
 - Astronomical tools
----

### Overview ###

The astropy package contains tools commonly used in astrophysics compuatations. It is the core of the Astropy Project, which seeks to enable the astronomical community to develop a diverse ecosystem of related packages suited for research 
in astronomy.

This document is focused on the astropy.cosmology sub-package. The tools it contains are tailored to computational astronomy, so they are very specific, BUT if you did need to calculate any of these things it is a great resource.

Important terminology: 
- A cosmology is a parameterized model used to describe the origin, structure, and evolution of the universe. 
- z is redshift.
- The Hubble Parameter represents the current expansion rate of the universe, with its value at the present time denoted as the Hubble constant (H0).
- Lookback time is the duration (measured in years) it takes for light emitted by a distant object to travel through space and reach Earth.
- Planck20XX is a cosmology representing the measured values of the CMB during year 20XX, specifically H0, omega_m (matter), and omega_A (dark energy).

First, a short overview and example of some tools.

- We can create a new FlatLambdaCDM object with arguments (Hubble Parameter, Omega_m). FlatLambdaCDM is a modeling tool which allows us to create model universes based on its two parameters.

from astropy.cosmology import FlatLambdaCDM
cosmo = FlatLambdaCDM(H0=70, Om0=0.3)
print(cosmo)

- The age function lets us determine the age of objects based on redshift. Here, we have the age of the cosmological object at z = 0 , where z is redshift. When z = 0,  we get the current age of the universe.

cosmo.age(0)

- If we know the value of a cosmological quantity and want to find the redshift which it corresponds to, we can use z_at_value() :

import astropy.units as u 
from astropy.cosmology import Planck13, z_at_value
z_at_value(Planck13.age, 2 * u.Gyr)

 Built in Cosmologies 
- A number of preloaded cosmologies are available from analyses using the WMAP and Planck satellite data.

from astropy.cosmology import Planck13  # Planck 2013 cosmology
Planck13.lookback_time(2)  

# Using the astropy.cosmology module, we want to answer the following question: How does the amount of matter in the universe affect its' expansion?

- To answer this, we can create several different "toy universes" with different amounts of matter (omega_m). We can plot these toy universes against their estimated age to explore how mass density changes the estimated age of the universe. 

import numpy as np
import matplotlib.pyplot as plt
from astropy.cosmology import FlatLambdaCDM

H0_val = 70  # Current expansion speed
z_vals = np.linspace(0, 10, 100) # Redshift range (0 is today, 10 is the past)
om_list = [0.1, 0.3, 0.5, 1.0] # Different matter densities

plt.figure(figsize=(10, 6))

for om in om_list:
    # FlatLambdaCDM assumes the rest of the universe is Dark Energy
    cosmo = FlatLambdaCDM(H0=H0_val, Om0=om)
    
    # Calculate age at different points in the past
    ages = cosmo.age(z_vals).value 
    
    # Scale Factor (Relative size of the universe)
    # a = 1 at z=0 (today)
    a = 1 / (1 + z_vals)
    
    if om == 0.3:
       plt.plot(ages, a, label=rf'Matter ($\Omega_m$) = {om} (Our Universe)', linewidth=4, color='darkred')
    else:
        plt.plot(ages, a, label=rf'Matter ($\Omega_m$) = {om}')
        # rf instead of f tells python this is a raw string and avoids the error from latex backslash

plt.axhline(1, color='gray', linestyle='--') 
plt.title("How Matter Density Affects the Age of the Universe", fontsize=14)
plt.xlabel("Time since Big Bang (Gyr)", fontsize=12)
plt.ylabel("Size of the Universe (Relative to Today)", fontsize=12)
plt.legend()
plt.grid(True)
plt.show()

# In the above chart, the dashed line represents the point at which space has been stretched in all universes an equal amount. In other words, if we look at the current distance between two points in our universe, and then move those points to another universe with a different matter density BUT which is also at the point of intersection with the dashed line, the distance is the same.

