%% Select the area of the picture and to compute std and Mean

function [highTresh, lowtresh] = manualTrehsold(img)
    imshow(img)
    rect = getrect(img);
    close img
    
    %a, b, c, d vertex of the renctangle
    a = [ceil(rect(1)), ceil(rect(2))];
    b = [a(1)+ceil(rect(3)),a(2)];
    c = [b(1), b(2)+ceil(rect(4))];
    d = [a(1), c(2)];
    
    %evaluate mean and standard deviation for Hue in the selected area
    imgHsv = rgb2hsv(img);
    areaToEvalute = imgHsv(a(1):b(1),a(2):c(2),1);
    
    m = mean2(areaToEvaluate);
    s = std2(areaToEvaluate);
    
    %define high treshold e lower treshold
    highTresh = m + .5*s;
    lowtresh= m - .5*s;
    

end