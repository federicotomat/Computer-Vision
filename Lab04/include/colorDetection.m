%% Color Detection By Hue
%
%Depending of the number if input perform a color reconiction with manual
%or fixed threshold on Hue
    
function imgDetect = colorDetection(inputImg, sThresh, vThresh, hThresh)
    if nargin > 0 && nargin < 4
        if nargin < 3
            sThresh = [0.1 1];
            vThresh = [0.1 1];
        else
            sThresh = [min(sThresh) max(sThresh)];
            vThresh = [min(vThresh) max(vThresh)];
        end

        hsvI = rgb2hsv(inputImg);
        hueI = round(hsvI(:,:,1)*360); 
        satI = hsvI(:,:,2);
        valI = hsvI(:,:,3);
        threshI = (satI >= sThresh(1)) & (satI <= sThresh(2)) & (valI >= vThresh(1)) & (valI <= vThresh(2));

        imgDetect.black = (valI < vThresh(1));
        imgDetect.white = (satI < sThresh(1))&(valI >= vThresh(1));
        imgDetect.red = ((hueI <= 30) | (hueI > 330)) & threshI;
        imgDetect.yellow = ((hueI > 30) & (hueI <= 90)) & threshI;
        imgDetect.green = ((hueI > 90) & (hueI <= 150)) & threshI;
        imgDetect.cyan = ((hueI > 150) & (hueI <= 210)) & threshI;
        imgDetect.blue = ((hueI > 210) & (hueI <= 270)) & threshI;
        imgDetect.magenta = ((hueI > 270) & (hueI <= 330)) & threshI;

    elseif nargin < 5
        sThresh = [min(sThresh) max(sThresh)];
        vThresh = [min(vThresh) max(vThresh)];
        hThresh = [min(hThresh) max(hThresh)];
        
        hsvI = rgb2hsv(inputImg);
        chHue = hsvI(:,:,1);
        chSat = hsvI(:,:,2);
        chVal = hsvI(:,:,3);

        imgDetect.manual = chHue > hThresh(1) & chHue < hThresh(2) &...
                           chSat > sThresh(1) & chSat < sThresh(2) &...
                           chVal > vThresh(1) & chVal < vThresh(2);
    end  
end