addpath('include');
addpath('input');

clear all
clc
close all

imgRgb(:,:,:,1) = imread('ur_c_s_03a_01_L_0376.png');
imgRgb(:,:,:,2) = imread('ur_c_s_03a_01_L_0377.png');
imgRgb(:,:,:,3) = imread('ur_c_s_03a_01_L_0378.png');
imgRgb(:,:,:,4) = imread('ur_c_s_03a_01_L_0379.png');
imgRgb(:,:,:,5) = imread('ur_c_s_03a_01_L_0380.png');
imgRgb(:,:,:,6) = imread('ur_c_s_03a_01_L_0381.png');

for i=1:6 % Applying colorMaps to the six images
    [chHue(:,:,i), imgGray(:,:,i)] = colorMaps(imgRgb(:,:,:,i));
end

imageNumber = 1; % Select the image to recognize the red car (1= {...}0376.png)
method = 2; % Select method with different threshold
sizeFilter = 9; % Select average filter size
mask = maskHue(chHue(:,:,imageNumber), method, sizeFilter);
figure,imagesc(mask),colormap gray, title(['Final mask with method ' num2str(method)])

minClusterArea = 200; % Select a minimum for the cluster areas
detectCar(mask, imgGray(:,:,imageNumber), minClusterArea, method);