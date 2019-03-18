%% Print All Channel
% This function rotates all channels input image of desired
% theta angle and return the rotated image.

function PrintRGB(Img, RGB, String)

    allBlack = zeros(size(RGB(:,:,1)));
    trasfImg1 = uint8(cat(3,  RGB(:,:,1),   allBlack,     allBlack));
    trasfImg2 = uint8(cat(3,  allBlack,     RGB(:,:,2),   allBlack));
    trasfImg3 = uint8(cat(3,  allBlack,     allBlack,     RGB(:,:,3)));
    
    pairOfImages = [Img,  trasfImg1 ;
                    trasfImg2, trasfImg3 ]; 
    
    figure, imshow(pairOfImages), title(String);
end 