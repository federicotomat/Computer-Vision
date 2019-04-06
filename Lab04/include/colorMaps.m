%% Display images
% Display  the images in grayscale and split them in the three RGB channels and in the three HSV channel

function [chHue,imgGray] = colorMaps(imgRgb)

imgHsv = rgb2hsv(imgRgb);
imgGray = rgb2gray(imgRgb);
figure,imagesc(imgGray),colormap gray,title('Grayscale image')
chRed = imgRgb(:,:,1);
chGreen = imgRgb(:,:,2);
chBlue = imgRgb(:,:,3);
chHue = imgHsv(:,:,1);
chSat = imgHsv(:,:,2);
chValue = imgHsv(:,:,3);
figure,subplot(236)
subplot(231),imagesc(chRed),colormap gray,title('R component') % Red
subplot(232),imagesc(chGreen),colormap gray,title('G component') % Green
subplot(233),imagesc(chBlue),colormap gray,title('B component') % Blue
subplot(234),imagesc(chHue),colormap gray,title('H component') % Hue
subplot(235),imagesc(chSat),colormap gray,title('S component') % Saturation
subplot(236),imagesc(chValue),colormap gray,title('V component') % Intensity