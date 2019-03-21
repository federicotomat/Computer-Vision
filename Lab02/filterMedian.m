%% Median filter
% Remove the noise by using a median filter

function imgMedianFilter = filterMedian(srcImg, sizeM)

imgMedianFilter = medfilt2(srcImg,[sizeM,sizeM]);
