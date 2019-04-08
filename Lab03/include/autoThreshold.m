%% Auto Threshold generate function
% Basically, this C is adjustment constant. 
% I tried many values of C, and this current value is shallo. 

function threshold = autoThreshold(imgInput)
     C = 0.1;
     ThreshLow = max(1,C*(mean2(imgInput)-std2(imgInput)))/255;
     ThreshHigh = min(254,C*(mean2(imgInput)+std2(imgInput)))/255;
     threshold = [ThreshLow ThreshHigh];
end


