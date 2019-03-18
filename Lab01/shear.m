%% Shear
% This function shears all channels input image of desired
% coefficent (shearFactor) and return the sheared image.

function [transfImg, RGB] = shear(inputImg, sx, sy)

    %Assemble the trasformation matrix
    shear=[1    sy  0;
           sx   1   0;
           0    0   1];

    %Make the matrix an affine2d object
    T = affine2d(shear);

    RGB = applytrf(inputImg,T);
 
    %cat the 3 channel
    transfImg = uint8(cat(3,  RGB(:,:,1),   RGB(:,:,2),   RGB(:,:,3)));
end
