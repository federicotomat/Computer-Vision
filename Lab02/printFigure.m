%% Function to print the figure 
% i parametri sono indice della stampa, immagini da stampare e metodo con
% cui stamparle
% 1 imagesc, 2 istogramma, 3 imshow
% volendo si può mettere un quarto parametro con le stringe del titolo da
% associare alla stampa ma mi fanno cagare e volendo possiamo mettere anche
% un altro parametro che indichi il numero di righe del subplot ma sono
% inutili
function printFigure(numberImg, img, method)
   for i=1:numberImg
       switch method{i}
           case 1 % imagesc
                subplot(1,numberImg,i); imagesc(double(img{i}); colormap gray; axis on;
           
            case 2 % istrogramma
                subplot(1,numberImg,i); imhist(uint8(img{i}, 256); colormap gray; axis on;
                
            case 3 % imshow
                subplot(1,numberImg,i); imshow(uint8(img{i}); colormap gray; axis on;
                
            otherwise
                disp('BRATTINA')
            return
       end
   end
end

