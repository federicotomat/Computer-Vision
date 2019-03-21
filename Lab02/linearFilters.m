%% Linear filters
% 
% Various linear filter trasformation
% Method:
% 1 : Impulse kernel
% 2 : Shifted left kernel
% 3 : Sharpening filter

function [imgFiltered, method] = linearFilters(filterSize, img, method)
switch method
    case 1 % Impulse kernel
        center = floor(filterSize/2);
        Kernel = zeros(filterSize);       
        Kernel(center, center) = 1;
        
    case 2 % Shifted left kernel
        center = floor(filterSize/2);
        Kernel = zeros(filterSize);       
        Kernel(center, 1) = 1;

    case 3 % Sharpening filter
        center = floor(filterSize/2);
        Kernel = zeros(filterSize);       
        Kernel(center, center) = 2;
        Kernel = Kernel - (ones(filterSize)/(filterSize^2));
       
    otherwise
        disp('ERROR: Insert method between 1 and 3')
        return
        
% 'same' -> Return the central part of the convolution, which is the same
% size as the image
end
imgFiltered = conv2 (img, Kernel, 'same');
