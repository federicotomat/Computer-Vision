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
        [x1,x2,y1,y2] = selectArea(imgGray(:,:,i),1/2);
        selectedArea = imgGray(y1:y2, x1:x2,i);
       % imagesc(imgGray(y1:y2, x1:x2)), colormap gray, title('Selected Area of the image');
    end
    
    
     [xmin, ymin, width, height] = ncc(imgGray(:,:,i), selectedArea);
     
     figure('visible', 'off'),
     imshow(imgRGB(:,:,:,i)), title(num2str(375+i));
     hold on 
     plot(xmin + width, ymin + height, 'or');
     %drawrectangle('Position',[xmin+1, ymin+1, width, height]);
     
     F(i) = getframe;
end

cycleNumber = 100;
figure()
imshow(frame2im(F(1)));
movie(F, cycleNumber, 6);
hold on