%% Rotation
% This function rotates all channels input image of desired
% theta angle and return the rotated image.

function [transfImg, RGB] = rotation(inputImg, theta)
    %Assemble the trasformation matrix
    rot=[cos(theta)     sin(theta)   0;
         -sin(theta)     cos(theta)   0;
              0              0       1];

    %Make the matrix an affine2d object
    T = affine2d(rot);

    RGB = applytrf(inputImg,T);

    %cat the 3 channel
    transfImg = uint8(cat(3,  RGB(:,:,1),   RGB(:,:,2),   RGB(:,:,3)));
end