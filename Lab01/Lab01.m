clear all 
close all

%% Computer Vision Lab 1
% Image backward warping and bilinear interpolation
%inputImg = imread('boccadasse.jpg','jpg');
inputImg = imread('flower.jpg','jpg');

%% parameter for the trasformation
xTranslation = 100;
yTranslation = 100;
resizeX = 0.5;
resizeY = 1;
shearX = 0.5;
shearY = 0.5;
theta = pi/3;

%% apply the traslation
[ImgTranslated, RGBTranslated] = Translation(inputImg, xTranslation, yTranslation);
PrintRGB(ImgTranslated, RGBTranslated, 'Translated Image');
%figure, imagesc(ImgTranslated), title('Translated Image');

%% apply the rotation
[ImgRotated, RGBRotated] = Rotation(inputImg, theta);
PrintRGB(ImgRotated, RGBRotated, 'Rotated Image');
%figure, imagesc(ImgRotated), title('Rotated Image');

%% apply the shear
[ImgSheared, RGBSheared] = Shear(inputImg, shearX, shearY);
PrintRGB(ImgSheared, RGBSheared, 'Sheared Image');
%figure, imagesc(ImgSheared), title('Sheared Image');

%% apply the scale
[ImgScaled, RGBScaled] = Scale(inputImg, resizeX, resizeY);
PrintRGB(ImgScaled, RGBScaled, 'Scaled Image');
%figure, imagesc(ImgScaled), title('Scaled Image');

%% Show the comparison between transformation
pairOfImages = [  inputImg, ImgTranslated ;
                RGBRotated, RGBSheared   ]; 
    
figure, imshow(pairOfImages), title('Comparison between before and after the transformation');