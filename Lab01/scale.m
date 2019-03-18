%% Scaling
%this function zoom the image of a desidered value
function [transfImg, RGB] = Scale(Img, cx, cy)
    %Assemble the trasformation matrix
    scale=[cx   0   0;
           0    cy  0;
           0    0   1];

    %Make the matrix an affine2d object
    T=affine2d(scale);

    RGB=Applytrf(Img,T);

    %cat the 3 channel
    transfImg = uint8(cat(3,  RGB(:,:,1),   RGB(:,:,2),   RGB(:,:,3)));
end