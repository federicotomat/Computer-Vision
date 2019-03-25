%% Median filter
% Remove the noise by using a median filter

function imgMedianFilter = filterMedian(inputImg, sizeM)
    imgMedianFilter = medfilt2(inputImg, [sizeM, sizeM]);
end