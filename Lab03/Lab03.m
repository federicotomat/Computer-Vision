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

sigma=(1.5:0.1:2.2);
sigmaf=1.5;

threshold=(.2:.1:.8);
thresholdf=.1;

%% Laplacian of Gaussian Operator:

for i=1:length(sigma)
    g{i}=LaplacianOfGaussian(sigma(i));
    method{i}=5;
end

%printFigure(length(sigma), 2, g, method, ['Surf of Gaussin wth sigma = ',sigma])
clear method

%% Convolve Gaussian with Original Image
    
for i=1:length(sigma)
    ImgConvGaussian{i}=conv2(matrixFramer(img, size(g{i},2)), g{i}, 'same');
    ImgConvGaussian{i}= ImgConvGaussian{i}(floor(size(g{i},2)/2):(end-floor(size(g{i},2)/2)),floor(size(g{i},2)/2):(end-floor(size(g{i},2)/2)));
    method{i}=1;
end

%printFigure(length(sigma), 2,ImgConvGaussian , method, ['Image convoluted with LoG with sigma = ', sigma])
clear method

%% Zero Crossing varing sigma

for i=1:length(sigma)
    edge{i}= zeroCrossingEdgeDedector(thresholdf, ImgConvGaussian{i}) ;
    method{i}=1;
end

%printFigure(length(sigma), 2,edge , method,strcat('Edge comparison with sigma = ', num2str(sigma)))
clear method

%% Zero Crossing varing treshold

g = LaplacianOfGaussian(sigmaf);
ImgConvGaussian=conv2(matrixFramer(img, size(g,2)), g, 'same');
ImgConvGaussian= ImgConvGaussian(floor(size(g,2)/2):(end-floor(size(g,2)/2)),floor(size(g,2)/2):(end-floor(size(g,2)/2)));

for i=1:length(threshold)
    edge{i}= zeroCrossingEdgeDedector(threshold(i), ImgConvGaussian) ;
    method{i}=1;
end

%printFigure(length(sigma), 2,edge , method,strcat('Edge comparison with sigma = ', num2str(sigma)))
clear method

