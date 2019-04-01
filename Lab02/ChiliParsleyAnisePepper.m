%% Hot chili Pepppaaahhh
function transfImg = ChiliParsleyAnisePepper(srcImg, noiseDen)

    for i=1:size(srcImg,3)
        [row,col] = size(srcImg(:,:,i));
         maxv = max(max(srcImg(:,:,i)));
         noiseMatrix = full(sprand(row, col, noiseDen(i))); 
      
         mask0 = noiseMatrix > 0 & noiseMatrix < 0.5; 
         mask1 = noiseMatrix >= 0.5;
            
         srcImg(:,:,i) = srcImg(:,:,i).*(~mask0);
         srcImg(:,:,i) = srcImg(:,:,i).*(~mask1) + maxv * mask1;
    end
    
    allBlack = zeros(size(srcImg(:,:,1)));
    
    transfImg = uint8(cat(3,  srcImg(:,:,1),   srcImg(:,:,2),   srcImg(:,:,3)));
end
