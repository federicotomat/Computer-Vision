%% Detection by Hue
function hueDetec = detectionByHue(imgInput,highTresh, lowTresh)

imgHsv = rgb2hsv(imgInput);
chHue = imgHsv(:,:,1);

hueDetec = chHue > lowTresh & chHue < highTresh;

imshow(hueDetec)
end