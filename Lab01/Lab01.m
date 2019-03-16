%% Computer Vision Lab 1
% Image warping and bilinear interpolation

inputImg = imread('boccadasse.jpg','jpg');
%inputImg = imread('flower.jpg','jpg');

[r1,c1]=size(inputImg);
%figure, imagesc(inputImg), title('Original Image');

xTranslation = 12;
yTranslation = 2;
resizeX = 1;
resizeY = 1;
shearX = 0.3;
shearY = 0.25;
theta = 30;

%RGBTranslated = translation(inputImg, xTranslation, yTranslation);
%figure, imagesc(RGBTranslated), title('Translated Image');
%RGBRotated = rotation(inputImg, theta);
%figure, imagesc(RGBRotated), title('Rotated Image');
%RGBSheared = shear(inputImg, shearFactorVertical, shearFactorHorizontal);
%figure, imagesc(RGBSheared), title('Sheared Image');

%pairOfImages = [inputImg, RGBTranslated;
        %        RGBRotated, RGBSheared]; 
%figure, imshow(pairOfImages), title('Comparison between before and after');

RGBRot = BackwardWarping(inputImg, xTranslation, yTranslation, theta, resizeX, resizeY, shearX, shearY);
figure, imagesc(RGBRot), title('Rotated Image');
