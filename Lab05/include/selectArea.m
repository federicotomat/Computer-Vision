%% Select Area
function [x1,x2,y1,y2] = selectArea(imgGray, factor)

figure()
imshow(imgGray)
uiwait(helpdlg('Select the area to track.'));
rect = getrect;
close

%extreme poitn of rectangle
x1 = ceil(factor * ceil(rect(1)));
x2 = ceil(factor * (x1 + ceil(rect(3))));
y1 = ceil(factor * (ceil(rect(2))));
y2 = ceil(factor * (y1 + ceil(rect(4))));



% O = [int((x2-x1)/2) int((y2-y1)/2)];
% 
% colTemp1 = O(1) - xLength/2; 
% colTemp2 = O(1) + xLength/2;
% rowTemp1 = O(2) - yLength/2;
% rowTemp2 = O(2) + yLength/2;

end