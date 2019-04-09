%% Display images
% Display  the images in grayscale and split them in the three RGB channels and in the three HSV channel

function [imgHsv,imgGray] = colorMaps(imgRgb)

%
imgHsv = rgb2hsv(imgRgb);
imgGray = rgb2gray(imgRgb);

end