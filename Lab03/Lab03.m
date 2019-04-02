clear all
clc
close all

%% Read the images

img = double(imread('car.bmp'));
% img = double(imread('cameraman.tif'));
% img = imread('boccadasse.jpg');
% img = rgb2gray(img); % If the image is not in grayscale

figure, imagesc(img),colormap gray, 
title('Original image')

%% Log

sigma = 3; % Standard deviation for the Gaussian
threshold = 0.05; % Threshold for the edge detection

laplacianMatrix = LoG(sigma);

figure, imagesc(laplacianMatrix),colormap gray, 
title(['Laplacian of Gaussian Operator with standard deviation ' num2str(sigma)])
figure, surf(laplacianMatrix), 
title(['Laplacian of Gaussian Operator surface with standard deviation ' num2str(sigma)])

convMatrix = conv2(img, laplacianMatrix, 'same');
figure, imagesc(convMatrix),colormap gray, 
title(['Convolution image with the Laplacian of Gaussian with standard deviation ' num2str(sigma)])

method = 2; % Select the method for the edge detection
edgeMatrix = LoGEdgeDetection(threshold, convMatrix, method);
edgeMatrix2 = edge(img, 'log', sigma, threshold);

figure, imagesc(edgeMatrix),  colormap gray, 
title (['Edge detection with method ' num2str(method) ', Gaussian with standard deviation ' num2str(sigma) ' and threshold ' num2str(threshold)]);
figure, imagesc(edgeMatrix2),  colormap gray, 
title (['Edge detection with matlab function edge(), Gaussian with standard deviation ' num2str(sigma) ' and threshold ' num2str(threshold)]);