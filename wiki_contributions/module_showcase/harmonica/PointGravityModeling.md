---
tags: 
 - Gravity
 - Harmonica
---

For my midterm module showcase, I am using the point_gravity module within the harmonica library. The harmonica library works with gravity and magnetic data, and the point_gravity module in particular specializes in calculating gravitational acceleration within a set of coordinates based off point masses. The module utilizes arrays, which we have regularly worked in class with, and calculates an array of the gravitational acceleration in a specific direction based off given point masses with specified locations. It can also calculate an array of the gravitational potential in a given field. The field or plain that the module can generate can be in cartesian or spherical coordinates and will generate the acceleration in those coordinates.

The way the module works is it requires four different arguments in order to spit out an array of values:
- coordinates: A list of arrays that measures the boundaries of the gravitational field.
- points: An array, or an array of arrays that lists the coordinates of the point masses within the field.
- masses: The mass values of the respective points.
- field: This is what you want to be computed, the gravitational potential, acceleration, and also tensor components. 

There are also a few optional arguments that you can use for specific purposes:
- coordinate_system: A string that says what type of coordiantes you are using, cartesian or spherical (default is cartesian). 
- parallel: A bool that's defaulted to True which makes computations run in parallel.
- dtype: The type of data that the gravitational field is described in.

#Importing the libraries I will be using

import numpy as np
import harmonica as hm

#Defining field and point properties

x_coords = np.linspace(0, 10, 10)
y_coords = np.linspace(0, 10, 10)
X, Y = np.meshgrid(x_coords, y_coords) #What I am doing here is creating a 2D grid of points that the module can run thorugh
Z = np.zeros_like(X)
coordinates = [X.ravel(), Y.ravel(), Z.ravel()] #Here I am turning the 2D grid of arrays into 1D arrays

x_points = [3, 8]
y_points = [7, 2]
z_points = [-3, 7]
points = [x_points, y_points, z_points]

masses = [5e7, 5e7]

#Calculating the gravitational acceleration in the z-direction
    
field = hm.point_gravity(coordinates, points, masses, field="g_z")
field = np.round(field)
field = field.reshape(X.shape)
print(field)

The array that is printed out represents the gravitation acceleration going into the screen at that point on the field. It would be cool to expand on this and create an animation or visual representation of the acceleration depending on the position and masses of the points. 