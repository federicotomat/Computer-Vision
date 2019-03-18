%% Translation
% This function translates all channels input image of desired
% xTranslation and yTranslation; with positive values of xTranslation the
% image will translate on the left and with positive values of yTranslation 
% the image will translate up.

function [transfImg, RGB] = translation(inputImg, xTr, yTr)
    %Assemble the trasformation matrix
    tras=[1   0   0;
          0   1   0;
         xTr yTr  1];

    %Make the matrix an affine2d object
    T = affine2d(tras);
    RGB = applytrf(inputImg,T);

    %cat the 3 channel
    transfImg = uint8(cat(3,  RGB(:,:,1),   RGB(:,:,2),   RGB(:,:,3)));
end