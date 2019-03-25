%% Moving average
% Remove the noise by using a moving average

function imgFilterAve = filterMovingAverage(inputImg, sizeK) 
    % Costruction of the agumented matrix to ignore the fact that we are
    % loosing with convolution
    inputImg = matrixFramer(inputImg, sizeK);
    % Kernel to make the average between neighborhood pixels
    K = ones(sizeK)/(sizeK^2);
    % 2D convolution
    imgFilterAve = conv2(inputImg, K, 'same');
    imgFilterAve = imgFilterAve(floor(sizeK/2):(end-floor(sizeK/2)),floor(sizeK/2):(end-floor(sizeK/2)));
end