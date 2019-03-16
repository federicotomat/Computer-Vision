%% Rotation
% This function rotates all channels input image of desired
% theta angle and return the rotated image after a cat().

function trasfImg = BackwardWarping(Img, xTranslation, yTranslation, theta, resizeX, resizeY, shearX, shearY)

Transformation = [resizeX*cosd(theta)     shearY*sind(theta)   0;
                  -shearX*sind(theta)    resizeY*cosd(theta)   0;
                         xTranslation           yTranslation   1];
              
T = maketform ( 'affine' , Transformation);

RGB = zeros(size(Img));
for i=1:3
    [row,col] = size(Img(:,:,i));
    [X, Y] = meshgrid(1:col,1:row);
    
    Xc = X - floor(col/2); 
    Yc = Y - floor(row/2);
 
   [Xr, Yr] = tforminv(T, Xc, Yc);

    Xr = Xr + floor(col/2);
    Yr = Yr + floor(row/2);
    
    RGB(:,:,i) = griddata(X,Y,double(Img(:,:,i)),Xr,Yr,'linear');
end
trasfImg = uint8(cat(3,  RGB(:,:,1),   RGB(:,:,2),   RGB(:,:,3)));