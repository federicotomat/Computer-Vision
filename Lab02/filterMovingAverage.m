%% Moving average
% Remove the noise by using a moving average

<<<<<<< HEAD
function imgFilterAve = filterMovingAverage(srcImg, sizeK)
    K = ones(sizeK)/(sizeK^2); % kernel to make the average between neighborhood pixels
    imgFilterAve = conv2(srcImg,K,'same'); % 2D convolution
=======
function imgFilterAve = filterMovingAverage(inputImg, sizeK) 
%costruction of the agumented matrix to ignore the fact that we are
%loosing with convolution
inputImg=matrixLedger(inputImg, sizeK);
% kernel to make the average between neighborhood pixels
K = ones(sizeK)/(sizeK^2);
% 2D convolution
imgFilterAve = conv2(inputImg, K, 'same');
imgFilterAve=imgFilterAve(floor(sizeK/2):(end-floor(sizeK/2)),floor(sizeK/2):(end-floor(sizeK/2)));
>>>>>>> 66ac33d5f406e071f7290ab2e1e522f01bdf1033
end