%% Save as a gif the movement of the tracking object
%
%Take as inpunt the array of image that will be the frame of the gif, the 
%delay between frame in the guf, the path where the gif will be saved, the
%color of reconiction (possibly manual) the type of image in output 
%(rgb or logical), and a flag, for save or not the gif

function makeGif (arrayImg, delayTime, FileName, method,imgType, save)
    %Create and save the gif
    for i = 1:size(arrayImg,4)
        if strcmp('manual', method) == true
            if i == 1
                [sThresh, vThresh, hThresh] = manualThreshold(arrayImg(:,:,:,i));
            end
            [imgBoxed(:,:,:,i), vectorFrame(i)] = colorBoundingBox(arrayImg(:,:,:,i), method, 200, imgType, sThresh, vThresh, hThresh);
        else
            [imgBoxed(:,:,:,i), vectorFrame(i)] = colorBoundingBox(arrayImg(:,:,:,i), method, 200, imgType);
        end
        
        [gif, map] = rgb2ind(imgBoxed(:,:,:,i) ,256);
        if nargin == 6
            if strcmp('Save', save) == true
                if i == 1
                    imwrite(gif, map, FileName,'gif','LoopCount',Inf,'DelayTime',delayTime);
                else
                    imwrite(gif, map, FileName,'gif','WriteMode','append','DelayTime',delayTime);
                end
            else
                msg='Add Save parameter in order to save';
                error(msg);
            end
        end
    end

    %Show the gif
    cycleNumber = 100;
    imshow(frame2im(vectorFrame(1)))
    movie(vectorFrame, cycleNumber, 6);
    hold on
end
