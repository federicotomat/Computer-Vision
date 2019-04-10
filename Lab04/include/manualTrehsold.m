%% Select the area of the picture and to compute std and Mean

function [highTresh, lowtresh] = manualTrehsold(imgInput)
    
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
    areaToEvaluate = imgHsv(y1:y2, x1:x2, 1);
    
    m = mean2(areaToEvaluate);
    s = std2(areaToEvaluate);
    
    %define high treshold e lower treshold
    highTresh = m + .1*s;
    lowtresh= m - .1*s;
    

end