%% Lab07

clear all;
close all;
clc

addpath('include')
addpath('input')

% UNCOMMENT THE APPROPRIATE SLICE OF CODE TO TEST NEW EXAMPLES

% I1=imread('rds_L.jpg'); 
% I2=imread('rds_R.jpg'); 
% d=[-6 10];

% I1=imread('parkmeter.l.jpg'); 
% I2=imread('parkmeter.r.jpg'); 
% d=[2 18];

% I1=imread('corridor_l_original.jpg'); 
% I2=imread('corridor_r_original.jpg'); 
% disp=[2 18];

I1=imread('Dino_L.png'); 
I2=imread('Dino_R.png'); 
disparity = [0 16];

if (size(I1,3)==3)
    I1=rgb2gray(I1);
    I2=rgb2gray(I2);
end


% Sum of Squares
d = my_ssd(I1, I2);
fprintf("The result of my_ssd is: %f", d);

% Display the images after rectification.
figure; imshowpair(I1,I2,'ColorChannels','red-cyan'),title('Images after rectification');

% Disparity function
disparityMap = my_disparity(I1, I2, 15, disparity(1), disparity(2));
figure; imshow(mat2gray(disparityMap)),title('bella raga');

% % Disparity Final function
% disparityMap = my_disparity_final(I1, I2, 15, disp(1), disp(2)); 
% 
% % realmax('single') returns the largest finite floating-point number in IEEE single precision.
% marker_idx = (disparityMap == -realmax('single'));
% disparityMap(marker_idx) = min(disparityMap(~marker_idx));
%  
% % Show the disparity map. Brighter pixels indicate objects which are
% % closer to the camera.
% figure; imshow(mat2gray(disparityMap)), title('Final disparity map');
% colormap jet; colorbar;