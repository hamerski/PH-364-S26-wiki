---
tags:
 - Nested loops
 - computational physics
 - numerical methods
 - modeling
---

# Code Review: Nested Loops for a Monte Carlo Simulation

Greta Varga

Computing tool: nested loops and repeated stochastic simulations

Project context: neutron multiplication project

This code review is on how nested loops were used to run some simulations of neutron population growth over multiple generations.

1. Introduction A nested loop is a structure of code where one loop is put inside another loop. This is helpful when a problem has two kinds of repetition. In our final project, the neutron multiplication model had two parts to it. We needed to move forward through multiple generations of neutron multiplication, and we needed to repeat that whole thing many times as separate trials. That means that nested loops are an obvious choice. The inner loop handles the step by step neutron growth through time, and the outer loop repeats the entire model many times.

Nested loops are super helpful when one things needs to be repeated inside another thing, you are running multiple trials of the same simulation, you need to fill a 2D array or table, you want to compare outcomes over time, or you are doing a Monte Carlo simulation.

For our project, one single run wasn't enough since the random neutron production could vary a lot. So, running many trials let us see both the average behavior and the uncertainty.

2. How to implement in code The basic structure of a nested loop is:

for trial in range(number_of_trials):

    for generation in range(number_of_generations):
    
The outer loop repeats the whole thing, the inner loop steps through time during one run. There are a few important syntax things, like both loops need a colon at the end of the for line, the code inside each loop has to be indented, the inner loop has to te indented further than the outer, the array created to store results should be made before the loops, and the first value should be in the array already before the inner loop updates.

A mistake that can happen often is resetting the results inside the wrong loop. Like if the array is created inside the outer loop, then the old trials can get erased. For this project, the results array was created before both loops, so that all trials can be saved.

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
3. Smaller example of nested loop

Before applying it to the neutron project, here is a simpler version. If we want to store a value for 3 trials and 5 generations, then we can make a 2D array where each row is one trial and each column is one generation.

trials=3
generations=5
​
values=np.zeros((trials,generations+1))
​
for trial in range(trials):
    values[trial, 0]=10
    for gen in range(generations):
        values[trial,gen+1]=values[trial,gen]+1
​
values
array([[10., 11., 12., 13., 14., 15.],
       [10., 11., 12., 13., 14., 15.],
       [10., 11., 12., 13., 14., 15.]])
In this context, values[trial, gen] chooses one entry in the table. The first index chooses the trial number, and the second index chooses the generation number.

The line, values[trial, gen + 1]=values[trial, gen]+1 uses the current generation to find the next generation. This is the same thing that we needed for the neutron population.

4. Example from our final project In our final project, the physics question was whether knowing the neutron population at one time was enough to determine the population in the future or from the past. The deterministic model was simple since every generation was calculated from the previous one with a constant multiplication factor.

But, real neutron multiplication is not exactly easy and smooth. Neutrons are discrete particles, and each generation can randomly produce more or less neutrons than we expect. So, our group also used a stochastic model. For that part, nested loops were necessary since we wanted to run many random neutron histories and compare them.

The key idea is, each row of the array stores one trial of the simulation, each column stores one generation, the outer loop moves through trials, and the inner loop moves through generations.

rng=np.random.default_rng(4)
​
N0=10 #initial neutron count
k=1.02 #average multiplication factor
n=100 #number of generations
trials=200 #number of repeated simulations
​
gen=np.arange(n+1)
runs=np.zeros((trials,n+1))
​
for trial in range(trials):
    runs[trial, 0]=N0
    for i in range(n):
        expected_next=k*runs[trial,i]
        runs[trial,i+1]=rng.poisson(expected_next)
​
runs[:5,:10]
array([[10., 17., 32., 34., 40., 49., 61., 61., 54., 59.],
       [10.,  7.,  5.,  3.,  6.,  4.,  2.,  4.,  8.,  8.],
       [10.,  5.,  6.,  7.,  6., 10.,  9.,  8., 11., 12.],
       [10.,  8.,  9.,  7.,  6.,  5.,  5.,  7.,  6.,  5.],
       [10.,  7.,  3.,  4.,  7.,  7.,  8.,  9.,  9., 12.]])
This code is the main way we used a nested loop. First, the runs=np.zeros((trials,n+1)) makes a storage array. It has 200 rows since there are 200 trials. It has 101 columns since the simulation has generation 0 and 100 later generations. Inside the outer loop, this line sets the starting value for each trial, runs[trial, 0]=N0. Inside the inner loop, this line calculates the expected number of neutrons for the next generation, expected_next=k*runs[trial,i], and then this line randomly chooses the next neutron count, runs[trial,i+1]=rng.poisson(expected_next). The i+1 is important since the code is using generation i to calculate the next generation. Without the +1, the code would overwrite the current value instead of storing the next value.

5. Why we needed to use this

