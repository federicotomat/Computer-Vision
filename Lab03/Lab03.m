addpath('include');
addpath('input');

clear all
close all
clc

%% Read the images

%imgInput = double(imread('car.bmp'));
imgInput = double(imread('cameraman.tif'));
%imgInput = imread('boccadasse.jpg');

% Make gray the image

if size(imgInput,3) > 1
    imgInput = rgb2gray(imgInput); 
end

%% Parameters

% Standard deviation for Gaussian
sigma = (2.6:0.1:3.3);
sigmaf = .01;

% Threshold for zero crossing
zeroCrossThreshold=(.2:.1:.7);
zeroCrossThresholdF = .1;

% Lower and upper bounds for hysterisis
L = (.1:.1:.8);
H = (.2:.1:.9);
Hf = 20.1;
Lf = 20.099;

% t1 and t2 for cabby edge detector
t1 = 530;
t2 = .3;

%% Laplacian of Gaussian Operator:

for i=1:length(sigma)
    gaussian{i} = laplacianOfGaussian(sigma(i));
    method{i} = 5;
end

%printFigure(length(sigma), 2, gaussian, method, ['Surf of Gaussin wth sigma = ',sigma])
clear method

%% Convolve Gaussian with Original Image
    
for i=1:length(sigma)
    ImgConvGaussian{i}=conv2(matrixFramer(imgInput, size(gaussian{i},2)), gaussian{i}, 'same');
    ImgConvGaussian{i}= ImgConvGaussian{i}(floor(size(gaussian{i},2)/2):(end-floor(size(gaussian{i},2)/2)),floor(size(gaussian{i},2)/2):(end-floor(size(gaussian{i},2)/2)));
    method{i} = 1;
end

%printFigure(length(sigma), 2,ImgConvGaussian , method, ['Image convoluted with LoG with sigma = ', sigma])
clear method

%% Zero Crossing varing sigma

for i=1:length(sigma)
    my_edge{i}= zeroCrossingEdgeDedector(zeroCrossThresholdF, ImgConvGaussian{i}) ;
    method{i} = 1;
end

%printFigure(length(sigma), 2,my_edge , method,strcat('Edge comparison with sigma = ', num2str(sigma)))
clear method

%% Zero Crossing varing treshold

ImgConvGaussianf = conv2(matrixFramer(imgInput, size(laplacianOfGaussian(sigmaf),2)), laplacianOfGaussian(sigmaf), 'same');
ImgConvGaussianf = ImgConvGaussianf(floor(size(gaussian,2)/2):(end-floor(size(gaussian,2)/2)),floor(size(gaussian,2)/2):(end-floor(size(gaussian,2)/2)));

for i=1:length(zeroCrossThreshold)
    my_edge{i}= zeroCrossingEdgeDedector(zeroCrossThreshold(i), ImgConvGaussianf) ;
    method{i} = 1;
end

%printFigure(length(zeroCrossThreshold), 2,my_edge , method,strcat('Edge comparison with treshold = ', num2str(zeroCrossThreshold)));
clear method


%% Hysteresis Thresholding varing Sigma

for i=1:length(sigma)
    my_edge{i} = hysteresisThresolding(Hf, Lf, ImgConvGaussian{i});
    method{i} = 3;
end

%printFigure(length(sigma), 2, my_edge , method, strcat('Hysteresis Thresholding edge comparison with sigma = ', num2str(sigma)));
clear method

%% Hysteresis Thresholding varing H and L

for i=1:length(L)
    my_edge{i} = hysteresisThresolding(H(i), L(i), ImgConvGaussianf);
    method{i} = 3;
end

%printFigure(length(sigma), 2,my_edge , method, 'Hysteresis Thresholding edge comparison with varing H and L = ');
clear method

%% Sobel Edge Detector method

imgInput = imread('boccadasse.jpg');
figure, imshow(imgInput), title('Original image');
[imgSobelEdge, sobelGradient] = sobel(imgInput);

figure, imshow(sobelGradient), title('Sobel Gradient');
figure, imshow(imgSobelEdge), title('Edge detected Image with sobel gradient');

%% Matlab function method

imgInput = imread('boccadasse.jpg');
%Show input image
%figure, imshow(imgInput), title('Original image');

if size(imgInput,3) > 1
    imgInput = rgb2gray(imgInput);
end
matEdge = edge(imgInput);
figure, imshow(matEdge), title('Metodo semi-furbo del signor Matlab')

%matEdge = double(edge(imgInput,'LoG'));
%figure, imagesc(matEdge), colormap gray;

%% Canny Edge Detector method

imgInput = double(imgInput);
%Value for Thresholding
%ThreshLow = 0.075;
%ThreshHigh = 0.175;
    
threshold = autoThreshold(imgInput);
%First Method
imgCanny1st = canny(imgInput, threshold(1), threshold(2));
figure, imshow(imgCanny1st), title('Metodo figo mio <3')

%Second Methos
imgCanny2nd = cannyEdgeDetector(imgInput, t1, t2);
figure, imagesc(cannyEdgeDetector(imgInput, t1, t2)), colormap gray, title('Metodo del cazzo di Giò');

%% Comparison between 3 methods

%Bisognerebbe metterle tutte a imshow, cosi le riscala giuste, per vedere
%le singole scommentare sopra

%printFigure(3, 1, {matEdge imgCanny1st imgCanny2nd}, {3 3 3}, 'Comparison');
%% Error analisys

errorAnalisys(matEdge, imgCanny1st);
errorAnalisys(matEdge, imgCanny2nd);

