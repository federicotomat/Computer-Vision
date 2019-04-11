%% Select the area of the picture and to compute std and Mean

function [sThresh, vThresh, hThresh] = manualThreshold(imgInput)
    figure()
    imshow(imgInput)
    uiwait(helpdlg('Select the area to track.'));  
    rect = getrect;
    
    
    %extreme poitn of rectangle
    x1 =ceil(rect(1));
    x2 = x1 + ceil(rect(3));
    y1 =ceil(rect(2));
    y2 = y1 + ceil(rect(4));
    
    %evaluate mean and standard deviation for Hue in the selected area
    imgHsv = rgb2hsv(imgInput);
    
    for i=1:3
        tmp = medfilt2(imgHsv(:,:,i));
        areaToEvaluate(:,:,i) = tmp(y1:y2, x1:x2);
        medianArea(i) = mean2(areaToEvaluate(:,:,i));
        standardDevArea(i) = std2(areaToEvaluate(:,:,i));
    end
    
    %define high treshold e lower treshold
    highTresh = medianArea + 1 * standardDevArea;
    lowTresh = medianArea - 1 * standardDevArea;
      
    sThresh = [lowTresh(2), highTresh(2)];
    vThresh = [lowTresh(3), highTresh(3)];
    hThresh = [lowTresh(1), highTresh(1)];
end