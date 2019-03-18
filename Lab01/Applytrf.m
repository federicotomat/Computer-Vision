%% Applytrf
%this function aplly the inverse trasformation for each channel of the image
%and operate the bilinear interpolation

function RGB = Applytrf(Img, T)
    %inizialize RGB
    RGB = zeros(size(Img));

    %apply trasformation for each channel of the image
    for i=1:size(Img,3)
        [row,col] = size(Img(:,:,i));
        [X,Y] = meshgrid(1:col,1:row);

        %shift the center
        Xc = X - floor(col/2); 
        Yc = Y - floor(row/2);

        %apply the inverse trasformation
        [Xr,Yr] = transformPointsInverse(T,Xc,Yc);

        %take the center back to original position
        Xr=Xr+floor(col/2);
        Yr=Yr+floor(row/2);

        %operate the bilinear interpolation
        RGB(:,:,i) = griddata(X,Y,double(Img(:,:,i)),Xr,Yr,'linear');
    end 
end