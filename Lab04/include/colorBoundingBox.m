%% Detecting the car using color hue detection
% Display the images corresponding to the segmentation and the 
% related centroid and bounding box of area greater than minClusterArea.
%Depending on the number of input function has different behavior. 
%
%In any case the function clorDetection is called
%
%If all the treshold are set and the 'manual' flag is on, threshold are
%manually set by the manualTreshold function.
%
%Otherwise Fixed values for threshold are chosen.
%
%The logical image with only turn on pixel between the slected threshold
%define the area to track, on wich is printed the boxes an the
%centroids.
%
%The function returns the frame of the image with printed boxes and
%centroids and the corresponding image (logical or rgb depending on flag)

function [imgWithBox,frame] = colorBoundingBox(imgInput, color, minClusterArea, type, sThresh, vThresh, hThresh)
if nargin < 5
    imgDetect = colorDetection(imgInput, [0.5 1], [0.5 1]);
    switch color
        case 'black'
            myVar = imgDetect.black;
        case 'white'
            myVar = imgDetect.white;
        case 'red'
            myVar = imgDetect.red;
        case 'yellow'
            myVar = imgDetect.yellow;
        case 'green'
            myVar = imgDetect.green;
        case 'cyan'
            myVar = imgDetect.cyan;
        case 'blue'
            myVar = imgDetect.blue;
        case 'magenta'
            myVar = imgDetect.magenta;
        otherwise
            msg = 'Choose a valid method';
            error(msg);
    end
elseif strcmp(color, 'manual') == true
    imgDetector = colorDetection(imgInput, sThresh, vThresh, hThresh);
    myVar = imgDetector.manual;
else
    msg = 'Choose a valid method';
    error(msg);
end

if type == 0
    figure('visible', 'off'), imshow(imgInput), colormap gray;
else
    figure('visible', 'off'), imshow(myVar), colormap gray;
end
segmentation = regionprops(myVar, 'Area', 'Centroid', 'BoundingBox');

hold on
for i = 1:length(segmentation)
    if segmentation(i).Area > minClusterArea % Discard too small areas
        xC = floor(segmentation(i).Centroid(1));
        yC = floor(segmentation(i).Centroid(2));
        ul_corner_width = segmentation(i).BoundingBox;
        plot(xC, yC, '*r')
        hold on
        rectangle('Position', ul_corner_width, 'EdgeColor', [1,0,0]) % Draw red rectangle
        hold on
    end
end
%Save the the frame and make the image
frame = getframe;
imgWithBox = frame2im(frame);

close
end

