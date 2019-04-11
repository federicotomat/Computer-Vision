%% Detection by Hue
function hueDetec = detectionByHue(imgInput,highTresh, lowTresh)

imgHsv = rgb2hsv(imgInput);

chHue = imgHsv(:,:,1);
chSat = imgHsv(:,:,2);
chVal = imgHsv(:,:,3);

hueDetec = chHue > lowTresh & chHue < highTresh & chSat > 0 & chVal > 0;
imshow(hueDetec)
end