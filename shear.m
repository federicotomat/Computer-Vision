%% Shear
% This function shears all channels input image of desired
% coefficent (shearFactor) and return the sheared image.

function trasfImg = shear(Img, shearFactorVertical, shearFactorHorizontal)

RGB = zeros(size(Img));
for i=1:3
    [row,col] = size(Img(:,:,i));
    [X,Y] = meshgrid(1:col,1:row);

    Xc = X - floor(col/2);
    Yc = Y - floor(row/2);

    Xs = Xc + shearFactorVertical * Yc + floor(col/2);
    Ys = shearFactorHorizontal * Xc + Yc + floor(row/2);
    
    RGB(:,:,i) = griddata(X,Y,double(Img(:,:,i)),Xs,Ys,'linear');
end
trasfImg = uint8(cat(3,  RGB(:,:,1),   RGB(:,:,2),   RGB(:,:,3)));