Nested loops were necessary since our project was not just asking what happens in one neutron history, we wanted to know whether the model could predict or reconstruct neutron populations when randomness was included. A single random trial could be misleading, becayse it could grow quickly, die out, or fluctuate in a way that does not represent the actual behavior. By using nested loops, we could run 200 different neutron histories and then calculate statistics from all of them. So, we were able to compare the individual stochastic trials, the average of those stochastic trials, and the deterministic prediction. That comparison was needed since the deterministic model gave us a clean exponential curve, but the stochastic model shows that individual histories can vary a lot.

def deterministic_growth(N0,k,n):
    N=[N0]
    for i in range(n):
        N.append(k*N[-1])
    return np.array(N)
​
mean_run=runs.mean(axis=0)
deterministic=deterministic_growth(N0,k,n)
​
plt.figure(figsize=(9,5))
​
for trial in range(trials):
    plt.plot(gen,runs[trial],alpha=0.12)
​
plt.plot(gen,mean_run,linewidth=3,label="Mean of stochastic trials")
plt.plot(gen,deterministic,linestyle="--",linewidth=3,label="Deterministic model")
​
plt.xlabel("Generation")
plt.ylabel("Neutron count")
plt.title("Nested loops used to compare many neutron histories")
plt.legend()
plt.show()

The plot shows why those repeated trials were needed. A lot of the individual trials were noisy, but the average trend was still close to the deterministic model. This helped us see that the deterministic model gave us the expected average behavior, but it did not capture the uncertainty of the individual histories.

6. Breaking the project example up

The final project implementation could be broken down into a few smaller steps:

Step 1: Choosing the simulation settings.

The values N0, k, n, and trials define our model. In our project, N0 was the starting neutron population, k was the average multiplication factor, n was the number of generations, and trials was the number of repeated runs.

Step 2: Making a storage array

The results array had be large enough to store every trial and every generation. runs=np.zeros((trials,n+1)), the +1 is needed since generation 0 is included.

Step 3: Using the outer loop for trials

for trial in range(trials):, this repeats the whole simulation, each time the outer loop runs, a new neutron history is made.

Step 4: Use the inner loop for generations

for i in range(n):, this moves the neutron population forward one generation at a time. The last generation is used to calculate the next one.

7. Things to be careful about

There are a few details that matter when using nested loops for a simulation like this. It is important to store the initial condition before the inner loop starts. Because if runs[trial, 0]=N0 is missing, then each trial would start at zero since the array was initialized with zeros. Also, the indexing is important. Since the next generation is stored in i+1, the loop should run over range(n), not range(n+1). If the loop went to n+1, then i+1 would go past the end of the array. The storage array also should be created outside the loops. If it is inside the outer loop, the code could erase the previous trials each time a new trial starts. Nested loops can also become slow if the number of trials and generations is really big. In this project, 200 trials and 100 generations was small enough that the loop worked well. For much bigger simulations, it might be better to use something else. Finally, the loop structure should match the meaning of the model. In our case, each generation depends on the generation before it, so the inner loop has to go in order. We can't find generation 80 before generation 79, since the model depends on the previous value.

selected_generations=[20,40,60,80,100] #stats from chosen generations
rows=[]
​
for selected_gen in selected_generations:
    data=runs[:,selected_gen]
    nonzero_data=data[data!= 0]
    rows.append({
        "Generation":selected_gen,
        "Mean":round(nonzero_data.mean(),2),
        "Median":round(float(np.median(nonzero_data)),2),
        "StdDev":round(nonzero_data.std(ddof=1),2),
        "+2 SD":round(nonzero_data.mean()+2*nonzero_data.std(ddof=1),2),
        "-2 SD":round(nonzero_data.mean()-2*nonzero_data.std(ddof=1),2)
    })
​
stats_table=pd.DataFrame(rows)
stats_table
Generation	Mean	Median	StdDev	+2 SD	-2 SD
0	20	21.85	16.0	20.60	63.05	-19.34
1	40	52.09	35.0	50.86	153.81	-49.63
2	60	91.66	68.0	86.90	265.46	-82.15
3	80	151.91	131.0	136.36	424.64	-120.82
4	100	256.97	171.0	235.82	728.61	-214.67
After the nested loops make the array, we can calculate the statistics at different generations. This was another reason the nested loop was helpful. Since all the results were saved in one array, it was easy to take all trials at generation 20, generation 40, and so on. Like, runs[:,20], means all trials at generation 20. This makes it possible to calculate the mean, median, and standard deviation at whatever points.

8. Conclusion

Nested loops were a very important tool in our final project since the stochastic neutron model needed repeated simulations across many generations. The outer loop let us repeat the simulation many times, and the inner loop pushed each neutron population through time. This structure helped us move past just one random outcome and look the overall behavior of the model. By saving every trial in a 2D array, we could plot the individual histories, calculate the trends, and see the spread of possible outcomes. This definitely supported the conclusion of our projec, that the deterministic model can predict the average behavior, but the stochastic model shows that individual neutron histories are not uniquely predictable or reversible. For this project, nested loops were the perfect use, because the physics model had two dimensions, many generations inside many trials.


