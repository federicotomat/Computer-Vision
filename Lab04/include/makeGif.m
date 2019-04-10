%Save as a gif the movement of the tracking object

function makeGif (arrayImg, delayTime, FileName, method,imgType)
%Create and save the gve==if
for i = 1:size(arrayImg,4)
    if i == 1
        [highTresh, lowTresh] = manualTrehsold(arrayImg(:,:,:,i));
    end
    [imgBoxed(:,:,:,i), F(i)] = colorBoundingBox(arrayImg(:,:,:,i), method, 200, imgType,highTresh, lowTresh);
    [gif, map] = rgb2ind(imgBoxed(:,:,:,i) ,256);
    if i == 1
        imwrite(gif, map, FileName,'gif','LoopCount',Inf,'DelayTime',delayTime);
    else
        imwrite(gif, map, FileName,'gif','WriteMode','append','DelayTime',delayTime);
    end
    
end
%Show the gif
n=100;
imshow(frame2im(F(1)))
movie(F,n,6);
hold on

end
