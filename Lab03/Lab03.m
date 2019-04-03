clear all
close all

%% Read the images

%img = double(imread('car.bmp'));
%img = double(imread('cameraman.tif'));
img = imread('boccadasse.jpg');

%make gray image

if size(img,3)>1
    img = rgb2gray(img); 
end

%figure, imagesc(img),colormap gray, 
%title('Original image')

%% Parameters

%standard deviation for Gaussian
sigma=(1.1:0.1:1.8);
sigmaf=2.5;

%treshold for zero crossing
threshold=(.2:.1:.7);
thresholdf=.1;

%Lower and upper bounds for hysterisis
L=(.1:.1:.8);
H=(.2:.1:.9);
Hf=14.1;
Lf=14.09;

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


%% Zero Crossing varing sigma

for i=1:length(sigma)
    my_edge{i}= zeroCrossingEdgeDedector(thresholdf, ImgConvGaussian{i}) ;
end

%printFigure(length(sigma), 2,my_edge , method,strcat('Edge comparison with sigma = ', num2str(sigma)))

%% Zero Crossing varing treshold

ImgConvGaussianf=conv2(matrixFramer(img, size(LaplacianOfGaussian(sigmaf),2)), LaplacianOfGaussian(sigmaf), 'same');
ImgConvGaussianf= ImgConvGaussianf(floor(size(g,2)/2):(end-floor(size(g,2)/2)),floor(size(g,2)/2):(end-floor(size(g,2)/2)));

for i=1:length(threshold)
    my_edge{i}= zeroCrossingEdgeDedector(threshold(i), ImgConvGaussianf) ;
end

%printFigure(length(threshold), 2,my_edge , method,strcat('Edge comparison with treshold = ', num2str(threshold)))


%% Hysteresis Thresholding varing sigma
for i=1:length(sigma)
    my_edge{i}= hysteresisTrhesolding(Hf,Lf, ImgConvGaussian{i});
   
end
%printFigure(length(sigma), 2, my_edge , method, strcat('Hysteresis Thresholding edge comparison with sigma = ', num2str(sigma)))
figure()
imagesc(my_edge{1}),colormap gray;
%% Hysteresis Thresholding varing H and L
for i=1:length(L)
    my_edge{i}= hysteresisTrhesolding(H(i),L(i), ImgConvGaussianf);
    method{i}=1;
end

%printFigure(length(sigma), 2,my_edge , method, 'Hysteresis Thresholding edge comparison with varing H and L = ')
clear method

%% Comparison with matlab function

mat_edge=edge(img);
figure(),imshow(mat_edge);