%% Time evaluation
%
%Function evaluating time taking for ncc algorithm.
%
%Input:
%-x1,x2,y1,y2: extreme point of the selected rectangle
%-imgGray: image in grayscale on which perform tests
%
%Output:
%-npixels: vector containig the each area on which tests are performed
%-time: time taken for each test.

function [npixels, t] = timeEval(x1,x2,y1,y2, imgGray)

%Each side will be multiplied by this factor
areaFactor = .1:.2:8;

%Center of the selected rectangle
Ox = ceil(.5 * (x2-x1)) + x1;
Oy = ceil(.5 * (y2-y1)) + y1;

%Counter of each test
c = 1;

t = zeros(1, length(areaFactor));
npixels = zeros(1, length(areaFactor));


for k = areaFactor
    
    %Sides of the rectagle
    deltaX = ceil(k * (x2-x1));
    deltaX = int64(deltaX);
    
    deltaY = ceil(k * (y2-y1));
    deltaY = int64(deltaY);
    
    %Define the area starting from the centre
    selectedArea = imgGray((Oy - (.5 * deltaY)): (Oy + (.5 * deltaY))...
        , (Ox - (.5 * deltaX)): (Ox + (.5 * deltaX)));
    
    %Cross correlation between template(selectedArea) and target
    %image(imgGray)
    [~, ~, ~, ~,timeTaken] = ncc(imgGray(:,:), selectedArea);
    
    t(c) = timeTaken;
    n = deltaX * deltaY;
    npixels(c) = n;
    
    c = c + 1;
end
npixels = double(npixels);
end