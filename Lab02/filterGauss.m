%% Gaussian filter
% Remove the noise by using a low-pass Gaussian filter

function imgFilterGauss = filterGauss(srcImg, sizeH)

sigma = sizeH/6; % the half of the filter size must be three times the standard deviation 
H = fspecial('gaussian', sizeH, sigma); % create a Gaussian filter
figure,imagesc(H),title('Gaussian filter image')
figure,surf(H),title('Gaussian filter surface')
imgFilterGauss = imfilter(srcImg, H); % applying filter to the image