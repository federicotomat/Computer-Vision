%% Lab05

clear all
close all
clc

addpath('include');
addpath('input');

%% Inizialize write video object

% v = VideoWriter('Images/Video/car.avi');
% v.FrameRate = 6;
% v.Quality = 95;
% 
% open(v);


%% Load image

for i = 1:6
    
    name = strcat('ur_c_s_03a_01_L_0', num2str(375+i),'.png');
    imgRGB(:,:,:,i) = imread(name);
    imgGray(:,:,i) = rgb2gray(imgRGB(:,:,:,i));
    
    if i == 1
        [x1,x2,y1,y2] =  selectArea(imgRGB(:,:,:,i));
        
        %Center of the selected rectangle
        Ox = ceil(.5 * (x2-x1)) + x1;
        Oy = ceil(.5 * (y2-y1)) + y1;
        
        %Sides of the selected rectangle
        deltaX =  (x2-x1);
        deltaX = int64(deltaX);
        
        deltaY =  (y2-y1);
        deltaY = int64(deltaY);
        
        %Area is defined starting from the center
        selectedArea = imgGray((Oy - (.5 * deltaY)): (Oy + (.5 * deltaY))...
            , (Ox - (.5 * deltaX)): (Ox + (.5 * deltaX)),i);
    end
    
     %Normalized cross correlation between the template and the target
     %image
     [xmin, ymin, width, height,~] = ncc(imgGray(:,:,i), selectedArea);
     
     %Creation of the frame for visualisation
     figure('visible', 'off'),
     imshow(imgRGB(:,:,:,i)), title(num2str(375+i));
     hold on 
     plot(xmin + width, ymin + height, 'or');
     drawrectangle('Position',[xmin+1, ymin+1, width, height]);
     F(i) = getframe;
     %writeVideo(v,F(i));
end

%close(v)

%% Evaluation of time taken

%Time analysis
[npixels, t] = timeEval(x1,x2,y1,y2, imgGray(:,:,1));

%Visualisation of the time analysis
figure()
scatter(npixels, t)
hold on
p = polyfit(npixels, t, 1);
FX = polyval(p, npixels);
plot(npixels, FX)
xlabel('Pixels number')
ylabel('Time taken (s)')

%% Creation of the gif

cycleNumber = 100;
figure()
imshow(frame2im(F(1)));
movie(F, cycleNumber, 6);
hold on