Stephanie Poole

---
tags:
    - wiki contribution
---

## Concept: Libraries

This is a bit of a broad concept, but I have a couple different libraries I wanted to talk about. First off being numpy. In my experience with computational physics, I have used the numpy library in all of my projects - ranging from generating graphs in class to pulsar noise analyses in my research. Numpy is a powerful tool that allows the programmer to work with multidimensional arrays. Additionally, numpy also enables the programmer to use functions such as cosine and sine which has been useful when I want to plot an equation that uses cosine and sine. I've also used np (particularly `np.linspace`) when graphing functions for a physics class. `np.linspace` defines a range of evenly spaced independent-variable values over an interval. 

Next, I think pandas is another important library in Python. Pandas is similar to numpy in the way that it allows the programmer to work with arrays, but its use case is a bit different. Long before I knew that pandas existed, I would take data from an excel spreadsheet and plug it in by hand into a numpy array. Unfortunately when one has a large dataset, this method becomes inefficient and nigh impossible. Pandas can create these arrays for you by directly importing an excel spreadsheet, for example. Pandas is versatile because it can read that excel spreadsheet and then the programmer can specify exactly what data they want by using `pd.read_excel` and `usecols`.

Both of these libraries are particularly useful in computational physics because physics is all about the manipulation of data and equations, which numpy and pandas allow you to do. I have used both of these libraries countless times throughout the physics classes I've taken at OSU. A specific example of this was in PH 411, electronics. I used pandas to import my excel spreadsheet of data I collected from the oscilloscope. In the following example code block:
`def dampRTheory(x):
    gamma = -(0.03*300)/(2*93)
    damp = np.e**gamma
    numerator = x - 93
    denominator = x + 93
    R = damp*numerator/denominator
    return R

dampresistance = np.linspace(0, 2500, 5000)
dampamplitude = dampRTheory(dampresistance)`
I used `np.linspace` to define a range of 5000 evenly spaced resistance values from x = 0 until x = 2500. I also used `np.e` which allowed me to make calculations with the mathematical "e" irrational number.

## Commit Message:
Week 1 wiki contribution -Stephanie Poole