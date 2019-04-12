%% Display images
% Return a vector of matrix containing HSV image, and the gray scale image

function [imgHsv,imgGray] = colorMaps(imgRgb)
imgHsv = rgb2hsv(imgRgb);
imgGray = rgb2gray(imgRgb);
end