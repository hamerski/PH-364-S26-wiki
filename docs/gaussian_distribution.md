---
tags: 
 - Statistics
 - Plotting
---

# Gaussian Distribution

## Introduction

Often, when modeling a situation, it is useful to randomly generate an example 
dataset when the distribution of the original variable is not known. For example, 
when considering the motion of a large sample of particles, there are many variables 
which are too computationally expensive to keep track of, so using assuming some 
distribution to model the system is helpful. The central Limit theorem states that 
the probability distribution of a random sample set converges to th Gaussian Distribution 
(also known as Normal Distribution). One will find this implies that we can take 
advantage of generating a normal distribution, either as a approximation to the actual 
distribution that we are modeling, or as a baseline to compare our modeled results to.

## Generating the Gaussian Distribution in Python

To generate a Gaussian Distribution in Python, we can use the `numpy.random.normal()` 
method in the `numpy` module. This function draws a value (or values) randomly according to the 
specified normal distribution. The first argument is `loc`, the mean of the normal 
distribution, which has a default value of `0`. The second argument is `scale`, the 
standard deviation of the normal distribution, which has a default value of `1`. The 
third argument is `shape`, which defaults to `None`, the same as not passing a `shape` 
argument. This controls the array shape of the output, and when it is `None`, it simply 
returns a scalar drawn according to the normal distribution. 