---
tags:
  - python features
  - data structure
---

## Python Dictionaries

A useful tool for programming is being able to look up information (a variable) by some identifier called a key. For example, a list or array allows you to store data in "bins" indexed by integers. To retrieve specific data from a list or array, you simply need to know the number of its position within the list. However, it can also be very useful to have a data structure where each piece of data is indexed by some other type of variable, like a string.

For a small example, let us assume you want to find the mass of a planet in our solar system by the name of the planet. One way to do this using only lists would be to make a list of planet names and a list of masses, ordered so that the name and mass of each planet have the same index in their respective lists. Then to look up the mass of a specific planet, you could search the list of names to get its numerical index, and use that to find the correct mass. An implementation of this method might look like this:

``` python
planet_names_list = ['Mercury', 'Venus', 'Earth', 'Mars',
                     'Jupiter', 'Saturn', 'Uranus', 'Neptune']
planet_masses_list = [3.301e23, 4.867e24, 5.972e24, 6.417e23,
                      1.899e27, 5.685e26, 8.682e25, 1.024e26]

def find_planet_mass(planet_name):
  if planet_name in planet_names_list:
    idx = planet_names_list.index(planet_name)
    return planet_masses_list[idx]
```

However, this is somewhat inelegant. You need to have two separate lists and a helper function to make this work. Further, if your data set gets relatively large and you have to repeat the data lookup many times, which is not an uncommon situation, then this method will run very slowly. This is beacuse each time you look up a planet name, your program has to search through the entire list of names one by one to check for a match.

Luckily, Python natively includes dictionaries as a variable type. Dictionaries are much faster than searching through lists would be because they use something called a hash function to turn keys into integers, which are then used to find the position of the data in an array. This process is implemented for you, so you don't have to worry about manually finding the data.

The previous example using dictionaries would look like this:

``` python
planet_masses = {
  'Mercury': 3.301e23,
  'Venus':   4.867e24,
  'Earth':   5.972e24,
  'Mars':    6.417e23,
  'Jupiter': 1.899e27,
  'Saturn':  5.685e26,
  'Uranus':  8.682e25,
  'Neptune': 1.024e26,
}

(Note that the two seperate lists have been combined into one dictionary, where entries are grouped as key-value pairs).

def find_planet_mass(planet_name):
  return planet_masses.get(planet_name)
```

To add entries to a dictionary, we can use the .update() method, either to merge with another existing dictionary, or with an iterable of key-value pairs. An implementation of the .update() method:

``` python
planet_masses = {
  'Mercury': 3.301e23,
  'Venus':   4.867e24,
  'Earth':   5.972e24,
  'Mars':    6.417e23,
 }
 
 new_planet_masses = {
  'Jupiter': 1.899e27,
  'Saturn':  5.685e26,
  'Uranus':  8.682e25,
  'Neptune': 1.024e26,
}

planet_masses.update(new_planet_masses)

planet_masses = {
  'Mercury': 3.301e23,
  'Venus':   4.867e24,
  'Earth':   5.972e24,
  'Mars':    6.417e23,
  'Jupiter': 1.899e27,
  'Saturn':  5.685e26,
  'Uranus':  8.682e25,
  'Neptune': 1.024e26,
}
```


Here is a list of useful syntax when working with dictionaries:
 - Initialization:    &nbsp; `dict = { key1: value1, key2: value2 }`
 - Add a value: &nbsp; `dict[key3] = value3`
 - Retrieve a value (throws an error if not found): &nbsp; `value = dict[key]`
 - Retrieve a value (returns `None` if not found):  &nbsp; `value = dict.get(key)`
