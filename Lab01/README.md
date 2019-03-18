# Image warping and Bilinear interpolation

The passage that we have used for image processing are :

* RGB Channel Separation, in order to manage the transformation individually
* Backward Warping , a processing techniques that start from final domainin order to obtain the value in original domain.
* Final Interpolation, that permits an approximation of the less value aftertransformation.
* RGB Channel Merge, to reconstruct the matrix. 

Starting from the original image we have to perform some transformationlike translation,  rotation and horizontal and vertical shear.  With our code ispossible  to  perform  a  sequence  of  different  transformation  using  the  functionimplemented from us.  
Generally, for each transformation we have to perform abackward warping of the image and then we have centered it by a manipulationof the image matrix dimension of rows and columns. Then we have applied thetransformation function with original image as input in order to obtain an output image with the desired effect. Using the <em>griddata</em> function we are able to interpolates the surface at the desiredpoints, specifies as parameters in input of the function, and return as output the interpolated values.  Then we use thecatfunction to join the matrices relativeto the three different color channels and then cast it to <em>uint8to</em> display it.
