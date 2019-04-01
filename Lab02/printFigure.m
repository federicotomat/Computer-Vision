%% Function to print the figure 
% i parametri sono indice della stampa, immagini da stampare e metodo con
% cui stamparle
% 1 imagesc, 2 istogramma, 3 imshow, 4 mesh
% volendo si pu� mettere un quarto parametro con le stringe del titolo da
% associare alla stampa ma mi fanno cagare e volendo possiamo mettere anche
% un altro parametro che indichi il numero di righe del subplot ma sono
% inutili e il quarto parametro � il nome dell'immagine, magari metto un
% controllo perch� non sovrasscriva i vecchi, per� sta diventando un
% troiaio sto progetto LOL
function printFigure(numberImg, numberRow, inputImg, method, title)
   for i = 1:numberImg
       switch method{i}
            case 1 % imagesc
                subplot(numberRow, numberImg/numberRow, i); imagesc(double(inputImg{i})); colormap gray; axis on;
           
            case 2 % istrogramma
                subplot(numberRow, numberImg/numberRow, i); imhist(uint8(inputImg{i}), 256); colormap gray; axis on;
                
            case 3 % imshow
                subplot(numberRow, numberImg/numberRow, i); imshow(uint8(inputImg{i})); colormap gray; axis on;
                
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
   %fname = 'C:\Users\Federico\Desktop\Images'; %indicare il proprio percorso
   %figname = ['fig_', title, '.jpg'];
   %saveas(fig, fullfile(fname, figname), 'jpeg')
   % close(fig)
end
