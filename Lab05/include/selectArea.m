%% Select Area
function [x1,x2,y1,y2] = selectArea(imgRGB)

figure()
imshow(imgRGB)
uiwait(helpdlg('Select the area to track.'));
rect = getrect;
close

%extreme poitn of rectangle
x1 = ceil(rect(1));
x2 = x1 + ceil(rect(3));
y1 =  ceil(rect(2));
y2 =  y1 + ceil(rect(4));

end