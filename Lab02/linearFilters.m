%% Linear filters
% 
% Various linear filter trasformation
% Method:
% 1 : Impulse kernel
% 2 : Shifted left kernel
% 3 : Sharpening filter --> per la nitidezza, necessario prima togliere
% rumore

function [imgFiltered, method] = linearFilters(filterSize, inputImg, method)

    center = ceil(filterSize/2);
    Kernel = zeros(filterSize);
    
    switch method
        case 1 % Impulse kernel
            Kernel(center, center) = 1;
            imgFiltered = conv2 (inputImg, Kernel, 'same');
            
        case 2 % Shifted left kernel
            Kernel(center, end) = 1;
             imgFiltered = conv2 (inputImg, Kernel, 'same');
             
        case 3 % Sharpening filter
            Kernel(center, center) = 1;
            Kernel = Kernel - (ones(filterSize)/(filterSize^2));
            imgFiltered=inputImg+(inputImg-conv2(inputImg, Kernel,'same'));
            
        otherwise
            disp('ERROR: Insert method between 1 and 3')
            return
    end
end

