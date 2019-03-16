%% Computer Vision Lab 1
% Image warping and bilinear interpolation

inputImg = imread('boccadasse.jpg','jpg');
%inputImg = imread('flower.jpg','jpg');

[r1,c1]=size(inputImg);
%figure, imagesc(inputImg), title('Original Image');

xTranslation = 10;
yTranslation = 40;
shearFactorVertical = 0.2;
shearFactorHorizontal = 0.9;
theta = pi/4;

RGBTranslated = translation(inputImg, xTranslation, yTranslation);
%figure, imagesc(RGBTranslated), title('Translated Image');
RGBRotated = rotation(inputImg, theta);
%figure, imagesc(RGBRotated), title('Rotated Image');
RGBSheared = shear(inputImg, shearFactorVertical, shearFactorHorizontal);
%figure, imagesc(RGBSheared), title('Sheared Image');

pairOfImages = [inputImg, RGBTranslated;
                RGBRotated, RGBSheared]; 
figure, imshow(pairOfImages), title('Comparison between before and after');
