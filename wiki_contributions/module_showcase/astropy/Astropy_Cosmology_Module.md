---
tags:
 - Astropy
 - python library
---

Astropy.cosmology Module Showcase

https://docs.astropy.org/en/stable/cosmology/index.html

This module is used to help model the universe using different parameters. There are some models ready to use from research completed that give different fits based on the parameters. You can see the models that are ready to be used by using the following command.


```python
import astropy.cosmology as cos

cos.realizations.available
```




    ('WMAP1',
     'WMAP3',
     'WMAP5',
     'WMAP7',
     'WMAP9',
     'Planck13',
     'Planck15',
     'Planck18')



You can find what research each model is based off of by using the following command.


```python
from astropy.cosmology import WMAP9 as model

model.__doc__
```




    'WMAP9 instance of FlatLambdaCDM cosmology\n(from Hinshaw et al. 2013, ApJS, 208, 19, doi: 10.1088/0067-0049/208/2/19. Table 4 (WMAP9 + eCMB + BAO + H0, last column))'



Using astropy.cosmology you can test differing models and values for the parameters to see what would happen to distance, the hubble space constant, expansion of the universe and many other things.

The different models you can make are:
 - FlatLambdaCDM
 - LambdaCDM
 - FlatwCDM
 - wCDM
 - w0wzCDM
 - w0waCDM
 - wpwaCDM
 
The main model used in scientific research is FlatlambdaCDM. The CDM in all the different models stands for Cold Dark Matter. Flat in front of FlatlambdaCDM and FlatwCDM means that the universe is not curved. All the other models allow curvature of space.

To test a different model, you simply have to pick what model you'd like to use. In this case I am using LammbdaCDM to see how curvature affects the age of the universe.


```python
from astropy.cosmology import LambdaCDM
from astropy.cosmology import WMAP9 as flat

#Using a current accepted model that has flat spacetime curvature to find the age of the universe
print(flat.age(0))

#Creating a curved spacetime
curvedNeg = LambdaCDM(H0 = flat.H0, Om0 = flat.Om0, Ode0 = 0.8)
curvedPos = LambdaCDM(H0 = flat.H0, Om0 = flat.Om0, Ode0 = 0.6)

#Checking the ages of the universe with curved spacetime
print(curvedNeg.age(0))
print(curvedPos.age(0))
```

    13.76889911692932 Gyr
    14.187920609453972 Gyr
    13.293525043640935 Gyr


To determine whether or not space time is flat one will need to use this equation:

$$\Omega_k = 1 - (\Omega_m + \Omega_{de})$$

Where $\Omega_m$ is Omega matter (Om0) and $\Omega_{de}$ is Omega dark energy (Ode0) at z = 0 (No redshift in spectra) where the omega is (density)/(critical density) where critical density $\approx 9x10^{-27} kg/m^3$

When $\Omega_k$ is positive then spacetime will represent a saddle point causing the universe to expand forever.
When $\Omega_k$ is negeative then spacetime will represent a sphere and eventually collapse back down on itself.
