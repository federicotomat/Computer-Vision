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
function printFigure(numberImg, img, method, nome)
   for i = 1:numberImg
       switch method{i}
            case 1 % imagesc
                subplot(2,2,i); imagesc(double(img{i})); colormap gray; axis on;
           
            case 2 % istrogramma
                subplot(2,2,i); imhist(uint8(img{i}), 256); colormap gray; axis on;
                
            case 3 % imshow
                subplot(2,2,i); imshow(uint8(img{i})); colormap gray; axis on;
                
            case 4 % mesh
                subplot(2,2,i);mesh(inputImg),colormap gray, axis on;
                
            otherwise
                disp('BRATTINA')
            return
       end
   end
   fig = figure;
   %fname = 'C:\Users\Federico\Desktop\Images'; %indicare il proprio percorso
   %figname = ['fig_',nome];
   %saveas(fig,fullfile(fname, figname),'png')
   %close(fig)
end
