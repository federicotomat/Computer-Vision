%% Rotation
% This function rotates all channels input image of desired
% theta angle and return the rotated image after a cat().

function trasfImg = rotation(Img, theta)

RGB = zeros(size(Img));
for i=1:3
    [row,col] = size(Img(:,:,i));
    [X,Y] = meshgrid(1:col,1:row);

    Xc = X - floor(col/2); 
    Yc = Y - floor(row/2);

    Xr = Xc * cos(theta) - Yc * sin(theta) + floor(col/2);
    Yr = Xc * sin(theta) + Yc * cos(theta) + floor(row/2);

    RGB(:,:,i) = griddata(X,Y,double(Img(:,:,i)),Xr,Yr,'linear');
end
trasfImg = uint8(cat(3,  RGB(:,:,1),   RGB(:,:,2),   RGB(:,:,3)));