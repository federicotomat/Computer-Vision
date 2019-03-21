%% Gaussian filter
% Remove the noise by using a low-pass Gaussian filter

function imgFilterGauss = filterGauss(srcImg, sizeH)
% the half of the filter size must be three times the standard deviation 
sigma = sizeH/6; 
% create a Gaussian filter
H = fspecial('gaussian', sizeH, sigma); 
figure,imagesc(H),title('Gaussian filter image')
figure,surf(H),title('Gaussian filter surface')
 % applying filter to the image
imgFilterGauss = imfilter(srcImg, H);
end