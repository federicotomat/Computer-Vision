addpath('include');
addpath('input');

clear all 
close all
clc

%% Computer Vision Lab 1
% Image backward warping and bilinear interpolation
%inputImg = imread('boccadasse.jpg','jpg');
inputImg = imread('flower.jpg','jpg');

%% parameter for the trasformation
xTranslation = 100;
yTranslation = 100;
resizeX = 2;
resizeY = 2;
shearX = 0.5;
shearY = 0.5;
theta = pi/3; 


%% apply the traslation
[ImgTranslated, RGBTranslated] = translation(inputImg, xTranslation, yTranslation);
printRGB(ImgTranslated, RGBTranslated, 'Translated Image');
%figure, imagesc(ImgTranslated), title('Translated Image');

%% apply the rotation
[ImgRotated, RGBRotated] = rotation(inputImg, theta);
printRGB(ImgRotated, RGBRotated, 'Rotated Image');
%figure, imagesc(ImgRotated), title('Rotated Image');

%% apply the shear
[ImgSheared, RGBSheared] = shear(inputImg, shearX, shearY);
printRGB(ImgSheared, RGBSheared, 'Sheared Image');
%figure, imagesc(ImgSheared), title('Sheared Image');

%% apply the scale
[ImgScaled, RGBScaled] = scale(inputImg, resizeX, resizeY);
printRGB(ImgScaled, RGBScaled, 'Scaled ');
%figure, imagesc(ImgScaled), title('Scaled Image');

%% Show the comparison between transformation
pairOfImages = [  inputImg, ImgTranslated ;
                ImgRotated, ImgScaled   ]; 
    
figure, imshow(pairOfImages), title('Comparison between before and after the transformation');
