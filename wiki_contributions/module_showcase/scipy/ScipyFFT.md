----
tags:
 - SciPy
 - Fourier Series
----





FINAL PROJECT: Individual Code review

The tool that I'm covering is the fast fourier transformation function via the scipy library. What we encountered when adding different waveforms (ie. square, sawtooth and sin waves) was a much more noisy wavepattern. To figure out what exactly was going on we used the scipy FFT to look at the superposition of the three wavefunctions, as well as each individual wavefunction by itself. 


SYNTAX: 
    to call the FFT function you need do the following: scipy.fft.rfft(< the wavefunction you would like to analyze >)
    
We were using the fft.rfft or where we only wanted real output values of the fft function, for our analysis, since the imaginary ones just wouldn't have been useful in this case. 

when plotting the fourier function, we had to construct our frequency range based on the length of the wavefunction data being analyzed and the time duration that we were modeling, so that would the x axis of the fourier transformation plots would represent the actual frequencies present in each wavefunction using : 
FFTX = np.arange(len(sqn))/ duration


How it looked in our code: 

    #fft for Superposition

    Supn = scipy.fft.rfft(superwave)
    FFTX = np.arange(len(Supn))/ duration

    plt.figure(3)
    plt.plot(FFTX, np.abs(Supn))
    
where superwave was the defined superpostion of three wavefunctions. 


Why/What we learned: 

So one question we wanted to ask was how the beat frequency(s) of a given superposition of wavefunctions might be affected by adding different waveforms together. What we noticed was that when adding different waveforms, the superpostion became very noisy very quickly. There was a lot going on and while a general repeating pattern could be recognized fairly easily it was hard to tell how many beat frequencies were present. 

What the FFT revealed was that the square and sawtooth wavefuntions were actually already a superposition of many different frequencies. So adding a single square wave or sawtooth wave to our superposition wavefunction, meant that we weren't just adding one or two additional frequencies to the mix, rather that we were adding many frequencies at once, and by doing so, increasing the number of beat frequencies present by a much larger than expected amount. 