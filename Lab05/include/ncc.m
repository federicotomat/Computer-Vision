%% Normalized cross correltion

function [xmin, ymin, width, height, timeSpent]= ncc(targetImage, template)

t = cputime;
c = normxcorr2(template,targetImage);
[ypeak, xpeak] = find(c==max(c(:)));

xmin = xpeak-size(template,2);
ymin = ypeak-size(template,1);

width = size(template,2);
height = size(template,1);
timeSpent = cputime -t;
end