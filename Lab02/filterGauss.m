%% Gaussian filter
% Remove the noise by using a low-pass Gaussian filter

function [imgFilterGauss, gaussFilter] = filterGauss(inputImg, sizeH)
    % The half of the filter size must be three times the standard deviation
    sigma = sizeH/6;
    % Create a Gaussian filter
    gaussFilter = fspecial('gaussian', sizeH, sigma); 
    
    % Applying filter to the image
    imgFilterGauss = imfilter(inputImg, gaussFilter);
end
