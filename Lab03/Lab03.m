addpath('include');
addpath('input');

clear all
close all
clc

%% Read the images

imgInput = double(imread('car.bmp'));
%imgInput = double(imread('cameraman.tif'));
%imgInput = imread('boccadasse.jpg');

% Make gray the image

if size(imgInput,3) > 1
    imgInput = rgb2gray(imgInput); 
end


%% Parameters

%Chose the offset fot sigma e threshold

sigma0=.4;
t0=.3;

%Standard deviation for Gaussian
sigma =((1:0.2:2)+sigma0);
sigmaf = 2.2;

% Threshold for zero crossing
zeroCrossThreshold = ((1:0.3:2.5)+t0);
zeroCrossThresholdF = .9;

% t1 and t2 for cabby edge detector
t = autoThreshold(imgInput);

%% Laplacian of Gaussian Operator:

for i=1:length(sigma)
    gaussian{i} = laplacianOfGaussian(sigma(i));
    titles{i} = strcat(' Laplacian of Gaussian with sigma =',{' '}, num2str(sigma(i)) );
    method{i} = 5;
end

figure, surfc(laplacianOfGaussian(5)), axis on, shading flat;
printFigure(length(sigma), 2, gaussian, method, titles, 1);
% clear method;
% clear titles;

%% Convolve Gaussian with Original Image
    
for i = 1:length(sigma)
    ImgConvGaussian{i} = conv2(imgInput, gaussian{i}, 'same');%conv2(matrixFramer(imgInput, size(gaussian{i},2)), gaussian{i}, 'same');
    %ImgConvGaussian{i} = ImgConvGaussian{i}(floor(size(gaussian{i},2)/2):(end-floor(size(gaussian{i},2)/2)),floor(size(gaussian{i},2)/2):(end-floor(size(gaussian{i},2)/2)));
    titles{i} = strcat('Original convoled with LoG with sigma =', {' '}, num2str(sigma(i)) );
    method{i} = 1;
end

printFigure(length(sigma), 2, ImgConvGaussian , method, titles, 1);
% clear method;
% clear titles;

%% Zero Crossing varing sigma

for i=1:length(sigma)
    my_edge{i}= zeroCrossingEdgeDedector(zeroCrossThresholdF, ImgConvGaussian{i}) ;
    titles{i} = strcat('Zero Crossing with sigma =', {' '}, num2str(sigma(i)) );
    method{i} = 1;
end
 
printFigure(length(sigma), 2, my_edge , method, titles, 1);
% clear method;
% clear titles;

%% Zero Crossing varing treshold

ImgConvGaussianf = conv2(matrixFramer(imgInput, size(laplacianOfGaussian(sigmaf),2)), laplacianOfGaussian(sigmaf), 'same');
ImgConvGaussianf = ImgConvGaussianf(floor(size(gaussian,2)/2):(end-floor(size(gaussian,2)/2)),floor(size(gaussian,2)/2):(end-floor(size(gaussian,2)/2))); 

for i=1:length(zeroCrossThreshold)
    my_edge{i} = zeroCrossingEdgeDedector(zeroCrossThreshold(i), ImgConvGaussianf) ;
    titles{i} = strcat('Zero Crossing with sigma =',{' '}, num2str(sigmaf),{' '}, 'and threshold =',{' '}, num2str(zeroCrossThreshold(i)));
    method{i} = 1;
end

printFigure(length(zeroCrossThreshold), 2, my_edge , method, titles, 1);
% clear method;, 
% clear titles;

%% Best Zero crossing

ZC = zeroCrossingEdgeDedector(zeroCrossThresholdF, ImgConvGaussian{1});

%% Canny Edge Detector method
    
imgCanny = canny(imgInput, t(1), t(2));
% figure, imshow(imgCanny);

%% Matlab function method

%LoG
matEdgeL = edge(double(imgInput),'LoG', zeroCrossThresholdF, sigma(1));

%Canny
matEdgeC = edge(double(imgInput),'Canny');

%% Error analisys

printFigure(2, 1, {matEdgeC, imgCanny} , {3 3}, {'Matalb Marr-Hildreth implementation', 'Our Marr-Hildreth implementation'}, 1);
figure(), errorAnalisys(matEdgeC, imgCanny);

printFigure(2, 1,  {matEdgeL, ZC} , {3 3}, {'Edge implementation', 'Our Canny implementation'}, 1);
figure(), errorAnalisys(matEdgeL, ZC);
