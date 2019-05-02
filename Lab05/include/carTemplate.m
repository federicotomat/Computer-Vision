%% Car Template
% Select a window around the red car on the street given the grayscale
% image and a window dimension

function carMatrix = carTemplate(imgGray, xLength, yLength)

centerX = 730; % center pixel in the x axis (in the red car)
centerY = 387; % center pixel in the y axis (in the red car)

%Calculation of the pixels for the window creation 
colTemp1 = centerX - xLength/2; 
colTemp2 = centerX + xLength/2;
rowTemp1 = centerY - yLength/2;
rowTemp2 = centerY + yLength/2;
carMatrix = imgGray(rowTemp1:rowTemp2, colTemp1:colTemp2);
