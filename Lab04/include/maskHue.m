%% Studying the hue values for red pixels
% Select in the Hue channel the area corresponding to the red car. In this 
% area compute the mean (mean) and the standard deviation (stdDev) of the values. 
% Then segment the red car in the image by thresholding the Hue component.

function mask = maskHue(chHue, method, sizeFilter)

switch method
    
    case 1 % fixed threshold
        mask = chHue(:,:,1)>0.98 ; 
        
    case 2 % threshold calculation and average filtering
        areaRedCar = chHue(395:400, 710:740); % select red car area
        mean = mean2(areaRedCar);
        stdDev = std2(areaRedCar);
        thresholdSlow = mean - 0.2*stdDev;
        thresholdHigh = mean + 2*stdDev;
        mask = chHue > thresholdSlow & chHue < thresholdHigh;
        figure,imagesc(mask),colormap gray, title('Mask after first threshold')
        K = ones(sizeFilter)/sizeFilter^2; % create average filter
        mask = conv2(mask, K);
        figure,imagesc(mask),colormap gray,title(['Mask after average filtering with size ' num2str(sizeFilter) 'x' num2str(sizeFilter)])
        thresholdSlow = mean - 0.5*stdDev;
        mask = mask > thresholdSlow & mask < thresholdHigh;
        
    otherwise
        disp('ERROR: Insert method 1 or 2')
        return
end