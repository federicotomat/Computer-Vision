# Image filtering and Fourier Transform

The first step of this assignment consists of adding a Gaussian noise and thena salt & pepper noise to the same input image. Regarding the gaussian noise the standard deviation assigned is equal to 20 and this variable is multiplied by a random number in order to add this specific noiseto the image.  This operation is executed inside a function called <em>noiseGauss</em>, implemented by us. With the function <em>noiseSP</em>, we add salt  pepper noise with a percentage of 20% to the image.  First of all we create a matrix called noiseMatrix through the functions <em>full</em> and <em>sprand</em> to create a random sparse uniformly distributed  non zero  matrix.   After  that  we  create  the  matrices,  called mask1 and mask2, in order to add the white and black pixels in the original image. The next step after the addition of these noises to the image requires to filter them with the following specific filters:

* Moving Average Filter,
* Low-Pass Gaussian Filter,
* Median Filter,
* Linear Filter.

For doing that we decided to use a function for each of these types of filter.

Finally for the FFT we use the function <em>fft2</em> and the <em>fftshift</em> to shift the zero-frequency component to the center of the spectrum, after this we used the <em>mesh</em> function to visualize the transformed image.
