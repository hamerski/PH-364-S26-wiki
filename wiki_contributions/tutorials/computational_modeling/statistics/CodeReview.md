**numpy.random.Generator.poisson**
- 

The random.Generator.poisson function from numpys random sampling library (https://numpy.org/doc/stable/reference/random/generated/numpy.random.Generator.poisson.html) can be a very usefull tool when implemented in the right way. To understand what it is we must first understand probability distributions and specifically the poisson distribution. At it's simplest, a probability distribution is a description of all possible outcomes and how likely each are for an event. There are two main types of probability distributions, discrete and continous. Discrete distributions assign probability to individual countable outcomes such as the number of heads in 100 coin flips where the sum of all the probabilities adds up to 1. Continous distributions on the other hand spread probability across an uncountable range such as the location of a quantum particle in a infinite square well. Probability is then measured in intervals computed by the area under the curve of the PDF (probability density function). A poissson distribution is dicrete distribution that answers the question-if something happens on average $\lambda$ times per interval, what is the probability of it happening k times? So for example if I know I recieve on average 5 emails per hour, what is the probability of me recieving 2 in an hour?

The formula that creates the poisson distribution for the answering this question is as follows, $P(k)=\frac{\lambda^{-k}e^{-\lambda}}{k!}$ where $\lambda$ is the average events per interval and the function gives a probability of k events happening at an interval. Below is a visualization 


```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import poisson

lam = 4                          # average rate λ
k = np.arange(0, 16)             # counts to evaluate: 0, 1, 2, ... 15
pmf = poisson.pmf(k, lam)
plt.stem(k,pmf)
plt.xlabel("# of events")
plt.ylabel("Probability")
plt.title("Poisson distribution with a lam of 4")
plt.show()
k = np.arange(0,30)
lam = 15
pmf = poisson.pmf(k, lam)
plt.stem(k,pmf)
plt.xlabel("# of events")
plt.ylabel("Probability")
plt.title("Poisson distribution with a lam of 4")
plt.show()
k = np.arange(870,1120,10)
lam = 1000
pmf = poisson.pmf(k, lam)
plt.stem(k,pmf)
plt.xlabel("# of events")
plt.ylabel("Probability")
plt.title("Poisson distribution with a lam of 4")
plt.show()
```


    
![png](CodeReview_files/CodeReview_3_0.png)
    



    
![png](CodeReview_files/CodeReview_3_1.png)
    



    
![png](CodeReview_files/CodeReview_3_2.png)
    


Now with this understanding of a poisson distribution we're able to look at random.Generator.poisson(). The first aspect to point out is the random number generator. It is most reccomended to just use numpys default generator np.random.default_rng(). Now for poisson, it has two parameters, rng.poisson(lam=1.0,size=None). Lam is simply just the value of lambda used for the distribution and size determines the output shape (single value is default). 


```python
#Example
rng=np.random.default_rng() 
counts=rng.poisson(lam=10,size=1000) #Draws 1000 values from a poisson distribution with an average of 10
b=np.arange(0,25)
plt.hist(counts,bins=b)

```




    (array([  0.,   0.,   3.,   5.,  18.,  41.,  51.,  91.,  95., 119., 142.,
            112., 112.,  73.,  53.,  42.,  19.,  13.,   3.,   4.,   2.,   2.,
              0.,   0.]),
     array([ 0.,  1.,  2.,  3.,  4.,  5.,  6.,  7.,  8.,  9., 10., 11., 12.,
            13., 14., 15., 16., 17., 18., 19., 20., 21., 22., 23., 24.]),
     <BarContainer object of 24 artists>)




    
![png](CodeReview_files/CodeReview_5_1.png)
    


rng.poisson is almost always the right call if your average rate is constant, events are independent, and you're working with discrete values. Anytime you're using a probablistic approach to a problem and those criteria are met it is a very good choice.

In our groups project the rng.poisson function was very important for determining the behavior of our model. We were modeling neutron growth and simply put we wanted our population to grow by a value of k per generation but we wanted to keep our model physically accurate by not allowing non integer values of neutron population. We did this using a branchng process using a poisson distribution as can be seen in the code below.


```python
rng=np.random.default_rng() #
def grows(N0,k,n,rng):
    N=[N0]
    for i in range(n):
        N.append(rng.poisson(k*N[i]))
    return N
N0=10
k=1.05
n=25
trials=25
gen=np.arange(n+1)
runs=np.zeros((trials,n+1))
for i in range(trials):
    runs[i]=grows(N0,k,n,rng)
    plt.plot(gen,runs[i],alpha=.1,color="gray")
plt.plot(gen,runs[-1],alpha=.1,color="gray",label="Single run of neutron population")
N=runs.mean(axis=0)
plt.plot(gen,N,label=f"Mean of {trials} runs",ls="--")
plt.legend()
plt.show()
```


    
![png](CodeReview_files/CodeReview_8_0.png)
    


The poisson distribution was the perfect tool for us in this situation. We assumed our k (average event value per generation) to be constant for each run, assumed each neutron to act independent of eachother, and we wanted to only allow integer counts for nuetrons. One thing worth noting in our use of rng.poisson is that our inital thought process is that we wanted one neutron to produce on average k neutrons per generation. Since we wanted this to happen for each neutron, instead of writing rng.poisson(k) for the amount of neutrons we can actually use the fact that it is a linear operation and use a lamda value of rng.poisson(k*N).


```python

```
