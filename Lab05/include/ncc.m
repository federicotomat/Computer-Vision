%% Normalized cross correltion
%
%Function performing cross correlation between a template anda target
%image.
%Input:
%-targetImage: image in Gray scale on wich detect pattern(template). 
%-tempalte: sub image in grayscle containing the pattern to search in
%target image.
%
%Output:
%-xmin, ymin: left-down corner of the reconized rectacular pattern in
%target image.
%-width, height: dimension of the detected rectacle in target image.
%-timeSpent: time used for the computation.


function [xmin, ymin, width, height, timeSpent]= ncc(targetImage, template)

%time at computation start
t = cputime;

%Cross correlation
c = normxcorr2(template,targetImage);
[ypeak, xpeak] = find(c==max(c(:)));

%left down corner
xmin = xpeak-size(template,2);
ymin = ypeak-size(template,1);

%dimension of the rectangle
width = size(template,2);
height = size(template,1);

%Difference of times
timeSpent = cputime -t;

end