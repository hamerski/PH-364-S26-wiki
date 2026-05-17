---
tags:
- python features
---

## Concept: Libraries

The first python library I want to talk about is numpy. In my experience with computational physics, I have used the numpy library in all of my projects - ranging from generating graphs in class to pulsar noise analyses in my research. Numpy is a powerful tool that allows the programmer to work with multidimensional arrays. Additionally, numpy also enables the programmer to use functions such as cosine and sine. I've also used np (particularly `np.linspace` to create a 1D array of evenly spaces values) when graphing functions for physics classes. 

Next, I think pandas is another important library in Python. Pandas is similar to numpy in the way that it allows the programmer to work with arrays, but its use case is a bit different. Pandas can import data, for example an excel spreadsheet, which becomes a useful tool for plotting data. Pandas is versatile because it can read that excel spreadsheet and then the programmer can specify exactly what data they want by using ```pd.read_excel``` and ```usecols```.

Both of these libraries are particularly useful in computational physics because physics is all about the manipulation of data and equations. I have used both of these libraries countless times throughout the physics classes I've taken at OSU. A specific example of this was in PH 411, electronics. I used pandas to import my excel spreadsheet of data I collected from the oscilloscope. In the following example code block:

```
def dampRTheory(x):
    gamma = -(0.03*300)/(2*93)
    damp = np.e**gamma
    numerator = x - 93
    denominator = x + 93
    R = damp*numerator/denominator
    return R

dampresistance = np.linspace(0, 2500, 5000)
dampamplitude = dampRTheory(dampresistance)
```

Here, I used ```np.linspace``` to define a range of 5000 evenly spaced resistance values from x = 0 until x = 2500 and ```np.e```, a built in exponential function, along with defining local variables.

## Commit Message - Week 1:
Week 1 wiki contribution -Stephanie Poole

## Commit Message - Week 3:
Updating name from "wiki_poolest_week1.md" to "numpy_and_pandas.md", updating tag to "python features" -Stephanie Poole
