clearvars
clc
close all

imgRgb1 = imread('ur_c_s_03a_01_L_0376.png');
imgGray1 = rgb2gray(imgRgb1); % Convert to grayscale the image

figure,imagesc(imgGray1),colormap gray,title('ur c s 03a 01 L 0376') 

imgGray1 = double(imgGray1); % Convert to double the image

colCar = 112; % X dimension of the template
rowCar = 100; % Y dimension of the template
method = 2;

carMatrix = carTemplate(imgGray1, rowCar, colCar);

[xCorner, yCorner, colMax, rowMax] = templateMatching(imgGray1, carMatrix, method);

figure, imagesc(imgGray1), colormap gray
hold on
rectangle('Position',[xCorner yCorner colCar rowCar],'EdgeColor',[1,0,0])
hold on
plot(colMax, rowMax, 'r*') 
title(['Template matching with dimension ' num2str(colCar) 'x' num2str(rowCar) ' computed with method ' num2str(method)])