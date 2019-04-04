%% Sobel Gradient edge detector

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
   
    % threshold value
    thresh = 100;
    imgSobelEdge = max(sobelGradient, thresh);
    imgSobelEdge(imgSobelEdge==round(thresh)) = 0;
    imgSobelEdge = uint8(imgSobelEdge);
end

