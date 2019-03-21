%% Gaussian filter
% Remove the noise by using a low-pass Gaussian filter

function imgFilterGauss = filterGauss(inputImg, sizeH)
    % The half of the filter size must be three times the standard deviation
    sigma = sizeH/6;
    % Create a Gaussian filter
    H = fspecial('gaussian', sizeH, sigma);
    figure, imagesc(H), title(['Gaussian filter image space size ', sprintf('%d',sizeH)])
    figure, surf(H), title(['Gaussian filter surface space size ', sprintf('%d',sizeH);])
    % Applying filter to the image
    imgFilterGauss = imfilter(inputImg, H);
end
