---
tags: 
  - io
  - waves
---

# Working with wav Files

To load .wav files in python we can use the [wave module](https://docs.python.org/3/library/wave.html) from the standard library, but that will require manual processing to get the data into a usable format. Alternatively, we can use [scipy's wavfile function](https://docs.scipy.org/doc/scipy/reference/generated/scipy.io.wavfile.read.html) to load our wave file directly into an array.

```python
from scipy.io import wavfile

sample_rate, data = wavfile.read('file.wav')

print("Sample rate:", sample_rate)
print("Array shape:", data.shape)
print("Array dtype:", data.dtype)
```

The above code will load the wave file "file.wav" as an array with the same number of dimensions as the number of audio channels. So for a mono audio file we would have a 1 by sample rate times duration array. 

## Example
For a more concrete example with the data you'll be using in class:

```python
sample_rate, data = wavfile.read('./data/banjo-mono.wav')

duration = data.shape[0] / sample_rate
time = np.linspace(0., duration, data.shape[0])

print("Sample rate:", sample_rate)
print("Array shape:", data.shape)
print("Array dtype:", data.dtype)
print("data:", data)
print("duration:", duration)
```

returns
```
Sample rate: 44100
Array shape: (132300,)
Array dtype: int16
data: [0 0 0 ... 1 0 1]
duration: 3.0
```

### Note on Directories
Note the period . in the path
```python
'./data/banjo-mono.wav'
```
That tells our code to start in the current working director, then go down one level to the /data directory, then to our file. 
