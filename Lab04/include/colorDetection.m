%% Color Detection By Hue valujkjmmnnn  e
% Recognize the zones from image using hue with saturation and threshold value

% Hue (degree) for different color:
%  red = 0
%  yellow = 60
%  green = 120
%  cyan = 180
%  blue = 240
%  magenta = 300

    
function imgDetectByHue = colorDetection(inputImg, sThresh, vThresh)
    if nargin > 0
        if nargin < 3
            sThresh = [0.1 1];
            vThresh = [0.1 1];
        else
            sThresh = [min(sThresh) max(sThresh)];
            vThresh = [min(vThresh) max(vThresh)];
        end

        hsvI = rgb2hsv(inputImg);
        hueI = round(hsvI(:,:,1)*360); %Arrotondo all'intero pi� vicino
        satI = hsvI(:,:,2);
        valI = hsvI(:,:,3);
        threshI = (satI >= sThresh(1)) & (satI <= sThresh(2)) & (valI >= vThresh(1)) & (valI <= vThresh(2));

        imgDetectByHue.black = (valI < vThresh(1));
        imgDetectByHue.white = (satI < sThresh(1))&(valI >= vThresh(1));
        imgDetectByHue.red = ((hueI <= 30) | (hueI > 330)) & threshI;
        imgDetectByHue.yellow = ((hueI > 30) & (hueI <= 90)) & threshI;
        imgDetectByHue.green = ((hueI > 90) & (hueI <= 150)) & threshI;
        imgDetectByHue.cyan = ((hueI > 150) & (hueI <= 210)) & threshI;
        imgDetectByHue.blue = ((hueI > 210) & (hueI <= 270)) & threshI;
        imgDetectByHue.magenta = ((hueI > 270) & (hueI <= 330)) & threshI;

    end
end