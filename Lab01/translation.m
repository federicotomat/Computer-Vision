%% Translation
% This function translates all channels input image of desired
% xTranslation and yTranslation; with positive values of xTranslation the
% image will translate on the left and with positive values of yTranslation 
% the image will translate up.

function trasfImg = translation(Img, xTr, yTr)

RGB = zeros(size(Img));
for i=1:3
    [row,col] = size(Img(:,:,i));
    [X,Y] = meshgrid(1:col,1:row);

    Xt = (X - xTr);
    Yt = (Y - yTr);
    RGB(:,:,i) = griddata(X,Y,double(Img(:,:,i)),Xt,Yt,'linear');
end
trasfImg = uint8(cat(3,  RGB(:,:,1),   RGB(:,:,2),   RGB(:,:,3)));