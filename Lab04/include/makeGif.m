%Brattina

function makeGif (arrayImg, delayTime, FileName)
    imgType = 0;
    method = 'red';
    for i = 1:6
        imgBoxed(:,:,:,i) = colorBoundingBox(arrayImg(:,:,:,i), 'red', 200, imgType);
        [gif, map] = rgb2ind(imgBoxed(:,:,:,i) ,256);
        if i == 1
            imwrite(gif, map, FileName,'gif','LoopCount',Inf,'DelayTime',delayTime);
        else
            imwrite(gif, map, FileName,'gif','WriteMode','append','DelayTime',delayTime);
        end
    end
end