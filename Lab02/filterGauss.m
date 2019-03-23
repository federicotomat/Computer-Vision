%% Gaussian filter
% Remove the noise by using a low-pass Gaussian filter

function imgFilterGauss = filterGauss(inputImg, sizeH)
    % The half of the filter size must be three times the standard deviation
    sigma = sizeH/6;
    % Create a Gaussian filter
    H = fspecial('gaussian', sizeH, sigma); 
    % Returns a rotationally symmetric Gaussian lowpass filter of size 
    % hsize with standard deviation sigma. Not recommended.
    % Use imgaussfilt or imgaussfilt3 instead.
    figure, imagesc(H), title(['Gaussian filter image space size ', sprintf('%d',sizeH)])
    figure, surf(H), title(['Gaussian filter surface space size ', sprintf('%d',sizeH);])
    % Applying filter to the image
    imgFilterGauss = imfilter(inputImg, H);
    
    %filtered = imgaussfilt(inputImg, sigma);
    %figure, imagesc(filtered), title('Gaussian filter image space lol')
    %figure, surf(filtered), title('Gaussian filter surface space lol')
end
