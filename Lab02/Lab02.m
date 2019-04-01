clear all
close all

%% Computer Vision Lab 2
%Image filtering and Fourier Transform
%inputImg = imread('tree.png', 'png');
inputImg = imread('i235.png', 'png');
figure, imagesc(inputImg), colormap gray, title('Original image')
figure, imhist(inputImg, 256), title('Original image histogram'), xlabel('Gray scale'), ylabel('Number of pixel')
inputImg = double(inputImg);

%% Paremeter table
sigma_n = 20;
rho_n = .2;
hyper_rho = [0.2 0.2 0.2];
n_pixels = 101;
sigma_g = 5;

%% Add gaussian noise with given standard deviation
imgGauss = noiseGauss(inputImg, sigma_n);
figure, imagesc(imgGauss), colormap gray, title(['Image with Gaussian noise sigma_n=', sprintf('%f',sigma_n )])
figure, imhist(uint8(imgGauss),256), title('Image histogram with Gaussian noise'), xlabel('Gray scale'), ylabel('Number of pixel')

%% Add salt & pepper noise with given noise densit['Gauss FFT with ', n_pixels,'x', n_pixels, ' pixels and sigma=', singa_g]y
imgSP = noiseSP(inputImg, rho_n);
figure, imagesc(imgSP), colormap gray, title(['Image with salt & pepper noise rho_n= ',sprintf('%f',rho_n)])
figure, imhist(uint8(imgSP),256), title('Image histogram with salt & pepper noise'), xlabel('Gray scale'), ylabel('Number of pixel')

%% CHILI
input2 = imread('flower.jpg', 'jpg');
% figure, imagesc(input2), title('Peppah1')
input2 = double(input2);
imgPeppah = ChiliParsleyAnisePepper(input2, hyper_rho);
% figure, imagesc(imgPeppah), title('Peppah')

