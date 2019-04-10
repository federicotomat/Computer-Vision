%% Detecting the car using color hue detection
% Display the images corresponding to the segmentation and the 
% related centroid and bounding box of area greater than minClusterArea.

function carDetected = colorBoundingBox(imgInput, color)
    if nargin > 0
        imgDetectByHue = colorDetectionByHue(imgInput, [0.5 1], [0.5 1]);
        figure, imshow(imgDetectByHue.red);
        %properties = regionprops(imgDetectByHue, 'Area','Centroid','BoundingBox');
    end
end

