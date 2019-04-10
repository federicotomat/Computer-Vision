%% Detecting the car using color hue detection
% Display the images corresponding to the segmentation and the 
% related centroid and bounding box of area greater than minClusterArea.

function imgWithBox = colorBoundingBox(imgInput, color, minClusterArea, type)
    if nargin > 0
        imgDetectByHue = colorDetection(imgInput, [0.5 1], [0.5 1]);
        switch color        
            case 'black'
                myVar = imgDetectByHue.black;
            case 'white'
                myVar = imgDetectByHue.white;
            case 'red'
                myVar = imgDetectByHue.red;
            case 'yellow'
                myVar = imgDetectByHue.yellow;
            case 'green'
                myVar = imgDetectByHue.green;
            case 'cyan'
                myVar = imgDetectByHue.cyan;
            case 'blue'
                myVar = imgDetectByHue.blue;
            case 'magenta'
                myVar = imgDetectByHue.magenta;
            otherwise
                msg = 'Chosse a valid method';
                error(msg);
        end
              
        if type == 0
            figure(), imshow(imgInput), colormap gray;
        else 
            figure(), imshow(myVar), colormap gray, title 'Bravi tutti';
        end
        segmentation = regionprops(myVar, 'Area', 'Centroid', 'BoundingBox');    
        
        hold on
        for i = 1:length(segmentation)
            if segmentation(i).Area > minClusterArea % Discard too small areas
                xC = floor(segmentation(i).Centroid(1));
                yC = floor(segmentation(i).Centroid(2));
                ul_corner_width = segmentation(i).BoundingBox;
                plot(xC, yC, '*r') % Draw centroid as *
                hold on
                rectangle('Position', ul_corner_width, 'EdgeColor', [1,0,0]) % Draw red rectangle
                hold on
            end
        end
        imgWithBox = frame2im(getframe);
        close
    end
end

