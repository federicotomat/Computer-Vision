%% Template matching
% Calculates the coordinates (pixels) of the template and return the
% coordinates of the corner in the bottom-left of the box and the
% coordinates of the maximum

function [xCorner, yCorner, colMax, rowMax] = templateMatching(imgGray, carMatrix, method)

[rowCar , colCar] = size(carMatrix); % Size of the template

switch method

    case 1
        T1 = carMatrix-mean2(carMatrix);% Subtract off the mean values of the template

        TM1 = filter2(T1,imgGray,'same');% Two-dimensional correlation
        figure,imagesc(TM1),colormap gray, title('Filtered image')
        
        [maximum, rowMax] = max(TM1); % Vector with every column maximum
        [~ , colMax]= max(maximum); % Column of the maximum
        rowMax = rowMax(colMax); % Row of the maximum
        
        % Calculate the position of the corner in the bottom-left of the box
        xCorner = colMax - colCar/2;
        yCorner = rowMax - rowCar/2;
    
    case 2
        t = cputime;
        
        C = normxcorr2(carMatrix, imgGray);% Normalized 2-D cross-correlation
        figure,imagesc(C),colormap gray
        title('Normalized 2-D cross-correlation image')

        [maximum, rowMax] = max(C);  % Vector with every column maximum
        [~ , colMax]= max(maximum); % Column of the maximum
        rowMax = rowMax(colMax); % Row of the maximum

        % Calculate the position of the corner in the bottom-left of the box
        xCorner = colMax - colCar;
        yCorner = rowMax - rowCar;
        
        % Position of the maximum
        colMax = colMax - colCar/2;
        rowMax = rowMax - rowCar/2;
        
        e = cputime - t; % Calculates computational time for the method
        disp(['Computational time for a ' num2str(colCar-1) 'x' num2str(rowCar-1) ' template is ' num2str(e) ' s']);

    otherwise
        disp('ERROR: Insert method 1 or 2')
        return
end