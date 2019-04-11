%% Detection by Hue
function hueDetec = detectionByHue(imgInput,highTresh, lowTresh)

imgHsv = rgb2hsv(imgInput);

chHue = imgHsv(:,:,1);
chSat = imgHsv(:,:,2);
chVal = imgHsv(:,:,3);

hueDetec = chHue > lowTresh(1) & chHue < highTresh(1) &...
           chSat > lowTresh(2) & chSat < highTresh(2) &...
           chVal > lowTresh(3) & chVal < highTresh(3);

end