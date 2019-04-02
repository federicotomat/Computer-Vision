clear all
close all

%% Read the images

img = double(imread('car.bmp'));
% img = double(imread('cameraman.tif'));
%img = imread('boccadasse.jpg');

%make gray image

if size(img,3)>1
    img = rgb2gray(img); 
end

%figure, imagesc(img),colormap gray, 
%title('Original image')

%% Parameters

sigma=(1:0.5:4.5);
H=250;
L=10;

%% Laplacian of Gaussian Operator:

for i=1:length(sigma)
    g{i}=LaplacianOfGaussian(sigma(i));
    method{i}=5;
end
%printFigure(length(sigma), 2, g, method, 'From 1 to 4 with step 1 LoG comparison')
clear method

%% Convolve Gaussian with Original Image
    
for i=1:length(sigma)
    ImgConvGaussian{i}=conv2(matrixFramer(img, size(g{i},2)), g{i}, 'same');
    ImgConvGaussian{i}= ImgConvGaussian{i}(floor(size(g{i},2)/2):(end-floor(size(g{i},2)/2)),floor(size(g{i},2)/2):(end-floor(size(g{i},2)/2)));
    method{i}=1;
end

%printFigure(length(sigma), 2,ImgConvGaussian , method, 'From 1 to 4 with step 1 Image convoluted with LoG compariso%%n')
clear method

%% Zero Crossing



