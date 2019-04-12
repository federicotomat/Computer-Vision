addpath('include');
addpath('input');

clear all
close all
clc

%% Load image

for i = 1:6
    name = strcat('ur_c_s_03a_01_L_0', num2str(375+i),'.png');
    imgRGB(:,:,:,i) = imread(name);
end

clear name

%% Paramether

imgType = 0;
method ='red';

FileName = 'images/gifs/car_red_bw.gif';

delayTime = 0.2;

%% RGB and HSV

%Show all the channel for each figure and all the comparison, commented for
%practicality, all the figure generated are saved in the images folder

% for i=1:6
%     [imgHSV(:,:,:,i), imgray(:,:,i)] = colorMaps(imgRGB(:,:,:,i));
%     title{i} = {['Hue for image number ' num2str(375+i)],   ['Saturation for image number ' num2str(375+i)], ...
%                 ['Value for image number ' num2str(375+i)], ['Red for image number ' num2str(375+i)],...
%                 ['Green for image number ' num2str(375+i)], ['Blue for image number ' num2str(375+i)]};
%     
%     
%     printFigure(6, 3, {imgHSV(:,:,1,i),imgRGB(:,:,1,i),imgHSV(:,:,2,i),...
%                       imgRGB(:,:,2,i), imgHSV(:,:,3,i),imgRGB(:,:,3,i)} , {3 3 3 3 3 3}, {title{i}(1),title{i}(4),title{i}(2),...
%                                                                                           title{i}(5),title{i}(3),title{i}(6)}, 0) 
%                                                                                       
% end
%  
% 
% 
% for i=1:3
% % Hue-Saturation-Value
%  
% printFigure(6, 3, {imgHSV(:,:,i,1),imgHSV(:,:,i,2),imgHSV(:,:,i,3),...
%                    imgHSV(:,:,i,4),imgHSV(:,:,i,5),imgHSV(:,:,i,6)} , {3 3 3 3 3 3}, {title{1}{i}, title{2}{i},title{3}{i},...
%                                                                                       title{4}{i},title{5}{i},title{6}{i}}, 0);
% 
% % Red-Green-Blue
% printFigure(6, 3, {imgRGB(:,:,i,1),imgRGB(:,:,i,2),imgRGB(:,:,i,3),...
%                    imgRGB(:,:,i,4),imgRGB(:,:,i,5),imgRGB(:,:,i,6)} , {3 3 3 3 3 3}, {title{1}{3+i}, title{2}{3+i},title{3}{3+i},...
%                                                                                       title{4}{3+i},title{5}{3+i}, title{6}{3+i}}, 10);
%                                                                                                                                                                 
% end
% 
% uiwait(helpdlg('Select ok to continue, all images will be closed.'));
% close all;

%% Create gif
% by default the gif runs 100 times

makeGif(imgRGB, delayTime, FileName, 'manual', 0);


