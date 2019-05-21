%% Function to print the figure 
% Se si desidera anche salvare l'immagine, aggiungere come parametro alla
% funzione il titolo e scommentare le ultime righe, ho aggiunto una flag
% per dire alla stampa se fare o meno il full screen, flag = 1 sta per
% true, altri casi è false

function printFigure(numberImg, numberRow, inputImg, method, subplotTitle, flag)
   if flag == 1
       figure('units','normalized','outerposition',[0 0 1 1]),
   else 
   end

   for i = 1:numberImg
       switch method{i}
            case 1 % imagesc
                subplot(numberRow, numberImg/numberRow, i); imagesc(double(inputImg{i})); colormap gray; title(subplotTitle{i}); axis on;
           
            case 2 % istrogramma
                subplot(numberRow, numberImg/numberRow, i); imhist(uint8(inputImg{i}), 256); colormap gray; title(subplotTitle{i}); axis on;
                
            case 3 % imshow
                subplot(numberRow, numberImg/numberRow, i); imshow(inputImg{i}); colormap gray; title(subplotTitle{i}); axis on;
                
            case 4 % mesh
                subplot(numberRow, numberImg/numberRow, i); mesh(inputImg{i}); colormap gray; title(subplotTitle{i}); axis on;
                
            case 5 % surf
                subplot(numberRow, numberImg/numberRow, i); surf(inputImg{i}); title(subplotTitle{i}); axis on;
                
            otherwise
                disp('Error!')
            return
       end
   end
   
   %fig = figure;
   %fname = /where/you/want/to/save
   %figname = ['fig_', saveTitle, '.jpg'];
   %saveas(fig, fullfile(fname, figname), 'jpeg')
   % close(fig)
end
