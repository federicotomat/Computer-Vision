%% Function to print the figure 

function printFigure(numberImg, numberRow, inputImg, method, title)
figure()
   for i = 1:numberImg
       switch method{i}
            case 1 % imagesc
                subplot(numberRow, numberImg/numberRow, i); imagesc(double(inputImg{i})); colormap gray; axis on;
           
            case 2 % istrogramma
                subplot(numberRow, numberImg/numberRow, i); imhist(uint8(inputImg{i}), 256); colormap gray; axis on;
                
            case 3 % imshow
                subplot(numberRow, numberImg/numberRow, i); imshow(inputImg{i}); colormap gray; axis on;
                
            case 4 % mesh
                subplot(numberRow, numberImg/numberRow, i); mesh(inputImg{i}); colormap gray; axis on;
                
            case 5 % surf
                subplot(numberRow, numberImg/numberRow, i); surf(inputImg{i}); axis on;
                
            otherwise
                disp('Error!')
            return
       end
   end
   %fig = figure;
   %fname = /where/you/want/to/save
   %figname = ['fig_', title, '.jpg'];
   %saveas(fig, fullfile(fname, figname), 'jpeg')
   % close(fig)
end
