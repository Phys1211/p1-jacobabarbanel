# Problem \#1  
*Altitude of a Satellite*

## Outcomes
  - <span>Write pseudocode</span>

  - <span>Write a script in MATLAB</span>

  - <span>Submit files to GitHub</span>

## Problem Statement

A satellite is to be launched into a circular orbit around the Earth so that it orbits the planet once every `T` seconds. Write a program that takes the value `T` and returns the altitude of the satellite.

## Procedure

1.  <span>Using paper and pen, show that the altitude `h` *above the Earth’s surface* the
    satellite must have is
  
   <a href="https://www.codecogs.com/eqnedit.php?latex=h&space;=&space;\left(\frac{GMT^2}{4\pi^2}\right)^{1/3}&space;-&space;R," target="_blank"><img src="https://latex.codecogs.com/gif.latex?h&space;=&space;\left(\frac{GMT^2}{4\pi^2}\right)^{1/3}&space;-&space;R," title="h = \left(\frac{GMT^2}{4\pi^2}\right)^{1/3} - R," /></a>
 
 where `G` is Newton’s gravitational constant, `M` is the mass of the Earth, and
    `R` is the radius of the Earth. </span>

2.  <span>Using paper and pen, write out pseudocode for a program that uses the period of orbit `T` to calcuate the required altitude of the satellite (in km).

3.  <span>Translate your pseudocode into MATLAB that prints the required altitude of the of the satellite.</span>

4.  <span>Propose several test cases and confirm you produce the correct answers.</span>


## Questions and Extensions

<span>Technically a geosynchronous satellite orbits the Earth once
    per **sidereal day**, which is 23.93 hours. Wait, what
    is the difference between a sidereal day and a solar day? What is
    the difference in altitude of a satellite orbiting Earth every
    sidereal day and that of a satellite orbiting every solar
    day? Try to write a program that does this calculation.</span>
