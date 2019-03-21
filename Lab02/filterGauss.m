%% Gaussian filter
% Remove the noise by using a low-pass Gaussian filter

function imgFilterGauss = filterGauss(srcImg, sizeH)
    % the half of the filter size must be three times the standard deviation
    sigma = sizeH/6;
    % create a Gaussian filter
    H = fspecial('gaussian', sizeH, sigma);
    f=sprintf('%d',sizeH);
    figure,imagesc(H),title(['Gaussian filter image space size ', f])
    figure,surf(H),title(['Gaussian filter surface space size ', f])
    % applying filter to the image
    imgFilterGauss = imfilter(srcImg, H);
end