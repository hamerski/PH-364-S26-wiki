---
tags: 
 - Astropy
 - Importing Constants
 - applying units to constants
---


Using astropy you can import constants such as the gravitaitonal constant G, or the speed of light, c, that come predefined with names, units, magnitudes etc.
Relevant commands:
    import astropy as ap
    from astropy.constants import G, c
    
other constants:
[
  M_e          | 9.10938e-31 kg  |                                  ,
  M_p          | 1.67262e-27 kg  |                                  ,
  earthMass    | 5.97217e+24 kg  | M_earth, Mearth                  ,
  g            | 0.001 kg        | gram                             ,
  jupiterMass  | 1.89812e+27 kg  | M_jup, Mjup, M_jupiter, Mjupiter ,
  kg           | irreducible     | kilogram                         ,
  solMass      | 1.98841e+30 kg  | M_sun, Msun                      ,
  t            | 1000 kg         | tonne                            ,
  u            | 1.66054e-27 kg  | Da, Dalton                       ,
]
    



You can also apply units to different constants that you have defined, for example if you are defining a velocity, v = 10 m/s you can do this: 

import astropy.units as u

v = 10 * u.m/u.s    (the command u.m applies units of meters to the constant, and then dividing by u.s, converts the units of meters, to units of meters per second)



With units applied, python will keep track of these units as well as any other unit conversions that may be applied to the outputs of functions using one or more of the variables. 

You can also us it for unit conversions, for example if you want to convert the velocity v, to units of km per hour, you could use the command: v.to(u.km/u.h)

A list of standard units can be found here: https://docs.astropy.org/en/latest/units/standard_units.html
