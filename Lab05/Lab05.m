%% Lab05

clear all
close all
clc

addpath('include');
addpath('input');

%% Load image

for i = 1:6
    name = strcat('ur_c_s_03a_01_L_0', num2str(375+i),'.png');
    imgRGB(:,:,:,i) = imread(name);
    imgGray(:,:,i) = rgb2gray(imgRGB(:,:,:,i));
    
    if i == 1
        [x1,x2,y1,y2] =  selectArea(imgRGB(:,:,:,i));
        
        Ox = floor(.5 * (x2-x1)) + x1;
        Oy = floor(.5 * (y2-y1)) + y1;
        deltaX =  (x2-x1);
        deltaY =  (y2-y1);
        selectedArea = imgGray((Oy - (.5 * deltaY)): (Oy + (.5 * deltaY))...
            , (Ox - (.5 * deltaX)): (Ox + (.5 * deltaX)),i);
    end
%     
%     
%      [xmin, ymin, width, height,~] = ncc(imgGray(:,:,i), selectedArea);
%      
%      figure('visible', 'off'),
%      imshow(imgRGB(:,:,:,i)), title(num2str(375+i));
%      hold on 
%      plot(xmin + width, ymin + height, 'or');
%      drawrectangle('Position',[xmin+1, ymin+1, width, height]);
%      
%      F(i) = getframe;
end

% cycleNumber = 100;
% figure()
% imshow(frame2im(F(1)));
% movie(F, cycleNumber, 6);
% hold on


%% Evaluation of time taken
area = (deltaX * deltaY);
areaFactor = .1:.2:8;


c = 1;
for k = areaFactor
    deltaX = ceil(k * (x2-x1));
    deltaX = int64(deltaX);
    deltaY = ceil(k * (y2-y1));
    deltaY = int64(deltaY);
    selectedArea = imgGray((Oy - (.5 * deltaY)): (Oy + (.5 * deltaY))...
        , (Ox - (.5 * deltaX)): (Ox + (.5 * deltaX)), 6);
    [xmin, ymin, width, height,timeTaken] = ncc(imgGray(:,:,6), selectedArea);
    time(c) = timeTaken;
    n = area * k;
    npixels(c) = n;
    c = c + 1;
end

plot(npixels, time)
