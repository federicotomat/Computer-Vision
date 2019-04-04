%% Sobel Gradient edge detector
% Sobel Operator, is an approximation to derivative of an image. It is separate in the y and x directions. 
% If we look at the x-direction, the gradient of an image in the x-direction is equal to this operator here. 
% We use a kernel n x n matrix, one for each x and y direction. 
% The gradient for x-direction has minus numbers on the left hand side and 
% positive numbers on the right hand side and we are preserving a little bit of the center pixels. 
% Similarly, the gradient for y-direction has minus numbers on the bottom and positive numbers on top 
% and here we are preserving a little bit on the middle row pixels.
% Essentially what we are trying to do here with the Sobel Operator is trying to find out the amount of the difference 
% by placing the gradient matrix over each pixel of our image. 
% We get two images as output, one for X- Direction and other for Y-Direction.

% https://medium.com/datadriveninvestor/understanding-edge-detection-sobel-operator-2aada303b900

function [imgSobelEdge, sobelGradient] = sobel(imgInput)

    sobelGradient = rgb2gray(imgInput);
    imgInput = double(sobelGradient);
    for i = 1:size(imgInput,1)-2
        for j = 1:size(imgInput,2)-2
            %Sobel mask for x-direction:
            Gx=((2*imgInput(i+2, j+1)+imgInput(i+2, j)+imgInput(i+2, j+2))- (2*imgInput(i, j+1)+imgInput(i+j)+imgInput(i, j+2)));
            
            %Sobel mask for y-direction:
            Gy=((2*imgInput(i+1, j+2)+imgInput(i, j+2)+imgInput(i+2, j+2))- (2*imgInput(i+1, j)+imgInput(i, j)+imgInput(i+2, j)));

            %The gradient of the image
            sobelGradient(i, j) = sqrt(Gx.^2+Gy.^2);
        end
    end
   
    % Threshold value
    thresh = 100;
    imgSobelEdge = max(sobelGradient, thresh);
    imgSobelEdge(imgSobelEdge == round(thresh)) = 0;
    imgSobelEdge = uint8(imgSobelEdge);
end

