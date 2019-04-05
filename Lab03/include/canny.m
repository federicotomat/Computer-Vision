%% Canny Algorithm for Edge Detection. 
% Steps/Algorithm Details : 
% 1. Convolution with Gaussian Filter Coefficient 
% 2. Convolution with Canny Filter for Horizontal and Vertical orientation 
% 3. Calculating directions using atan2 
% 4. Adjusting to nearest 0, 45, 90, and 135 degree 
% 5. Non-Maximum Suppression 
% 6. Hystheresis Thresholding

function imgCannyEdge = canny(imgInput, ThreshLow, ThreshHigh)
     
    % Gaussian Filter Coefficient
    B = [2,  4,  5,  4, 2; 
         4,  9, 12,  9, 4;
         5, 12, 15, 12, 5;
         4,  9, 12,  9, 4;
         2,  4,  5,  4, 2];
     
    B = 1/159.* B;
    
    % Convolution of image by Gaussian Coefficient
    A = conv2(imgInput, B, 'same');
    
    %Filter for horizontal and vertical direction, i define the sobel
    %operator 
    KGx = [-1, 0, 1;
           -2, 0, 2;
           -1, 0, 1];
       
    KGy = [1,  2,  1; 
           0,  0,  0; 
          -1, -2, -1];
      
    %Convolution by image by horizontal and vertical filter
    Filtered_X = conv2(A, KGx, 'same');
    Filtered_Y = conv2(A, KGy, 'same');
    
    % Calculate directions/orientations
    direction = atan2 (Filtered_Y, Filtered_X);
    direction = direction*180/pi;
    
    %Adjustment for negative directions, making all directions positive
    for i=1:size(A,1)
        for j=1:size(A,2)
            if (direction(i,j)<0) 
                direction(i,j)=360+direction(i,j);
            end
        end
    end
    direction2 = zeros(size(A,1), size(A,2));
     
    %Adjusting directions to nearest 0, 45, 90, or 135 degree, in sostanza
    %guardo N-S-W-O
    for i = 1  : size(A,1)
        for j = 1 : size(A,2)
            if ((direction(i, j) >= 0 ) && (direction(i, j) < 22.5) || (direction(i, j) >= 157.5) && (direction(i, j) < 202.5) || (direction(i, j) >= 337.5) && (direction(i, j) <= 360))
                direction2(i, j) = 0;
            elseif ((direction(i, j) >= 22.5) && (direction(i, j) < 67.5) || (direction(i, j) >= 202.5) && (direction(i, j) < 247.5))
                direction2(i, j) = 45;
            elseif ((direction(i, j) >= 67.5 && direction(i, j) < 112.5) || (direction(i, j) >= 247.5 && direction(i, j) < 292.5))
                direction2(i, j) = 90;
            elseif ((direction(i, j) >= 112.5 && direction(i, j) < 157.5) || (direction(i, j) >= 292.5 && direction(i, j) < 337.5))
                direction2(i, j) = 135;
            end
        end
    end
    
%     [row, col] = find( (0 <= direction & direction < 22.5) | (157.5 < direction & direction < 202.5) | (337.5 < direction & direction < 360));
%           direction2([row], [col]) = 0;
%     [row, col] = find((22.5 <= direction & direction < 67.5) | (202.5 < direction & direction < 247.5));
%           direction2([row], [col]) = 45;
%     [row, col] = find((67.5 <= direction & direction < 112.5) | (247.5 < direction & direction < 292.5));
%           direction2([row], [col]) = 90;
%     [row, col] = find((112.5 <= direction & direction < 157.5) | (292.5 < direction & direction< 337.5));
%           direction2([row], [col]) = 135;
  
    % figure, imagesc(direction2); colorbar;
    
    %Calculate magnitude
    magnitude = (Filtered_X.^2) + (Filtered_Y.^2);
    magnitude2 = sqrt(magnitude);
    bw = zeros (size(A,1), size(A,2));
    
    %Non-Maximum Supression
    for i=2:size(A,1)-1
        for j=2:size(A,2)-1
            if (direction2(i,j)==0)
                bw(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i,j+1), magnitude2(i,j-1)]));
            elseif (direction2(i,j)==45)
                bw(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j-1), magnitude2(i-1,j+1)]));
            elseif (direction2(i,j)==90)
                bw(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j), magnitude2(i-1,j)]));
            elseif (direction2(i,j)==135)
                bw(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j+1), magnitude2(i-1,j-1)]));
            end
        end
    end
    bw = bw.*magnitude2;
    % figure, imshow(bw);
    
    %Hysteresis Thresholding
    ThreshLow = ThreshLow * max(max(bw));
    ThreshHigh = ThreshHigh * max(max(bw));
    T_res = zeros (size(A,1), size(A,2));
    for i = 1  : size(A,1)
        for j = 1 : size(A,2)
            if (bw(i, j) < ThreshLow)
                T_res(i, j) = 0;
            elseif (bw(i, j) > ThreshHigh)
                T_res(i, j) = 1;
            %Using 8-connected components
            elseif ( bw(i+1,j)>ThreshHigh || bw(i-1,j)>ThreshHigh || bw(i,j+1)>ThreshHigh || bw(i,j-1)>ThreshHigh || bw(i-1, j-1)>ThreshHigh || bw(i-1, j+1)>ThreshHigh || bw(i+1, j+1)>ThreshHigh || bw(i+1, j-1)>ThreshHigh)
                T_res(i,j) = 1;
            end
        end
    end
    imgCannyEdge = uint8(T_res.*255);
end