%% Remove gaussian noise by using a gaussian low pass filter
%3x3
[lfGaussToGauss3, gaussFilterGauss3] = filterGauss(imgGauss, 3);
figure,imagesc(lfGaussToGauss3),colormap gray,title('Applying low-pass filter to the image with gaussian noise (3x3)')
figure, imhist(uint8(lfGaussToGauss3),256), title('Low passed histogram (gaussian 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
[lfGaussToGauss7, gaussFilterGauss7] = filterGauss(imgGauss, 7);
figure,imagesc(lfGaussToGauss7),colormap gray,title('Applying low-pass filter to the image with gaussian noise (7x7)')
figure, imhist(uint8(lfGaussToGauss7),256), title('Low passed histogram (gaussian 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')


%% Remove s&p noise by using a gaussian low pass filter
%3x3
[lfGaussToSP3, gaussFilterSP3] = filterGauss(imgGauss, 3);
figure,imagesc(lfGaussToSP3),colormap gray,title('Applying low-pass filter to the image with s&p noise (3x3)')
figure, imhist(uint8(lfGaussToSP3),256), title('Low passed histogram (s&p 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
[lfGaussToSP7, gaussFilterSP7] = filterGauss(imgGauss, 7);
figure,imagesc(lfGaussToSP7),colormap gray,title('Applying low-pass filter to the image with s&p noise (7x7)')
figure, imhist(uint8(lfGaussToSP7),256), title('Low passed histogram (s&p 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')



%% Remove gaussian noise by using a moving average
%3x3
[imgAverageGauss3, filterAverageGauss3] = filterMovingAverage(imgGauss, 3);
figure,imagesc(imgAverageGauss3),colormap gray,title('Smoothing by averaging the image with gaussian noise (3x3)')
figure, imhist(uint8(imgAverageGauss3),256), title('Smoothing by averaging histogram (gaussian 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
[imgAverageGauss7, filterAverageGauss7] = filterMovingAverage(imgGauss, 7);
figure,imagesc(imgAverageGauss7),colormap gray,title('Smoothing by averaging the image with gaussian noise (7x7)')
figure, imhist(uint8(imgAverageGauss7),256), title('Smoothing by averaging histogram (gaussian 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')


%% Remove s&p noise by using a moving average
%3x3
[imgAverageSP3, filterAverageSP3] = filterMovingAverage(imgSP, 3);
figure,imagesc(imgAverageSP3),colormap gray,title('Smoothing by averaging the image with s&p noise (3x3)')
figure, imhist(uint8(imgAverageSP3),256), title('Smoothing by averaging histogram (s&p 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
[imgAverageSP7, filterAverageSP7] = filterMovingAverage(imgSP, 7);
figure,imagesc(imgAverageSP7),colormap gray,title('Smoothing by averaging the image with s&p noise (7x7)')
figure, imhist(uint8(imgAverageSP7),256), title('Smoothing by averaging histogram (s&p 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')


%% Remove the gaussian noise by using a median filter
%3x3
imgMedianFilterGauss3 = filterMedian(imgGauss, 3);
figure,imagesc(imgMedianFilterGauss3),colormap gray,title('Non-linear filter gaussian noise (3x3)')
figure, imhist(uint8(imgMedianFilterGauss3),256),title('Non-linear filter histogram (gaussian 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
imgMedianFilterGauss7 = filterMedian(imgGauss, 7);
figure,imagesc(imgMedianFilterGauss7),colormap gray,title('Non-linear filter gaussian noise 7x7)')
figure, imhist(uint8(imgMedianFilterGauss7),256),title('Non-linear filter histogram (gaussian 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')


%% Remove the noise s&p by using a median filter
%3x3
imgMedianFilterSP3 = filterMedian(imgSP, 3);
figure,imagesc(imgMedianFilterSP3),colormap gray,title('Non-linear filter s&p noise (3x3)')
figure, imhist(uint8(imgMedianFilterSP3),256),title('Non-linear filter histogram (s&p 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
imgMedianFilterSP7 = filterMedian(imgSP, 7);
figure,imagesc(imgMedianFilterSP7),colormap gray,title('Non-linear filter s&p noise (7x7)')
figure, imhist(uint8(imgMedianFilterSP7),256),title('Non-linear filter histogram (s&p 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')

%% Linear filters
[imgLinearFiltered1, method1] = linearFilters(7, inputImg, 1);
[imgLinearFiltered2, method2] = linearFilters(7, inputImg, 2);
[imgLinearFiltered3, method3] = linearFilters(7, inputImg, 3);

figure,imagesc(imgLinearFiltered3),colormap gray,title(['Linear filter of method3 ' num2str(method3)])
figure, imhist(uint8(imgLinearFiltered3),256),title(['Linear filter histogram of method3 ' num2str(method3)]), xlabel('Gray scale'), ylabel('Number of pixel')


%% Mesh of the original image
figure, mesh(inputImg),colormap gray,title('Image without FFT');

%% Shift the zero frequencies component to center of spectrum of the image
FZ = fftshift(fft2(inputImg));
figure,imagesc(abs(FZ)),colormap gray,title('Image FFT')
figure,mesh(abs(FZ)),title('Image FFT 1')

%% Shift the zero frequencies component to center of spectrum of a low-pass Gaussian filter (101x101 pixels with sigma = 5).
FH = fspecial('gaussian', n_pixels, sigma_g);
FFZ = fftshift(fft2(FH));

figure,imagesc(abs(FFZ)),colormap gray,title(['Gauss FFT with ', num2str(n_pixels),'x', num2str(n_pixels), ' pixels and sigma=', num2str(sigma_g)])
figure,mesh(abs(FFZ)),title(['Gauss FFT with ', num2str(n_pixels),'x', num2str(n_pixels), ' pixels and sigma=', num2str(sigma_g)])

%% Print all

% printFigure(4, 2, {inputImg imgGauss inputImg imgGauss}, {1, 1, 2, 2}, '1');
% printFigure(4, 2, {filterAverageSP3 gaussFilterGauss3 filterAverageSP3 gaussFilterGauss3}, {1, 1, 5, 5}, '2');
% printFigure(4, 2, {filterAverageSP7 gaussFilterGauss7 filterAverageSP7 gaussFilterGauss7}, {1, 1, 5, 5}, '3');
%  
% 
% printFigure(6, 2, {imgAverageGauss3 imgMedianFilterGauss3 lfGaussToGauss3 imgAverageGauss3 imgMedianFilterGauss3 lfGaussToGauss3}, {1, 1, 1, 2, 2, 2}, '4');
% printFigure(6, 2, {imgAverageGauss7 imgMedianFilterGauss7 lfGaussToGauss7 imgAverageGauss7 imgMedianFilterGauss7 lfGaussToGauss7}, {1, 1, 1, 2, 2, 2}, '5');
% 
% 
% printFigure(4, 2, {inputImg imgSP inputImg imgSP}, {1, 1, 2, 2}, '6');
% printFigure(6, 2, {imgAverageSP3 imgMedianFilterSP3 lfGaussToSP3 imgAverageSP3 imgMedianFilterSP3 lfGaussToSP3}, {1, 1, 1, 2, 2, 2}, '7');
% printFigure(6, 2, {imgAverageSP7 imgMedianFilterSP7 lfGaussToSP7 imgAverageSP7 imgMedianFilterSP7 lfGaussToSP7}, {1, 1, 1, 2, 2, 2}, '8');
% 
% printFigure(6, 2, {imgLinearFiltered1 imgLinearFiltered2 imgLinearFiltered3 imgLinearFiltered1 imgLinearFiltered2 imgLinearFiltered3}, {1, 1, 1, 2, 2, 2}, '9');
% 
% printFigure(4, 2, {abs(FZ) abs(FFZ) abs(FZ) abs(FFZ)}, {1, 4, 1, 4}, '10');
