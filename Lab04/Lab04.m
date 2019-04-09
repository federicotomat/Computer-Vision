addpath('include');
addpath('input');

clear all
clc
close all

%% Load image
for i = 1:6
name = strcat('ur_c_s_03a_01_L_0', num2str(375+1),'.png');
imgRGB(:,:,:,i) = imread(name);
end

%% RGB and HSI

for i=1:6
    [imgHSI(:,:,:,i), imgray(:,:,i)] = colorMaps(imgRGB(:,:,:,i));
    title{i} = {['Hue for image number ' num2str(375+i)], ['Saturation for image number ' num2str(375+i)], ...
               ['Value for image number ' num2str(375+i)], ['Red for image number ' num2str(375+i)],...
              ['Green for image number ' num2str(375+i)], ['Blue for image number ' num2str(375+i)]};
    printFigure(6, 3, {imgHSI(:,:,1,i),imgHSI(:,:,2,i),imgHSI(:,:,3,i),...
        imgRGB(:,:,1,i),imgRGB(:,:,2,i),imgRGB(:,:,3,i)} , {1 1 1 1 1 1}, title{i}, 1)
    
end
    
for i=1:3
% Hue-Saturation-Value
 
printFigure(6, 3, {imgHSI(:,:,i,1),imgHSI(:,:,i,2),imgHSI(:,:,i,3),...
        imgHSI(:,:,i,4),imgHSI(:,:,i,5),imgHSI(:,:,i,6)} , {1 1 1 1 1 1}, {title{1}{i}, title{2}{i},title{3}{i}, title{4}{i},title{5}{i},title{6}{i}}, 1);

    
% Red-Green-Blue
 
printFigure(6, 3, {imgRGB(:,:,i,1),imgRGB(:,:,i,2),imgRGB(:,:,i,3),...
        imgRGB(:,:,i,4),imgRGB(:,:,i,5),imgRGB(:,:,i,6)} , {1 1 1 1 1 1}, {title{1}{3+i}, title{2}{3+i},title{3}{3+i},title{4}{3+i},title{5}{3+i},title{6}{3+i}}, 1);

end




%% 


% imageNumber = 1; % Select the image to recognize the red car (1= {...}0376.png)
% method = 2; % Select method with different threshold
% sizeFilter = 9; % Select average filter size
% mask = maskHue(chHue(:,:,imageNumber), method, sizeFilter);
% figure,imagesc(mask),colormap gray, title(['Final mask with method ' num2str(method)])
% 
% minClusterArea = 200; % Select a minimum for the cluster areas
% detectCar(mask, imgGray(:,:,imageNumber), minClusterArea, method);