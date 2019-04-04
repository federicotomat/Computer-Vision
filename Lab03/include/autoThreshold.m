%% Auto Threshold generate function

function threshold = autoThreshold(imgInput)
     C = 0.25;
     ThreshLow = max(1,C*(mean2(imgInput)-std2(imgInput)))/255;
     ThreshHigh = min(254,C*(mean2(imgInput)+std2(imgInput)))/255;
     threshold = [ThreshLow ThreshHigh];
end


