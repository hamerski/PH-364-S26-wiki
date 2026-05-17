---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.19.1
  kernelspec:
    display_name: Python 3 (ipykernel)
    language: python
    name: python3
---

This is a couple things in the MDTraj library and the hydrogen bonding module which can be located in the analysis references in the drop down menu (https://mdtraj.org/1.9.4/analysis.html). This library is used for tracking molecular trajectories which is the movement of atoms interating (for a fixed period of time) showing how the system evolves. A trajectory file (examples found here https://github.com/mdtraj/mdtraj/tree/master/docs/notebook-examples) is uploaded and stores fields that describe the system over time. The  specific module idenitifies hydrogen bonds and then calculates the distance of said bonds. One example of this library being used it

```python
import mdtraj as md
import matplotlib.pyplot as plt
import itertools
```

Then load a trajectory file (in this case a given example) into the notebook and print it out,

```python
t = md.load_pdb('http://www.rcsb.org/pdb/files/2EQQ.pdb')
print(t)
```

Next, call the function md.baker_hubbard to identity the hydrogen bonds and then print out the list of atoms

```python
hbonds = md.baker_hubbard(t, periodic=False)

label = lambda hbond : '%s -- %s' % (t.topology.atom(hbond[0]), t.topology.atom(hbond[2]))
for hbond in hbonds:
     print(label(hbond))
```

Then we can look at the distances with a historgram,

```python
da_distances = md.compute_distances(t, hbonds[:, [0,2]], periodic=False)

color = itertools.cycle(['lightGreen', 'skyBlue', 'gold'])
for i in [2, 3, 4]:
    plt.hist(da_distances[:, i], color=next(color), label=label(hbonds[i]), alpha=0.5)
plt.legend()
plt.ylabel('Freq');
plt.xlabel('distance [nm]')
```

This starts to get at the physics question I am asking. 
