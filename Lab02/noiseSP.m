%% Salt & pepper noise
% Add salt & pepper noise with given noise density (noiseDen)

<<<<<<< HEAD
function imgSP = noiseSP(srcImg, noiseDen)
    [row,col] = size(srcImg);
    maxv = max(max(srcImg)); % research the maximum value of the matrix ??
    
    noiseMatrix = full(sprand(row, col, noiseDen)); 
    % R = sprand(m,n,density) 
    % is a random, m-by-n, sparse matrix with approximately density*m*n 
    % uniformly distributed nonzero entries (0 <= density <= 1).
    % la full me la converte a full storage, la sprand ritorna solo i
    % valori diversi da zero
    mask0 = noiseMatrix > 0 & noiseMatrix < 0.5; %boolean
    mask1 = noiseMatrix >= 0.5;
    
    imgSP = srcImg.*(~mask0); % ~mask0 is the negation of mask0
    imgSP = imgSP.*(~mask1) + maxv * mask1;
=======
function imgSP = noiseSP(inputImg, noiseDen)
[row,col] = size(inputImg);
maxv = max(max(inputImg)); % research the maximum value of the matrix ??

noiseMatrix = full(sprand(row, col, noiseDen));
% is a random, m-by-n, sparse matrix with approximately density*m*n
% uniformly distributed nonzero entries (0 <= density <= 1).
% la full me la converte a full storage, la sprand ritorna solo i
% valori diversi da zero
mask1 = noiseMatrix > 0 & noiseMatrix < 0.5; %boolean
mask2 = noiseMatrix >= 0.5;

imgSP = inputImg.*(~mask1); % ~mask0 is the negation of mask0
imgSP = imgSP.*(~mask2) + maxv * mask2;
>>>>>>> 66ac33d5f406e071f7290ab2e1e522f01bdf1033
end