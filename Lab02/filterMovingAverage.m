%% Moving average
% Remove the noise by using a moving average

function imgFilterAve = filterMovingAverage(srcImg, sizeK)
    K = ones(sizeK)/(sizeK^2); % kernel to make the average between neighborhood pixels
    imgFilterAve = conv2(srcImg,K,'same'); % 2D convolution
end