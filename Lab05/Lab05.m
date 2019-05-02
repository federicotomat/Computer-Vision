clear all
close all
clc

addpath('include');
addpath('input');

%% Paramether
% xLenght = 112;
% yLenght = 100;

%% Load image

for i = 1:6
    name = strcat('ur_c_s_03a_01_L_0', num2str(375+i),'.png');
    imgRGB(:,:,:,i) = imread(name);
    imgGray(:,:,i) = rgb2gray(imgRGB(:,:,:,i));
    
    if i == 1
        [x1,x2,y1,y2] = selectArea(imgGray(:,:,i));
        selectedArea = imgGray(y1:y2, x1:x2,i);
        imagesc(imgGray(y1:y2, x1:x2)), colormap gray, title('Selected Area of the image');
    end
    
    ncc
end


