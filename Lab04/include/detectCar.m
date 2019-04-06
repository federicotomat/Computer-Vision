%% Detecting the car
% Display the images corresponding to the segmentation and the 
% related centroid and bounding box of area greater than minClusterArea.

function detectCar(mask, imgGray, minClusterArea, method)

properties = regionprops(mask, 'Area','Centroid','BoundingBox');
figure,imagesc(imgGray),colormap gray,title(['Detected objects with method ' num2str(method)])
hold on
for i = 1:length(properties)
    if properties(i).Area > minClusterArea % Discard too small areas
        xc=floor(properties(i).Centroid(1));
        yc=floor(properties(i).Centroid(2));
        ul_corner_width=properties(i).BoundingBox;
        plot(xc,yc,'*r') % Draw red centroid as *
        hold on
        rectangle('Position',ul_corner_width,'EdgeColor',[1,0,0]) % Draw red rectangle
        hold on
    end
end