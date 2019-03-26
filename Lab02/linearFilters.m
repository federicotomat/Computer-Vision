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
    inputImg = matrixFramer(inputImg, filterSize);
    
    switch method
        case 1 % Impulse kernel
            Kernel(center, center) = 1;

        case 2 % Shifted left kernel
            Kernel(center, end) = 1;
            
        case 3 % Sharpening filter
            % Kernel = [ 0 -10  0;
            %         -10  41 -10;
            %           0 -10  0];
                   
            Kernel(center, center) = 5;
            Kernel = Kernel - (ones(filterSize)/(filterSize^2));

        otherwise
            disp('ERROR: Insert method between 1 and 3')
            return
    end

    % 'same' -> Return the central part of the convolution, which is the same
    % size as the image
    imgFiltered = conv2 (inputImg, Kernel, 'same');
    imgFiltered = imgFiltered(floor(filterSize/2):(end-floor(filterSize/2)),floor(filterSize/2):(end-floor(filterSize/2)));
end

