%% Detection by Hue
function hueDetec = detectionByHue(imgInput)

imgHsv = rgb2hsv(imgInput);
chHue = imgHsv(:,:,1);
[highTresh, lowTresh] = manualTrehsold(imgInput);

hueDetec = chHue > lowTresh & chHue < highTresh;

imshow(hueDetec)
end