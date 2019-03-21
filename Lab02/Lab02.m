clear all
close all

%% Computer Vision Lab 2
%Image filtering and Fourier Transform
inputImg = imread('tree.png', 'png');
%inputImg = imread('i235.png', 'png');
figure, imagesc(inputImg), colormap gray, title('Original image')
figure, imhist(inputImg, 256), title('Original image histogram'), xlabel('Gray scale'), ylabel('Number of pixel')
inputImg = double(inputImg);
%% Paremeter table
sigma_n=20;
rho_n=.2;
hyper_rho = [0.2 0.2 0.2];
n_pixels=101;
sigma_g=5;

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
figure, imagesc(input2), title('Peppah1')
input2 = double(input2);
imgPeppah = ChiliParsleyAnicePepper(input2, hyper_rho);
figure, imagesc(imgPeppah), title('Peppah')

%% Remove gaussian noise by using a gaussian low pass filter
%3x3
lfGauss3 = filterGauss(imgGauss, 3);
figure,imagesc(lfGauss3),colormap gray,title('Applying low-pass filter to the image with gaussian noise (3x3)')
figure, imhist(uint8(lfGauss3),256), title('Low passed histogram (gaussian 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
lfGauss7 = filterGauss(imgGauss, 7);
figure,imagesc(lfGauss7),colormap gray,title('Applying low-pass filter to the image with gaussian noise (7x7)')
figure, imhist(uint8(lfGauss7),256), title('Low passed histogram (gaussian 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')

%% Remove s&p noise by using a gaussian low pass filter

%3x3
lfGauss3 = filterGauss(imgGauss, 3);
figure,imagesc(lfGauss3),colormap gray,title('Applying low-pass filter to the image with s&p noise (3x3)')
figure, imhist(uint8(lfGauss3),256), title('Low passed histogram (s&p 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
lfGauss7 = filterGauss(imgGauss, 7);
figure,imagesc(lfGauss7),colormap gray,title('Applying low-pass filter to the image with s&p noise (7x7)')
figure, imhist(uint8(lfGauss7),256), title('Low passed histogram (s&p 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')

%% Remove gaussian noise by using a moving average
%3x3
imgAverageGauss3 = filterMovingAverage(imgGauss, 3);
figure,imagesc(imgAverageGauss3),colormap gray,title('Smoothing by averaging the image with gaussian noise (3x3)')
figure, imhist(uint8(imgAverageGauss3),256), title('Smoothing by averaging histogram (gaussian 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
imgAverageGauss7 = filterMovingAverage(imgGauss, 7);
figure,imagesc(imgAverageGauss7),colormap gray,title('Smoothing by averaging the image with gaussian noise (7x7)')
figure, imhist(uint8(imgAverageGauss7),256), title('Smoothing by averaging histogram (gaussian 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')

%% Remove s&p noise by using a moving average
%3x3
imgAverageSP3 = filterMovingAverage(imgSP, 3);
figure,imagesc(imgAverageSP3),colormap gray,title('Smoothing by averaging the image with s&p noise (3x3)')
figure, imhist(uint8(imgAverageSP3),256), title('Smoothing by averaging histogram (s&p 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
imgAverageSP7 = filterMovingAverage(imgSP, 7);
figure,imagesc(imgAverageSP7),colormap gray,title('Smoothing by averaging the image with s&p noise (7x7)')
figure, imhist(uint8(imgAverageSP7),256), title('Smoothing by averaging histogram (s&p 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')

%% Remove the gaussian noise by using a median filter
%3x3
imgMedianFilter3 = filterMedian(imgGauss, 3);
figure,imagesc(imgMedianFilter3),colormap gray,title('Non-linear filter gaussian noise (3x3)')
figure, imhist(uint8(imgMedianFilter3),256),title('Non-linear filter histogram (gaussian 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
imgMedianFilter7 = filterMedian(imgGauss, 7);
figure,imagesc(imgMedianFilter7),colormap gray,title('Non-linear filter gaussian noise 7x7)')
figure, imhist(uint8(imgMedianFilter7),256),title('Non-linear filter histogram (gaussian 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')

%% Remove the noise s&p by using a median filter
%3x3
imgMedianFilter3 = filterMedian(imgSP, 3);
figure,imagesc(imgMedianFilter3),colormap gray,title('Non-linear filter s&p noise (3x3)')
figure, imhist(uint8(imgMedianFilter3),256),title('Non-linear filter histogram (s&p 3x3)'), xlabel('Gray scale'), ylabel('Number of pixel')

%7x7
imgMedianFilter7 = filterMedian(imgSP, 7);
figure,imagesc(imgMedianFilter7),colormap gray,title('Non-linear filter s&p noise (7x7)')
figure, imhist(uint8(imgMedianFilter7),256),title('Non-linear filter histogram (s&p 7x7)'), xlabel('Gray scale'), ylabel('Number of pixel')

%% Linear filters
[imgLinearFiltered, method] = linearFilters(7, inputImg, 3);
figure,imagesc(imgLinearFiltered),colormap gray,title(['Linear filter of method ' num2str(method)])
figure, imhist(uint8(imgLinearFiltered),256),title(['Linear filter histogram of method ' num2str(method)]), xlabel('Gray scale'), ylabel('Number of pixel')

%% Mesh of the original image
figure,mesh(inputImg),title('Image without FFT')

%% Shift the zero frequencies component to center of spectrum of the image
FZ = fftshift(fft2(inputImg));
figure,imagesc(abs(FZ)),colormap gray,title('Image FFT')
figure,mesh(abs(FZ)),title('Image FFT')

%% Shift the zero frequencies component to center of spectrum of a low-pass Gaussian filter (101x101 pixels with sigma = 5).
FH = fspecial('gaussian', n_pixels, sigma_g);
FFZ = fftshift(fft2(FH));
figure,imagesc(abs(FFZ)),colormap gray,title(['Gauss FFT with ', num2str(n_pixels),'x', num2str(n_pixels), ' pixels and sigma=', num2str(sigma_g)])
figure,mesh(abs(FFZ)),title(['Gauss FFT with ', num2str(n_pixels),'x', num2str(n_pixels), ' pixels and sigma=', num2str(sigma_g)])